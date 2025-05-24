Return-Path: <linux-arm-msm+bounces-59283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD35AC2ED4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 12:18:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CFF7189DF1A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 10:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2985C1A2622;
	Sat, 24 May 2025 10:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZ6EYmOf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB9C4A1D;
	Sat, 24 May 2025 10:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748081903; cv=none; b=KkVcdMQNPFd1Raljbaf+nTMZRPApGlSQKw9A92EskO5pXXhKotHg75SUVR3hoGX176GaYKfpoCcCmsvua+31zwruemvZGC9D+Wn/5SjZDit04CcmR7Zi2/MNniH4h/JnROGlkcV/EUQiUNy3oW8iICHDoMuxEQ2Unc4oSN1JUko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748081903; c=relaxed/simple;
	bh=fegzFpIcG+9An2adNTrrMdYqP95RFa3AIn0vE9liKsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YKYdkASohZv81X73jXTTt69Dlwvf7/PR1XhKfNkXdsrEwI7RW9PYR3YVA3hWNT99LdeXS9+DTGP+B/8Eo3HadvHib78dIYW+Lm2FU++x3Ho+uMDR94BQ/JLx12i6apO8K14EuzgVXw+eqJWuLMOZz38eHumnU98TAXE+iye/FQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZ6EYmOf; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad564b7aea9so329512466b.1;
        Sat, 24 May 2025 03:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748081895; x=1748686695; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Dzb3JHRMdpmADz7F31upHZIM2rweK1WRKvLmimqyeU=;
        b=lZ6EYmOf2P7JnOJTN5us+pZ+W3lvBXwHOBjzcDgz0SI/vAPyH32zdJU1qbRSfo02sc
         019j2AT3kOpEofkEwk4Lk6naYbhn93u9+sHliU/iXfyhW+FfGrQe3hfy+FdbqGl4Vpzy
         n0c18bOaezWLprZ/N5cTuwpFweAhG4Fhs/KalScCkrQ5y4RqQZZVN8k/0ddnwX9nIYcf
         wV5euxsi6OQzpdSMugWllnlmJHq8M4ngmgZshiUbiqSojMPnNM7NgNSw3sFz2KwBCGYL
         hkEpaenvH/hGo751PR1IETMGMM16TELE6G5WcD1guUcbIvAWvNvdwfK9HT6Ck49V7tw1
         x1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748081895; x=1748686695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Dzb3JHRMdpmADz7F31upHZIM2rweK1WRKvLmimqyeU=;
        b=vr1fj7liPes5tLfHRPhmmWtoy6dJc2FKZ6ectS2+Lzhjw0U2sGtYamSg591n3qLSsd
         MnMpRXnWBKoEqSWM5VMRMgHo9RhNsduBumewNCFkq4jmk0YveuCAEDeLrBjYOZaaEyLT
         4ppDusLoJw6K21FbjRwGDmIcaHrY/g67PA7qZ7PTPlaoQriEEsr5zNrF1o53QIVGl3cm
         Vik+W/pK6BeA7sQaj98O4jxzTEWXuiiDftPhfpifgNmE1vW2D99S8e3V9k6urlbZGleu
         Bdb5mgjbMlXSLuNAOZrFOfolT3lm2tzvApnCRGv5pVXUSF4NfLQrrqjxkMg3UE936YK/
         7OUw==
X-Forwarded-Encrypted: i=1; AJvYcCU2yG03Z47Wd5ZbQt7zNnBXRE9H1GGdMgSXGExAPUS+bK5Hx4rHqgyp6xrQC2euqtHwaURHr3u3FuF7NSmb@vger.kernel.org, AJvYcCX7dq8UxxZURYvHIcHjs7dJCEk8WDL5lGVZAdfxzkumEjcH4w7lo0lyc1DHESc/qBb/NF+AwGXQKMYVmSdQ@vger.kernel.org, AJvYcCXr7EXHLw4FbIJzb64/WrwpAHB13gUjVsddFXOdiDP7H89cpb6R5+WDRh5pYC9C9SCJo32NguhXO3Xz@vger.kernel.org
X-Gm-Message-State: AOJu0YxpbwoVtN33fEbALPI3DTEapItQsBbt8TmNnR6+BoCYP47+qTwK
	CaUpjgmICTUgjp0ph3dPUNmHO25kSr3YcEIZ28kkC01gnBEoSGrbyNId
