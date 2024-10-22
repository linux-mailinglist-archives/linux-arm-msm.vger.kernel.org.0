Return-Path: <linux-arm-msm+bounces-35339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 635109A99EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 08:34:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BED41C214B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 06:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD0FA142900;
	Tue, 22 Oct 2024 06:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oGG0J35W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A7D145B1D;
	Tue, 22 Oct 2024 06:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729578863; cv=none; b=e+r7/ab8fz6hr01ykJqiXC05upGTf4FBXYV3ft9/Ups0OXExNFHKMSyAMGA97dL/siHwYy2FMzEGAO6OwDok9nmxNxFG/+hg0ZZ/x31Yksz8NorvVQXuzYHGTbJuyUN8EKGNDM2G1+03B8dkXWYiWRdsGVmc8RZOfSURW4nUQD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729578863; c=relaxed/simple;
	bh=EblcvRA9qNW60RSbDiXV1fyDYUFjayvBzrexf5KCGk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gHiXWb4Y5Bl5NN6RDaGu/NaJNVhCS2MjuQ/G+t6iswbC17fImLbx4zAMjVNDjviuKe1IgxA31NLlpPFpuS1mW3GDNQ5aEChAHIE0N8zsWEWOqIFdZ59ju5eMwrHiCb780DgOw40y3h/J2KXOSL5yv7t4YxJYtt78Y8pxQ9AoKyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oGG0J35W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LIaaES017132;
	Tue, 22 Oct 2024 06:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4MawGpLa/NNaYxXFZcETJ52viwjLZbX91KKAa29KKAU=; b=oGG0J35W6LgbfjBE
	qF6krQUF/QFCHFeXpw6Td3MsFiC4Nuk2439bGQC7n7e6ZWFyfK2Crhj9QvnFAAke
	mm15F5WDups82lWbIUCafGYksTc34RkEP7lpJzyaf134AgOCFK+J8L7RX7vCWUhH
	XzmL472Kg/qB1/20LuANccmpC8QcP6UDqeV3E/euZPf1HHgOsukVglZpPog1ke6N
	rwqpbnFrwVKXr4eL2faDW3GOiSzUB845pNCaYWfqtj10himkE9iK41DXbfl8Dx7S
	dG2lsgDRQMmqIJmAe2IXYe7WGh3bSasOtLJ2X71oIvINNJUB60498gnv0DXh6b2K
	Mc2o1g==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dmdqb33w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 06:34:17 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49M6YGsx027941
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 06:34:16 GMT
Received: from [10.216.44.181] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Oct
 2024 23:34:11 -0700
Message-ID: <36bfe493-8a85-4add-93e3-650b002636df@quicinc.com>
Date: Tue, 22 Oct 2024 12:04:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] clk: qcom: Add support for GPU Clock Controller on
 QCS8300
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        "Satya
 Priya Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241018-qcs8300-mm-patches-v1-0-859095e0776c@quicinc.com>
 <20241018-qcs8300-mm-patches-v1-2-859095e0776c@quicinc.com>
 <puhpztfn6ga5rxv4mwu7wyvk63hqme2nzffcvzwv7t4oo5hlvc@4ugxncmu3wwk>
 <o5v3fch5oxol4t7j4xlqswk6m6uo4tleck2cnfk6whpfqsrvjc@s2yrjumgvw6j>
 <34216857-170c-45d4-8f6d-987573269215@kernel.org>
Content-Language: en-US
From: Imran Shaik <quic_imrashai@quicinc.com>
In-Reply-To: <34216857-170c-45d4-8f6d-987573269215@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _Z9cHtAk172C_5x6AprBo93FeR1XZQOR
X-Proofpoint-GUID: _Z9cHtAk172C_5x6AprBo93FeR1XZQOR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1011 malwarescore=0 impostorscore=0
 adultscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410220041



On 10/21/2024 8:41 PM, Krzysztof Kozlowski wrote:
> On 21/10/2024 12:56, Dmitry Baryshkov wrote:
>>>>   	{ }
>>>>   };
>>>> @@ -596,6 +635,14 @@ static int gpu_cc_sa8775p_probe(struct platform_device *pdev)
>>>>   	if (IS_ERR(regmap))
>>>>   		return PTR_ERR(regmap);
>>>>   
>>>> +	if (of_device_is_compatible(pdev->dev.of_node, "qcom,qcs8300-gpucc")) {
>>>
>>> Why we cannot use match data? Seeing compatibles in the code is
>>> unexpected and does not scale.
>>
>> Because using match data doesn't scale in such cases. We have been using
> 
> I don't understand how it could not scale. That's the entire point of
> match data - scaling.
> 
>> compatibles to patch clock trees for the platforms for quite a while.
>> You can see that each of the "tunings" is slightly different. From my
> 
> 
> You have one driver, where are these tunings which are supposed to be
> different? You need here only enum or define, in the simplest choice.
> 
>> point of view, this approach provides a nice balance between having a
>> completely duplicate driver and having a driver which self-patches the
>> tree.
> 
> How duplicate driver got into this? I don't think we talk about the
> same. I meant ID table match data.
>>

I agree with Dmitry. If I understand correctly, to add match data 
support, we need to define the gpu_cc_qcs8300_clocks struct by 
duplicating the entries from gpu_cc_sa8775p_clocks and then adding the 
additional qcs8300 clocks. The compatible approach is simpler and used 
across most existing platforms.

Thanks,
Imran

> 
> Best regards,
> Krzysztof
> 


