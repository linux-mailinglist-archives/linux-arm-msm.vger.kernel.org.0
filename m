Return-Path: <linux-arm-msm+bounces-42725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4999F734F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 04:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9725D164781
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 03:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06D9386325;
	Thu, 19 Dec 2024 03:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fPQ1Ce3Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BB73D3B8;
	Thu, 19 Dec 2024 03:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734578721; cv=none; b=TIcTebns7rtAd2Aj+qFlJdDfbp2HSM29Mo8+SjcfX2aenXCQJYf7LdaDzF8nlxhv4TBOJA/S6TRvmROb7N+ybfcktmHsI3507C7Zsw9PiCxW90bhDvn1Ic380HjcHlsaKYxx1qOzZ6yv8d2VmF260aArHzZDWXV64/a09MzOcuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734578721; c=relaxed/simple;
	bh=porEPczi67MnU8utZU92dIGIY6HD8GQJSMVzWv14uk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bEsrYY72VPtbfEXLkd7iktrbP3RdSdsueztBZn27Fvohsyhwl2A2upaSUdpubgr2fB6qsLV+sWVEOTYw1gFkhCjhCoHLiCOm15sVrG+DzITwZ2ILp/hgypAppuspJH96dP1nUifIQsODumUfYHALS6whUYzcOpNU2yPjAAfnKxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fPQ1Ce3Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIICbA7030090;
	Thu, 19 Dec 2024 03:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mTKstjkSA8BTortv7dXvF8pKroH7V24PZ/uN8TShCjw=; b=fPQ1Ce3Z4rKyvLvE
	2TAe3P5qjROyfPRgztTIuXG22vtukWLxTd6EPMY2kKBZwtOch3aD2vTtomWs6cL7
	34gyd3KW6l21/JKTAfvNQnKiJXRmLb0NW5epftlnkcNKmO54MtjiucAvzYNqQdHl
	lr8TVJJ2b0czahe6MD1SRJGCE9C03XZccBZDI8SElxl8uJw6sLHUJk7edKQ5zjgA
	9Nsf9jQFFvQB/3OuNvNrUS9YcKSuByZlIrPQbxUlM4cRJQwlX8rQZVbYOuDqjQni
	xpgKxVQUWia6yqTCwwTtcRaeJf1egieYintbClVomid3mls0dqAApqB2BqHdaOpm
	oEcJFw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43m3fk925j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 03:24:55 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BJ3OsO5005948
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 03:24:54 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Dec
 2024 19:24:23 -0800
Message-ID: <a6de450f-792d-429e-925e-850d11163907@quicinc.com>
Date: Thu, 19 Dec 2024 11:24:12 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] Coresight: Add Coresight TMC Control Unit driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark
	<james.clark@linaro.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Jinlong Mao <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20241210031545.3468561-1-quic_jiegan@quicinc.com>
 <20241210031545.3468561-5-quic_jiegan@quicinc.com>
 <d09097da-a07a-4dfa-9c0d-567b329b64ac@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <d09097da-a07a-4dfa-9c0d-567b329b64ac@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EN8MsNzd0MooXx_vM2kwTn_ShE_yQR1S
X-Proofpoint-ORIG-GUID: EN8MsNzd0MooXx_vM2kwTn_ShE_yQR1S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190023



