Return-Path: <linux-arm-msm+bounces-23017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1A290CB21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 14:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A29291F276A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 12:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0457213AA51;
	Tue, 18 Jun 2024 12:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bfIsS6he"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466792139AF;
	Tue, 18 Jun 2024 12:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718712400; cv=none; b=NBeGyRSbnjX0LqI+fe1wIv4mMBqbknMuQcYkzy/+uUyaqzJvikdt3oW40RolQvO6Gem6O0tM6GnfSqE332L9FBO5uvw8DYmVrOFaiCIDnkDAPDeb7Vo0wt6qYwiGfL/xatOON/LZuu11I4yEJ8jmaKhqN+OqdJOY3ktFr1Qjt+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718712400; c=relaxed/simple;
	bh=PUxRGSzgzp4vRmnK1LHLDw8NXD+ShCbOt5l2m4UpRRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PUHFv8BwC8rBRb3U9/5Rl8MIjAfpzlk0Y1nw0pwRTd85BKgGRaPzU1oRYrvwqXezTRN4At9jTIm6SkVRmN0/Gc3hW/fgPwZADPpcNeUir0p3io/YOu45LXkXaPgkv80W5b+2/DBQcRLW80UHj+o99Sx2//kNdOY7IEQp3U1gv6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bfIsS6he; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45I6bHvV004481;
	Tue, 18 Jun 2024 12:06:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BPoFZkZVeA1ImwyMY0d+//L134+Nq0+28Z4RqcXKJQc=; b=bfIsS6he2ziqqmBZ
	w8t6xxKDfpMbiIiUPFb+AK7yYwoFE8rrlL1vflpmz9fcyRP/ruTmEuF1qJUzNZe0
	q2M42CmmFhsCPRmmGIFTC5UFsXNlMLCipIvgJ2rvMTQTbJsNyTCIBqLOCMpFxhP1
	fP9Mlw5JyWZX1Lz8EDp2Z+qTjNXalhs3L+zWa1RA4IRSd6/4fEIqs1DVY14XIDzQ
	xzJsbeXSxMmxNYRbNuKlElywZK2hakyWgrukLNI+5+N3b4lpFtyhHPxHGPVEB0b2
	hsXu3ZoBspxNGmQ5XQUUolqHaSWGhfdomef6vgYZ3+RN4Ifk5U4F4YCedP0iQFVg
	bfGiRw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ytt37a37f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 12:06:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45IC6GeE006473
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 12:06:16 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 05:06:11 -0700
Message-ID: <003bfe18-fa51-42b0-bdd3-1cbb245cfff7@quicinc.com>
Date: Tue, 18 Jun 2024 17:36:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 8/8] arm64: dts: qcom: sm8650: Add video and camera
 clock controllers
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>
References: <20240602114439.1611-1-quic_jkona@quicinc.com>
 <20240602114439.1611-9-quic_jkona@quicinc.com>
 <0f13ab6b-dff1-4b26-9707-704ae2e2b535@linaro.org>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <0f13ab6b-dff1-4b26-9707-704ae2e2b535@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AJBLjWTGSKkcAk_lHOi8NonjZiUqewe2
X-Proofpoint-GUID: AJBLjWTGSKkcAk_lHOi8NonjZiUqewe2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 bulkscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406180090



On 6/13/2024 2:52 AM, Vladimir Zapolskiy wrote:
> Hi Jagadeesh.
> 
> On 6/2/24 14:44, Jagadeesh Kona wrote:
>> Add device nodes for video and camera clock controllers on Qualcomm
>> SM8650 platform.
>>
>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 26 ++++++++++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi 
>> b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index 336c54242778..d964762b0532 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -4,10 +4,12 @@
>>    */
>>   #include <dt-bindings/clock/qcom,rpmh.h>
>> +#include <dt-bindings/clock/qcom,sm8650-camcc.h>
>>   #include <dt-bindings/clock/qcom,sm8650-dispcc.h>
>>   #include <dt-bindings/clock/qcom,sm8650-gcc.h>
>>   #include <dt-bindings/clock/qcom,sm8650-gpucc.h>
>>   #include <dt-bindings/clock/qcom,sm8650-tcsr.h>
>> +#include <dt-bindings/clock/qcom,sm8650-videocc.h>
>>   #include <dt-bindings/dma/qcom-gpi.h>
>>   #include <dt-bindings/firmware/qcom,scm.h>
>>   #include <dt-bindings/gpio/gpio.h>
>> @@ -3315,6 +3317,30 @@ opp-202000000 {
>>               };
>>           };
>> +        videocc: clock-controller@aaf0000 {
>> +            compatible = "qcom,sm8650-videocc";
>> +            reg = <0 0x0aaf0000 0 0x10000>;
>> +            clocks = <&bi_tcxo_div2>,
>> +                 <&gcc GCC_VIDEO_AHB_CLK>;
>> +            power-domains = <&rpmhpd RPMHPD_MMCX>;
>> +            #clock-cells = <1>;
>> +            #reset-cells = <1>;
>> +            #power-domain-cells = <1>;
>> +        };
>> +
>> +        camcc: clock-controller@ade0000 {
>> +            compatible = "qcom,sm8650-camcc";
>> +            reg = <0 0x0ade0000 0 0x20000>;
>> +            clocks = <&gcc GCC_CAMERA_AHB_CLK>,
>> +                 <&bi_tcxo_div2>,
>> +                 <&bi_tcxo_ao_div2>,
>> +                 <&sleep_clk>;
>> +            power-domains = <&rpmhpd RPMHPD_MMCX>;
> 
> When you test the change on a particular board, do you get here any build
> time warning messages like this one?
> 
>    clock-controller@ade0000: 'required-opps' is a required property
>        from schema $id: 
> http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
> 
> I believe it's a valid warning, which has to be fixes, and as it says it
> corresponds to the required property exactly.
> 

Thanks Vladimir for pointing this issue. I will check about this warning 
and will fix this.

Thanks,
Jagadeesh

