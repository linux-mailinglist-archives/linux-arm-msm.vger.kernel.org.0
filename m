Return-Path: <linux-arm-msm+bounces-48695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A14D8A3DD28
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 15:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B813700A93
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 14:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5DA11FDE24;
	Thu, 20 Feb 2025 14:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F9bNGvmq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8411FDA89;
	Thu, 20 Feb 2025 14:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740062313; cv=none; b=s2BCb+hR5gv1azX5bC6rYtXMek4XKROSkXJoJQx4+pYp21gzvpcrTs2xVuxkLPx7f123xCbUoejnflkGkUFOXU8EU06nFbntLf01ZM0+BCmi2zvZFfKFdEOhRkCG6OApODupPzSl8zcYvMsQGd6x0J1wmjRg2EP2SjTDJKKfoyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740062313; c=relaxed/simple;
	bh=mOxseKTpZNgDLNSeo4kqfO+xUKZPU7nr0V66dGz3Hus=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=sKjbSQtIMIHTW8gUs17iybPKNLPSAZD4gLIltxswOJzWdXo68faeMLPP24Ikpm/YOPrir0FsydQ3UqamquFJUfla0KDcUlnfuAwvyFmwKRn+oSG2AxMPUxzOY1T8RxjeFB0cZBt8Liw2YbA/dvsZwhD/OFsX6meg95B5TjEo3Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F9bNGvmq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KAk9f3011747;
	Thu, 20 Feb 2025 14:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uqgp4ZF/glsbBvLDvzSpKr94BotpGNSm9OPTQtrkRvY=; b=F9bNGvmqLetiKWSk
	qDf7chw9u5ZHwXhVGDoZ7VHdQCsfN00nYDqFvRnLfd7hA1NeDudpe6feLKWqGvFE
	ZrFD45Ak+HNU7qpGWK/Bgj7+2jj+MXGtIWEcJonDBfo0yshPOcINLmzsP+qbQTIi
	YmVDg4enKxADd94XGt8aw2PzXvU5BpGUqqaSUnWOWft0lPK9+XAL7L+n5z2RT8v7
	zQeLZIEdh7DVBcmHMOGvpThQI0agtdDkRhP/F0Rbd+WFH5lLoKGRq+yWb+Py/bTn
	rU35v35S3XnZGoJDU3Bq7XFhK/9bR+1V1lSwX14wArqZL7gvJ1oy2oAy+rJm4YSw
	DhswAQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44x2xb8kud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 14:38:14 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51KEcDc7002660
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 14:38:13 GMT
Received: from [10.253.79.77] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Feb
 2025 06:38:06 -0800
Message-ID: <c592c262-5928-476f-ac2a-615c44d67277@quicinc.com>
Date: Thu, 20 Feb 2025 22:38:03 +0800
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
Content-Language: en-US
In-Reply-To: <a79027ed-012c-4771-982c-b80b55ab0c8a@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tJv55sSpdC_lXmerUQf9-QwnyZ0Cyls-
X-Proofpoint-ORIG-GUID: tJv55sSpdC_lXmerUQf9-QwnyZ0Cyls-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_06,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 mlxlogscore=606 clxscore=1015 priorityscore=1501 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502200105



On 2/11/2025 9:22 PM, Andrew Lunn wrote:
>> +	/* Configure BM flow control related threshold. */
>> +	PPE_BM_PORT_FC_SET_WEIGHT(bm_fc_val, port_cfg.weight);
>> +	PPE_BM_PORT_FC_SET_RESUME_OFFSET(bm_fc_val, port_cfg.resume_offset);
>> +	PPE_BM_PORT_FC_SET_RESUME_THRESHOLD(bm_fc_val, port_cfg.resume_ceil);
>> +	PPE_BM_PORT_FC_SET_DYNAMIC(bm_fc_val, port_cfg.dynamic);
>> +	PPE_BM_PORT_FC_SET_REACT_LIMIT(bm_fc_val, port_cfg.in_fly_buf);
>> +	PPE_BM_PORT_FC_SET_PRE_ALLOC(bm_fc_val, port_cfg.pre_alloc);
> 
> ...
> 
>> +#define PPE_BM_PORT_FC_CFG_TBL_ADDR		0x601000
>> +#define PPE_BM_PORT_FC_CFG_TBL_ENTRIES		15
>> +#define PPE_BM_PORT_FC_CFG_TBL_INC		0x10
>> +#define PPE_BM_PORT_FC_W0_REACT_LIMIT		GENMASK(8, 0)
>> +#define PPE_BM_PORT_FC_W0_RESUME_THRESHOLD	GENMASK(17, 9)
>> +#define PPE_BM_PORT_FC_W0_RESUME_OFFSET		GENMASK(28, 18)
>> +#define PPE_BM_PORT_FC_W0_CEILING_LOW		GENMASK(31, 29)
>> +#define PPE_BM_PORT_FC_W1_CEILING_HIGH		GENMASK(7, 0)
>> +#define PPE_BM_PORT_FC_W1_WEIGHT		GENMASK(10, 8)
>> +#define PPE_BM_PORT_FC_W1_DYNAMIC		BIT(11)
>> +#define PPE_BM_PORT_FC_W1_PRE_ALLOC		GENMASK(22, 12)
>> +
>> +#define PPE_BM_PORT_FC_SET_REACT_LIMIT(tbl_cfg, value)	\
>> +	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_BM_PORT_FC_W0_REACT_LIMIT)
>> +#define PPE_BM_PORT_FC_SET_RESUME_THRESHOLD(tbl_cfg, value)	\
>> +	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_BM_PORT_FC_W0_RESUME_THRESHOLD)
> 
> Where is u32p_replace_bits()?

u32p_replace_bits is defined by the macro __MAKE_OP(32) in the header
file "include/linux/bitfield.h".

> 
> This cast does not look good. 

Yes, we can remove the cast.

> And this does not look like anything any
> other driver does. I suspect you are not using FIELD_PREP() etc when
> you should.
> 
> https://elixir.bootlin.com/linux/v6.14-rc2/source/include/linux/bitfield.h
> 
> 	Andrew

The PPE_BM_XXX macros defined here write to either of two different
32bit words in the register table, and the actual word used (0 or 1)
is hidden within the macro. For example, the below macro.

#define PPE_BM_PORT_FC_SET_CEILING_HIGH(tbl_cfg, value)	\
	u32p_replace_bits((u32 *)(tbl_cfg) + 0x1, value,
	PPE_BM_PORT_FC_W1_CEILING_HIGH)

We could have used FIELD_PREP as well for this purpose. However using
u32p_replace_bits() seemed more convenient and cleaner in this case,
since with FIELD_PREP, we would have needed an assignment statement to
be defined in the macro implementation. We also noticed many other
drivers using u32_replace_bits(). Hope this is ok.



