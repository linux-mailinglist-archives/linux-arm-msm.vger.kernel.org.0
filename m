Return-Path: <linux-arm-msm+bounces-100764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDy+CL5Wymn27gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:55:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4650359C50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5547C30222DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E99583BED71;
	Mon, 30 Mar 2026 10:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XWr2piE1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AJ4vcTpT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E532D9797
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774867866; cv=none; b=SvgujjDkrTndcUuutH2Zo0V9TdOt29RhLsq6q2NS+Lc+K/x5TCVXdgB8Jx0rPITjYry4WVauq0oWFGhK/F2UPstnmXXS7aWAFNJPwITP/IzK9H1lGGscitm5gxN5QpdZ49p0tVY8JZv4ka9zmzJTuC/oMGrHXUo3j7Fe21BryWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774867866; c=relaxed/simple;
	bh=wbcyihjFlyN9mqdx4783130Vxodq5gYXBasSmJ7dDqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NIll/ZFjes7opxfVO0LLQE5q6sXplc5z+zZRlEqp0rTbl1+H1Ogsrun41LbG2+GpeASMtfJeyfWGNNV5a0F463xunnqzvZcXTlwrgQiZemUS575B5jgL9UZOwqWDEefC6L55T39yEPxxAG7zvPXJ4Y16FQmmwrcWjINF5ve4EF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XWr2piE1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AJ4vcTpT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U9ELNJ1753671
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:51:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8JSZkl2nL5DjYrxRUDtrQc33kVMK5sDedSsOKDfU4Q4=; b=XWr2piE18OkHMc1G
	lf0UTSfqz4JaJJax/IMRThC/f6nl2X/jhIrsOCwPsqiu/fZzcim8PeuNZG5zxx4e
	vL6I31S6b2HOA58aDo32DU3tG4lqWPXLIX+zwyPd+Pda45RFjUV5EGHkzUVmmpX8
	37jh7J8e9AIb8tNtAe1WhMguca+osg2LFUdF9Gnbv9Mve8rN/1f4pbFrmwp2bLz4
	22KUr/AGXK+e3cFr/v7hpKF3GEne4Aug7T4t6F8xV8oRCNUnGvk8AHzGs6xIigrt
	faP1uUke/eqaCHMhhFFreM+hpnuXIXf68FLL1T+o5OxDHPkmyEraU4O2hl/spSML
	H/0Hiw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmkvq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:51:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cfbd336c3eso168449885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 03:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774867863; x=1775472663; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8JSZkl2nL5DjYrxRUDtrQc33kVMK5sDedSsOKDfU4Q4=;
        b=AJ4vcTpTStGiXKOvu7ZxE56Lg9ZlxGR1C5jX1aQuNNwNiGwbzOW/U4DgubCeyRe5Sq
         Gr8hURnRdza2zFHn7Pu9qTg9imNnxxB7bD5iPkWHjCnVVzdmhAIoFdodTokxY/daEQe1
         WU5lVaAjihYbwacHlzL94qNXpN2GLML/aU4fSN05GQXaBdAcgB2JrWFX8Deor7jGs7+H
         cRMfhHQjX5fe/D7svEyJ3sFUvwTyS3AHBca3LBJiOs+0rmjzCrCcLAYCO8NSUncRt39V
         HQ6qPOJhXc67VQfQZmG0ce1/UHy/+JAeeBrHPeHdSPiGk3vAknZ9ST//85+4wSkaHcuv
         jolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867863; x=1775472663;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8JSZkl2nL5DjYrxRUDtrQc33kVMK5sDedSsOKDfU4Q4=;
        b=eTIhB5gpLgJ63nrpWb/O3s/0LlZI3vaTGl/fDI7HK8azsAC09yAeJ73XwqBJyOkwxR
         LfPxaNMQ417ug7/dmOsRRMhqE5KICK4JTklwVQdf0ZPvt+mWWHgYlqapclW/ZDPHvSl4
         Q/ydvG6cc0YOTTmxKSZ0YK77/+9jA8StQD0zEaLzcgrx7H3c7ph1hynQdEHRkJk2MbPF
         4eugUW8KntUSpqKBOSr4C2ULlNnkL7BbACc7AF9oCqRDpSbYm6jSPU/QwnDovENt1l9G
         MnwxmOJhJYYbyjjBqt8/b1vnZJNdsgvIfGYJycn1mzInqz/tLHjFiNW1a6Q0zEeeafIS
         +tTw==
X-Gm-Message-State: AOJu0YxG9mhFFlEyng/WHCxjjdWshuJ/71uBo41RM018aAQXxS7/Z8iu
	+yVhADxz/oilGlvV5t7lVyjH40aLsQm2ndr1UvWGWWd56pio/cKTiOu+POmLaOE04OKgRlXPLuE
	1O4VdQP6x4YU9QPZgwrDNOD8JutRtiES3ZYMu65h2M5sS5is8MXM5j957k3L0m0VbmVJ7xGvXuw
	rB
