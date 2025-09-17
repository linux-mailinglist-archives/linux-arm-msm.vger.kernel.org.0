Return-Path: <linux-arm-msm+bounces-73975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF79B81168
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 18:53:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 042281727C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 16:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486E8281356;
	Wed, 17 Sep 2025 16:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UQlP2VCw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBF82F25F4
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 16:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758128033; cv=none; b=YoWbzCUxt+JpEVh8CF45mWbhInv88TPAeKzXLuzuv553iGR6TH6nUj23kGY0EjT5qr14wBLgJodLCzpVVS2n2p0E2t84daU+bI7ftgD7/IHKSbRU0GkKJOriYPdntXJgtMczHgsNscwcEiGAEHzPrWA1ojO9ODAGPkwIzxFbzVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758128033; c=relaxed/simple;
	bh=ltrQIScJbth2BOI7jCtr9bPuyHDomsS1P1HFhlQhzuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f1fW631N4XAME0nKauzGinermvY8G4wch4k9/9RXSckQlPpml6lqL1qlNLwOlV1lnNRBOw5IvIkw1JjM4pD/7mTiWthb0VeOmFmRa7vWCwD6ygQ3Qxkgp6a+8HQrEeyjHwE8RQ9qLINSlis6ufalBRJJY2dP7cAbIApe4aPNFO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UQlP2VCw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HGDlx7029609
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 16:53:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zISPrnAk1kMNIJNOJ4OHj5cC1XO7RgqNAjBgljmrsdM=; b=UQlP2VCw5C309/Ps
	V7jiW2SuaJaEWof3S6xqkCqJ+15DFQ4oelU0dGlGQaZMuAuOohj2veTBXzBYAnCB
	H/5quTtNaa/pdDB5qCU/VUwa7kdzj/5Hqvdh0zqgsLsh7KMxnLSY/Tn7AvaQBqqe
	BBb71o9jTedDXHEbECzFMXJLRy1IIpzonxs3O3Nf2bv3KoDkTey6n1SGvkiQNtn0
	JYK0r8AkHerOMIKGVfho7Q3pvxa/DCSRMe/MWrIGJcKaC2viyASZwdXrq0WUzVPj
	nDee9RseJj2o8cjB2jDQ/BZtigELvRlY+4N/byk5Dx2RplFCgxLJSnsHT6XeaNqq
	/9MnUA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy0u6s5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 16:53:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5eb710c8eso57991cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 09:53:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758128029; x=1758732829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zISPrnAk1kMNIJNOJ4OHj5cC1XO7RgqNAjBgljmrsdM=;
        b=HUB4+19zQITmKzIrMjDX8wwWaULePT/dlqUHYeoMnM/YUYu+F9UoBMNxcJuvDQgxMH
         4TrqAdy1u+SVako6xLqcTbZgx8BrcAnVDMVNw436e7PEqhQzrBEtnubfeZDCs+H50A/V
         99BWWsbDkREgxg2JWYhEG6KjFyNq4EQHp4jR9bo5OFauUyuWKSfEaSTv9N5Dzn6Nnyvd
         ryNfZQ7CHoQJbrVAExLXXD7nADfURiLy/qhm4cIgd0Bwu2UFMD8P9N4ppAzHWvoyfsBA
         3mnMqiL7EKrmR3zkDp3VQHYtmVtIOevwnb5FI5QK20a8WjwPIZh4HUs90SZ4smYxrfCR
         J3eg==
X-Gm-Message-State: AOJu0YwjAOUAl+zRU2WZqyfgQ7OCLVBmM/jzkUKU4DeNNiEyE/ldkR/h
	NCsS4Er+1TtnmGszcUmbnay5iO2ILzDzrPfusdK5phmo76pg+A2qbYn4Q2e2WSde4QOhqVtEnh5
	i1NuGQH9je9G0nkEWajlvJYDTEQl9EMQXAl8/gFmKLIuiy6i8hrvJOgDCaT1YiPJntwgP
