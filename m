Return-Path: <linux-arm-msm+bounces-70318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C45B31365
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:38:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66F831C2591A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24EC82FB975;
	Fri, 22 Aug 2025 09:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SBx4KPp7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123A62FABEE
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854958; cv=none; b=drAqiGXPRhIuX2U460jhVJGVVVX3J5C2/jUV7b0cXL+OAlZY2mRumwb6TkLAI3/BoSCMTsC8HhddpmlueH9Wl8r9MIKPlUp0gNPBa+/8V78gdigRi++egCt3QAir0+Q4As4WCsaSiB1VjQKinsvISfsSZbzuM2LHTS42XLxBTqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854958; c=relaxed/simple;
	bh=QUt0+UycE3l2L7m5spe6S0KqFj7nRto3yM8Pu7JHGtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AsBnDqU4sKB/d48IdoFbLajt1jTdW+/5+xWps4+Jv4eLiLZvTgo+GKjGtsEf9kqTzYHvDo70e5I9UMa4d8zMtYrvzSAQePvRmJekuygkCh941mo8VXseMxkDN80uCDEVWQwcN765dsfPnuhtSo0CzfOb20C80Nk8AJC1+6aB7vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SBx4KPp7; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b9e4148134so1212251f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 02:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755854954; x=1756459754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=482U6L1exn0T0v/WP+eBHc4UYIMx1Rf/qRIRSNFyPxM=;
        b=SBx4KPp7ybUy5U/MY0d/Ug7czgPB5ZwifJ2LugC2hdVvvsulzZENrNYy58wFID/sXa
         sLWuqLPL9f/d48rtqIGuBPaKrWEQ7dYn2sddbv1BwKXRQQlVEXxN0/11QpioAKqxZ3Ch
         CYJPo6ECNLeU0lXPuHvRZk9UCR2/PMsxnUO0Bl1F4ZzYk65UL9r4cQn3MnxVoviVzkId
         o5gCWDBCx0pvAB9wbdwzR2WJcq/wEQZHJZgRVehTxNpwZkSC8PyfT0zaONs8xRrWZFV6
         bHl2KJR2+xZ1NO4ljMUcGYtgILXnmBgycr91oqurmhz1jdZl9jfD/zSyX6rWumrQJDDC
         x7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755854954; x=1756459754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=482U6L1exn0T0v/WP+eBHc4UYIMx1Rf/qRIRSNFyPxM=;
        b=D++d8PSdrUYKbHrp9ax9G3fsER0n2whYsHpEdjmbyA5qh4EnsAs5h39YWlDNH5IBQt
         1ClUAsxo1czRrzymkBGZNiwuUw4xkB/c+SNr/5vlaUZ1U1vqlLdPTsree8XSYoB7Pqvr
         rvrGYzW6Co3bfwOJ+VRG5BJjzXGZ5XUdx8bHvxGvUXS1yMO0JHF5R29qru5x09G/ADI8
         DKu1h74KCm0D7eZI5WjJeb7hqnwg42gzzfcFRpr+wH3aWtSqEii9a9Bm3obVLzDxq0Gf
         rkPh+i/J3uyoYh27KqPYKH5+c20YNGG1qNR/rSETuqMaehV9MU91xLBxvMUhPAttpT7m
         uSPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvhBUVGe2l7tnzLMVRMbTuF+0PTCBERFJbkzlpuQuTzrzaZq2X+E5U7k+ZJQvzE/aqbVeLngdqUDLuljJT@vger.kernel.org
X-Gm-Message-State: AOJu0YwrdcBwQJlvlpIZbmtlzOYyaq6UAnvXLpUWJAvKq5C7tJtTI7io
	aSKMoUmaVlojqaZ3x98DsIqcFnlm99FS5EeiU3v2jhOGxNpFZKK9JaRqfLli84GMcxg=
X-Gm-Gg: ASbGncvUtddU+CKt3a89sDLRIm8hNNRun/H9k48tdqvS8le9NMNOGTCiIlDLia7yXHg
	GyPffmyaQrRAvKEnPVnG1B2JqF/n36chRC+frNEDVtnP7kwWq46DznOBsKX5WYm+R7NCYvrnNhZ
	opR3LuQkZSWjyteSQpPkMiSZrariNcOpGSZ8lqkbByjvgRdFeiVPp9xpH5BicZ3+vnzwTPiRNIV
	sllB2A4ZjhANXgEGLuNHeRMOA5M3jFAcdsWvFsuMwqDeHFrTIf6FVRr6vqzldPx3gCH7NEG4WS5
	lcEs2SM1uKGhoCGcn3nKXvg+oRZubVtlXoxLNeLRAAMrBg8t1P0loX07433nCeIkcdvwP9lMxOw
	zCif/4Euer3rA2WceHuQx6KGHUu1D6/9XjiiG5td/JuhMlKli
X-Google-Smtp-Source: AGHT+IF8rG+HAdadk8FJZFHlMphapIz/vjkTDpBbGV2hMvAIFg2h5HlIyowXYUWst12d1VIrhFQpvg==
X-Received: by 2002:a05:6000:2313:b0:3c3:c280:d42e with SMTP id ffacd0b85a97d-3c5da83be09mr1291521f8f.1.1755854954298;
        Fri, 22 Aug 2025 02:29:14 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:c671:531c:f2ff:2a7a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4e269d20sm33831805e9.2.2025.08.22.02.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 02:29:13 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Fri, 22 Aug 2025 11:29:01 +0200
Subject: [PATCH v2 10/10] arm64: dts: qcom: x1e80100-qcp: Add missing
 pinctrl for eDP HPD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-x1e80100-add-edp-hpd-v2-10-6310176239a6@linaro.org>
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

Fixes: f9a9c11471da ("arm64: dts: qcom: x1e80100-qcp: Enable more support")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 9369b76c668b5c008fefd85d5ca18e87ab9ce93f..ef9bb7dac9193a44e3086ca370350b816744f41a 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -915,6 +915,9 @@ &mdss_dp2_out {
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
+	pinctrl-0 = <&edp0_hpd_default>;
+	pinctrl-names = "default";
+
 	status = "okay";
 
 	aux-bus {

-- 
2.50.1


