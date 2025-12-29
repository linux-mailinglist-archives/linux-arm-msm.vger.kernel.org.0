Return-Path: <linux-arm-msm+bounces-86844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A5BCE6BDD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 13:43:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FA21300943E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 12:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18EB5311587;
	Mon, 29 Dec 2025 12:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nynj602f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eciGk4Ni"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A493112C2
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767012204; cv=none; b=SZHhFZwmpbuA2hmvWHBVLwlegXn/lXiA8xNyR3oSSWUptUag1S0L8BuaJWhiQucMBugVe8/yFHHT9uaC1ua9V7knwqtOcRxi6yaK/fYtMgFiQuEQfkqimCzM9cb+cuboO6cb/TAf0Opdk9yfQ6ekkJpmn6zFLiDt6CDaNKeq9sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767012204; c=relaxed/simple;
	bh=bSZoZsiLj2JiFTLgKpCV8BYB5sDqBU8uBZvq81MOOI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=es40hAdekAI4OgEGgNPT6nlYazT2qb/fDcePGe3UspwUmQYwiIHcUoRF8+3wejR+vNRD32I0f82C2i+gkSzUYk74wo8+BuwEu/rQkkbiYC0VPa0cZPo2C62Q0cIjTxFS1J5n/FeTCvQX7HH40M/FSsxgOGzx1JFZJooPLoRlc70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nynj602f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eciGk4Ni; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTA2gvg3289552
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G+XuLGMhvbnliT0rTpXen2H6oo5ObngXPbcaKjGwzw0=; b=nynj602fuU123prB
	hgZ1Ejlx/widJZeNmbsjK9MLx/J52xZShti7rQJb/WlgiVtnmWmRKLyR48Uzjpff
	1AKaFjKqpPveK8zgKkmBchAiBcb0qYk57GGircvr3jzypSje6hLhd+CnLoSgxUOy
	I64R2L3lzWp8QVyVx/wi7K53gYJuu+rCAJgQjuExtUDhSYVV36eF5p84Riy0aIjt
	JECI7v461+eIEEuome4yTgC2FBJ54iTKEykCTs6CSqHrcIIMC9twFynY7Tdc13c1
	l/ha2jICgMsQS4YNTX1tl36Mf25L5mNI2VOHk3slImlsgPT05BgF9rI/thTO2XFR
	5VK4sQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba4tnvhms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:43:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c231297839so70442985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767012201; x=1767617001; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G+XuLGMhvbnliT0rTpXen2H6oo5ObngXPbcaKjGwzw0=;
        b=eciGk4Ni/yCfVC32J7iGGqmO4VDd17waEdRBJT88xi4rkWJ/RpKsdpOnL8NK8grsNC
         lFstEEgAczW7n60ZfaQKzqGyLKmWOFfD4prwPgUsyPa+y4mlMayYJDVHjQjFs4GZzbow
         efIFmGJjF+0v30BE+RV28rkDL31tjx8LUfIBULx+aRHJDL0SioEy9KaGA+qmNf5ZoHZt
         tJB5MBt2TlLcghvloGMuQULTwwk14HOsTB/Ky1FE3wtphBPSB+u2f6ecsvCbsCRvMOh4
         y3n7+LVnjkyvgDEfmAjwGUivJ6NsGO251zLfxFQwmHPa8pEQuwT8jLPSIFBnCR6+AV9N
         U7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767012201; x=1767617001;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+XuLGMhvbnliT0rTpXen2H6oo5ObngXPbcaKjGwzw0=;
        b=ev2LwfpCDaZeS2RS2yu1H573eCARApZ+WLMoIeBeD1gm4RSmYajBdaHffemgkfPHJS
         s+Q1fX490OjZWNpJgtDaKk/1CSLERIKMTKHe5Nm00Hzqo+qt850WAf0EIyeY4twywHbd
         xK7tEEdkLCIHhfb4x+3KVBUUlOzlbzgcgzWdHY+IRGQwQ1TNBVlduin8p1vZ2GGv6lPs
         daCKK801jO5+bYLBil2IWqss5toRakTjwUthPGoSbVsKbQtnkhzECrzBojp79+TFmloJ
         Be5WGxYxTqF7PzgQSL8zKNol7w7rsdDsjGSNb3uVkUc2DWcJn3Y3dQWI+fz6X7UrqG9k
         kXKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKPJde7Q7/JO6HyoZLrYY4qcTB66lWnhzjY4q7yZXkF6ZXveUJKeOxITzpxJHLYMgXsRp8EuNLTkW/va6l@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhl3/ta626G16cF801uJYiTahshZRvN5LeCiko9kwzGEHUCE+Q
	iJP1pUr6cz3yfxlqh9deFSZfvBlJDstrZgFFR/q/KrKbmB73LI+jFSCTgDQP7NHJkFkysJRYEHL
	CInPwVSuFx5C8o6eRYyOrYv289+q1r+VB37Iq5ClkxVTEP/qVy2Yiw3QztDcw2rP0epRU
