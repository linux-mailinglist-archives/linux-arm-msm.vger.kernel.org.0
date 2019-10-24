Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3F83E332C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2019 14:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502216AbfJXMzw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Oct 2019 08:55:52 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:8043 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730413AbfJXMzw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Oct 2019 08:55:52 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 24 Oct 2019 18:19:41 +0530
IronPort-SDR: tpI/Cblpl7aMfDEkeqpjOqB9pXTFd3pi51h/wxyFT4WYjBDVRUfgqiN3hhhb000PSvlXW2hrfY
 Buiht9obEoz5yccv4rhxQqGJ45Lv42G/cCH5zchIIG1ptAr/fu/nxNtQ9w1viTOeBHeuMZ/gyC
 qMpwKoJegvbu+nhJtUzvaAS2M3iMAwIWzK4OzrsVnQ52zYaCkOfs60uHZdRHOPbRgdqHEDKviq
 GqfCqqP0bRIyDFNusRT04nczEWC8U2xlhR0bHfsU8kV18KUIPv0YSRnudoRiIyDrEZIL1u+SIV
 nispmSru0p414/PkNMAU1UCN
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 24 Oct 2019 18:19:28 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 7D8F91945; Thu, 24 Oct 2019 18:19:27 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     agross@kernel.org, balbi@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, mgautam@codeaurora.org,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH 2/2] dt-bindings: usb: qcom,dwc3: Add compatible for SC7180
Date:   Thu, 24 Oct 2019 18:18:48 +0530
Message-Id: <1571921328-13898-3-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571921328-13898-1-git-send-email-sanm@codeaurora.org>
References: <1571921328-13898-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible for SC7180 SOC in device tree bindings

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt b/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
index cb695aa..c27c58d 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
@@ -6,6 +6,7 @@ Required properties:
 			"qcom,msm8996-dwc3" for msm8996 SOC.
 			"qcom,msm8998-dwc3" for msm8998 SOC.
 			"qcom,sdm845-dwc3" for sdm845 SOC.
+			"qcom,sc7180-dwc3" for sc7180 SOC.
 - reg:			Offset and length of register set for QSCRATCH wrapper
 - power-domains:	specifies a phandle to PM domain provider node
 - clocks:		A list of phandle + clock-specifier pairs for the
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

