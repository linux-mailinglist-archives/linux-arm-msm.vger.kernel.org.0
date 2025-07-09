Return-Path: <linux-arm-msm+bounces-64292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 345C6AFF3DC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 23:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F22F179507
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 21:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D563823AE84;
	Wed,  9 Jul 2025 21:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OmQDiZ2I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DCE224AFE
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 21:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752096258; cv=none; b=jk4WBB30zq3dNXaNQhjpJE4s6FYd4ubZ1qL341mt/4KWu3An5TR+d5g4J/wcEk1ySPlxnzPBSOVTUzUPLFHcHePzxMtfyiTfUFz11AM2kM0BHXsYjcd8ZO1NRDiIsmWE9av46DQyhadmcUi07+MJ7WhxmRcCwqoqaq2pH+wUGtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752096258; c=relaxed/simple;
	bh=jSICepuquIIBUP/pWAxw5nOYXdR5Jqdd95TDlojz4+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T65OQe0Valxby4vpadYKpRQRW31S6hl4V3hYZeAIyKCr4LSxQ/19JlbaSB7TGlLHWBZ5jKsHdmS2pu0KO71LqLHfPV3NHkniJDCPyPMqckd8BzYWW2vSN5j+aJbXLLf8tP/ax4mqDo4Z4J8D1Uu03riGrfs0cGIcXqRqnn8761c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OmQDiZ2I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569CohMv002824
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Jul 2025 21:24:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6HcxkBYYWDEqMWfHnTGrSHdSzsR+TXGlGZHdAYOSSuo=; b=OmQDiZ2I2jlLM/oT
	P2JXDaunWvaQKWgAj2iNaUoqOQLyF0UjFFHTFx9cnftBzJ3loDRiJZE6ceYD7rUt
	XKMF3Frb3uHaRUxjcwg2TfHOiPebw5fjps1xXJz3ux91+lqdEdpKHo3+0OrfLR9u
	yGpmuxRZ89Lazq1usdXNqt2xQvF8n+rK95gV8o4C/CtaqoeA7Cl+rxGkqYsH+KFC
	NV/HOtI7vtZ+L5kh1PzhZ/WMKwuA0+qKSKSAwDE/oukEmGp6NyYVkENO2QHI05H9
	i/HqXiBUS+7EBnobucRnktN7GjH0oo/XspaNthV+z/WoXFq5UwRJMPrQuty9jcKP
	yGzlXA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2bdvp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 21:24:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0979c176eso5856785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 14:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752096254; x=1752701054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6HcxkBYYWDEqMWfHnTGrSHdSzsR+TXGlGZHdAYOSSuo=;
        b=Gu8lOjuCl9AdMJQoSNGaHRjcXMjsNySwF3TCwRFWcWsm7XfQiLw4zrKJ7X0sachUem
         eybTm4L0DIVqk8eMtu6rXot1zAz+7qkX9qQxYZVKj8AqrWZ0vz44cuN2GNGrVY/680yt
         CQLucgUoPUfWr9SyzPyhJkQd/wlk8Um8SVs665lVaJoje1R1GZpxlTgxBWczMoCO4E5J
         HXXTbYl7p62RH5qIoPr/vmPYCJbyT05s7TUAToIsMdlGtHXmv9WPDmKRRWzv5diG/l+4
         p8TnB0F+qNSPJjYHFGFEbEP3+D+izw4qZsI68qs4sz5oOV43umImvjXlKm8Y5yZMh/rY
         rjhg==
X-Gm-Message-State: AOJu0YytS2wTjKTfDHevr+pdygSgqh8aaGe/jknVuJ79u8QHBRNUlWRN
	6TQ1wdU95YaEkAfedYeKawQDOj28pB6jwuNf1gW9arbrfqZCzCQmSq/9sbCUcd4cPiFVG7EeJZV
	NpsLYpmcll+/TBHTUQQlR4VTytEeozPn9qujtBhKDlTvBd/9sadVUhEtV67bdcn7Bc5jEU9hvjs
	+e
X-Gm-Gg: ASbGnct844q+OHt/r/uRuPsM5+1ZUrOOBk9XEmTLt39H51XeVxsTEKiMffAzbGpA7mk
	n9VhxSZr+TDXw70CRs68LfBmmHcBQRxpsFokulpKdwmB94Bbf8CJgo1NoNBo2OWpS7+TmAqeLAd
	OwZehU/mn0ULQnQpfTm6ENFbVy2zxBP60uwxmpPsoEmiRUTZC3GPujrOeoi9PQnBFcbD8Slotrj
	oBhb6Keh9knovJGhIJFTmdnP/TEA/x8yX8tkBRbFAUGTrIX/6QZMM+TogQFiz9u978Pg7f3Yz20
	LeAZNQGatm5lotwrA+bmAEYcMc4FulvitWRXxDN76IbFHDbA/0zmX/S0BZboLkYXlEiUXyRSRwS
	ms9U=
