Return-Path: <linux-arm-msm+bounces-52025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58952A69818
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 19:33:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8528118979BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 18:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4FFE20B808;
	Wed, 19 Mar 2025 18:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="boMvUTr+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B351DF748
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 18:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742409175; cv=none; b=Cxt0m2VJNItW/9ik0hyDSOEpBWY1j/TGvbNvRiIKeZYOtmjBOJW9G/ZigGnYUuh37308HhCkjMw2lCf0Lt49OHvPF4nI6mFSdncevwET+YsemLXS+fAxCQGbDe7NRaf8pbDpPqpW1b000VkC0+Wnx/jRs7pp96NcRx/h/+Fg01A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742409175; c=relaxed/simple;
	bh=znAvZ1m5fb9Fv+Y+O6o+dy2qNhj5RxVbzICq/W7KwPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pxn3GWUPD3phTOfNAnE+U1vQ8/JyRgAlR61xGXwBVHgdsLhNZaZM2TCplpUwu5YuAc295sNiw/0TPwff6ZfhVC5BgYMKGTBlfJRi6YZ9on0jn452ZZy8jlZH1SrRDoA68ft3zh0GsZpKKfPZD0FU57pA2qosQ7/Li94NcPXZkVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=boMvUTr+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JDe5gf001978
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 18:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6mIeomPLPedDRzmXiIuauhMKXkTwEh7EaY68qsi9Cqc=; b=boMvUTr+dwrK0kJ/
	CJ7DtB9DBjlL4nMgK+gGgSaXIZArWimf+vDP7HbTW5vuJZqzKx5gDU1NxLq/ENra
	Pq/Je0cpGd0X5AUsi6N/a/Z30/YggwWW7MKjq8oz6COA+Nj9quuMP6IErudDiCES
	syxVYygKonntqDmOPUrYO/Pj7k6UM9qEql5q3j6BSZHO+oQttQeIGO++avOtOMFP
	JPZPzeHDqBScCaSupGg9M+z6Y7pmwY07oodhWv7sxcpci0Prkvgpg6EHP4bKh1Up
	RUV2RhdM7s7GuKoxrjiKxMujMLM2THf3lSZMlV+l+kvsk90c/LojtYqrr24I7+tJ
	Rp/zOg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45etmby0pm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 18:32:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2241e7e3addso109612935ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 11:32:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742409171; x=1743013971;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6mIeomPLPedDRzmXiIuauhMKXkTwEh7EaY68qsi9Cqc=;
        b=ZqXu4eLc5QzGmPCbAn8ULjV40tsrGvfwxiH+r13/92qsykY1W/A62KQUg4mAM57+CL
         Be4xiOlZcgEpV0PTtswLAZrz3u1fA/qwnB8aahRicds+d8NTiADi73lIjlaR+6tilvwH
         WIiOUTUl0zLQUrwpoRf9noLZ1UlNzGrkRTsY0jvx7Gg6z5FLnQJLfcJu1FW0UcnIs7q8
         hP2sOrjeJ3DiIwtZktfmHYeX59XjFx9c1bHcsctq8wpQo+sQdPL50+x7BW8mZ9OJkjZw
         M/xDXikyTUYGRv8W2LBGkfF92iypGt+RIMrak4U6IUfRAQDf/ODSU0LfmRvRDLcpTaNZ
         Ws8w==
X-Forwarded-Encrypted: i=1; AJvYcCVVfYS4PFKdSGIgROjTvLm6880KdvapZCubjqIJJ6aah5hx29i59UVUu9YT8Ia69NhOYh1yZFJi/yd9yciz@vger.kernel.org
X-Gm-Message-State: AOJu0YzHpEFywNgq0x8nKfFh2bvNTmrnl0resGW0lmJ42NUv4RD5b5a8
	OouZvTqe3PW7s2+NaAh7RxMC5p1Ysu6gnE+072U97BIuRo+LI7tBDBEeW8k1SBcgqa/OlY9hvSu
	3xHZF8wsG3z1/1kRFNvnbOr1fWPRr5HQAEr5n0T4tUrSr16AnjMWiQGJyZn2He6Tl
