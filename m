Return-Path: <linux-arm-msm+bounces-26388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB75D9333BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 23:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A67D1C22986
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 21:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AADAF13D262;
	Tue, 16 Jul 2024 21:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dtCL8AcC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0181B13B293;
	Tue, 16 Jul 2024 21:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721166218; cv=none; b=gUW4pDPjbWD61mVcE8H4IDsG50NPrJXDC2787BpHqJbO9GKsu10EXofqNcs2y3QQyrIOh86qtju6xen5DGEy5ZAF67qTIorMUYxi4Yaa8/+JYt3AnUC5HXU+lWnZPHgBYPxPRbQfGUPSKgQvQy2KHgxqSrOsxK0B94sxaEPDc6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721166218; c=relaxed/simple;
	bh=MhAnG7+YTkhLH/kSpm2dScPh77afqY9HPSzAYQX4iJs=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZW+hF62kGo2P/B16BwPdELzfccCYI4wMI8sqrvNWAGnz0lXH8vvHPzjehxnRb/8/IrIAgr4HW1ZnNJPt6TV2w1LNucxKmc74PYJfqg1wnamSpDqHoae2k24LnQjIoFpOnhf/+4ziv7+Iodx+jrMXe6qMNloQNVGoIPOeBWncbFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dtCL8AcC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46GHepPc004379;
	Tue, 16 Jul 2024 21:43:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=O1FyFpbuQx+0uEPb1ylHpaTh
	K46cSqTHcpMLrHQvzRg=; b=dtCL8AcC7ynLv1J9fZhXyo5n1HG6C71kcsZIqLIW
	RmBY7KzPG12bImGN8jz+4Kzyd1rdabOrCh/dYp5lRqgNe1Tm4W07WvBeDiQ09IpG
	sLwbwnQuvBAS20N8OXABZu+J5m3JO/PilCjJ5IYmsua3WF9mSDDmIxLTeXZDjwQc
	ZP4d+Y0Wj2LqgGJ5qs6AM0fhRZLmSQsRuU8MwIX+zAfdncQeneq/OfBdWVS7TDvc
	38L0EaoKaA1fVX0CEImpGOummpk3OfH1+pCLKa9+CA5yNzMJjS9uHKgIh5k9XxoE
	+hxso16M5N1WkSI/Ty46j8RjDQFA75GQFUn04uiC2BXzdw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfp8ess-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 21:43:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46GLhW8Q005584
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 21:43:32 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 16 Jul 2024 14:43:29 -0700
Date: Wed, 17 Jul 2024 03:13:25 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: disable GPU on x1e80100 by default
Message-ID: <20240716214325.5twamhntc7hmaqub@hu-akhilpo-hyd.qualcomm.com>
References: <20240715-x1e8-zap-name-v3-1-e7a5258c3c2e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240715-x1e8-zap-name-v3-1-e7a5258c3c2e@linaro.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: thfmyJ1yk-ciL3rJGyyA-PTBLhuBo2aj
X-Proofpoint-GUID: thfmyJ1yk-ciL3rJGyyA-PTBLhuBo2aj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-16_01,2024-07-16_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=664 spamscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407160158

On Mon, Jul 15, 2024 at 10:17:44PM +0300, Dmitry Baryshkov wrote:
> The GPU on X1E80100 requires ZAP 'shader' file to be useful. Since the
> file is signed by the OEM keys and might be not available by default,
> disable the GPU node and drop the firmware name from the x1e80100.dtsi
> file. Devices not being fused to use OEM keys can specify generic
> location at `qcom/x1e80100/gen70500_zap.mbn` while enabling the GPU.
> 
> The CRD and QCP were lucky enough to work with the default settings, so
> reenable the GPU on those platforms and provide correct firmware-name
> (including the SoC subdir).
> 
> Fixes: 721e38301b79 ("arm64: dts: qcom: x1e80100: Add gpu support")
> Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil

> Changes in v3:
> - Fix the status property name (Akhil)
> - Also keep the GPU enabled on QCP (Akhil)
> - Link to v2: https://lore.kernel.org/r/20240715-x1e8-zap-name-v2-1-a82488e7f7c1@linaro.org
> 
> Changes in v2:
> - Keep GPU enabled for X1E80100-CRD (Johan)
> - Link to v1: https://lore.kernel.org/r/20240715-x1e8-zap-name-v1-1-b66df09d0b65@linaro.org
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 8 ++++++++
>  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 8 ++++++++
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi    | 3 ++-
>  3 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> index 6152bcd0bc1f..81d7ec82a845 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> @@ -637,6 +637,14 @@ vreg_l3j_0p8: ldo3 {
>  	};
>  };
>  
> +&gpu {
> +	status = "okay";
> +
> +	zap-shader {
> +		firmware-name = "qcom/x1e80100/gen70500_zap.mbn";
> +	};
> +};
> +
>  &i2c0 {
>  	clock-frequency = <400000>;
>  
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
> index 72a4f4138616..b3521ec4879c 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
> @@ -606,6 +606,14 @@ vreg_l3j_0p8: ldo3 {
>  	};
>  };
>  
> +&gpu {
> +	status = "okay";
> +
> +	zap-shader {
> +		firmware-name = "qcom/x1e80100/gen70500_zap.mbn";
> +	};
> +};
> +
>  &lpass_tlmm {
>  	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
>  		pins = "gpio12";
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 7bca5fcd7d52..8df90d01eba8 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -3155,9 +3155,10 @@ gpu: gpu@3d00000 {
>  			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
>  			interconnect-names = "gfx-mem";
>  
> +			status = "disabled";
> +
>  			zap-shader {
>  				memory-region = <&gpu_microcode_mem>;
> -				firmware-name = "qcom/gen70500_zap.mbn";
>  			};
>  
>  			gpu_opp_table: opp-table {
> 
> ---
> base-commit: 3fe121b622825ff8cc995a1e6b026181c48188db
> change-id: 20240715-x1e8-zap-name-7b3c79234401
> 
> Best regards,
> -- 
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

