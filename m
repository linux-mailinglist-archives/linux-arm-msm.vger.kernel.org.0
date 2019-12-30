Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 657F712CC6F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2019 06:00:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727169AbfL3FAn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Dec 2019 00:00:43 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:19022 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727126AbfL3FAk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Dec 2019 00:00:40 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577682040; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=NW92puXAkgQ9HjP3tiVheK7NWnsGpPSlSTDUpm/toq0=; b=QJMp7SAqhYV5v1c7Yx6P88QGtZI4uq/aYzC+EigEMF+4143MwHXOmvU2U0uKo7x11eLvVvA1
 Ul9WhfNiLQj/Xx+gjtVtTh50bVmqgU1OhmmKPMFR83o3yUY3BUBvOjgaYTV72nb5RKzarL5/
 W0janfDu08DwCXf9a7Q1yZZtISQ=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e098469.7f7754ac5d50-smtp-out-n01;
 Mon, 30 Dec 2019 05:00:25 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 60B83C447AA; Mon, 30 Dec 2019 05:00:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6D6A5C447A0;
        Mon, 30 Dec 2019 05:00:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6D6A5C447A0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, srinivas.kandagatla@linaro.org,
        robh+dt@kernel.org, tsoni@codeaurora.org
Cc:     agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3 0/3] Introduce Protection Domain Restart (PDR) Helpers
Date:   Mon, 30 Dec 2019 10:30:05 +0530
Message-Id: <20191230050008.8143-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm SoCs (starting with MSM8998) allow for multiple protection
domains (PDs) to run on the same Q6 sub-system. This allows for
services like AVS AUDIO to have their own separate address space and
crash/recover without disrupting the other PDs running on the same Q6
ADSP. This patch series introduces pdr helper library and adds PD
tracking functionality for "avs/audio" allowing apr services to register
themselves asynchronously once the dependent PDs are up.

V3:
 * patches 2 and 3 remain unchanged.
 * reset servloc_addr/servreg_addr.
 * fixup the helpers to handle servloc_work/servreg_work asynchronously.
 * fixup useage of list_lock across traversals, insertions and deletions.
 * fixup the helpers to use a single lookup list.
 * skip waiting for response on ind_ack send.
 * introduce pdr_servreg_link_create to re-use existing qmi connection to
   servreg instances. This helps tracking PDs running on the same remote
   processor.
 * have a per node curr_state in pdr_list_node to preserve all state
   updates during indack_cb.
 * introduce additional servreg_service_state values to help the client
   distinguish between a fatal and non-fatal pdr_lookup errors.
 * re-order pdr_handle_release sequence.
 * fixup "!ind_msg->service_path returns true always" warning.
 * fixup comments.

V2:
 * fixup pd_status callback to return void.
 * return 0 from pdr_get_domain_list on success.
 * introduce status_lock to linearize the pd_status reported back
   to the clients.
 * use the correct service name length across various string operations
   performed.
 * service locator will now schedule the pending lookups registered
   when it comes up.
 * other minor cleanups that Bjorn suggested.
 * use pr_warn to indicate that the wait for service locator timed
   out.
 * add Bjorn/Srini's "Reviewed-by" for the dt-bindings.

To Do:
 * Add support for pd tracking in fastrpc driver.

Sibi Sankar (3):
  soc: qcom: Introduce Protection Domain Restart helpers
  dt-bindings: soc: qcom: apr: Add protection domain bindings
  soc: qcom: apr: Add avs/audio tracking functionality

 .../devicetree/bindings/soc/qcom/qcom,apr.txt |  59 ++
 drivers/soc/qcom/Kconfig                      |   6 +
 drivers/soc/qcom/Makefile                     |   1 +
 drivers/soc/qcom/apr.c                        | 100 ++-
 drivers/soc/qcom/pdr_interface.c              | 709 ++++++++++++++++++
 drivers/soc/qcom/pdr_internal.h               | 375 +++++++++
 include/linux/soc/qcom/apr.h                  |   1 +
 include/linux/soc/qcom/pdr.h                  | 109 +++
 include/linux/soc/qcom/qmi.h                  |   1 +
 9 files changed, 1350 insertions(+), 11 deletions(-)
 create mode 100644 drivers/soc/qcom/pdr_interface.c
 create mode 100644 drivers/soc/qcom/pdr_internal.h
 create mode 100644 include/linux/soc/qcom/pdr.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
