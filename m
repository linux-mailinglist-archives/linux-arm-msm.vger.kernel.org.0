Return-Path: <linux-arm-msm+bounces-70312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E53F8B3134D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:35:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EE0A1C27F1C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E011F2F658E;
	Fri, 22 Aug 2025 09:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CRXox0Za"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A874C2F618C
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854951; cv=none; b=PjWymmyRulEs5VDvtgt9OX4KtjXyyWnFk9JCTBA6khT5DCrySeGlgMw/oa4IOhjgJ1kyRFUxyOjtmK/4gczJR3uUZ5bKZR5BC794XpliZgcNZETRWOIpVKUDJ0A8aPmk2ldIzOQV9Fc2Nuj49e/gXWYsqYi3NqJ6hl2qCZhrrbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854951; c=relaxed/simple;
	bh=FvPs3wBirH9wf6cIhRfzmRxFdkB6syQv2ofYw7Gsrt8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XVsnI3qySWBs8JMPJIxHpapFbyIVIRxXsEXjv5WKT0BWAFzO9qRsVtGU6vvDwRjwW5s3T+ECYZzJN0MEDe68nQHNwt2n4+GpgyfYsCyk9KS2wtf9jIzOU9Cn/wkTCGPW99OMpCM88ALDTsDALu/SyDt6TwFq9dTaCcf1oEonSsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CRXox0Za; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b9d41c1963so1075650f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 02:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755854948; x=1756459748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xZMxXQw8/LMF8pMRBn7r6Jgqr/TVT4ig4WiXL2+/Rbk=;
        b=CRXox0ZaTJ3b1+2NaCHIpkfyBg7O8Ke/lhPDcQQf9OtpYWrwwV/npFj77a8tt30vDQ
         vQiMzB5HyYvhtHSRE0aqC2XZd0ELSNoL8U8i1Nv9Ln9wiK1/23XQYDaNItQ4dH02XfRQ
         v5Pq3g32Pp7b+FivnNctHwCHe/vvE4CeVBa5UURGmFUUQGDZnY8hk/aOGH4WlIss/rLO
         GDbD7uzJZD3oQa3KVSicadfNhD27WIQccwsKB6BFzvwb3omzQRXD6Mr+FJofUCIDC304
         2/fAhnvzeFvltm4WwkJeBDygBkH93CPm+2BlJR2eBGL90iyOv5lfmmrxLOGCf6uZ8sKV
         RC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755854948; x=1756459748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZMxXQw8/LMF8pMRBn7r6Jgqr/TVT4ig4WiXL2+/Rbk=;
        b=nD7CHgEJSsVbQ2bK6moaE16tM+Scb7NSPDOvbgDlmbUQEij5lzQs7/9YEDU8L1yOJf
         kWEAJeZRwEyGhS6Q1xrWZKoEHJ4pj8g2Czbnorc3QxnzwvkvZ9hoC28kWpxLOa3B+SsI
         FJ1CwRfhd4N4htgvW+jQByMAfeQ61TkBsni5+qbo/vpWl5NoHjdL29gOTMBTJ/bTVStg
         fwaC5IYZUxU+hd3rUcRmXBdJxKtod2g4q4pWC0yGY0fe8B/8pmvwXEFVwuFPJ9ttOCwm
         lyq9I4OeqJBgo1K++cZyrW4VcjWd0sL4IpTKvdpwr01uOH+77lNW1KoWuAeUNC3wtQ92
         2EEA==
X-Forwarded-Encrypted: i=1; AJvYcCU7zA3kzFVAeBxRFcgQA9U+NPUCpjNyZ0TechCovUdLMrwUV/oh+53xrXnkB1pRtCJrAJ1ItKaugTevCKwP@vger.kernel.org
X-Gm-Message-State: AOJu0YzlXqYgVD2hMfVxxK8giY2k8T94ov8Tx8taGE1uVxeIyOCw/PJD
	s6C7cPwsthZj1uRG75KKyaa+IKQvNrVygpK5ll7rK7d0dRpki+VWH/JkkWWydThgOJQ=
X-Gm-Gg: ASbGncve/GJ721QhEvmC0gsR0G7ndtuCEvPMg3TyKv+JD5MLTL5m8ZwjhZYak4qWLO3
	N6u1t19N6Ge6J6w7ZII1AmEUkWYZYfo1ijfmi/0QhrpvcP5ZKdDnGNf12IZFUhHVjPuTV4cmIpd
	ouJaurIRXCIEPcE710Q6xSOkL7gm7EaNwFE3Oa87En7POgjPvs00jIqFRfoMdiNmW+suJQBINZo
	7L/ymb5DlLWUmqBhXnnR95JEJDx21YURWBcV14djhYn3McVfv/HC5EGK5d3Otx/2mvh6xAH1T2C
	Q8sGI08os5Dnpog2dt9GDGxu9Coqy5/DzavkfdUquijzlw5OZ9CDezEm3XLEybmMHjZWbo0/tG1
	uCvur2YWVuzWzxSZ0BGOG6HdHVteS/5uEkLr3Cg==
X-Google-Smtp-Source: AGHT+IFJ9FWfvS1AnYycVX7DAKqsbG4Q/IzzJ8xRcOcq/trFxgqfeNBZXVo51B4Eh2DsKIVTjFJTYg==
X-Received: by 2002:a05:6000:18a3:b0:3b8:f887:c870 with SMTP id ffacd0b85a97d-3c5daf01e82mr1443738f8f.19.1755854947871;
        Fri, 22 Aug 2025 02:29:07 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:c671:531c:f2ff:2a7a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4e269d20sm33831805e9.2.2025.08.22.02.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 02:29:07 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Fri, 22 Aug 2025 11:28:55 +0200
Subject: [PATCH v2 04/10] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s:
 Add missing pinctrl for eDP HPD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-x1e80100-add-edp-hpd-v2-4-6310176239a6@linaro.org>
References: <20250822-x1e80100-add-edp-hpd-v2-0-6310176239a6@linaro.org>
In-Reply-To: <20250822-x1e80100-add-edp-hpd-v2-0-6310176239a6@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 Abel Vesa <abel.vesa@linaro.org>, Xilin Wu <wuxilin123@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
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
bias-disable according to the ACPI DSDT), which is defined as
&edp0_hpd_default template in x1e80100.dtsi.

Fixes: 7d1cbe2f4985 ("arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6")
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 4cf61c2a34e31233b1adc93332bcabef22de3f86..76d491f085db2eb6ba8c8358063882611446ae72 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -1010,6 +1010,9 @@ &mdss_dp1_out {
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
+	pinctrl-0 = <&edp0_hpd_default>;
+	pinctrl-names = "default";
+
 	status = "okay";
 
 	aux-bus {

-- 
2.50.1


