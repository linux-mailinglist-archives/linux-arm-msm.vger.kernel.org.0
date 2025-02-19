Return-Path: <linux-arm-msm+bounces-48490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C254A3BD06
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 12:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DB15170E11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 11:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA73C1DDA09;
	Wed, 19 Feb 2025 11:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VIZYRwxT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B0E1D89EF;
	Wed, 19 Feb 2025 11:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739964986; cv=none; b=cEd1nIg/7gvRA4Y/WMHE3BpW3kEb3VNz27FOLCzz31GFDm94jJX4WMg+0Z1PXZRKdm6S7YFmAdOEeo8kwLsy+R0/Pu518L/IbHRZBVXJSA4SZN9q7o3efxzexknfstA513J/YH+mt6usuqVuCKan1pr3MZDEoF3D3qxHtBaizv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739964986; c=relaxed/simple;
	bh=Hrhm8ZOZuubzIILX41WZlVH62W+mf1qv/FdAr8wjFzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=to40CSBzB+unTcw1Q+IcmVZCxpjDcLkM3IGXgFChyyoQQAmBtU//iFiONnTRntNOLRN2SHOt3w3WO/pvUKbka2qAXzTEYFlWWAFbh70Cm/A0mSUXXu3sAtedaub0NPTboN+wG7dQlrV+MDBfzAA/fzYyiO47Sz4H28sdZklsCSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VIZYRwxT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J8O9hJ025856;
	Wed, 19 Feb 2025 11:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kpHWra1j8U0cduwkB1QA5CNFxHWMO3hb7yfQ2ym/77Y=; b=VIZYRwxT5hed08/e
	axXMqiWeWOdO0dDGQz8rXYSmBOJJToLNG6LI2/uoWUTzkoNTKgqNgw8lqPpniyG8
	/3+baTutN9C/w5co1kJvSeHi+N9Z9fnZ6LSu/fn2dbGDherf3RGjQYsxxfA8Q2SZ
	pml5IzK9qNbDNUSh6nUfezxFPV8EpXtqGRA+Cf8+9tE8hrw6mW68+suHDX/5VkNc
	gSHIk9p3IgYM6CoeE6tY3LH6OOdncNhWHawjGRQAXotQekVfDBMUsmlBP4nHJsoB
	SInczN4EiEHAMd7l8aIIDX8g0VYpHWcFB0/OuMmVQ/oTmOYZoH8TZ3+2/JNEd3UK
	KkMuBg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy0jcv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 11:36:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51JBaK6q015289
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 11:36:20 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Feb
 2025 03:36:14 -0800
Message-ID: <bb4cd14e-a9ea-4c13-9774-cca169dcb8d1@quicinc.com>
Date: Wed, 19 Feb 2025 17:06:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] clk: qcom: common: Attach clock power domains
 conditionally
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Taniya
 Das" <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com>
 <20250218-videocc-pll-multi-pd-voting-v1-3-cfe6289ea29b@quicinc.com>
 <2c5rbbpe5muw53oemyq6vhsmhzpzcpn7on4ujl5v7i7s3fdlob@eh37gy5dpfnp>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <2c5rbbpe5muw53oemyq6vhsmhzpzcpn7on4ujl5v7i7s3fdlob@eh37gy5dpfnp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wMMnjRm96n-OsUxyvWDGUckbEY77SpnE
X-Proofpoint-ORIG-GUID: wMMnjRm96n-OsUxyvWDGUckbEY77SpnE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_05,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=620 spamscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190093



On 2/18/2025 10:48 PM, Dmitry Baryshkov wrote:
> On Tue, Feb 18, 2025 at 07:56:48PM +0530, Jagadeesh Kona wrote:
>> Attach clock power domains in qcom_cc_really_probe() only
>> if the clock controller has not already attached to them.
> 
> Squash this to the previous patch and call the new function. No need to
> duplicate the code.
> 

I tried calling the new function here instead of duplicating code, but that
is leading to below warning since the desc passed to qcom_cc_really_probe()
has a const qualifier and hence we cannot update desc->pd_list inside
qcom_cc_really_probe().

drivers/clk/qcom/common.c:305:33:   WARNING : passing argument 2 of ‘qcom_cc_attach_pds’ discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]

Thanks,
Jagadeesh

>>
>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>> ---
>>  drivers/clk/qcom/common.c | 9 ++++++---
>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
>> index ec27f70b24bdec24edd2f6b3df0d766fc1cdcbf0..eb7e2a56d1d135f839fd9bd470ba6231ce775a8c 100644
>> --- a/drivers/clk/qcom/common.c
>> +++ b/drivers/clk/qcom/common.c
>> @@ -300,9 +300,12 @@ int qcom_cc_really_probe(struct device *dev,
>>  	if (!cc)
>>  		return -ENOMEM;
>>  
>> -	ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);
>> -	if (ret < 0 && ret != -EEXIST)
>> -		return ret;
>> +	cc->pd_list = desc->pd_list;
>> +	if (!cc->pd_list) {
>> +		ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);
>> +		if (ret < 0 && ret != -EEXIST)
>> +			return ret;
>> +	}
>>  
>>  	reset = &cc->reset;
>>  	reset->rcdev.of_node = dev->of_node;
>>
>> -- 
>> 2.34.1
>>
> 

