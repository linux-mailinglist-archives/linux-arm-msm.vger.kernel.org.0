Return-Path: <linux-arm-msm+bounces-20560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A938CFC10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 10:47:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EAC11F226CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 08:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A361913DB8A;
	Mon, 27 May 2024 08:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YJ5Dls2K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71FD13AD0D
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 08:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716799460; cv=none; b=YR+Xzi6FlJPMc6hejmL7ERTif556Fn3qoM8jT7quygQUXCBk2RhT9qis8MUTEnaYNOLAHqxy7kccus79fj7T/yl1nT2rsZ0LSKJYGTzD11jJ5KHbiVHUViAqY3ABlvxd03XoKtkS+Z8/ceHlRkEujCAnWL0j5EO35PrQxlLDmBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716799460; c=relaxed/simple;
	bh=3EDAUHsXKoG/qKpImUuoYQAk+6P6yudy3+ZtIt3JzhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SANmWelP2W37/mmVvPznaige95Fji8/McVjsruFdkf68iXLE7qiihDG+o/qw8kipj8wDDRTSazuUzuVo1We3vmdMSJ3jwXutpCbXoe/F5QBQG2IZkcHDMoPdD6i3Z7yrtsgXDy2lQoef8KcqSiNp26tDmv147lsuCTHSp/IgreA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YJ5Dls2K; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5295ae273c8so3131647e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 01:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716799457; x=1717404257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ee+lz1uwo7ctAXz2XE2Pj87WD7POTM2aqHSnKbmZAtQ=;
        b=YJ5Dls2KnR3/FHfrY/be1/4+7pyhCkIeysY3a77VIjKey+CIJkQaYCjNwZzZTlDCSH
         uRhmMEdJdKtFYIiCK3cKzSgPEcFehvnsblpnrgaRWtRq4UgY4ncLC0LXXxh0/Wx3Dtu9
         s8CdZmHot99sqK/y4ePvWO85GbS1Akr7p6seqtecKHgWP1v44Wv3SsH24PQLExwe1PgC
         Iho2yOlF2GUoQWYcK7a7sTB9mCemEoskyYvuX6Cwe7pGatJ/3++mZdYRFQuaUMdscaoy
         mSd15lEM+Qy7GypkTws5Z2iZEU8lBg7vIQOvfBbk6R/Ry0Em3XCDedKafJD6uqNFQkv2
         5m+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716799457; x=1717404257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ee+lz1uwo7ctAXz2XE2Pj87WD7POTM2aqHSnKbmZAtQ=;
        b=vkKkOT5GS54ylFr/mugEiVuzbF7LgYXDvMDr3dUeDagvk1tehc48C5ilkbKSa9gduH
         knQdoy5S5kDumnXWUtBZ/1tlcoVJDwbDLU+U6Qycs5jwvdzI8hftYBBxJ3rQhYKWb9/9
         qjjtDArvNXD4sR82QDALF4sPFOlO1+3ynEYLgvLPLC2mXDFcCDNU8d5uZNDoV900Z8nc
         yHCc/p/g7GXaEXVgkFfT5x8klqZk7cZm59o67/nR+YONsdICDBXdZ+qAMtrrWLKuh4bV
         3x5ljoYj5ip2bzV4CYTP60s5PXVHxM3eBkmdm4Sjp7tSVTaMl7KckXaowXdreU9M2D8K
         sk/g==
X-Forwarded-Encrypted: i=1; AJvYcCUlDCg+dsHjCwm8yiukrKyozNq5G65S976EyMpi6aFJDgFeKdlARt/ygtBnp00n1hfFuyYA4XTuMOcgRwoByrOJxIeqi6UchuRniU12Qw==
X-Gm-Message-State: AOJu0YxfKvwlQrULOM6acHeCnvJ+GQyosVEPFFOJm+JIuN0gGYYAQ8ae
	mWSZRKSlybahx3gE8T6GE1mYeYFT4eHR/O2ayUYcbNAwC+5OnK83Dzgx3SoYgHU=
