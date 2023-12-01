Return-Path: <linux-arm-msm+bounces-2883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D22800C53
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 14:40:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 743C9281B63
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 13:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B397038FAC;
	Fri,  1 Dec 2023 13:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OzchKt2w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2A5210E2;
	Fri,  1 Dec 2023 05:39:56 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B1AZ2vk028341;
	Fri, 1 Dec 2023 13:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=1LSvee1+eGudj7FevY2ut2VZM4EJlkixxNXvgdxdDAU=;
 b=OzchKt2w7Y1LpmkLATfoWg+EMLyGlD3iRbn4cMfFDCRrd5/qV/Ogns1xI4FGhz/Gm2tD
 rhtv+xT/hOi2eC71nPc0WTIwoAzA91biloiOr4jmkfIPfpWtOgxEhJ/RK5ZIbDKsqU39
 f720FjcFkDNddHCzx+6jTPNfu5yQmSUFYTG7pm+EULglU/BqC+5pcrlYETqRPrBHdX0N
 rccs0O8HK3vQBshcYbCrQXhirAkCp9VfxjUbI+OY2bPQf8CTCU7R2Dtb0ej3lCMvWcer
 w3J2KHzQ4nG/rdc9bgukpSZKhFf44/ZHbs93H6JtMXegzy+NpYhQqAQTWel5Is45ORiS dw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uq9hyh5ky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 13:39:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B1Ddqss007245
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Dec 2023 13:39:52 GMT
Received: from [10.216.10.184] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Dec
 2023 05:39:48 -0800
Message-ID: <7c807cd2-8292-435a-834c-43dc218bb9ff@quicinc.com>
Date: Fri, 1 Dec 2023 19:09:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5332: add missing properties to the
 GPIO LED node
Content-Language: en-US
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20231025-ipq5332-gpio-led-v1-1-0f0f52617648@quicinc.com>
From: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
In-Reply-To: <20231025-ipq5332-gpio-led-v1-1-0f0f52617648@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kBMIsaJzNVMjh8cZqI5aE2HjygyBZRsY
X-Proofpoint-ORIG-GUID: kBMIsaJzNVMjh8cZqI5aE2HjygyBZRsY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_11,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=842 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010093



On 10/25/2023 7:20 PM, Kathiravan Thirumoorthy wrote:
> Add the color and function property to the GPIO LED node, which are
> missed out in the initial submission.
> 


Gentle Reminder...


> Signed-off-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
> index 4870cdb764d0..b37ae7749083 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
> @@ -9,6 +9,7 @@
>   
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
>   #include "ipq5332.dtsi"
>   
>   / {
> @@ -39,6 +40,8 @@ leds {
>   		pinctrl-names = "default";
>   
>   		led-0 {
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_WLAN;
>   			gpios = <&tlmm 36 GPIO_ACTIVE_HIGH>;
>   			linux,default-trigger = "phy0tx";
>   			default-state = "off";
> 
> ---
> base-commit: fe1998aa935b44ef873193c0772c43bce74f17dc
> change-id: 20231025-ipq5332-gpio-led-cd157e81d7b0
> 
> Best regards,