X-Gm-Gg: ASbGncsQdQCW1GN46FhexxfB+xPdET0Vu31aqpYdWwRrDJj+vqfC9stIISQ0BDaLcaj
	gLPGBwo9604IjjlWyqa8nwCsdfQqAZwP00f6RSUxsvYGKoPy5pXEJo7I3wN9cOi0F4FscA8eCBF
	NPZEnePtv2QYEeb5uWLTU+uupfViN/KwJIGaU+QyUFvM6ocHdbEPLhlGHEDPaoc+kUZUak4so72
	mjP4O76TeC2T6HuMdY43pCYG2/ekzAZPjhfQ9SlEEZKwPVhkwPmppSdRjoLrhQUwmBVte6EpKGN
	8rJFdzxedp4SXiKVioWgmvAl58JRlc2m6R28V/nUTE51ELr2OmambWMpn7ZzBZnSZLKnuRI=
X-Received: by 2002:a17:902:ea07:b0:223:26da:4b8e with SMTP id d9443c01a7336-2264981b58fmr71235845ad.4.1742409170998;
        Wed, 19 Mar 2025 11:32:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGazHPV9+2UyMKutqyNnaqlMLBrR+fcmmqZeYlBjWXfurgn8y0zm40TDXmtXT1NFf0ZNxc+8w==
X-Received: by 2002:a17:902:ea07:b0:223:26da:4b8e with SMTP id d9443c01a7336-2264981b58fmr71235405ad.4.1742409170628;
        Wed, 19 Mar 2025 11:32:50 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbe890sm117378585ad.188.2025.03.19.11.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 11:32:50 -0700 (PDT)
Message-ID: <770daf27-ae9c-4ed5-87d0-aadcc3b74bbd@oss.qualcomm.com>
Date: Wed, 19 Mar 2025 11:32:48 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] wifi: ath12k: properly set single_chip_mlo_supp to
 true in ath12k_core_alloc()
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        neil.armstrong@linaro.org, Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250303-topic-ath12k-fix-crash-v1-1-f871d4e4d968@linaro.org>
 <24b2f1f8-97bd-423a-acbd-9a5cd45e4a40@oss.qualcomm.com>
 <7901d7f0-d6d0-4bf3-89ad-d710e88477b7@linaro.org>
 <7b4b598f-bc13-aa4b-8677-71477e1f5434@quicinc.com>
 <8b05760b-db99-4b43-8444-d655b18d3699@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8b05760b-db99-4b43-8444-d655b18d3699@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2BI9tiSJ54UdDT3CE63XKzoJVwzCRNE4
X-Proofpoint-GUID: 2BI9tiSJ54UdDT3CE63XKzoJVwzCRNE4
X-Authority-Analysis: v=2.4 cv=aMLwqa9m c=1 sm=1 tr=0 ts=67db0dd4 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=xnwWoSdEmYegiN_xJ5oA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_06,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190125

On 3/19/2025 3:27 AM, Krzysztof Kozlowski wrote:
> On 19/03/2025 10:06, Vasanthakumar Thiagarajan wrote:
>>>>> ---
>>>>> base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
>>>>> change-id: 20250303-topic-ath12k-fix-crash-49e9055c61a1
>>>>>
>>>>> Best regards,
>>>>
>>>> NAK since this will break QCN
>>>> There is a series under internal review to address MLO issues for WCN chipsets
>>>
>>> ???
>>>
>>> The original commit is wrong, this fixes the conversion, nothing else.
>>
>> Nope. Driver changes to enable MLO with WCN chipset are not there yet.
>> Setting the mlo capability flag without having required driver changes
>> for WCN chipset will likely result in firmware crash. So the recommendation
>> is to enable MLO (in WCN) only when all the necessary driver changes
>> (in development, public posting in near future) are in place.
> Really, these are your answers? There is regression and first reply is
> upstream should wait for whatever you do internally. Second answer is
> the same - public posting in near future?
> 
> Can you start working with the upstream instead?

There is a lot going on in this thread. I want to address the big picture. It
is no secret that Qualcomm has historically focused on downstream drivers, and
upstream was mostly an afterthought. But that mindset has changed. Qualcomm is
fully embracing upstream kernel development, and has actively recruited (and
is still recruiting!) experienced upstream Linux Kernel engineers. And in
places where there are shortcoming, Qualcomm has partnered with companies like
Linaro to bring in needed support. So Qualcomm is very much "working with the
upstream." We may not be working well sometimes, but many of us are still
inexperienced with working with the upstream. We are coming up to speed.
Specifically for Wi-Fi, we have a large number of engineers who have primarily
worked on downstream code who are now working on upstream (including me!). And
we still have the issue that many of the products we are shipping now still
have a lot of downstream DNA, especially when it comes to firmware interfaces.
So please bear with us as we learn and evolve.

Please keep the constructive feedback coming. And remember, the more detailed
the feedback, the easier it is to incorporate the feedback.

Thanks!
/jeff


