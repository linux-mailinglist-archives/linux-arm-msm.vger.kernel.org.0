Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D291F440BE8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Oct 2021 23:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231241AbhJ3Vsg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Oct 2021 17:48:36 -0400
Received: from ixit.cz ([94.230.151.217]:35232 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231165AbhJ3Vsg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Oct 2021 17:48:36 -0400
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 7A1D224E6C;
        Sat, 30 Oct 2021 12:04:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1635588255;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=+UB7wfj4tXFFiJ/lUcfdPIYlNCDtOzEqf+s3HG7n+mo=;
        b=KqaG6NjarH6QH0LaJ/HcNJ5wvKLcMSgrZHbxzeIb4X+tmmGm91Q3FbSm6SV83Fit5HD5/Y
        kGh8anD1w1aTa3QoLS4esiad72WdOGdnkVmmqLiRJpS20Lx7XFM/en8uUeF39RiLGZJZRT
        vW1kcV3DgC5lSpMEEyM4sdlxcbxCuIU=
From:   David Heidelberg <david@ixit.cz>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Vivek Gautam <vivek.gautam@codeaurora.org>
Cc:     ~okias/devicetree@lists.sr.ht, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: msm8996: drop not documented adreno properties
Date:   Sat, 30 Oct 2021 12:04:12 +0200
Message-Id: <20211030100413.28370-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These properties aren't documented nor implemented in the driver.
Drop them.

Fixes warnings as:
$ make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/msm/gpu.yaml
...
arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml: gpu@b00000: 'qcom,gpu-quirk-fault-detect-mask', 'qcom,gpu-quirk-two-pass-use-wfi' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: Documentation/devicetree/bindings/display/msm/gpu.yaml
...

Fixes: 69cc3114ab0f ("arm64: dts: Add Adreno GPU definitions")

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index bccc2d0b35a8..1ac78d9909ab 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -987,9 +987,6 @@ gpu: gpu@b00000 {
 			nvmem-cells = <&speedbin_efuse>;
 			nvmem-cell-names = "speed_bin";
 
-			qcom,gpu-quirk-two-pass-use-wfi;
-			qcom,gpu-quirk-fault-detect-mask;
-
 			operating-points-v2 = <&gpu_opp_table>;
 
 			status = "disabled";
-- 
2.33.0

