Return-Path: <linux-arm-msm+bounces-83585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC53C8E197
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 12:49:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E062F3AA29E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 11:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B041932A3C5;
	Thu, 27 Nov 2025 11:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CX1na+v/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F2931A07C
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 11:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764244161; cv=none; b=C8tZA8EbbaUhPucdxavdPeZ0cjHw8vUmfubDFAU2agZiWSzt1AR/KNO46QHEsB5OjzHD53GPE2/f+kEP4zD5v2HnKsLZp2TWfUGsAkAjBGnG+Mu+DFy04U5dZnpZERxg4vx6Y7YL1J1MHR7DIFZC+nLShbWq09wKtul0jd0CdJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764244161; c=relaxed/simple;
	bh=moj/Dka59d31TxPZYaejItVbxDZfvmAUi+Ss/nj15/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qE4g1BnBuDpyygxRkUEmEznAwVTu+f/STJGRbr6tgwtP4rQt9lw4j0ysbMn9JfrkmAVYz+Kw73VxH8ULL6w3SvBEMP/pMRy1dh6TqSPlfVwdNMv4MEgJDKb2vjE1q0jZNUK2SxxDxqcncNTVHZafMXTUlzazC4C3WuLoeSBwrys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CX1na+v/; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b32ff5d10so1228403f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 03:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764244158; x=1764848958; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=30sAr5fK4ldLNysljwG4Tsl3D/w6Hu1C/auM0jnzieU=;
        b=CX1na+v/UJ/Zd637VceMAA2asBJXcRttdLRWutmpY9dwwZ5DZCUpsEXe99JLRRJKpL
         1GAzem224jaFTFGTNTOfZ9N3Oe8PC8T0PqdejMGCqui/ISr+9HFuJ4AVmoVrf32h7hHX
         mMsYp9JRVyQvqh+9wU1F9uBG/wp3YRzY92lYVAEXhsQ07peWg92G9me87qL9o2RPAkyJ
         WgdOHL05zJwP9BCcVDa9GulccoMKVJTdsF0nAKeh9eTseD0GYPrhRdH2twzGX1GHflXs
         BLpP02UYDECVmrJoKxu0OEQMWFJU7CViwSRxTTSxAvu8KC9hW/yJtHoeK8kbgh95NC0d
         lLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764244158; x=1764848958;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30sAr5fK4ldLNysljwG4Tsl3D/w6Hu1C/auM0jnzieU=;
        b=e5YZYyGUMttwOJ07tKf3AZOgPE27l7Z+tTyJSTVKREYUK2+2CsVsqduMAmvXLceexi
         PYQ107QSn5xvi13+V31rI0o9V2vgysXtWzNXXFif1401AfN8OQRQS8YmZMRIphdS64Rv
         DdJbk9qIIIJFnvyMNApPkLHhAxIakb+0OqYmXxMZdwPC/FUxeMVvY8sNVk8iDpBBYriy
         RYVQwMhrWCe6dv2VZzrpsK//bOJloleMH8171uvcd/7M1ryZ3g0vWiiOTw0bl+8gWE6V
         Iggqip0OGyKft9tKkhIbGLEuET7YNmEgDky0A1ukRBFpMbBFP8Hf5gQT/t8VnGsm8HK6
         4avw==
X-Forwarded-Encrypted: i=1; AJvYcCUm4c3D392/HAEO/xXpNyX91EOHk1n1HzBaJIZdLSeixQDC/8HqumbVJBovsKSB+H/INuw4CUX1PxhpSp3T@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0vg20RZjgpqyfhsGFI249XHwP/uWR1SZjZCFVjhLIFM5cNdPg
	eogc0dFEZeevTi9GFU5asdUI6hV0D7b80uMjxKJxMXLzguC9zLKVLygXdq5Q1NNJnSzw968TP5G
	cNGcB
X-Gm-Gg: ASbGncuIr8k9P3OUhCpxeES8SiFLRfomCi//Ds/icCUo/oWaU7hUk0+qTjnGv42uTdd
	BohSfLEvpt1oL8PNPdSU7+Wi9GVd7GV3u4Du/ibzqY6gfgxqav5+ftWeBlyF3hRnLQ1264QgM0g
	HNXP3uZXJQHSZgMyC2yneuVuVMMdOTaubj2BmqQr5usrp/uYmBY84iq0BRdkS+mrvS92IUX6DDR
	MlQTzNyiaEKZOMAV+LSl84EjtKKUOe/eIAOvciguD5Wsaa870HL+mmwJYgJhJjjYh8mQhtapD5v
	MfTp0vB3Xnhh0iVP0C2ow+9uDLWcRgAE0LgxuhSsza5aofbkYO/wKakaq0hK2oKHpkzVYyRHybJ
	Jh6M1bYUP5NBxB2PjAKsuKWvT4fnMkSy8tqhLRIrTdAGVUvaoFhA9o/+XV6o539mmTuZvyYovdi
	nw2oCzsRY=
X-Google-Smtp-Source: AGHT+IE1m+nQ54jIFYeRNZBBdmIrk3sobfn8Briv7MJVBw49u20S1jYw8ms5t6p+s+eYbpEZPMY35Q==
X-Received: by 2002:a5d:5f82:0:b0:42b:5448:7b34 with SMTP id ffacd0b85a97d-42cc1301cffmr27263237f8f.7.1764244158025;
        Thu, 27 Nov 2025 03:49:18 -0800 (PST)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c3022sm3471942f8f.4.2025.11.27.03.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 03:49:17 -0800 (PST)
Date: Thu, 27 Nov 2025 13:49:15 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add videocc node for SM8750 SoC
Message-ID: <pkxzaibmvuzugcapgjvj64u35xbhjjk23k4d2qhnwv2ods63tk@ovlcxtphghsk>
References: <20251126-sm8750-videocc-dt-v1-1-a848fbfb257f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-sm8750-videocc-dt-v1-1-a848fbfb257f@oss.qualcomm.com>

On 25-11-26 23:39:29, Taniya Das wrote:
> Add device node for video clock controller on Qualcomm SM8750 SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

