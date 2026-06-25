Return-Path: <linux-arm-msm+bounces-114458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Omw+Jl3bPGqstQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:40:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E43696C36E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:40:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lrOc8xep;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Okj7SqIK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114458-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114458-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 675943064E39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 07:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53AE5380FF2;
	Thu, 25 Jun 2026 07:38:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A45535DA5B
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 07:38:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782373106; cv=none; b=RjEyOEjCC/eu72iXnE/JWUZi37B0Qr+ecjakbBZReFUVhXBh3MOugSYXU58Fe3bqtZKvrC88hPAFLICwvV05OdW0okCSkr73kV7S3baCr8KZOYkMgm2DITHJ89TT3nVOZT3RwpBCZ6v1Jsn75756kDeIqgNMfkpJx9awUv6bZb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782373106; c=relaxed/simple;
	bh=94BLnJu/Y44ro9VZwEjhoTWgcdouLHYogTgolaSAjHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SoeWB+eW1iBD8d0XBcohhz+i1xd/Qfm4MUqfkIVY2jbRjGKFh3rWv1yo02dExKeOs67EzdwpE1JUDWnPtP42OF7ufg04HKQBOzB4mqilb1fm5hx4+w5Qj67ukD/i2yiu07XBfONx4SFRkEr0QvxK+DEEliBP/z/rKr0A3Naw31g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lrOc8xep; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Okj7SqIK; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3eL7Y1102913
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 07:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0kMOW4i+4XV2WgAdnsOAr0reBkKZzZYazMDcvSB30UE=; b=lrOc8xepROZ3JvYm
	Blh/tVWTxMfrAFsytf47oi2cXGKOnmJTQBAHBS7WDEWC1oFwIpeo+fJAbnHYlUVt
	0NPlZXMKXmMffFqWIx6gYoigCVYtCcnekQxAjj//4dWuFi97QZ9+3+FsGvE09mR3
	I5hug8Lw6ujgZ5XE6773IU8y7J8UG27FOycsotkLXNwxRUR1Z8Uz1GPLwx+50QcC
	iFySBP4eSgnA53OsKtsQlahGfTUkq6lIMLUsBG60NyGscxbTGKZfJSSh941kx8DQ
	xhHUeyl5ZF+MNKZX/6LoWR9f5qOz2li121y+hkS3koONnjTBQrLmVC5cnV8NdMMc
	FOI7MA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ueu9309-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 07:38:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-922548a7b0eso19558385a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 00:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782373103; x=1782977903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0kMOW4i+4XV2WgAdnsOAr0reBkKZzZYazMDcvSB30UE=;
        b=Okj7SqIKDO9L3OAc+IB1+rUprPjQkrqVEDrXOphIveOHKioxZbhjh7kJYEFcKIj92g
         63bbHu+Z2LJQiWFqhfhwE+aHleAOK5j0p6vD3jIMeQPnrLqANFJgKa9k9fCSyJVpInue
         VR6SDKln2fX2qpZltkQLkdfp5TYqmhhwkZyc5AvQeHQsloPpd0SoIcoMRz2N3etes+FR
         byxTtyc+8C00d3a/OHb/E4poE76ue+IkCzhjrCPPTHvHiL1bF6eYU59mycsiZqsYY+Eb
         Z2QD7QUzUh4gAT8lgL/yDVuRS4kSf+DUWfzGr1HJO5+6/cL1tpmwhEstaOtfhCWtdNbQ
         Hamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782373103; x=1782977903;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0kMOW4i+4XV2WgAdnsOAr0reBkKZzZYazMDcvSB30UE=;
        b=NfoO67PF9GsG4DizZi2hDc20H46Xt/GiwGq8cTp044ipi9CP+7zaskEaRApLM9S1c2
         87flyNlGBjYyGkpw1PuwvKRrLNaPrCfv1rC1IT1yu+fcQ+fbLLfqC3rjZKUSJXZynTZy
         V262NqDmXF3uKlavdfRo8Is86MOXTozKJTTFDXAPClh+x6/LLGk9P8So9XOlcvNt2CZp
         UsLWIhvixnbyVlz5570RNHe2JdPbT2L8k4rhfL/1XgqDk34K4C0gxPeMxYFJCpT1ph3T
         3dGUGN0gs/IV8Sm1ic7qK/ZhrS1gk30Qetvx75fvYQQ0F8xr9szZ2qgPbpNdZe8bhAhx
         NdiA==
X-Gm-Message-State: AOJu0Yw/vHBPDC60Mh2Natdmzhq4LzBZZoWHQovHoJiDOcJan8b4hBzE
	vPIHp5/FlxGRV4nE5I07wmvRcgp1zBOXSbnVylvlsJZz6lD2tCseUhEj84S7tYUxuoT6l5H2CEN
	XzMAUh82bN8F/zF79iKRLqv7OZRs1CSuzI6aOQYLgav59SdI/AwUvDNWommh4GsJEaTrs
