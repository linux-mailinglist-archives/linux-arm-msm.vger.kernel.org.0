Return-Path: <linux-arm-msm+bounces-70310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E98BB31366
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6D4E3BCBBA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E44C2EFD8E;
	Fri, 22 Aug 2025 09:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l6auaDi5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737F12EF67F
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854949; cv=none; b=hLUMP2FfOUPzMQUz9O6J+Bd67NTYlh/VGsZX7WkBKnLrTU2HID2zpcSe7Oi3tzqzgtifaFD2y1JVthQCc69YTqVrQEiRDW81ScHMHe6yEp4Al6cnTIDcYG5/kH4x+/W696n+NCu/A2DcTTmyASiXjSXH9RoDqpBhINU4Q3jriRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854949; c=relaxed/simple;
	bh=KTn6vbVqVwIQjrGCMmz+yYtiW5sU/DuQSWNcqBhTWPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=onZnvSyuIsvH8ZvI5KkH/IDkBlembnukqsgmFgMsKqlFPo/u7L2DiAjrnQ5DU8uQwQ56fwmXrsgS/n+Pc60kchGi4uLe1bkenDQmEvcZzyQNecjICE8EshLCLBpFm0V95QmZTCnt4Ne6mZAa71z0MabBnIGieWziBt/9miZtP64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l6auaDi5; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45a1b05fe23so10804395e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 02:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755854946; x=1756459746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aDaAQdKRC/QElueN4SD7JG4KlVvvsfus2+KgJMaOEsc=;
        b=l6auaDi5nddH2EuqyF82mmFIVySgpZe2UE5KlkPqyg7g5jvTmNgndA5/GwaO0SEj64
         Us1HGdohgB/lXqHZh7LWXmmnHHnwtx11rxW5FIbwf1IHwR7YScuVeU4HF9WRfPB1eujM
         khTmWxVGDWLXoKqdSrBNK8SaxflDtGyiHf/wognqH5v58e2hycPD8y/PiIWDMO+bXPxI
         7kewh8/zENf4ytekwWLdmLL7M111BnPVZyiI9vjhrS5mbvXx9W+NeIoIWWZszF2IKHIs
         1P8iF9qYrp+kk6jXXMFpn9/xUjvEZk210GB7amFib9JGUsvv1w4QJyICbNO8UflI2Yu0
         o0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755854946; x=1756459746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aDaAQdKRC/QElueN4SD7JG4KlVvvsfus2+KgJMaOEsc=;
        b=oNUelS14cGOt6DHUh7lQGWTSHcc8CRTM0IKrpxBaAPFbMm5ICL673ovCPTx4MQBXzK
         lJWwqGqE1Ek7C60bG8AwlFMN2vqe3wzKw+WVoSmlqpQK0akZPQNvIqSrMMXkcu69FCK9
         ooB/tIgo6tCH5VwEHN0wkDmOM33xlzN+WFNBKvtwuz+Yw57t+Fk4YpRUT5DEOcF29ASP
         4TmZS5n25fAcvRhhFNppdmBLuf/3ysx0yhkswPwMY4Zg0gsgMnpL8Bso/BYkSRXLyqJ9
         I5gVMs38Jh3ApILedccRo/Zq/W5L9SuXI8NwPdignPWOjy1TGbdLwenX69GDMI/ocWTt
         X2IA==
X-Forwarded-Encrypted: i=1; AJvYcCVV9xFv7mcw3cCNBu1Z8swFS6ZM4g5DL+33jXRQkajzWClE0YeT14L8tk/sXgcWzy0betNwSPfnBR1+xk+n@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl/hC0QyIm/Meksjn7KamJf6AZMEx1lNWdnrgQgLCJhDvvWWrq
	S9twlEIRFMSgnfNOwT65P+BOthSRG4cY0ZB00bPZ7TGFLXRVzXjo+KnuVdI8D4nNfNM=
X-Gm-Gg: ASbGncuQ9j3CoF8cm/rs2tp6cCSNyAGDp6uexD2EetcNBea96gAEv2aed8HTfNQY6xP
	GnvpBOm0zT1GKYsoQgVz1NSHRl/wutvtoysXb6V+SYbkeSLRQ41Drp+gPiMrlQkhICbtErY9lTg
	cSPX37Z2MVZ/BIGDQOBpKVicFFcHdR3mvwjPHaivx7jcRaUkFQJTLDPB9+LV6szA1c92KBhECcK
	Ek5yUNw1XoJAEonqw1q3sgYEiKN5OpmJUoNE1UlIb7+MEchN/o4wAzWGpWRBeL65jXyRmEYbAQc
	whfhQcqnTpoNflhFyKNx97GPMiUz+sQVHywwKCxL3G/NaVO7jxWnuuDF6txLP1oY7c2v5Cd6jez
	xIMS6XUigtg6UrFHstfXEVjHA84P+IlJsPmSMVw==
X-Google-Smtp-Source: AGHT+IE98olllF50n/P1P+GEkLwCm1VNHU4/tQIHf/qa8FuDV/x8gbbK0X0a5GOq+jeMBdChlo6QLg==
X-Received: by 2002:a05:600c:3f18:b0:456:161c:3d77 with SMTP id 5b1f17b1804b1-45b54c306c8mr13475315e9.16.1755854945709;
        Fri, 22 Aug 2025 02:29:05 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:c671:531c:f2ff:2a7a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4e269d20sm33831805e9.2.2025.08.22.02.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 02:29:05 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Fri, 22 Aug 2025 11:28:53 +0200
Subject: [PATCH v2 02/10] arm64: dts: qcom: x1-asus-zenbook-a14: Add
 missing pinctrl for eDP HPD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-x1e80100-add-edp-hpd-v2-2-6310176239a6@linaro.org>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

Fixes: 6516961352a1 ("arm64: dts: qcom: Add support for X1-based Asus Zenbook A14")
Tested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>    # FHD OLED
Reviewed-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
index 16d045cf64c08c02c420787e000f4f45cfc2c6ff..76948160634fe8b3cd20aa02d6edd53b37be0689 100644
--- a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
@@ -1001,6 +1001,9 @@ &mdss_dp1_out {
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
+	pinctrl-0 = <&edp0_hpd_default>;
+	pinctrl-names = "default";
+
 	status = "okay";
 
 	aux-bus {

-- 
2.50.1


