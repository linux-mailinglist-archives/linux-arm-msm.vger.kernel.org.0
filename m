Return-Path: <linux-arm-msm+bounces-69223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 138C5B267C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 15:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D29E7261BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 13:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E0F305E0B;
	Thu, 14 Aug 2025 13:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jmjgw3q7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DB83019C9
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 13:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755178246; cv=none; b=GM2sOeNLlq/6JW3vm93IEi/yNY1ONHdqy7qtlWL1Z1fUZ7qeN3dxhP1+BVAL50uA1jURHmlN9ttzmyQ9zRqOt+REJnFp6YyHr0ALI4TGJXqB2w47ypseDRKSpngP6Yb01Up6D5Z+KBU3Q3P0PW0kB4eLL3W7ne/m8EUTWFtKJ5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755178246; c=relaxed/simple;
	bh=hAR+vSBoqbUevtG2jIAWEfME4wANe06aDr98BAB5U7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZCDOebA6MH8LCU+P3pahaY6uWiP0rhnjS0bAfP4GN8VIbkwkwKjTb7w35hKEivDgczG8rI0kMKP9cF4RYkTvzWUu2JgZp4Xymgs/1vXSWgD1ec/9LEVE10Jqu/Cam8OZ9tZyElHKoHZSoNpTAZzlC6uE3BlzN3gLwyin8dO9I+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jmjgw3q7; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45a15f1a073so11078335e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 06:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755178242; x=1755783042; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sERMGMt7J6k6rVfJYMtXEplUCG34cmz1p7gmiNqxYd4=;
        b=jmjgw3q7kUbWXTMPnKlsxDhrQVCBDaRUwOYyFrCt0JBTci/k9fcKXfuV4Pyk6dJz+4
         zHaiOqjOr1yFk8kkA2reHviZ+eqIEIt3C1ETYFZ+Vb9H1ZrsLrpV+ZBl9LueFhSBZZxn
         qhJGrGBDs399bUmsAOUkHWK2B1jhPZPm1x6nWHSR5TNHzInU85nySzLIY2TIigiso0JF
         kysRMAOLKLKfa6qowQbXCxBO0rTQtGVg2RxixGSi7AsQbEit6Rb+kBg8c6oFnQpUbw/8
         NhmPTEixIeb/ihstSvYSCQzdmnmvBbrcRs2I9SffgECT/JafMorkJStO2ZdqIuRYfpz8
         yMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755178242; x=1755783042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sERMGMt7J6k6rVfJYMtXEplUCG34cmz1p7gmiNqxYd4=;
        b=wZhKKE/e625mTTr67CzN8LltNP6pGVrESNSKsjufF4qiBwZW9ilfYrBgkuqNXe8j6d
         aTkwRPhCxQl1hp+nvUo5RmXOu3Egdk5Qf3VbVQK4S8SjV9JRRe3U5yOxUSZ3X8hoat2d
         b2KdGn8vma4N5W15HST4bFO3BR3H360AIUfTqM27QyfZ4oV1HREAYd42e95jtLID2k5i
         Gyhs6TcP6N+TrkhPvpOf9YblzPn9S9kZ2ChXV3NjFCcc8KQsXMFzNUhdIJYAWDaxHFvS
         V8X9KJw42nqP+S+tXuyQPGSQflUZiDIDYXhCe5SjegoQYKZZmOvLzfuEEw8Pntff5lvx
         +0ug==
X-Forwarded-Encrypted: i=1; AJvYcCWTROFbkuJI+SXQVmb2u+uL899WqCbWR4YZGrTvH+hxfJ5IAhtIx41ahwpBclXZpDmxpYiYV9KNzz0QHxV4@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc3vpFbVGtXuTBZMkJH221N+ebIWmph4Jh7HvOPTuHlz3lWPJh
	O8VvGlNMoJFqMQEqoGD6lEzHHYx2Ae6Q/N0Qe7syQfSMeaYXvUOCvmqDwyE5/Pe073A=
X-Gm-Gg: ASbGncuHJHUmTtuKMmwSYe8i1KVQgbr4Ur8zpe0oEdPl1Eo5C8Xw0NsNloq8JIAPG+e
	1Qcot6KXU87dbSESgTuTaJ+Ehb6WdsjKAAlWBZsBHHrJFK4HApQIGEoheUUv+STdXURwuYHSzWS
	W3BTsf9b0LslDRUfbfNdLCaBC7duexobd3z/76Hb0Ogp39lxuyw7RUd3T4aIzNHfY5uK1AGSx4+
	DKL+9B0GOsUIabxflvBMOJbFfJpLPQNEkcuY2UB2e/KNMbehcuLb2kzzujKIyzBgQPDwqvFmExl
	GxnJusAq2xfeG6CLuioWFM6rmBUba3yQBTtCJomiaLsmHjLg+7kcGN4cFTmEeGXoXnlLo7dMmfR
	yOUgB5ZdVG6+xyXiOWH9Dn7AA0rB2+BbvDHYK
X-Google-Smtp-Source: AGHT+IHW00HyCrS01FWvwq7ztkHXBvyQSF5YDzaWirCjwrXHf753N5vWfcIrsup4+4mmpuqcsU/ZZA==
X-Received: by 2002:a05:600c:1c08:b0:456:1281:f8dd with SMTP id 5b1f17b1804b1-45a1d52d0fbmr17310825e9.12.1755178242208;
        Thu, 14 Aug 2025 06:30:42 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:9c1:e029:fc81:a800])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bc85csm21468385e9.5.2025.08.14.06.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 06:30:41 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Thu, 14 Aug 2025 15:30:29 +0200
Subject: [PATCH 2/9] arm64: dts: qcom: x1-crd: Add missing pinctrl for eDP
 HPD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-x1e80100-add-edp-hpd-v1-2-a52804db53f6@linaro.org>
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

Fixes: d7e03cce0400 ("arm64: dts: qcom: x1e80100-crd: Enable more support")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index e3d2fc342bd184473b37882f3bc4f9c4d23135bd..26b7930070265ddad07cee08b63b21ab3ee9c0b7 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1174,6 +1174,9 @@ &mdss_dp2_out {
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
+	pinctrl-0 = <&edp_hpd_default>;
+	pinctrl-names = "default";
+
 	status = "okay";
 
 	aux-bus {
@@ -1478,6 +1481,12 @@ &tlmm {
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


