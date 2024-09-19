Return-Path: <linux-arm-msm+bounces-31988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 066DC97C2D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 04:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D4342829FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 02:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA4771EA84;
	Thu, 19 Sep 2024 02:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NG4KKuHC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAEE33080;
	Thu, 19 Sep 2024 02:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726712625; cv=none; b=H8RgnnodeDwqvE6DTBY/OIdeg001fI0J1QN3m9/OxZYtG1HjKMsLsE78U4m36DnkUvtt2AcNxDMQVzF8Vn90ReELSQ7Q0n8ILXacvGIYtbb+KljY89Ehk9TJTgSnHjSjQyf8yII/ePUgwW6xcaU3U8Dqza5AjzLTar734eUHby8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726712625; c=relaxed/simple;
	bh=fQdh1rwdxhk6nATdB9jFiExYepC36HljZpN22nj/Q6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Do9iM4MwTGWKRSC0eJNMNRNAvn9ElICfhbr1JGIrJEyA8+IzfQ6LrpcBtK6xsnZBWZzo9hUJBcsM0c1F6Jm1u4SIHuD0SEqxeHScE4RvSq4pe6LSsSnERxFbcD+kX4N1uuTaN9yGV+rkni/nZcK0eCkgDW5Yls5BCFoAUw05ILA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NG4KKuHC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48IHKWAQ006417;
	Thu, 19 Sep 2024 02:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cRkAXXKQXQqktqOTPw2UFDlPpF3j7bvKhAXRcQucnQ4=; b=NG4KKuHCMSzC9ybx
	C9ZwfUMLE5Z0sm6vHC2NeIbWZkpt2LWfW1ZEYrK/DfEeqlJTHnhXb5a5IAxHGfnZ
	IVYReXrGcnVUmmB94PNoUVIcYdTCzjDVziMrjqEuWc4n8FYSS7NBynGs6rE5dL0b
	XZIX4UtOQ/OgNVIIinFSLYLHRX1YlBMIgd1aWiOvBk9L8emKhCv04lPcYJfJQNm+
	U12TFPBObGWaHEwoL8kRJWJlOb6hLQ0OjGI7Z3e/s3jfwrSIHnwNDXPsKyPyBPkZ
	UAwQWwJe0RhiuSkIRKF+4AC9mncbx9WKABbMNRPhFmcVSapvEf8BnVjKy2JICDL2
	Atz9OA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4kjkne2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 02:23:39 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48J2Ncl0005335
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 02:23:38 GMT
Received: from [10.231.207.28] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Sep
 2024 19:23:32 -0700
Message-ID: <14392fbf-9bf6-4e39-8ba2-59473351a64b@quicinc.com>
Date: Thu, 19 Sep 2024 10:23:29 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: pmic: enable rtc
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_kotarake@quicinc.com>, <quic_kamalw@quicinc.com>,
        <quic_skakitap@quicinc.com>, <quic_fenglinw@quicinc.com>
References: <20240902104302.3959670-1-quic_tingguoc@quicinc.com>
 <f5b768b3-37ad-4bdf-9cb6-b39b14c8ee45@kernel.org>
Content-Language: en-US
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
In-Reply-To: <f5b768b3-37ad-4bdf-9cb6-b39b14c8ee45@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iNwH0FpVW8GkSFr2muJ26Md8I0t-mLr9
X-Proofpoint-ORIG-GUID: iNwH0FpVW8GkSFr2muJ26Md8I0t-mLr9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 mlxlogscore=930 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409190015



On 9/6/2024 8:22 PM, Krzysztof Kozlowski wrote:
> On 02/09/2024 12:43, Tingguo Cheng wrote:
>> Add RTC node, the RTC is controlled by PMIC device via spmi bus.
>>
>> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
>> index 1369c3d43f86..47d05b897d5a 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
> 
> We achieved consensus allowing sa8775p to stay, but now Qualcomm changes
> point of view and insists on new approach of dropping sa8775p. Therefore
> this change does not make much sense in the new approach.
> 
The new approach(QCS9100+sa8775p compatible) will still use the same 
PMIC chip(As usually, include sa8775p-pmics.dtsi as it's pmic part). 
Therefore, from this point, it does make sense in the new approach.
 From another point, for old boards, this change should have been there.

> Best regards,
> Krzysztof
> 

-- 
Thank you & BRs
Tingguo


