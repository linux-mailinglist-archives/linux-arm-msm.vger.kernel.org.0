Return-Path: <linux-arm-msm+bounces-69226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A76EEB26774
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 15:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30CCF7A2742
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 13:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF58306D5F;
	Thu, 14 Aug 2025 13:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i4i8TAcT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3CD305E3C
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 13:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755178249; cv=none; b=qqCPWvs37md2LqGg688dIxpM0N4Lep6/+4cX2Dc/Rvb6GewF24gKsxRhy4gJOhn/eee/JvB1LLPBCKl3z+6rd6FLmSsPwlxrs6Lsv5s8L1BdAb+AFFBEVmjmjxnm5DSVryqjGRvB9LCkayhnvVNXSeI1hCv4tQ29k6vDgcjjbAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755178249; c=relaxed/simple;
	bh=znQ7gVSuwvaFmfXTJN2s7CZyHtnz0WIQh+xOOE8QsFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OQS5So8A1hFyDl79Mt1IMXwiJM7L4YqSAg/BqBAf5fVPrmDSRH9k3fZwre6LPI/KfYfXkWTGpFm9TzQ6TQ3LYp/Dp9eWHUCJivvpKIfo+DvzJoapd/YiVpBSOp2tOiE1DC5NgFPsB8qD4V0Fh9I9hhkmlwYgPM9XTXaSj6CJHcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i4i8TAcT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45a1b0d224dso4908665e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 06:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755178246; x=1755783046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0cwBy6Ky9emn6674S7HsQ1ClNw2fn2tkOaPVrQns16Y=;
        b=i4i8TAcTm/yBBu9WfQAjttHHt225kn0EhEmpXTds34xcG2FrUeSKtXi0yfjvbn6Qwv
         4hH4gCEm4L84OeI4D735R9XYg8Q6PfQr9LltAQxieCi7dVrmPKKkPvt91Z0/ToW1e6xY
         ZBX5yd/Yh4FFQ7ZAQ3X+oSbobwqV+MDQq+yNLQOKNj03J0aaSqcjQjNYvNirRwtoH0Vc
         DfXX7vpqb3K8Jly5/UZDGIKMUUJ3Qp5N9dKaD4BbIsbsvH+4gbft7hbT5FC5+O5a5U2O
         0S4w/JhxGcnpfJElZlJiyWfQD2aEFTXZKilSoostuhZHbq3rir+Ac2CJpUWN3EQzRxCF
         T8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755178246; x=1755783046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0cwBy6Ky9emn6674S7HsQ1ClNw2fn2tkOaPVrQns16Y=;
        b=IQglHNX3pwEw0yycNYmbr4USDxOttoIASqWrTiXuImcS9jqE6DKmh7DY262dTaVZLo
         qtrzNITEXvm81hXQsbnEmVQu5T/aaNmvABm5PINliFMQI92tL0F2fDiPzsNqx1Sp7zf/
         olcVI8FA84VxKo2g+rx5UoUnafq8TZ4PgpxXt18EnOxe/70djoXiLJ1NX1e+Xji1Se2k
         OZVfUrNxoEel18ftGgHeD5WUBvikiJcIimHAf6APG3r3pBa+6BC02lwy8UeFAp3xBC4V
         yNnTLO86ghSdZ5jj8EKmE2Vj46MVYE1vq+2/ktodL2eyP5H5lwsDLQY/ah8V6B+eY9Ej
         PXnA==
X-Forwarded-Encrypted: i=1; AJvYcCWModWz9op0cY2t5McJTX1i3SehLK25WmEczYvw/fkDhtW1TmWeSSguXqmSM+lnkeNNLWZPFk93vjZu6E5x@vger.kernel.org
X-Gm-Message-State: AOJu0YyAaIkn3xoMPrVLz19hYLHcA2yv2uOBwjs1z8HB1/l1mT4U6qfs
	OuwJZh5lKBLNW5eHIIZc729/rXgthyKMNePWxJA39yKBGflZNfc8WX6Q4dHHFlvyGNU=
X-Gm-Gg: ASbGncsXv2HX8SVp20BmXu8/HO2R5lvMKdjHbpBuNct4jjVXiK8hMk34i3zaqtoS81d
	q5MSrpKpKYAE2v969aIb5M1/TdT2goGnN+TTVd0nLcewAHOLSEHXcMdXtBZeld0Sej7Ryr/Iwdb
	kFWiFYT8EAd5CJp8dUnOaUuo2rIegpmuh0ylAURLv2oxuavw/eIcjUqxPwr8cQBgJNSeoG3f2n/
	cY6aBjtXQlWyLYm06KhDs58RJZFPduvl8H64R397v7a7ZoBpYRO4BxjlKimWJUN6IwfmM4/8+Nk
	+NUoP021FwV1TpgeQLbtHopU/crJaVax8h83rjYndSqkPCPUJtv4t3jhxJpxG845gKddKORaJSe
	J0Zn3/pkQcBFNPoqjAxgb4rewJ3Mzlrv38pey
X-Google-Smtp-Source: AGHT+IETd818n3b8dsIfDRA2rMYZ4tfdJVXGsvoq1dwVvSh2Aexkw7PjMywYOPDX61Ol3IkavJaK2w==
X-Received: by 2002:a05:600c:5309:b0:459:db69:56bd with SMTP id 5b1f17b1804b1-45a1b74882cmr24060075e9.20.1755178245701;
        Thu, 14 Aug 2025 06:30:45 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:9c1:e029:fc81:a800])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bc85csm21468385e9.5.2025.08.14.06.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 06:30:45 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Thu, 14 Aug 2025 15:30:32 +0200
Subject: [PATCH 5/9] arm64: dts: qcom: x1e80100-dell-xps13-9345: Add
 missing pinctrl for eDP HPD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-x1e80100-add-edp-hpd-v1-5-a52804db53f6@linaro.org>
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

Fixes: f5b788d0e8cd ("arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index 6b27067f0be66b5c41fa681ff3b4f535100bdf59..6cb98197eb9c0d6e171741aa83e7f4ff77e911c9 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -900,6 +900,9 @@ &mdss_dp1_out {
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
+	pinctrl-0 = <&edp_hpd_default>;
+	pinctrl-names = "default";
+
 	status = "okay";
 
 	aux-bus {
@@ -1080,6 +1083,12 @@ edp_bl_en: edp-bl-en-state {
 		bias-disable;
 	};
 
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