X-Google-Smtp-Source: AGHT+IHgNGBH0VfGcIy+2nfmBInkHcxkSMBQ3b9/ZSu+UgtuVTHHwuFH5qRtuL2AKhsJQ2UiDs7DyQ==
X-Received: by 2002:a05:6512:328e:b0:51c:5171:bbed with SMTP id 2adb3069b0e04-529649c5d97mr5449550e87.15.1716799456936;
        Mon, 27 May 2024 01:44:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:c322:131e:ff9d:ef41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42108966682sm101365575e9.2.2024.05.27.01.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 01:44:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 May 2024 10:43:52 +0200
Subject: [PATCH v2 5/5] arm64: dts: qcom: sa8775p-ride: enable remoteprocs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-topic-lemans-iot-remoteproc-v2-5-8d24e3409daf@linaro.org>
References: <20240527-topic-lemans-iot-remoteproc-v2-0-8d24e3409daf@linaro.org>
In-Reply-To: <20240527-topic-lemans-iot-remoteproc-v2-0-8d24e3409daf@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tengfei Fan <quic_tengfan@quicinc.com>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Alex Elder <elder@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1173;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ltuWgnMWBVzAFPrqL4rpwFznsQIrPKuJMFtG5UNQsAY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmVEfZe/GoJRntgWCYkwxLrWLqW+XWv1z2ooQwe
 6xSFV9LCNGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlRH2QAKCRARpy6gFHHX
 csvFD/9V8wQHO7eGFPD5rqaV4OMF82bXwBTAmtVVnC/vZuILo+aKn7VhAyYD/PrKHGnj/yfyIFS
 6hqBLaRJt3Kl6RAncH7CjxN+ROoJoZ7urrM1Egj98o697IidhPQyTcNgFNJdhNKnNu9TKFihyNF
 iwTej7Ux0TBrSyteCqt3SQ5ZwMYYlJoSqPk1xPM792Omh4twuYfyaLZaKoKRievmXvuCK23eTN3
 FPRntZSMvibTwohL1rs2P/hJwtLaEIXK9Z8+KiSg1LruzHt1tZInEqNCfDZS3ur5KuBXEXSyFL9
 OKAyR4pPvRnW0x9mfD2vWUE2CNJdTKK3Ns5bQfIErkt68wfNS2pU0amYDaZkpcKnrIDigex86nb
 6E6uRLFqc5lFdQjkwOa9zM8s5OLI5aRUooUYpJDcel5Y19/VLEx86vygmKfzYjtFcgqhzjNnXks
 7MG2BNwtiNBx2OfhI5DkpWPHFwvRT2Eo5wwRii36wnemTNeJw2QfZyTOER9Yd46W0J/KXMlDLBa
 4mVoD538ANbF0ifNhlUhxsCGr6LLZ09/yTKaLFveMRgyMC+QSIxXTuFXjT12WoL2U0vqDAX+Pe/
 cP6YtqYH1rczE0KiMMk2gDEdlW6xYZkEaMEQ9NJHWS03wXT8yNmVoiQELnOSqUwDuApSyOjUfyB
 YojYZSuQAGCNwQg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Enable all remoteproc nodes on the sa8775p-ride board and point to the
appropriate firmware files.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index 26ad05bd3b3f..071fcaf09364 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -727,6 +727,31 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/sa8775p/adsp.mbn";
+	status = "okay";
+};
+
+&remoteproc_cdsp0 {
+	firmware-name = "qcom/sa8775p/cdsp0.mbn";
+	status = "okay";
+};
+
+&remoteproc_cdsp1 {
+	firmware-name = "qcom/sa8775p/cdsp1.mbn";
+	status = "okay";
+};
+
+&remoteproc_gpdsp0 {
+	firmware-name = "qcom/sa8775p/gpdsp0.mbn";
+	status = "okay";
+};
+
+&remoteproc_gpdsp1 {
+	firmware-name = "qcom/sa8775p/gpdsp1.mbn";
+	status = "okay";
+};
+
 &uart10 {
 	compatible = "qcom,geni-debug-uart";
 	pinctrl-0 = <&qup_uart10_default>;

-- 
2.43.0


