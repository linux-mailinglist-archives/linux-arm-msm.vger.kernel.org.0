Return-Path: <linux-arm-msm+bounces-31056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 196C396E967
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 07:43:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4562B1C22B00
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 05:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96AF12C7FD;
	Fri,  6 Sep 2024 05:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b1tUGkeO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821443EA71;
	Fri,  6 Sep 2024 05:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725601425; cv=none; b=oHeihMxTTAYaAQCGfqxZzvPtylPagP2nTzYNIce4a0jgRFOdaZi6pAlxzVqwaXhAmZzgxv4F3ncRtBam4IH1nGdvlx02aCaf18V5LMFz0Mboeqn7MXGdohGEQbBxyJEmOf6WlWqc5GJQHDksCmjgsPldWuGRg6a82Xxj4/fZN9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725601425; c=relaxed/simple;
	bh=QALysbEfzf6RkIso6C9fLiPPbsx+FjMEmnplVNyCwVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JnByqDYWURUIKCd/sFBYo55akqqF8g7SMx/C8V+gdNEx4zkIedYZneGvh6R4TGmP2e1Fe8xLTPZRl1webWGduM2j9Lt9Qn4bXlZQD4UcvEWz654Rm1LjnKI9RsvVQe0s507GVtklHAAq+9JWD08sPfFO2SCBXzLKOq1xYUuHwfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b1tUGkeO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485JlVVO003624;
	Fri, 6 Sep 2024 05:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	muMw3xEZUEqQ2KRiHg8E1HlqwPDT1EzEEMwXJzk4ryY=; b=b1tUGkeOHgCpY9vk
	WIV8ji6zVr6Fl2H5b7VPdBRWps1Bz/MpvG25iDUGfQhV/jJvT0ycwOUXNG1FH0pG
	dUYb/+ez9xdsBKMR5BPsej0ZAKPQQF+mwFyqe1Oa1SVdt8j0rJBw2ecvZI582GEW
	8/M0PA7pSheOay+YW0uhDzy8DSPyOUKFS8SRAPIWmiELip9BR8MdYbIJDACQM2Dv
	d4xrMTadeW7e7mFQpSfJbeXA9gnzdcE/0CJ4U87QVwlXMZpO/DYGAAKsOqzyNNY8
	D1r9rNtOfUrY2R3Ort43dMKkUxArxcbpVaRwd/fXInnquNFjJEl3jdLW+AWKE88W
	vwnxyQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhwu16n3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 05:43:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4865hdZP024519
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Sep 2024 05:43:39 GMT
Received: from [10.233.21.53] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Sep 2024
 22:43:36 -0700
Message-ID: <19cf953d-09b2-4c5c-9201-5f1fd84118e7@quicinc.com>
Date: Fri, 6 Sep 2024 13:43:34 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] soc: qcom: llcc: add errata to get bank num
To: Konrad Dybcio <konradybcio@gmail.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley
	<conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240903-qcs8300_llcc_driver-v1-0-228659bdf067@quicinc.com>
 <20240903-qcs8300_llcc_driver-v1-3-228659bdf067@quicinc.com>
 <bb1a6cd0-42aa-4452-9203-460ba768e6a0@gmail.com>
Content-Language: en-US
From: Jingyi Wang <quic_jingyw@quicinc.com>
In-Reply-To: <bb1a6cd0-42aa-4452-9203-460ba768e6a0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2kB2qB_0xhV5-huAN3EPfcLbCRKztUVd
X-Proofpoint-GUID: 2kB2qB_0xhV5-huAN3EPfcLbCRKztUVd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_17,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 clxscore=1011 impostorscore=0 spamscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409060040

Hi Konrad,

On 9/5/2024 9:29 PM, Konrad Dybcio wrote:
> On 3.09.2024 8:21 AM, Jingyi Wang wrote:
>> Use "num-banks" property to indicate the actual num of banks for
>> errata.
>>
>> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
>> ---
>>  drivers/soc/qcom/llcc-qcom.c | 15 ++++++++++-----
>>  1 file changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
>> index 8fa4ffd3a9b5..3fb45e625d82 100644
>> --- a/drivers/soc/qcom/llcc-qcom.c
>> +++ b/drivers/soc/qcom/llcc-qcom.c
>> @@ -1275,12 +1275,17 @@ static int qcom_llcc_probe(struct platform_device *pdev)
>>  		goto err;
>>  	cfg = &cfgs->llcc_config[cfg_index];
>>  
>> -	ret = regmap_read(regmap, cfg->reg_offset[LLCC_COMMON_STATUS0], &num_banks);
>> -	if (ret)
>> -		goto err;
>> +	if (unlikely(!of_property_read_u32(dev->of_node, "num-banks", &num_banks))) {
>> +		/* errata: get num of llcc banks. */
>> +	} else {
>> +		ret = regmap_read(regmap, cfg->reg_offset[LLCC_COMMON_STATUS0], &num_banks);
>> +		if (ret)
>> +			goto err;
>> +
>> +		num_banks &= LLCC_LB_CNT_MASK;
>> +		num_banks >>= LLCC_LB_CNT_SHIFT;
>> +	}
> 
> Is num-banks going to be populated by the bootloader, or hardcoded?
> 
> If the latter, we may just do so in the driver, hoping no more SoCs
> have this erratum..
> 
> Konrad

We would like modify that in driver instead of bootloader, so you suggestion
is hardcode it in struct like "qcom_llcc_config" instead of adding property
in devicetree? Please correct my if there is misunderstanding.

Thanks,
Jingyi