X-Received: by 2002:a05:620a:31a2:b0:7cd:4bd2:6d5a with SMTP id af79cd13be357-7db883e18a6mr244908485a.5.1752096254130;
        Wed, 09 Jul 2025 14:24:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzJcPMmv5NNecx70SGRZjn6b+nC0byiwhyGmzcrnBa2xtGN06eE3paUMlHuOJ7hA18cs0w3w==
X-Received: by 2002:a05:620a:31a2:b0:7cd:4bd2:6d5a with SMTP id af79cd13be357-7db883e18a6mr244906185a.5.1752096253663;
        Wed, 09 Jul 2025 14:24:13 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fcb0c9236sm9444279a12.46.2025.07.09.14.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 14:24:11 -0700 (PDT)
Message-ID: <90d21fe5-97f6-40e6-98e5-378a7809e8dc@oss.qualcomm.com>
Date: Wed, 9 Jul 2025 23:24:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 3/3] ufs: ufs-qcom: Enable QUnipro Internal Clock
 Gating
To: Nitin Rawat <quic_nitirawa@quicinc.com>,
        Avri Altman <Avri.Altman@sandisk.com>,
        "mani@kernel.org" <mani@kernel.org>,
        "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@HansenPartnership.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "bvanassche@acm.org" <bvanassche@acm.org>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        "ebiggers@google.com" <ebiggers@google.com>,
        "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
References: <20250708212534.20910-1-quic_nitirawa@quicinc.com>
 <20250708212534.20910-4-quic_nitirawa@quicinc.com>
 <PH7PR16MB6196F9B8C676FA18AAC10F3FE549A@PH7PR16MB6196.namprd16.prod.outlook.com>
 <f4654034-a94b-473b-907a-2687acf11af4@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f4654034-a94b-473b-907a-2687acf11af4@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDE5MiBTYWx0ZWRfX89BnxUJ8kzEk
 h/JYHMKjCmPILPNBFFj9RiPhyMLVAhzL1NUinIJcR3ksbPSWAXyCs1JF3kCQzVVWbdKJTpIAN6R
 itm1bSsLmgCW1/Q/QQnogRMF0zleM/Tkd1SjtcXQFlGAJHvm5U+zMkTLbSwFl0OOjPY2IfeOAHn
 aHGrrD5czFZChXCiH4Y2nns8r27i6mMn5EQKHIG2eArohrdAfijeWQBvYs9f/adz86OSvEVD95h
 1Nc/l4FLrWei3znaVAWiXU2waEKb7OKP+SaITvqn2na1pte5cEQLPTP+uwMxZ/7/Q5y9Zn0ZhXu
 xmbgX5unvTYrusZZQfLE6nSj7lMyANx9Kg01Pg5BioulVDggmOSjKHEUIrhzWbUuZRty3Bwac6g
 f7aJ1LLX1JoM4UIw/GlDH2BPw8SAv6NydvHi4GtCrRZ3g5ivynke7vMTrYFLN980t97556kq
X-Proofpoint-ORIG-GUID: jUgA-rcoaChZdBQ4fWzOaLhyyiImkO8x
X-Proofpoint-GUID: jUgA-rcoaChZdBQ4fWzOaLhyyiImkO8x
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686eddff cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=NCvSw6eEAai3H5U51bMA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=756 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090192

On 7/9/25 11:13 PM, Nitin Rawat wrote:
> 
> 
> On 7/9/2025 10:46 AM, Avri Altman wrote:
>>> Enable internal clock gating for QUnipro by setting the following attributes to 1
>>> during host controller initialization:
>>> - DL_VS_CLK_CFG
>>> - PA_VS_CLK_CFG_REG
>>> - DME_VS_CORE_CLK_CTRL.DME_HW_CGC_EN
>>>
>>> This change is necessary to support the internal clock gating mechanism in
>>> Qualcomm UFS host controller. This is power saving feature and hence driver
>>> can continue to function correctly despite any error in enabling these feature.
>> Does this change offloads clock gating?
>> i.e. no need to set UFSHCD_CAP_CLK_GATING ?
> No , this change does not offload sw based UFS clock gating. Host controller has its own internal clock gating mechanism

Does QUnipro == "the UFS controller found on Qualcomm platforms"?

If so, please use some version of the latter name to make it more
easily discernible 

Konrad

