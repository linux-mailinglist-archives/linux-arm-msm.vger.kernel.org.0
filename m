Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3988F19848F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2020 21:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728708AbgC3ThJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Mar 2020 15:37:09 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:52391 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728232AbgC3ThJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Mar 2020 15:37:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585597029; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=5bL1rD6752n4bdZfwaN40CANhZG9U7fmvdfSvXpFEg0=; b=qS1rK+lIeGNsbt1oRpLgsoIl27WK+DV9B+V/+ORJn9LQKBR+uM/3uQoSRWubB/Ed5Jj1+Ics
 isfTmVdxTyCzJzA4gsxYl2cuKITkuRpmOUiaptBW56lnqLmBsbmHl9ILL+Jq4/PWTqT2sMy+
 KvnyBLv6xupPVlfAMXBjbYmaSyE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e824a63.7f7fc336a500-smtp-out-n05;
 Mon, 30 Mar 2020 19:37:07 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 74CC9C44792; Mon, 30 Mar 2020 19:37:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6D8D2C433BA;
        Mon, 30 Mar 2020 19:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6D8D2C433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        robh+dt@kernel.org, mark.rutland@arm.com, p.zabel@pengutronix.de
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v4 0/4] Add SS/HS-USB changes for Qualcomm SM8150 chipset
Date:   Mon, 30 Mar 2020 12:36:53 -0700
Message-Id: <1585597017-30683-1-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds support for the Synopsis 7nm HSPHY USB driver being
used in QCOM chipsets.  The HSPHY register map differs compared to 
other PHY revisions.  In addition, modifications and updates are done
to the QMP driver to add new registers/offsets, and to update the
initialization sequence for enabling the SSUSB path on SM8150.

Changes in v4:
 - Fix POWERDOWN offset for QMP PHY exit routine, and check for
   has_phy_dp_com_ctrl instead of !has_phy_com_ctrl

Changes in v3:
 - Use devm_reset_control_get_exclusive instead of referencing index for
   reset handle

Changes in v2:
 - Fixed YAML errors caught by dt_binding_check

*** BLURB HERE ***

Jack Pham (1):
  phy: qcom-qmp: Add SM8150 QMP USB3 PHY support

Wesley Cheng (3):
  dt-bindings: phy: Add binding for qcom,usb-hs-7nm
  phy: qcom-snps: Add SNPS USB PHY driver for QCOM based SOCs
  phy: qcom-qmp: Use proper PWRDOWN offset for sm8150 USB

 .../devicetree/bindings/phy/qcom,usb-hs-7nm.yaml   |  76 ++++++
 drivers/phy/qualcomm/Kconfig                       |  10 +
 drivers/phy/qualcomm/Makefile                      |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp.c                | 168 +++++++++++-
 drivers/phy/qualcomm/phy-qcom-qmp.h                | 198 +++++++++++++-
 drivers/phy/qualcomm/phy-qcom-snps-7nm.c           | 294 +++++++++++++++++++++
 6 files changed, 742 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-hs-7nm.yaml
 create mode 100644 drivers/phy/qualcomm/phy-qcom-snps-7nm.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
