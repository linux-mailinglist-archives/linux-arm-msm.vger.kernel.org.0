Return-Path: <linux-arm-msm+bounces-40-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6EC7E36AC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 09:31:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02CA21C209EC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 08:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5450F33C7;
	Tue,  7 Nov 2023 08:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mqtLJzxx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E75312E5D;
	Tue,  7 Nov 2023 08:31:51 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72BADBD;
	Tue,  7 Nov 2023 00:31:50 -0800 (PST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A76aV7a024670;
	Tue, 7 Nov 2023 08:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ZyOUMpJgMksPDdd8qr75Dx/OmScIish8+gXQKyaIzdM=;
 b=mqtLJzxxzdZpeP7epFxGv28RCgx+wZi2SmiuePk9WYNvfffgKHIU2RYBBTNGMbX2IhVm
 oTiIj6sihKmF+Fh19/HE2n2XNH2XD/LYYvXNIxgxFxKsEVApbsUk8m+35HHV8S30l5Y7
 52QlZpGRtCQmLeoYVEcSapvkpobAf2KByNqaNld9qtnmOLfjZQ6ZWw/Ln+jtXab/FUvg
 ZNz6Qfa5N3fR0jKsVdJ+tb6xgsVfRCE18JcYXEVEWVvWxK4i7ddwyEO/QHiLhDfv3s8e
 7hNQIZ/pboS3qNX/nyM4Wwg2HHx/QAsELF4V+kbUmbRRtinc2tY0R1kkGqn2h2X01DZ5 UQ== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u74v31kj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Nov 2023 08:31:47 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A78Vkqq000355
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Nov 2023 08:31:46 GMT
Received: from [10.214.66.81] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Tue, 7 Nov
 2023 00:31:43 -0800
Message-ID: <98eced9a-8ae5-b1b5-8765-4fce18a96fa4@quicinc.com>
Date: Tue, 7 Nov 2023 14:01:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qdu1000: correct LLCC reg entries
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
From: Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <20231107080417.16700-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: s_fkf4vpmSnR9eEB4B__MWNe8Am1aXcp
X-Proofpoint-ORIG-GUID: s_fkf4vpmSnR9eEB4B__MWNe8Am1aXcp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-06_15,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=962
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2311070069



On 11/7/2023 1:34 PM, Krzysztof Kozlowski wrote:
> According to bindings and Linux driver there is no
> "multi_channel_register" address space for LLCC.  The first "reg" entry
> is supposed to be llcc0_base since commit 43aa006e074c ("dt-bindings:
> arm: msm: Fix register regions used for LLCC banks"):
> 
>    qdu1000-idp.dtb: system-cache-controller@19200000: reg: [[0, 421527552, 0, 14155776], [0, 438304768, 0, 524288], [0, 572293416, 0, 4]] is too long
>    qdu1000-idp.dtb: system-cache-controller@19200000: reg-names:0: 'llcc0_base' was expected
>    qdu1000-idp.dtb: system-cache-controller@19200000: reg-names: ['llcc_base', 'llcc_broadcast_base', 'multi_channel_register'] is too long
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/qdu1000.dtsi | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
> index 1c0e5d271e91..618a101eb53a 100644
> --- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
> @@ -1446,11 +1446,9 @@ gem_noc: interconnect@19100000 {
>   		system-cache-controller@19200000 {
>   			compatible = "qcom,qdu1000-llcc";
>   			reg = <0 0x19200000 0 0xd80000>,
> -			      <0 0x1a200000 0 0x80000>,
> -			      <0 0x221c8128 0 0x4>;
> -			reg-names = "llcc_base",
> -				    "llcc_broadcast_base",
> -				    "multi_channel_register";
> +			      <0 0x1a200000 0 0x80000>;
> +			reg-names = "llcc0_base",
> +				    "llcc_broadcast_base";


Thanks for fixing this.
This indeed needed to be fixed, looks like it got missed after
moving to below sec-qfprom of reading multichannel.

https://lore.kernel.org/lkml/20230801064025.17381-2-quic_kbajaj@quicinc.com/

Acked-by: Mukesh Ojha <quic_mojha@quicinc.com>

-Mukesh

>   			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
>   			multi-ch-bit-off = <24 2>;
>   		};

