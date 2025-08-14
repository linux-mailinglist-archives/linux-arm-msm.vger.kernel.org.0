Return-Path: <linux-arm-msm+bounces-69227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F240B267DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 15:45:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E699A9E141D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 13:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1EA9307AC3;
	Thu, 14 Aug 2025 13:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cJksusFk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85D4306D52
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 13:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755178250; cv=none; b=gQLM8RHCOhPUFNj2MJAYM7pZr9xKtHAScU16MFkfku7lxxyNJqB11vUk8/sxTISfWiWw6nr5DU7a3Xg9vZs9hsssIFeekaW18qBev/7RynmrQ3A2RbmBdJMtMcbhm6GWm0nxKTnceLEw1Ya2yV+E7s3b1asVdxtYD7iA8jusK1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755178250; c=relaxed/simple;
	bh=GaZvRFv4128lAqMlpTFVLwnOn9gOhB/5YbymF6GUNrU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nQIoS1Qq7Sbk7T4B3QU0bUSb8SLwGhE0SdCflZ1+YCuzrIhVOSNEBjm/MaG1t0bPjZ6SLyK89r4v7Jv+dKuUm+L0GeecCm8uCpRAOAK5nIsawe1k6KgpCLpr6byqszmW+HcCWa2OyKqEYHkr+B/skWb5XtceIO39iP/xhEc7h2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cJksusFk; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a1b065d58so6144455e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 06:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755178247; x=1755783047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UTkjR4AVfQFQ4JdIrIaqDXIbIwBvW0y2B1DRP7iokNg=;
        b=cJksusFkxQsTbty+Ddpod9SqILBYJpUc3ZLAyZvRSEi6k6H7n3V5+4lRDafQszS6Jg
         JE+FEODF+zVGvJ8jg7FUmel9We8x29TONckWd8v60QZmcWLOguxHa/FtNqhB+QPEhDoF
         f86h6X7tn6mxw7uYQMbYXFYk1YSOLBNTvL/wEfybyZVgIpUmuf9gSvMAkaE08VuAbolR
         M6y7MAueH4wdiZ0fPZNgCg5QuLe1wKDyfwAkb3RPghumGsRRc27lHl31o7LK3MYji1Ak
         PAko6HmSM0Lmd6yQDGONrGoPo7tqUtpdljSzZjmoxLX1kdPdn3F9lzRDnpgqC0z9tCK9
         qXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755178247; x=1755783047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTkjR4AVfQFQ4JdIrIaqDXIbIwBvW0y2B1DRP7iokNg=;
        b=L7EoIoaNBUfgpnFOgtSCVNEYmFDrtFtNT855VPH+UHzawe2xZ8IRKDPGAHv7jU7Wbv
         HyLSuZOvsjoSIa48/4rtpd1gm8o2XHYZ/0DJC2LmEoasg0xyTQS4kuiaFJfIhQlcmvzb
         dzMMaQJf3UhFC336XX9+vrpeJt0Zvzv/cnmKRwf60Y9LCcvoC7dx/IgtsEzQfuIYv0id
         MfPSTLmtR7de57vHHddaCo2VZ5A+d5t+kkLXard67l1r7RHWHrbYsa17timAnFohVD9I
         cSUiEd+u9X5dfMTqibGzmvp7v2GsqdsznliT3A6jvnlsniPyNmt6FkQQJidm7WEDtBQc
         iLvA==
X-Forwarded-Encrypted: i=1; AJvYcCXqgCndM/Ccpx1ifquoh6adziFm6DsFR9LBDLlI+68YLPy9/zX/rRYXkoNPwoEbUZgdPtaIQp7W920VgUqX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Txw0e0TMtilGx/Kv/FkAq/YSl4roA7FN0Cxfw+LV6jJJglt8
	CRckGWhyeNrG0V0ojeEFatvlhfE+b3dCs5KmvUoV+uIrPpDlG6HHeIYt2W5350g45sCk6KSjyd7
	4cFzB
X-Gm-Gg: ASbGncvpGjUoGx6Xy7oy1RyCur5NavnVXz6rK10WY2KSTMI6xuIXcsCvKHjezj5fyUO
	2BmnbMO7x3n/9n1W49NZmoLqh9iF9RC/37cSTvZ2czMEo1cF/ItqMhy8OxM9ICNkbLWEoO+QACM
	CxVlaGaim8mqfCsybqsbxycic239dNDETV7phWv0kAY6rgoK3qKT+H1gDLLgN2JimSfL3TQdIpN
	MwxpvNXXq6JKGDOPJgFyjTUsTjYGZwC3Evgl6Ei8CjegThbC/UIWw718XF3FpuwPf12cx074RoR
	bjKFeyaa1IwdcyYRcdsl0SG4eIoC4PLA0+9CV4yotUTReDz6jT7p/n4Cme1sB1w9cip4kmuxxZ8
	n8b5AcroHBWSPBxQ3BtFiOnKWFCdlid0JaPxB
X-Google-Smtp-Source: AGHT+IGPbl0U1uI1tIWWQhqnmUUfpWK5Nduw4p+gnIdH8QJvgzFH+ZoJh9pyeptum3eemuNfitFa6w==
X-Received: by 2002:a05:600c:548a:b0:459:d3d0:650e with SMTP id 5b1f17b1804b1-45a1b60f4e1mr25811935e9.13.1755178246811;
        Thu, 14 Aug 2025 06:30:46 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:9c1:e029:fc81:a800])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bc85csm21468385e9.5.2025.08.14.06.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 06:30:46 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Thu, 14 Aug 2025 15:30:33 +0200
Subject: [PATCH 6/9] arm64: dts: qcom: x1e80100-hp-omnibook-x14: Add
 missing pinctrl for eDP HPD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-x1e80100-add-edp-hpd-v1-6-a52804db53f6@linaro.org>
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

Fixes: 6f18b8d4142c ("arm64: dts: qcom: x1e80100-hp-x14: dt for HP Omnibook X Laptop 14")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
index f9ce2a63767c151192b0618ee2154e8d97316c1b..a701146ce98db4a2b01cb9798c0805d7db7f5df6 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
@@ -1044,6 +1044,9 @@ &mdss_dp1_out {
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
+	pinctrl-0 = <&edp_hpd_default>;
+	pinctrl-names = "default";
+
 	status = "okay";
 
 	aux-bus {
@@ -1314,6 +1317,12 @@ &tlmm {
 			       <72 2>, /* Secure EC I2C connection (?) */
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


