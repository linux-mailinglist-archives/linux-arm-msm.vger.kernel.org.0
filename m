Return-Path: <linux-arm-msm+bounces-36396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6FA9B603A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 11:34:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D3481C21BB7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 10:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 550BF1E2854;
	Wed, 30 Oct 2024 10:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j0O2LsEN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1900D1E377A;
	Wed, 30 Oct 2024 10:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730284436; cv=none; b=TpgH7VUJHXf69dqR3ylodJOA74hp8uifV5krOPVhiRpKQAYFrD0Iy3Mt97rvhLwHflDamcb10jt9CByb6lwbyEajSktdG10n/wFnqDyDfKMWoTKystBiIOspj4uAgOK+a9FSTJMqsOYQTyRaaW1ls+FuHR+uFmzLdU+0RioJdr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730284436; c=relaxed/simple;
	bh=jw62Z5cUSu57Xnh9KUwNg9pJ+iuHmClIUEj6+M2N+3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tfPmKObY2ZMZc7TjdmtpIIWxpEcX0O4/FjdJgJU0+gA0kZu8CNk/zttN5W5DjW74Clzz8nHNMErTkRhOuarGhNZ0ARBIn2EsXISJC1KFxW+tSBO9aCI/8u3q98ftO8yExRJlJfsoaNudbJMAzdWIxGMX4vEq0S6YuQ1qvB9G1zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j0O2LsEN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49UAXbXY020894;
	Wed, 30 Oct 2024 10:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zLzBMv0Rkg00i7HVkcGGnpFFmL3Ph5CdG9HHpzdsPC4=; b=j0O2LsENzTEjp7m3
	OwX6S2hKeYxiK2offq9t934pksLOkwuX4aLUx4FdW6rc9G3aeyTORkygr3DXl5w9
	gBhMLl1c73OreqBpsPSnn8g2JpUsPQRVNXqiooy43FkeKMLVDlAevS2uRKaC41VI
	sYSsz/R3ICb6dDcJrk8LbGg/2gbxV/esj/SnYT98cduIXldDxIQzg7MPm6aQMp+x
	SAtcyILngIusdeAShVpOyOdTKo5XLUU9EoMoHeb0URmktMxBkfxGhD01JyvKPNTS
	7tKkGxegtPW6124PW4i0k4yuudInNwHwUtdXfoRhiv3NaRItmUH+Zj5kwt5DEO3X
	ipKu5g==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqcquq4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 10:33:49 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49UAXnuM005413
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 10:33:49 GMT
Received: from [10.231.207.28] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Oct
 2024 03:33:43 -0700
Message-ID: <563e7080-68a9-4735-995a-72baf2e35d49@quicinc.com>
Date: Wed, 30 Oct 2024 18:33:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs615-ride: Enable PMIC
 peripherals
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <quic_fenglinw@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <kernel@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241028-adds-spmi-pmic-peripherals-for-qcs615-v3-0-f0778572ee41@quicinc.com>
 <20241028-adds-spmi-pmic-peripherals-for-qcs615-v3-2-f0778572ee41@quicinc.com>
 <j4ggfrynyoriseef5r5x6uwgo6cespll2np7uitc64yagoa6pz@r3ro2cpqrrry>
 <38cceae8-5203-4057-bd8b-f20fe3656474@quicinc.com>
 <CAA8EJprYHjYVM58e7i7Sxj64DSth4hhW_cUZ3hGqX7u0ecZFQg@mail.gmail.com>
Content-Language: en-US
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
In-Reply-To: <CAA8EJprYHjYVM58e7i7Sxj64DSth4hhW_cUZ3hGqX7u0ecZFQg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MwRTFt_cmggySsdospp3lmrcLuCNDEnP
X-Proofpoint-GUID: MwRTFt_cmggySsdospp3lmrcLuCNDEnP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 mlxlogscore=976 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300080



On 10/28/2024 5:41 PM, Dmitry Baryshkov wrote:
> On Mon, 28 Oct 2024 at 10:40, Tingguo Cheng <quic_tingguoc@quicinc.com> wrote:
>>
>>
>>
>> On 10/28/2024 4:23 PM, Dmitry Baryshkov wrote:
>>> On Mon, Oct 28, 2024 at 04:03:25PM +0800, Tingguo Cheng wrote:
>>>> Enable PMIC and PMIC peripherals for qcs615-ride board.
>>>>
>>>> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/qcs615-ride.dts | 15 +++++++++++++++
>>>>    1 file changed, 15 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>> index ee6cab3924a6d71f29934a8debba3a832882abdd..37358f080827bbe4484c14c5f159e813810c2119 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>> @@ -6,6 +6,7 @@
>>>>
>>>>    #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>>>    #include "qcs615.dtsi"
>>>> +#include "pm8150.dtsi"
>>>>    / {
>>>>       model = "Qualcomm Technologies, Inc. QCS615 Ride";
>>>>       compatible = "qcom,qcs615-ride", "qcom,qcs615";
>>>> @@ -210,6 +211,20 @@ &rpmhcc {
>>>>       clocks = <&xo_board_clk>;
>>>>    };
>>>>
>>>> +&pon {
>>>> +    /delete-property/ mode-bootloader;
>>>> +    /delete-property/ mode-recovery;
>>>
>>> Why?
>> Because boot modes will be supported on PSCI module from another patch,
>> reboot-modes are required to remove from PMIC side.
> 
> => commit message, please.
> 
okay, will upload v4 with other comments fixing together.
>>>
>>>> +};
>>>> +
>>>> +&pon_pwrkey {
>>>> +    status = "okay";
>>>> +};
>>>> +
>>>> +&pon_resin {
>>>> +    linux,code = <KEY_VOLUMEDOWN>;
>>>> +    status = "okay";
>>>> +};
>>>> +
>>>>    &uart0 {
>>>>       status = "okay";
>>>>    };
>>>>
>>>> --
>>>> 2.34.1
>>>>
>>>
>>
>> --
>> Thank you & BRs
>> Tingguo
>>
> 
> 

-- 
Thank you & BRs
Tingguo


