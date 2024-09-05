Return-Path: <linux-arm-msm+bounces-30894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA8996D84F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2030128BE2D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 12:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10ED819E7F3;
	Thu,  5 Sep 2024 12:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Vq6DTIoj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128F419D8BE
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 12:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725538840; cv=none; b=Gx2t3DxcUYfJos6xmRnidx0RmRKWZcBllQJYu53aY+8UwVCmhWYnzV0sGpVAI2DhCv6Y/RuI/DUKwUe1FKBY/1h0r1i3PawQ/SUuaBFRGdDgFnQ6es0+PyPSstXzyFqdcKHclVFlbFAAz0bJcSlGN3EWfMtYX40oJvr1PR/x+Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725538840; c=relaxed/simple;
	bh=d6WJddhun4HJvMbLm+fmJ2JZlxp0djfpfRlepqwkzwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kjdtULyakND7+xDVfAcG+DZ6Pqgg1pkIp1AY6eMJAtVREgpghgFr7d/bC5NEEF3DPv9whjKhkT/bKFLAbIlbT+7Pm48ElYlJXOmfYLL6DM9vJSHK4e9K0kJt2jjviV/rOJeBMLB4Kuj7JqQYiPFp/j+V7XcFzqkWUTW8QDoDv2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Vq6DTIoj; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42bbd16fca8so6402125e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 05:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725538836; x=1726143636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUTBDQ3R7lg9yjFQy51ucEUiL1cminpTXLLq8RTN/Q8=;
        b=Vq6DTIoj6sqd6/PQ3+CxcElIFUceGY8F2+08d/BPW/XeOnvU8c0nHbJr8zRFiao6X3
         t8WGCAhCRd3glVvBkMlMQRmOtR4/m3R95EtFN3g4arWb6F0oes/m0GYTpXYX0DZMav/K
         rokwDnRJmC3pfXccWu0lgOp+x2JQZCQ/JHrXAc6TvIfOpcC7nxmAEMSb2fpweIPNOIfk
         ENa0vg83d7v37S9t4zEZSdWMKaZE1zCKm173sKoDySrzFCyEmYVzU288+znYRTYmCYCi
         Ag1D6VLv2plPQMXwib++3ENVuH7emR1gpvJNuaqz115wuTVTBlSiun3F+xr2KxcajGEX
         4lJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725538836; x=1726143636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gUTBDQ3R7lg9yjFQy51ucEUiL1cminpTXLLq8RTN/Q8=;
        b=L1mImZ8YCb8GGEjddTCX6+NngytAM42+pTr93myILrORUtd/JzASSlvRPRPJNXh0P5
         Cp+NX20E3Pm/j1wRX3yHsAUhdtBn6elc/vPMyIeHrJsGMvDPlhImNAoYO1dG/lsMEkar
         9Z4AgugVUC8b10naPMfvmH8F7cej3TWypePcszPicrYX1UD7a9ZPtdIMcjXu0RMnCI1i
         nmI4OfvDPntvRpU2jq4TLBQRy5fN0/qpMM35W31A6jAMBD90ZcDDEv3NVNhbTCiMUfjh
         yzXQjR1FCDTi1cAoi1K2ln2Ld3HJ4HjI+wq2JfSjAaplgWj5S5d5m9CZePZr/+ynrWk8
         Od8w==
X-Gm-Message-State: AOJu0YxdWK38cAQI/k2+5SAcfPWvxFMb2ibd3B4oxG89kFVQ+crxQxD+
	rlIC6sCXoWzNlcTUpvynH1psfmVvJQxByvnxkzi6MP4KY7f11dEjvuocK+mOieE=
X-Google-Smtp-Source: AGHT+IGSQzjFcSPvZhlrrAcUSpzThCnyg1YJpIfCV1RMXMl3ZVM0P7DXFNMe1faorV31A2qjyVpodA==
X-Received: by 2002:a5d:4b81:0:b0:374:c2e9:28b8 with SMTP id ffacd0b85a97d-374ecc8f2bamr6939773f8f.18.1725538836244;
        Thu, 05 Sep 2024 05:20:36 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:cbe4:ce99:cb33:eb1c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374be2edf08sm14645764f8f.6.2024.09.05.05.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 05:20:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 4/4] arm64: dts: qcom: sc8280xp-x13s: keep less regulators always-on
Date: Thu,  5 Sep 2024 14:20:22 +0200
Message-ID: <20240905122023.47251-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240905122023.47251-1-brgl@bgdev.pl>
References: <20240905122023.47251-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Remove the regulator-always-on property from the ones that used to be
implicitly needed by the on-board WCN6855 now that its PMU is modeled in
device-tree.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 88b31550f9df..1a9dac16c952 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -479,7 +479,6 @@ vreg_s10b: smps10 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-always-on;
 		};
 
 		vreg_s11b: smps11 {
@@ -487,7 +486,6 @@ vreg_s11b: smps11 {
 			regulator-min-microvolt = <1272000>;
 			regulator-max-microvolt = <1272000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-always-on;
 		};
 
 		vreg_s12b: smps12 {
@@ -495,7 +493,6 @@ vreg_s12b: smps12 {
 			regulator-min-microvolt = <984000>;
 			regulator-max-microvolt = <984000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-always-on;
 		};
 
 		vreg_l1b: ldo1 {
@@ -545,7 +542,6 @@ vreg_s1c: smps1 {
 			regulator-min-microvolt = <1880000>;
 			regulator-max-microvolt = <1900000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-always-on;
 		};
 
 		vreg_l1c: ldo1 {
-- 
2.43.0


