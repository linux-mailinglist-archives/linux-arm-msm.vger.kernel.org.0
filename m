Return-Path: <linux-arm-msm+bounces-23129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ADB90DBBF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 20:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 311661F23377
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 18:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 359B415ECCD;
	Tue, 18 Jun 2024 18:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OHhlhrBV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A14166317;
	Tue, 18 Jun 2024 18:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718735909; cv=none; b=sXryqxl01EGwny1xzNUT1k1njyHHE/Q/JQn5wRFlsBTw8kBijMoaW06EpZW+ZZSgq9oWZBJzjXovg/M40K1Tf8NtO3c3q8fBeoiGfvLU1lLKb9xypSg6MMslq2p9Dr1WqE/BsoEoGnFhIhUIdGClQg8Yo+5AroPQvexFDH2oxL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718735909; c=relaxed/simple;
	bh=6vafE+NNpVQtd0n++Rsd3ICmN32Uzta329jfAyQTRl8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u2EZczqhQ3okxhgubbkMHR6DVC2q4CucnWZqOuSm1booGjWH8TmjEesMVlqeUwPIX6CNeXYsEGLvGfZoqtY7OUIGF/kd/1lyUE/aVqpheJEDVc1fWxuiNPSsaioAdTSFa2pacCI2CGYDvYHm27BEx0akHD71DmMvdBPouNidFPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OHhlhrBV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ICqkDd006229;
	Tue, 18 Jun 2024 18:38:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hzJDQuddYS+nIuxMYXY3l1iu
	roExK2HuuOngnKTN9oo=; b=OHhlhrBV7Sx4LXFm8LfK3XfN/ANxDhJTYWmIZuBc
	Z5X23MWAil8xNCKgmCcVYS79wA834/rBWefMuAK/+YCx0kbYKi/wbsW4ZiQNdrJ9
	U/7wXtRr/5sY1pRdSrq2rMeVTBOfpTJquPsa7qQpU5toHBjIZ6FdM7m7ENEJbv02
	VyN95dvzEUMokeIto6/LDz/WbALpCxXhYgNgYjrpxHHriudmLSGu8fCC0D6HucKF
	J7PHifJ9gVOaWiPpXyOhWsyEcAgufSy+cPtXh44RFpQCOTFtIOJWR847l5DLrx8+
	AY1RlRdUgsb2GHiG292h+0KCFShSY8s7n9eptnu1jEOlSA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuamp0v70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 18:38:22 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45IIcKxF008425
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 18:38:20 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Jun 2024 11:38:17 -0700
Date: Wed, 19 Jun 2024 00:08:13 +0530
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Komal Bajaj <quic_kbajaj@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: qdu1000: Add secure qfprom node
Message-ID: <ZnHUFVFKTP+74Iie@hu-mojha-hyd.qualcomm.com>
References: <20240618092711.15037-1-quic_kbajaj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240618092711.15037-1-quic_kbajaj@quicinc.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JzvoszPKtuzs-LwUahTW8hPU2ARboyyv
X-Proofpoint-GUID: JzvoszPKtuzs-LwUahTW8hPU2ARboyyv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=776 lowpriorityscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406180138

On Tue, Jun 18, 2024 at 02:57:11PM +0530, Komal Bajaj wrote:
> Add secure qfprom node and also add properties for multi channel
> DDR. This is required for LLCC driver to pick the correct LLCC
> configuration.
> 
> Fixes: 6209038f131f ("arm64: dts: qcom: qdu1000: Add LLCC/system-cache-controller")
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
> Changes in v3:
> * Addressed comment by Konrad
> * Added Fixes tag in commit message as suggested by Dmitry
> * Link to v2: https://lore.kernel.org/linux-arm-msm/20240612063424.2494-1-quic_kbajaj@quicinc.com/
> 
> Changes in v2:
> * Minor correction in commit message
> * Link to v1: https://lore.kernel.org/linux-arm-msm/20240607113445.2909-1-quic_kbajaj@quicinc.com/
> ---
>  arch/arm64/boot/dts/qcom/qdu1000.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
> index 7a77f7a55498..27f9fc87079c 100644
> --- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
> @@ -1584,6 +1584,21 @@ system-cache-controller@19200000 {
>  			reg-names = "llcc0_base",
>  				    "llcc_broadcast_base";
>  			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			nvmem-cells = <&multi_chan_ddr>;
> +			nvmem-cell-names = "multi-chan-ddr";
> +		};
> +
> +		sec_qfprom: efuse@221c8000 {
> +			compatible = "qcom,qdu1000-sec-qfprom", "qcom,sec-qfprom";
> +			reg = <0 0x221c8000 0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			multi_chan_ddr: multi-chan-ddr@12b {
> +				reg = <0x12b 0x1>;
> +				bits = <0 2>;
> +			};

LGTM, without this change, LLCC driver for QDU1000 will result in probe failure.

Reviewed-by: Mukesh Ojha <quic_mojha@quicinc.com>

-Mukesh

>  		};
>  	};
> 
> --
> 2.42.0
> 
> 

