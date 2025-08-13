Return-Path: <linux-arm-msm+bounces-69004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97578B24F2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 18:14:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C28F1C803CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 16:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC68280A3B;
	Wed, 13 Aug 2025 15:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rj8H+n4G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441102C0F88
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 15:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755100798; cv=none; b=jZf//TOCtFLYCuQo6kXYx7fLT7tK/hQIdu4BMMLApyOSJ6mth6m1vqj4C4TmyJxUUgcXaWq37IQ6wFsAAu+eui7rB5nefdsisq0qiiQaINo9ac9ywopbLN6lgY2WtHRJV5zffkHJUFJAgFn8K6YDfcamXRIzcW9NeDPdRWQf2wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755100798; c=relaxed/simple;
	bh=ScmH9gs30njKd0dmkU64IH6IKSFraUaYNe4Jlxf+OKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=USU7nFul16CO8Aw55p9eqRRwxrlqF5+LvfMfVchFq7p+rTul9whYVryP+YwS4qVxxqqJQb4tb8xYo1D3B2D5PpqKkjhsXbhXc4SwgumVWm9pyJGfm48SjDCg3Wqq14MEfsVpprPCM/MYOjy4WWkbaNU2cox18WwFyxBEuebrmak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rj8H+n4G; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b78127c5d1so4514322f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 08:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755100795; x=1755705595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Kc3gmKAAdDn1Asuylh/1YyUvR/BaZjLFgQzjMsPib0=;
        b=Rj8H+n4GKR0N30trvy3McsB01e6K85yOJmp8jEeYctouMPQMFMM+06NdoTMI6t+Y07
         uq5Bkw+824VmHUK731iq3gKvtMZlFORspPVv60Brv3jovxtv/lF9C7E/cB8mzaRb2u+G
         wuk8j8aLAZEq+EuNpY1pyYVYDHiZmlt5Ys4f0kq9u6Rm5e5+KGHcfLNtJeJMmp/qBK1g
         tFkK9RtvbpyMEu1TWLGhQbJi8vW7rg8Zn9odo9+aMeLGsK/K7glbPI/UJUGkc5B1LPky
         gjoOBXCvPV6lWSDMvDuR4RrieTK/RSf2scWC9OI0Djyfvah6hjT+QJzxZIW49AtkpUYt
         Vqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755100795; x=1755705595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Kc3gmKAAdDn1Asuylh/1YyUvR/BaZjLFgQzjMsPib0=;
        b=k3l++5bsTA0Vvz6r0Gk/Btbq3O2ua3ktVyvHL4R3WJLV1SIr/WmrCI1PO6TA/FuZYO
         Metqc2h22oYsWymChzfcIZgcTkOL3hka14tWwPnpptv/fCCxmER5FDXkrqHHBrstWqFx
         PZhF+f9AOgPZCMbt8Sy4+8NQUbs9u1PtLM/lpr124vwCNrTFXuwqhPMUczCXCFtG4gKX
         VRvxWtn3Mx8KC6htr0QZjaD1GAzH3iYf0fahcBKK3LbT22hayMNO7tUrXda0JJ8RiOTO
         JaxycdBoKzaUi0CWG/yPh/altU4LJStUQOFIEptCy546ghCcWgYtsgDca9cFhJJ4orP4
         XMjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZA2MgjbyoVyv6v5KPzOP9FeOEVeUNFAr6mpg9fWEVaGHzD+lJc4fMkYxXQQRqpTstp3dqxKAabnzYG2sP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9z8x60gW0Y8qZzzHfvaWQ+I5rbbkkYMZgKB3ofxmrZKHyEzLW
	NbtnXFGmYECh9wALtvOlRG3931QrfJhtU5V76Av7kIRvOwyyu7s6/h3tW1+A5BPdeEQ=
X-Gm-Gg: ASbGnctH3pG8PpsD17qCdjDAkqFyx8GnO1cKiKIZH+QS8vsdRPK7+57GgNw64GrGN+y
	EyBW5kiyt85HJhorOVHkHMOUR3MvV/JPpzJpiaDbbSnGZSzSqcHlmeoXz43nHLewd0iBH7nYSjw
	kJWXki/XpLAZsnyH8mPyU5Ff3+8aVsSVgZYxW9GnI4FaSGes1/nQ01BUnDJUnfMVS+Swmet5t96
	1rQivaFPa/0wq3tcrD+ubaAjPum3AlX5R+6kzjQhi/vWLVrthgYwQEGmOmD3iZ/C+7l+sSemFDA
	zjtHJS6fC56HD2DLNXYj6ioLqS6tlSLxGhAdkRUo+EgBgpfjhvDtYeI5yHbQNXwKzvA9J5yXBtu
	GH9qDH0mGvoxk2sYh/iDhtYh+rLmUkPa2ciyPUg==
X-Google-Smtp-Source: AGHT+IEUNkUJM7qj2trKHyqQZDLLtDdNbdaoomfMitzBmlPlCJCFsyHe9S1WrSfVP+5w4m9SxhamVQ==
X-Received: by 2002:a05:6000:2311:b0:3b7:8268:8335 with SMTP id ffacd0b85a97d-3b917eb8171mr2913632f8f.42.1755100794506;
        Wed, 13 Aug 2025 08:59:54 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:4537:5d58:c08d:204b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a517c26sm7087755e9.7.2025.08.13.08.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 08:59:53 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 13 Aug 2025 17:59:04 +0200
Subject: [PATCH 7/9] arm64: dts: qcom: x1e80100-microsoft-romulus:
 Explicitly enable used audio codecs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-x1e80100-disable-audio-codecs-v1-7-af82d9576f80@linaro.org>
References: <20250813-x1e80100-disable-audio-codecs-v1-0-af82d9576f80@linaro.org>
In-Reply-To: <20250813-x1e80100-disable-audio-codecs-v1-0-af82d9576f80@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2

Currently, the macro audio codecs are enabled by default in x1e80100.dtsi.
However, they do not probe without the ADSP remoteproc, which is disabled
by default. Also, not all boards make use of all the audio codecs, e.g.
there are several boards with just two speakers. In this case, the
&lpass_wsa2macro is not used.

In preparation of disabling the audio codecs by default in x1e80100.dtsi,
add the missing status lines to explicitly enable the used audio codecs.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 27dd5e4e9939124360544ee9c59900ebb01f3f49..6dd4da08a1d256a341fb5f6b4989852709f68519 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -921,7 +921,13 @@ retimer_ss1_con_sbu_out: endpoint {
 	};
 };
 
+&lpass_rxmacro {
+	status = "okay";
+};
+
 &lpass_tlmm {
+	status = "okay";
+
 	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
 		pins = "gpio12";
 		function = "gpio";
@@ -931,6 +937,10 @@ spkr_01_sd_n_active: spkr-01-sd-n-active-state {
 	};
 };
 
+&lpass_txmacro {
+	status = "okay";
+};
+
 &lpass_vamacro {
 	qcom,dmic-sample-rate = <4800000>;
 
@@ -938,6 +948,12 @@ &lpass_vamacro {
 
 	pinctrl-0 = <&dmic01_default>;
 	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&lpass_wsamacro {
+	status = "okay";
 };
 
 &mdss {

-- 
2.50.1


