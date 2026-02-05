Return-Path: <linux-arm-msm+bounces-91862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GcaHEWlQhGkh2gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 09:10:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0614FEFBE3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 09:10:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1BE29300F103
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 08:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B2B03612CC;
	Thu,  5 Feb 2026 08:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iEUiPBrO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EMerfe3Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1111327BF5
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 08:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770279005; cv=none; b=JqPkyqaSUTc9FIBnYaSXCSYQz0f6oiCAALnrSf1yHutQKmDeVO0pNqGebSl0oI16qwsKm4dm53J0j6+EW2elfkIKmGYMyLu691W4vm9UskZE6tgleBV1AAGc4Cg8xpFjMTVuDyZZFTKR74Bqgk1y9+OWYuCLb8wr9CsYIKklwWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770279005; c=relaxed/simple;
	bh=31BKYP0Nlhr52tfXs2A8uGkTeifCfvGi22PcYSAYp/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dLwrO8+Od+yCnyUDSD8Fyoo/c16Y9OCVh/3qMG2zijrOexs75STNp/FprWzIVxEfp9cGErYfsAr6Qcc2/+4rAshYtRAvkiNxqmU/au1RUvJgZehuVMfw9VCQad7UhYBD/H8nnW3EDxfiYqUhDgjgDMsNLXqdGA9BIl4XlH90yow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iEUiPBrO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EMerfe3Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153dj0T3237394
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 08:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a8rDuGUPyagZOfVWM+f/BrTixnTf4NeRHC5TK7Tyqkw=; b=iEUiPBrO91RmrhUa
	NgQ2fl6CgspcdHcFktP7O8JSlhyMfMc11W4F/N03QNnaHvC20g3Zl2YdhuVGkPBj
	7o0YC8drrm7VbWw9gWSeQUrK7SkC16k5FEeo34GPlpMfOcts4CSgvlbqp2tbCfRf
	FLQCG8wnorn6YwH5CWUl6ZQGdZs98X48tAE0vqWbtsz2Jo0AT4Gv10yldJLolAUT
	jCUNOO7Ke2AIwOCiioRA2Yaq3HAs8JEiUzp/LS3qsIro7WB9i94i7uPVtWjX8See
	OdZiqA41kskQnR352Apb1tX6f/cBtrPiloUCJYZTd2N0QLiA84ozIY0XI0rajO5a
	Tu+Vpg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4cp51s59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 08:10:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-352e6fcd72dso1226450a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 00:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770279003; x=1770883803; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a8rDuGUPyagZOfVWM+f/BrTixnTf4NeRHC5TK7Tyqkw=;
        b=EMerfe3Q985LaIxlKWSf08iXTdAIm/7Eqh4zwQTT51Q09dTduWKgdVbnTPeENkiV8e
         QWFrsNrkkqSYBq5SsmVdaJpwZQ9E9RNIbzBxpEToSvS5jlwTAb54OUOiMmOUGH5eMh5C
         MoT8dVsAXVUXbfDx8Y8w+vikuJoKn+bly+xsWs31L1SEHQYemsYXpPPVdgWY1z3GmRl+
         C9mNI2VRSWYO11Zj4Y1pKECZj6K+Lah/E4Fn5hCTi115lmbQxYsAdNzlLQPmB47au9ru
         FJM5FEUSYWtJU7Zb0wObXUKI4CVPGgwcuK+0ocb/050R3k7U4cI/06Wyy/i+rrNCm0TF
         iepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770279003; x=1770883803;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8rDuGUPyagZOfVWM+f/BrTixnTf4NeRHC5TK7Tyqkw=;
        b=q2z66YHUXJ+rDCexLGf8lEvlh1IXPAyjrYb8ttMrHz4tVaudnn1BuO9V2JljqGcJbK
         gDqoTkXSsy8qosKh1gb6BrfMzEf2rv9UDOC82gMPzVCZsxeznFdX3VyKEgChdCk7E+os
         zzdEhnMzqYM6uuk9A4sCGQneeY7Jmaqzd1Zmr73LI00vsQXRXUdO8oG921+weCm6DGdN
         0jf60ss7f3+E3ScBSktClvifDSTzMxMqy4vwNBrVqubsskwcqKOWpVKeka2RvKtffgxs
         7t5pSwzFRjtTh2ip95Jh+f7nTLyXdBV0EyNy2nGD+ENLWXppoe1FeZgREq03eFq1KfQ2
         c2PQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHWDX1VsK5H5utbic5ccGInAj0Bn8BfjlQ6xMMnzayDp9z89QP7TZxrD4okO625iv0NIzHrk+kx/H+vVHT@vger.kernel.org
X-Gm-Message-State: AOJu0Yy12uM6mgmRGI9vpNp9GKmJOySBy2Fb9E//Pf7GdTepA92D2gUv
	1Nf2NnWLNtiq+JaHOpjdOecakShg/8j7a46YswTUWcLgviVyElMUh983k4ol8Zwe8DeQzdSBylj
	DQiJRqsKT9eTBMVBLDzzZtQrkltar8QRqrNuWBOecCO70gqqM7jPJB/e3OO+Bd5XpNrr2
