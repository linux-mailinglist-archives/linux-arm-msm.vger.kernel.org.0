Return-Path: <linux-arm-msm+bounces-10296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C394484EE4C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 01:17:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4699A1F28408
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 00:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5216364;
	Fri,  9 Feb 2024 00:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVI4L/r4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478F0A23;
	Fri,  9 Feb 2024 00:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707437860; cv=none; b=ec7uYEk4hZSaUe+uOBB5iZv5pRdJxnyjznjuRmD2NzEUzTqx9hc/salfXQlD1WdJYqpn8cHE8/DNP4JKVOfMDY5Gj0Ldgz18mvs4IyjW1okoEuEVxdyCO0A6Nqa56Xfq8QtzbcQ5Hgxs9YX760aXk2l9nor3t30z6B9t+FhVX6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707437860; c=relaxed/simple;
	bh=5xuDRkq9DcM8SiP6tZtMreEMTrURcYbDeEAIuRDjaC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZH+XQBI1N/57FCPCNB97QKerQrnlAvVGVR96vOby3GYTra8uRo4U6T+VkTUG+VqDDKIsT0UznzrZLTvzEQZ+Pg5XO1cGM54lYCyRri0gw3FKtP0vqqH+fHzsuvtEZxHKmNcONZDKdUGGw/J5wM8+qXE/PDhe0KK6yH3Z1o5K7SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UVI4L/r4; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dc238cb1b17so412243276.0;
        Thu, 08 Feb 2024 16:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707437858; x=1708042658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sDQauiVymLL7U9PR9tza9FE62lAGc6Sh+4W4yotRVSw=;
        b=UVI4L/r4V7v8iUPtxS2do1J+p78iRaCX6QI+YBOWsvOlwfE0+yPg8d6weqvO50rRGF
         /5FmTgY+xhlLFSrHjsHey1fyKlyr9yLiF79N+GnZKk5sxzVpKVvMIyrL2OU7c6tvz3s2
         FNWQyLzLCxQQelpszwzvZNzdM8n4zEd2KCrBQQe+WyE4HvWn1qRFetM8IumlFiJbiSqw
         veB3UZiGFx1ut4F1Qo6uwax6rnmsGc/JtXH1aIDGEMKjr5ZYKx3xja2aPC4j+DYTGbV8
         Kp6GuhHb83WnLLHw6AwpaubSjvjUCUtM7aRGoyLF1v9sGYQSC/Y0dPYznCZwrSqxpyC4
         dqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707437858; x=1708042658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sDQauiVymLL7U9PR9tza9FE62lAGc6Sh+4W4yotRVSw=;
        b=bdbM/GRcJcqGmKn334rVJcKaNl6sGpGKmV4DUdvfQSB1+U3qT4Qm4fJRj5Vcxha1fe
         QMa9Ef6gqrkY+ASt9bZ04tGcan1gTisK3Mxf53gm3HhXNNHb2oNFXxRyFrdLqEFG0P/a
         NCafdW6dLpP6RtHnTiPEx+1XRL/UYbpbpq4qIG+MrPBuPbU+U58+IR5LAWovMC1cx+hq
         aTqb0mAF+EB4IE/Yq/GXgNfnbsy8wjmwKz64IDRmuMcFUx/hhJVIuq67sAh6qwIFl6JD
         nZi+UQ7F1ksl/ty6yvSCs0sE4k6CPU/Qj0SALrahwBG83x3cqnxwAhzXITaLRLdaICLa
         /eOg==
X-Gm-Message-State: AOJu0YxpdeTs1efLjcRFp6gyWf4fpJEIdBMZWizujYbr1dRIsRxk+OkZ
	x6LCBS5GidkahRZvL+U3Ua2cjBwEuSp2XGqGCR9zk/oqsfP+utvu
X-Google-Smtp-Source: AGHT+IEo1iut94rube4CfxWdBcqxaVVTwH5a48TYQAu0VyqwSE3ThAcB84fFQZnIA5Q5BkHvkvKh4w==
X-Received: by 2002:a25:804a:0:b0:dc7:4775:5fbd with SMTP id a10-20020a25804a000000b00dc747755fbdmr1096600ybn.12.1707437858058;
        Thu, 08 Feb 2024 16:17:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV+YAhu2I4unqax8AF/EdGwYvR4g9OqCh4L1WWTp78iDIuhNxgDQjbLZnvRN9NClFBh4f//5eEZO72dF+2AeySK8buerSzcKkaxAp25JbmmrHNCd14atEGIdOPOUDJo9qZZBF1qLRf1PEJmmibj/M+ay8WlO92E9r8xEqYq1nhJInBwcVzByQJmPi8M60+v8AnYQwHwJ/NTxjdAYPH0hY9YgcYE0Ku/EnYvt1je0FB5XSPkHffyUGRtIbffscJnLsX8h7zltFyYS+Wm+FZDAAApTvnPRuszjscPUzvB38yWsIgB+e+1HXZXZIGmdOepdzoy4KMjlE43ADNBVsxHm1+kSFbxDYd6bu7qNL+cowNt0QXiqUTBAoe/I6ewcn/znWuN1iwvWPTWPAuMaE3pbeByMsoBh8ThDKrCMNLlpckyaPqOXjarYq8vw1uFrk/H2WWkfZ8VuUD8fgSnqmZ/0HVbqjEqyRta8y9632T7n5lrRmL1L/VUe1GJEdhbjIs3Blzgb1bgl8oThak79uIlmMnxVbKxiYNvKz3gfti8MroDNs+OPfWrH1uZk/be3nuVQrvrbkAZ1dlAF0ja
Received: from localhost ([2607:fea8:52a3:d200::42b6])
        by smtp.gmail.com with ESMTPSA id nh6-20020a056214390600b0068cd2feff0asm87408qvb.117.2024.02.08.16.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 16:17:37 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 3/3] arm64: dts: qcom: sdm670-google-sargo: add panel
Date: Thu,  8 Feb 2024 19:16:44 -0500
Message-ID: <20240209001639.387374-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209001639.387374-6-mailingradian@gmail.com>
References: <20240209001639.387374-6-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the panel used in the Google Pixel 3a.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../boot/dts/qcom/sdm670-google-sargo.dts     | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
index 32a7bd59e1ec..176b0119fe6d 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
@@ -441,6 +441,47 @@ rmi4-f12@12 {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l1a_1p225>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "samsung,s6e3fa7-ams559nk06";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&panel_default>;
+
+		power-supply = <&vreg_l6b_3p3>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l1b_0p925>;
+	status = "okay";
+};
+
+&mdss_mdp {
+	status = "okay";
+};
+
 &pm660l_gpios {
 	vol_up_pin: vol-up-state {
 		pins = "gpio7";
@@ -481,6 +522,29 @@ &sdhc_1 {
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <81 4>;
 
+	panel_default: panel-default-state {
+		te-pins {
+			pins = "gpio10";
+			function = "mdp_vsync";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		reset-pins {
+			pins = "gpio75";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		mode-pins {
+			pins = "gpio76";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-disable;
+		};
+	};
+
 	touchscreen_default: ts-default-state {
 		ts-reset-pins {
 			pins = "gpio99";
-- 
2.43.0