X-Gm-Gg: ATEYQzwJK+60WacwkrP0Wv4lcZij3cKZ2eGdlq+4Hzp0iUZtfnDFLKd1Rg2YWUSlkGC
	jWYvMd1T8p2qp8gk+NHHCMG5x1g0hR7pq5YMNvv565BAyy9CgxSE/Lp9dayDxHK3xk27lZP+rAE
	ZPOe5/NqgHOptDjAOQ1QWUEvNAIipL0u9MGRuwWd484E8Fi7Pg2wP+w+iNPcOd21zCHrIhY9VYn
	WqGIP1zIoW8yp9MN72KT1LUPLNDN11eVBj/jtqX6GrBOYiehUDiizoY+Oj2PSGh5m+uvHbE38Gc
	xh7guDcVdoWKUPx7qvR5bX/vB356Ubfe5fLlQIgyiSYNxPBj5P8IEN8J1TDT86/gMK2W1nDGXRo
	rB+5ToEd700mYhJkJn/fLXsFOtar6aHX8BxFBAoNpOMpJPlyAGD74CHGRYNRmIttI7fpKRcSmB5
	+UUTU=
X-Received: by 2002:a05:620a:170d:b0:8cf:d05d:c838 with SMTP id af79cd13be357-8d01c6111cemr1049996485a.2.1774867863167;
        Mon, 30 Mar 2026 03:51:03 -0700 (PDT)
X-Received: by 2002:a05:620a:170d:b0:8cf:d05d:c838 with SMTP id af79cd13be357-8d01c6111cemr1049995185a.2.1774867862744;
        Mon, 30 Mar 2026 03:51:02 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66c074f0a49sm388824a12.1.2026.03.30.03.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 03:51:01 -0700 (PDT)
Message-ID: <d2fb3b02-d4d2-4bf2-82a0-3432c3c3404f@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 12:50:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: monaco: extend fastrpc compute cb
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260326154111.2781802-1-srinivas.kandagatla@oss.qualcomm.com>
 <fe9bba47-13d8-4572-af8f-d4c0657f7195@oss.qualcomm.com>
 <3419a58c-c099-4dda-a019-4900419aea9b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3419a58c-c099-4dda-a019-4900419aea9b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4NSBTYWx0ZWRfX5oHkyKMFJwzU
 YyhcIpsIOrpxm5QZD6PIAWN+xkSOFI0HHNoI0kdgelR7XsFY5E3Omb+QdaEIXLwGRY+SMsQ5ioh
 ffGvNQYP0iF/74lKtfh+GtYt0cS/Yv52pkO1HQ/avKnGKth24rGyoMDsq9IBwaxUP+1aWUC0WOv
 ogUh92wuKr3l6xFN5qR3IfaTvaWu3UofPURIgnki2d/pppMzwAohqMc2S2mWtKg5Tx2IYPscodA
 9LkVSUSYvineXGImJQr9omqEF8rNZF/S7ocsyIxP+NnFz6CVlATxogALKsz7r82tcUVknai6jxV
 Jp0Eq6HzzKsGMTZoVegCjMk6WFa1H22QU/xPLZ4aco0yk54NuEz8qIPU65P1cuC+ni4ssYPeRrg
 Thc8umFaC/DzaqOY4VQ4r4pSZT3EiLeDRx+58kcrmtWtk5y+QUHS2JndeQlyYweqUK6IUdHnKO6
 0346oDghHuSYi+WXFEw==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69ca5598 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Q8wc4JZ8Ynh5jDcX9IoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: FJl_iiPVQMNbk7Wj_nWwRV0XLULsdGWX
X-Proofpoint-GUID: FJl_iiPVQMNbk7Wj_nWwRV0XLULsdGWX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300085
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,0.0.0.4:email,0.0.0.5:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100764-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B4650359C50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/30/26 10:38 AM, Srinivas Kandagatla wrote:
> On 3/27/26 1:10 PM, Konrad Dybcio wrote:
>> On 3/26/26 4:41 PM, Srinivas Kandagatla wrote:
>>> For some reason we ended up adding only 4 out of 11 compute cb's for
>>> CDSP, add the missing compute cb. This will also improve the end
>>> user-experience by enabling running multiple AI usecases in parallel.
>>>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/monaco.dtsi | 49 ++++++++++++++++++++++++++++
>>>  1 file changed, 49 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
>>> index 10e799dd4a78..38fbd44c7d8f 100644
>>> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
>>> @@ -7739,6 +7739,55 @@ compute-cb@4 {
>>>  							 <&apps_smmu 0x1964 0x0400>;
>>>  						dma-coherent;
>>>  					};
>>> +
>>> +					compute-cb@5 {
>>> +						compatible = "qcom,fastrpc-compute-cb";
>>> +						reg = <5>;
>>> +						iommus = <&apps_smmu 0x19c5 0x0400>;
>>
>> I see that the other CBs have 2 iommu streams, the other one
>> having "DMA" in the name - could you shed some light on that?
> 
> AFAIU, These DMA streams are relevant when NPU dma engine is in the
> picture, examples can be data pipelines which involve transferring data
> buffers(in/out) in-cordination with different IP blocks outside DSP. May
> be something like camera/video streams directly to NPU without CPU
> involving...
> 
> Personally I have not tested such usecases, but for upstream fastrpc
> clients AFAIK only application streams matter as clients will explicitly
> allocate the data buffers, even for sharing across ip-blocks.

This would be nice to confirm somewhere, perhaps even denote in bindings

+Ekansh could you confirm/speak more about this?
+Dmitry for awareness

Konrad

