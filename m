Return-Path: <linux-arm-msm+bounces-20993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6A78D3D36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 19:10:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D27B41C20D02
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 17:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317051802B3;
	Wed, 29 May 2024 17:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dUJZ52DZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4511B810;
	Wed, 29 May 2024 17:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717002613; cv=none; b=WM5G1vT1LdRL7PnkZkVjI4D6Ckejnu4w4YGDmuE/O6b/u78cft/s3ppNqxhYtC5DS0lXSGh0U3Ul3nUEpd+Ib8Imm9hEETC+wbiJ7XQxlsaxl2fBfrH8MCUWDBmJgwfSSdRTz/O0IbSwxQOmMEw6gO3Dcm15OEoKoJMqk0b9jYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717002613; c=relaxed/simple;
	bh=kPElXjTyALelD2PjbmCrxdvQKXiKQUMyw8XpUw8IG0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZTAQKC9+Usz7IJGTQV8f+84Lta3r4AIYbUprA0xpklN0hNzgE5s6+ML/QtsOe+hyiZFmA0q1duZEXcKNMp4pUoALqzOKnnxWSy5R1H32010CvDJNKTdpuAVx5ske6TN0G6vEECYCvZ+j5qMF/yr7H7Xd1yfanfrDyzDRCf2pBwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dUJZ52DZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T9quR7012513;
	Wed, 29 May 2024 17:10:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	klUASvIa6B0YT5WNKDJ/OP5jG1HK4jt/YQPai7lt6FQ=; b=dUJZ52DZfdw4ua8G
	pKFvu09aJwbSrtUxY5ptdTalfb/evYeREUDOfhbOOytMurQaLADNVKV029oKRkZr
	MvgfoRngeOJXeavrDR2RLdBTCg+cFyanuhrr0Q0Jvx0nWNAsOzzQ/YLkNwwML4Bn
	HD9gUPdLVNgkQhdF9d7MlyGljdxRQsQ/qVJD040dbbfwtxTjEgbe9LmdMmvE5DEK
	MJ3l7WEpSAtK0opQAeUrBs++KBnk0T5enkyQFei/zetbJ7W5ENxfj13dD4wy/7du
	jZwbvC2GPk7JP1gKk741Azvxs3kruz2c6tYDd6XA3FB5IjKJsg01iIVeCX9Fpwzl
	hvWjNA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0qhkaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 17:10:06 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44THA5gG023095
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 17:10:05 GMT
Received: from [10.110.40.14] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 10:10:01 -0700
Message-ID: <e68a08a5-3b9e-4522-8f7c-1e3def5e0791@quicinc.com>
Date: Wed, 29 May 2024 10:09:56 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] soc: qcom: llcc: Add regmap for Broadcast_AND
 region
To: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Bjorn Andersson <quic_bjorande@quicinc.com>
References: <cover.1716228054.git.quic_uchalich@quicinc.com>
 <2c7654492ee436b41acddf2edc65d6722c3ad6aa.1716228054.git.quic_uchalich@quicinc.com>
 <xykcsrfq7mpu7fkjvvhfcew2x2522xmq6poua5utcn2uu5h5ub@j45xpqkedgwa>
Content-Language: en-US
From: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
In-Reply-To: <xykcsrfq7mpu7fkjvvhfcew2x2522xmq6poua5utcn2uu5h5ub@j45xpqkedgwa>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Dg809O33S7eyAzir7H8zn34w6jRNIDfI
X-Proofpoint-ORIG-GUID: Dg809O33S7eyAzir7H8zn34w6jRNIDfI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_13,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290119

On 5/26/2024 8:11 PM, Bjorn Andersson wrote:
> On Mon, May 20, 2024 at 02:00:14PM GMT, Unnathi Chalicheemala wrote:
>> Define new regmap structure for Broadcast_AND region and initialize
>> this regmap when HW block version is greater than 4.1, otherwise
>> initialize as a NULL pointer for backwards compatibility.
>>
>> Switch from broadcast_OR to broadcast_AND region (when defined in DT)
>> for checking status bit 1 as Broadcast_OR region checks only for bit 0.
>>
> 
> This is a good technical description of the change you're making. But
> it's been long enough since we discussed this that I've forgotten which
> problem it solves, and the commit message doesn't tell me.
> 
> Please add a paragraph on the top describing the actual problem this
> solves?
>
Yes understood, I'll append this to the commit message:

