Return-Path: <linux-arm-msm+bounces-30872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A241C96D68B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 12:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59D811F26456
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 10:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7F601991BD;
	Thu,  5 Sep 2024 10:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oX3Tlm8Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E3D194A61;
	Thu,  5 Sep 2024 10:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725533918; cv=none; b=tFCSJPc+6eLcLQxOip++8fF0AS2fIvCpwIFWHpUhVd6y6wFrJJiEqYCfwqub43hebBf3dDRztS2XQoGxWvJ1dIXFC09xgNhwTK58f3yqWqjU0uEzwiCKa3k+ErAIGSAvOZaPMEetSYyC5vmREVK+hBIgYqijU1Nx2SQXardyoIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725533918; c=relaxed/simple;
	bh=ZwkspLfNOQ9TNhE5tdhKYQwHyJ5COhMJKvOKhSibXCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=X/EB6CgMZOCtXlZctguP3hg5gNkNky42WM/xzbl6Q+7p5OHKYqz8MeWgDdERrzdrJwBA1opXKdw2IJYeWDNEGPQVIzqz/MxJ/ajUUv01Sf38xQKOw3VXD+kROJ8kYPIuEd+tiOhiKyhOF0R3znJuRD6/K5cMopbEz7xacr3BiYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oX3Tlm8Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485977YL001846;
	Thu, 5 Sep 2024 10:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nt7JRRklue1AEPwYRkDlLOKvuMaz+mhwVlqP+uMnYrI=; b=oX3Tlm8YiDGExhE1
	0WOdEpV2Ialo80mAhOYo/dBalbeYbN1U4F8fuonfor9ro6AxsRgfmxLo8+RwTFxf
	vJLcKQGNHpdvU0LYrIBetbOFNx/lx54s6N2NuqC1O0xBklMhu3dzbdMRzgKwIIaz
	cs5hN4HhN+ZUt5PiA1QDdFh6NvnONzIAKjWnVHmwIkbO/GSWJ61KN1C+nmqiUxiL
	L5nyfi9yEptjRkVZq9y2bVIHee/0l/InPE6ax9EU+G+zlpKA7q1TsZDI9FXSSokp
	dvGrS48176kaqLeoYn8blrIg3H6+BK988TYjwOXjVEn3obZelhg/PYZxdN9H3ecZ
	PMfw2A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bt675ss6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 10:58:29 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 485AwSfY005391
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 10:58:28 GMT
Received: from [10.218.23.250] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Sep 2024
 03:58:23 -0700
Message-ID: <29874390-2c8b-400a-9034-cccb929346a2@quicinc.com>
Date: Thu, 5 Sep 2024 16:28:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: clk-alpha-pll: Replace divide operator with
 comparison
To: Jon Hunter <jonathanh@nvidia.com>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        "Imran
 Shaik" <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>
References: <20240813094035.974317-1-quic_skakitap@quicinc.com>
 <4d314b61-7483-4ceb-ac72-10dbd7e4522a@linaro.org>
 <7733a4ca-330b-4127-af12-33f376fbbc47@nvidia.com>
 <a995743c-f208-4afc-95da-449fdc7fab2b@quicinc.com>
 <5b24f86a-b2cc-4c36-aa2f-2a01cbae12fa@nvidia.com>
Content-Language: en-US
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
In-Reply-To: <5b24f86a-b2cc-4c36-aa2f-2a01cbae12fa@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6a8f7bTIPdYKGfMjfkYGPFAIFdrO2CIe
X-Proofpoint-GUID: 6a8f7bTIPdYKGfMjfkYGPFAIFdrO2CIe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_06,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409050080

Hi Jon,


>>>>
>>>> remainder = do_div(rate, prate);
>>>>
>>>>> -    if ((remainder * 2) / prate)
>>>>> +    if ((remainder * 2) >= prate)
>>>>>           *l = *l + 1;
>>>>
>>>> *l = rate + (u32)(remainder * 2 >= prate);
>>>
>>>
>>> The above change does fix this build error for me.
>>>
>>> Satya, did you intend this to be a fix? Can we get this into -next?
>>>
>>
>> Yes, I have posted a v2 for this last week, but there are few open 
>> comments on that, I'll address them and post V3 including the build 
>> error you reported in commit-text.
>>
>>
>> [v2] 
>> https://lore.kernel.org/linux-clk/20240814102005.33493-1-quic_skakitap@quicinc.com/
>
>
> Have you push a V3 yet?


Not yet Jon, I had a query regarding Bjorn's comment where he mentioned 
the patch wouldn't compile on arm32 target, I am trying to check that 
with him. Once I get the details I'll make the changes accordingly and 
post V3.


Thanks,

Satya priya


