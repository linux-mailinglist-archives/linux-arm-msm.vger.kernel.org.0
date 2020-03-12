Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 796A2182FE7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 13:09:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbgCLMJR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Mar 2020 08:09:17 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:50416 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726044AbgCLMJR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Mar 2020 08:09:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584014956; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=kBPdGkgSl4rGw5eqrDxTR0JuJuA9vZdgSVV0cmlBAA8=; b=NaJYfFTcfH79ZGGzCcHztiJnfxLsKMyaUqG3Ogjm6GD5c+EEWp8uB6Axy+xvI+IH9fubB7Te
 ZnVUCtfczi5ELRmqLQaBrI45oKyKtimpLnNfFDLn/WXMTyVyfRzDV5JNz5kzJws59ceWpa/v
 o78SE4JlEOiT1RNTPYOTLI7zZL8=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6a2659.7f0a117054c8-smtp-out-n04;
 Thu, 12 Mar 2020 12:08:57 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B4593C432C2; Thu, 12 Mar 2020 12:08:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7E14CC433CB;
        Thu, 12 Mar 2020 12:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7E14CC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, srinivas.kandagatla@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        tsoni@codeaurora.org, vnkgutta@codeaurora.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v7 0/3] Introduce Protection Domain Restart (PDR) Helpers
Date:   Thu, 12 Mar 2020 17:38:39 +0530
Message-Id: <20200312120842.21991-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.25.0
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

Userspace Links:
pd-mapper: https://github.com/andersson/pd-mapper/tree/json
diag-router: https://github.com/andersson/diag

Testing PDR with APR on SDM845 SoCs:
pd-mapper adspua.jsn &
diag-router &
send_data 75 37 03 144 00

V7:
 * Address Bjorn's comments on exiting early in pdr_locator_work 
 * SERVREG_LOCATOR_UNKNOWN_SERVICE is no longer propagated to
   clients allowing for lookups to recover on restarting pd-mapper
   with the proper database.
 * Non-recoverable SERVREG_LOCATOR_ERR errors are still communicated
   to the clients.

V6:
 * Fix minor compilation error introduced in V5
 * Pick up Rob's R-b

V5:
 * Pick up Bjorn's R-b
 * Service all pending lookup, notifier_register and
   notifier_remove requests.
 * Propagate error from pdr_register_listener
 * Remove notifier_init_complete flag workaround with
   the introduction of in-kernel ns.
 * Remove depends-on in Kconfig and add module license.

V4:
 * Drop handling db_rev_count error handling since it remains
   unused in upstream/downstream pd-mapper
 * Fixup dt bindings and examples. [Rob]
 * Dropping r-b from Bjorn/Srini for the dt bindings.
 * Privatize pdr_service/pdr_handle. [Srini/Bjorn]
 * Introduce notifier_init_complete to deal with cases where
   qmi_handle_net_reset is not enough to reset the port. This
   is to deal with cases where qrtr-ns starts after the adsp.
 * Introduce per addr per pds to deal with multiple service_paths
   per pdr_handle.
 * Uniformly rename servreg -> notifier, servloc -> locator. [Narendra]
 * Drop pdr_servreg_link_create tracking the service_path tracks
   all pds associated with it. [Bjorn]
 * Remove safe traversal for all cases where list is left
   unmodified. [Bjorn]
 * Address review comments in the apr driver and add comments. [Bjorn]
 * Other misc fixes. [Narendra/Bjorn]

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

Sibi Sankar (3):
  soc: qcom: Introduce Protection Domain Restart helpers
  dt-bindings: soc: qcom: apr: Add protection domain bindings
  soc: qcom: apr: Add avs/audio tracking functionality

 .../devicetree/bindings/soc/qcom/qcom,apr.txt |  50 ++
 drivers/soc/qcom/Kconfig                      |   5 +
 drivers/soc/qcom/Makefile                     |   1 +
 drivers/soc/qcom/apr.c                        | 123 ++-
 drivers/soc/qcom/pdr_interface.c              | 757 ++++++++++++++++++
 drivers/soc/qcom/pdr_internal.h               | 379 +++++++++
 include/linux/soc/qcom/apr.h                  |   1 +
 include/linux/soc/qcom/pdr.h                  |  29 +
 include/linux/soc/qcom/qmi.h                  |   1 +
 9 files changed, 1337 insertions(+), 9 deletions(-)
 create mode 100644 drivers/soc/qcom/pdr_interface.c
 create mode 100644 drivers/soc/qcom/pdr_internal.h
 create mode 100644 include/linux/soc/qcom/pdr.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
