Return-Path: <linux-arm-msm+bounces-43229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 928CD9FBC3D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 11:27:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D966F16C878
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 10:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B681D63E1;
	Tue, 24 Dec 2024 10:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UslUU4cC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD1B1CEE82
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 10:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735035447; cv=none; b=srMQMuBzB5Stz9LGNAJ29Ifdfd2RehZrP5qrorRzMGo6gdWiqv+57ysKsAax9yHokoBm3U3xmbw87Jwf9ed5SGC4PIhAL0bQPTRmbixNd0U2vZnJiziYNjUhNtcJlDN8KTekDIUVFU16eNQh7hUw1YUm9guWLyDNwwGK3PrbRK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735035447; c=relaxed/simple;
	bh=Hw/hyP5k8e4mrPZ2Xq4xWEV8pyteJA9D67U7usPU5R4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gu0j/X7L6ENFga8Z3TXt4nl6WXoEAsORK0tOSQeWpJcujTBADPibP6yGT5qGaY7zIG2M2P6nNziAS5EeF614KLWWKKLpZTRYmLEdNuphCZbh7Sih8hrs5LcofsqpzglK+9YsqxItY/na8YXowqD8FWQviayhVVSl4jPPjRI+REo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UslUU4cC; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53df19bf6a9so7543841e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 02:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735035444; x=1735640244; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5n8O27+6FwtaHVPzRSxUX+gZj9rmBVfvJfhu3dGKwOE=;
        b=UslUU4cCjYmCL0hwaHv4mLtGlKU6Qc7m3+GGp5jMenXObfTX/kKl9O7nQBBcZb2ioD
         VOIzK23iFb7bNdPwJrI71ZuYyvLlsb5ku0e3u2vqkGtF30PhthE2CFqvbHj3adTXBA68
         olndMixnDshTQwGf9UFmPoHZpcvJVPF/DHXJQ0lfx9Fig6LFWbGyttXfVaYNj6UNfVUr
         TaMs4mLCLvCsmATusLth1meSXo+Bz118WkGai40//kWMmmE6B5Y1aW5zHzFn+ex/bT6T
         vgUiNC6UIiTDIxSa2KiHbSjCzPWizg5uWqvayt4Io/RNFwtibfIK+pgFnFidCIdvQUlA
         opZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735035444; x=1735640244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5n8O27+6FwtaHVPzRSxUX+gZj9rmBVfvJfhu3dGKwOE=;
        b=ViynkausJkkIbfwjy4VdE4SrrM3pszVAqkP8qi/D0x8R9KZCsih1hMQtzhjVqE2vsA
         OxIQY5XvAvZfgfK0iRz+ONkTRW0baD2Ry/zjwMUZ1eH8R2fZDc94gra+ChoYZ4KYDeWX
         N68Z0GfEJJ6KHrNeTsVY2OKz5WPDhQDx3/pGwcg4AFPf9xLcxPhETJg/32/pvoJAqX9R
         BruXX1JLXiuiX0iBBkL1L29ZZnFUOyIAnTZ7zkik0RsQuUZmU/w9A6MQ4PulQ5g2c5vf
         FiUb/nUnkPq5oGsdA/AD3lNjI1t5NY8yRUJD5zRT39liDwgt1l1DdlTA3mCVz/wPqoEP
         Ydrw==
X-Forwarded-Encrypted: i=1; AJvYcCWmvwRkxZQt2FJJwzpwcDyOv2aHhZuaVTeKgkFSNSDg6iZlyznue3SBocgfBTl7MeM8aq0/vyue5qARIGn4@vger.kernel.org
X-Gm-Message-State: AOJu0YzBTG8MMernB/5aVfdPcwFKA3A7gR7lWk1hCbQzKEHzFz4uMmkt
	muHJx/0xM8A292Jc0QPhqKK4xgpE4K/WP/ibA8iTOj1h2+6fW8Ujl2ioWFLRkDM=
