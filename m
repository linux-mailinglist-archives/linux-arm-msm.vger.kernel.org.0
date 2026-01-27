Return-Path: <linux-arm-msm+bounces-90628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCoyFDkfeGkKoQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 03:13:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAEF8EED9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 03:13:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65D243017278
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 02:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28FB229B8E6;
	Tue, 27 Jan 2026 02:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvw8wj4p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wgjt+dMm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954F123ABB9
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 02:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769479859; cv=none; b=QPSHOsCsKzP8j8oEL/55qaFDS3IpFgwZWziwUEs6pBeuz7XwFg6Qzol7TU2W+GCY3emFgKDMErYEj3Pyx/+XIACNcmkmpVd0YuJ6ipOacJBhNnMJMFofcdcrS32zDBCZHx2dtst7K+6Lb7qAWqao25toPLkEwy7MF8aqwvkLJNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769479859; c=relaxed/simple;
	bh=bH2rndW76lecUFPSb8AYCoiS80w8BqtvR9/+HxTLfKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RHZ+1K6Lw5hvGZ5FVcH8ucYItF3cPhcdKgwSLMZ83J3c6X01s0YsQrulQHO+TjB34dHHIg+ZjZ6hnEU8dD630diBPcQY5sSblLz30PyGEOXeQbO2OLi0wh1W+F9Mxulq82F/9EBnwgGcxf+JU6Q3toqZmR/D6cFjZGXzOrO3/AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvw8wj4p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wgjt+dMm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QKh16G2881405
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 02:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dJJtkqEGuOv+EaZoqnfIX2mz7MwV6GmJfJDsjA6WM3U=; b=lvw8wj4pasmVDqdt
	w3PfINRwklO4/waFupWw3rBmS7LMUrIP++SmHpUe+RbMYcGHGefdKY6rOLr9VADw
	M1TB9kkp7IGXHqETMgUJkO7+lg9NDqyqGIFHGrEvRqgn9wcQcFHRCD80uttsYFkB
	66KcBvrE1BSH21ahVtt+JLdkaW7Bdq5cxBFre88zCwNoXhMQJCMeVqXsbe69u68v
	0dIgZtbb8JDcAQmdr7PIjnYFDfo5MCV1sAkjhhPrxHyXCjnRNAd+wJLnm03xdBfI
	T8STTaIzHlVTr1x7XTVy8F9ewYZMLNYo/2u78ccRqvwQTgjn7XxoXZmS+XOnNMpv
	RHM/Vw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxffs0q8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 02:10:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35301003062so12175791a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 18:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769479855; x=1770084655; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dJJtkqEGuOv+EaZoqnfIX2mz7MwV6GmJfJDsjA6WM3U=;
        b=Wgjt+dMmGUUtPiICgHrHjWNkn1s+wFmKWBl/DmUd8NkFvhs7qTHTBNiRmXFu8BgVMu
         CjF9k5NUy8Vgt9qAj4zdRjJJGebL4jMWa+00we6vifsR3fwTXepSUt0c52EEozkcVLCG
         UMHPUY5w4ByznVWOKi+Ku0Ht+6E5C7VODE2YpwGqS0R1O8Nlvm81i4x8zhn8WQFEBgZw
         U7Dy6LGXI8tP1dszboG/W+I4HzBkuSJWkVc5fIAUDMPe02/kdv0ti/mecgZCDMCjLpIG
         y7FOoIRUh60VGJPPq6XZ5RXXfJrabZteMjTmkWAq/xXdbG3DKtYCeDKw6QYH8kxPNJab
         5w3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769479855; x=1770084655;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dJJtkqEGuOv+EaZoqnfIX2mz7MwV6GmJfJDsjA6WM3U=;
        b=Mpc6og9bTHSUSLDmdwD/eAzGfLICBwYhQ417hbgOirV5l/gfLyXmjDdhYzRGWMYAVZ
         yx4WkMeLWOzFet8+B0bo/IpqpQWWT434JKqWuhE4HSWpciS1u36wED7r4GYZrSqvKT6i
         Qs4JoKkOK/17foOUe+vngvvCLPdwUd03c70z45fPgBKYYxmKxtDUGK5uspmfIcYeO/PW
         2DNSxbOEQ9dQ8SKcRLRamXKDAN1pNZDSZ/uudcMh/J4dAbp/+m9pZUaIotE1mi19g4lJ
         Ik65P6tjVN4B56AsFFi0wrxDnmM7bTXzeqIOloLxaa800QlaXmFhmAn7GvdQiV0pBa4M
         j9Ew==
X-Forwarded-Encrypted: i=1; AJvYcCWZyRAmOJwr7gbsxB0cHyV35cF1cQCy++yGJB7DQ4bG/Ey8cs4OrGj0GmuFeFreuI2zbImDrK+5MI9Jl3VE@vger.kernel.org
X-Gm-Message-State: AOJu0YyyJWtlM6M2qUh9V1zSqjRqUsRjul4Stng5a3knUIUSJ+76XFfj
	IFmwWWVLpeSuXQfhsD0Po79EK9SEfAHGP5HfYY8KVA8iJ+zd14zrn6lx55OGJnj/L/KMRso38oI
	ctcuUXAkFC2QCoGFBgPMeS8ZyTUUn+22oWSX1EBm8r9PArE9MRBuLZpxWrRkw9YQGVO+J
