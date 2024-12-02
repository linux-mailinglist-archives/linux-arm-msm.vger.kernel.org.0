Return-Path: <linux-arm-msm+bounces-39787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2319DFB57
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 08:37:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13846B215B7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 07:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A76C61F9420;
	Mon,  2 Dec 2024 07:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WIAKc8MW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1629B481A3;
	Mon,  2 Dec 2024 07:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733125014; cv=none; b=Vf3R4u0CKzFSjghE3KnWyuYzSb8U+pfU8NeUuuzGfbUIL/XdVmqzo5Lb7yZXkm5etkTd2/R9QtOc9O6qxGz/NSCKqbgPnccR2OIcCo5QX47v7ARhICqR1kRcUztsTyy+DPdzBOfFhK5vQajb/HXlGsKvmwQIj6SZmn6v89InHGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733125014; c=relaxed/simple;
	bh=zoU8SuK76siaGK/jTidZyYog+yXd3K9UnVtCCfG5m/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=F1TOc6NztvRoOy/jYF223BuXDWEdZHB5TrH3M0fSAXS1Sf5gEowDRm+FX/LQF6kAdgoUCHUP8C6s057b3qsTMVMsI6IvwVtOYm9V1irdUJVd5bI1SLdSR1JamPUbG91xh2Us2MSALDtv2j4D8MAuUZwha5pJF+8463r18dtara0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WIAKc8MW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B1Nv6sW025674;
	Mon, 2 Dec 2024 07:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nl6DnAEXN9p1YphhfCH272aTRYwrZ2G6HfYH577HT9g=; b=WIAKc8MWexSNcIIw
	il6pVAmBGHvMaZuAQEts4hzJn11lQp8YErrU3vxw2l5SjolbmBu28F2TRM76/yYW
	zBTZi+p56wyiPjnMaHyGaM0CuXjd4Voy1SzL9J6GIxGfI6DCuinfMJeXc9VzdH+V
	tCl4itR0V4g3M5DYgM1z1XXBLQHbPvAXRF7+HtXFrZHcgNhJ9MOc0cmo7sNmG5QL
	s+54P01lSar7ShOvEFSXNzm/kfbRgRCORz5GIOfQ/TYhd/8qEoUKEyNh5gS2O12d
	au/U0KveQ2ZHWf5K7Ve8dI7Zhc5PM9vSVHTNn2hjAV9+cqJOlSxH2YqtMFIIL4yM
	w0R93w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437uvjup9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 07:36:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B27a2VD031495
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 07:36:02 GMT
Received: from [10.217.217.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 1 Dec 2024
 23:35:57 -0800
Message-ID: <74e5b8b5-ee09-4fb5-9643-14ea11c445e5@quicinc.com>
Date: Mon, 2 Dec 2024 13:05:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/11] dt-bindings: clock: Add Qualcomm QCS615 Display
 clock controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
        "Rob Herring (Arm)"
	<robh@kernel.org>
CC: Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abhishek Sahu <absahu@codeaurora.org>,
        Jagadeesh Kona
	<quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael
 Turquette" <mturquette@baylibre.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
 <20241108-qcs615-mm-clockcontroller-v3-5-7d3b2d235fdf@quicinc.com>
 <173104478441.565041.9851772057058427001.robh@kernel.org>
 <s5rie2osuh2ngkwd2jinly7ulogqqeqois724h3e54a7rqrn2w@wn3yypxi7wca>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <s5rie2osuh2ngkwd2jinly7ulogqqeqois724h3e54a7rqrn2w@wn3yypxi7wca>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: w9Qpe-e1vM3jBhce7L9zDEqg5b7krF8P
X-Proofpoint-ORIG-GUID: w9Qpe-e1vM3jBhce7L9zDEqg5b7krF8P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=857 impostorscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020066



On 11/8/2024 5:09 PM, Krzysztof Kozlowski wrote:
>> dtschema/dtc warnings/errors:
>> Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.example.dts:19:18: fatal error: dt-bindings/clock/qcom,qcs615-gcc.h: No such file or directory
>>     19 |         #include <dt-bindings/clock/qcom,qcs615-gcc.h>
>>        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> compilation terminated.
>> make[2]: *** [scripts/Makefile.dtbs:129: Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.example.dtb] Error 1
>> make[2]: *** Waiting for unfinished jobs....
>> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1442: dt_binding_check] Error 2
>> make: *** [Makefile:224: __sub-make] Error 2
>>
>> doc reference errors (make refcheckdocs):
>>
>> Seehttps://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241108-qcs615-mm-clockcontroller-v3-5-7d3b2d235fdf@quicinc.com
>>
>> The base for the series is generally the latest rc1. A different dependency
>> should be noted in*this*  patch.
> I see this patchset being sent again without changes and receiving same
> errors again, so maybe you expect different results, like some review? I
> don't know, but just in case that's the case please carefully read
> message you got.
> 
> If lack of review is expected, then of course no problem here.

The base patch dependency(GCC) clock controller was mentioned in the 
cover letter:
https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quicinc.com/

Thanks, I will keep a note to notify reviewers explicitly mentioning the 
dependency.



-- 
Thanks & Regards,
Taniya Das.

