Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0A584354B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 22:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhJTUoN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Oct 2021 16:44:13 -0400
Received: from ixit.cz ([94.230.151.217]:57960 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230325AbhJTUoN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Oct 2021 16:44:13 -0400
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 9C30720064;
        Wed, 20 Oct 2021 22:41:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1634762516;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=bXw0JZYeVYpDrBpFwSaI87WeHbGG+hkhQghNnAqIAHg=;
        b=To3+wnwaigWLhsWtNUmnpEipcFmg9F6bZc18BsMPT7rp2BbU8qlQH6czgDYDwz7+iE/lfX
        iN53mou2gEtyXm68CCA1Nlu7NUCLQOglQMYGiotGWgh5as8j9VZFtVeZg4ql4lT/CYLRaK
        p4lrJRD+ghwuGJWbJc/6+gLacf1y9zo=
From:   David Heidelberg <david@ixit.cz>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     ~okias/devicetree@lists.sr.ht, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: qcom: fix flash node naming for RB3011
Date:   Wed, 20 Oct 2021 22:41:44 +0200
Message-Id: <20211020204145.235050-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

rename node to comply with dt-schema

Fix warning:
arch/arm/boot/dts/qcom-ipq8064-rb3011.dt.yaml: s25fl016k@0: $nodename:0: 's25fl016k@0' does not match '^flash(@.*)?$'
	From schema: Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm/boot/dts/qcom-ipq8064-rb3011.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts b/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts
index f7ea2e5dd191..0244dda06ee8 100644
--- a/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts
+++ b/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts
@@ -172,7 +172,7 @@ spi4: spi@1a280000 {
 
 				cs-gpios = <&qcom_pinmux 20 GPIO_ACTIVE_HIGH>;
 
-				norflash: s25fl016k@0 {
+				norflash: flash@0 {
 					compatible = "jedec,spi-nor";
 					#address-cells = <1>;
 					#size-cells = <1>;
-- 
2.33.0

