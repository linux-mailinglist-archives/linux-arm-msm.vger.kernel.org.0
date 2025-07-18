Return-Path: <linux-arm-msm+bounces-65594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B72B09CD0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 09:41:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5730116A775
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 07:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF1523C50B;
	Fri, 18 Jul 2025 07:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QTy2Kqxm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1661A8F97;
	Fri, 18 Jul 2025 07:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752824513; cv=none; b=mAHm2QcANWWhxx/hPDVQ8ITfwsS//Du78odCNNxO6yi5xaA7cybgkvo/JulfUbehHEQiS+5v/wsupkQNBhBL2ccGIE+bXUhJONMIfvRgZlHsVM4eCBCY658/ElevdoCyIlGNsHxbe3AFn18PQQPyjVPzwTF8iKzs6VyJUcgf8wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752824513; c=relaxed/simple;
	bh=J5kKqTKlg4ioIqTAnV2dtolGEeERqKQr/KzPEPbUKz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UcJGE+H5fJ4tsFyMhaFg/DBF8raW/C6nPGIZny9Ka0VYF/usrsSe9DpjnTj+rJ9NYahCz8sp/AZheL5b49yeKCh87CHGAZWI8xmXazcl7OVBo6alglOJu8LQc3CkwSWx2Et3WFhsEAp74sKMezXB+d95Nm0LFqNgtEa6FsjcL4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QTy2Kqxm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I7cjHo009576;
	Fri, 18 Jul 2025 07:41:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FFAOMChFqrKhKYfUFTQm9VW1DmXhkt4PhiDLnZ9VC2M=; b=QTy2Kqxm09sxhe30
	oq1riXFH+6JvVlsJoFElb+y9/z/QhwqNLKFRBtJjZzmaQWg5tHu//P6+gSglvwBD
	d/XYDK+zzityzeIoJg8CoPQlhhQrnr/V7pQxxL37da/FUkMQFzhtLsQYT2Iszk6w
	63YSdnPxT750gWzVEBmmXh8MxwS5tf63HQUUgC3gtwbRYIQ6YEQHiBwlIimpNie/
	yVuIzzxlgG9DxKQuBn9APVvv1aQGT/hejB78Q/68Jiiw7o8NGcd0h22o7BFBxzAz
	skWtQLq2Ro78XdLHsk2GBJHmgDSSd8EENrM/w+sbaDuivQsNO+kg1m6yC56GY0yc
	7LYZIg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxbam37-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Jul 2025 07:41:34 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56I7fXVK013574
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Jul 2025 07:41:33 GMT
Received: from [10.253.76.178] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 18 Jul
 2025 00:41:27 -0700
Message-ID: <13ca4d6e-d5db-4fd5-af14-9ccda55ddba2@quicinc.com>
Date: Fri, 18 Jul 2025 15:41:24 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 10/14] net: ethernet: qualcomm: Initialize PPE
 RSS hash settings
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Andrew Lunn
	<andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        "Eric
 Dumazet" <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei
	<quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R.
 Silva" <gustavoars@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>
References: <20250626-qcom_ipq_ppe-v5-0-95bdc6b8f6ff@quicinc.com>
 <20250626-qcom_ipq_ppe-v5-10-95bdc6b8f6ff@quicinc.com>
 <793434f9-7cdc-409f-b855-380be7a2b0db@oss.qualcomm.com>
