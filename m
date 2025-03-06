Return-Path: <linux-arm-msm+bounces-50476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E43AA54732
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 11:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C851A166A2B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 10:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3101F1F4188;
	Thu,  6 Mar 2025 10:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S2xB2lWj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394762E64A;
	Thu,  6 Mar 2025 10:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741255338; cv=none; b=lHfb543M/FkwLw+eeoLbA4zQKNJOAyKlPUO10WoME30K0cU685MFUH2vVNQDxLNIJ4WeznMZQRGNeGv/7SQA1yEDELL79+cxM+3s0okq9hFgHUBOta7vC1pFxfRN2lBes+YmCC62eNeZolpqQUBEZ+QGabV3wB7efvnW//Goa2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741255338; c=relaxed/simple;
	bh=4PhF8y6VGkokPsiYhWYkMDRA6AcFOvVZ20VX6LyDvh8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=jIT/UjvFzV1ZxMk2NYDTu4bZ95OojgsgJ2ePXQs63Gt54N1zfKlVCWx8RMuvavzUXeVzpKV9bProa3R7oPEQxwYvohGlG1+X7CwIu3t4f4tYe3R9PVnqlMxWIagQ3tG5/nciyC5yAdagpMbK2WThwtnuK1NdyuWnMOSlQdR7m8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S2xB2lWj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5268stUI027093;
	Thu, 6 Mar 2025 10:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GUiNQxR6oXFyrfw8pmpUcgdUr3UYT8uMhlX0EwErzwg=; b=S2xB2lWjBg2sjruf
	Qioeo9dhbHS8bie7RPugvvpgnWm9GDmfsS78ExNm7PQ8wXuQ5E9WJA1YzLBXtaSg
	iVBRqa0vKn2LMkafTk9O6AcuKP8XWXCvsrJwRZlHgC8cE1x+fJtJY3U1SUl2L6x1
	XgRLjPi1wiPbfjnAcfsoPwUuVpm8/b6AUAv5AyOfn6DXQY//oBT7uklBk/Yzti+H
	jj+e4cyJzDWUFfceXxsMVmm7qRwOPW4gQ9oz2qv9tekLQv50olhcOPqcR6/swP6h
	Z+dSCngBj9RUBEj5xV/mRUkhl+2le8IX+QujkrIUHavcTiNK2eHM8/3XnjM7ZhwJ
	iSWRew==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6trhph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 10:01:58 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 526A1vdl007311
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 10:01:57 GMT
Received: from [10.253.37.89] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Mar 2025
 02:01:51 -0800
Message-ID: <cffdd8e8-76bc-4424-8cdb-d48f5010686d@quicinc.com>
Date: Thu, 6 Mar 2025 18:01:49 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jie Luo <quic_luoj@quicinc.com>
Subject: Re: [PATCH net-next v3 04/14] net: ethernet: qualcomm: Initialize PPE
 buffer management for IPQ9574
To: Andrew Lunn <andrew@lunn.ch>
CC: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal
	<quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>,
        "Simon
 Horman" <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Kees Cook
	<kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Philipp
 Zabel" <p.zabel@pengutronix.de>,
        <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <john@phrozen.org>
References: <20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com>
 <20250209-qcom_ipq_ppe-v3-4-453ea18d3271@quicinc.com>
 <a79027ed-012c-4771-982c-b80b55ab0c8a@lunn.ch>
 <c592c262-5928-476f-ac2a-615c44d67277@quicinc.com>
 <33529292-00cd-4a0f-87e4-b8127ca722a4@lunn.ch>
Content-Language: en-US
In-Reply-To: <33529292-00cd-4a0f-87e4-b8127ca722a4@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=HZbuTjE8 c=1 sm=1 tr=0 ts=67c97296 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=P-IC7800AAAA:8 a=pGLkceISAAAA:8 a=-cV8Hw4QFi719GmBsEsA:9
 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: ORV12Dt2uiUbTZnam6MxJqs5otzzHqIG
X-Proofpoint-ORIG-GUID: ORV12Dt2uiUbTZnam6MxJqs5otzzHqIG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_04,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060074



