Return-Path: <linux-arm-msm+bounces-42-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 862E67E36ED
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 09:52:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40CED280F49
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 08:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB98A9476;
	Tue,  7 Nov 2023 08:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hqMi2bV1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796A4F9ED;
	Tue,  7 Nov 2023 08:52:48 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 134C9FA;
	Tue,  7 Nov 2023 00:52:47 -0800 (PST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A75wFHI011433;
	Tue, 7 Nov 2023 08:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=cpEN+DHps35++P1kuffxtssKzRvHwtgSfY/C7nUiD0c=;
 b=hqMi2bV1/0ePNG1oiDOu80Yr08235K/xtTLJmSWXb+nMxoLpguDebT6/lJKr4Qopf/nB
 aOP++2ulSMT4fZojbhqEM5Msv8dowlD6AqqCv/DUqvgGZJXh+feCXvSNdc69HKNkv41n
 tft28mBmw7oGQdvztkltJwnaAwvltFMEeQgsqthqqLWfM3QkZngGMfrWS3pA3Ht/EZiB
 B6flxzmOwAM9DAytxXtMeTf1HZf2gWKhNyBfnWnpDC3cjjWvo8YwbJ2H8rfaCAUEuJ5v
 KhKRGJcaysR8hLG4+ZMba68mOmFpla4ociuhDuwcchQaW5PWZb6NW0wiL+RRZobZ/jvF Cw== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u74v31mts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Nov 2023 08:52:43 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A78qh3C009544
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Nov 2023 08:52:43 GMT
Received: from [10.214.66.81] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Tue, 7 Nov
 2023 00:52:39 -0800
Message-ID: <b0dba354-b3f0-0878-a92f-7b100a9d2137@quicinc.com>
Date: Tue, 7 Nov 2023 14:22:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qdu1000-idp: drop unused LLCC
 multi-ch-bit-off
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20231107080417.16700-1-krzysztof.kozlowski@linaro.org>
 <20231107080417.16700-2-krzysztof.kozlowski@linaro.org>
From: Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <20231107080417.16700-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0mcWsGN2o2KivsX1eDoYJQ4HV2Kzp8i5
X-Proofpoint-ORIG-GUID: 0mcWsGN2o2KivsX1eDoYJQ4HV2Kzp8i5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-06_15,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=537
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2311070072



On 11/7/2023 1:34 PM, Krzysztof Kozlowski wrote:
> There is no "multi-ch-bit-off" property in LLCC, according to bindings
> and Linux driver:
> 
>    qdu1000-idp.dtb: system-cache-controller@19200000: 'multi-ch-bit-off' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/qdu1000.dtsi | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
> index 618a101eb53a..89eff977d40e 100644
> --- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
> @@ -1450,7 +1450,6 @@ system-cache-controller@19200000 {
>   			reg-names = "llcc0_base",
>   				    "llcc_broadcast_base";
>   			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
> -			multi-ch-bit-off = <24 2>;

We should instead mention below nvmem cell property and add sec-qfprom 
node for qdu1000 with multi-chan-ddr bits information, similar to the 
example given here.

https://lore.kernel.org/lkml/20230801064025.17381-2-quic_kbajaj@quicinc.com/

nvmem-cells = <&multi-chan-ddr>;
nvmem-cell-names = "multi-chan-ddr";

Let me know if you are going to send this.


Acked-by: Mukesh Ojha <quic_mojha@quicinc.com>

-Mukesh


>   		};
>   	};
>   

