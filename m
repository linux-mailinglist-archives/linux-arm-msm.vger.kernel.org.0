Return-Path: <linux-arm-msm+bounces-70309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E235B31344
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:35:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE6141D202AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4288C2F6170;
	Fri, 22 Aug 2025 09:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H/JnkB0G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D742EF673
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854948; cv=none; b=BrmwAB7CGPQVYm/vag3gEDpXBTLKI7gm5WPdXypSeukOX40SxWt4vOElQaEIirEVdviOBVglIybemY0i1hh6SY6QKfZ1+tavfd77t93mJO21Nppg/EdTx5EWd+OGRyv3/uRoq5bdHe1SuOD9uOAwAJsmbd8T4/MSgPO71jkbFBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854948; c=relaxed/simple;
	bh=vBMNvMwlW7o6o1xWYoJMdECi7yJZhAi5LiYcGyrWEuM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QJx5XGORCXgx9wvjkx4GZEwlZhCTejCZ7QzGD0AnNajBfqQi/6EkHG27p84x7Z4C0GN+WGRvipMglDpnkfYNar63prUnWiN+CEdilzdCfMOI5ON1ONPTZ19PUg2A9Wgzrd9MtXcxZQLN8VOBU8FGlSONH8fSgfoq+yv/WDdEPkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H/JnkB0G; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45a1b0c52f3so11383885e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 02:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755854945; x=1756459745; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DhkWbjoA7TQSL+zMe08xDLYt0I1Xn87bnNUqz6iscfw=;
        b=H/JnkB0GGHord41cjygWW2Y0MGaWUyXT814aDH7P/e81/E+/pbhACdkkKAsTTRYQ/G
         efFA9Z2jcA1aNEHsY4j1HagiQwK4AmA90VFN/3LRURYRefpMKCpusKpuaZQ8g9TGlCEF
         Qz0Qt6JmkgIB0YAxQ6vivlnOnXC62UOuk3UXVYefAmFtW0jHWfAMK9Hl+zLllwZMH7Mm
         lCOj1zxEtumbpBAyCvGR1fmRGllqKcaBXauK+evpUcCE3eIGgxFv+OcfqecQ00T24mi3
         8kpQpk3kIJCuST7fdL2w48elsx4BkFZhNkbBgzALHlRrvmKZClBX4XQ/FILF6E9GUY7G
         pm7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755854945; x=1756459745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DhkWbjoA7TQSL+zMe08xDLYt0I1Xn87bnNUqz6iscfw=;
        b=aBwRvZAyox8ttqJCpb6QhlpwxmBzztkb7JVHj3w4RhCwitRwyz9y1cMdwoIkkUYJ0m
         CFSDmww2n+2yluwR8c1Co2upCTlVFgbtkbdb7fHIpupXNKmXw5yY2ef5oYdGnLtYLXgk
         M4RICI99VuK3AtFlz/McMulnDRV190WYP/V/NYQFb/XVtaoZi1YW6GIozQQ0yoo3dLvV
         qUFAjvmU2cjlYxGTNzAqZ9FX/GZ8r51xiclpEM6X5SaUhWr3qkUpCC4HBtrL+cK6WPPp
         mMkfoGedce2PCn0brbHmC3XwPLcCSC95kjKtbuI9+VeANkqFyJuRvsXMIOk+5t3JFCoN
         pidQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDg523EhtvD+63zCIba64vQIVBFiJNieYwgegQnv+xwjcZRMX0bQ8PyNSSUN45x881vCr9Qa0RkUUNgGhv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9vXd9DjjaMLrQAuk4kExVbXcGIzFaR13gD4rP3/OuOZM7AlGl
	uPK6W4bj0e9L/MX4CkQSGo29TG41ZbHetGV9RUizLB0+/ZeyPWHVCl54aBBe2Yz7u3Y=
X-Gm-Gg: ASbGncu41d2h6iwhs2WuhpLaFDoene1PLJHhpjvpoQm87TUo58gndooE+H2J28+zZE/
	VSEQrKQi2PdAWlEJjAwvr6cBxpZpl3eTj120bo+FwJiUvC5gwl+xsPBrb4tSAQOlS3tMLQ4T08A
	Js6RfubEtZ2BoQR7ZZWQQv+yd5Noa+mMizpJHwXxw4fX9Flavq+yZz0E98ozSz/7BMjY5ccUvuG
	5dmLIjW5kU9jdlOusTB2M5Sv0WrCHHSvCUSRpCO7O3EojE/y/+9uMlN9T7DESMybGtjsNUS6ppM
	4bYT5Gy9qoxFX5/HY2X6/+nqvKYVOF9+ae+p1w0oCPVMsdUSCuhtiWHmQs3bEj42BPwOpItw4ck
	L77XROhUoFXWWrN2ikX8zw+WEXrCWUmcViLJDsA==
X-Google-Smtp-Source: AGHT+IE6Rfg8U+FIj6zpFxhGKTsfkPpD/3AuuxhXFzsGfi41Oqhra93t2reI6lzi/1xZXfxdbdZ24Q==
X-Received: by 2002:a05:600c:350c:b0:45b:47e1:ef7a with SMTP id 5b1f17b1804b1-45b517ddc35mr16587355e9.37.1755854944641;
        Fri, 22 Aug 2025 02:29:04 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:c671:531c:f2ff:2a7a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4e269d20sm33831805e9.2.2025.08.22.02.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 02:29:04 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Fri, 22 Aug 2025 11:28:52 +0200
Subject: [PATCH v2 01/10] arm64: dts: qcom: x1e80100: Add pinctrl template
 for eDP0 HPD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-x1e80100-add-edp-hpd-v2-1-6310176239a6@linaro.org>
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

Add a new &edp0_hpd_default pinctrl template that can be used by boards to
set up the eDP HPD pin correctly. All boards upstream so far need the same
configuration; if a board needs a different configuration it can just avoid
using this template and define a custom one in the board DT.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index f293b13ecc0ce426661187ac793f147d12434fcb..32fa9fa6fb946c4933f74fd0ee820ecb9284901e 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5808,6 +5808,12 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 239>;
 			wakeup-parent = <&pdc>;
 
+			edp0_hpd_default: edp0-hpd-default-state {
+				pins = "gpio119";
+				function = "edp0_hot";
+				bias-disable;
+			};
+
 			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio0", "gpio1";

-- 
2.50.1


