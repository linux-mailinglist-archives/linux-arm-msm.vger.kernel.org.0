Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFEA04255C7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 16:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242163AbhJGOvs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 10:51:48 -0400
Received: from ixit.cz ([94.230.151.217]:48228 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233341AbhJGOvs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 10:51:48 -0400
Received: from localhost.localdomain (unknown [213.151.89.154])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id DF14523B26;
        Thu,  7 Oct 2021 16:49:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1633618192;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=4+s+ckaKK3e0lAdCvDPmracP4SEOlI/JwMpG0UhzCUs=;
        b=Gq3gkGyigJckcihnK1k+J1Zo/GxFhplwhZ9zz4aGAZUt+py+VPb0Qnlt9CEQ5mC9DtXTC4
        jgdNZK9m6fD0NzimmYFXYG/C4WxoC5L976kgJcIQnQ6LOR3VppVVtPo+uT/ORfxxpW+/Ji
        TV3LYJhy514oRCrl+3UFNRMfkO5uptQ=
From:   David Heidelberg <david@ixit.cz>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2] dt-bindings: arm: qcom, add missing devices
Date:   Thu,  7 Oct 2021 16:48:11 +0200
Message-Id: <20211007144811.14008-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
v2
 - lge never existed, use correct lg vendor-prefix
   in -next, v1 patch must be reverted first before applying
   other lge -> lg conversions are comming in different series

 Documentation/devicetree/bindings/arm/qcom.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 73c3ce877ba8..b0b4f9d72935 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -101,6 +101,9 @@ properties:
 
       - items:
           - enum:
+              - asus,nexus7-flo
+              - lg,nexus4-mako
+              - sony,xperia-yuga
               - qcom,apq8064-cm-qs600
               - qcom,apq8064-ifc6410
           - const: qcom,apq8064
@@ -136,6 +139,7 @@ properties:
           - enum:
               - fairphone,fp2
               - lge,hammerhead
+              - samsung,klte
               - sony,xperia-amami
               - sony,xperia-castor
               - sony,xperia-honami
-- 
2.33.0

