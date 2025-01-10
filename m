Return-Path: <linux-arm-msm+bounces-44756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F98AA0961C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 16:43:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61CC23A9BCD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 15:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3ACA211713;
	Fri, 10 Jan 2025 15:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QQtwj3CB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B26A2116F8;
	Fri, 10 Jan 2025 15:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736523752; cv=none; b=RMWHvIVQ6VglE5Esv7FHIi6jpWEBQQj7Me0QQnhUns2E3yHG/h0QD1jFeivP58Y/QD49kdRu7lXgbMB7udjI0TFLpFyzdZayn57u94QousAuZFXr0pl4LRvfsR5CW7HmE7tVo83fPLh8O5kuu08CbtEY4DNYq0atsSb9cv7PGJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736523752; c=relaxed/simple;
	bh=i9xt/jnok4MJLlRnnrd+e+veFykyABth3Foza1dDAA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CD9dSJg6JNW+HbEo2geHBlFFPOQQb/OmhkcocuudUJgcO6kYAoiD0fgpQFIt/k5aA2JBiAizytS3FGU+E+ow5GdjCFpZQNVYKKnDnb0/FF8WbZMJx+n6YMwgm/ZzJqAJvymQWuNV7zITruO26SIHUsNEdQlg+gZulwzrkOH0/Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QQtwj3CB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A9wiK1011292;
	Fri, 10 Jan 2025 15:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DCG+FwGeVUVpnHfDbIS/zY0x/7uE7jBzf5UxSr++8ac=; b=QQtwj3CB5LngJ3M6
	4M7AGLu7HJD4BzfQ+kTy+niDo5bOFcwwegaceKwY4xKWr2wmDEueYOLZJuMWqlNK
	ipze2Jy3K3t0ITeaOYO7OCwRT9nEJGollWUbw/4wX+sUzLeOHYnMFs84smWWIe4k
	qnSua+5DmjIlAHheALrJ0gh1cqq9DfzGYqrPKJsNgkblYNV0/jiMrcvqOIZSuuIq
	ozW0dkX2HatdITpo7Pyfn4SKXy30dwjBgAvLmUbRyhsxjc6r2ZkaXJYI8ra0ZfU2
	VaUmdIIZUYt+2+xixeuzUNtIti/iLb7+XRMnjo+hYf0PUZQC74kaefYoQO4dKAb5
	WfBo/Q==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4431d48wkd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 15:42:17 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50AFgG1l025734
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 15:42:16 GMT
Received: from [10.253.12.10] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 10 Jan
 2025 07:42:10 -0800
Message-ID: <36ea74e1-9caa-47b9-a614-5633f38f1444@quicinc.com>
Date: Fri, 10 Jan 2025 23:42:08 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 04/14] net: ethernet: qualcomm: Initialize PPE
 buffer management for IPQ9574
To: Simon Horman <horms@kernel.org>
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
        "Jonathan
 Corbet" <corbet@lwn.net>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva"
	<gustavoars@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <john@phrozen.org>
References: <20250108-qcom_ipq_ppe-v2-0-7394dbda7199@quicinc.com>
 <20250108-qcom_ipq_ppe-v2-4-7394dbda7199@quicinc.com>
 <20250109172714.GN7706@kernel.org> <20250109201154.GS7706@kernel.org>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <20250109201154.GS7706@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tMmY8lbG8VPD3Z3AywklzvrWUfHqjzk_
X-Proofpoint-GUID: tMmY8lbG8VPD3Z3AywklzvrWUfHqjzk_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100123



