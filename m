Return-Path: <linux-arm-msm+bounces-26232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8F4931A9A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 21:01:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCD211C21526
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 19:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C161E69D31;
	Mon, 15 Jul 2024 19:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PrZ5EbyL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7F731758;
	Mon, 15 Jul 2024 19:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721070087; cv=none; b=plWbBTkGgTkLzQMrYYDg62OhEHv1Q9pSMRdeApSWQ8l5GagEphKeG0ApkyaR+ovARwUXz8XZgWbzPERjb4WgJ58PBFhp9TOXqpr1EKrrErjpVrN9aEYwwCaVw5M69Kttj3IKHNiutfM3mhHehINpZlbgrcr6KFTll2A7SN/3EYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721070087; c=relaxed/simple;
	bh=tETW5ujn8JU+sEnKd0lnoT0ncgEvI18HxdTKYPqhOUs=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tr6ZV6EqfkPNMv8ckXKfwdA3vwzjl1his5K62J/WG/Xz/+WEv4F35jTIzHkzZO3MYyL5TxFTBnk+V0ZV6DZ8p9TtMBfOy+U5dA7PDf2DWKQKuMcSA3BlVe3IxncbQuW+twFiSaoBJPZiJLhT5dyrOzHgaTBbej8qBEQMJGCLKjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PrZ5EbyL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46FH95m8022751;
	Mon, 15 Jul 2024 19:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ewk0UvoFKLqngqU6GTlx/ZAX
	oCKVFXYpqGmXbUhtI8g=; b=PrZ5EbyLC1X+VCnG8aHQcNa6mS5UM88+S5t93hNH
	+5PBq3gzoSgvI30tGgRTztN7BLpmT1nMYM7p+DEwrvPnvDp6vRLpeNIUPkzRCnTS
	nvmnA7yGlxa1WGHAq0Hzf73YAiHDuEhFAESsG4Yf0R5WlbxArGBEAw+Lsz9QEIjf
	2PrPtch8jTGIWq7W2yKcQ1+Sb4iFs/g6I10F3jGh4Xc//52SdRpYe/B3ajJmD129
	zO6bNmZwmSS8xcPIaqxpGun9+q/oW+GAIR6p6Ra76/ctzECP7S5Q2aQUMcjhq9Kr
	SZ50h0xDyajAAh8wEAuicVDVMlUuUGwFeXSMnHXPNHfTyg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40bjv8n0j2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 19:01:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46FJ1Lsq021917
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 19:01:21 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 15 Jul 2024 12:01:12 -0700
Date: Tue, 16 Jul 2024 00:31:08 +0530
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
Subject: Re: [PATCH v2] arm64: dts: qcom: disable GPU on x1e80100 by default
Message-ID: <20240715190108.vjctytyntxlottgt@hu-akhilpo-hyd.qualcomm.com>
References: <20240715-x1e8-zap-name-v2-1-a82488e7f7c1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240715-x1e8-zap-name-v2-1-a82488e7f7c1@linaro.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yQKoq1VqebLmexHRWutYue1AkQd2HIs_
X-Proofpoint-GUID: yQKoq1VqebLmexHRWutYue1AkQd2HIs_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_13,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 spamscore=0 malwarescore=0 clxscore=1011 priorityscore=1501
 phishscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 bulkscore=0
 mlxlogscore=723 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407150148

On Mon, Jul 15, 2024 at 09:18:49PM +0300, Dmitry Baryshkov wrote:
> The GPU on X1E80100 requires ZAP 'shader' file to be useful. Since the
> file is signed by the OEM keys and might be not available by default,
> disable the GPU node and drop the firmware name from the x1e80100.dtsi
> file. Devices not being fused to use OEM keys can specify generic
> location at `qcom/x1e80100/gen70500_zap.mbn` while enabling the GPU.
> 
> The CRD was lucky enough to work with the default settings, so reenable
> the GPU on that platform and provide correct firmware-name (including
> the SoC subdir).
> 
> Fixes: 721e38301b79 ("arm64: dts: qcom: x1e80100: Add gpu support")
> Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - Keep GPU enabled for X1E80100-CRD (Johan)
> - Link to v1: https://lore.kernel.org/r/20240715-x1e8-zap-name-v1-1-b66df09d0b65@linaro.org
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 8 ++++++++
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi    | 3 ++-
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> index 6152bcd0bc1f..8f4e238f014f 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> @@ -637,6 +637,14 @@ vreg_l3j_0p8: ldo3 {
>  	};
>  };
>  
> +&gpu {
> +	satus = "okay";

s/satus/status

Also, we should add this chunk to x1e80100-qcp.dts too.

> +
> +	zap-shader {
> +		firmware-name = "qcom/x1e80100/gen70500_zap.mbn";
> +	};
> +};
> +
>  &i2c0 {
>  	clock-frequency = <400000>;
>  
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

In general, why not keep a default zap firmware listed here? Anyway we
are disabling gpu node here in case of platforms which doesn't upstream
secure firmwares.

-Akhil

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

