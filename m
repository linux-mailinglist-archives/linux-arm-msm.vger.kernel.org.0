Return-Path: <linux-arm-msm+bounces-33441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE527993667
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 20:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 945C51F21099
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 18:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A411DD549;
	Mon,  7 Oct 2024 18:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LkpzLiRC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465C81D968B;
	Mon,  7 Oct 2024 18:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728326459; cv=none; b=CzcVNum3lCFiquk+GYHKZT6dFAps5rugG4dTKcifIXzIyvpluExj0lMmFjdOvNFxqwBLhBeR8g3HxoVeLn6NKKuI8+arYdzinsNXE7/KzDmJoSt/4S0bp1AEULDUqLf0XymH1wcJCDZTdp2hU3NQIb7nwErdDZtcaPAFjgIaxXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728326459; c=relaxed/simple;
	bh=NCPKEoVgxRPcQbWhFKHJFqTVYrSV4boYUdJSJrFQUzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hTJLFbbg0X4cEpUxVOalaw/nGygAQG0aYTPdiMQfqzgbrx4zmLr2tFNH+T/cL1WOlUY9zub62p6Wd6hvUrf8kWErwCF3PIDNPdXefNW+xccmIfjFNf5kXRg2wpjop2pjEULsnugUEsaRRvG3EDUjjS4sy1wHIyRgQtv9uzPeefg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LkpzLiRC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497F4I4Y032224;
	Mon, 7 Oct 2024 18:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1z49RmxWVvAfa3H8uEeVzv87z4AY+nkNY6y36+t7HPw=; b=LkpzLiRCq9RxnFsG
	3vQQYne1N9ZX6HRfQTd3mE3N+TKa5rmCHmwrLSue7o7kCPsQ+WJ2aeTw/jqU1VKz
	3ngT4bG5cLT7INwhX8sZa0M1DgdKaZ/a+widhFz7xtOfcp2QlrWnqtXgwanrqkIJ
	0WGoSmZg5ncod8q1lh10Y4LDCscyFgS3NPc/qsNAVQMaNeXkhNSoUTzA8G/DLVdx
	xkjKU7sDYvcJbHwQZOCbCWIkBo2b5DzYBYz0nJ2DrtHNnx/uqBpSorzgZysT6w9L
	drxOg5RcdWK9BI4L6pwbDIW5pl0piLITsfDdsfFCQmJrCsGdRgv+pws4DloQEOOn
	ZC2v6g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xv8d21w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 18:40:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 497Ieo8n004317
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 18:40:50 GMT
Received: from [10.48.240.101] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 7 Oct 2024
 11:40:49 -0700
Message-ID: <181d03f6-9a1d-449f-a8af-b4d0fcc8b188@quicinc.com>
Date: Mon, 7 Oct 2024 11:40:48 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add wifi
 node
To: Jianhua Lu <lujianhua000@gmail.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson
	<jjohnson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <ath11k@lists.infradead.org>,
        Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>
References: <20241007130251.125022-1-lujianhua000@gmail.com>
 <20241007130251.125022-2-lujianhua000@gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241007130251.125022-2-lujianhua000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kYVQmj8-8toMxFjiJ-mLdgXf-4suP_9w
X-Proofpoint-GUID: kYVQmj8-8toMxFjiJ-mLdgXf-4suP_9w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 clxscore=1011 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410070129

On 10/7/2024 6:02 AM, Jianhua Lu wrote:
> Add wifi node and this wifi module is connected to pice port.

s/pici/pcie/ (or perhaps better: PCIe)

> The following is qca6390 probe message:
>   ath11k_pci 0000:01:00.0: Adding to iommu group 12
>   ath11k_pci 0000:01:00.0: BAR 0 [mem 0x60400000-0x604fffff 64bit]: assigned
>   ath11k_pci 0000:01:00.0: enabling device (0000 -> 0002)
>   ath11k_pci 0000:01:00.0: MSI vectors: 32
>   ath11k_pci 0000:01:00.0: qca6390 hw2.0
>   ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0xb board_id 0xff soc_id 0xffffffff
>   ath11k_pci 0000:01:00.0: fw_version 0x10121492 fw_build_timestamp 2021-11-04 11:23 fw_build_id
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
> changes in v2:
> 1. add ath11k-calibration-variant property.
> 
>  .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> index ebea283f56ea..7a55e271c3ac 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> @@ -680,6 +680,25 @@ &pcie0_phy {
>  	status = "okay";
>  };
>  
> +&pcieport0 {
> +	wifi@0 {
> +		compatible = "pci17cb,1101";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> +
> +		qcom,ath11k-calibration-variant = "Xiaomi_Pad_5Pro";

Are you going to submit the board file per the guidance Dmitry provided?

Note that I am not up to speed on the firmware/board maintenance procedures so
we'll need to wait for Kalle to have bandwidth to handle the request (and show
me how he handles it).

/jeff


