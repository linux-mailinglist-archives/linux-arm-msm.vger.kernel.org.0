Return-Path: <linux-arm-msm+bounces-111110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IUH5H0MEIWq3+QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 06:51:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E986F63CE0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 06:51:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZXaoURqK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CS2Dlub5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111110-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111110-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B0F530358A7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 04:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D79DC3AEF2E;
	Thu,  4 Jun 2026 04:50:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBB5366822
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 04:50:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780548647; cv=none; b=ZzK5CvJBGRY7B3nuvpc1woJ3htWpzlVjY9+IlFlsNJy39uJHVYhZ7/EWg0obTywJe8Fx2rmnk8U/uezYpgnYFOB+1T9QVIq/wWnsdBcZjl8MFspddPaQb43AJa4EzvmgAdopReuqrk8F2VktTh3EQL+1WjiTWS42/4t50uQ92Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780548647; c=relaxed/simple;
	bh=Wph+A2Eh0fRuUr8JeVccG39Urowhu5aGUrpMaWqUJ3M=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Bx+N0XKmeHwkK1u5ffJ3zQ4TQVGfI0almwczU+SgAXcKnvvISeABGhEIOHWAASB0b+MYG4NNqqlCwqlvU51ct+mZJlaYmeErRtvQ9opokIU3cAZNYhywAxAa8hVyPLxd17yPHbcAZAr/ztC+l0tZIRmEjycSbUkRcpFgbB2lEaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZXaoURqK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CS2Dlub5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653LeeCq3240517
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 04:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ESIghRZ2Q2Bdn6SkUB0gmkzzf5Jlh6Iv1X/YZJpA+ic=; b=ZXaoURqK9zJLktZ3
	ydE4bC2TKh7+eYCMg2gry3RyCa3cYUZ3v/s0LzZrtLNvBPKLo87FeIOUoYiAD/Hi
	i77lAVMck0KAnhI1tQR0h0eprXAIj/LuxB/mpIpObmNLpcuYhhoLGQOHAHxdmls+
	Uh4dIugxKi3MxLmjloPLbexXZP5Wtcclw8EaT2M1LDNn7P1TKtFHzzbLdiC0P98l
	KNATlkbrXr2VUA7c4tfsVB5Wae0voXfpUrWrtDPSbDUXjpQXn85fGZr6lK3TFSeQ
	cWpJrDyGnL0Hk52Byc7F2rbXR5FfZiMFApKcpnSZWebLhjaGIp0WVQf3so/DOkhy
	ZOfAWg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejvd0977b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 04:50:45 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-842211d6e48so411309b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 21:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780548644; x=1781153444; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ESIghRZ2Q2Bdn6SkUB0gmkzzf5Jlh6Iv1X/YZJpA+ic=;
        b=CS2Dlub5of2k5MMhSbL1FX8cM7ZyxAvbWWxQ/wWs/+Aa5isf3uDc5Jliv1DR98FK2X
         vHuH3EcKTcC7KMewnSBCX1KJr9d/cSa8M9Enbl4zfU36xpvEQ0v1LXyVyXB1jxXnjUEC
         6j0atYyCl9O0/eia8DSxnAMbz3IbhvaudzjD0et58SknSnlBxPOF/u2NraaD0AzCAZvZ
         9ZdHuV5NMbA5XAoPjmZqU6XZJS2EtFDmxCCe+GSx22/tZ8zFdk6JlI1QVAiWWaQ+bkuY
         eRiZ/tqH0AuNjAdZTuCiraREngjcOpd3gH/Gn+RtqeCT6ZmdPrnChsLqiQ2Ef5Okf/AL
         lMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780548644; x=1781153444;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ESIghRZ2Q2Bdn6SkUB0gmkzzf5Jlh6Iv1X/YZJpA+ic=;
        b=JLLAyGBLvrrKIaDXkmHo2ybvEyiMRq5KClcxW2CWZ0NopFRL5pQeB/2QYfXuj9F1Qc
         r+PK6ZB1tc8hez4zDUr+pp2q6RXFXKVkGZnvIuZrjEX6bO2Fv/T9T8pGbPuAF1YHNScj
         2t1sbCvj7+QtzjOfTzjnbkH0KEHBC9zYvnJhmYdIFgr+vSJtiDoRJmnycZorav0knUcU
         vS7R8T46nPy0FiVhnDTBFx0q/oD6EtN6ru6H/kZLRGKPg1quPCJoVBGytlekXRbrYyJx
         Z7gwwRC/STur+cxiK4M7hooSX8xNaRb6Rbi5GkVZvHuPHR7+DXdhsgcVt4yOrqITaR+9
         601w==
