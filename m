Return-Path: <linux-arm-msm+bounces-24153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ADC917045
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 20:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0B9128A354
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 18:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6746817D363;
	Tue, 25 Jun 2024 18:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xTuwTLq+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4C717D344
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 18:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719340107; cv=none; b=jtWAu9Wpn5+5QaLrvzqrGJCPZBy7JYuSRLDtdjDHoliwogZl04DL6Xdylu8eCU9c2IdTOVUDkGBhEmw8SlW8kTrIwhgvtcfxkTC1atqG9TqkP9os+iJ04/hDLl1nD+2jhtAaLrqVeIvxTK/5bgk8En+UZFak7vChCe7vv/OfHzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719340107; c=relaxed/simple;
	bh=Il2UvibnuII6pAMEt7ZcsOO48MoDeeFboVabC36fJtY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o13WXL1I6kXXqGWyR6FN1V9RACOngjtKH0aEyBALWDwbjLr9EsstfIg01+jo1ptCq1PWvXLXTXNV64+HnuURr9ZFM6nrl8riRUcltlpSF/BNgMCHItU4ZzRyVYfO6VMXt7byN8lv3S4/WXcoM8Mi4LI/oiNh765AvX+7NS4rVh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xTuwTLq+; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ec50d4e47bso44987871fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 11:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719340104; x=1719944904; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZxsbIBefCYoeKy9Cb25bQD5JKjjQqCGKHe9J4bV87I=;
        b=xTuwTLq+TOnetH/du6R/O8MB1QSlvCyUoTZ/EuiotZTJA+bWR77QrQB88qcOMh6TsR
         UQsCeH1YJHW2hcyh3qjs4mwaj+dlmzXrXg+tEamJwldidDssg+sZzPasMNC/S9td/32V
         QQAGKy38QC3knBist1bVMj/eI9gi0domtU5ezJ3Qjb+9oPJ5fE+JU4Iub5WwSSQDZGw7
         U7jogrXg4vhRZTG/abNJpBjmax5oPFf8wRYgxgG3aFTwmLL/9FW18pdTv7p60tqaFl8Z
         7SpMeRyDpwyBGx15J8KblSiSNbUKGKc84A2b+xN0iXvtGL/2OxEIvycZPKGU8ENHWx/6
         wH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719340104; x=1719944904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZxsbIBefCYoeKy9Cb25bQD5JKjjQqCGKHe9J4bV87I=;
        b=dJlmaYuLOXxGte2PdPQv0fTEEkFu3WRU0SQou4cjsdUdxcifMmarv1q+zmNcVQBR0G
         2Y4D+7wtPQzD+EC74tOx8+RJYX7majYwJri83IcgDg+gFLLj9XRZXTdMGzHWPi2NjgIm
         Wp/fufV52XIUxClsRufTNLaK5VXRysu315VAdbKhs4imWjAtCJLs2HVQCdARYU4u8JlV
         stawprdSaZbWxcw/UYaC9rGvWkASfKRRAXh4AOzBE5f8Yge5oSGnQlghL2doxd50MBmR
         1fXqKsDWGKxdLC+Bx6ibYeuroPv5AqkTpKfj/1rUd5FCypKwgxLzQiMtRIpu3Qk3cTo8
         ++kQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/vvpr7tzTHxbsgO1gebuFR1QntOO+9DMztIL5WdXjeAwdKKeNvSBy5cGvVX7wdhqP3FHbwrJpOABq0Ic+m7KDpZRawx7tp2cg5Ouo3Q==
X-Gm-Message-State: AOJu0YzYjxzbx0kiCWOVG6Cujf9bRpE7K+F7Wz+peE9I4k2Em+zc0gLz
	WJ5FHefjBEj6dLMQ/e+CScjb2FhuGVWT1V0GFvNiceRGy7TMP8pQGieSoSF3L/g=
X-Google-Smtp-Source: AGHT+IERTLnLNNHy3T1W68s0MqqOr6aCsT3CWd3e/h0KiEMukzd8w8NKEEGKBwI+4WE9ry1o8Lt2xg==
X-Received: by 2002:a2e:730b:0:b0:2ec:95:d6fe with SMTP id 38308e7fff4ca-2ec5b28ae9cmr48217441fa.24.1719340103431;
        Tue, 25 Jun 2024 11:28:23 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d3042fd72sm6323136a12.48.2024.06.25.11.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 11:28:23 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 25 Jun 2024 20:28:10 +0200
Subject: [PATCH v4 5/5] arm64: dts: qcom: sm8550: Wire up GPU speed bin &
 more OPPs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-topic-smem_speedbin-v4-5-f6f8493ab814@linaro.org>
References: <20240625-topic-smem_speedbin-v4-0-f6f8493ab814@linaro.org>
In-Reply-To: <20240625-topic-smem_speedbin-v4-0-f6f8493ab814@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719340091; l=2474;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Il2UvibnuII6pAMEt7ZcsOO48MoDeeFboVabC36fJtY=;
 b=BlXBbM1o+PokhijSw+a2fl1gngXBbq3ayq9OQmI+TCgtGvPpsbaOQBkdjIvAjvDF7aXjlDpJH
 esr8rfv+fDKDgRA+7vpMkcyhgkuyqJI/f62VXU0kMJnbmcR074FZ4FI
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Add the speedbin masks to ensure only the desired OPPs are available on
chips of a given bin.

Using this, add the binned 719 MHz OPP and the non-binned 124.8 MHz.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 4c9820adcf52..c1e3cec1540a 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2119,48 +2119,67 @@ zap-shader {
 				memory-region = <&gpu_micro_code_mem>;
 			};
 
-			/* Speedbin needs more work on A740+, keep only lower freqs */
 			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
+				opp-719000000 {
+					opp-hz = /bits/ 64 <719000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					opp-supported-hw = <0x1>;
+				};
+
 				opp-680000000 {
 					opp-hz = /bits/ 64 <680000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-615000000 {
 					opp-hz = /bits/ 64 <615000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-550000000 {
 					opp-hz = /bits/ 64 <550000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-475000000 {
 					opp-hz = /bits/ 64 <475000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-401000000 {
 					opp-hz = /bits/ 64 <401000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-348000000 {
 					opp-hz = /bits/ 64 <348000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-295000000 {
 					opp-hz = /bits/ 64 <295000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-220000000 {
 					opp-hz = /bits/ 64 <220000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+					opp-supported-hw = <0x3>;
+				};
+
+				opp-124800000 {
+					opp-hz = /bits/ 64 <124800000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+					opp-supported-hw = <0x3>;
 				};
 			};
 		};

-- 
2.45.2