X-Gm-Gg: ASbGncsMlY1Bc3Pln2FSDRakn8iiJzOJieu72LPd5CyQI5H9J/s++in88N20HOQHaVb
	dUjRes5ErjZmJhTzh5GjYwZ49ey9ZawVQMzJiu4ZehjJtBqg1Rfm9wUks6iTDjSfOPGu9wbx/ZJ
	CFoAjUn0qylqag7kKm3KPmrXClmLt4VlYF0J6ErZZNqbYj7qxRpMAvdE53kchNHTgvCSWBwrO2R
	JNMcf2XZ2JYnd42LS9AwyN41yG36nH5VKC0JLyzMWOsKpIC9uO4Ffjflt0D8yLukI/G9TK4jG8Q
	XEX95rYOQcik+MCaI0QVN+Ug8rS1yfLyINGTOa9Zc/wgVeQ9nRhXMxmgJ87glbyuL0P6uCTGhuf
	ZM2Mi7PLge/q6OsFC7H5LAg==
X-Received: by 2002:ac8:5f0b:0:b0:4b5:a0fb:599e with SMTP id d75a77b69052e-4ba6646b95fmr22816551cf.2.1758128028431;
        Wed, 17 Sep 2025 09:53:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0KeX4y1ACER4of/dK+LtnihqN5EgEkRY1llWGm4ZqHa1umkk5r4MN8DGPNmSnNpymFos9xQ==
X-Received: by 2002:ac8:5f0b:0:b0:4b5:a0fb:599e with SMTP id d75a77b69052e-4ba6646b95fmr22816171cf.2.1758128027790;
        Wed, 17 Sep 2025 09:53:47 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fc5f44fb5sm8536866b.16.2025.09.17.09.53.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 09:53:47 -0700 (PDT)
Message-ID: <5eacca64-d79d-479e-9a08-cceb495ad145@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 18:53:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qrb2210-rb1: Add overlay for vision
 mezzanine
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        krzk+dt@kernel.org
References: <20250917163534.832523-1-loic.poulain@oss.qualcomm.com>
 <20250917163534.832523-2-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250917163534.832523-2-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jfIhM03s9ArHX57T3M2LN7woCUfR6Jtc
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68cae79e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ykAyxcz_jJqhd-Ot3kEA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: jfIhM03s9ArHX57T3M2LN7woCUfR6Jtc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX6REfvkYcYSLO
 arL9U22Du0qOJ4IfQuVrEAWCCaWWNiLfrWkMq6s2spNvrHWxmeqwhGoP9IyRC6nfV/qBLhzM2yA
 XMjKqz73PCDa1LbqDQ+e+WR3ITvU8/jFSpuf2Va/dPOWvADqmg7cbBBiUNasvVhYufmXEheLzDO
 LyAX/z66LthlR3cKakt7N92ze7vSowWfEhA5v8saHCq7uz2tj8s3OX4Nu6XW184hAkQhfHcheI4
 fWJ/gEexzcMYHwoHsehImrnYOngN/0TNXz32Wv3EjdmTt+icFrk7o9hy5s5TL6ia7dPNoVnmtr3
 XTPsArZUxzGZFFFv0I564NFnIDtdxkFaCGXLoAOQrCBbe38+N2sEoI9eiVB4d9Ics8SsL4wmRw4
 7Q/WyTEy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

On 9/17/25 6:35 PM, Loic Poulain wrote:
> This initial version includes support for OV9282 camera sensor.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

[...]

> +&camss {
> +	status = "okay";
> +
> +	vdd-csiphy-1p2-supply = <&pm4125_l5>;
> +	vdd-csiphy-1p8-supply = <&pm4125_l13>;
> +
> +	/* Add PLL reg */

hm?

> +
> +	ports {
> +		port@0 {
> +			csiphy0_ep: endpoint {
> +                                data-lanes = <0 1>;

Odd indentation

> +				remote-endpoint = <&ov9282_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci {
> +	status = "okay";
> +};
> +
> +&cci_i2c1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	/*  Vision Mezzanine DIP3-1 must be ON (Selects camera CAM0A&B) */

double space

> +	camera@60 {
> +		compatible = "ovti,ov9282";
> +		reg = <0x60>;
> +
> +		/* Note: Reset is active-low but ov9282 driver logic is inverted... */
> +		reset-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;

Please fix the driver then, see:

738455858a2d ("ASoC: codecs: wsa881x: Use proper shutdown GPIO polarity")

> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&cam0a_default>;

pinctrl-n
pinctrl-names

is preferred

Konrad