X-Forwarded-Encrypted: i=1; AFNElJ/r/8TcvNHAeAaVhVV9Jtj9gfebj7g5L+SzhDa5TG6D+wAPhAAtKfM+IBYCOxlLj7h7SgW8X3LFlvZD9ZPd@vger.kernel.org
X-Gm-Message-State: AOJu0YzbmRrhx3EaVKfcGIlmWjVVEgrCCoQyIL/bb7K2V4X/yiFSS2eK
	RCFdZ3cJgXYOZg+J//NakFt0iPLl0wfUvKh/TibM+3YBUP1D3ZSQ60aA9iyY5Sm9LsC+iADSWZY
	WbzC9fabYd8ddKu4bBP1pyUf4DqLCiNOlkywdWuT4RZCzCyRPPDoeN/JENws8Wm6C1N+z
X-Gm-Gg: Acq92OFKmFY05iCSZ9yBDJtDfFHERQD/lgSm9/Yitp8uKRwsiYsV7of6ysdU68OIb1n
	Fpzquto8I628pl3s7Dedl1XjlEXWm6tsSje0YicEiyVGZJ2dT2oo28sFZEQigCJe2Fk/qtuzFlq
	bWW+fNLiTmoThYGjTJt86OvYVckAK6vTKxPf/A2MEXZBpZAmgBO20lEMjDz7WDOHtNN7t0GzxJ4
	PeZ+PPSi8MyKlrNtqU0Z5+WwGCFRw4B0rqJ4NV31SBTkEPUuA48SjiBtFyWJwfazq1YWvXcjMdf
	sAa7yqKBGoNLOUQMMW7x+CpgjO4VB2FG7aW/I/IxdyUscv9aaGT24cyP/mQvhADZQq7qx3EEgjN
	wZMV7FwkIifVYsnMlTy20JNJpdfeLuwXgYeyxFOtPwTorro9Ze8n/YXKfN9Re
X-Received: by 2002:a05:6a00:4191:b0:842:5931:7b88 with SMTP id d2e1a72fcca58-84284dcedc6mr6339870b3a.1.1780548644036;
        Wed, 03 Jun 2026 21:50:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:4191:b0:842:5931:7b88 with SMTP id d2e1a72fcca58-84284dcedc6mr6339840b3a.1.1780548643554;
        Wed, 03 Jun 2026 21:50:43 -0700 (PDT)
Received: from [10.217.222.63] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428291ed20sm5397566b3a.61.2026.06.03.21.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 21:50:42 -0700 (PDT)
Subject: Re: [PATCH 3/4] crypto: qcom-rng - Remove crypto_rng interface
To: Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
        Om Prakash Singh
 <quic_omprsing@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, Olivia Mackall <olivia@selenic.com>,
        stable@vger.kernel.org