X-Gm-Gg: AfdE7cm1cN8AhgQBqbXbwZuGG/8I2JLGvPAQOYRvgrIb+sp2xXFMKCxHC4nourZsg8s
	vwvA3oS6zqOA2yt+LyXdH4zBjFMEzhEip9r1fDKhRE72AC+MQSQpBQWmPzii6SAOx54bvAyFJL5
	/ilDemwVtts4gDRnVlwCrgJkVc+U0dTD50JGhp+SHAfhWzNCbdLaX8pE07fD2C/gW6MWJWQQEGC
	jetuw0Ynh1Wh2ULaf36xhNDwBOJ+1+LBP0DAnfBEFl3fqOxfbd9poqQNhJoxW84krw8sYp/d7bM
	Tr5yjxMTgi6hk4nKniDHgjf9YYpH2VgbGr4SKblUr0a55wZ0vRHvy/VvA7mr1uKVcsmsekFKJch
	oFmTlS7GBx8UCpeAZ8NLc4qXoYD4rteKalY4=
X-Received: by 2002:ac8:58d3:0:b0:510:144a:636 with SMTP id d75a77b69052e-51a72ad2276mr10886241cf.8.1782373103380;
        Thu, 25 Jun 2026 00:38:23 -0700 (PDT)
X-Received: by 2002:ac8:58d3:0:b0:510:144a:636 with SMTP id d75a77b69052e-51a72ad2276mr10885901cf.8.1782373102900;
        Thu, 25 Jun 2026 00:38:22 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbedf971sm120256666b.62.2026.06.25.00.38.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 00:38:22 -0700 (PDT)
Message-ID: <ba15ebf4-ea95-43ce-b612-8df25a9f179a@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 09:38:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] clk: qcom: dispcc-sm8450: Fix mdss clocks
To: Esteban Urrutia <esteuwu@proton.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-1-37e2ee8df9da@proton.me>
 <65873506-1a9a-40ec-ac67-60f61a0b4b4c@oss.qualcomm.com>
 <9bc524b9-c6da-47a1-a7cf-abeb131416a7@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9bc524b9-c6da-47a1-a7cf-abeb131416a7@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pdjmN1pZrKFe-f_t3kXijCKpGTHWNnWf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA2NSBTYWx0ZWRfX4GhNbIJ2CYXn
 q39dF572zV4EROHsr8S2YRfVOhUu5VidHozVKCRL3Su0+yIhwUrsTL1tjANW8GHO/PPI/Qz9RH8
 alw54f5DTim5FX90E3U+AzQGzin4W+4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA2NSBTYWx0ZWRfXxfnxQDLGDqfJ
 m6VROc44ZJPRnSCCt5VPS+VLcUwj+N7PDRCRuAooaTe5i/JpQ8Iw8x7ta8gH4VfXBUsNZ5STtG5
 CCF3e0nyMqFUYBF1fnzacABf4zwmzS5ESJndKeggSAdKBjSq9m4tXSjyoxoLW7PB4Iw338xf/J1
 fiwepBhmsjBlv2FYiuuOj550aSSP44LW1etvRpm9TU6WlsvXHFwye66MOz5mHjRcKlQsH7EovI2
 QgCBFbMDGcwOf4EW5k+3eLkHL1fKaGyqg4qtWaH/lXk/0FEd8K0mMhm61V3MAZC60BIscdYJ6KO
 Ba2eJ2esGTMYo/Ju68M+Mwji55Xp8lDu9N8AzLZ6T0uljXEurYnOyW3zGveWXVUfGD+hXUf0AkI
 hBPCLtDraAVnKE820JXNzGR+GAJ4fc+TC6yIzjDFkckqrB3kLR/kx60p1htv6AaLJRjRuHW4BfR
 wFRfJ3DS4VI8bWNbmaA==
X-Authority-Analysis: v=2.4 cv=b/SCJNGx c=1 sm=1 tr=0 ts=6a3cdaef cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=yUEngxm9hVyLX7FlFv4A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: pdjmN1pZrKFe-f_t3kXijCKpGTHWNnWf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250065
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114458-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:esteuwu@proton.me,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-phy@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E43696C36E1

On 6/25/26 4:22 AM, Esteban Urrutia wrote:
> On 6/23/26 11:50 AM, Konrad Dybcio wrote:
>> This can also be fixed by migrating to use qcom_cc_driver_data,
>> which takes a list of alpha PLLs to be configured, and thenthere's
>> a switch-statement in clk-alpha-pll.c that always assigns the
>> correct function
> 
> If this is done, should a patch that migrates to qcom_cc_driver_data and a
> patch that fixes the issue be sent, or should only a single patch be sent?

It's fine to just have one patch, but please mention that this
actually happens to fix the issue in the commit message

Konrad

