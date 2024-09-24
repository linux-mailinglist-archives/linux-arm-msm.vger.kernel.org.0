Return-Path: <linux-arm-msm+bounces-32260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EEB984315
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 12:07:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76DFB286D38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 10:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B8416F0C1;
	Tue, 24 Sep 2024 10:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yITJZXnL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1B8178362
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 10:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727172395; cv=none; b=qBCEyraXX23KHSibUWY4jnSYuP6QabBxG+YaJwAFstr4GP3l0S56sRzDC6dY+uFggPQ1x2Xszq1Dgza5oK0bWxytFLP1HgxEDmVs17YEuwCM8k0n1YXiADQoFrpBqSNYvRCHOSK8qBKdmCWP9KEg0NQf5A+f2c9U0fzXDiGX9Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727172395; c=relaxed/simple;
	bh=T+A2HoWy0UB0lOdd3tHVl27Jcqq7f7SyeKlamEOT2cQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YuMhX9wDS7TJKG2k0WEOTUUUbu//33nWAgJv4JsZqsU85HPUNCsKqSLrZZkiFKv1eg82P/HE3XvoXk4jLRSmAtoxRnHuGz1UtiAS9QKyanVc2DEJnKrdBVMNgfefxQdz41a/y/pdQYQTDlKuY6C15uMoPpIbBUm6sXe0xVc/hbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yITJZXnL; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f77e07792dso1355921fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 03:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727172392; x=1727777192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1UynnEcAFUzgtJNN1ekJzPevI5eT5W6roCM6SLRhk4=;
        b=yITJZXnLLSOiJrlFQCFX/3OYOrKOT6nfYItDH1R7xhscx0juuItAGn/4niz/n/wVhb
         u2LkfnY7dBa+hcRscQL56J02YFKQo9cXr9mDXcnm7BLHl5l+MCdrb6c+YoZ5Txotyt9y
         8N1WlArzQhrzgbcFlClRLy7myLa7RnRzsfLnPhib2DjPSU7h/v0leWm0GX3GsWJfpQii
         ZPZ6VLquxzAHU7pZigj8xcGaljkc/S5DZENPZjxNvsYYi+XRdwseukBsu/iwsj3CGtfH
         qEJJ2eJldUrVthkgf27jBtwEu9TSm/KIA5B1JN4y4rJJ3CvA6uFj7LnomBzhLaGEg1wy
         Yojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727172392; x=1727777192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1UynnEcAFUzgtJNN1ekJzPevI5eT5W6roCM6SLRhk4=;
        b=ai48JNxhUvC3T686UJXWxTXof6RHJNa6Bnp8C9PX4ikQntkOZjQnD9V7512Gs2M5kr
         3HyhCcZYjxga5vOpMaK82smrSOAM4pdjIx5+gdT2RHGNh2JkvL/MxavlNABghC1+A3ju
         UZYWXeIc50qBc11I2s3Pg97BmftmWfXhfm7iOVcKORhCAx8koYaqXsFH3Do9tVnumFON
         3h9vL7RXi0CdqcjlRrQ2ti3qghFOxjFPdLz6oPaX0nJxuSy8VM1EUpGqNWXW0sB6zbP/
         CoZFoaIiMDm7vB2BurnGQ92aRAt+OMV+QOwutvO2LZULAylE4ZBHSO2g021deFj25cRN
         fmLg==
X-Forwarded-Encrypted: i=1; AJvYcCX6kVVLFdGcsdDFhOjewbb7Bl75O9JEGpKJ0+sNkWmCiHGMdBKPpgjVJbNZnyRQjhrGlf4z/1hipeGjjDlo@vger.kernel.org
X-Gm-Message-State: AOJu0YxwxB8UnSnTH/uzTs6oCLRMnDSUhTwnD8mNhsiqH3nB+CUyZPXW
	96AlfP35+iwGgxXMosV5sAF4sQUqXXr26kopB3vZhdAyLR0DUbu68ukHyintTQ8=
X-Google-Smtp-Source: AGHT+IHZiCP8LoNh0kxeHMtPM4WMuqc/EHUfrUwNvscRInJ0FQ6TMQi+4M0CZgZ2AJ4aRNnfyY7bLg==
X-Received: by 2002:a2e:be0b:0:b0:2ef:2b6e:f8c2 with SMTP id 38308e7fff4ca-2f7cb323c18mr26110181fa.6.1727172391990;
        Tue, 24 Sep 2024 03:06:31 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a864d937sm156713e87.273.2024.09.24.03.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 03:06:30 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 9/9] arm64: dts: qcom: sm8650-qrd: remove status property from dispcc device tree node
Date: Tue, 24 Sep 2024 13:06:02 +0300
Message-ID: <20240924100602.3813725-10-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240924100602.3813725-1-vladimir.zapolskiy@linaro.org>
References: <20240924100602.3813725-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After a change enabling display clock controller for all Qualcomm SM8650
powered board by default there is no more need to set a status property
of dispcc on SM8650-QRD board.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index 8ca0d28eba9b..c5e8c3c2df91 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -741,10 +741,6 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
-&dispcc {
-	status = "okay";
-};
-
 &gpi_dma1 {
 	status = "okay";
 };
-- 
2.45.2


