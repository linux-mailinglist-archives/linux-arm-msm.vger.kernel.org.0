Return-Path: <linux-arm-msm+bounces-39299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C699DA689
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 12:07:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A3592822B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 11:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B69D1EE022;
	Wed, 27 Nov 2024 11:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KXfZfUM6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7652F1EE023;
	Wed, 27 Nov 2024 11:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732705629; cv=none; b=o5388ulbLTTm6WHSqY2mFDx7b9RgeAfKheZ1EvwvJ4xZOGQBo2bWP8Hcc9iCOcQjeaqxb6X7A4/RN98NqsgztbUdM7Qs+Q620N4ZscVhMEryGtCMev9GLjEfK/DggSVush1N+j9/Ypqf09Zpd7PwyhGUtOvBS2UjGw1y3Uh7KXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732705629; c=relaxed/simple;
	bh=/1Y0Pr5zlaTOBKbaJdGDqjvMDHGZJbLEBG4xP0of54E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RiHsCV1R4vRwFLy1YXDleXIOUwHffhrO16GgjDduVawDD6xY4TE1MFGMagP2MH0ulJIFR4H58+FUSypI6kLgFs5xjSKCKkpWoCFjf9aF7Q2b90cPcr9Us+b06NYLBJooZsTcN96cXfWYx2bPy/WLkZp20TV9wP3WGgpst+sNHLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KXfZfUM6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AR8tuij006092;
	Wed, 27 Nov 2024 11:06:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zZ9yc2zbn8F7uOk5mtyEw86GWK73C7e7qpyItFSaXbU=; b=KXfZfUM65o0TlGaP
	42Z1YL2rQHEz2cxwflmazA6XCozyIFY7SYZnYhpjevrWnmtwP9zZ5Bq9gY9jDGdT
	vjOhaBr0Epj5xBdhKhlkf3REZmf3aab88T/JOOassib7CgA0Ic4GdCxf+cdwPrPZ
	s9b/QXwhwK+C5pYRfluTCUrz+ly788566m2DKYmxnXNyUC05znZDrwlopND5MWy8
	KIhfCNoElgGIruPnQiGn8p6eNcOjuucKp1PcgzU73LZHsrKOdIQE/0+n8/b9ZeDx
	toBD8RSlxAP/tziJ9W6dpk/04p4BiVzOM9maNxPg0dEg9C2aehu7xvKWKoJQqgyh
	v4e4KA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 434ts1p9q5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 11:06:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ARB6lHR006239
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 11:06:47 GMT
Received: from [10.233.17.145] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 27 Nov
 2024 03:06:40 -0800
Message-ID: <42a8565a-6dd9-4cb6-a83b-22e779b5f31b@quicinc.com>
Date: Wed, 27 Nov 2024 19:06:37 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Display enablement changes for Qualcomm QCS8300
 platform
To: Yongxing Mou <quic_yongmou@quicinc.com>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Ritesh Kumar <quic_riteshk@quicinc.com>,
        Rob Clark
	<robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Sean
 Paul" <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <675c41cb-afa8-4386-8dc9-026a36bc1152@kernel.org>
 <8982d065-9bc6-4036-8004-80b1681eaf3c@quicinc.com>
From: Tingwei Zhang <quic_tingweiz@quicinc.com>
In-Reply-To: <8982d065-9bc6-4036-8004-80b1681eaf3c@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DK9OgcMEwMBc9F4QNKCwGE-uqUxS41-R
X-Proofpoint-ORIG-GUID: DK9OgcMEwMBc9F4QNKCwGE-uqUxS41-R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 mlxlogscore=948 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411270092

On 11/27/2024 6:54 PM, Yongxing Mou wrote:
> 
> 
> On 2024/11/27 15:13, Krzysztof Kozlowski wrote:
>> On 27/11/2024 08:05, Yongxing Mou wrote:
>>> This series introduces support to enable the Mobile Display Subsystem 
>>> (MDSS)
>>> and Display Processing Unit (DPU) for the Qualcomm QCS8300 target. It
>>> includes the addition of the hardware catalog, compatible string,
>>> relevant device tree changes, and their YAML bindings.
>>>
>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>>> ---
>>> This series depends on following series:
>>> https://lore.kernel.org/all/20241114-qcs8300-mm-cc-dt-patch- 
>>> v1-1-7a974508c736@quicinc.com/
>>> https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi- 
>>> v2-0-494c40fa2a42@quicinc.com/
>> Above was not part of this merge window, so nothing from your patchset
>> can be merged for this v6.14.
>>
>> If you want things to get merged, I suggest decoupling dependencies.
>>
> Thanks for reviewing.Can we keep the dependency on above changes and 
> merge our changes after the dependent changes are merged?

You can move device tree changes which have dependency to a separate 
series and keep binding/driver changes here. They don't have dependency.

>> Best regards,
>> Krzysztof
> 
> 


-- 
Thanks,
Tingwei

