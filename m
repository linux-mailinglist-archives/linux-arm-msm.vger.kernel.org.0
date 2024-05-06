Return-Path: <linux-arm-msm+bounces-19240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B418BCC95
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 May 2024 13:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDE712835E7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 May 2024 11:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15990142E79;
	Mon,  6 May 2024 11:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SP9bV9ld"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230E74436A;
	Mon,  6 May 2024 11:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714993475; cv=none; b=It7TCT/qoXW9/MogbVuhjVv7OQBSsinga2WZcUrhJpsKRaf5D4+sg0QPL20RRD9BZhbcWQITLZ617cDduZRt/aAr32Y1ivTwIyivI3tRHbAAS33ioxzEy9bB7g69avDvznSqebS90PosLH4HOfJhm05jS/QV5OZzegJ8xYL3Sso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714993475; c=relaxed/simple;
	bh=cKM8MiFe8UD3GcOQpM8SQTAqO/+sLmBQRRyweHqZnYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hJ1QtM6m6tcGtyyK0KOWIH1BgF9SjgMqeZju0HbHDhJXo1iAqBnCIFE0estAqjsXpqoHoWzUk7/pj1wlhWgEkJVv4S4e5fRSW7U0hD7aRmpq0JhsGJnJK5fb41NfN7e8zfdaq7OVLpHSrHBZCBZz1ugaI3znEqiOF2ITcEemNbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SP9bV9ld; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4469eWwe018038;
	Mon, 6 May 2024 11:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Fcp9j/FXI5yFpPzCvE/2UUZUXBbsLMWNUIkqwXMzhUk=; b=SP
	9bV9ldFBrS3MR8upY/ddLt/ZdEVDe4vR9ZlRj0DpdTz1hOQBD2LrFLcdI2ALDvhr
	aUlmk14MaQqmNcRNXr445mumXiEY9eTfZ5NO7WTt1B3BS66P/rbadlB7gWGSjs1G
	KVovAp0Ej/+uulBIrd72rZWe8VHyj1TWJHVAVBRvbhn+zcfcX5yVrO5GXDwbb8yQ
	Y2TG4z/GzcWItLtPfoWYMPlRrziYl04fmcTUezstNNprYoJsFBJlxpzZ9cN5X88A
	y4BNiHy1c9HuzQvAek/cR7TYWbYs5AKenVOEtKKfkV6UKnEQ5HT/pKd4PmmLzb54
	LUbVCJvsfhNEM0lGaONA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xwcm4kbcr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 11:04:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 446B4OHa019309
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 6 May 2024 11:04:24 GMT
Received: from [10.217.219.66] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 6 May 2024
 04:04:19 -0700
Message-ID: <972807ff-5db7-77a0-da90-6ecc1e7c1ecb@quicinc.com>
Date: Mon, 6 May 2024 16:34:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: sa8775p: Set max link speed to
 gen4 for ep pcie
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <konrad.dybcio@linaro.org>,
        <manivannan.sadhasivam@linaro.org>, <quic_shazhuss@quicinc.com>,
        <quic_nitegupt@quicinc.com>, <quic_ramkri@quicinc.com>,
        <quic_nayiluri@quicinc.com>, <quic_krichai@quicinc.com>,
        <quic_vbadigan@quicinc.com>, <quic_schintav@quicinc.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1714494711-10322-1-git-send-email-quic_msarkar@quicinc.com>
 <1714494711-10322-3-git-send-email-quic_msarkar@quicinc.com>
 <CAA8EJprnO84T+mbUD-T55T0zU0ngWFnpa4i8EfWxu0UzJZuzgw@mail.gmail.com>
From: Mrinmay Sarkar <quic_msarkar@quicinc.com>
In-Reply-To: <CAA8EJprnO84T+mbUD-T55T0zU0ngWFnpa4i8EfWxu0UzJZuzgw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WAcxryBzBVRpTLZmaEe2a0lLyIRZFnrh
X-Proofpoint-GUID: WAcxryBzBVRpTLZmaEe2a0lLyIRZFnrh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_07,2024-05-03_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 mlxscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405060076


On 4/30/2024 11:20 PM, Dmitry Baryshkov wrote:
> On Tue, 30 Apr 2024 at 19:33, Mrinmay Sarkar <quic_msarkar@quicinc.com> wrote:
>> Adding this change to set max link speed to gen4 as sa8775p supports
>> gen4 so that pcie link can be enumerated as gen4.
> Previous patches mentioned stability issues. Were they solved?
Hi Dmitry,
Thanks for review.

Actually earlier gen4 related equalization setting was missing in driver.
That's why gen4 was not stable and it was coming to gen3.

With this below driver change gen4 is stable now
https://lore.kernel.org/all/20240501163610.8900-1-quic_schintav@quicinc.com/ 

>> Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> index 0c52180..aad2cd7 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> @@ -3730,7 +3730,7 @@
>>                  power-domains = <&gcc PCIE_0_GDSC>;
>>                  phys = <&pcie0_phy>;
>>                  phy-names = "pciephy";
>> -               max-link-speed = <3>; /* FIXME: Limiting the Gen speed due to stability issues */
>> +               max-link-speed = <4>;
>>                  num-lanes = <2>;
>>
>>                  status = "disabled";
>> @@ -3888,7 +3888,7 @@
>>                  power-domains = <&gcc PCIE_1_GDSC>;
>>                  phys = <&pcie1_phy>;
>>                  phy-names = "pciephy";
>> -               max-link-speed = <3>; /* FIXME: Limiting the Gen speed due to stability issues */
> I think you've just sent a patchset which adds this node. Is there any
> reason for setting the max-link-speed to 3 just to change it to 4
> immediately?
Earlier we were not sure about the root cause of the issue
so limited the speed to gen3. Now as we have the solution
for this issue so moving to gen4.
> Thanks,
> Mrinmay
>> +               max-link-speed = <4>;
>>                  num-lanes = <4>;
>>
>>                  status = "disabled";
>> --
>> 2.7.4
>>
>>
>
> --
> With best wishes
>
> Dmitry

