Return-Path: <linux-arm-msm+bounces-32987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2FE98E974
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 07:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27F01285759
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 05:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43AD54AEF5;
	Thu,  3 Oct 2024 05:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DFAkNAFh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF6E2232A;
	Thu,  3 Oct 2024 05:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727934115; cv=none; b=CtduJieXVJmiBoDoH1peTb0PElWzNAdCbPBjnFo5DitgdDvHwPb0Sf6Hly45MJJL3s6QUk8KgPAHsLnTXTXLZ4EdompeD+aO7oLJ+nN9zQmqIJCDNnz/3r+AqX2fCUqA6tKJNcKFjZfjs993wokizyXAV5BPkFD8J9hfUh2o7jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727934115; c=relaxed/simple;
	bh=yUY5GUWd6PjqraMsVz323t8Cz+u3xltebghjhdfXqeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=f7uk4doOERFezbvyYSk2xHLOvBVNt8o/SeJ9DEBcow1+K0pVBOoyUcJnpIwjHIaaysVHmDzWbtnHtUnmw2fHueqyZoVQQkrG4ob4UB6oxgMLNlI6V4VcY6/AnMosxwQnTSQmMTkfKlxoiJvtBVchLZO1k+1yGZQHJNAc3MIovqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DFAkNAFh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4934WXQ3015779;
	Thu, 3 Oct 2024 05:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sOQwF3UrifqJypPWc0S9p2mBjXup3y75Y3h6QtVOmeo=; b=DFAkNAFhNJ0Mt49o
	/is0xxOowwgEoyvvqOmCytia7xy7aRCXGxvHIu4C+kmCT6M1r3Kp2WSnMXlBm2dI
	rCxAkfqX3KbJHhzJKDKypQyFan+7CK9m8J74xpq8dkzW/XfpElD7fLcCfJECt8+E
	z6h6Jxft+Gp3/v99gil1m9IThrGbjkKqVa3VbBuvfuKaH79VyiYFfJNjMrA6eUrP
	v1yEeD/vKQIy1lLA334r29MtiTVxJaLoEbDsE+Pxjpw1nowI2AY5Gx/xhnH3xupY
	CdWRFFZh+5yYZpFpTfzdzZECVdoPTf2mXY/NahI9wsTDzXz9eNRH/MBOYJKGLEC7
	M9kcgQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41x94hngaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Oct 2024 05:41:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4935fi0u026004
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Oct 2024 05:41:44 GMT
Received: from [10.214.67.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 2 Oct 2024
 22:41:40 -0700
Message-ID: <2ecaa16e-e0ec-44af-8a0f-438dc25ca4c1@quicinc.com>
Date: Thu, 3 Oct 2024 11:11:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc7280: Add cpucp mbox node
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar
	<quic_sibis@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Ramakrishna Gottimukkula
	<quic_rgottimu@quicinc.com>
References: <20240924050941.1251485-1-quic_kshivnan@quicinc.com>
 <20240924050941.1251485-4-quic_kshivnan@quicinc.com>
 <c315bfe0-88ba-4b1b-b57d-c51e4448a870@kernel.org>
Content-Language: en-US
From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
In-Reply-To: <c315bfe0-88ba-4b1b-b57d-c51e4448a870@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PNO3YNqZ7E57y4vz9SLZf_ri_kLqPaE8
X-Proofpoint-ORIG-GUID: PNO3YNqZ7E57y4vz9SLZf_ri_kLqPaE8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410030037



On 9/25/2024 7:52 PM, Krzysztof Kozlowski wrote:
> On 24/09/2024 07:09, Shivnandan Kumar wrote:
>> Add the CPUCP mailbox node required for communication with CPUCP.
>>
>> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 3d8410683402..4b9b26a75c62 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -4009,6 +4009,14 @@ gem_noc: interconnect@9100000 {
>>   			qcom,bcm-voters = <&apps_bcm_voter>;
>>   		};
>>
>> +		cpucp_mbox: mailbox@17430000 {
> 
> Are you sure you placed it in correct location (the order is by unit
> address, see DTS coding style).
> 

I will correct it in next series.


>> +			compatible = "qcom,sc7280-cpucp-mbox";
>> +			reg = <0 0x18590000 0 0x2000>,
>> +			      <0 0x17C00000 0 0x10>;
> 
> Lowercase hex... we just fixed it everywhere and you introduce again
> same issues.
>


ACK

> 
> 
> Best regards,
> Krzysztof
> 

