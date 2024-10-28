Return-Path: <linux-arm-msm+bounces-36131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E74C59B2A84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 09:40:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3968A1C2184E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 08:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7067A19049D;
	Mon, 28 Oct 2024 08:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dkRHnsf9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7742317CA1B;
	Mon, 28 Oct 2024 08:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730104851; cv=none; b=keelkeGnhKiNUSAe1wT1LJjOxgUOVMjDp9/LssmsqEMGOmqCByxha1c+0i+oSuf/AcGSKNk8eICRHdyMcUDIzttcUBBHou7f2XNM9k1IVsD0LYCbr9zOFBULpVh+bsaN/AR10KQTJqaZHDqycgEp9OaCD4ixScFkUWQE11uYzUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730104851; c=relaxed/simple;
	bh=PsJeG1zFAPpT+bvowI6Wk68OnqNe68L+e2mXLpQCM+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iIN82ZlejY1kZw0Od/lcCEp8KzSRC0gkQj80U3BVmdzPPrAUTUgYSaNRa895pEHAnWII+ZPMF/6CroAagcnt116fpDViSnC82IdyfZA44XAE3m1XQiRb2kNurEeBxnL62aNRqBmAjg6s2fOvuAmR1r9RCpk+7Jf4fQpZxIf55sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dkRHnsf9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RMnvrZ003314;
	Mon, 28 Oct 2024 08:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kiNo4LPRV7XQOGUYK9r0YZHDc65Gpy9Gqr6GqwLr4KE=; b=dkRHnsf9gjzkkLHS
	mjAWEG/Bxc8kgMY3GWAfXKwetbH+QzFLLxSyTKjOw3BRWkImDCgMPY6U9UO4DFmS
	k4QXN5lgeQKFGnTOMnzsqaqVT1mTQ3d4kJxrWHfoNzOej46PCERgsv7qL5Qyqj1L
	CXzcjzYbQvxrfsQWSNBgagyA/+hhzwxbdpt73LkjyAOHq+CWFeiTre2w1/hvaZxl
	iCioZ7DDdlEZHJcPkEWIGhJAvUU8J3WV1z+UAqcdQdplQkXFTXaeLgx8ktyxaowM
	oqNC25iNwWVG0a94FvrmqwjA91eY6RlcRGDV13prMrJI9Y02wItaEMWHywMKC5kR
	bHq6cg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqrgm6pj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 08:40:45 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49S8eiB0002215
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 08:40:44 GMT
Received: from [10.231.207.28] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Oct
 2024 01:40:38 -0700
Message-ID: <38cceae8-5203-4057-bd8b-f20fe3656474@quicinc.com>
Date: Mon, 28 Oct 2024 16:40:36 +0800
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
Content-Language: en-US
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
In-Reply-To: <j4ggfrynyoriseef5r5x6uwgo6cespll2np7uitc64yagoa6pz@r3ro2cpqrrry>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uR0FCQ1kyGg2CObqUr5j4TBQ83k-LW5a
X-Proofpoint-GUID: uR0FCQ1kyGg2CObqUr5j4TBQ83k-LW5a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=865 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280070



On 10/28/2024 4:23 PM, Dmitry Baryshkov wrote:
> On Mon, Oct 28, 2024 at 04:03:25PM +0800, Tingguo Cheng wrote:
>> Enable PMIC and PMIC peripherals for qcs615-ride board.
>>
>> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> index ee6cab3924a6d71f29934a8debba3a832882abdd..37358f080827bbe4484c14c5f159e813810c2119 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> @@ -6,6 +6,7 @@
>>   
>>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>   #include "qcs615.dtsi"
>> +#include "pm8150.dtsi"
>>   / {
>>   	model = "Qualcomm Technologies, Inc. QCS615 Ride";
>>   	compatible = "qcom,qcs615-ride", "qcom,qcs615";
>> @@ -210,6 +211,20 @@ &rpmhcc {
>>   	clocks = <&xo_board_clk>;
>>   };
>>   
>> +&pon {
>> +	/delete-property/ mode-bootloader;
>> +	/delete-property/ mode-recovery;
> 
> Why?
Because boot modes will be supported on PSCI module from another patch, 
reboot-modes are required to remove from PMIC side.
> 
>> +};
>> +
>> +&pon_pwrkey {
>> +	status = "okay";
>> +};
>> +
>> +&pon_resin {
>> +	linux,code = <KEY_VOLUMEDOWN>;
>> +	status = "okay";
>> +};
>> +
>>   &uart0 {
>>   	status = "okay";
>>   };
>>
>> -- 
>> 2.34.1
>>
> 

-- 
Thank you & BRs
Tingguo


