Return-Path: <linux-arm-msm+bounces-4235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BB04480CFE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 16:45:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A983B215A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 15:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86D04BAB1;
	Mon, 11 Dec 2023 15:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gBkvU1f0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DAD2BF
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 07:44:52 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50bfa7f7093so5882341e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 07:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702309490; x=1702914290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6BCa40Bk06u4mdi06VIe+toE7TP3wktrYRk6UifjscM=;
        b=gBkvU1f04euqFOz59z2MyhVTMMFZ0AY/aloyfJVTtw7wcgzBJgtxAdYoxDn4nd5ESO
         hiUEzJPSes1jzfLreCpwNJCzfbEaNDD5+PuN/ld5aRhk1vFQxfd15m6oxxmBGLpIqa+u
         tQO6bxR0DRGa1CxsiDtFWaRiym9UVKRaTJXar3kKPPjwJ11j2Bi/akYTjgJHZ9VYh2gw
         8VMv+6CK2eRCNz2pQd4FcnTZ/dv3ZKBe3+itfGjikFxFH3DWhraYxu24hCaWbWPJtzOV
         s/B+wtS+e54yAoimtILLOac+I2T+hgIPC2SDN94CIWqPK994NCRIHKVCXM6zG7xsk8wP
         1miw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702309490; x=1702914290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6BCa40Bk06u4mdi06VIe+toE7TP3wktrYRk6UifjscM=;
        b=qP/UJD8GEwhS3trJhqXEqJD7NK49JXBEucJH3x8hgFW+pp8AxGD1S5dJ3hJ4jd2SnS
         fgyb2gQQdMot355S3wTSbAVu7QaJyv8FMFOwkQEHwe9hsSzdulAH7cvoiEYIme6EME+U
         TQzrg94TgynB21IIYRWqhr+edUQkWdVYw2fSGxuVbrR+yC9cC6uLphKnb1h0BgOsBJfC
         6NuhAWXQyHf4o+3DWSMrHPPRlWQRUTIWEgrQbTV/ariA1eAXgUjGqNK/AAKe5Z+ivBsh
         iP0eR0rANhiFDAeac17YkAUN3VHzDWiGzFt1E9yGwK9M1CKisZXKL+mtJZNynbfI/x9V
         7Bjw==
X-Gm-Message-State: AOJu0YxUQED+ixoW/eCZ/h93n1FbRIM7gnRUa2k8Sl2b7CkuV5QMKE6w
	nj25SquGqsbJxakrXCciN9ZfEA==
X-Google-Smtp-Source: AGHT+IF2zbCIhM/tMOdHnPWJepkHLinVsdy66yYx/mp9180E3chYulcELhXu5gH8TyI+9J7CE8Hn7Q==
X-Received: by 2002:a05:6512:3c88:b0:50d:151d:db93 with SMTP id h8-20020a0565123c8800b0050d151ddb93mr3025139lfv.9.1702309490570;
        Mon, 11 Dec 2023 07:44:50 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c5-20020ac244a5000000b0050aa6e2ae87sm1109646lfm.2.2023.12.11.07.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 07:44:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 4/8] arm64: dts: qcom: sm8150-hdk: fix SS USB regulators
Date: Mon, 11 Dec 2023 18:44:41 +0300
Message-Id: <20231211154445.3666732-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
References: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SM8150-HDK uses two different regulators to power up SuperSpeed USB
PHYs. The L5A regulator is used for the second USB host, while the first
(OTG) USB host uses different regulator, L18A. Fix the regulator for the
usb_1 QMPPHY and (to remove possible confusion) drop the
usb_ss_dp_core_1/_2 labels.

Fixes: 0ab1b2d10afe ("arm64: dts: qcom: add sm8150 hdk dts")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index 6a036f9ba1c9..ea4d75308ac8 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -138,8 +138,6 @@ vdda_qrefs_0p875_5:
 		vdda_sp_sensor:
 		vdda_ufs_2ln_core_1:
 		vdda_ufs_2ln_core_2:
-		vdda_usb_ss_dp_core_1:
-		vdda_usb_ss_dp_core_2:
 		vdda_qlink_lv:
 		vdda_qlink_lv_ck:
 		vreg_l5a_0p875: ldo5 {
@@ -221,6 +219,12 @@ vreg_l17a_3p0: ldo17 {
 			regulator-max-microvolt = <3008000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
+
+		vreg_l18a_0p8: ldo18 {
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
 	};
 
 	regulators-1 {
@@ -563,13 +567,13 @@ &usb_2_hsphy {
 &usb_1_qmpphy {
 	status = "okay";
 	vdda-phy-supply = <&vreg_l3c_1p2>;
-	vdda-pll-supply = <&vdda_usb_ss_dp_core_1>;
+	vdda-pll-supply = <&vreg_l18a_0p8>;
 };
 
 &usb_2_qmpphy {
 	status = "okay";
 	vdda-phy-supply = <&vreg_l3c_1p2>;
-	vdda-pll-supply = <&vdda_usb_ss_dp_core_1>;
+	vdda-pll-supply = <&vreg_l5a_0p875>;
 };
 
 &usb_1 {
-- 
2.39.2


