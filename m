Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45A10444C9E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Nov 2021 01:34:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbhKDAgg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Nov 2021 20:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231206AbhKDAgb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Nov 2021 20:36:31 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCB05C08ED9E
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Nov 2021 17:29:54 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id k24so6693956ljg.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Nov 2021 17:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Zkqig23M8IsP/fRu3AwBnptobBWJF7yS8RO3lyj9QcE=;
        b=hl6IBdUJAD9FGqtkauBeE7REGASKjzI5QixhBfnz2Au1dpZvlDExt8F22qIOAoKYob
         qvNM69+lBZVUZlL4NnwSdZo94n+gOKuMnk3Ht1+r5A03c08i4RqQaaR4/7X05askvkk4
         hO95DtOUOEEEy6mRsyoR0sc1PihQWx9nNKcNlEQryhtfO4kCjBje4Z7vZgr0z5BPjYrz
         wBMEA6gO/+4h1y1DJ7MCTeTgkwEXYxCcD0xEKSzOuP2vJMJ+7fMCBdVnOPzqHJ43DEnv
         4Hc2vxfyzlMV1pPW/XVp5qQLlJesl7oSPJmtgpBkJjAKcDiPpSMPxzZLzv9UjkPrdb9/
         A1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zkqig23M8IsP/fRu3AwBnptobBWJF7yS8RO3lyj9QcE=;
        b=sipm7pcSzl/dzXnnBSsPfTSpTi4IVVRXbaC11gct3kkeMTqmztE+JOva8gPCpmCxm3
         EZsHJJnYfvzQLFzpAcBy/SH/xyO7yD4oVNg+RCoK6OChPnsrUnmPjf4nI/GSA0G7+JI0
         csXqXlkoGq2aHJ8XZ8ilay4Bsb+AMRKyPx7eYmycwHjB9LgTGgpUpCO0WLGfIBHbJDun
         v8kE6r6D0vgm7tgeeLdw+1/lCvlUk/LaV+OzMOdgP91kpBhd7KjX2UaJrB3wL+zSiS3m
         vZ0Dyg1sVOyPvNx4W8/MRM/oAic2JXBpls8VljIHi8T+TJJJsgme3LzJ0VJqNHBw+WVk
         mwNQ==
X-Gm-Message-State: AOAM5314oRJkrjcQcvcNdWqtzXYcy+Oz4Br4qXIgzmhuzBUXPLmldmEI
        YBVBTWemwh2Taw6Yy8laUuRFHostAF53vQ==
X-Google-Smtp-Source: ABdhPJz3xvgGSw9czI1qHocVY83lpIzTvC6PS6oXax1aBOQIVphdS0Gj9LHjMUowFYi4kHGQmUM5eQ==
X-Received: by 2002:a2e:9d09:: with SMTP id t9mr50493167lji.400.1635985793102;
        Wed, 03 Nov 2021 17:29:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 188sm329861ljf.71.2021.11.03.17.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 17:29:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 5/5] arm64: dts: qcom: msm8996-sony-xperia-tone: fix SPMI regulators declaration
Date:   Thu,  4 Nov 2021 03:29:49 +0300
Message-Id: <20211104002949.2204727-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104002949.2204727-1-dmitry.baryshkov@linaro.org>
References: <20211104002949.2204727-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Device tree for the Sony Xperia tone family of devices specifies
S9+S10+S11 SAW regulator as a part of the pmi8994_spmi_regulators device
tree node. However PMI8994 does not have these regulators, they are part
of the PM8994 device. All other MSM8996-based devices list them in the
pm8994_spmi_regulators device tree node. Move them accordingly.

Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../dts/qcom/msm8996-sony-xperia-tone.dtsi    | 29 ++++++++++---------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
index 4c26e66f0610..11acd9e31a75 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
@@ -595,34 +595,37 @@ pmi-gpio10-nc {
 	};
 };
 
-&pmi8994_spmi_regulators {
+&pm8994_spmi_regulators {
 	qcom,saw-reg = <&saw3>;
 
-	vdd_gfx:
-	pmi8994_s2: s2 {
-		/* Pinned to a high value for now to avoid random crashes. */
-		regulator-min-microvolt = <1015000>;
-		regulator-max-microvolt = <1015000>;
-		regulator-name = "vdd_gfx";
-		regulator-always-on;
-	};
-
-	pmi8994_s9: s9 {
+	pm8994_s9: s9 {
 		qcom,saw-slave;
 	};
 
-	pmi8994_s10: s10 {
+	pm8994_s10: s10 {
 		qcom,saw-slave;
 	};
 
-	pmi8994_s11: s11 {
+	pm8994_s11: s11 {
 		qcom,saw-leader;
+		regulator-name = "vdd_apcc";
 		regulator-always-on;
 		regulator-min-microvolt = <470000>;
 		regulator-max-microvolt = <1140000>;
 	};
 };
 
+&pmi8994_spmi_regulators {
+	vdd_gfx:
+	pmi8994_s2: s2 {
+		/* Pinned to a high value for now to avoid random crashes. */
+		regulator-min-microvolt = <1015000>;
+		regulator-max-microvolt = <1015000>;
+		regulator-name = "vdd_gfx";
+		regulator-always-on;
+	};
+};
+
 &pmi8994_wled {
 	status = "okay";
 	default-brightness = <512>;
-- 
2.33.0

