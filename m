Return-Path: <linux-arm-msm+bounces-70314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA94B31367
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31B075C300E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B54F2F90CC;
	Fri, 22 Aug 2025 09:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C7Ix0ue+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108BA2F7442
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854954; cv=none; b=jww75BnozMGBgW6FheCQCtp0FTdWp49UM7e3mEadfdIALQfuO3lIGLZ5FzbHuPyBkKqw4gkk2Ue3O7wlyWA24m7g+LiLdAZewn6/juNL7Bb8cra5yGHk3EmbSdVsAATwovj1MeVqV2qyAq6PVdBvLQqam/fMcAKuwxZ0+02Q9eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854954; c=relaxed/simple;
	bh=ERNuIZkN5ATFt8ONMED+YutJLbS4r77RLXsvAo5QFc8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YcR3OaDXIDyoAPEcXr4EMVAGD332Ze3d6XFMhv9Px3e/ofHKUfzk1wdXZU4B3AwG32YNHET0ObC5mNNkx3yJpBZM8pjJTeTSb0/PNYNwmUrA4+PhR+h+lqY0Azl4BpL13gdxvEKpZ1x9caBKhwKtID8fb+FR4s8wVmrNDL9OKfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C7Ix0ue+; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3c6743a10e3so165762f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 02:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755854950; x=1756459750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x25HpmMhtyzw4pSPQqFnXsxEXCCiKqiHTLmj/iokeBk=;
        b=C7Ix0ue+dS4i7g2mrJjIRXeIZBrgiZrYs7z80KbMdab+q+WQL8L/svGaH56vFn7X00
         gL+FUHFV+zPjnDRZfSNaJleUsJsz2JxZU2hQlB4hg6aF+KugcS2jBNAJSchL/BCE5V21
         hyRsh2Utghj5jIRfYCNnFhcx8YtBWDTf/1LhkdMwq5SdNxb1L9U2mEfQpkgbt/q5klYM
         YinVsDNo9gU8ELMgFH/Q3Crsn5Nosa6FEztNAtJWlcND2stLu1eInhk2z+1iDtvlzlXj
         MN+oEU53ESvgyEVPfQhVIJwSjoWV8zn5LFeVArHXpLe8LKFxxB4DDzoizovLPYcwv9ya
         kA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755854950; x=1756459750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x25HpmMhtyzw4pSPQqFnXsxEXCCiKqiHTLmj/iokeBk=;
        b=mW5vqe6N1YbdlyEaE1+BuPUdvR03MD+3gfeC/PjSPv4T5IGt/gUCWZKU8G1c2IQnH/
         nYASye0YIRxbbJj66vG4pmJjROw3QbbJ9X7IYhA0A1qkNGMxyScPvdf5tzgRajwcyUno
         Rw7gLattbdVa+LjdPwXagbuqpv8OnK582pnDWbmznCvk16oQKRQsVHKlMmhBGeBzd7QI
         /AuCcsh5aRby0xhRNJup9bKjfjQ4kADzzXJt1zsmjA3/jrF/no0fvTKpI0Nh8986zSFQ
         NP4Fwd1AMLjrSp8ANRpNuCsnj6/SBda3GKzjn8RgOlwE/PPEX8K80gBgZ6GEN7P5PmqC
         K6mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmQ4q81yH/8xWzhqodKAmpGmWAA9K7mtA8qBbhI7NVdtg1w20HdVx9DRibWjjowFN7PcdE10PJwO2aGu9G@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0eHN0jKNyCigsqjUeuRqQWWAV3HamqOB4ADK6GSo0RDGEGp0X
	xEMEP7dMEiu6kz0fx5nYs3rypITBjwzoR0K5yFbup282gsvWLDWqyuz+A16KMi638Jg=
X-Gm-Gg: ASbGnctY3BO/L3ACTOKZXcXIp7pskMhlEGVSrjglfzNuu2GpvLSbRsvSdLtgx0rV9ck
	PpK5geUcDBAs33feolUt5b29hMcMoN3LtVSRfglpERe0MCN2LySxJLzsJoM7Mt8d98BPXQNFWFG
	1mJSS5XBRkNL3/G4D7pT0bHi2PXtZN1dAXF1r7sC9IqoSFTCwsP7jm2QvYoSpp+foDhkQwRC90n
	rfwvLc+nnGvpmOFwhi0Fyvdqvg0wNLyGzTyVPRIhAtjMdRaTl4B++/QHNL/LhHZZpH/EI7gpuxG
	8f2ltpG30i1mkjONceErvxkUkaliyVXCRTFnwMZc+aAvxQw68lcawOJloTeX7JtrIQwoo7MJ5FY
	QwYaq3Rg8YVmjqcy+Cu1g2Tibl/ad/OCa3hr27L7fkCIqETOl
X-Google-Smtp-Source: AGHT+IFo9o0397QP0rIc9HSMi+53dF00Js7QjeIiFJ6298UmkDNi9xmJ0KwXYDGqcFOg+7NrqZQ2zQ==
X-Received: by 2002:a5d:64c8:0:b0:3a5:3b93:be4b with SMTP id ffacd0b85a97d-3c5dac1aad1mr1434196f8f.25.1755854950063;
        Fri, 22 Aug 2025 02:29:10 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:c671:531c:f2ff:2a7a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4e269d20sm33831805e9.2.2025.08.22.02.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 02:29:09 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Fri, 22 Aug 2025 11:28:57 +0200
Subject: [PATCH v2 06/10] arm64: dts: qcom: x1e80100-dell-xps13-9345: Add
 missing pinctrl for eDP HPD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-x1e80100-add-edp-hpd-v2-6-6310176239a6@linaro.org>
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

Fixes: f5b788d0e8cd ("arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345")
Tested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>    # 3K OLED
Reviewed-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index 6b27067f0be66b5c41fa681ff3b4f535100bdf59..eb87164fb15a50fb9190706fae8225fb3a26bd08 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -900,6 +900,9 @@ &mdss_dp1_out {
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
+	pinctrl-0 = <&edp0_hpd_default>;
+	pinctrl-names = "default";
+
 	status = "okay";
 
 	aux-bus {

-- 
2.50.1


