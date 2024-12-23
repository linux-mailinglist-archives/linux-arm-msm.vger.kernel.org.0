Return-Path: <linux-arm-msm+bounces-43104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 726059FABE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 10:20:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF239188460B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 09:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 324571854;
	Mon, 23 Dec 2024 09:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CqFl8/9R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B600D259489;
	Mon, 23 Dec 2024 09:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734945638; cv=none; b=AFRJCiKfhpjqQbGTe4fn5POaLktWqcP96wHOQxTGPt+dWiZUlnrWutHxuyGFJ4NeOwgWtZmQVG9qD26xGfVdIe2Chx4zD6N/tGti8cUxU1zPPLQPQHCUkLWzzhWr6sjZNwMuJAPa9OgTZ4inZLVWl3wDhRuG8Irhqu2xPRWb4jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734945638; c=relaxed/simple;
	bh=uPxPRtdLOw8qDEt8Nqgx7i4So0tcnNxKIGfqs+plVPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YkAJoRoPgtPBN9PFlmgc4IAcncAtAacrDKl2ZkwcNcSe0EN33l+noUXHikcunUHUI498ueu6cjbaNeIUSmRPX1PmLBh1PzF7Ntl6esQOqTosEwuiMk1CmTOdfjVab6bIBu8NwEZyEojvJh8zhQcp9inbOhnlg7ElFqnUovEgEsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CqFl8/9R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN5aieI030399;
	Mon, 23 Dec 2024 09:20:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0gqwyxsctC7QAQxFi1J9q+NTj/qlJnJZo2PuZLisOIs=; b=CqFl8/9RvW5HiUIQ
	Q3hzlQGO0YvNJfIHa0NJbBvWSiQjWkDwbBN0lzH7F4K4aYepTq6iBX14uTOqyNnt
	iESryalLt1u0cifSgWBqLanj11VLR7l6mMwjqsI7SWRxbQXvxBT8w7dpzqqOu2k4
	nu+gRYH/XSVNAAG7G3ZxPml+trszZQ08BxQqqDQk2/u5ER189p7/Q+axF7bAAd6S
	DMyAWpxNpAmPcPUncFgf0LV6um61yNRko2IFwxv7eRPaLyxCDOVzsqjtwO9WBoqG
	jw8TV036Ow6KmaJcxs1SsURqEweHO+tHkfwgg9pnfkt0aYnzj84UtA9cbkrNkh/m
	A0luCA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q1v98vnn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 09:20:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BN9KX9p024658
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 09:20:33 GMT
Received: from [10.217.238.57] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Dec
 2024 01:20:31 -0800
Message-ID: <24b2ae5b-aaa5-4c50-b919-5296db6f2217@quicinc.com>
Date: Mon, 23 Dec 2024 14:50:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] soc: qcom: ice: Prevent UFS probe deferral on ICE
 probe failure
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241203024005.391654-1-quic_yrangana@quicinc.com>
 <5255398f-cc9d-4f85-8433-d6a4183dc449@oss.qualcomm.com>
Content-Language: en-US
From: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
In-Reply-To: <5255398f-cc9d-4f85-8433-d6a4183dc449@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: IlVPdJYU90cNmK4AAgvOYGyXPiLuTD99
X-Proofpoint-GUID: IlVPdJYU90cNmK4AAgvOYGyXPiLuTD99
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230083

On 12/5/2024 10:54 PM, Konrad Dybcio wrote:
> On 3.12.2024 3:40 AM, Yuvaraj Ranganathan wrote:
>> When the ICE key programming interface is unavailable, the ice create
>> function fails, causing the probe to set NULL as the driver data. As a 
>> result, when the UFS driver reads the ICE driver data and encounters a 
>> NULL, leading to the deferral of the UFS probe and preventing the device
>> from booting to the shell.
>>
>> To address this issue, modify the behavior to return an "operation not
>> supported" error when the ICE key programming interface is unavailable.
>> Additionally, mark this error in a global variable. When the UFS driver
>> attempts to read the ICE driver data, it will check for this error and
>> return it, rather than deferring the probe.
>>
>> Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
>> ---
>>  drivers/soc/qcom/ice.c | 11 +++++++++--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
>> index 393d2d1d275f..160916cb8fb0 100644
>> --- a/drivers/soc/qcom/ice.c
>> +++ b/drivers/soc/qcom/ice.c
>> @@ -41,6 +41,8 @@
>>  #define qcom_ice_readl(engine, reg)	\
>>  	readl((engine)->base + (reg))
>>  
>> +static bool qcom_ice_create_error;
> 
> So you could drop this..
> 
>> +
>>  struct qcom_ice {
>>  	struct device *dev;
>>  	void __iomem *base;
>> @@ -215,7 +217,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>>  
>>  	if (!qcom_scm_ice_available()) {
>>  		dev_warn(dev, "ICE SCM interface not found\n");
>> -		return NULL;
>> +		return ERR_PTR(-EOPNOTSUPP);
>>  	}
>>  
>>  	engine = devm_kzalloc(dev, sizeof(*engine), GFP_KERNEL);
>> @@ -303,6 +305,9 @@ struct qcom_ice *of_qcom_ice_get(struct device *dev)
>>  		return ERR_PTR(-EPROBE_DEFER);
>>  	}
>>  
>> +	if (qcom_ice_create_error)
>> +		return ERR_PTR(-EOPNOTSUPP);
>> +
>>  	ice = platform_get_drvdata(pdev);
>>  	if (!ice) {
> 
> ..and check for || IS_ERR(ice) here
> 
> if I'm reading things right
> 
> Konrad

In case of failure, platform_set_drvdata is not invoked and it is
causing ice to become NULL on platform_get_drvdata.
Adding IS_ERR(ice) can't help unless we set the platform_set_drvdata
even on failure.