X-Gm-Gg: AY/fxX58O5OUJ69y25Nm0OtsSl8KXssiXYFM7PXZw5iXpWplgaBrJocckVuANd5xAYS
	l1pR4nK6aScR938g+tN8jxrb+NpWEW1iyPZHsRyNdn/E9MZNeWd91cBiiv0S7sRnFeSQw35SFns
	KKS505jZ4R+HqO2ffsoL+YloXJQ05iPlfGAyOvf1HleU6bt/WGigyDjDrI8pNzUv419fsFUE8PS
	irCDZsxr8cgusiC3RBdR7B2R4HRH/5sPY1Rv756/kVHLDaXm/wE99k+ga4YPd62ItYowA3OFL32
	d82uD7mthF+CAV69Cwh4ayuVWLvcVGKwccj8HOp/BVRvRwdapZvGnkmzBEt/u0y5n+WMF1ujKxU
	KQ552cPwFbNf1bdFkroQl82b4p26rwuXb+WJKIxbCQd8ufckxNm07nN3iG2kaABHm6A==
X-Received: by 2002:a05:622a:11d4:b0:4f3:616c:dbed with SMTP id d75a77b69052e-4f4abbc85d9mr342626781cf.0.1767012200764;
        Mon, 29 Dec 2025 04:43:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmDIMOUx5DX9makM8S33rc+8UOuCSQWXfnqDfTNCM/Kaofpz9pLFSyR+XVmGNA/dXgGbNI5Q==
X-Received: by 2002:a05:622a:11d4:b0:4f3:616c:dbed with SMTP id d75a77b69052e-4f4abbc85d9mr342626571cf.0.1767012200353;
        Mon, 29 Dec 2025 04:43:20 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b90f53c70sm31981041a12.6.2025.12.29.04.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 04:43:19 -0800 (PST)
Message-ID: <90264256-f53d-4a12-9b37-4cc43720c181@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 13:43:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: agatti: Address Gunyah memory
 alignment needs
To: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, akhilpo@oss.qualcomm.com,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        robin.clark@oss.qualcomm.com, lumag@kernel.org,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20251229071258.456254-1-sumit.garg@kernel.org>
 <20251229071258.456254-2-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251229071258.456254-2-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G+YR0tk5 c=1 sm=1 tr=0 ts=69527769 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=h1oq9fln5TFPHMweCzYA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: bGaU-dlFZYitnj4muZazWGvLP3xpzFyn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDExOCBTYWx0ZWRfX8+T6DYvvRbEN
 OPGmGqp4vwVPNyrLGqCR/B4Rr0Lcn7tHwDkHc8jpZlAOwdVzdtqP0kxp6NVLA+pAdwhmO/EMtrB
 GbOHTQ8I0vZHFppXqFxfNVUmglCoKrljAyQzWF3q+AVCMBFxEaVkUvWFsm3/IepcsXW9+/QzsFk
 61KwegW29y3x7EXBYY/Rrq7Sxw1gkVJUJNUQbGWsrDuZ6ILvbWUgSyVBE8tzn74UFE/lkB5Nr4/
 lupFWw2lrLTDqvk4AwJL3yKjygfkOlejQFwAz2TS25VIEN3EgA9htrJetJUUeGxVmBVssg4HGIL
 QBbPBMXWbBtNmpPPW6pQPhbncWnqj7Acg82k+HIdFavydg2qw3PHhaBnuNief2UVhT0WpUSoR0o
 fovTstC4E1Zal2V5EIaz7UouZR2SYkJW8kFOZ+BX0QRCBCh6OTcYK4y2SUYbF3U9Etv1RVq4f5n
 64WXYaEqGl+WI0xqm3g==
X-Proofpoint-ORIG-GUID: bGaU-dlFZYitnj4muZazWGvLP3xpzFyn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_04,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290118

On 12/29/25 8:12 AM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Gunyah hypervisor requires it's memory start address to be 2MB aligned.
> So the address map for Agatti is updated to incorporate that requirement.
> This should be a backwards compatible DT change which should work with
> legacy QHEE based firmware stack too.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
> index e705eb24160a..153916980ac0 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> @@ -298,8 +298,8 @@ reserved_memory: reserved-memory {
>  		#size-cells = <2>;
>  		ranges;
>  
> -		hyp_mem: hyp@45700000 {
> -			reg = <0x0 0x45700000 0x0 0x600000>;
> +		hyp_mem: hyp@45600000 {
> +			reg = <0x0 0x45600000 0x0 0x700000>;

On a second thought, please add a comment like:

/* Gunyah requires the start of the region to be 2MiB-aligned, QHEE doesn't care */

to prevent someone "fixing" it in the future

Konrad