References: <20260530020332.143058-1-ebiggers@kernel.org>
 <20260530020332.143058-4-ebiggers@kernel.org>
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Message-ID: <021127c9-baff-816d-e053-897a7d4043d8@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 10:20:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260530020332.143058-4-ebiggers@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AVdx77a2F44eabSlDrbdVrqDMgk3q9O3
X-Authority-Analysis: v=2.4 cv=M8h97Sws c=1 sm=1 tr=0 ts=6a210425 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=cDBTOOi3T2z0a7_xwZkA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: AVdx77a2F44eabSlDrbdVrqDMgk3q9O3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA0MyBTYWx0ZWRfX/QT0xw49FbtC
 TehDtVJ7bAcNfJvKvb3uuRN9YFlEKe1vlm22Vj4bg76DHduDXNCEl2zN6hPQIgiezfp+H9koswh
 UnNhL+b7EFUdi/AdupXaUrAAmg0cmo0hh/NtOokLBW6+K7GpJwI0/AZZ3WVgd6tkSxM2z0vGQKp
 GkrqqOQgdHkE2vzcBD0updjN3gUKoxSG3766sYgF9a93sd9ZaT8v3UtZjHZF2nYVe6m+qnUI6SI
 uOJorzutfjSaN/mYRTzpe0GeKqY4ZC3oP/Q3/xEjARDAhIDphVUY2gl/vW/pCYPvRynmqNEGZpb
 9fdZ5oCofaijvvCDcHSooEnOnLF19DSae3Q5yTJx93AAfochnVwo6X+B6gtO1ClcrC14gjj/ENs
 x8clXOo1/eePlJ5+joeEDGCP7kw2XrqAvk3zNu79p2nf6rZjO1cfbz3fgkOrUcBiBzqKsiuUhDI
 QVeSrD/mfjqHq4SIhXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040043
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111110-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:quic_omprsing@quicinc.com,m:quic_bjorande@quicinc.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:olivia@selenic.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[neeraj.soni@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neeraj.soni@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E986F63CE0A



On 5/30/2026 7:33 AM, Eric Biggers wrote:
> qcom-rng.c exposes the same hardware through two completely separate
> interfaces, crypto_rng and hwrng.  However, the implementation of this
> is buggy because it permits generation operations from these interfaces
> to run concurrently with each other, accessing the same registers.  That
> is, qcom_rng_generate() synchronizes with itself but not with
> qcom_hwrng_read().  This results in potential repetition of output from
> the RNG, output of non-random values, etc.
> 
> Fortunately, there's actually no point in hardware RNG drivers
> implementing the crypto_rng interface.  It's not actually used by
> anything besides the "rng" algorithm type of AF_ALG, which in turn is
> not actually used in practice.  Other crypto_rng hardware drivers are

How it was established that there are no active users/clints for qcom-rng
using crypto_rng interface? If there is no concrete way to do then this
patch breaks backward compatibility.

> likewise being phased out, leaving just the hwrng support.
> 
> Thus, remove it to simplify the code and avoid conflict (and confusion)
> with the hwrng interface which is the one that actually matters.
> 
> Note that while this means the driver stops supporting "qcom,prng" and
> "qcom,prng-ee", it didn't do anything useful on SoCs with those anyway.
> 
> Fixes: f29cd5bb64c2 ("crypto: qcom-rng - Add hw_random interface support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>  drivers/crypto/Kconfig    |   1 -
>  drivers/crypto/qcom-rng.c | 175 ++------------------------------------
>  2 files changed, 9 insertions(+), 167 deletions(-)
> 
> diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
> index 3449b3c9c6ad..a12cd677467b 100644
> --- a/drivers/crypto/Kconfig
> +++ b/drivers/crypto/Kconfig
> @@ -658,11 +658,10 @@ config CRYPTO_DEV_QCE_SW_MAX_LEN
>  
>  config CRYPTO_DEV_QCOM_RNG
>  	tristate "Qualcomm Random Number Generator Driver"
>  	depends on ARCH_QCOM || COMPILE_TEST
>  	depends on HW_RANDOM
> -	select CRYPTO_RNG
>  	help
>  	  This driver provides support for the Random Number
>  	  Generator hardware found on Qualcomm SoCs.
>  
>  	  To compile this driver as a module, choose M here. The
> diff --git a/drivers/crypto/qcom-rng.c b/drivers/crypto/qcom-rng.c
> index b7f3b9695dac..48b605687b28 100644
> --- a/drivers/crypto/qcom-rng.c
> +++ b/drivers/crypto/qcom-rng.c
> @@ -1,14 +1,11 @@
>  // SPDX-License-Identifier: GPL-2.0
>  // Copyright (c) 2017-18 Linaro Limited
>  //
>  // Based on msm-rng.c and downstream driver
>  
> -#include <crypto/internal/rng.h>
> -#include <linux/acpi.h>
>  #include <linux/clk.h>
> -#include <linux/crypto.h>
>  #include <linux/hw_random.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> @@ -30,28 +27,15 @@
>  #define WORD_SZ			4
>  
>  #define QCOM_TRNG_QUALITY	1024
>  
>  struct qcom_rng {
> -	struct mutex lock;
>  	void __iomem *base;
>  	struct clk *clk;
>  	struct hwrng hwrng;
> -	struct qcom_rng_match_data *match_data;
>  };
>  
> -struct qcom_rng_ctx {
> -	struct qcom_rng *rng;
> -};
> -
> -struct qcom_rng_match_data {
> -	bool skip_init;
> -	bool hwrng_support;
> -};
> -
> -static struct qcom_rng *qcom_rng_dev;
> -
>  static int qcom_rng_read(struct qcom_rng *rng, u8 *data, unsigned int max)
>  {
>  	unsigned int currsize = 0;
>  	u32 val;
>  	int ret;
> @@ -77,41 +61,10 @@ static int qcom_rng_read(struct qcom_rng *rng, u8 *data, unsigned int max)
>  	} while (currsize < max);
>  
>  	return currsize;
>  }
>  
> -static int qcom_rng_generate(struct crypto_rng *tfm,
> -			     const u8 *src, unsigned int slen,
> -			     u8 *dstn, unsigned int dlen)
> -{
> -	struct qcom_rng_ctx *ctx = crypto_rng_ctx(tfm);
> -	struct qcom_rng *rng = ctx->rng;
> -	int ret;
> -
> -	ret = clk_prepare_enable(rng->clk);
> -	if (ret)
> -		return ret;
> -
> -	mutex_lock(&rng->lock);
> -
> -	ret = qcom_rng_read(rng, dstn, dlen);
> -
> -	mutex_unlock(&rng->lock);
> -	clk_disable_unprepare(rng->clk);
> -
> -	if (ret >= 0)
> -		ret = 0;
> -
> -	return ret;
> -}
> -
> -static int qcom_rng_seed(struct crypto_rng *tfm, const u8 *seed,
> -			 unsigned int slen)
> -{
> -	return 0;
> -}
> -
>  static int qcom_hwrng_init(struct hwrng *hwrng)
>  {
>  	struct qcom_rng *qrng = container_of(hwrng, struct qcom_rng, hwrng);
>  
>  	return clk_prepare_enable(qrng->clk);
> @@ -129,159 +82,49 @@ static void qcom_hwrng_cleanup(struct hwrng *hwrng)
>  	struct qcom_rng *qrng = container_of(hwrng, struct qcom_rng, hwrng);
>  
>  	clk_disable_unprepare(qrng->clk);
>  }
>  
> -static int qcom_rng_enable(struct qcom_rng *rng)
> -{
> -	u32 val;
> -	int ret;
> -
> -	ret = clk_prepare_enable(rng->clk);
> -	if (ret)
> -		return ret;
> -
> -	/* Enable PRNG only if it is not already enabled */
> -	val = readl_relaxed(rng->base + PRNG_CONFIG);
> -	if (val & PRNG_CONFIG_HW_ENABLE)
> -		goto already_enabled;
> -
> -	val = readl_relaxed(rng->base + PRNG_LFSR_CFG);
> -	val &= ~PRNG_LFSR_CFG_MASK;
> -	val |= PRNG_LFSR_CFG_CLOCKS;
> -	writel(val, rng->base + PRNG_LFSR_CFG);
> -
> -	val = readl_relaxed(rng->base + PRNG_CONFIG);
> -	val |= PRNG_CONFIG_HW_ENABLE;
> -	writel(val, rng->base + PRNG_CONFIG);
> -
> -already_enabled:
> -	clk_disable_unprepare(rng->clk);
> -
> -	return 0;
> -}
> -
> -static int qcom_rng_init(struct crypto_tfm *tfm)
> -{
> -	struct qcom_rng_ctx *ctx = crypto_tfm_ctx(tfm);
> -
> -	ctx->rng = qcom_rng_dev;
> -
> -	if (!ctx->rng->match_data->skip_init)
> -		return qcom_rng_enable(ctx->rng);
> -
> -	return 0;
> -}
> -
> -static struct rng_alg qcom_rng_alg = {
> -	.generate	= qcom_rng_generate,
> -	.seed		= qcom_rng_seed,
> -	.seedsize	= 0,
> -	.base		= {
> -		.cra_name		= "stdrng",
> -		.cra_driver_name	= "qcom-rng",
> -		.cra_flags		= CRYPTO_ALG_TYPE_RNG,
> -		.cra_priority		= 300,
> -		.cra_ctxsize		= sizeof(struct qcom_rng_ctx),
> -		.cra_module		= THIS_MODULE,
> -		.cra_init		= qcom_rng_init,
> -	}
> -};
> -
>  static int qcom_rng_probe(struct platform_device *pdev)
>  {
>  	struct qcom_rng *rng;
>  	int ret;
>  
>  	rng = devm_kzalloc(&pdev->dev, sizeof(*rng), GFP_KERNEL);
>  	if (!rng)
>  		return -ENOMEM;
>  
> -	platform_set_drvdata(pdev, rng);
> -	mutex_init(&rng->lock);
> -
>  	rng->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(rng->base))
>  		return PTR_ERR(rng->base);
>  
>  	rng->clk = devm_clk_get_optional(&pdev->dev, "core");
>  	if (IS_ERR(rng->clk))
>  		return PTR_ERR(rng->clk);
>  
> -	rng->match_data = (struct qcom_rng_match_data *)device_get_match_data(&pdev->dev);
> -
> -	qcom_rng_dev = rng;
> -	ret = crypto_register_rng(&qcom_rng_alg);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Register crypto rng failed: %d\n", ret);
> -		qcom_rng_dev = NULL;
> -		return ret;
> -	}
> -
> -	if (rng->match_data->hwrng_support) {
> -		rng->hwrng.name = "qcom_hwrng";
> -		rng->hwrng.init = qcom_hwrng_init;
> -		rng->hwrng.read = qcom_hwrng_read;
> -		rng->hwrng.cleanup = qcom_hwrng_cleanup;
> -		rng->hwrng.quality = QCOM_TRNG_QUALITY;
> -		ret = devm_hwrng_register(&pdev->dev, &rng->hwrng);
> -		if (ret) {
> -			dev_err(&pdev->dev, "Register hwrng failed: %d\n", ret);
> -			qcom_rng_dev = NULL;
> -			goto fail;
> -		}
> -	}
> -
> -	return ret;
> -fail:
> -	crypto_unregister_rng(&qcom_rng_alg);
> +	rng->hwrng.name = "qcom_hwrng";
> +	rng->hwrng.init = qcom_hwrng_init;
> +	rng->hwrng.read = qcom_hwrng_read;
> +	rng->hwrng.cleanup = qcom_hwrng_cleanup;
> +	rng->hwrng.quality = QCOM_TRNG_QUALITY;
> +	ret = devm_hwrng_register(&pdev->dev, &rng->hwrng);
> +	if (ret)
> +		dev_err(&pdev->dev, "Register hwrng failed: %d\n", ret);
>  	return ret;
>  }
>  
> -static void qcom_rng_remove(struct platform_device *pdev)
> -{
> -	crypto_unregister_rng(&qcom_rng_alg);
> -
> -	qcom_rng_dev = NULL;
> -}
> -
> -static struct qcom_rng_match_data qcom_prng_match_data = {
> -	.skip_init = false,
> -	.hwrng_support = false,
> -};
> -
> -static struct qcom_rng_match_data qcom_prng_ee_match_data = {
> -	.skip_init = true,
> -	.hwrng_support = false,
> -};
> -
> -static struct qcom_rng_match_data qcom_trng_match_data = {
> -	.skip_init = true,
> -	.hwrng_support = true,
> -};
> -
> -static const struct acpi_device_id __maybe_unused qcom_rng_acpi_match[] = {
> -	{ .id = "QCOM8160", .driver_data = (kernel_ulong_t)&qcom_prng_ee_match_data },
> -	{}
> -};
> -MODULE_DEVICE_TABLE(acpi, qcom_rng_acpi_match);
> -
>  static const struct of_device_id __maybe_unused qcom_rng_of_match[] = {
> -	{ .compatible = "qcom,prng", .data = &qcom_prng_match_data },
> -	{ .compatible = "qcom,prng-ee", .data = &qcom_prng_ee_match_data },
> -	{ .compatible = "qcom,trng", .data = &qcom_trng_match_data },
> +	{ .compatible = "qcom,trng" },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, qcom_rng_of_match);
>  
>  static struct platform_driver qcom_rng_driver = {
>  	.probe = qcom_rng_probe,
> -	.remove =  qcom_rng_remove,
>  	.driver = {
>  		.name = KBUILD_MODNAME,
>  		.of_match_table = qcom_rng_of_match,
> -		.acpi_match_table = ACPI_PTR(qcom_rng_acpi_match),
>  	}
>  };
>  module_platform_driver(qcom_rng_driver);
>  
>  MODULE_ALIAS("platform:" KBUILD_MODNAME);
> 

Regards,
Neeraj

