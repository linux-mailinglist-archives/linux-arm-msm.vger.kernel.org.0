Return-Path: <linux-arm-msm+bounces-58744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4662ABE004
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 18:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA9534C1513
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 16:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF311DE2CE;
	Tue, 20 May 2025 16:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ls9reJSI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB3922B8B1
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 16:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747757327; cv=none; b=Byqan+c/z48EsrRlOOJmv6oiCmw84LuykShzRO024i6vOUve3K9ZXO4NauaNVnNhP21GZgLqvSKQ82cTC/KI8GfjN30oko4/kxR+GybCYsatbIJ2uGnvMNuczPLSup4nz0u2YKzblm1XanG+g/wS/7kFrNGvPe5/GntkNTl1la0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747757327; c=relaxed/simple;
	bh=wYTaVwvNsbAu2UjkeaZU968DhSOzxXgvk2nExcpMZ7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UzLfmNFhX5Ield7MT7IGYnORRoFPGBAxXa0VhvwrbTLJYYmdVG2E4eUfOVgH8+U+9PPLxfY1lq5Uq3QsKtE9XvElzSe1ExrqLbI/A7o/nqGwDRqgHfSJ+4dG5MxrcksRoNr0sD24Tehkqs+BIL4dHHsvBmgrnFaiWE/yPOkbSqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ls9reJSI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KDo256018549
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 16:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZNBYPSDwYBwcL0JlUFsjFsIcMrNE3FHeUbnIgo/55M0=; b=ls9reJSIc0Ps1nQY
	X6+XHEewVfzKWf+aglBFzyw+7OddUtb6MPYGZ9flKuW/4FvbRW02V8u19R6r7oqO
	s+c2ya58YrsNTzHsmpTuap/no0YT/so4QVwUlJjqj8GbPG5WfEgEh7yXwW+ML+MZ
	9koRM1/MAR4741n8D+iw1ltdbwrkwt83XfqfZwVVuVKDx617Akwebml1UmJaWfgj
	DyibvQ/L1ky+e0ckVYoilFG2OvHXWNQnRKnA0No2IwFzri8OuwpjZ5VO/W8CLPBC
	5iPZBMMtC2LHgz0Ng8IDIlrNEBwvvZ6t1v+VSnbDpGFq1mu0TIIiyCveJx32M9pV
	nll/5A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4r5vs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 16:08:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f0c76e490cso14840046d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 09:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747757323; x=1748362123;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNBYPSDwYBwcL0JlUFsjFsIcMrNE3FHeUbnIgo/55M0=;
        b=MhUk2r2V9dCXOdR1mFhMlCkVBCXDh7FPMPDjsI0eg5HpuJMUP3QCLbH9gf8WYZsmr8
         L0QJ+5q7KtWoazfriO/v+GLCznvsuauxnhWMuI0kGPO0St9i3ZnsUbcSXnkDd18Fjh7L
         JtFeMH/8vtbnBseqzeIbxIdsCHooT5JAPLx26iRVbc99ybPuELl5bfBiY6mQUqoUjK1u
         TCXOUi80rBpck132tz/8YdBByF+8v9Xlzqq/ZU+YC4aSWkw5hu15rgFKqd2St5f3DAlH
         3yjaZLjDoe2NWHQNDVM+l62Gl6JKwfdzlQb0n1jESwxC9rvsfyURiOKcdcKFGuhAbAvn
         O/UA==
X-Gm-Message-State: AOJu0YyL1BAZ4mFhzaoO+ehr6O9SfLn9sv0pc8IsIgJ3jxxYcDTxybWa
	pMFpLvDma3w8GtYSkIlbojZpll3Kdvi2mL4VDMtyLQNHIE+BOz0LRX9wsvSWSp50QVq3ajz/Qo0
	lWcwOIqfayzm/sQ53c0PYSXnSoEjwuieM695O+4h+las1MFh7bd9x0u+lLeKOTwranCAm
