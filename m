Return-Path: <linux-arm-msm+bounces-69230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A42B267D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 15:44:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A5DF9E2FCD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 13:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F69330E0E3;
	Thu, 14 Aug 2025 13:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GIQ2hTZk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78813090C1
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 13:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755178253; cv=none; b=Gw5zELHIAmXtFmzfnxAsuKEm3JXSXYSBUAdkLLAtfn+JqCzIaVfOPkf0K+QcRZOW2Jfv9hdDcj0yA+Mn5F7dPZAo2vpZG4IPm/Ore6DJ8Xb4bagnjzdxZ0T+z2p7C+Ldb4HZxtdqSxkilIVD3HZxDdl9ylkfM8peVa4i7AtkTxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755178253; c=relaxed/simple;
	bh=QynsBKDQL2BzLf0bIXsFSHjH/GTgsrvYFywFlGIP3TU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nw6nCLFMnTYWHLRVqrYPQVEta6K7kL3Z+QdDDy6oyR80UMfs77DqtzIzgEx1zkgb3KkbT5hymyZD38h+t0vOP5r//C2DTw2iQlFfPqCv4yNN7m+qeyG+jBC5OUlfMLAuvw8pzQ4od/qlDS1ljaFOoaLFgkfmjT6m5gxMTrnViA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GIQ2hTZk; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45a1b066b5eso4459445e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 06:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755178250; x=1755783050; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jwSXTCKpuxO5xRMtx8jKiOAluJgz+rUMYQemGXnn4yk=;
        b=GIQ2hTZktUGejYNRmtZ9jzKDhaZYVmYhpuhY/ExkK07i6oXs5/3kQUST2hZih6b40C
         OofEu5TFtNBS+oPIKtGEbraTpDOpREDP73bpp7+Uz9CBH1uNfz9y+/caFNY7aC+cEX3m
         lpVerFOWroxP0jSwKGZak+eSE9cKZBI3xLPU9vtlor9dsA/bQ8Cz1oCWrwSTYyxPwN9F
         L0rF4RM0sJ12yiWbaI4Bf+eXf7olopsTPKFjIR1eqHJvzV9vcQktvmIFBs/T/At4D34H
         Z/BtPByBlHvWjFRr5lBIWGFo6gGPXLa8CV7EKMA9XQxQQcmJqzumojyK0l2o/Dtskwop
         BnUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755178250; x=1755783050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jwSXTCKpuxO5xRMtx8jKiOAluJgz+rUMYQemGXnn4yk=;
        b=PRRaqyBUy9oHWL6SGofjGl46nN8/kqde9EjjsSCVEx31tTHSEyJPy4ZX09+C2epDo+
         MCKdIMJEMQusOFcmFRy2MEKDKfUtbHLTSmM+5W3y/5GJLrdewqfcRFjDyKayN4W//DgZ
         leUCS8er6uUeaP5ybcfaj6FuDGzH0HflcSkVfM9pIrzANq3GAupmAzzQneeA16NOuGni
         8OBUTxj22saLjnXywOejtY7tsGAvD3jhMxamlF06j5ASh/HzJosB7U+NIcG95isYN6TB
         ZsJgeeShNDmhtLv42LcJNH7pgrnWdOtGjgXwsRPSzAKbNrcLybAKNvvsjnDEU8+r1hyQ
         AegQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZuuJi9X76S1irj8EfnNrmSWawVmKJZkvGkLEZaVJOibyP9EHinheYkz5XSDDEdgm55mGhowalxQ7+fuSw@vger.kernel.org
X-Gm-Message-State: AOJu0YzXZhW038b/eDnvo9PYQpZ9QotZH17Gbv/ySvgsx0q7OwHIm5ew
	mPyrZiPeFUVtwlvxcDXCyuBydGRkQ9gltT4tDOmqAPVEz3z62zxbL0P7kd4H8vs1cF4=
X-Gm-Gg: ASbGncvjHvw0qClDodJVTYSFrTkVvRzD5M85VCIRVDL2XMYUyfunsPvx+7WVFr5keYh
	mr2ifeTDCqi84isclQ0SUX9oQHcPBUFMt6NfnntiZctqhEm439TjPRsIfQYewmPCz5O+i1Tb0/X
	JB8KKW3rattTjbVffvd34Ro7ZeMOJBSur0C8kDtVgoy94kJHTCQ+A9v/WT3EHQlRJHrrLOyA3B5
	08DTMxnWcirhgJlEO9Ci3yctbzE6D6p+JxjquuRdSvoICGLcUqy1O01XLCjazwDp9AJjmB7c7n/
	3fTZqI+//YOnFv9JHO/nDMM4uDdTavlLdC8zSQaVrMOWi2ABQhySaqs5rQdTTNHY98jOZmwSG1g
	r7VIZBNXHgEp7QV2iidRdrxu5qJHSj0jCVHrM
X-Google-Smtp-Source: AGHT+IGt5cRVYspwQNW34QgGfD2H+qX9Ylgeh1WDh9AMn63El+afvTplduM9mj+PIQpeny+iXM3kBQ==
X-Received: by 2002:a05:600c:1d16:b0:456:db0:4f3d with SMTP id 5b1f17b1804b1-45a1b66828emr24158145e9.24.1755178249900;
        Thu, 14 Aug 2025 06:30:49 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:9c1:e029:fc81:a800])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bc85csm21468385e9.5.2025.08.14.06.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 06:30:49 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Thu, 14 Aug 2025 15:30:36 +0200
Subject: [PATCH 9/9] arm64: dts: qcom: x1e80100-qcp: Add missing pinctrl
 for eDP HPD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-x1e80100-add-edp-hpd-v1-9-a52804db53f6@linaro.org>
References: <20250814-x1e80100-add-edp-hpd-v1-0-a52804db53f6@linaro.org>
In-Reply-To: <20250814-x1e80100-add-edp-hpd-v1-0-a52804db53f6@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 Abel Vesa <abel.vesa@linaro.org>, Xilin Wu <wuxilin123@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2

At the moment, we indirectly rely on the boot firmware to set up the
pinctrl for the eDP HPD line coming from the internal display. If the boot
firmware does not configure the display (e.g. because a different display
is selected for output in the UEFI settings), then the display fails to
come up and there are several errors in the kernel log:

 [drm:dpu_encoder_phys_vid_wait_for_commit_done:544] [dpu error]vblank timeout: 80020041
 [drm:dpu_kms_wait_for_commit_done:524] [dpu error]wait for commit done returned -110
 [drm:dpu_encoder_frame_done_timeout:2715] [dpu error]enc40 frame done timeout
 ...

Fix this by adding the missing pinctrl for gpio119 (func1/edp0_hot and
bias-disable according to the ACPI DSDT).

Fixes: f9a9c11471da ("arm64: dts: qcom: x1e80100-qcp: Enable more support")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 9369b76c668b5c008fefd85d5ca18e87ab9ce93f..c7f9f0dfdfac187ea88b1b207a882eaaeabe749a 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -915,6 +915,9 @@ &mdss_dp2_out {
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
+	pinctrl-0 = <&edp_hpd_default>;
+	pinctrl-names = "default";
+
 	status = "okay";
 
 	aux-bus {
@@ -1179,6 +1182,12 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	edp_hpd_default: edp-hpd-default-state {
+		pins = "gpio119";
+		function = "edp0_hot";
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.50.1