Content-Language: en-US
From: Luo Jie <quic_luoj@quicinc.com>
In-Reply-To: <793434f9-7cdc-409f-b855-380be7a2b0db@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: d_Ee6WCGIkzRAaD8MJrO82z3Rn9nrrvQ
X-Proofpoint-ORIG-GUID: d_Ee6WCGIkzRAaD8MJrO82z3Rn9nrrvQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA1OSBTYWx0ZWRfXzWtpS0NkR21S
 bKygKN8oh1IUv8AVDh/vUd/98aZ1oaCRQpBNmnNHVo+bU0S20YIhwjsQfAGy8QYS8WmMWEhjMuh
 dOEjt7OBI0xihMiqz95prDVSpkl+qR5vNDTqFFu/S5iixN7P4Q7k/dPXBGiu4152Y64ZCT0kgy4
 IsNKfG6OInSNOWwIGk1E2H5zs0CecuE8LQnvsSa3h8/Bk1kynfcR/EYLONf5ZsGaParQWlh+ZgF
 6bFwKiSXXkavGCM0iDeit/p5+CBfc4c5N8BvrbaMeMovs8UT0JHfNz0rA2J1BcLXaCde1PXtTbU
 OSeDdCdNTQ1CyL+HvZjr+IU6AVKhPnr1440unU7xxT0Ht2vq/MPuQF++CpGHHjclr3DfAWQgh4V
 kGt0b7fqYgCsDzRrgTV5rnNQrs8tJx5idRSJgbWUJj6ShIHBnq6AWK0QWpwM7pjEN0Jbfnie
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=6879faae cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=8GLID_3tYxgRnLsb8HMA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180059



On 7/18/2025 4:48 AM, Konrad Dybcio wrote:
> On 6/26/25 4:31 PM, Luo Jie wrote:
>> The PPE RSS hash is generated during PPE receive, based on the packet
>> content (3 tuples or 5 tuples) and as per the configured RSS seed. The
>> hash is then used to select the queue to transmit the packet to the
>> ARM CPU.
>>
>> This patch initializes the RSS hash settings that are used to generate
>> the hash for the packet during PPE packet receive.
>>
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>> ---
>>   drivers/net/ethernet/qualcomm/ppe/ppe_config.c | 194 ++++++++++++++++++++++++-
>>   drivers/net/ethernet/qualcomm/ppe/ppe_config.h |  39 +++++
>>   drivers/net/ethernet/qualcomm/ppe/ppe_regs.h   |  40 +++++
>>   3 files changed, 272 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
>> index dd7a4949f049..3b290eda7633 100644
>> --- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
>> +++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
>> @@ -1216,6 +1216,143 @@ int ppe_counter_enable_set(struct ppe_device *ppe_dev, int port)
>>   	return regmap_set_bits(ppe_dev->regmap, reg, PPE_PORT_EG_VLAN_TBL_TX_COUNTING_EN);
>>   }
>>   
>> +static int ppe_rss_hash_ipv4_config(struct ppe_device *ppe_dev, int index,
>> +				    struct ppe_rss_hash_cfg cfg)
>> +{
>> +	u32 reg, val;
>> +
>> +	switch (index) {
>> +	case 0:
>> +		val = FIELD_PREP(PPE_RSS_HASH_MIX_IPV4_VAL, cfg.hash_sip_mix[0]);
>> +		break;
>> +	case 1:
>> +		val = FIELD_PREP(PPE_RSS_HASH_MIX_IPV4_VAL, cfg.hash_dip_mix[0]);
>> +		break;
>> +	case 2:
>> +		val = FIELD_PREP(PPE_RSS_HASH_MIX_IPV4_VAL, cfg.hash_protocol_mix);
>> +		break;
>> +	case 3:
>> +		val = FIELD_PREP(PPE_RSS_HASH_MIX_IPV4_VAL, cfg.hash_dport_mix);
>> +		break;
>> +	case 4:
>> +		val = FIELD_PREP(PPE_RSS_HASH_MIX_IPV4_VAL, cfg.hash_sport_mix);
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	reg = PPE_RSS_HASH_MIX_IPV4_ADDR + index * PPE_RSS_HASH_MIX_IPV4_INC;
>> +
>> +	return regmap_write(ppe_dev->regmap, reg, val);
> 
> FWIW you can assign the value in the switch statement and only FIELD_PREP
> it in the regmap_write, since the bitfield is the same
> 
> Konrad

Thank you for the suggestion, I'll update the code accordingly.