X-Gm-Gg: ASbGncuOaLnSwoPs1FGT6OLCz704hJV7Dsme69gbFDbtaXTDN+9+Fmrl3u5e/D6OjD3
	z77xDeCLLDpaZGNzTj/Epm2bPCTaSQ9WnpD+1t1+EDx7ifL8QHEFwDSjdTQ6pT+NTk8gMr9VWm3
	eLxkHhKpZq3ke7OG6F9ucigAKlGa97RWS13+j3mjUfAs5BFby57AmDvpNCWLh+JfB2cCbinXvnb
	D0Pvn3/nftjBO/PN73X+bVUKWesVYBkH+tS2WTg1RBUUs9zXHOKRMw3oRB+mvhY0/guZHdYzrMe
	0tmldA6k4g8oBqmb/BIKQN7LNNcTNrowqeBped6YDuC4KGRUSIErQ0kZcwqXp9kqjdUubU7r14g
	jVUz11pURGwWZuYam
X-Google-Smtp-Source: AGHT+IFNHwWIR8ptD43relRI1YmiVXvEBMPrnqyp9HLfaqyNlLeVc/aY4bDgRLRWImxYbuqH3dc5OA==
X-Received: by 2002:a17:907:1b21:b0:ad5:7649:b3f5 with SMTP id a640c23a62f3a-ad63f98066bmr615214766b.3.1748081895304;
        Sat, 24 May 2025 03:18:15 -0700 (PDT)
Received: from [192.168.3.32] (cpe-188-129-45-176.dynamic.amis.hr. [188.129.45.176])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06dcafsm1402536966b.54.2025.05.24.03.18.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 May 2025 03:18:14 -0700 (PDT)
Message-ID: <35ec4b1e-9502-4d4f-96cd-531c176dc82d@gmail.com>
Date: Sat, 24 May 2025 12:18:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-ipq8074: fix broken freq table for
 nss_port6_tx_clk_src
To: Christian Marangi <ansuelsmth@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250522202600.4028-1-ansuelsmth@gmail.com>
Content-Language: en-US
From: Robert Marko <robimarko@gmail.com>
In-Reply-To: <20250522202600.4028-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 22. 05. 2025. 22:25, Christian Marangi wrote:
> With the conversion done by commit e88f03230dc0 ("clk: qcom: gcc-ipq8074:
> rework nss_port5/6 clock to multiple conf") a Copy-Paste error was made
> for the nss_port6_tx_clk_src frequency table.
>
> This was caused by the wrong setting of the parent in
> ftbl_nss_port6_tx_clk_src that was wrongly set to P_UNIPHY1_RX instead
> of P_UNIPHY2_TX.
>
> This cause the UNIPHY2 port to malfunction when it needs to be scaled to
> higher clock. The malfunction was observed with the example scenario
> with an Aquantia 10G PHY connected and a speed higher than 1G (example
> 2.5G)
>
> Fix the broken frequency table to restore original functionality.
>
> Cc: stable@vger.kernel.org
> Fixes: e88f03230dc0 ("clk: qcom: gcc-ipq8074: rework nss_port5/6 clock to multiple conf")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Tested-by: Robert Marko <robimarko@gmail.com>

> ---
>   drivers/clk/qcom/gcc-ipq8074.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
> index 7258ba5c0900..1329ea28d703 100644
> --- a/drivers/clk/qcom/gcc-ipq8074.c
> +++ b/drivers/clk/qcom/gcc-ipq8074.c
> @@ -1895,10 +1895,10 @@ static const struct freq_conf ftbl_nss_port6_tx_clk_src_125[] = {
>   static const struct freq_multi_tbl ftbl_nss_port6_tx_clk_src[] = {
>   	FMS(19200000, P_XO, 1, 0, 0),
>   	FM(25000000, ftbl_nss_port6_tx_clk_src_25),
> -	FMS(78125000, P_UNIPHY1_RX, 4, 0, 0),
> +	FMS(78125000, P_UNIPHY2_TX, 4, 0, 0),
>   	FM(125000000, ftbl_nss_port6_tx_clk_src_125),
> -	FMS(156250000, P_UNIPHY1_RX, 2, 0, 0),
> -	FMS(312500000, P_UNIPHY1_RX, 1, 0, 0),
> +	FMS(156250000, P_UNIPHY2_TX, 2, 0, 0),
> +	FMS(312500000, P_UNIPHY2_TX, 1, 0, 0),
>   	{ }
>   };
>   

