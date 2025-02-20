Return-Path: <linux-arm-msm+bounces-48600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E2BA3D1C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 08:10:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E707A1763B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 07:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 099511E4929;
	Thu, 20 Feb 2025 07:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fosNQizh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9961E47A8;
	Thu, 20 Feb 2025 07:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740035361; cv=none; b=fAKjMN23nBgMNcgolbjAvtTOud+bWdhUggVLPuX5ubOj0Lf5uYc47WBxeE6UTCYtOonVrP61NENYA94bGGuonfU7kQsQyv6hLprqgHCB9Sn9a81CkFJQGRmLR2KIv9fA5QuAKQV6dJQG901yYRC0Y65V2IJO9lPLLHvmUwMW7O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740035361; c=relaxed/simple;
	bh=DuHKVyAUSeH0AYeZxe02EjNiVrFQ9M67Vo/uZCOZ0Vo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=H9MuN0p7DHOiln9Oj0C9/EHYitU/aIOBNdGWlLNxTi5Q5jRn9BFICDlC0UwCexS8FmNq6YLymc+nurFXcj+Ii+OKCQ8Z4YIiV9zO/aMd+dYRgXXGgXlJubrHPczEDZvty6rmhkZLeDH7IB3NyaHEUyWZ0sC8zkEoopV6p/9Cn7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fosNQizh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K6fmgO011610;
	Thu, 20 Feb 2025 07:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jdRurz3BGPu1yPaTZwh+HKIzTOwhCAXUFtw2FUQjgpQ=; b=fosNQizhYn8vx50P
	PodEVKZEzJ2Brz3QuxloD4yrYigWzekMQtrJVgnIZFCX8H1YloaqP563cU4IYyd7
	2VIcLY8DTenuyrxWOC0F/Mkm0MrHJqnHuYn7lq4MFE5424qa/cK0qS4QjmrS8r0L
	MGLYUH+ilI1WVZ5Gmilyo15XJwA9mrCQbTvdWtZWm52X/xl6lVknRl2WUapMRiTP
	ZHVILhxZUbeZ8Wdx8YmAbeVuOMuuIzU6ROhaqOtG84yo6TiDpVtNAE9fHJOyZFnt
	y3Uw4ltDOQXAFp3VAY6/k4ICB3ZSEH6xyuWFebTF7Lkjjv45bv7q3xERtF40krFq
	TrL0hQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy3n6ue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 07:09:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51K7979m015781
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 07:09:07 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Feb
 2025 23:09:02 -0800
Message-ID: <c4f5c1fb-123d-4dd1-9885-031808f37419@quicinc.com>
Date: Thu, 20 Feb 2025 12:38:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Add MXC power domain to videocc
 nodes
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Taniya
 Das" <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com>
 <20250218-videocc-pll-multi-pd-voting-v1-5-cfe6289ea29b@quicinc.com>
 <dprxueuq5avpv3mek4kc4sy2mddydsoskqgbizi4lpyapuhg4t@zcdgm2wcsaco>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <dprxueuq5avpv3mek4kc4sy2mddydsoskqgbizi4lpyapuhg4t@zcdgm2wcsaco>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VUkyZPULRCPb9IyVEDHFvpl5aTncfrYv
X-Proofpoint-GUID: VUkyZPULRCPb9IyVEDHFvpl5aTncfrYv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_02,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=672 bulkscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502200050



On 2/18/2025 11:02 PM, Dmitry Baryshkov wrote:
> On Tue, Feb 18, 2025 at 07:56:50PM +0530, Jagadeesh Kona wrote:
>> Videocc requires both MMCX and MXC rails to be powered ON
>> to configure the video PLLs on SM8450, SM8550 and SM8650
>> platforms. Hence add MXC power domain to videocc node on
>> these platforms.
>>
>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 3 ++-
>>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 3 ++-
>>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 3 ++-
>>  3 files changed, 6 insertions(+), 3 deletions(-)
> 
> Three separate patches, please. With that in mind:
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

Sure, will split this into separate patches.

Thanks,
Jagadeesh

>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> index 9c809fc5fa45a98ff5441a0b6809931588897243..4f8dca8fc64212191780067c5d8815e3a2bb137f 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> @@ -3136,7 +3136,8 @@ videocc: clock-controller@aaf0000 {
>>  			reg = <0 0x0aaf0000 0 0x10000>;
>>  			clocks = <&rpmhcc RPMH_CXO_CLK>,
>>  				 <&gcc GCC_VIDEO_AHB_CLK>;
>> -			power-domains = <&rpmhpd RPMHPD_MMCX>;
>> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
>> +					<&rpmhpd RPMHPD_MXC>;
>>  			required-opps = <&rpmhpd_opp_low_svs>;
>>  			#clock-cells = <1>;
>>  			#reset-cells = <1>;
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> index eac8de4005d82f246bc50f64f09515631d895c99..a039ae71e1b7bba8124128d19de5e00c65217770 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> @@ -2889,7 +2889,8 @@ videocc: clock-controller@aaf0000 {
>>  			reg = <0 0x0aaf0000 0 0x10000>;
>>  			clocks = <&bi_tcxo_div2>,
>>  				 <&gcc GCC_VIDEO_AHB_CLK>;
>> -			power-domains = <&rpmhpd RPMHPD_MMCX>;
>> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
>> +					<&rpmhpd RPMHPD_MXC>;
>>  			required-opps = <&rpmhpd_opp_low_svs>;
>>  			#clock-cells = <1>;
>>  			#reset-cells = <1>;
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index 86684cb9a9325618ddb74458621cf4bbdc1cc0d1..32af2a0f7a0030f155b7d8c93faeffa384a42768 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -3524,7 +3524,8 @@ videocc: clock-controller@aaf0000 {
>>  			reg = <0 0x0aaf0000 0 0x10000>;
>>  			clocks = <&bi_tcxo_div2>,
>>  				 <&gcc GCC_VIDEO_AHB_CLK>;
>> -			power-domains = <&rpmhpd RPMHPD_MMCX>;
>> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
>> +					<&rpmhpd RPMHPD_MXC>;
>>  			#clock-cells = <1>;
>>  			#reset-cells = <1>;
>>  			#power-domain-cells = <1>;
>>
>> -- 
>> 2.34.1
>>
> 