X-Gm-Gg: AZuq6aL+4A2VftEDFrwG95Dpg8PwCsmUUm1ZaueS2wqfwHH6mAyMGgNNdoOp5EwZrL6
	7EQ/XWO2zybApvOhHgzFtnMIJIROYx7UHOhyisexHaRkzH2MxiiMs4IX/brKYCr3KSpDTG1fimU
	mVkcFYTtRLBJbeoJ3NyaqAe++S/43UTr3Sto2Jjw03tLoTbmx82wfIncFqpgO1FetdHLfFdlw0F
	SIykp7A73hTFyVbgSDqnK4h60FXS/u+Pr3FcoV3dOxNaEN3APQo+RRWwUDu75pVSopUPpVoHyid
	EAUrvMKVLmq3B7JcXjjitFcnIkLGVCua3O/WlBaUTDc3I2no1ulC5v62yiXy9IH0r/zMYQ9/wNR
	Zz2hnf0+dmG1bAh6IGPlFd6oWfoUvvVe5+7cyobWUWNW3ZAfIYLw6pHuZEDAJgCJxKMydDR7J5i
	E=
X-Received: by 2002:a17:90b:5183:b0:352:ccae:fe65 with SMTP id 98e67ed59e1d1-353fecba611mr288306a91.4.1769479855255;
        Mon, 26 Jan 2026 18:10:55 -0800 (PST)
X-Received: by 2002:a17:90b:5183:b0:352:ccae:fe65 with SMTP id 98e67ed59e1d1-353fecba611mr288283a91.4.1769479854776;
        Mon, 26 Jan 2026 18:10:54 -0800 (PST)
Received: from [10.133.33.228] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f6103e25sm722855a91.1.2026.01.26.18.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 18:10:54 -0800 (PST)
Message-ID: <e2dfb0a6-d053-4fe1-87d8-12630e605a37@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 10:10:49 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: talos: add ETR device
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>
Cc: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260123-enable-etr-and-ctcu-devices-v1-1-5fbb3423a2d7@oss.qualcomm.com>
 <176917840185.2044151.8624555547965761091.robh@kernel.org>
 <2a8ff39f-7a78-4902-85d6-1267c319d8a7@oss.qualcomm.com>
 <179f8fea-85b6-489d-b710-e995319d9000@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <179f8fea-85b6-489d-b710-e995319d9000@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5sJXhqeSIYZ_lwGfnjy8jb6MZNegp39D
X-Authority-Analysis: v=2.4 cv=YpcChoYX c=1 sm=1 tr=0 ts=69781eb0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=uIka3lIG_lpPmi6Tu00A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 5sJXhqeSIYZ_lwGfnjy8jb6MZNegp39D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDAxNiBTYWx0ZWRfX1jj57VlBZHRs
 FWjrtgMa31eVR9qiVUMmSeGhEYtWvkfiiHDi0CG8irOraZS1OVeIA3ZQKIdmQoIBrraHSUEJarb
 kXPdS/qFP7qXzLH6rpSCsvRuaVt1mn4JWRquO70z2/hNg/IW8RjAxDmlV3gYZF4MbRsaztgOe7N
 C8cZlDSh9yMwrIALtcGNJdI567meBk1dDcfOAwPEX7xCT4wJXZQGQFp9IdCk9xZd9GQ48ExI1zo
 E9p9QW+xMIovNPVQy94LSwQJHl4HqtLNPZWccDbOwEws1Y/dSt/QA5oAMOtOSOo2wN5uvX6g1wd
 ss+dmBuYeH3b6KGj65+cKD6v267lBbeH4cmzQhUIk/VlFOLsduc6aSWK7e3M1VyzkXQ/garNb1D
 QsvvRkQG/OdnRGFYRmt9BhkGBJEFt8Nf0joIOEAA6rA5+kgh0sWajR4AG1zHnbAqxA+aiGeAtRl
 dCnekKeO1Ndt3OgyNAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270016
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,qualcomm.com:email,qualcomm.com:dkim,0.1.134.160:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90628-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5DAEF8EED9
X-Rspamd-Action: no action



On 1/26/2026 5:37 PM, Konrad Dybcio wrote:
> On 1/26/26 2:25 AM, Jie Gan wrote:
>>
>>
>> On 1/23/2026 10:29 PM, Rob Herring wrote:
>>>
>>> On Fri, 23 Jan 2026 15:10:46 +0800, Jie Gan wrote:
>>>> Add the TMC ETR device to store collected trace data in DDR memory.
>>>>
>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/talos.dtsi | 27 +++++++++++++++++++++++++++
>>>>    1 file changed, 27 insertions(+)
>>>>
>>>
>>>
>>> My bot found new DTB warnings on the .dts files added or changed in this
>>> series.
>>>
>>> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
>>> are fixed by another series. Ultimately, it is up to the platform
>>> maintainer whether these warnings are acceptable or not. No need to reply
>>> unless the platform maintainer has comments.
>>>
>>> If you already ran DT checks and didn't see these error(s), then
>>> make sure dt-schema is up to date:
>>>
>>>     pip3 install dtschema --upgrade
>>>
>>>
>>> This patch series was applied (using b4) to base:
>>>    Base: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d (use --merge-base to override)
>>>
>>> If this is not the correct base, please add 'base-commit' tag
>>> (or use b4 which does this automatically)
>>>
>>>
>>> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20260123-enable-etr-and-ctcu-devices-v1-1-5fbb3423a2d7@oss.qualcomm.com:
>>>
>>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: clock-controller@100000 (qcom,qcs615-gcc): 'clock-names' is a required property
>>>      from schema $id: http://devicetree.org/schemas/clock/qcom,qcs615-gcc.yaml
>>
>> Hi Rob,
>>
>> This warning is not introduced by my patch. I think it's a false positive.
> 
> The bot checks for any warnings on the file, as ideally there would
> be none. This one is indeed pre-existing.

Hi Konrad,

Thanks for confirming, I found you already sent a patch to fix the warning.

Could you please help to review the patch also?

Thanks,
Jie


> 
> Konrad


