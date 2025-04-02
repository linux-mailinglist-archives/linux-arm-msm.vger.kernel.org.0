Return-Path: <linux-arm-msm+bounces-53038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A37B0A78E5E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 14:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 512D93B6CDD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 12:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A6F423A9BC;
	Wed,  2 Apr 2025 12:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rc9PnLR/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FA823A985
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Apr 2025 12:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743596662; cv=none; b=FS6LrY6mhWycmGNVG8r1DQ2LO2Qr/38S+Sn5XsWlCBemQ0Gd58JUeGpLycg+jhZYNoIMKM0GBQECd/GAws27B6IrUaavuBZc/8jGk5Ag6H+bTLSNaiIVdhtaeHWA8V9Q9E+WOG2C+AzH6zGg/PTtlV1cegezYACow2uFneaqQbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743596662; c=relaxed/simple;
	bh=bABY/WNuHuULundVfQJQv4yaRqhnbk98ZlSWhicYpz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iqbvHeNg8PuPBXtVMvxRK2CrtwKsrLpRfIrRqAHVwx5PVhFWmh+9twq5AMt4nr1+pKbTMtHsNEn7kTVBQh1oClfOIpww/u0/R+UqFqcdTlKNyAtHQWpm2CcpT+wl8RotBSieedbjQqXhUmCeiBJTl8tWCFOnW/KCrJKMbdHLmsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rc9PnLR/; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so1710065f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 05:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743596659; x=1744201459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+xVeLAbpwnli2t942OmYzCBSELCbKGbXXQnGN1GcV5M=;
        b=rc9PnLR/gUgnKidPK4ZKsHUNFnXzeCPAlEZfec3uQZqK2yiFuC5r8RyRy6nJxHqqee
         H/99KvZMeUt7wKHKFEFLWarX8CDLD6E8kqRm+AY0rX7+XF+BrWRTxFmZz6iK2rSzF/I4
         4qg9fSMfh1IbIe67xgFehgpvFWRXL4UXJcCYHmpINACeD62kGycSW2H2XZNL3Bkuy5LF
         W1ZfhOCHukPBI9rLZ+lRxtCH8EWVUSuwfGoiJwJDQP8CggvWKMXzdQ/tWbHnn/B4AIzH
         +ZhCkO4/jcXs4CaS5dWnBSjQeKm90kpj/4QqNZwkHKhmV68iduPsK+rktBvIvssLs8LP
         9lCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743596659; x=1744201459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+xVeLAbpwnli2t942OmYzCBSELCbKGbXXQnGN1GcV5M=;
        b=v0RIWO2/cZrY4j4jGXUj6dce46BRuqYFmkECPsvBJW1wOtD1+3R/ymgCZ6Fo0vjMty
         72pHk88PufThbWPSllMJfQ++AZGC/tfWDHcZxebbSoXEEgRN1LEBG/fpq7YTnBCMadds
         YNSSSYU8z3HK70p3AMJ7lwAa2mQzaVesV0jM2pAIk1Sn83rWiF4pbUdoDNn7w97DamRP
         c1sFy6kIMBwfRm29ruZZnVv167Hq/2v8GEyXfAVMWYRk4teM5zfCOdxS628PdkKPwmac
         xG0ikdoMnPjr9ruLS3gZlRYYu8BYLmOoeLQzu3F0s//LIHvGARK07MkJ7QI1abxdpouz
         nTLg==
X-Forwarded-Encrypted: i=1; AJvYcCWGGZsNUGVCZHcPblUkgz/2lJDa7mYUOaFBGwTdLZBWoNkmd8bY2hFM06+5EymEFVjuY/G1qYfoxZDevCOF@vger.kernel.org
X-Gm-Message-State: AOJu0YwT1Agc8PLxgk/mS3+lVFKqbOOEdfUuV/y4SEdXMwWSUfuUfbve
	XUPAqU7Dqr4STmTVLs46C70DKcXFRqtdFPq3Fi27tNwcAsQkPSyMwgu5UlzMTes=
X-Gm-Gg: ASbGncu/fLgGgQ7MSoua3O6SWVOnPdGfs5Rw04V8v+nDDhc1tT4VANY5vEOmzSaKLoJ
	7sMuewEl75n4N8hMcY4plyvUm8u1F1dI+ZDULiZxX+0EUaUJ0n5cQJUCZWGZ+K6FdhlWG9DuGVc
	C9+ePluJn2ntRdF67Jl2NIn8MFYmBaXHWsrQc/iCBWmKK+QTk3HGdxRqENgxtxEP4QQQ7FT6KoU
	DfM6x4bv/Lt1/fnCINQtom50puEO9uO8+VCKyiYJh6oOnkUbhqIoJycZK8JPShLXYRMeYER2WhE
	xlpBETRMsJYeGMw+lcpQWGox4nbJ7/iy7HHJdFGSPQ1xGnWG91yQQVZ5/7EiLBKfONzw6oNxkH8
	OfUp7hUmHBg==
X-Google-Smtp-Source: AGHT+IH/sQL1nmUqtLknA+xuOc7QjAyUlZ5yXz2OgITYTy5u49Yu2BaeAaclCixFEeAtOjKS2XMsVg==
X-Received: by 2002:a05:6000:430d:b0:39c:2665:2bfc with SMTP id ffacd0b85a97d-39c26652d7bmr5094266f8f.52.1743596658777;
        Wed, 02 Apr 2025 05:24:18 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb60ccc66sm19418675e9.24.2025.04.02.05.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:24:18 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 02 Apr 2025 13:24:15 +0100
Subject: [PATCH v3 2/2] media: MAINTAINERS: Add myself to iris Reviewers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-b4-25-03-29-media-committers-venus-iris-maintainers-v3-2-2b2434807ece@linaro.org>
References: <20250402-b4-25-03-29-media-committers-venus-iris-maintainers-v3-0-2b2434807ece@linaro.org>
In-Reply-To: <20250402-b4-25-03-29-media-committers-venus-iris-maintainers-v3-0-2b2434807ece@linaro.org>
To: stanimir.k.varbanov@gmail.com, hverkuil@xs4all.nl, 
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2

There's some crossover between venus and iris, I'd like to help out with
the reviews for iris to ensure we keep upstream chugging along.

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1d03530f3298703c5f3d025010511451f878f822..4e321a5be68517605f4fc1e8f1b2deb1b755c41b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19529,6 +19529,7 @@ QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
 M:	Vikash Garodia <quic_vgarodia@quicinc.com>
 M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
 R:	Abhinav Kumar <quic_abhinavk@quicinc.com>
+R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 L:	linux-media@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained

-- 
2.49.0


