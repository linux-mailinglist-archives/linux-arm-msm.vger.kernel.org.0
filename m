Return-Path: <linux-arm-msm+bounces-63214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC2AAEF875
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 14:29:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D7895203F6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 12:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1EE274FF5;
	Tue,  1 Jul 2025 12:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q0nmBEXC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35AE2749C9;
	Tue,  1 Jul 2025 12:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751372715; cv=none; b=F6c3ptdrfmRcB8YOqlSmbP+A4759bBcUDbQsIZr/Aoxa5YMbDORzxve8PH294w4WOmeknHadtBbHWmmLR1FWQOCb5bd+Ag1zgyr0zfP93t5OUDdX6JdgJ3Mz1fiGuMQdHgWqDtK/mXy03B8/R81vemwiWk5SKeNsX5pNGdyeN8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751372715; c=relaxed/simple;
	bh=ZfLRBlA2GXkaE/VO2K/FwkaVy6TzTJYLHSCfKwRcEYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aMgGbKzaXYL7E//RE9UFPMlaOm3VknlI+8MeS/WfB9yMLnf80VIFgQz3+i0AqnFDLMvLaP//Rvik6rpsZ8U9B9x1oKwDGMv1WQCDSu1fwasRhc0Ct6lsrYFcsIq7iGqmHKyOJoPayclTYnEp+beaim/CN5qtCNfNEXJ99+gz8fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q0nmBEXC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561AS4cV025180;
	Tue, 1 Jul 2025 12:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VLfCL1rkHHgT9uUOPYI/+4UoWa4a8cDmu5VDzDonpos=; b=Q0nmBEXC8OyJe4Q6
	6wy8de192wCOGtxsw4UcXZAXrrrVaB4j/tDvANBkuYMdgm7nKdstguZJ6b7JyPKq
	+/AA6Nalt4YupTM8Jlri3CRJpZB68U0twE4ucq35IQCD2w3bYKeMEz+UMmFXLakw
	AaFutyH2qh+hbxqqfFQUQvbW3eb1+eh1qlClzQIF9pR2K5Ww1IlrIE0B4TgWPLhm
	8GKKrCoDxCSiWCl+Bfy8jeVTYZMExZ98USLD/jvFBf/wjuBEP3YWR7N32yV9nHw0
	mxCtIXD/rL/UNYbNS0bQ8xgSj7LaHAY5/aXLNHxmkCToR5anjodQwvesNm+grpsR
	lVU0ZA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64p3na-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 12:24:59 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 561COwqI015223
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Jul 2025 12:24:58 GMT
Received: from [10.235.9.75] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 1 Jul
 2025 05:24:52 -0700
Message-ID: <e768d295-843c-431d-b439-e2ed07de638e@quicinc.com>
Date: Tue, 1 Jul 2025 20:24:49 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 03/14] net: ethernet: qualcomm: Add PPE driver
 for IPQ9574 SoC
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
 <20250626-qcom_ipq_ppe-v5-3-95bdc6b8f6ff@quicinc.com>
 <4556893f-982b-435d-aed1-d661ee31f862@oss.qualcomm.com>
Content-Language: en-US
From: Luo Jie <quic_luoj@quicinc.com>
In-Reply-To: <4556893f-982b-435d-aed1-d661ee31f862@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=6863d39c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=7dPGx68Ngd3I7BFEivgA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA3NyBTYWx0ZWRfX4IEn9JSUGS2L
 aNJr6xWle08pZAmNdDBPdZeCIkNMtnn39GhzKsq4J544L1f1vXbWDKR4Z7NZ+uozrW7hnfRUfpR
 rZ606b4PDQmGV4mV/ExgeN50BQQRSgc5KzY3y4PEXzOiSQqhYbhkH/ZvSpyxIcL+9CnqQdFWtWE
 L52ZwCs30nD/OB9eg5gdwRr+C+wFj1djfQvrdbSx15EuWfiCYQqCJmj8ZzcVuTTIsz0UG8Ctlq8
 TRF8wnyaUYn8EACuNmX/H46wdjsJHF89v82lfRhMp+PdLADCE++Tf4v32uGAB/JQHtdpNOZXU3e
 RfG+I8K2Rrcs+H3P4WJFuo6TEQMucpVEpOqAwHLqqlcGV06p31cugGK0QVA4I81UAZoOPV8fe+P
 VtYi288h4UcS9258SzF8EjyRndTdf+ZsMhSJ3P5K87gJf7nFjNC3Tvf48pJXQa9jW9Fg264i
X-Proofpoint-GUID: lEGc_dr8qa8_dsrASY2Y2WkGC8eRWqHq
X-Proofpoint-ORIG-GUID: lEGc_dr8qa8_dsrASY2Y2WkGC8eRWqHq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=886
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010077



On 6/28/2025 12:21 AM, Konrad Dybcio wrote:
> On 6/26/25 4:31 PM, Luo Jie wrote:
>> The PPE (Packet Process Engine) hardware block is available on Qualcomm
>> IPQ SoC that support PPE architecture, such as IPQ9574.
>>
>> The PPE in IPQ9574 includes six integrated ethernet MAC for 6 PPE ports,
>> buffer management, queue management and scheduler functions. The MACs
>> can connect with the external PHY or switch devices using the UNIPHY PCS
>> block available in the SoC.
>>
>> The PPE also includes various packet processing offload capabilities
>> such as L3 routing and L2 bridging, VLAN and tunnel processing offload.
>> It also includes Ethernet DMA function for transferring packets between
>> ARM cores and PPE ethernet ports.
>>
>> This patch adds the base source files and Makefiles for the PPE driver
>> such as platform driver registration, clock initialization, and PPE
>> reset routines.
>>
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>> ---
> 
> [...]
> 
>> +static int ppe_clock_init_and_reset(struct ppe_device *ppe_dev)
>> +{
>> +	unsigned long ppe_rate = ppe_dev->clk_rate;
>> +	struct device *dev = ppe_dev->dev;
>> +	struct reset_control *rstc;
>> +	struct clk_bulk_data *clks;
>> +	struct clk *clk;
>> +	int ret, i;
>> +
>> +	for (i = 0; i < ppe_dev->num_icc_paths; i++) {
>> +		ppe_dev->icc_paths[i].name = ppe_icc_data[i].name;
>> +		ppe_dev->icc_paths[i].avg_bw = ppe_icc_data[i].avg_bw ? :
>> +					       Bps_to_icc(ppe_rate);
>> +		ppe_dev->icc_paths[i].peak_bw = ppe_icc_data[i].peak_bw ? :
>> +						Bps_to_icc(ppe_rate);
>> +	}
> 
> Can you not just set ppe_dev->icc_paths to ppe_icc_data?
> 
> Konrad

The `avg_bw` and `peak_bw` for two of the PPE ICC clocks ('ppe' and
'ppe_cfg') vary across different SoCs and they need to be read from
platform data. They are not pre-defined in `ppe_icc_data` array.
Therefore, we use this format to assign `icc_paths`, allowing us to
accommodate cases where `avg_bw` and `peak_bw` are not predefined.
Hope this is fine. Thanks.

