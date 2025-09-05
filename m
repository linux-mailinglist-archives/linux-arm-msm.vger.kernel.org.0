Return-Path: <linux-arm-msm+bounces-72277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB14B4573C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 14:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09C951BC0EE3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 12:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0D134AAE5;
	Fri,  5 Sep 2025 12:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OcFxGNNr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E243469E3
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 12:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757074078; cv=none; b=l1dX2sdgiC2zVWLrYrkRLYNFSAn8plK+yoYKoBDUQANBEo2SUX5PFjcON+XjLR7OMu8QPG5wnRcZ/Lup6jHko8FRurmsfR/iTg1V2S0Cnl/L2aJPZ72u+HZEsMs+TLjlTPVZWHvB/bGIxt3ZBQ8e2KG7I88Iqpbm/HE7puy4ThY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757074078; c=relaxed/simple;
	bh=qlohNMfmjA6RpvE7A5Xc8gTHqy7dxZ1ZxD7ony9bB2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XuM82ZqgWMF9DtB8nqBR3oH4j3qcQ2Wf2EPEjg9O4ThZJcFo0fq7jb/ZuQeSkGCGm4TJLTSFj/a0pFoA+7js5oK+5bZXLlSwXmHhwUNoTG9gZsgUbCQFASMfy+H44ve6R2D2JKbG+k0aJADe30eSMPGBLBBRv408+SP7/bg6pD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OcFxGNNr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857E3Vx004654
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 12:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2ywG7DrxAJyha9p1n1s1uGe2eRAGhfx1UZDypRxMjFI=; b=OcFxGNNrlOznCtwh
	oW0F1GgSoQZXLTjJ5VCCRB5O/5z+rVjokRTjne2CkLvlf2U3+z/3ePAoFDGAXjcf
	FXHbC0uDw24SW9cWIUpeCK+Is3y75Z41ae6kb5//rXQdnn+ELvRtc4sKa5OEs5cH
	d6/3R2AweOCRkOiyfjXbWGh9Vn2bE0MlA/mJCS3eOA1cmXZlE4gCZ2fAnGCjpQ7O
	y4G4yuqVfdmXW/pNOwv2kffoJIZhz3k8QxDqGakw6P3yZSsOSqrEK5d28cWWNNYM
	gyJQw0rulMJlu3n3gblmXPtO9nrmb+XYByklAk6k3YkIwz6lnSGk0arBydqDeE9z
	DA5KiA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8sb644-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 12:07:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-72d3778ba04so2014136d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 05:07:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757074075; x=1757678875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ywG7DrxAJyha9p1n1s1uGe2eRAGhfx1UZDypRxMjFI=;
        b=bTr8Urc288TPxe5z/PfZowMyN/yDKh6hGlyD5jk9Weh+i8wzjSJYRVb53Y1m3SjO8K
         kbfk3lmE3xO6lhz/0p0+g67w0OAsru9H0rR2Sw+LM4XcLCLMrUFy4iDlotNFF/q9/hhW
         afk4Dk09VsXB+c8i3FJjExP3ldpwRsMjx+8x9vKDfkc/NYbq155zR+CSe0qmIZ+U5UPB
         dhYA5x/aJkpmkcrGQ0CSPqRyg9JS8RSi+5hRxTZlv4HalXZCxXbDnfyH8SVSlcU/6Hrv
         2U/XEMM4HUls5txHn7QkxWroiYOSn+OGaG97mw8Ub1Pyo1FfYswmyW68EOGmfskJi3QL
         tjZA==
X-Forwarded-Encrypted: i=1; AJvYcCUmD0rzqZbWK022ERZUmEjImA8rip5QflpIsq2+oWhLrufK2uD9C4Bud9vKYE4rE37UFDHRGpmL4IvzSgVA@vger.kernel.org
X-Gm-Message-State: AOJu0YzaXOOAsnUZYGdbpU0kJbCO/cLDlrTLCbgqfKfEfBGBTJihuoC3
	T+49xcfJ6V0eLpvzIr0I4T+/m60ZbpYQVSKx6aQ4GFigVX8cCbk4948xPIhcn3ldMHNm5qzRJ2+
	hvpOTV4dPouQyKRpgvY6m3hteP8BXoAcelsjUUuac2ztSVEphnYX2kRDgbXkWHOYKGmwC
