Return-Path: <linux-arm-msm+bounces-35919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3539B08B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 17:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82EB91F27A46
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 15:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBB781F8199;
	Fri, 25 Oct 2024 15:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jn7hM+gt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43E817D896
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 15:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729871014; cv=none; b=f4/ZWFN/j2A8JaSHXWgIpFBNbWdhBbLvts4RhEDGD7fD35H9rCJi/ZljwLUMxtSLcjtsy3VPTmHvVa5quDy5qtLKoz1J17fYYkvnBkZA3Ikut19CAvL5EaPEj1+PR0vl54NQzCODYEUSIpxDNWGP1JGWKDtwLUTHYkHSUUnNtN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729871014; c=relaxed/simple;
	bh=XvlW0vpiMSi9SfklLNRt5xYJcsZyzHInLa7y2PlPt9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gS/Nc2P2RLnWqZrGwZn4w3puXkEU7XAEqvdNKmXNRjejQXclOcqv5F57d0zEZ+l1uL29m1jr8IO83nN6EmEYc82hkIfvYQXCRDW7OHdf0KfVXD8HPnNbmXWaV03xCRbz2Qi7h5OXQq6to0UQfQk3ugAy3bJUP9YGCdXfq2mlsN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jn7hM+gt; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d3ecad390so2429456f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 08:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729871011; x=1730475811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NhFbw1mBYu2Nay5X01WxZV5YBpfYsMrhWbGTAJYzk1Q=;
        b=Jn7hM+gtHeNMD70IekwblTx/2nKgcq1OYolMI/exMolcSFxWw/FVGiyKu3qUjVJPQU
         LiIrGwLdUAaE9HBrAIu4ErRpYGeU4U5jvdUkLjA6MhUlgYP+Oiu+fG+nRGbfznq0VUjk
         yuPwy39OQzf3uMN78Fapf6GS26cpgq+k43RFHySgBVOICayi4cCtCMakZ59yI/U1sekq
         WM515F1LqylcAZFvnfggg3RVm4u8lDLqy04d8hWzOjbJNOGd8DQFG9LjsmwQ+BwGCNzB
         S3t5WGpvD9a2JQ9yUjUXdT5p3m5iwkJLton8jHE4WPN5SSqxpQKbJTpCLX4dUkhIkWiT
         yb4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729871011; x=1730475811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhFbw1mBYu2Nay5X01WxZV5YBpfYsMrhWbGTAJYzk1Q=;
        b=c4Ol91x8SmL7fAAfFBAjHLZvSvIFPRB2GAvuBcbJezhnDWSO3up/oQsYVlNXIvV6V8
         T5DVmcQrl+ek9oL5xCgfYxh5wQHzGrRv15rnD3IZDCodD0+Wu/Bxp5cQ5h9wZsUuWrJw
         lcLwfXess9SCp/gPzQ3UV2VBS15w54HyrfcMMIa9Dd8zC3o0beL+kpbRczjk0o3XV0jg
         9bc1guwP269IhbjtcHzsTMuny1LN/vwXYdo/X8HoTrKoZzxJohPtS/HrGeQFDPBhS8F2
         nFs2oBLuEb4rmRKD5e35/R/QdAh1PrTsi076ETj0Wzr6kjd0kb1pblk1r5v9J256tLNP
         y12w==
X-Forwarded-Encrypted: i=1; AJvYcCVkHtSWLmJJdTpw+zV8xXXT1cZgZueX0jazZrDW58ccapEBHvGvtZkxa12y5cNs6jea0W3owHfoS7jmihRF@vger.kernel.org
X-Gm-Message-State: AOJu0YzwR7/bABsAb6dCIWo4z9Baa6MVu/mRqffF8qgGnoAy+kponDqb
	nnmfO3U5djzdsy1SQTnKbEIkgKKd0HSRn92EE9B8TAmbLgjs8dfkreU2sXu3LL4=
X-Google-Smtp-Source: AGHT+IEpR+L7S48fUXzS3mEfaT/r/b5+mLSfBoyEeFTAJU9NB8MaARkwZJjkqVqUt/KjOOIyL0+4eQ==
X-Received: by 2002:adf:e8d1:0:b0:37c:ca20:52a with SMTP id ffacd0b85a97d-3803abb20cfmr5145111f8f.8.1729871011022;
        Fri, 25 Oct 2024 08:43:31 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b479ffsm1829092f8f.49.2024.10.25.08.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:43:30 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 25 Oct 2024 16:43:28 +0100
Subject: [PATCH 6/6] arm64: dts: qcom: sdm845-db845c-navigation-mezzanine:
 Add cma heap for libcamera softisp support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-6-cdff2f1a5792@linaro.org>
References: <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-0-cdff2f1a5792@linaro.org>
In-Reply-To: <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-0-cdff2f1a5792@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Depeng Shao <quic_depengs@quicinc.com>, 
 Vikram Sharma <quic_vikramsa@quicinc.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-dedf8

libcamera softisp requires a linux,cma heap export in order to support
user-space debayering, 3a and export to other system components such as
pipewire, Firefox/Chromium - Hangouts, Zoom etc.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso     | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
index d62a20f018e7a7e1c7e77f0c927c2d9fe7ae8509..c8507afcd1e0d1f9b14b6e4edcbc646032e7b6c9 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
@@ -9,6 +9,17 @@
 #include <dt-bindings/clock/qcom,camcc-sdm845.h>
 #include <dt-bindings/gpio/gpio.h>
 
+/ {
+	reserved-memory {
+		linux,cma {
+			compatible = "shared-dma-pool";
+			size = <0x0 0x8000000>;
+			reusable;
+			linux,cma-default;
+		};
+	};
+};
+
 &camss {
 	vdda-phy-supply = <&vreg_l1a_0p875>;
 	vdda-pll-supply = <&vreg_l26a_1p2>;

-- 
2.47.0


