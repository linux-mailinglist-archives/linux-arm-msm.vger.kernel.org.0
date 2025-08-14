Return-Path: <linux-arm-msm+bounces-69229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 533BAB267D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 15:44:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 569DD2A4C57
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 13:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726253090EA;
	Thu, 14 Aug 2025 13:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kVsCbUDH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4613074B5
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 13:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755178252; cv=none; b=TmKIw9r7iOrAHamastF4YsXyOdqEq6qGglgiS0Sd8UKM5msqUPcWX1/pFIiJ0kOJxlx4CX1hIdF73mpB33nFJ62oLo+i3FTB35jObYdyt4kSAV/KSywCFnUYkrViRCIi7YsAdSQeDOHnnLfuBl6n0Qkr/Qr+AW4scXhWyJ8KjkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755178252; c=relaxed/simple;
	bh=tscxYaT5sQKtzcTlzSXCHSFfEbjIy4+squBwe4MgATE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NELS2bvLCzv5K/5hhti2SFt9esFcntu3Abx7oTV4gVK3NoIahJb7kvMPyx9knOeGxwWETSqEhSkBxBy5wKU35OiiDVJ0s5m0o9L/zi1PzyVTVvZhTUq+cZUU6M/sCc13ACw8cu22ZkOeCqZTSTZp0C82qrCLXBu6YOHzpz1xIHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kVsCbUDH; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45a1b0b6ac4so4563765e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 06:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755178249; x=1755783049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MzNjOlUyysYS3PhHwof1q4yQf+nXA8uaGo+GPuNkhNQ=;
        b=kVsCbUDHD9241vQe3ReAqxtBsn4iV2pfnvEEWECDT5VcEnFXSzUIbvz+2Es7P+XMRp
         YdLsdAeiL+6BhF4MlP4phqhfSMzkkAFZL+FLhYGyzvBDQ8yjFdiL73/1ICIilxB81lQL
         ZyHy8vv8ULFV8tr0SXeJ77mB86z/ol6DgLucFIbKwbxP1Z5JePQp/tGsPcoMA5Q6e6e8
         ahnsaSi8C45D33+qBK8lDs1UgVRvOmcN5YoqW4cm66LNNPjCfxOLKihTF6GzXoH053q2
         EWUbakpdd2TOgsa8P45YVYgxwYD/x5SIZ1g5MYgpRDCYd0S2g5jnsokczUgbPiKKTPKr
         JxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755178249; x=1755783049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzNjOlUyysYS3PhHwof1q4yQf+nXA8uaGo+GPuNkhNQ=;
        b=juuWIGrHXwzhOueebfoSShvP1IOAhj6MWyy1rXYb7PIBPhmBtLk7ZwWTZ1hWzO/Aez
         dXusKeCCSS0e1ooFgenbESeaEsE2Lh+SFKtYnGnJH+A+qi1kbF2ohZ2sIhVxoSJbu9eu
         GRLt0sh/wdDBStV8d/qLl3yJPj23St7EbO6p5ilMy0SBKIwle7bBBZ90Qd2NbFAxw3+W
         ZJExaqHA5FlKPcJXWN7OV636rDuPXrkWVfTCpj1AIe21LSq3uYSkKO98f9mb9LkRk+Ln
         aUIRnJwJoJ15EfUfqFtonf9OJGZjSEjbAKwv8jHJtDVRa498SbyoeertgmeUvIUfO9Xg
         DjVg==
X-Forwarded-Encrypted: i=1; AJvYcCU9mpRNPS0tHS/NG/1J+binaUxZlzSSVr5NG8TKvskG8PAZHMpP7SRWddm5qBcmhJeGwSb35QFUuZ8XVpJW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+rPUGmTHyJdXKB/D1WPq2sQQh7r+AqPkQuc0HqgryhQjIJ4bY
	b/3PdJqmdSxUoFKmsF2LkwWfovqwGlLOvDo27Dr1f5abEnh5AGPfaH+u4Op992/aDYvCsthu2pH
	NLDs7
X-Gm-Gg: ASbGncsCgvvHeML3aJoHZIZS2ecez/grkzgCfbnQ+TjM7SzDXD+QlgjKu5duWsh4kfB
	morcCYoaC0vraN+tNfL3fdl0gHn4jw//x7Ro6mZ4iVuoP70VrsgyhT7CJClwT8M4gmGzxf4T6Is
	YhlqTLJ+CX3nguR+XoenSx+0cFTN/RL4yhp5MnwsCAYKK/bo6e6vS8KgG1wyQkOBkxGKGeEul09
	GHZvJkRiETFJfHFcOWs/Ynj59t8kijhy4Uj1MYrT013sYssKUWx13QD99mADUIHLsM/A0sAGUsZ
	9kw+RASLDfSxFoVHZf0/ZjZKB57hA1e2QJJWPD2upzntyijMw/PAh4X1eT/aWse5IKfHWIiHo7j
	dA8g/v1bBYjvtbyl4UDKyLBHBKsp1Fbwm0frC
X-Google-Smtp-Source: AGHT+IEIcfJCRbuIKrMKbYAGTbkrNvpfBWo/E/Vya9pNleHIQWRDX1hsaRNlAs/0t1QyLv3P6Cp9TA==
X-Received: by 2002:a05:600c:548f:b0:459:e398:ed80 with SMTP id 5b1f17b1804b1-45a1b66adbdmr22545165e9.32.1755178248798;
        Thu, 14 Aug 2025 06:30:48 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:9c1:e029:fc81:a800])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bc85csm21468385e9.5.2025.08.14.06.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 06:30:48 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Thu, 14 Aug 2025 15:30:35 +0200
Subject: [PATCH 8/9] arm64: dts: qcom: x1e80100-microsoft-romulus: Add
 missing pinctrl for eDP HPD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-x1e80100-add-edp-hpd-v1-8-a52804db53f6@linaro.org>
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

Fixes: 09d77be56093 ("arm64: dts: qcom: Add support for X1-based Surface Laptop 7 devices")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 27dd5e4e9939124360544ee9c59900ebb01f3f49..688db57a472844fccb143c45ecf66155477286bf 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -965,6 +965,9 @@ &mdss_dp1_out {
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
+	pinctrl-0 = <&edp_hpd_default>;
+	pinctrl-names = "default";
+
 	status = "okay";
 
 	aux-bus {
@@ -1207,6 +1210,12 @@ &tlmm {
 	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	edp_hpd_default: edp-hpd-default-state {
+		pins = "gpio119";
+		function = "edp0_hot";
+		bias-disable;
+	};
+
 	hall_int_n_default: hall-int-n-state {
 		pins = "gpio2";
 		function = "gpio";

-- 
2.50.1


