Return-Path: <linux-arm-msm+bounces-13411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F952872F1C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 07:56:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 524761C22070
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 06:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD3E75C5E2;
	Wed,  6 Mar 2024 06:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jXtO6eJM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397855BAF4;
	Wed,  6 Mar 2024 06:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709708168; cv=none; b=a5ZwcfT6mj7j3pATjt4MbPSkPA5RLn1a9JAFAih99ZTwogIyzsNbxRjUo0jGmwEnLe3RYj75kzTYfQxhvEXZHWb+tlu7k/vzcRyzk6qiJnQ8SdshXhTbB4cBfAdNFYMJcXqkEvfFc/IYJxDrWf0zSiUcVTYyz40wwGeAdEpwA7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709708168; c=relaxed/simple;
	bh=QjcOrepbQHC8fIYf7Px8Un6fYcP3Bq2zoSJm62LQO9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JY+oeqxIsgYY8BI1U268EkWXGCdEZHoXpwsVU3gQIbfrrFoZHeZlNhrY80LqK7kSRrLsExrBs0ML+Z0COBGI8pbJmb3aGHi5RI4Uwp9XLl1WGQdsv2XkjDohU3kgHjlVKRkuEwnUZwHKhJUHraVURG1DnsXAFz3f+47pQQvFfrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jXtO6eJM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4266a4cu030167;
	Wed, 6 Mar 2024 06:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=C4y2rlJJYtglNLfRP1S9jhRCiJcMrsC4EZswpwMcb4U=; b=jX
	tO6eJM3VbCLn6RjJC/648fI+/TJl1EAzLIAWUoiGMMpCdp80uNC5X67c+cs7sY5/
	UpwRjHAeNuwQIlyWyXkdFJz52SNwAtlC/kEmJc8v7uhyHfVJ2oos72x4HHVAdR/B
	UvMF/OdaJDA8obf4hwpGCTvyXqYqxxkpklDipjNuBANJJll0k7aMiDa9iyfftI/q
	ugXInwgAz1JHypB/2wsS191kpJzFcFcJH5/Gs/vJQjUpK7LHmZR7M9lN7VloWhz7
	UlYlsJ3abGQTBx7aK6Obp6Oa/MdPhAZpXu6IR1TiyUc+8bvzDHNnCISEMeJIRIZA
	k+50WQ/IsT20Y+/8MwFw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wp00x2jyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 06:56:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4266u0VG015981
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Mar 2024 06:56:00 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 5 Mar
 2024 22:55:57 -0800
Message-ID: <9aa21da0-ad93-41f7-8ac1-b496a049a32c@quicinc.com>
Date: Wed, 6 Mar 2024 12:25:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: qcom: lpassaudiocc-sc7280: Add support to skip
 PLL configuration
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad
 Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20240208062836.19767-1-quic_tdas@quicinc.com>
 <20240208062836.19767-3-quic_tdas@quicinc.com>
 <CAA8EJpq2MpZitzspd9RksTY7WWKAaLwvb30x8ArBfed5Ee8buA@mail.gmail.com>
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <CAA8EJpq2MpZitzspd9RksTY7WWKAaLwvb30x8ArBfed5Ee8buA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: twarsJlJD0j01NBMa86r2OasQyQSP7hP
X-Proofpoint-GUID: twarsJlJD0j01NBMa86r2OasQyQSP7hP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_04,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403060053

Thanks for your review Dmitry.

On 2/8/2024 12:32 PM, Dmitry Baryshkov wrote:
> On Thu, 8 Feb 2024 at 08:29, Taniya Das <quic_tdas@quicinc.com> wrote:
>>
>> The PLL configuration needs to be skipped when remoteproc brings the
>> LPASS out of reset.
> 
> Why?
> 

On QCM6490 boards, the HLOS is not given access to program the PLL of 
Low Power Audio Subsystem. Also on these boards the per-requisite of a 
GDSC is not available. Thus we need to skip the PLL programming.

I will update the commit text in my next series.

>>
>> Also update the lpassaudio_cc_reset regmap name and max register to handle
>> the regmap conflict warning between lpassaudio_cc_reset and lpassaudio_cc.
> 
> Separate patch, please.
> 

Yes, I will take care.

>>
>> Fixes: a9dd26639d05 ("clk: qcom: lpass: Add support for LPASS clock controller for SC7280")
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>   drivers/clk/qcom/lpassaudiocc-sc7280.c | 14 ++++++++++----
>>   1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
>> index c43d0b1af7f7..2619a8ced9d5 100644
>> --- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
>> +++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
>> @@ -1,6 +1,7 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>   /*
>>    * Copyright (c) 2021, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>
>>   #include <linux/clk-provider.h>
>> @@ -766,11 +767,13 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
>>                  goto exit;
>>          }
>>
>> -       clk_zonda_pll_configure(&lpass_audio_cc_pll, regmap, &lpass_audio_cc_pll_config);
>> +       if (!of_property_read_bool(pdev->dev.of_node, "qcom,adsp-skip-pll")) {
>> +               clk_zonda_pll_configure(&lpass_audio_cc_pll, regmap, &lpass_audio_cc_pll_config);
>>
>> -       /* PLL settings */
>> -       regmap_write(regmap, 0x4, 0x3b);
>> -       regmap_write(regmap, 0x8, 0xff05);
>> +               /* PLL settings */
>> +               regmap_write(regmap, 0x4, 0x3b);
>> +               regmap_write(regmap, 0x8, 0xff05);
>> +       }
>>
>>          ret = qcom_cc_really_probe(pdev, &lpass_audio_cc_sc7280_desc, regmap);
>>          if (ret) {
>> @@ -778,6 +781,9 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
>>                  goto exit;
>>          }
>>
>> +       lpass_audio_cc_sc7280_regmap_config.name = "lpassaudio_cc_reset";
>> +       lpass_audio_cc_sc7280_regmap_config.max_register = 0xc8;
>> +
>>          ret = qcom_cc_probe_by_index(pdev, 1, &lpass_audio_cc_reset_sc7280_desc);
>>          if (ret) {
>>                  dev_err(&pdev->dev, "Failed to register LPASS AUDIO CC Resets\n");
>> --
>> 2.17.1
>>
>>
> 
> 

-- 
Thanks & Regards,
Taniya Das.