On 1/10/2025 4:11 AM, Simon Horman wrote:
> On Thu, Jan 09, 2025 at 05:27:14PM +0000, Simon Horman wrote:
>> On Wed, Jan 08, 2025 at 09:47:11PM +0800, Luo Jie wrote:
>>> The BM (Buffer Management) config controls the pause frame generated
>>> on the PPE port. There are maximum 15 BM ports and 4 groups supported,
>>> all BM ports are assigned to group 0 by default. The number of hardware
>>> buffers configured for the port influence the threshold of the flow
>>> control for that port.
>>>
>>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>>
>> ...
>>
>>> diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
>>
>> ...
>>
>>> +/* The buffer configurations per PPE port. There are 15 BM ports and
>>> + * 4 BM groups supported by PPE. BM port (0-7) is for EDMA port 0,
>>> + * BM port (8-13) is for PPE physical port 1-6 and BM port 14 is for
>>> + * EIP port.
>>> + */
>>> +static struct ppe_bm_port_config ipq9574_ppe_bm_port_config[] = {
>>> +	{
>>> +		/* Buffer configuration for the BM port ID 0 of EDMA. */
>>> +		.port_id_start	= 0,
>>> +		.port_id_end	= 0,
>>> +		.pre_alloc	= 0,
>>> +		.in_fly_buf	= 100,
>>> +		.ceil		= 1146,
>>> +		.weight		= 7,
>>> +		.resume_offset	= 8,
>>> +		.resume_ceil	= 0,
>>> +		.dynamic	= true,
>>> +	},
>>> +	{
>>> +		/* Buffer configuration for the BM port ID 1-7 of EDMA. */
>>> +		.port_id_start	= 1,
>>> +		.port_id_end	= 7,
>>> +		.pre_alloc	= 0,
>>> +		.in_fly_buf	= 100,
>>> +		.ceil		= 250,
>>> +		.weight		= 4,
>>> +		.resume_offset	= 36,
>>> +		.resume_ceil	= 0,
>>> +		.dynamic	= true,
>>> +	},
>>> +	{
>>> +		/* Buffer configuration for the BM port ID 8-13 of PPE ports. */
>>> +		.port_id_start	= 8,
>>> +		.port_id_end	= 13,
>>> +		.pre_alloc	= 0,
>>> +		.in_fly_buf	= 128,
>>> +		.ceil		= 250,
>>> +		.weight		= 4,
>>> +		.resume_offset	= 36,
>>> +		.resume_ceil	= 0,
>>> +		.dynamic	= true,
>>> +	},
>>> +	{
>>> +		/* Buffer configuration for the BM port ID 14 of EIP. */
>>> +		.port_id_start	= 14,
>>> +		.port_id_end	= 14,
>>> +		.pre_alloc	= 0,
>>> +		.in_fly_buf	= 40,
>>> +		.ceil		= 250,
>>> +		.weight		= 4,
>>> +		.resume_offset	= 36,
>>> +		.resume_ceil	= 0,
>>> +		.dynamic	= true,
>>> +	},
>>> +};
>>> +
>>> +static int ppe_config_bm_threshold(struct ppe_device *ppe_dev, int bm_port_id,
>>> +				   struct ppe_bm_port_config port_cfg)
>>> +{
>>> +	u32 reg, val, bm_fc_val[2];
>>> +	int ret;
>>> +
>>> +	/* Configure BM flow control related threshold. */
>>> +	PPE_BM_PORT_FC_SET_WEIGHT(bm_fc_val, port_cfg.weight);
>>
>> Hi Luo Jie,
>>
>> When compiling with W=1 for x86_32 and ARM (32bit)
>> (but, curiously not x86_64 or arm64), gcc-14 complains that
>> bm_fc_val is uninitialised, I believe due to the line above and
>> similar lines below.
>>
>> In file included from drivers/net/ethernet/qualcomm/ppe/ppe_config.c:10:
>> In function 'u32p_replace_bits',
>>      inlined from 'ppe_config_bm_threshold' at drivers/net/ethernet/qualcomm/ppe/ppe_config.c:112:2:
>> ./include/linux/bitfield.h:189:15: warning: 'bm_fc_val' is used uninitialized [-Wuninitialized]
>>    189 |         *p = (*p & ~to(field)) | type##_encode_bits(val, field);        \
>>        |               ^~
>> ./include/linux/bitfield.h:198:9: note: in expansion of macro '____MAKE_OP'
>>    198 |         ____MAKE_OP(u##size,u##size,,)
>>        |         ^~~~~~~~~~~
>> ./include/linux/bitfield.h:201:1: note: in expansion of macro '__MAKE_OP'
>>    201 | __MAKE_OP(32)
>>        | ^~~~~~~~~
>> drivers/net/ethernet/qualcomm/ppe/ppe_config.c: In function 'ppe_config_bm_threshold':
>> drivers/net/ethernet/qualcomm/ppe/ppe_config.c:108:23: note: 'bm_fc_val' declared here
>>    108 |         u32 reg, val, bm_fc_val[2];
>>        |                       ^~~~~~~~~
>>
>>> +	PPE_BM_PORT_FC_SET_RESUME_OFFSET(bm_fc_val, port_cfg.resume_offset);
>>> +	PPE_BM_PORT_FC_SET_RESUME_THRESHOLD(bm_fc_val, port_cfg.resume_ceil);
>>> +	PPE_BM_PORT_FC_SET_DYNAMIC(bm_fc_val, port_cfg.dynamic);
>>> +	PPE_BM_PORT_FC_SET_REACT_LIMIT(bm_fc_val, port_cfg.in_fly_buf);
>>> +	PPE_BM_PORT_FC_SET_PRE_ALLOC(bm_fc_val, port_cfg.pre_alloc);
>>> +
>>> +	/* Configure low/high bits of the ceiling for the BM port. */
>>> +	val = FIELD_PREP(GENMASK(2, 0), port_cfg.ceil);
>>
>> The value of port_cfg.ceil is 250 or 1146, as set in
>> ipq9574_ppe_bm_port_config. clang-19 W=1 builds complain that this
>> value is too large for the field (3 bits).
>>
>> drivers/net/ethernet/qualcomm/ppe/ppe_config.c:120:8: error: call to '__compiletime_assert_925' declared with 'error' attribute: FIELD_PREP: value too large for the field
>>    120 |         val = FIELD_PREP(GENMASK(2, 0), port_cfg.ceil);
>>        |               ^
>> ./include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
>>    115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
>>        |                 ^
>> ./include/linux/bitfield.h:68:3: note: expanded from macro '__BF_FIELD_CHECK'
>>     68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
>>        |                 ^
>> ./include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
>>     39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>>        |                                     ^
>> note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>> ././include/linux/compiler_types.h:530:2: note: expanded from macro '_compiletime_assert'
>>    530 |         __compiletime_assert(condition, msg, prefix, suffix)
>>        |         ^
>> ././include/linux/compiler_types.h:523:4: note: expanded from macro '__compiletime_assert'
>>    523 |                         prefix ## suffix();                             \
>>        |                         ^
>> <scratch space>:95:1: note: expanded from here
>>     95 | __compiletime_assert_925
>>        | ^
>> 1 error generated
>>
>>> +	PPE_BM_PORT_FC_SET_CEILING_LOW(bm_fc_val, val);
>>> +	val = FIELD_PREP(GENMASK(10, 3), port_cfg.ceil);
> 
> One more thing - I was pondering this over dinner.
> 
> I believe that the above will write the bits 0-7 of port_cfg.ceil
> to bits 3-10 of val. I am guessing that the reverse mapping of
> bits is intended.
> 

Thanks for catching this, yes, I will update this code. And also run the
32 bit ARCH check on the patches.

>>> +	PPE_BM_PORT_FC_SET_CEILING_HIGH(bm_fc_val, val);
>>> +
>>> +	reg = PPE_BM_PORT_FC_CFG_TBL_ADDR + PPE_BM_PORT_FC_CFG_TBL_INC * bm_port_id;
>>> +	ret = regmap_bulk_write(ppe_dev->regmap, reg,
>>> +				bm_fc_val, ARRAY_SIZE(bm_fc_val));
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	/* Assign the default group ID 0 to the BM port. */
>>> +	val = FIELD_PREP(PPE_BM_PORT_GROUP_ID_SHARED_GROUP_ID, 0);
>>> +	reg = PPE_BM_PORT_GROUP_ID_ADDR + PPE_BM_PORT_GROUP_ID_INC * bm_port_id;
>>> +	ret = regmap_update_bits(ppe_dev->regmap, reg,
>>> +				 PPE_BM_PORT_GROUP_ID_SHARED_GROUP_ID,
>>> +				 val);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	/* Enable BM port flow control. */
>>> +	val = FIELD_PREP(PPE_BM_PORT_FC_MODE_EN, true);
>>> +	reg = PPE_BM_PORT_FC_MODE_ADDR + PPE_BM_PORT_FC_MODE_INC * bm_port_id;
>>> +
>>> +	return regmap_update_bits(ppe_dev->regmap, reg,
>>> +				  PPE_BM_PORT_FC_MODE_EN,
>>> +				  val);
>>> +}
>>
>> ...
>>
>> -- 
>> pw-bot: changes-requested
>>


