Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A0EC233E87
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jul 2020 06:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730644AbgGaE5X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jul 2020 00:57:23 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:58620 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730163AbgGaE5W (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jul 2020 00:57:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596171442; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=jcFirJ/dUhDWyz1vByGCswLs5dDzUqVUvnRcpcUgCac=; b=fZGxoK9BOrkU4NJufoG0uM/5136tYk4rxrgXhx0TDYDu9xFCfoMX/LrzcglS55Hyxuo3xdwL
 2/w1eKmqInTOLjQutjm1r54AcAhiEW6zREYjER6BbkMpa7BaxVd908V6NuSzoA7ESS1UsuGh
 YBj8Tw5gGobHMI99skMcKjQBjNo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f23a4ad9403087e1060546d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 31 Jul 2020 04:57:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B3891C43395; Fri, 31 Jul 2020 04:57:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A93F2C433C9;
        Fri, 31 Jul 2020 04:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A93F2C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     bjorn.andersson@linaro.org, kishon@ti.com, vkoul@kernel.org,
        agross@kernel.org, balbi@kernel.org, gregkh@linuxfoundation.org,
        robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH 0/3] Enable USB type C support on SM8150
Date:   Thu, 30 Jul 2020 21:57:09 -0700
Message-Id: <20200731045712.28495-1-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds support for setting of the orientation multiplexor within the
QMP PHY based on the detection output from the PM8150B.  It will also introduce
a role switch in DWC3 QCOM, which is used so that the DWC3 QCOM glue can receive
role switch change events, and set the vbus override accordingly.  This event
will then be propagated down to the DWC3 core driver, by the DWC3 QCOM getting a
handle to the DWC3 core's role switch.

Wesley Cheng (3):
  arm64: boot: dts: qcom: sm8150: Add nodes for PMIC based typec
    detection
  phy: qcom-qmp: Register as a typec switch for orientation detection
  usb: dwc3: dwc3-qcom: Find USB connector and register role switch

 arch/arm64/boot/dts/qcom/sm8150-mtp.dts |  37 ++++++++-
 drivers/phy/qualcomm/Kconfig            |  11 +++
 drivers/phy/qualcomm/phy-qcom-qmp.c     |  71 +++++++++++++++-
 drivers/usb/dwc3/dwc3-qcom.c            | 103 +++++++++++++++++++++++-
 4 files changed, 216 insertions(+), 6 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

