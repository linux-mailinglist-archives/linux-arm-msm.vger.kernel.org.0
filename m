Return-Path: <linux-arm-msm+bounces-49306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E14A44056
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 14:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B8F1165299
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 13:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A02CB2690D1;
	Tue, 25 Feb 2025 13:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y68DGfYD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263A926982B
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 13:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740489054; cv=none; b=hQmfA2oxTZKewxP1m1wIKiQlMqhG04YUAA09IKZaTKZCH8XXLVnfGASDIfgMV9/F+Cj2pjfjoxwkH1DQYNyUz0BtQpO5YQK4Wnh1pBZ3OY9ThGw2UdkPfdYzWAfm8Cwh/3RvibaMrTay4Jxzc3zPtYzoQ6H3YFXif0jUP8v6GdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740489054; c=relaxed/simple;
	bh=yx0DiXFYi2E0RAolLE2o02wku5Alo0N6dJAKu3gpUDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ShweaEnVU7xzrRuRnq/ore9/Ax29cGx6OQUd6I6NjrGtDavisyat4PXTaYIgWdO5WAdxbZqW2YoCvuGGkJlzDTOMSP00bHD2C5AJyJChGI/zfOhPFu9m/UD12MV9gshVarSDPlvEjCPWutrfLf4+z2X07si6RndbdD608rxg6ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y68DGfYD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8e1xa009176
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 13:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ygYBZ9DB9YSUCjV3ts2cfjtg+adg0ivMA3fujfqgrNg=; b=Y68DGfYDj77qcMi/
	2zsZ9HbdnbaJtJBwogbovVpvx5PL2FfTM6m/9CP6Y3reVov7bO7IGYiXgOcZbMPy
	IHLXWgi3pWlEzDd/tLKl6oprWdUWAC+EpMHSqZyV7D7Q6AwSfCOr/Yt9jiZMyiL5
	Q0D/LwQ+7/aCd8XPOc9HMpMNLhcS02cYhuRQNY2YpmzFb4//9ErBePNtEPWqFmUM
	UfgoeXZrmwSfUpmMv6lIvnOw2PwCUIMdIxyMYvywsZ6295g45Hnzn9vV6EzZv0Zt
	JSVmw0bwm2G68C/kVpTQYQ4NNq6bwF6/ui3/5Q3U403MyySCdLLD+xgU/aFql3SP
	W2mRPw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y6y6rx4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 13:10:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-471f426fe28so8014761cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 05:10:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740489051; x=1741093851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ygYBZ9DB9YSUCjV3ts2cfjtg+adg0ivMA3fujfqgrNg=;
        b=dArBJn00zraOaHuKaGxjL+be4fIEs8+bI+ejzt0BskLbtKa11troWbjtXWZcNkZ+s5
         6CRCuwA3X9YzgBWzsC3oOdupYxKWY7v+V/7FZtGc0mUWGyFRejlRvGjksWf0KmIwiLmU
         deQQ/4lns80hhqRpN2VUrK/qDtCNNGt13blT2391DRiKsXZchqshfIp1U2Z53E2uVjcB
         W/ntmcJTsn9C9oX2ZokWQC8ayX4JIQzDXJljkRyFCXXZBz/Ie+KQ48Uvnd1TT5NC/0eG
         9hhhObvPPDjd+uhIlbMmPldInv3oHq0v0hwMGYnosTZvIEzcJP+Tsoiyb7ocwSUaUGRa
         c91w==
X-Forwarded-Encrypted: i=1; AJvYcCWLaGr65fgedU4OOZf3GupTkc1JPxzdsa9d6IupVT38rQ82r5ugRvPE4YJV6zkxlkmyDjgHgskpvVvjNQof@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/TvVlJf0A+So92ldWvzqU9Yul+O8+XL3eSenFoOfiaK1AFGye
	cZeMC0xOPciR4TMT4fNNM3P+IYyCoTjuqajP5Q5ESQGX7WHDZ/eOvCGIgy2PwAKu0rZTZFsSRvn
	x5BTa+DKxvXHIZwXNfdB880JXVery1UhVxZIdpDNjZJvzF+8vr5IBMkIR4dywrvhr
X-Gm-Gg: ASbGncuHxO0BqZLu2zf6jZT2OEyZ4a0S1Zke/UVdmrxa+Eeom/xhUJLnxb/UWX0fqVc
	c5IHRF9dKDSVkKHZmJgmhHURlZrF4gpQHHKtgaxoJ9DPSLkHvL0hR83ahVzi8fl/RsBPP/nl86D
	JxIQgpdoO7MzTqh8UlydR/qwfH8XUsMMn0PT+GlWg1RmDGScT9gILGu2mAxLNdA+6GPHPWkrzn7
	tDRQBhw9rPUFY62XwKozC5+50kwraX5aXK5uJZTgJIdCbWH3RHjeu6oH+3t/TMkUiS0Vd5BzNTM
	vnCH1Jfotq01g0/dDrjhEu6ozErLRF6h9aUPG6+Zf4XyzHM2EX+x/ogzcIK1XsfNE+okqQ==
X-Received: by 2002:a05:622a:494:b0:472:801:3e6f with SMTP id d75a77b69052e-472229771b8mr97835271cf.10.1740489050903;
        Tue, 25 Feb 2025 05:10:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0xw03/W+6JbMalKdB3Xj87E8H+dMaQ9tekePz+MT52R83K55h5CarFRLbuABJFco6rOWFow==
X-Received: by 2002:a05:622a:494:b0:472:801:3e6f with SMTP id d75a77b69052e-472229771b8mr97835081cf.10.1740489050525;
        Tue, 25 Feb 2025 05:10:50 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed20122b0sm140606566b.107.2025.02.25.05.10.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 05:10:50 -0800 (PST)
Message-ID: <6600a115-a935-4d21-996f-e2251777fecb@oss.qualcomm.com>
Date: Tue, 25 Feb 2025 14:10:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI to
 DP bridge nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-8-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250225121824.3869719-8-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kGEs3gGih2xPrFLgrmB1DTOsmiS1XSwL
X-Proofpoint-GUID: kGEs3gGih2xPrFLgrmB1DTOsmiS1XSwL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250091

On 25.02.2025 1:18 PM, Ayushi Makhija wrote:
> Add anx7625 DSI to DP bridge device nodes.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 136 ++++++++++++++++++++-
>  1 file changed, 135 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> index 175f8b1e3b2d..151f66512303 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> @@ -517,9 +517,128 @@ &i2c11 {
>  
>  &i2c18 {
>  	clock-frequency = <400000>;
> -	pinctrl-0 = <&qup_i2c18_default>;
> +	pinctrl-0 = <&qup_i2c18_default>,
> +			<&io_expander_intr_active>,
> +			<&io_expander_reset_active>;

Please align the '<'s

>  	pinctrl-names = "default";
> +
>  	status = "okay";
> +
> +	io_expander: gpio@74 {
> +		compatible = "ti,tca9539";
> +		reg = <0x74>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <98 IRQ_TYPE_EDGE_BOTH>;

use interrupts-extended, here and below

Konrad