To support CSR programming, a broadcast interface is used to program all
channels in a single command. Until SM8450 there was only one broadcast
region (Broadcast_OR) used to broadcast write and check for status bit
0.
From SM8450 onwards another broadcast region (Broadcast_AND) has been
added which checks for status bit 1. This hasn't been updated and
Broadcast_OR region was wrongly being used to check for status bit 1 all
along.

Thank you Bjorn.
> Regards,
> Bjorn
> 
>> Signed-off-by: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
>> Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>
>> ---
>>  drivers/soc/qcom/llcc-qcom.c       | 16 +++++++++++++++-
>>  include/linux/soc/qcom/llcc-qcom.h |  4 +++-
>>  2 files changed, 18 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
>> index cbef0dea1d5d..5eac6aa567e7 100644
>> --- a/drivers/soc/qcom/llcc-qcom.c
>> +++ b/drivers/soc/qcom/llcc-qcom.c
>> @@ -821,6 +821,7 @@ EXPORT_SYMBOL_GPL(llcc_slice_putd);
>>  static int llcc_update_act_ctrl(u32 sid,
>>  				u32 act_ctrl_reg_val, u32 status)
>>  {
>> +	struct regmap *regmap;
>>  	u32 act_ctrl_reg;
>>  	u32 act_clear_reg;
>>  	u32 status_reg;
>> @@ -849,7 +850,8 @@ static int llcc_update_act_ctrl(u32 sid,
>>  		return ret;
>>  
>>  	if (drv_data->version >= LLCC_VERSION_4_1_0_0) {
>> -		ret = regmap_read_poll_timeout(drv_data->bcast_regmap, status_reg,
>> +		regmap = drv_data->bcast_and_regmap ?: drv_data->bcast_regmap;
>> +		ret = regmap_read_poll_timeout(regmap, status_reg,
>>  				      slice_status, (slice_status & ACT_COMPLETE),
>>  				      0, LLCC_STATUS_READ_DELAY);
>>  		if (ret)
>> @@ -1284,6 +1286,18 @@ static int qcom_llcc_probe(struct platform_device *pdev)
>>  
>>  	drv_data->version = version;
>>  
>> +	/* Applicable only when drv_data->version >= 4.1 */
>> +	if (drv_data->version >= LLCC_VERSION_4_1_0_0) {
>> +		drv_data->bcast_and_regmap = qcom_llcc_init_mmio(pdev, i + 1, "llcc_broadcast_and_base");
>> +		if (IS_ERR(drv_data->bcast_and_regmap)) {
>> +			ret = PTR_ERR(drv_data->bcast_and_regmap);
>> +			if (ret == -EINVAL)
>> +				drv_data->bcast_and_regmap = NULL;
>> +			else
>> +				goto err;
>> +		}
>> +	}
>> +
>>  	llcc_cfg = cfg->sct_data;
>>  	sz = cfg->size;
>>  
>> diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
>> index 1a886666bbb6..9e9f528b1370 100644
>> --- a/include/linux/soc/qcom/llcc-qcom.h
>> +++ b/include/linux/soc/qcom/llcc-qcom.h
>> @@ -115,7 +115,8 @@ struct llcc_edac_reg_offset {
>>  /**
>>   * struct llcc_drv_data - Data associated with the llcc driver
>>   * @regmaps: regmaps associated with the llcc device
>> - * @bcast_regmap: regmap associated with llcc broadcast offset
>> + * @bcast_regmap: regmap associated with llcc broadcast OR offset
>> + * @bcast_and_regmap: regmap associated with llcc broadcast AND offset
>>   * @cfg: pointer to the data structure for slice configuration
>>   * @edac_reg_offset: Offset of the LLCC EDAC registers
>>   * @lock: mutex associated with each slice
>> @@ -129,6 +130,7 @@ struct llcc_edac_reg_offset {
>>  struct llcc_drv_data {
>>  	struct regmap **regmaps;
>>  	struct regmap *bcast_regmap;
>> +	struct regmap *bcast_and_regmap;
>>  	const struct llcc_slice_config *cfg;
>>  	const struct llcc_edac_reg_offset *edac_reg_offset;
>>  	struct mutex lock;
>> -- 
>> 2.34.1
>>