X-Gm-Gg: ASbGncsKF0WNLpPUKo0fHyruGN+gVi4uFSy+Eh5zOdf6BzhDuPJSFUdnenvZRf/WoRr
	B03IGw3sTy74sJ3Vk7uvzomVWG+K/ZJvzqkmZ2NnK2U23CEKYAGz8TGYr0cHVtyiiS5VaUR1DDI
	qrA8w9l7WfWDivRnYG/6kEF/b4I55pxiM/5iX8j7NUY4/HGtqccoQvhZxyL7jZj/ETR2NpQE/Sg
	TS17F6cmoGouhMevVmL/FCKiYtlorpUUmsn0NCWsqm/Ekc55TycNI6rYRcAHRSq
X-Google-Smtp-Source: AGHT+IHzEV+knAgyrvR9K/HoIjuplHC9dlUlh5I5jn64vGhIK77nG6DFiyAy4Kop52Ibc3aPKzHxyg==
X-Received: by 2002:a05:6512:2308:b0:540:3530:5a83 with SMTP id 2adb3069b0e04-54229561aa3mr5391564e87.36.1735035444187;
        Tue, 24 Dec 2024 02:17:24 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223600596sm1576865e87.92.2024.12.24.02.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:17:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 12:17:05 +0200
Subject: [PATCH v3 06/21] arm64: dts: qcom: qrb4210-rb2: correct sleep
 clock frequency
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-fix-board-clocks-v3-6-e9b08fbeadd3@linaro.org>
References: <20241224-fix-board-clocks-v3-0-e9b08fbeadd3@linaro.org>
In-Reply-To: <20241224-fix-board-clocks-v3-0-e9b08fbeadd3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Leo Yan <leo.yan@linux.dev>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shawn.guo@linaro.org>, Stephan Gerhold <stephan@gerhold.net>, 
 Zac Crosby <zac@squareup.com>, 
 =?utf-8?q?Bastian_K=C3=B6cher?= <git@kchr.de>, 
 Jeremy McNicoll <jeremymc@redhat.com>, 
 Rohit Agarwal <quic_rohiagar@quicinc.com>, 
 Melody Olvera <quic_molvera@quicinc.com>, 
 cros-qcom-dts-watchers@chromium.org, Stephen Boyd <swboyd@chromium.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jonathan Marek <jonathan@marek.ca>, Vinod Koul <vkoul@kernel.org>, 
 Tengfei Fan <quic_tengfan@quicinc.com>, 
 Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
 Max Chen <mchen@squareup.com>, Vincent Knecht <vincent.knecht@mailoo.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=844;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Hw/hyP5k8e4mrPZ2Xq4xWEV8pyteJA9D67U7usPU5R4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaoohF+0EqyXF3XrhnjC42zcri0uUzMBsBO5sq
 GxLB0QYNu6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2qKIQAKCRCLPIo+Aiko
 1aR+B/9VlaHjXy4L5c+3nik4nOoAAPnAGzM9GaWZnNQGQa0ejWTnISl7NVmGyyhH430xSs+NyTy
 3RfMQRBtLC5N87YxR2hLOs5zPLc/1uv8uFa3AFrsD5lvpGo5vrrDxCStYaMbvSu4/68PrRdVOHf
 3KZ/bs6S3/nZQl6rEqvREOWdjCG1ywNzIjdbVLVX4XdYQ7Qe/7FPbwme1xm7zXYfIoC6dgkLP/s
 h0V2DLESNRlxyZheBrMJtCLahrunk2ch9FGse/CW3XRgH1zPhzVwNnZ/tpGmTc5ZsvWtMALCG6p
 L4oMYMXK/jatz7Oo+NR0qBmBViRuXjIU47UKduQwWRBbxbi/
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Qualcomm RB2 board uses PM6125 to provide sleep clock. According to the
documentation, that clock has 32.7645 kHz frequency. Correct the sleep
clock definition.

Fixes: 8d58a8c0d930 ("arm64: dts: qcom: Add base qrb4210-rb2 board dts")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index a9540e92d3e6fc314fa91d4f055325680233f6c4..d8d4cff7d5abed405d1b4cdf9ab8264aab076830 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -545,7 +545,7 @@ can@0 {
 };
 
 &sleep_clk {
-	clock-frequency = <32000>;
+	clock-frequency = <32764>;
 };
 
 &tlmm {

-- 
2.39.5


