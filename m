Return-Path: <linux-arm-msm+bounces-69002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAB6B24EC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 18:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ADB984E44F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 16:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 654DB2D8DC5;
	Wed, 13 Aug 2025 15:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="npOuDtbL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A892BCF7F
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 15:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755100797; cv=none; b=sI7+6UcUJmBEzaoDPLwiTzIHCjIJrNMZ9bazmxIKANqD0wJx02QMirdbcxqpNRWp4EsokWbc/ithwDcBQPOoCii0abKKKix2FmnNuxRAcqBKy/RCgyVkl+D7hJCSxD/W6iFV1nyHLTRiNtbE9n5TacPz9GwqLLP9YHJhcKbQ2/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755100797; c=relaxed/simple;
	bh=BvDXs0+AlOpKQOQJ2POLC/1UWj5r7JhH6Kjw3ywFP2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ua8vhOfPbWXJtfG/nNLBiaWHxJ7P+vmSstkBaN+MqoY6BH49o2nBUXNZhrgUrNRS+rbtxuMknWg+atUD69BJw3MQCRRgxB7Yhfn1OqWQttuMGh/UJo+s83PNTiB39NTS81rkObXtgj8nbWmnjFz7NtgurR4aUKLzU0quYnZzkU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=npOuDtbL; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-458b49c98a7so44280975e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 08:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755100793; x=1755705593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zTTg3HaxieE47YVOSyqpdQA6zD92ZMoZ5TjhpFmozWs=;
        b=npOuDtbL7Y1ZHngqe2ruXvHEh+6Oqxq/YydhQ1B8Zp9zgTDR6NeFXtLLxUe2+ZQu9D
         Z8ouuhVfq4IqB4sR2TlLLjbcRHDm5refGJRqlaTD5l/Osg3pczzhcBwfxDP1PGffL3G8
         iwk79Z/EBjakLUIjg1ZJxwZNInBFdPRSOHzTYgmocYRY/8Ri0M+SKz61V214ZEN+Ob2i
         tDhuJNUOfi+6G/jQ0p2ShupsWDPrBQlQTVgEsxyO/vzJZL5+0vzwW03nQLKaTDyC/Udf
         j/3U0xQuBOjVHPiZWOjWq4Ipzg06PRuF/6ugtMN8eg1Oeim0wbnfnzbFX87paBm+ogvM
         MABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755100793; x=1755705593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTTg3HaxieE47YVOSyqpdQA6zD92ZMoZ5TjhpFmozWs=;
        b=tw+RDSq/i5ubujFnzktIP6EbhQp8TlBGhwcSMGS3A4gxDG0RhkmjTy4hrR5czUBYV9
         M1JxaH4qAnmIfVBj6z+UDER0ZABDMqT22daM1aUk2Rd0mavRSFbFImbrSPIzZ9py68kN
         4+lbMfh3V2Dmo4wVPeebuNHAggRw08IjDRfCyZnDuOcIYD0Ek0thCT8OHxekF73DWPLP
         4lyKpg+k5LVFgUeu3xBjUDyMC/1PdEb2Hjc/Z3zmieICAJg7yAdqN+j5X/RA7aYPdWIS
         NI+OIuBIFyxLZI5wtK85I4oisGIetIYzKM6l+TgdCXQ471A98u2H75w2Ehsff2yUmwC0
         71Nw==
X-Forwarded-Encrypted: i=1; AJvYcCWNAvUCkoSgr0R4OaJhNZHcptW1gEHGEzN6ChP0H0ECkGdP5Py6GiLzX9xGRSL3Of9buP4W20qRW0d87d6v@vger.kernel.org
X-Gm-Message-State: AOJu0YykpnFQsRRtiZc8Ffz1GFz6XBYfLNaNCsZS+jVGE/XWBaMDAcsT
	UHhlA2XAv0bsxhjqN831l7qVFprnwgI//lljsngBxE/qsBTZt8FESDYWT1t7WrGDYY4=
X-Gm-Gg: ASbGncvpx+HePq/FQtCsyTifi33q2ywaArsdBR2S5Uv/BUAbn6i/23tkPQs7BP8wvoF
	qfGSJ/P2uwrsLv0tDbf2RqYmoEGEPRp3Sy5l3O8+kLmcFDFf1BnJuu11X1HD+NqwKb//q7S35gR
	G/LYyXGYJ8IAzQP1tpReM2EPBHNiKXweW+z8bFUHGzeePsyWJ/ZeKr7Z37ZPOr2IcpR+duzQRbC
	4fivRdJwpFGyDRDVn9E3FH+SAmdbh6BTpEjIkWs1xa6xvEEFbS7wF6McWBKATmr1P1lks42t2kn
	+oN6DMZryspXYHmbzsI5OrB3QwCCRKO0nMYD73gIZFcQJmtb46+fyWiOMF8NmjjI9i4Y3LGJXw4
	XOc15B9B5z6zt+dZjcqjTdcTPMi+nfePJsZxynpF3FOGGl2l4
X-Google-Smtp-Source: AGHT+IHlFl/KN4c99kjp335F8fPSAof5RPTLX82llSuDD+Ly6m1dpWeuAZcZwngU0m7Y5+JbMaBsUA==
X-Received: by 2002:a05:600c:444d:b0:456:1e5a:8879 with SMTP id 5b1f17b1804b1-45a165b4441mr34651615e9.9.1755100792990;
        Wed, 13 Aug 2025 08:59:52 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:4537:5d58:c08d:204b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a517c26sm7087755e9.7.2025.08.13.08.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 08:59:52 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 13 Aug 2025 17:59:03 +0200
Subject: [PATCH 6/9] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Explicitly enable used audio codecs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-x1e80100-disable-audio-codecs-v1-6-af82d9576f80@linaro.org>
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
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index 71becfc5e6f649299b05b0b93cf74b81dea9fa57..0f0c37dfc5c5743bb08c038d1e61e4181762e777 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -1027,6 +1027,8 @@ touchscreen@14 {
 };
 
 &lpass_tlmm {
+	status = "okay";
+
 	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
 		pins = "gpio12";
 		function = "gpio";
@@ -1050,6 +1052,16 @@ &lpass_vamacro {
 
 	vdd-micb-supply = <&vreg_l1b_1p8>;
 	qcom,dmic-sample-rate = <4800000>;
+
+	status = "okay";
+};
+
+&lpass_wsamacro {
+	status = "okay";
+};
+
+&lpass_wsa2macro {
+	status = "okay";
 };
 
 &mdss {

-- 
2.50.1


