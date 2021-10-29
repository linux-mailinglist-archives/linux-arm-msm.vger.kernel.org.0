Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17EB643FACA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 12:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231800AbhJ2KgR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 06:36:17 -0400
Received: from ixit.cz ([94.230.151.217]:48576 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231710AbhJ2KgR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 06:36:17 -0400
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id D896620064;
        Fri, 29 Oct 2021 12:33:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1635503626;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=BdHSQFi5q/KekCvAB106Go4UT8260Hp3SYgJRwszya0=;
        b=2kZBFAfJr3DvTTXb0NLXzIecb5GX67f5OXC9vHOjFkFWRGDAHJw2egN7A+yvCx0wvgReTN
        SQKkTsfDtF9Lb8/Q8NUdJT06lvAGBOpruaABVSshDzpqbGCbf3XWFPa7q+FgHg0p4GRL73
        Ffh6uj54r4PC0FXQDwfnOqwjX8j+KUw=
From:   David Heidelberg <david@ixit.cz>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>
Cc:     ~okias/devicetree@lists.sr.ht, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: usb: qcom,dwc3: add binding for IPQ4019 and IPQ8064
Date:   Fri, 29 Oct 2021 12:33:38 +0200
Message-Id: <20211029103340.26828-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible string for Qualcomm IPQ4019 and IPQ8064 SoC.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 2bdaba023c01..55a4637ff185 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -13,7 +13,9 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,ipq4019-dwc3
           - qcom,ipq6018-dwc3
+          - qcom,ipq8064-dwc3
           - qcom,msm8996-dwc3
           - qcom,msm8998-dwc3
           - qcom,sc7180-dwc3
-- 
2.33.0

