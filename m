Return-Path: <linux-arm-msm+bounces-69224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF4FB267C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 15:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 605E92A2C12
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 13:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E1E306D2E;
	Thu, 14 Aug 2025 13:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WM/5un6e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CC1303CA6
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 13:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755178248; cv=none; b=TIiDJmaNbkaw2U5k/dzvX5LrfglJnNK1KUbKK63/JvJ0naP1c1kF1pmx63TTcz8fpMihLoQ0z8FT8ig5A0ScNtjN8T67M8+rv+Q+tjhnpgQOJOUYA/kl/Nk0RbqbNyMMwU6faf5W8GTzd/0QgFO2o3/UOrSdVIVUpCyM2x4Tp+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755178248; c=relaxed/simple;
	bh=DdmaG7ehVjESVEvapkg0MYfay+O+SC8wve45b9Wg3/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qzJ1mW0bd1jFn+D8OP2dp1zKpVQHRojgTl2KDMBULnIZCxUugoTtCsskDy3M6ZpIj3y9eNwQhHGDBWuGkIBiLLSQJur4iecu0WL6r58mHGZiUUzYvWy4uYnm8zOlVcnogjWhyEL/ks/V2muY7CNhxevE52lvropEn3uolrf1FiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WM/5un6e; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45a1b05d252so5774275e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 06:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755178243; x=1755783043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xO7OyOIjZ2UD4IHxiiLEPx4FR9p4ANXjYYZCIW4sH8Q=;
        b=WM/5un6e/YNZZ0QVIrPiVD7B/pmEf9nj/2nE5A/Tcxw3QJj38cjI8aPcHmXJhlYSCT
         Zoz3R+6WAQC2IDg5VDnv6HWGFTsI9cR5LSMpcwkTmmivs634DQkzzm1sPqcwMZHulKxM
         1ttcBFvYL0E8zTSAFjJQ+X1S/i1cGHXXtnAX9vmj7Hv1EdXcf2IwfmSMqBtjX8Rat1tj
         10ccHXJbw95hWJqwBKcT+uQpNKBHYq8bLJlzHjQ188ayNTpCm0M6h+qPfMItNUsvro4f
         0vr5wTQNB9O+lVRBMoUyoE/Re+ohOoW1LZLhYkf0KBymTKl8Q6nnFwO6pxvQxDxV3RD7
         yDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755178243; x=1755783043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xO7OyOIjZ2UD4IHxiiLEPx4FR9p4ANXjYYZCIW4sH8Q=;
        b=mkEq45rL3p9gyYAJe69ggTPuDPiDLKUwUP5ul4qjwdYim9gNvD1BgOxQm7cv952S1h
         93iTJxGeU3fhkGkbSFG/lJeX2QDXfpk0BdxXXc4ybY7ZFB4gI/y4cf7zd9hhGcb8GVac
         rciG3ue+HRcwYw9gVA1H2PNshJVyi/znZ+A9t24dSIjybRvUYLK3Dasq6twIdh3LAfq8
         ++quoCzkxcUWZuQmVaKhvYFtM5TpEIHp4qmfrSbmxsnt2+7OF70kwBHOiTwVQovHtOTV
         +EJCLoiw7a/Y8sLaOXUzHy+cIHPxqplrqu3NTnFWjyrGT/4aVHADO4G1bnn6TKDYXgrZ
         qFmw==
X-Forwarded-Encrypted: i=1; AJvYcCUh8H31hz01OGCz+GfCTN77fAOPMP296jFp2qQZZV1bBUGr6ht5RG2H06HMgsVrX9VEVvgND5Cw2lcmpgh/@vger.kernel.org
X-Gm-Message-State: AOJu0YwpqdCN/k6JUyrMmper0oPFPvBoFcDfyhYdF1ixSin1kAQXMqbF
	C43uR47vDUqLibjdH2NWqftJ/Qw5uyNWGuvp8n+J2n6INd0KcG+hUhAg7jhkiPN+zqs=
X-Gm-Gg: ASbGncsL++M+IDkKedSFPt0H2GBAEe/K34szN30gIgnnANcMHP6tHWlZ8J85tV7zt3J
	0sULbN7GS0JhURyNqFBq8ZR6OCCihsfxcGJ07Xd8UXGFd+rYIzB+8mYql4MTnzBqwwUnyiwsHG1
	3g6+2cU+rc10iQVaqyXnLzSfUWL4LVlUnpeppa4r8fvGNv6kQt8SHrCpzX5t1I7YPlb+dEIID0N
	sJgd6SUE/fOqf1wuW3GpkbOSJzWWU/0VkfqUOS1Epz+PcdIOjvb+Nu2HLIsS4TTaIetc6kt6UhB
	XOKCBqWB7FT7TudsXfnr9Ha36HVyhnFrEZwLMuWRq04bW73u3n8G+yK54mxUOwe52oJp8a8N1ai
	7HP+1MELApI9eAhfkA8XYMPS0nV70/Ymeol//
X-Google-Smtp-Source: AGHT+IErG9lWZOvLzZHMGjaWUJqrantKmVyUgoNQhEzIXeLjDvvFkrGyYX3YexiBqjoDQV3W7HBtaw==
X-Received: by 2002:a05:600c:458a:b0:459:d3ce:2cbd with SMTP id 5b1f17b1804b1-45a1b61bdcamr27554675e9.13.1755178243488;
        Thu, 14 Aug 2025 06:30:43 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:9c1:e029:fc81:a800])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bc85csm21468385e9.5.2025.08.14.06.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 06:30:42 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Thu, 14 Aug 2025 15:30:30 +0200
Subject: [PATCH 3/9] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Add
 missing pinctrl for eDP HPD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-x1e80100-add-edp-hpd-v1-3-a52804db53f6@linaro.org>
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

Fixes: 7d1cbe2f4985 ("arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 4cf61c2a34e31233b1adc93332bcabef22de3f86..b775110bbcaff165cac259cacc7509a64746b987 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -1010,6 +1010,9 @@ &mdss_dp1_out {
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
+	pinctrl-0 = <&edp_hpd_default>;
+	pinctrl-names = "default";
+
 	status = "okay";
 
 	aux-bus {
@@ -1263,6 +1266,12 @@ &tlmm {
 			       <72 2>, /* Secure EC I2C connection (?) */
 			       <238 1>; /* UFS Reset */
 
+	edp_hpd_default: edp-hpd-default-state {
+		pins = "gpio119";
+		function = "edp0_hot";
+		bias-disable;
+	};
+
 	eusb3_reset_n: eusb3-reset-n-state {
 		pins = "gpio6";
 		function = "gpio";

-- 
2.50.1


