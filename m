Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4F9284557
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2019 09:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727281AbfHGHKR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Aug 2019 03:10:17 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:47454 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727187AbfHGHKQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Aug 2019 03:10:16 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 189DD61157; Wed,  7 Aug 2019 07:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565161816;
        bh=cVr/JDEa62vJGvnAPnwSuap9YiSLs6c861q04J+NSeU=;
        h=From:To:Cc:Subject:Date:From;
        b=aCEl/UwaeLjYhzoDKbsIhTibuiF0etV/+H++1q3vI7U4v6b1oOAI0mOXUuqk7sAu8
         l5awCdlYRYc/7OrN3jylYYiJ3K3/KLsgezQQoj+qGzVO+JXjEkycZE3TAS7ns7JKpG
         rlf2S4GIJH1ORQT+e4X2wvKHcDE2Z55groHVdMWA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D614960FE9;
        Wed,  7 Aug 2019 07:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565161814;
        bh=cVr/JDEa62vJGvnAPnwSuap9YiSLs6c861q04J+NSeU=;
        h=From:To:Cc:Subject:Date:From;
        b=gM2gfVcHN6IsHgcAk52gZBoFnep+SUESygzdwgLzzlAnh6aLL/TlJ/2RFQS0mMFuK
         ze8p4fZn8TWVDxadnVNc55uxMZUJeJrcV9r1NtjCM8sWgaEeNHwJo7kjJhC2vIDDH2
         HJVVvAaE0kK9yQ8CdTIyIp5L/NWRqOIU/gaso/wQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D614960FE9
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, vkoul@kernel.org,
        aneela@codeaurora.org
Cc:     mark.rutland@arm.com, agross@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        clew@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 0/7] Add support for Qualcomm SM8150 and SC7180 SoCs
Date:   Wed,  7 Aug 2019 12:39:50 +0530
Message-Id: <20190807070957.30655-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds SCM, APSS shared mailbox and QMP AOSS PD/clock
support on SM8150 and SC7180 SoCs.

v2:
 * re-arrange the compatible lists in sort order

Sibi Sankar (7):
  soc: qcom: smem: Update max processor count
  dt-bindings: firmware: scm: re-order compatible list
  dt-bindings: firmware: scm: Add SM8150 and SC7180 support
  dt-bindings: mailbox: Add APSS shared for SM8150 and SC7180 SoCs
  mailbox: qcom: Add support for Qualcomm SM8150 and SC7180 SoCs
  dt-bindings: soc: qcom: aoss: Add SM8150 and SC7180 support
  soc: qcom: aoss: Add AOSS QMP support

 Documentation/devicetree/bindings/firmware/qcom,scm.txt      | 4 +++-
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt    | 2 ++
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt | 5 ++++-
 drivers/mailbox/qcom-apcs-ipc-mailbox.c                      | 2 ++
 drivers/soc/qcom/qcom_aoss.c                                 | 2 ++
 drivers/soc/qcom/smem.c                                      | 2 +-
 6 files changed, 14 insertions(+), 3 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

