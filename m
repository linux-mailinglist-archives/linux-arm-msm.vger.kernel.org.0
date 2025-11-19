Return-Path: <linux-arm-msm+bounces-82564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9C1C7016F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 17:30:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 98718306CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 16:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 978A93446BC;
	Wed, 19 Nov 2025 16:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S2JFY36x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738B72E7F08;
	Wed, 19 Nov 2025 16:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569275; cv=none; b=XYKE6OTrSyBA7rrrk/U/+9o0cp9U5Vxp9Lydx0H6C+1WooGHqVpDnzeuLm7V674xGEgE3i2iigLkRJniqP8j1S8ROe+IUPc/38yy8y4TOG6GCnI/0xkidcse7wpxDRHFX4Gf04qpLgQOHwv3BuaRR1AI52UhomSo0pcv2jo+mUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569275; c=relaxed/simple;
	bh=pQHUx7pwj3VkeMg1THNmUIJ6k0lIfLIH3lYl7BEGs2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Am2ce6S+rHcAKFDi/yztjWpOrnQlEy3EizyFoNO/WmbzqRNhW9TsjF4buzxdsYLxOX3iX2QC7ONEgTAYQPFKrFwSebLOKPlIhTNz5BTRXE1Uh3ixD7QSBZQwANEawVEHhET9WPGkB94HL0EUg97iGW2Tk6iFIcpUpMJIzgVaEGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S2JFY36x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJFkCDR2188535;
	Wed, 19 Nov 2025 16:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X83d/c8GvCRJZx6DYWUEeDvN6c8JB87Q6Fnj7qNNgc0=; b=S2JFY36xQJAD514a
	bnhNcKmDfVuWvFTNyTe5QPyG84wWmvzk6+e5MoNuEqRcsikMiyGHPRl49R0Ie3aq
	59ajben7cAgY7S6dBHOufGzXiJCpPrelYeDD1+KBR9MUFDXK6rT4FoMxIGP9MOoB
	ci92eGkXUcRBEQYx+CQqHKpHHjezqjEVQjeoKfnjEsSpkf5zHrXAu0ZOi78sR/KF
	mRNos77S14GvBDKbviuG4xyPGMSczTDMop/eLPg1wFOFmqFWLRTy80Q6aPk2WtnC
	d5E1MBFiCz8MrJ3oAbH30MInpeGNgZETqWtvR0M4J5lSKumxW774z5z4KhWqcbXq
	kwbWgg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahdpr0r7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 16:21:04 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AJGL3ZL024674
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 16:21:03 GMT
Received: from [10.216.11.0] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 19 Nov
 2025 08:20:43 -0800
Message-ID: <3b4153ef-eab6-4726-91ab-51dd09a2b36b@quicinc.com>
Date: Wed, 19 Nov 2025 21:50:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: thermal: tsens: Add QCS8300
 compatible
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, <amitk@kernel.org>,
        <daniel.lezcano@linaro.org>, <rui.zhang@intel.com>,
        <lukasz.luba@arm.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_manafm@quicinc.com>
References: <20250822042316.1762153-1-quic_gkohli@quicinc.com>
 <20250822042316.1762153-2-quic_gkohli@quicinc.com>
 <2948af7b-799d-4754-9460-c50f3f49ba8f@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <quic_gkohli@quicinc.com>
In-Reply-To: <2948af7b-799d-4754-9460-c50f3f49ba8f@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Uq5u9uwB c=1 sm=1 tr=0 ts=691dee70 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Lafe_oj0IsnGLxwvIl8A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEyOSBTYWx0ZWRfX45fUOSsPakB7
 x4STesStiys6i/xAMTQ+31Ov88j3GkeliqdRLKZZI6GTYLc4H+0ShU81Tz0sq8ImwdOodJRyyIC
 1eJyzmJftcQNM9BDFuujoTnxVl035FumUGkVsdrvMg5SzTK1cqOoEStFEqO8mAQxX8030fFJUNz
 WMIsCrstzK/pOLsokY4kcyhr6uW0aHR4zRO6GPEYM3VAZhgWqtYCkGcojxyBnIbIBtuvqCCcDf3
 dr2uggnQHnfWOjRWVRNCzK7xEIkWVnbf6+8zaNJC7ax7GcZietxVEGMZ61PhwqEhDG31viV9RO1
 HJOcnlLXxCa+DqTUawI+b4G9a6fCIpwhBLCbeJsunXkEzpRf9yHh9RwjFHs/TgRptgT2MeCaWt8
 L25DOSFQe5wZdaNJ5kfZFP0ivb8F5Q==
X-Proofpoint-ORIG-GUID: _ers42HQwKcwOQHUbLZqaghjRMQPs5xP
X-Proofpoint-GUID: _ers42HQwKcwOQHUbLZqaghjRMQPs5xP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190129

Hi,

Can this be picked up, as all approvals are present.

thanks
Gaurav

On 11/6/2025 1:37 AM, Akhil P Oommen wrote:
> On 8/22/2025 9:53 AM, Gaurav Kohli wrote:
>> Add compatibility string for the thermal sensors on QCS8300 platform.
>>
>> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
>> index 94311ebd7652..7c1f121fb417 100644
>> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
>> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
>> @@ -54,6 +54,7 @@ properties:
>>                 - qcom,msm8996-tsens
>>                 - qcom,msm8998-tsens
>>                 - qcom,qcm2290-tsens
>> +              - qcom,qcs8300-tsens
>>                 - qcom,sa8255p-tsens
>>                 - qcom,sa8775p-tsens
>>                 - qcom,sar2130p-tsens
> 
> Looks like this patch is still lying in the mailing list.
> 
> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> 
> -Akhil
> 


