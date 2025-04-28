Return-Path: <linux-arm-msm+bounces-55904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 703CAA9EE12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 12:37:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBDA017BA4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 10:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E6425E81D;
	Mon, 28 Apr 2025 10:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Xp95rsQ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ACA59B71;
	Mon, 28 Apr 2025 10:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745836617; cv=none; b=Ew5yvVprUr2P9i3jN3XO5WrQ1eP/6LEZNImqGDzcoc3fiQ8pXJ4kPn606J0ruMNoe+iWtZ5dYBYzckwC4FOpKck3WcXbWwVBjCrDUhkt23w9Kj1/xQKXHFEhTOsm2DRB1+2R3KdC+JOMC7ZgIoaqqdflqDoDn59xZSdFk6kbHGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745836617; c=relaxed/simple;
	bh=5xZWIpSj7T2TrOc46hv4H6Hq8dZebkzOqBK8q5CjadI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=K1QVXm5nvgHdkOREFe6brNtcc2rinKbtgzONf8o4y+A0W/Z8cOpCZTuxDsWzW0AYjMMxStIZkORQpDqaa47nORJOiJjqN4r9+l6KlPIUFxiST4M/4b3vPGSyyLvF8OqIRf4c+bCDfUJUcZDOsPE0hj8fpevLuim1Kl1+h6OT7hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Xp95rsQ2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S9Wm14009160;
	Mon, 28 Apr 2025 10:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F1HkKUPNS7hZJU8d8InbwvbJkCoN0HuyUp85usSCUm4=; b=Xp95rsQ2aU9HwFNw
	hBQPFi13LMjuxa+ICBvhwcYKbpTOP9m9H/dZtImm+xva/0EfqiWdKacd51muJP/8
	TUd5CeWRzz0d+UIFoNVIM1VVZdXeCjULIGMb+oIxW+qYzu7RBX/IPBoFsXii6mVE
	8nzLROSiEZNRT2GunZxZOx6SGe/zlpD5vWJMx0sR4yvw5NYhiOH+5ZocSxwc6URb
	5iw4EZJXJsuaV+3jNjgCyprejZzjRvG5N0UrrOFXx/k/aSv+c624+mbTM93jFnY1
	yqHFabJtAWjbNBxqzSCuTjUBY9erWVwwuAD90rVPk6XmKt+BgMq5hm8VWOrtWWLP
	8dITkA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rsb7set-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 10:36:51 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53SAao0X003874
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 10:36:50 GMT
Received: from [10.216.32.231] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Apr
 2025 03:36:47 -0700
Message-ID: <440646ce-f213-47d1-9cb7-799bb53654a2@quicinc.com>
Date: Mon, 28 Apr 2025 16:06:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Add GFX power domain to GPU
 clock controller
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Johan Hovold <johan+linaro@kernel.org>,
        <stable@vger.kernel.org>
References: <20250423-x1e80100-add-gpucc-gfx-pd-v1-1-677d97f61963@linaro.org>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250423-x1e80100-add-gpucc-gfx-pd-v1-1-677d97f61963@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA4NyBTYWx0ZWRfX4STljNqNMVs8 nt+qq2vVgfVevEjKkMfS7JL8DdPuo2mHI+RJHCrw2OG14jseTNyi4fjQ//Km5WoCUIS35zC2KMS RjzqMJFl/f3qivPoeQw6Zkh1jFKZ3G5y1W3WYN2eZQRJ9qHDQrQW4B/Aw/g/KPrDLqnArJelF5f
 Ml1d0xYuJ0CYKat3H0dHOlDnslKOWRsp1oqKH8c8PFG8ilA1y4rGJOyJIG2TPJLk9DGklgKQncT xBCjtRU1xTZcsj8qWd6aQGYuZQQyExwzASmSxoo/B6G/QLco/lADGrrbVnU61CIKezKDDqyiz5z kOXzWqBp4MScZwPID0Y+T3aXsYOVfenvzihWMKZKG6Y6TJVC/UNvjMCa7+q/ZTggY89v8XPudfE
 cjd41X86ZN8Raq09+vp9n3vaPCB3D5Ar46NJS8tVv+YQJZi6J4iObO0UVXWHNjs0gkp5rCVi
X-Proofpoint-GUID: bleqPQKZ2krpHoBR8XBMiHh9GZy_6Fio
X-Proofpoint-ORIG-GUID: bleqPQKZ2krpHoBR8XBMiHh9GZy_6Fio
X-Authority-Analysis: v=2.4 cv=I8ZlRMgg c=1 sm=1 tr=0 ts=680f5a43 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=OAQdAbk7mVvMq5AAs9IA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1011
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=749 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280087

On 4/23/2025 6:28 PM, Abel Vesa wrote:
> According to documentation, the VDD_GFX is powering up the whole GPU
> subsystem. The VDD_GFX is routed through the RPMh GFX power domain.

No. Majority of the area in GPU Subsystem is under GX domain and the
rest are under various other power domains. IIRC, most of the gpucc
block is under always-on cx domain.

-Akhil.

> 
> So tie the RPMh GFX power domain to the GPU clock controller.
> 
> Cc: stable@vger.kernel.org # 6.11
> Fixes: 721e38301b79 ("arm64: dts: qcom: x1e80100: Add gpu support")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 46b79fce92c90d969e3de48bc88e27915d1592bb..96d5ab3c426639b0c0af2458d127e3bbbe41c556 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -3873,6 +3873,7 @@ gpucc: clock-controller@3d90000 {
>  			clocks = <&bi_tcxo_div2>,
>  				 <&gcc GCC_GPU_GPLL0_CPH_CLK_SRC>,
>  				 <&gcc GCC_GPU_GPLL0_DIV_CPH_CLK_SRC>;
> +			power-domains = <&rpmhpd RPMHPD_GFX>;
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
>  			#power-domain-cells = <1>;
> 
> ---
> base-commit: 2c9c612abeb38aab0e87d48496de6fd6daafb00b
> change-id: 20250423-x1e80100-add-gpucc-gfx-pd-a51e3ff2d6e1
> 
> Best regards,


