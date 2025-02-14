Return-Path: <linux-arm-msm+bounces-47988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B88FFA3583B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 08:54:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E193116D802
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 07:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC1A21CC49;
	Fri, 14 Feb 2025 07:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oPH5KZqS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742D921CA15;
	Fri, 14 Feb 2025 07:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739519658; cv=none; b=uUdK0sYgABNuwWjvGsc9HJ6+jSnOEN2XlKwnM7Jv5abpMCerdUXqr+4iwz0umcxbyY8j5NEuWIwSmW2B9xaUOoqHdbXqbHJB5DTpXagkHu9uDG0P4N3yUImMEn5cMPVFn2N+ZX+x/nwgvp6AE0I/W5RYsXaOXdqsEludIZimSus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739519658; c=relaxed/simple;
	bh=45Tz24uPoXgDuv5j0ursj0miH5MwS4km0Q73o3xa/Zw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nOGenKIWc+ESEe9nj2DqBSeSEz2JXHHIYUhcsIpmZPai8TTSQOYO3gTi+aFM+/bCEg+1FJOt44CDHCsDjfs6gi8Xj6yuvHVFoTlr6hHfZ1zFvtfoN1AW3xf9GQjoZEjUKGN8xedo5v8an1CPGR4Y+KOtuMyGJkQAdubW82e+vuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oPH5KZqS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DJB5a1021173;
	Fri, 14 Feb 2025 07:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HAYSPZbl83POZAmHJAGXhhTdwk7rXWp+0KD8AQWCC5I=; b=oPH5KZqSsozJaTLj
	HVfsjKWnzrQONJXe/Y2LHmEXxSYjiQoPAIZJ/Qf34K7HIViQZiv68rmM/uKpEWQc
	2iBjx73nQ8zTq0g8MpCqu3p/utQnkwP+9US5oy4Z5hjAs6uLHESSAjV7QwRGURVV
	NPfR0MOAsy+6EY56+XclTZTw5pQcXGtxkjhQsgqw6cc8eRlvNM7pG8lw8ilXTcZb
	CW/1XuAgFQR9l3IGsVIaWKyY7D08sl2hPtuk9FRzJOoU65HW4ObNQOmZElC0g5HK
	TTWzCQzHEhENp5NWl5SsnnJmi7pnsnFG0jwifrllgvUUtdpXil6HM6gqZtHNitGv
	srYn5g==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sdyxu0w0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 07:53:50 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51E7rnWl007481
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 07:53:49 GMT
Received: from [10.253.8.223] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Feb
 2025 23:53:43 -0800
Message-ID: <a455a2f6-ca0b-43e0-b18c-53f73344981f@quicinc.com>
Date: Fri, 14 Feb 2025 15:53:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 13/14] net: ethernet: qualcomm: Add PPE
 debugfs support for PPE counters
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
 <20250209-qcom_ipq_ppe-v3-13-453ea18d3271@quicinc.com>
 <5a53333b-e94c-4fb7-b23d-e1d38d2dad8e@lunn.ch>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <5a53333b-e94c-4fb7-b23d-e1d38d2dad8e@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5jzzIxN4f9onN6lHbtwPFex5843Xykdw
X-Proofpoint-GUID: 5jzzIxN4f9onN6lHbtwPFex5843Xykdw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502140059



On 2/11/2025 9:55 PM, Andrew Lunn wrote:
>> +#define PRINT_COUNTER_PREFIX(desc, cnt_type)		\
>> +	seq_printf(seq, "%-16s %16s", desc, cnt_type)
>> +
>> +#define PRINT_CPU_CODE_COUNTER(cnt, code)		\
>> +	seq_printf(seq, "%10u(cpucode:%d)", cnt, code)
>> +
>> +#define PRINT_DROP_CODE_COUNTER(cnt, port, code)	\
>> +	seq_printf(seq, "%10u(port=%d),dropcode:%d", cnt, port, code)
>> +
>> +#define PRINT_SINGLE_COUNTER(tag, cnt, str, index)			\
>> +do {									\
>> +	if (!((tag) % 4))							\
>> +		seq_printf(seq, "\n%-16s %16s", "", "");		\
>> +	seq_printf(seq, "%10u(%s=%04d)", cnt, str, index);		\
>> +} while (0)
>> +
>> +#define PRINT_TWO_COUNTERS(tag, cnt0, cnt1, str, index)			\
>> +do {									\
>> +	if (!((tag) % 4))							\
>> +		seq_printf(seq, "\n%-16s %16s", "", "");		\
>> +	seq_printf(seq, "%10u/%u(%s=%04d)", cnt0, cnt1, str, index);	\
>> +} while (0)
> 
> I don't think these make the code any more readable. Just inline it.

OK.

> 
>> +/* The number of packets dropped because of no buffer available, no PPE
>> + * buffer assigned to these packets.
>> + */
>> +static void ppe_port_rx_drop_counter_get(struct ppe_device *ppe_dev,
>> +					 struct seq_file *seq)
>> +{
>> +	u32 reg, drop_cnt = 0;
>> +	int ret, i, tag = 0;
>> +
>> +	PRINT_COUNTER_PREFIX("PRX_DROP_CNT", "SILENT_DROP:");
>> +	for (i = 0; i < PPE_DROP_CNT_TBL_ENTRIES; i++) {
>> +		reg = PPE_DROP_CNT_TBL_ADDR + i * PPE_DROP_CNT_TBL_INC;
>> +		ret = ppe_pkt_cnt_get(ppe_dev, reg, PPE_PKT_CNT_SIZE_1WORD,
>> +				      &drop_cnt, NULL);
>> +		if (ret) {
>> +			seq_printf(seq, "ERROR %d\n", ret);
>> +			return;
>> +		}
> 
> This is an error getting the value from the hardware? You should not
> put that into the debugfs itself, you want the read() call to return
> it.
> 

Yes, this error code is returned by regmap read functions in
ppe_pkt_cnt_get() when the hardware counter read fails. I will
remove it from debugfs file and instead log the error to the
console (dev_info).

>> +/* Display the various packet counters of PPE. */
>> +static int ppe_packet_counter_show(struct seq_file *seq, void *v)
>> +{
>> +	struct ppe_device *ppe_dev = seq->private;
>> +
>> +	ppe_port_rx_drop_counter_get(ppe_dev, seq);
>> +	ppe_port_rx_bm_drop_counter_get(ppe_dev, seq);
>> +	ppe_port_rx_bm_port_counter_get(ppe_dev, seq);
>> +	ppe_parse_pkt_counter_get(ppe_dev, seq);
>> +	ppe_port_rx_counter_get(ppe_dev, seq);
>> +	ppe_vp_rx_counter_get(ppe_dev, seq);
>> +	ppe_pre_l2_counter_get(ppe_dev, seq);
>> +	ppe_vlan_counter_get(ppe_dev, seq);
>> +	ppe_cpu_code_counter_get(ppe_dev, seq);
>> +	ppe_eg_vsi_counter_get(ppe_dev, seq);
>> +	ppe_vp_tx_counter_get(ppe_dev, seq);
>> +	ppe_port_tx_counter_get(ppe_dev, seq);
>> +	ppe_queue_tx_counter_get(ppe_dev, seq);
> 
> It would be more normal to have one debugfs file per group of
> counters.
> 
> 	Andrew

Sure. We used a single file as it may be more convenient to display
these counters all together in one go, since dumping single group
counter has no help on tracing packet drops inside the PPE path.
But perhaps, a script can be used as well on top of the segregated
files to dump all the counters.



