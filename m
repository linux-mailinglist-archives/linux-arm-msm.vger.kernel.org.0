Return-Path: <linux-arm-msm+bounces-81433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDA9C52A3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 15:15:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 994FB503AE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 14:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39F2246BA7;
	Wed, 12 Nov 2025 14:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hlG5U3To";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tq3XVmE0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1304135CBA0
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 14:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762956181; cv=none; b=XotXFEUA2CRffeyHv+l3RstJYAP7souDqo+N8sz0z1bTv3+YdnjO3uUTJytES8nUT8JtyTdC8xX86eUj+KioZs4xym60Vnoq9FBId+dOPJe4S/DXNIlIzTU9m0UFB+/qkNJvBHpsXjs66EB71iXvKqJqa9++ZWcKSFzh74fDlTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762956181; c=relaxed/simple;
	bh=mM9fAjOXXwht9yAdsure33Nqj9S+xcHDp8imOVtYD60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eGfL5urO7CXMMvrXeeWRixs8EMtsEzZt5pMlT5JvV4EMRg2E3TbZwMOQOtGM4SsFZeSfpYpLETgkVKZJPQekeqKVIqFmSknQ0opftV9ttywZZW1YaNy0cmMWNVR07sQTmBAD+7entlLi4FRkQG7/d79nceu9dTkDKgujgRpzgVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hlG5U3To; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tq3XVmE0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACDsFiR1314302
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 14:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aTbuJi3FxUPkkWHKpmQ79xCiSdbgLHZBGK2oKYcauJw=; b=hlG5U3TohjmX4ClM
	fRmUhB+jeUucmH3r8qCOseKTaySRZtmTOBvAGRJ4JW6aHkxhslDqAh1XYSiSVsFJ
	po5HZYh5AADDR6Z4WO7Axr5BsWoJ2VyhTuSAHY/9YiM+SdG/rmVza0f8IFvAG+bh
	3l0iqhR8p1IxpWG2ZXDKCMp0KvZlpQOzvbUdyg5h0TcKoIF746oQCeM7MPK7aVuh
	+UJdwm2fheTdiC/BuI8kT5Na7lwwmJ0fEVvoZq3XER3k65xnr6iIyjFWuT3peoJr
	CNgR/jZ2qMG/34Ij/Zk0TVSaKhq1legtEY2LqbVeV6oJfFKz4OzDIkfy1zz6R1ET
	6nMgFQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acuhg00xu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 14:02:59 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-559ab9b8b24so32355e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 06:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762956178; x=1763560978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aTbuJi3FxUPkkWHKpmQ79xCiSdbgLHZBGK2oKYcauJw=;
        b=Tq3XVmE0b4YpqmvvBPFTFDdYEbzpxUsJsx4dHoFTvMmG4FMg8uyryZs/U1wZVoPcFc
         LSPt5Cbr6bGrQQBIPNTjTRoObfLG7VeFWGdUi7OWz5c2uUNtbgUSnTLy1AGTnPnfsS5b
         KmdNKbUCplw2SbZymrpYPAKLsdmfOmT///vyzp8FGz+ko1a8hrmAZQxDcowuRhsBPRJP
         APuGggUvAFVpXgP4XSVWw5S/6/qVv0HwQhup2E1lvvQqvO6ay8CDmrLL2Dm/HAeKcC9j
         mr/HbBQ5AHShYDLlSuu40wgop6hjh0v2DuhE4LRRu2c6thkPNN7IQAnKVcH39SahNAYz
         l5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762956178; x=1763560978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aTbuJi3FxUPkkWHKpmQ79xCiSdbgLHZBGK2oKYcauJw=;
        b=GhgTUu4XIprRNZevejdLWUDypMRBOPtpPNwvDdGpT+BUZEPKCEaW0btaAjUAsXpM8c
         2QereoDR+7ZKoTZ8GEfLXR+cY6/RpN3XScuwNIqluuYeNKcLJun+5NxKcb+wMVkoesw0
         TZ2yfBp+vJwHZ8LzBBXQjLYjEMZLH5CReRKGDkhBYLrEVv1boZzFUYQZO/1wIHbiLnuB
         Ghx/5cGgnbY2ZwiaAkb4oWgCZvfHzPDE8BYjthMfv60yq9bZIcEN3soTQarcgDcrD/0k
         YikbuSAWw5NrnIb5/OTtWw77eA/RbpE8b7QduY04THEyYxV9m9KGHv216+1qFl1mX2Va
         mytA==
X-Forwarded-Encrypted: i=1; AJvYcCWe/bYIdY0m/iT270NWxRTVoUwfwcoCS929s+jEh2rO4tkZg4nz88yCk/TtsZ6/296UG2/M1mYQGStO1p+Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfi/t4GWBrG7Nr2qynz0CQX71zTiknHYw8V3uNPDb1pTqVTrru
	An3E2ERZka0onqKmNPpxdeOypz0uSABbEqbFUq86WgsNtL07y7hxOZs5qKPKLoQ564DhLLqe97F
	pCXg6iAj2MSu/Iv7nmlD0ex7/9Iq8r/IaxYA753qytz10vecWqK0zLk4WjiG9lceXMO7f
