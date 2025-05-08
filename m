Return-Path: <linux-arm-msm+bounces-57263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E9EAAFC8C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 16:13:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46CE74C244D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 14:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C78D26656C;
	Thu,  8 May 2025 14:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QkQ1IF+U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A25B25392E;
	Thu,  8 May 2025 14:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746713486; cv=none; b=Cc7AvkmAlKOLtP+4ycSKWeAfnn4VQ/8nF2ywcxFRVA2UwPOuJ1m6vLVhTdnVK+ZNSfNF1O+vV4ikJTafe0zbUHIyxpj2xebWkXlnmvlLeMLk8hgzG6bUCsUg22H+NMMah6DAqYBQ/sjkwaAtR/J4N3BL1J+0aQNHKQWWBQY2rXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746713486; c=relaxed/simple;
	bh=qJ6Q0YMg+xx0OvoV6rdyjLr85/AbiUExCoZCQOLIgJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/P1LGYtgyQVfWhF2UPmf6IxVvT0dkKfPiFxEVKj4w5qAT1j54CH+2L6gYhB5xssHTFh2iXoDMwmEE+k/NUhLgTI4ZYpykSFCc+HRPD5aDMr1uY29spxgTIplF8ZyehCphalmOoVoBVdDqpchYbY6fiRvApb52yJT+mi1XWzxzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QkQ1IF+U; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-326b683ac3aso12367041fa.0;
        Thu, 08 May 2025 07:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746713482; x=1747318282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CR4PczBsra6kxybGJwNm860UW43RxDUcM5S3Nxc0mBc=;
        b=QkQ1IF+UCrgogcIlcjrKSdAi1Ab6+X57xGkFCex3Tqoj0kITgWXTzvp21lqsTcNdi0
         XwX+SKuA9gro8CMWC/yTCkwyzyi38/58xxZcvgPXCfVpgm9xrt7D1YPe3BUDwVRDCrWP
         1WnmWfsoDtWPKore5F5ZQjZG/BdURxS4XHX66SJyT+ZrVkXiD/7QZ+D7a/8joNpBEV2m
         hcFNQtjRqHzBBeL1AJAqwtsCSBUE7855MXFRrhlVWsaUAtlatmAsRdjOd6gsKvJP90+i
         XGMvJ+KsbkdrxhqrLMv4+yFCDYX3khgezLgh5Z3fbW33IMWwrodaezH3tlW5Zn1EMAmq
         ofBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746713482; x=1747318282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CR4PczBsra6kxybGJwNm860UW43RxDUcM5S3Nxc0mBc=;
        b=E3NwO7jnLMzQ/L3az//Uf0Hz4xENnjH4yHb7URmyG60+Mq6h0U91tdF8B36wkj70VF
         +0mNFMBN45B4gBOdZ5Yyp+JYHx81NQJBK7Q26x7K49fLwCyKKW3MPkKDYxgrYxATR4It
         qChV16UMksOIYJI6uHPWR2TnQ+3qM4r6+ztZcCzWwPOguXIRYweSdu8Ch4SXry/Ogqlv
         Ii8UDe6buNxEsYF2+ZMdMEUyn/x84jQvWR/QJLiplKtRWuItCWwatdtJZPEHpfh729+R
         tS+7E4TFdRLNc0WY4GSYGi8HjsSVo8kMnLLNokLXJLoxkyyP/vrAq1zWkgiffGhcXA5W
         z6kg==
X-Forwarded-Encrypted: i=1; AJvYcCUESE022+FvcWqhMd0H4IbJ3xOkKkIygmJwL042aQxzJPo7j4vXfggse1+4kE8xJ5phIjNg8XqKICPp/4Q=@vger.kernel.org, AJvYcCVn7Q1GZfmI++efxDszysX8HxTJyNUW/dOc/MzW5M/D6p/LcNV+tUYGgaDROiPCSpWU+xfE+B5VhB+M@vger.kernel.org, AJvYcCWs3hF3CcJAXKE0ZcJRrLOIi8ZYOvd5bz8JCenmn6Fxx0mdJo+ZpjhknPFXlkhrKSYrbbmwDfQksn7NK54h@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhqq7IeoCFjQyvCnQcdey2DR83rxN5UKQuzRLwjJMppdF3xjxo
	PHbzxEOmzA2+Reu0BtOP7JI44VayH4JEayTopqgIei3c3Z7Sd56p
X-Gm-Gg: ASbGncvXgOM+vwYJPii68z3kyvMEWHnyCvaNw71oI1JXJMDKSX0lRpl1M7X42VjRZkK
	itmn/IEgfOsELpra95ilSFLBBLhlSQzs2KxQisKB5TODL9BKcm3dabe/TQP2tQDxQ2gmmGea+hQ
	ro+xFeWcs/dxTa55kgn2jRTdU+rR7oBnHOffEx0OhUplu+EGZj+d3Ruwfj6BtRmXrvU12WsVeSx
	otSLVil8Ijf/0z16/o85SyInMBaH8Qk1+Feq8Q421MN4BNz3W9Rvb0MVHRgHCsHD/PBbjMkvc0v
	ZmxYVpOyKey/mTE9/Rocrv1JOl3qJ+BYCbm92awM8HEAo/4VTPdfhEbvrzt9GJA+K3rduNGi9Vi
	vuz7T
X-Google-Smtp-Source: AGHT+IF58rFnax5T83l1FWUQdpx2s9mrRUcn2kqC9ShHzeZHEUblgjPJRAbYLkkAyxqQi1SZYioBMw==
X-Received: by 2002:a2e:ab1b:0:b0:30d:6a77:c498 with SMTP id 38308e7fff4ca-326b7570cb4mr16897161fa.4.1746713482148;
        Thu, 08 May 2025 07:11:22 -0700 (PDT)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc91064692sm446390a12.49.2025.05.08.07.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 07:11:21 -0700 (PDT)
Date: Thu, 8 May 2025 16:11:19 +0200
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] ARM: dts: qcom: msm8226-motorola-falcon: add I2C clock
 frequencies
Message-ID: <5a8191e3758e0df78b4213102f25ceadc28cd427.1746711762.git.stano.jakubek@gmail.com>
References: <cover.1746711762.git.stano.jakubek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1746711762.git.stano.jakubek@gmail.com>

While the currently supported hardware works fine with the default clock
frequencies of 100000 on both I2C2 and I2C3, downstream sources list the
frequencies as 100000 for I2C2 and 400000 for I2C3. Update them as such.

Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
---
 arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts b/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts
index c01becca3d56b..e2bf292159fa9 100644
--- a/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts
+++ b/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts
@@ -106,6 +106,7 @@ reserved@fb00000 {
 };
 
 &blsp1_i2c2 {
+	clock-frequency = <100000>;
 	status = "okay";
 
 	magnetometer@c {
@@ -135,6 +136,7 @@ accelerometer@19 {
 };
 
 &blsp1_i2c3 {
+	clock-frequency = <400000>;
 	status = "okay";
 
 	regulator@3e {
-- 
2.43.0


