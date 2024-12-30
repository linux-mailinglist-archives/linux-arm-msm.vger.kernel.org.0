Return-Path: <linux-arm-msm+bounces-43601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AA79FE35F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 08:43:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5482188225C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 07:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40BC619F13B;
	Mon, 30 Dec 2024 07:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DG1wQQSi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0054D8CB;
	Mon, 30 Dec 2024 07:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735544601; cv=none; b=AtQB5lwtBDPA9kWygYAkFuX0XvY8o7T7EGuPp0+B3xZ1Dn5+j6iT5bptd1Pe4BHagZLMzjay7XwU5FURxklXe81SE4uXr5R0Eea9IM2QsYVWB+jZun24ImpZNclCL3noiBulBbTqgWW8o5Glab3xU+jy0+06E3Y0BWvbRpnu4l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735544601; c=relaxed/simple;
	bh=/QpnLbAUQl4xLhtBrgh3PAoCXgKT38MC1TD6x8eepe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VZWv5pWRMYsAmQjh4fyFL/wyQcNq+yzeG+PI+2mXg2Jo9to5IWXvluW9H2mWPzpYmS4GVQf671DgEmKED+HydFLR1E2g/SwabSckC55Y1pnTnlQu8qTWYWCHQSizuw03deRUCujLZMCw8AbryQEBucdj2TFA80IKd5W1IDhsOAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DG1wQQSi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU1X4kj028167;
	Mon, 30 Dec 2024 07:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VlO35bkYq37/EUrx13xJgaQfSl335GfdaycmJLn79XU=; b=DG1wQQSifvlrO9FP
	f/WDk9Y5/OoS14kWyt/dotjfxXrs6XjmeOLn5C8BThWdOtDWHmObIRYLTbsuCW1R
	5FivgMpqc8B361sKt+9HxWBH/BV1zVuXIeFPP18vWFzpFAgkfKOX4n9bmS/NRw3B
	c5nqMTJ5+zSYXFrhh7zxAmTanOY2b2CDXoYadL4xSvC0+jitCA8GFh1JMyrKSoDD
	BrsN4H8tQPjiUpCMNCnKOc9sC6b59AU4yOMhAm8PPeWzcA1bwi2GEd5Ksp/XMjdA
	1V62oC8VNVVKw99JV8z7+6iQ3TehryL2sKfr+VIv0zG1GiLo0GhEmPcp+YXk/HtK
	tTDwyg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43uhxvrkyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Dec 2024 07:43:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BU7hFXt005421
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Dec 2024 07:43:15 GMT
Received: from [10.216.61.31] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 29 Dec
 2024 23:43:11 -0800
Message-ID: <7924984d-57e9-40f8-8998-b37d6e1bc78c@quicinc.com>
Date: Mon, 30 Dec 2024 13:13:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] nvmem: qfprom: Ensure access to qfprom is word
 aligned
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Naman Jain
	<quic_namajain@quicinc.com>
References: <20241027-sar2130p-nvmem-v2-0-743c1271bf2d@linaro.org>
 <20241027-sar2130p-nvmem-v2-1-743c1271bf2d@linaro.org>
 <60068361-ddb7-4906-84ca-195e5eb13a0f@linaro.org>
 <plemc4swba7ybrncyxt3axxpb3qjbdktfkt7kqt3dqymlusfpq@sfgwakjp7z3g>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <plemc4swba7ybrncyxt3axxpb3qjbdktfkt7kqt3dqymlusfpq@sfgwakjp7z3g>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: i2mnV6tOuyR_PuhY9TogA0z-v7Dz-SoB
X-Proofpoint-GUID: i2mnV6tOuyR_PuhY9TogA0z-v7Dz-SoB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 clxscore=1011 bulkscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412300064

On 12/9/2024 4:23 PM, Dmitry Baryshkov wrote:
> On Mon, Dec 09, 2024 at 09:55:14AM +0000, Srinivas Kandagatla wrote:
>>
>>
>> On 26/10/2024 23:42, Dmitry Baryshkov wrote:
>>> From: Naman Jain <quic_namajain@quicinc.com>
>>>
>>> Add logic for alignment of address for reading in qfprom driver to avoid
>>> NOC error issues due to unaligned access. The problem manifests on the
>>> SAR2130P platform, but in msm-5.x kernels the fix is applied
>>
>> Is this only issue with SAR2130P?

This is applicable to all chipsets with sys arch newer than Snapdragon 8
Gen 1.

> 
> I don't know. I know that it manifests on SAR2130P, but in the vendor
> kernels the fix is applied to all the platforms.
> 
>>
>>> uncoditionally. Follow this approach and uncoditionally perform aligned
>>> reads.
>>
>> If there is a need of having proper register alignment this should go as
>> part of the nvmem_config->stride and word_size configuration and not in
>> reg_read callbacks.
> 
> Thanks, I'll explore that option. Indeed, it might be easier to handle.

Dmitry, any update here? I need similar change for X1E GPU speedbin support.

-Akhil

> 