X-Gm-Gg: ASbGncubcKQEx+SZvzhumAi7z5tR+3iJVVol0zYsW0zdL8e1BrFVwa/mk2XcZ+4xphh
	XYr018bIr8fqUdqm6Gzegopzwl8ZsF19nuOOjJHxd5EO5zsAP1OYGYXaQ4YGYzQ1OE1lDblswGk
	nLAFtfD6UUfOC0dS0N3HHDPwsq+iayTU9EcLBWSPaB8pVNbz4NPnsQkEovlf/NToCGwCGSQNGgT
	IDU89K5iFGuXcy+Cg3QgFtndl8a7WBr4/zVJAgfxa7+m6/dn6qENvbIDugg2nud+V5D75l2Pa1p
	yY8p0LGQl3bhJu69nvPhcIwgxBvjnb6o130499k58IPAa7hamyhukJcCYIqNNDmBGb180hAvWWY
	oiKmhGJ9ir2QIHV0TTnaQUiSdlgKPRlgvRuVUU/Udf0OQ/r9v46b7/c+L
X-Received: by 2002:a05:6122:3714:b0:559:ef6d:b3fa with SMTP id 71dfb90a1353d-559ef6dceeemr260919e0c.3.1762956177628;
        Wed, 12 Nov 2025 06:02:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDhrwzbfO9vyPZvREpumsSUOwwsoGszLlpvZhnJmg8bsJRAFxwMnbB6qzgmnQ6CjNSL43L9Q==
X-Received: by 2002:a05:6122:3714:b0:559:ef6d:b3fa with SMTP id 71dfb90a1353d-559ef6dceeemr260791e0c.3.1762956175682;
        Wed, 12 Nov 2025 06:02:55 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f86e9d7sm15873200a12.36.2025.11.12.06.02.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 06:02:54 -0800 (PST)
Message-ID: <02d7c0a9-0d24-4fd8-980a-da9d7307588a@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 15:02:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu: add actlr settings for mdss and fastrpc
To: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        robin.clark@oss.qualcomm.com, will@kernel.org, robin.murphy@arm.com,
        joro@8bytes.org, dmitry.baryshkov@oss.qualcomm.com
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        bibek.patro@oss.qualcomm.com
References: <20251105075307.1658329-1-charan.kalla@oss.qualcomm.com>
 <eb596f7a-e13b-4edd-8ee7-05424ea3d9e5@oss.qualcomm.com>
 <c4b1df46-e4b6-4d95-971c-7aaf33bd35f1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c4b1df46-e4b6-4d95-971c-7aaf33bd35f1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NbnrFmD4 c=1 sm=1 tr=0 ts=69149393 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COuKgFje69h7aUJomk8A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: XItFFkj8Ax-Tk3t41Vrb0ZulFj726C4d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDExNCBTYWx0ZWRfX5RuUPu8aciP6
 8WVgV73cyZZyW++N1DvK6hw33HReRMcxakry5dWMkVmKQKYGGPmOJElsO5lq1sf/UpdZYBzBHG5
 ZihLVKtVMGiftMrZASJ8MJPEA7CCKYxqlfBOTmHkj3K04RUe4LB8MtDcPqW+DJp23ZZH3PmiOTO
 d/eTHG0vpG/79UE3jkslsQq10IdCSa8cN/nxaEN3eRjsAHSuFTy7vvz2k5Lpbhl+mpFxiHUI/US
 kY27w+8IwB57cSh3uwHIXy3teDHSThfa4AVNjxg2V+lT+b3aydewsz7yM1QIe46w16Q79HSRI+r
 bDiZke+z0vs2lOJqwsbZu5pI7rEBSJxa0yEUyymfgbKIUpYT1IB8QGX+J8MvcIfFv09Y0o7wRuG
 t7OR0T+VYd49kL/GXCOz64TyyD989w==
X-Proofpoint-ORIG-GUID: XItFFkj8Ax-Tk3t41Vrb0ZulFj726C4d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120114

On 11/11/25 3:02 PM, Charan Teja Kalla wrote:
> 
> 
> On 11/5/2025 2:44 PM, Konrad Dybcio wrote:
>>> +	{ .compatible = "qcom,fastrpc-compute-cb",
>>> +			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>> This will be globally applied to all smmu-v2 targets with fastrpc,
>> starting from MSM8996 ending at Kaanapali and everything inbetween
>>
>> Are these settings always valid?
> Oops, you are correct...this settings are not always applicable it seems.
> 
> Example: lpass compute and cdsp compute node uses the
> "qcom,fastrpc-compute-cb", but it is for the later that ACTLR settings
> are valid.
> 
> Then for these cases, should we be extending the actlr match array with
> additional compatible string and then add them in all the device nodes
> that require actlr setting? example:
> 
> @@ -3119,7 +3119,8 @@ fastrpc {
>       compute-cb@1 {
> -         compatible = "qcom,fastrpc-compute-cb";
> +         compatible = "qcom,fastrpc-compute-cb",
> +                      "qcom,fastrpc-compute-cb-actlr";

dt-bindings (and especially compatible strings) must not be altered solely
to work around a driver being suboptimal

But because you reported that these settings can change both between
platforms and instances of the same devices on these platforms, we could
possibly reconsider adding ACTRL settings to the consumer device nodes
where they stray away from the otherwise seemingly reasonable baseline
we have in the driver so far..

Or we could introduce some more bespoke matching logic.

I would like to know more about the scope of this issue, i.e. the matrix
of (soc, device, actlr_val) that needs special handling.

Konrad

