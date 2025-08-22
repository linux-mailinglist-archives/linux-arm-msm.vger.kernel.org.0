Return-Path: <linux-arm-msm+bounces-70316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 482C1B3135C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:37:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBE5B1D02235
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F822FB610;
	Fri, 22 Aug 2025 09:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="szeGgYJq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F092E54A8
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854957; cv=none; b=fy+XHLEPUR9aJCaZiKBiKgGl43I2Y8hExmXrEN/51tIK3KCCYWb+r6rSn5XIx52DNevRNjfAv4AisPWPiEEyj3lyvZCHlqaRw5H48OCSVjNAfQf1mhLsXdkTgSKjBLaiTpfd8nv4n+2ipLTOUaRy4lc74lcwdYXs/nUg9WfYKfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854957; c=relaxed/simple;
	bh=Rwl3keab6dYN71rlxvDljxrLoKkL2YyXODsnH0TLinQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SAdcOVxzPnJ4UADK+qXqyHrYs20OvFmmIdlBgOIDuUCkoL6VUST/yKJA7CWKwi0uhtjlbGb0Rxv8y3UhcYASXxsPQDB5K6IhB8mRVqbAw1DCYGNEOk93iLEoTu9YIsuWJoTIdKwMhSqmxY6kbKc5LilVy2ZvePuPkGErzj8dYT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=szeGgYJq; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45a1b00e4a1so15481465e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 02:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755854953; x=1756459753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2wdWpsB0si2Kfd4ndZEy2yHC7zYJNQ1wIqtMcCz02iM=;
        b=szeGgYJqiUL0eDn/kzZmGXdUFbC5BXMmxTiEBvWUnJv1A336GMIL1VnG9d+FB0DYLF
         G6bbCh1Hk7UVEhEZG8z74sRlZ6XX5vQzq4fopaGRT8zYAlGmsKrSmcAvWivKdrN4l1l6
         f046QpxEgk8kfsea8HKnwjlfQe9FPQ6x9Gg1J1EC6Erm7FyU9Op+epNu+pah7No/x1Rt
         PcfZKpZB5riCVRoCWZMQs7jOUlrTipoR3m5YEnjX1vVjGs88+dM7XKvRsrvw/HtBGLzm
         FN/puv/0pD9niX/LHKCYKO1QDdcZsMyMUWwCepSbyDs4Z0BkFvyBRmijRa3B52lUN5RE
         kgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755854953; x=1756459753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2wdWpsB0si2Kfd4ndZEy2yHC7zYJNQ1wIqtMcCz02iM=;
        b=lviKFc0fVAi6OZHnwvDO1OJZYyXwq0xVwPHd1jFWcaruPYWSDIp9hIHcqjHXJCZNxh
         uiolmrNM46bl1P4JSmYxRFtExgJTJOmq0LMhDNEOmIty4fFJjcwyR3+TLzf9AJTJBgqZ
         gs5VZursCj98UB0xgn42AznbS2Vd1DT4VAn8q+xboOvveudriiFduwfuVJFH/Npwaua5
         kTz6B0C3mU8DYxJrtrtUVX+TbRn3rNNqoSFBb4JrssYiKja7xseLUV7wvIfgT6tKqJw6
         a5IZewZUj8bqD2pgiilRcAgG3OleHVJy5EmhMghsA5NzORhj7NhFsBSR/SLLVK4X+6Lv
         oqRg==
X-Forwarded-Encrypted: i=1; AJvYcCXMZ508Jm6rfaT81rYt2UqksxvRz6l5Cc+eYqHT3fD2adIh46R7TM+Q/EyPGO2tEUkCh5fnp96FNVsVO6Rf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/AIWVxWV8yG/sFr+45mlC0NqWs1j2bI1xGseyMKm8eR4HGbjc
	TjdXZhIyc2SDnLLzxpJIZU7bxezsVQnTAe+iWL002huQ+VqUXATWpEcR6J80zVhOVWA=
X-Gm-Gg: ASbGncsxSpJXp3AEtnbZo0Vu8AgG/Lr2E3BLc0N04Dvi3o2i5W9IBzdVPFbU9J165Ho
	Wtv0jcKUyRMz0SpAAdbK6afK1uwzm0cZPBGRjVQkUZx0m135Nte6+T84h0x2PhDGHuDRUF6ah8Z
	m23iJrSHomlzUQaArplJh0zocuKYjQ/Pf/8L4crkXC8wzDTOc1zILc6pPBygTAzTPM6EMwmni5q
	YoAiOZvpHsfLQpbor/CrZBsf6Gk3aBohMjJGxwUUF4OKUDd1bOTBF7tCxQI/wosdrKlbrEdLCfj
	byXqqo2x9SxsEgIergXoagpJNuWQuDJhZuBDF9jAvqh0f71QiKiACrwj7c2iUCoENdOCvaYTpbX
	+Envep0s57qtQIaoDSfqUgXgya8UAC8xsMmG9KDDSg8zdEd9Y
X-Google-Smtp-Source: AGHT+IFXI7Ix91fHfWyNJxLAbc2IehV1gaOfTrq/sbg2co87gcQLY5GTNPxxzCKw3j8LGkFtPcmykA==
X-Received: by 2002:a05:600c:46d3:b0:459:dde3:1a56 with SMTP id 5b1f17b1804b1-45b517d2ab6mr17674865e9.28.1755854953263;
        Fri, 22 Aug 2025 02:29:13 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:c671:531c:f2ff:2a7a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4e269d20sm33831805e9.2.2025.08.22.02.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 02:29:12 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Fri, 22 Aug 2025 11:29:00 +0200
Subject: [PATCH v2 09/10] arm64: dts: qcom: x1e80100-microsoft-romulus: Add
 missing pinctrl for eDP HPD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-x1e80100-add-edp-hpd-v2-9-6310176239a6@linaro.org>
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

Fixes: 09d77be56093 ("arm64: dts: qcom: Add support for X1-based Surface Laptop 7 devices")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 27dd5e4e9939124360544ee9c59900ebb01f3f49..f4ae0f4623a5fbc85932a879473399870a49c35e 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -965,6 +965,9 @@ &mdss_dp1_out {
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
+	pinctrl-0 = <&edp0_hpd_default>;
+	pinctrl-names = "default";
+
 	status = "okay";
 
 	aux-bus {

-- 
2.50.1


