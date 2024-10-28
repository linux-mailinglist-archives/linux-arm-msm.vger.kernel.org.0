Return-Path: <linux-arm-msm+bounces-36095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EEA9B22A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 03:23:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07E591C21182
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 02:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE65612B17C;
	Mon, 28 Oct 2024 02:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hCwlZrya"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3420BA2E;
	Mon, 28 Oct 2024 02:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730082180; cv=none; b=Ci0Pm9fRvClqa6/Tyu1QSQB7GZlAXhUEo/8SWh7u6TefUkgJBHCM43IDOPtQ+6FJAxl2KxiRrQak+LFVMxYGL3KNGONaOoTOoKcovlAGQpZXmf5DZvXNK7smZd56UwQVKUixIOf3lL4bXj81fZEfIWiz6Dz1RbuMIzxKr9W+cRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730082180; c=relaxed/simple;
	bh=4Cb0Uz9yDAx0qUk8WJJgsrAPvs/AGZQr34EqcVw7jRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BmhOPIVDQSWu/gRbKV91AbhXGYrjsNaU+E1GEY1+Y2FZsNqLY6JIllCLyd5OXlsosukAwt/DdA5XmKaBkKZqWtoc2KNbG3yq5G1oStMBj8TRXwsyI2InrkqhGrkzz+Hu2nSJO4ExorksOhM13Jdowf9AAFfRmv7pjo1LdvsLKYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hCwlZrya; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RMrq8G009480;
	Mon, 28 Oct 2024 02:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W6dHfwb8MHs9adbndSIVkXvifgbrBFRDFCo/tHA7NSc=; b=hCwlZryanqs/GiZy
	ryaW2kAzqSVDDbgH+b+32PUf13XMqgG30jx/qptb4TwFtCWKp7FXYTsGX3kqHWh2
	7TrbWl8k7klP9mQaG4ljdfaoyFHkbAIpyrDo8lSjOxweebt68c7MnQUo1Gb+vDms
	b7v4fHvPF7gVs3neGCXbzxRrl3Pg0gS0zJauOB+rOWnv++CfIJxrd9rCjEY4r657
	IGUg5C+zjOukp+QGyHvCbNRF8mibRePk03zu2O4qiflefDqAKvyFk/ObrSMVIqro
	3NsQbU5nWnNZHXH7kTzuayvxYDUrtDgL/xz6/Zob3CEGrwHoOLxXsm2LcrBdTYGD
	R7teCw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gp4duk5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 02:22:54 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49S2Mrqv020809
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 02:22:53 GMT
Received: from [10.233.21.53] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 27 Oct
 2024 19:22:49 -0700
Message-ID: <b914945e-4de2-436e-afdf-3c3ce07f4073@quicinc.com>
Date: Mon, 28 Oct 2024 10:22:47 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] soc: qcom: llcc: Add LLCC configuration for the
 QCS8300 platform
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <quic_tengfan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>
References: <20241010-qcs8300_llcc-v2-0-d4123a241db2@quicinc.com>
 <20241010-qcs8300_llcc-v2-2-d4123a241db2@quicinc.com>
 <v73v4qniygxvqgdjcuydgpir2fgxmnltqaxcexoktzesnqfxod@55k43u2gmqqt>
Content-Language: en-US
From: Jingyi Wang <quic_jingyw@quicinc.com>
In-Reply-To: <v73v4qniygxvqgdjcuydgpir2fgxmnltqaxcexoktzesnqfxod@55k43u2gmqqt>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JoLX0gpvhuwoy2ClGUIsWANAOfZDDYXf
X-Proofpoint-GUID: JoLX0gpvhuwoy2ClGUIsWANAOfZDDYXf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=959 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280019



On 10/20/2024 12:29 AM, Dmitry Baryshkov wrote:
> On Thu, Oct 10, 2024 at 06:08:47PM +0800, Jingyi Wang wrote:
>> Add LLCC configuration for the QCS8300 platform. There is an errata on
>> LB_CNT information on QCS8300 platform, override the value to get the
>> right number of banks.
>>
>> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
>> ---
>>  drivers/soc/qcom/llcc-qcom.c | 72 ++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 72 insertions(+)
>>
>> @@ -3391,6 +3456,12 @@ static int qcom_llcc_probe(struct platform_device *pdev)
>>  	num_banks >>= LLCC_LB_CNT_SHIFT;
>>  	drv_data->num_banks = num_banks;
>>  
>> +	/* LB_CNT information is wrong on QCS8300, override the value */
>> +	if (of_device_is_compatible(dev->of_node, "qcom,qcs8300-llcc")) {
>> +		num_banks = 4;
>> +		drv_data->num_banks = 4;
>> +	}
> 
> Nit: I think it might be better to skip reading LLCC_COMMON_STATUS0
> register completely and just set num_banks instead. See [1]
> 
> [1] https://lore.kernel.org/linux-arm-msm/20241019-sar2130p-llcc-v1-2-4e09063d04f2@linaro.org/
> 

Just went through the series and the follow up sereies, I think it is a good idea to
add the property in the config. Thanks!


>> +
>>  	drv_data->regmaps = devm_kcalloc(dev, num_banks, sizeof(*drv_data->regmaps), GFP_KERNEL);
>>  	if (!drv_data->regmaps) {
>>  		ret = -ENOMEM;
>> @@ -3484,6 +3555,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
>>  }
>>  
>>  static const struct of_device_id qcom_llcc_of_match[] = {
>> +	{ .compatible = "qcom,qcs8300-llcc", .data = &qcs8300_cfgs},
>>  	{ .compatible = "qcom,qdu1000-llcc", .data = &qdu1000_cfgs},
>>  	{ .compatible = "qcom,sa8775p-llcc", .data = &sa8775p_cfgs },
>>  	{ .compatible = "qcom,sc7180-llcc", .data = &sc7180_cfgs },
>>
>> -- 
>> 2.25.1
>>
> 
Thanks，
Jingyi