X-Gm-Gg: AZuq6aK1Lbs1aQU1m5iWztG5wF+cfpJFlJJBsGtCAcVfvj7MhsPNIYIl43FJ2AaM6tQ
	K0yFgghMCt8kLCnw7okw2vZrZcivABHBJJHqDvz3Zr+qkApinvGExhVLEa0h4YyVD4SgSvQsxSZ
	/2t978TMI05g8e4NBRo19VW8VdOdZqb1o8FmWL9CZM2xm7KZPBuJPRJX7yI1ijeOABaIchgW2j8
	Q88mnDKzDInDdlwRFnp88XGCNgP5MoqYcYfbC9MTuo3uh014vSQoXi3jWnxv0J71KeYg5I2wGJx
	Qpu76LQSkX+H8wLs+k2p+OLbzKD+PU37J4n4T0O0w4hZNw1wI9PrHBdpQJNGpWTdNkzWsng8/3+
	SBTwB5cQpntncZUUtBWFv8EEB/ghC1yL4yTHNBnT3pk7s
X-Received: by 2002:a17:90b:1643:b0:345:badf:f1b7 with SMTP id 98e67ed59e1d1-354871db4e8mr4514473a91.28.1770279003359;
        Thu, 05 Feb 2026 00:10:03 -0800 (PST)
X-Received: by 2002:a17:90b:1643:b0:345:badf:f1b7 with SMTP id 98e67ed59e1d1-354871db4e8mr4514452a91.28.1770279002912;
        Thu, 05 Feb 2026 00:10:02 -0800 (PST)
Received: from [10.219.57.109] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3549c09adffsm1642267a91.4.2026.02.05.00.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 00:10:02 -0800 (PST)
Message-ID: <4835d0b0-06c2-42d1-aa33-34daa0e7a8e7@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 13:39:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] of: factor out of_map_id() code
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
 <20260126-kaanapali-iris-v1-2-e2646246bfc1@oss.qualcomm.com>
 <47fbba15-6375-40fc-bd2c-8ebf2788837e@linaro.org>
 <7d1b5897-8f17-4213-b893-d99d96afef94@oss.qualcomm.com>
 <j6euiso3pcg7nvewscsfjkqyfl55ajxxybf2pib3622uontj2y@aqj4satyf7b7>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <j6euiso3pcg7nvewscsfjkqyfl55ajxxybf2pib3622uontj2y@aqj4satyf7b7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Oc2VzxTY c=1 sm=1 tr=0 ts=6984505c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SBgkrO22ZELSIJHh4VIA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: MGRQjp-eBDnuvmC7y1dh7PWK_nEQ5veg
X-Proofpoint-GUID: MGRQjp-eBDnuvmC7y1dh7PWK_nEQ5veg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA1NyBTYWx0ZWRfX8IW+padETD7x
 BBhQKnjH7albws9aScRQSMA5G28/tCOLsxal7zNO5X5cXg3SbXsZYyHbQLEa0RnWnPoncvvM+rE
 XYJTX9pcEKwLJh4huDWw10SrbDIynufCGZyGZ/cX3HtNviN3bH+QyYfBrYCT6ObVRRYsrn+DuzK
 VgAgHfoXJ5QeSCWXgi0ytmpArEY5sk3AZbO9RbgIi1gAsHGb8nLtcR3upFBHQpV5rTV48u09rBe
 dXPj5d+mJ4gN0hKl3QND5lrLzAUe7fCpKShK5//RFHqzBsMUrLjfEoZqHlMTSikFWRiW8FsbXut
 bJpmRuTlRKC9TJIIu8Ek+p5yW2foOhhLxnPEq6lHcv5GWv2OFMRpcd0LBHxBkfXsJVprs0mVY+F
 SUY/F3REYOFYsEGCUKkPPP8q9XvlI04NbJ7VJzdzz3EO5nCszAalSE6JeHOzrBkmEhjzs1huuJC
 DnYj0WpKeWJ4403PDiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050057
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91862-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c09:e001:a7::12fc:5321:from];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijayanand.jitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,202.46.23.19:received,209.85.216.71:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0614FEFBE3
X-Rspamd-Action: no action



On 2/4/2026 6:41 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 03, 2026 at 03:43:58PM +0530, Vijayanand Jitta wrote:
>>
>>
>> On 2/2/2026 8:22 PM, Bryan O'Donoghue wrote:
>>> On 26/01/2026 12:25, Vikash Garodia wrote:
>>>> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>>>
>>> This commit message is confusing and inaccurate.
>>>
>>> First up, you're not factoring _out_ of_map_id() - factor out of_map_id() means to remove of_map_id() - you are refactoring of_map_id().
>>>
>>> Your patch title should be something like "refactor of_map_id() to prepare for mapping of multiple IDs to a single device"
>>>
>>
>> Sure, will update the commit.
>>
>>>> Linux interprets multiple mappings for the same input ID as a set of
>>>> equivalent choices to pick one. There exists usecases where these set
>>>> must be maintained in parallel, ex: on ARM, a dynamically created child
>>>> device(s) is referencing multiple input id's in parent iommu-map.
>>>>
>>>> Factor out the code where multiple mappings needs to be maintained in
>>>> parallel can be achieved through callback from this factored out code.
>>>
>>> Which callback ? There is no ->function(pointer, here...); ?!
>>>
>>> Just make some plain and straightforward statements about what you are doing and why. There's no need to resort to dissertation-speak.
>>>
>>
>> The callback in introduced in patch 2 of this series. will update the commit descripition as suggested.
> 
> I think, the callback was NAKed already.
> 
> 

I'll remove the callback and update change such that all entries of iommu-map are always scanned.
This would handle the video usecase ( i.e; same input id's mapping to different SIDs ) and in other
cases it would result in few additional scans in iommu-map compared to existing implementation (where
it just returns after first input id match) , does this look fine ?

Thanks,
Vijay