X-Gm-Gg: ASbGncuLnByE/+VSBptsPF1/CzKZ+kiypXiWYci/H0j6WN0S8Ch3AxljMZY8jJAcEQB
	r4pGYwfSXTaLtmBwKZQUU4J1Oxm0/Cdh1S0uxP+oXioi1Nf8AK7V46mPeiodtW0sP8Au9uoeLiM
	7MMB614gha7naJezUendUJE5V8hbQ6+v/K4BNMZZDwtAtGLr9hsIG3Ml77tWwF1xXU6UY2AOC9V
	3AflCrJQYpzOULk72FR0tYSD7l23RkjUqPobMLdsId7g7Ax8uEGzpbp9Yi1+N0nrxhZIrXP5Ryr
	EUK1XepbMTNP9Ptdtz7tyolTFcBHZbBUZbNbYUTd6XAOG0ao2ysxYQxPgcOmySYwjdgtZvhLszP
	B4bxwxYbnrr8oBMq7IAiO4g==
X-Received: by 2002:a05:622a:450:b0:4b4:9d39:3432 with SMTP id d75a77b69052e-4b49d3935cbmr67851301cf.10.1757074074405;
        Fri, 05 Sep 2025 05:07:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsdeBb4+ojSZLfqlx5FwAf1B8QozAeBTYPMWIY5jTEhRL6G68cKRSVMxgkPGjlTzVIJxN9Sw==
X-Received: by 2002:a05:622a:450:b0:4b4:9d39:3432 with SMTP id d75a77b69052e-4b49d3935cbmr67850851cf.10.1757074073738;
        Fri, 05 Sep 2025 05:07:53 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0413ee67a3sm1405722666b.24.2025.09.05.05.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 05:07:53 -0700 (PDT)
Message-ID: <e1c593d2-603c-4c3f-850a-07c14467b8e9@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 14:07:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/14] arm64: dts: qcom: lemans-evk: Add EEPROM and
 nvmem layout
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-i2c@vger.kernel.org, Monish Chunara <quic_mchunara@quicinc.com>
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
 <20250904-lemans-evk-bu-v3-6-8bbaac1f25e8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250904-lemans-evk-bu-v3-6-8bbaac1f25e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfXxqIabxSK5I+J
 EaQ7NWl48HM9/MV4BTa1QQj3q+K/EuMIG6PiTjgDLEfTx4oabymB0ZzGqmikA32Ktu5FVIJaXhV
 i7J2LT1Gvyjig8vg3OT744JeI7fV9rGAhmL2d7WERZAd8D9FS5pnFH/sF53Mbnt9lj5aFuXx2kw
 uZ9cVn0+D3ud7P30REKZ4TVH9UYmmEKoDi0b+YdyTTdJX3y+88ixmYpPphzH1NMVJk7k4tzV8K8
 QP0dWAmJ5XxjqYxDXbZk+2lUt4vDo0VBR9PeWCQHl8qcDWfjPEZxah+/OZOgfVtPAhTpBonsPWR
 ScQo/ydMLzR1SFm0npNCwtyWnzZsXfiFy2qb2prs51KGxT/mQ8K+F9s89P/x2HYh6xcV8I/vrna
 4oM/hnyE
X-Proofpoint-GUID: y7yMt5kI_bjvcEjX7NbYvt4G_nx2NNAc
X-Proofpoint-ORIG-GUID: y7yMt5kI_bjvcEjX7NbYvt4G_nx2NNAc
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68bad29c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=E-EgujyPmZ3s1dcs9ZUA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

On 9/4/25 6:39 PM, Wasim Nazir wrote:
> From: Monish Chunara <quic_mchunara@quicinc.com>
> 
> Integrate the GT24C256C EEPROM via I2C to enable access to
> board-specific non-volatile data.
> 
> Also, define an nvmem-layout to expose structured regions within the
> EEPROM, allowing consumers to retrieve configuration data such as
> Ethernet MAC addresses via the nvmem subsystem.
> 
> Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> index c48cb4267b72..30c3e5bead07 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> @@ -319,6 +319,18 @@ expander3: gpio@3b {
>  		#gpio-cells = <2>;
>  		gpio-controller;
>  	};
> +
> +	eeprom@50 {
> +		compatible = "giantec,gt24c256c", "atmel,24c256";
> +		reg = <0x50>;
> +		pagesize = <64>;
> +
I'm not super happy that this would be the only line of defense, but
you probably want to add 'read-only' to the eeprom node (or not)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