On 2/20/2025 11:09 PM, Andrew Lunn wrote:
> On Thu, Feb 20, 2025 at 10:38:03PM +0800, Jie Luo wrote:
>>
>>
>> On 2/11/2025 9:22 PM, Andrew Lunn wrote:
>>>> +	/* Configure BM flow control related threshold. */
>>>> +	PPE_BM_PORT_FC_SET_WEIGHT(bm_fc_val, port_cfg.weight);
>>>> +	PPE_BM_PORT_FC_SET_RESUME_OFFSET(bm_fc_val, port_cfg.resume_offset);
>>>> +	PPE_BM_PORT_FC_SET_RESUME_THRESHOLD(bm_fc_val, port_cfg.resume_ceil);
>>>> +	PPE_BM_PORT_FC_SET_DYNAMIC(bm_fc_val, port_cfg.dynamic);
>>>> +	PPE_BM_PORT_FC_SET_REACT_LIMIT(bm_fc_val, port_cfg.in_fly_buf);
>>>> +	PPE_BM_PORT_FC_SET_PRE_ALLOC(bm_fc_val, port_cfg.pre_alloc);
>>>
>>> ...
>>>
>>>> +#define PPE_BM_PORT_FC_CFG_TBL_ADDR		0x601000
>>>> +#define PPE_BM_PORT_FC_CFG_TBL_ENTRIES		15
>>>> +#define PPE_BM_PORT_FC_CFG_TBL_INC		0x10
>>>> +#define PPE_BM_PORT_FC_W0_REACT_LIMIT		GENMASK(8, 0)
>>>> +#define PPE_BM_PORT_FC_W0_RESUME_THRESHOLD	GENMASK(17, 9)
>>>> +#define PPE_BM_PORT_FC_W0_RESUME_OFFSET		GENMASK(28, 18)
>>>> +#define PPE_BM_PORT_FC_W0_CEILING_LOW		GENMASK(31, 29)
>>>> +#define PPE_BM_PORT_FC_W1_CEILING_HIGH		GENMASK(7, 0)
>>>> +#define PPE_BM_PORT_FC_W1_WEIGHT		GENMASK(10, 8)
>>>> +#define PPE_BM_PORT_FC_W1_DYNAMIC		BIT(11)
>>>> +#define PPE_BM_PORT_FC_W1_PRE_ALLOC		GENMASK(22, 12)
>>>> +
>>>> +#define PPE_BM_PORT_FC_SET_REACT_LIMIT(tbl_cfg, value)	\
>>>> +	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_BM_PORT_FC_W0_REACT_LIMIT)
>>>> +#define PPE_BM_PORT_FC_SET_RESUME_THRESHOLD(tbl_cfg, value)	\
>>>> +	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_BM_PORT_FC_W0_RESUME_THRESHOLD)
>>>
>>> Where is u32p_replace_bits()?
>>
>> u32p_replace_bits is defined by the macro __MAKE_OP(32) in the header
>> file "include/linux/bitfield.h".
> 
> Given it is pretty well hidden, and not documented, it makes me think
> you should not be using it. The macros you are expected to use from
> that file are all well documented.

OK, understand.

> 
>>> This cast does not look good.
>>
>> Yes, we can remove the cast.
> 
> To some extent, this is a symptom. Why is the cast there in the first
> place? Cast suggest bad design, not thinking about types, thinking it
> is actual O.K. to cast between types. Please look at all the casts you
> have. Is it because of bad design? If so, please fix your types to
> eliminate the casts.

Sure, this cast is actually redundant, the type of value passed to this
macro is already defined as the type u32. I will review and remove the
remaining casts in the ppe_reg.h file.

> 
>>> And this does not look like anything any
>>> other driver does. I suspect you are not using FIELD_PREP() etc when
>>> you should.
>>>
>>> https://elixir.bootlin.com/linux/v6.14-rc2/source/include/linux/bitfield.h
>>>
>>> 	Andrew
>>
>> The PPE_BM_XXX macros defined here write to either of two different
>> 32bit words in the register table, and the actual word used (0 or 1)
>> is hidden within the macro. For example, the below macro.
>>
>> #define PPE_BM_PORT_FC_SET_CEILING_HIGH(tbl_cfg, value)	\
>> 	u32p_replace_bits((u32 *)(tbl_cfg) + 0x1, value,
>> 	PPE_BM_PORT_FC_W1_CEILING_HIGH)
>>
>> We could have used FIELD_PREP as well for this purpose. However using
>> u32p_replace_bits() seemed more convenient and cleaner in this case,
>> since with FIELD_PREP, we would have needed an assignment statement to
>> be defined in the macro implementation. We also noticed many other
>> drivers using u32_replace_bits(). Hope this is ok.
> 
> Please extend the set of FIELD_{GET,PREP} macros to cover your use
> case. Document them to the level of the existing macros. Submit the
> patch to:
> 
> Yury Norov <yury.norov@gmail.com> (maintainer:BITMAP API)
> Rasmus Villemoes <linux@rasmusvillemoes.dk> (reviewer:BITMAP API)
> etc
> 
> and see what they say about this.
> 
> 	Andrew

Thanks for the suggestion. Just to clarify, we preferred
u32p_replace_bits() over FIELD_PREP() because the former does
a clear-and-set operation against a given mask, where as with
FIELD_PREP(), we need to clear the bits first before we use the
macro and then set it. Due to this, we preferred using
u32_replace_bits() since it made the macro definitions to modify
the registers simpler. Given this, would it be acceptable to
document u32p_replace_bits() better, as it is already being used
by other drivers as well?

If you prefer to use FIELD_PREP() over u32p_replace_bits(), we
can update the driver to change the macros to use FIELD_PREP().
Please note that all our macros for register modifications
operate only on 32bit values. so we do not have any necessity
for casts in the code.

Below is one example per my understanding, implemented for
both cases - u32p_replace_bits() and FIELD_PREP:

#define PPE_BM_PORT_FC_SET_WEIGHT(tbl_cfg, value) \
       u32p_replace_bits(tbl_cfg + 0x1, value, PPE_BM_PORT_FC_W1_WEIGHT)
		
#define PPE_BM_PORT_FC_SET_WEIGHT(tbl_cfg, value) \
do { \
      *(tbl_cfg + 0x1) &= ~PPE_BM_PORT_FC_W1_WEIGHT; \
      *(tbl_cfg + 0x1) |= FIELD_PREP(PPE_BM_PORT_FC_W1_WEIGHT, value); \
} while (0)


