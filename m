Return-Path: <linux-arm-msm+bounces-398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF597E76E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 02:55:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1A3BB20B9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 01:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D11BEA6;
	Fri, 10 Nov 2023 01:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EjM/6UG1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FEBA46;
	Fri, 10 Nov 2023 01:55:33 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AFFA44BD;
	Thu,  9 Nov 2023 17:55:32 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AA0hZ3Q026646;
	Fri, 10 Nov 2023 01:55:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : from : subject : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=I8f9U6h678avASE+5LIilnUNQa6w5nRCNEZC/8kG+S4=;
 b=EjM/6UG1svYBwMAc6oCuf67ksAuSyKJT2U+kN108ARMMCTybD6F6+sWZ6af/RreZOvux
 HXaKyuOVRX0j47Ee2ydMUrWceIZXEoAT8/mMA7PnOHF8+hFWabE1GM1WWRTYUi/M4aJt
 t9lI43SeoVYipiVcqWvU5mcnrB+I8lvszwnlP01L0k5jFHv6r7txAXEug/BmHD/WtRsW
 +L4CCtQvOHkMH5mPInr8XE2o5qwrwm6gvdb8Rm6X7h4djmcg4UD84MpGnnFV4n514hJA
 mmQgulKgyZFJPyx+8CQcz3QmBYnQRyyH8WsqdEm/6fb8J1yB6lsY59X+fQvMwoB2NLoX Bg== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u93rbrwg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 01:55:29 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AA1tSia011838
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 01:55:28 GMT
Received: from [10.238.139.231] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 9 Nov
 2023 17:55:24 -0800
Message-ID: <9b27add9-ba04-49b0-af60-a191866f9a40@quicinc.com>
Date: Fri, 10 Nov 2023 09:55:15 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hui liu <quic_huliu@quicinc.com>
Subject: Re: [PATCH] ARM: dts: qcom: Add LPG LED device description
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_fenglinw@quicinc.com>, <quic_uchheda@quicinc.com>,
        <kamalw@qti.qualcomm.com>
References: <20231108-qcom_leds-v1-1-c3e1c8572cb0@quicinc.com>
 <CAA8EJpogiYXVPCNXSu+kq29nbn1uxGDAYMn9+qk8CwDz0bfyjg@mail.gmail.com>
In-Reply-To: <CAA8EJpogiYXVPCNXSu+kq29nbn1uxGDAYMn9+qk8CwDz0bfyjg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: l8HzW4ujkiqePDoorhTYl_kY_wYqEr29
X-Proofpoint-ORIG-GUID: l8HzW4ujkiqePDoorhTYl_kY_wYqEr29
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-09_17,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=341 impostorscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100015



On 11/8/2023 2:59 PM, Dmitry Baryshkov wrote:
> On Wed, 8 Nov 2023 at 08:05, Hui Liu via B4 Relay
> <devnull+quic_huliu.quicinc.com@kernel.org> wrote:
>>
>> From: Hui Liu <quic_huliu@quicinc.com>
>>
>> Add LPG LED device description.
> 
> No. You are not adding "LPG LED device description". You are adding
> definition for three LEDs.
OK, I will update the commit in next patch.

> 
>>
>> Signed-off-by: Hui Liu <quic_huliu@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/pm8350c.dtsi | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
>> index f28e71487d5c..11b9f384d99c 100644
>> --- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
>> @@ -4,6 +4,7 @@
>>    */
>>
>>   #include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/leds/common.h>
>>   #include <dt-bindings/spmi/spmi.h>
>>
>>   &spmi_bus {
>> @@ -34,6 +35,27 @@ pm8350c_pwm: pwm {
>>                          compatible = "qcom,pm8350c-pwm";
>>                          #pwm-cells = <2>;
>>                          status = "disabled";
>> +
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +
>> +                       led@1 {
>> +                               reg = <1>;
>> +                               color = <LED_COLOR_ID_RED>;
>> +                               label = "red";
>> +                       };
>> +
>> +                       led@2 {
>> +                               reg = <2>;
>> +                               color = <LED_COLOR_ID_GREEN>;
>> +                               label = "green";
>> +                       };
>> +
>> +                       led@3 {
>> +                               reg = <3>;
>> +                               color = <LED_COLOR_ID_BLUE>;
>> +                               label = "blue";
> 
> ... and these particular LEDs are board-specific. Please fill them in
> the board file instead.

Sure, I will add these node in board file.
> 
>> +                       };
>>                  };
>>          };
>>   };
>>
>> ---
>> base-commit: b9604be241587fb29c0f40450e53d0a37dc611b5
>> change-id: 20231108-qcom_leds-c3b0b7029008
>>
>> Best regards,
>> --
>> Hui Liu <quic_huliu@quicinc.com>
>>
>>
> 
> 

