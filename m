Return-Path: <linux-arm-msm+bounces-32732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 030B6989A5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 07:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C24D2828A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 05:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E5CE148300;
	Mon, 30 Sep 2024 05:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CKHdVomb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE222D7B8;
	Mon, 30 Sep 2024 05:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727675860; cv=none; b=kDEAElovZIalLE/0+khL82h+iMsmj/0KsmWOMLP6H9xCtcyqvBb4qb3iLQewuPUHpgqgWjTs+vsmdf+kR5UZ9XBaiarKz3E3lgB3nnyBi2dkFG6VBnWqmCQJ5vragUG6oKG+bjxbXr1uokHinaCff2rufBs6CBDAi0aDQglmfnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727675860; c=relaxed/simple;
	bh=olHHtOUYKJ4+dKSHsGlVo3M7l/oRSgnwW/o68xo6bEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PG64h4oAjeWwwsFXaT9YkeY1caBqir2J8pN9FLaA1COcQQnLX+FmUiWfwhR+GmvX2tL4hFf5PW9DgNDFTcpmSby4+iH/b5reQtU3GqRfdb6Um4hullyD/u4WICfF3ErUahXItCLdOmTruKvD+iXDF6nxJ/gAX32OtlOXK6i1FDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CKHdVomb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48U0rVcb001985;
	Mon, 30 Sep 2024 05:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mFYit8cSvR8FTkzXPIxY4RaSog6d/tfpTQTiPM3KVXE=; b=CKHdVombCG58ddK7
	LWUrust0A7dKoMM5+BHn8NOIPJtdETYEPLI5WBLDUT5xmb2JdX4IeXoUDHq+lZCv
	yBAuD7o8T/B+peuwpVEabPVANqxo+8T8iX1HCq3sAfsB57bQRL6DYENp4pxtU8SL
	k+L1/2sSzXGcQVLrNY99TrLm6lr5mB6/u2sU3adfEOJeDFTGwmsYkl4CQ1IemBUo
	tdjoxqSwBfs8LDZ2Kk13d42eBaQtckX8bo97Eanu2QVUO2qapF4fKhCtKrZCL3o5
	8E7Ec5VFZwt0ie3FVs1PTtFWIfVRbLJSk/PJbrS4JlRCJWMg7a4tBsaK6Iz1egvn
	SnrXAA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41xte0tc9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 05:57:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48U5vWZs015794
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 05:57:32 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 29 Sep
 2024 22:57:28 -0700
Message-ID: <a5540676-9402-45c4-b647-02fdc2b92233@quicinc.com>
Date: Mon, 30 Sep 2024 11:27:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8550: Change camcc power domain
 from MMCX to MXC
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephen Boyd
	<sboyd@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
CC: Michael Turquette <mturquette@baylibre.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20240927103212.4154273-1-vladimir.zapolskiy@linaro.org>
 <20240927103212.4154273-2-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <20240927103212.4154273-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 84h45fEDulEb0hxbZ88H-63PSBOg33QD
X-Proofpoint-GUID: 84h45fEDulEb0hxbZ88H-63PSBOg33QD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409300041



On 9/27/2024 4:02 PM, Vladimir Zapolskiy wrote:
> Any attempt to enable titan_top_gdsc on SM8550-QRD fails and produces
> an error message that the gdsc is stuck at 'off' state, this can be
> easily verified just by setting cci0 status on:
> 
>      cam_cc_titan_top_gdsc status stuck at 'off'
>      WARNING: CPU: 6 PID: 89 at drivers/clk/qcom/gdsc.c:178 gdsc_toggle_logic+0x154/0x168
> 
> However if MMCX power domain is replaced by MXC one, it allows to turn
> titan_top_gdsc on successfully, even if MMCX is remained off according

MMCX is absolutely required for Camera Clock controller as it is the 
main power domain. The access will not go through if this domain is not ON.
While I agree that MXC is also required to be enabled for GDSC powering 
up, but the below is not the correct way to handle the condition.
In your case the MMCX could be left ON in hardware and that could be the 
reason for the access to go through.

I am currently working on the necessary changes to address these 
conditions where a clock controller (GDSC) has multiple power domain 
dependencies.

> to /sys/kernel/debug/pm_genpd/pm_genpd_summary report.
> 
> Fixes: e271b59e39a6 ("arm64: dts: qcom: sm8550: Add camera clock controller")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 9dc0ee3eb98f..5c07d1b35615 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -2846,7 +2846,7 @@ camcc: clock-controller@ade0000 {
>   				 <&bi_tcxo_div2>,
>   				 <&bi_tcxo_ao_div2>,
>   				 <&sleep_clk>;
> -			power-domains = <&rpmhpd SM8550_MMCX>;
> +			power-domains = <&rpmhpd SM8550_MXC>;


>   			required-opps = <&rpmhpd_opp_low_svs>;
>   			#clock-cells = <1>;
>   			#reset-cells = <1>;

-- 
Thanks & Regards,
Taniya Das.