X-Gm-Gg: ASbGncvSliEhypX7n8WUEfX/53viZki8eZ//BfLWhDeDqG1mWCMaw/e2kC5TjPWHpzZ
	R/QrBoFjVreEgweQvmA+9nqfpzdSp5ntrLFWfWYtYMPrExc3LHEsnAl3O0UufJ63vhI9SM5AsLe
	s9FBDifGn+r8OvUWse5+HiSMd8n3vV9LBYrm9TPpCWaQTtnYC5YsJrNWf+eMTp75cu8Bc1K3a/Q
	84d3fIUc9rlfKbrWZLXEW0S1ZIyaYiXPiZDqlU8SVpqEU4M/ImM3pge9RWgyNAC60B/bEUGDgq/
	DukDZoEZFskkLz7JLb46ZR1G84M7P5Y3VLXMSp1eFuQRrqvdtfwuumhYIOXstiwGZQ==
X-Received: by 2002:a05:6214:48d:b0:6f8:af9c:b825 with SMTP id 6a1803df08f44-6f8b0881b2bmr101922326d6.3.1747757323160;
        Tue, 20 May 2025 09:08:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvxo25X0xwc+Sia4cHOSRvAs8I2RKXQTr31HG6wPXMbAy/2Bmn5DJMjpgKZAqen7UvAExheg==
X-Received: by 2002:a05:6214:48d:b0:6f8:af9c:b825 with SMTP id 6a1803df08f44-6f8b0881b2bmr101922106d6.3.1747757322446;
        Tue, 20 May 2025 09:08:42 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d437585sm740241366b.115.2025.05.20.09.08.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 09:08:41 -0700 (PDT)
Message-ID: <898a2204-f129-44d0-9f73-74370524112c@oss.qualcomm.com>
Date: Tue, 20 May 2025 18:08:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sa8775p: Add CCI definitions
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vikram Sharma <quic_vikramsa@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20250514-rb8_camera-v1-0-bf4a39e304e9@quicinc.com>
 <20250514-rb8_camera-v1-3-bf4a39e304e9@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250514-rb8_camera-v1-3-bf4a39e304e9@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: H_a73JnU7XUVvY3OUDifyT4pmq55L51a
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682ca90c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=IC-rWu3oLdSMw__OBeYA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: H_a73JnU7XUVvY3OUDifyT4pmq55L51a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEzMiBTYWx0ZWRfX7HALeqLolRbf
 XQUeK8RID9t2wulWwCcu7dtY7r8oSzw8oKL3OBmPii4qcKrdp1vSmVjjsKZeSHtQ6EnEmyUJhRG
 RbfuDm+hvEKO2fl/CKMpbFXKJLARVvjNuap8G7IE2BnGwEuyw3hqhckDZyAR2H1P6rpDuIAGD4Y
 dHqjdMJOywGG/agLM6zSjVh5wTmwEy3ciyOeM6RJyMJ4YOP0GvFjnNqOf+EVPrAyJgGBG92Cknx
 68zucR3DX83mVwJwvVcT48OaXp0lE85+whDhGa2t2AA5M+Xyjpu0MDBQTOgPx97oGaQPBtYUD52
 rNnoG1+hR9a5sBR4mdM6Q/+ITloJiQY3v2FBMxjnYHZXm4vZHoiQyMaMlOKrcj2aCbhSNbTCAd/
 KBY59LzYgnQZortsgFeloOcRiWptWaOiVIXTzDKShsSn1lyTYAKvEjvLUxanC5gkYT0ItoYf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200132

On 5/14/25 4:40 AM, Wenmeng Liu wrote:
> Qualcomm SA8775P SoC contains 4 Camera Control Interface controllers.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 268 ++++++++++++++++++++++++++++++++++
>  1 file changed, 268 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 9a8f60db87b1afdf16cf55eb2e95f83eb45803a5..a867694b15b307344b72041e972bae6e7543a98f 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -3941,6 +3941,162 @@ videocc: clock-controller@abf0000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		cci0: cci@ac13000 {
> +			compatible = "qcom,sa8775p-cci", "qcom,msm8996-cci";
> +			#address-cells = <1>;
> +			#size-cells = <0>;

put these two above status, please

> +
> +			reg = <0x0 0xac13000 0x0 0x1000>;

0x0ac13000 so that it's nicely paddded to 8 hex digits

> +			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_0_CLK>,
> +				 <&camcc CAM_CC_CCI_0_CLK_SRC>;
Only CCI_0 and the SLOW_AHB clocks should be necessary

[...]

> +			cci0_0_default: cci0-0-default-state {
> +					pins = "gpio60", "gpio61";
> +					function = "cci_i2c";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;

Please set your editor's tab width to 8 spaces

Konrad