On 12/15/2024 6:21 AM, Konrad Dybcio wrote:
> On 10.12.2024 4:15 AM, Jie Gan wrote:
>> The Coresight TMC Control Unit hosts miscellaneous configuration registers
>> which control various features related to TMC ETR sink.
>>
>> Based on the trace ID, which is programmed in the related CTCU ATID
>> register of a specific ETR, trace data with that trace ID gets into
>> the ETR buffer, while other trace data gets dropped.
>>
>> Enabling source device sets one bit of the ATID register based on
>> source device's trace ID.
>> Disabling source device resets the bit according to the source
>> device's trace ID.
>>
>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>> ---
> 
> [...]
> 
>> +static int __ctcu_set_etr_traceid(struct coresight_device *csdev,
>> +				  u8 traceid,
>> +				  int port_num,
>> +				  bool enable)
>> +{
>> +	uint32_t atid_offset;
>> +	struct ctcu_drvdata *drvdata;
>> +	unsigned long flags;
>> +	uint32_t reg_offset;
>> +	int bit;
>> +	uint32_t val;
>> +
>> +	if (!IS_VALID_CS_TRACE_ID(traceid) || port_num < 0)
>> +		return -EINVAL;
>> +
>> +	drvdata = dev_get_drvdata(csdev->dev.parent);
>> +	if (IS_ERR_OR_NULL(drvdata))
>> +		return -EINVAL;
>> +
>> +	atid_offset = drvdata->atid_offset[port_num];
>> +	if (atid_offset == 0)
>> +		return -EINVAL;
>> +
>> +	spin_lock_irqsave(&drvdata->spin_lock, flags);
> 
> guard(raw_spinlock_irqsave)(&drvdata->spin_lock);
> 
> and drop the unlocks
> 
Sure, will fix in next version.

>> +	CS_UNLOCK(drvdata->base);
>> +
>> +	reg_offset = CTCU_ATID_REG_OFFSET(traceid, atid_offset);
>> +	bit = CTCU_ATID_REG_BIT(traceid);
>> +	if (reg_offset - atid_offset >= CTCU_ATID_REG_SIZE ||
>> +	    bit >= CORESIGHT_TRACE_IDS_MAX) {
>> +		CS_LOCK(drvdata);
>> +		spin_unlock_irqrestore(&drvdata->spin_lock, flags);
>> +		return -EINVAL;
>> +	}
>> +
>> +	val = ctcu_readl(drvdata, reg_offset);
>> +	if (enable)
>> +		val = val | BIT(bit);
>> +	else
>> +		val = val & ~BIT(bit);
>> +	ctcu_writel(drvdata, val, reg_offset);
>> +
>> +	CS_LOCK(drvdata->base);
>> +	spin_unlock_irqrestore(&drvdata->spin_lock, flags);
>> +
>> +	return 0;
>> +}
>> +
>> +static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
>> +{
>> +	int port, i;
>> +
>> +	for (i = 0; i < sink->pdata->nr_outconns; ++i) {
>> +		if (sink->pdata->out_conns[i]->dest_dev) {
>> +			port = sink->pdata->out_conns[i]->dest_port;
>> +			return port;
> 
> Return sink->....
Sure, will fix in next version.

> 
>> +		}
>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +/*
>> + * ctcu_set_etr_traceid: Retrieve the ATID offset and trace ID.
>> + *
>> + * Returns 0 indicates success. None-zero result means failure.
>> + */
>> +static int ctcu_set_etr_traceid(struct coresight_device *csdev,
>> +				struct cs_sink_data *sink_data,
>> +				bool enable)
>> +{
>> +	int port_num;
>> +
>> +	if (!IS_VALID_CS_TRACE_ID(sink_data->traceid) ||
>> +	    (csdev == NULL) ||
> 
> I'm not sure this can be null by the time it reaches this function
Will check.

> 
>> +	    (sink_data->sink == NULL)) {
>> +		dev_dbg(&csdev->dev, "Invalid parameters\n");
> 
> dev_err?
It's better with dev_err, will fix.

> 
>> +		return -EINVAL;
>> +	}
>> +
>> +	port_num = ctcu_get_active_port(sink_data->sink, csdev);
>> +	if (port_num < 0)
>> +		return -EINVAL;
>> +
>> +	dev_dbg(&csdev->dev, "traceid is %d\n", sink_data->traceid);
>> +
>> +	return __ctcu_set_etr_traceid(csdev, sink_data->traceid, port_num, enable);
>> +}
>> +
>> +static int ctcu_enable(struct coresight_device *csdev, enum cs_mode mode,
>> +		       void *data)
>> +{
>> +	int ret = 0;
> 
> Unnecessary initialization (you instantly overwrite it), also below
> 
>> +	struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
>> +
>> +	ret = ctcu_set_etr_traceid(csdev, sink_data, true);
>> +	if (ret)
>> +		dev_dbg(&csdev->dev, "enable data filter failed\n");
> 
> Since the this function returns an int, maybe return ctcu_set_etr_traceid()
> and let the upper layer throw an error (also for some other functions in this
> file)
> 
Sure, will check.

>> +
>> +	return 0;
>> +}
>> +
>> +static int ctcu_disable(struct coresight_device *csdev, void *data)
>> +{> +	int ret = 0;
>> +	struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
>> +
>> +	ret = ctcu_set_etr_traceid(csdev, sink_data, false);
>> +	if (ret)
>> +		dev_dbg(&csdev->dev, "disable data filter failed\n");
>> +
>> +	return 0;
>> +}
> 
> [...]
> 
>>   enum coresight_dev_subtype_helper {
>>   	CORESIGHT_DEV_SUBTYPE_HELPER_CATU,
>> -	CORESIGHT_DEV_SUBTYPE_HELPER_ECT_CTI
>> +	CORESIGHT_DEV_SUBTYPE_HELPER_ECT_CTI,
>> +	CORESIGHT_DEV_SUBTYPE_HELPER_CTCU
> 
> Please add a comma here too, so that future additions will be
> less noisy
Sure, will add a comma after CORESIGHT_DEV_SUBTYPE_HELPER_CTCU.


Thanks,
Jie



