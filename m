Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68DB2403FD7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Sep 2021 21:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235623AbhIHTfx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Sep 2021 15:35:53 -0400
Received: from ixit.cz ([94.230.151.217]:48720 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235043AbhIHTfx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Sep 2021 15:35:53 -0400
Received: from newone.lan (ixit.cz [94.230.151.217])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 4A12024A25;
        Wed,  8 Sep 2021 21:34:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1631129682;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=qfKwqdN8/i0EQu0234+MgD/TXBnxpkNPG+kG+/L9/Fs=;
        b=u6KJ5Xtey4caQ9eIorPd0Jg2bQcPyPYd6IaAHQUm4poeAkTL2SRWbpETaGH+UUkjhEN3qI
        eVnDojk+E6F6L1iiN6y5nkTzyrBSmUnIkbQwYcRqJ7Dy4rQ5HCgG/nMMvLgVSZatFR8Cbd
        EcnMK+i7RSSADlJhsPANpUDxVw55dbg=
From:   David Heidelberg <david@ixit.cz>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>
Cc:     linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>
Subject: [PATCH 1/2] dt-bindings: usb/qcom,dwc3: add ipq4019 compatible
Date:   Wed,  8 Sep 2021 21:33:28 +0200
Message-Id: <20210908193329.87992-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Prequisite for getting rid of another warnings when building ipq4019.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index e70afc40edb2..19641380f922 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,ipq4019-dwc3
           - qcom,msm8996-dwc3
           - qcom,msm8998-dwc3
           - qcom,sc7180-dwc3
-- 
2.33.0

