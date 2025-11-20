Return-Path: <linux-arm-msm+bounces-82677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A95ABC73E96
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 13:12:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 80610357FBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 12:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01E83128CF;
	Thu, 20 Nov 2025 12:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QYQujI/I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TBo+iMi6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128ED27510B
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 12:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763640668; cv=none; b=LW1ygsZmfCQEww1j1U0kmuqkJHbvtxsaMhYYmWewib9Ja1NTGCKq1HRjxIOYSRiu1l8ekaD98Er8LgubsAcbwZmxAtdQYW818XtHhhVWqfdbdUqXaa2ZTawfeDa0V+v3oMCKR5q7dJGr9dW81MCRPawuHMiSTU70D4bgz2XpZRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763640668; c=relaxed/simple;
	bh=0cfT3bgRQbsxGmTKccy05AiwguLM7Q2MsBKOaWKIdfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QXB6smnwQkmPEf4fvybETwoeVeoG81NKchfcbjTy7jfldiaBiZjiLr+nahy+sHCH0glloQFSkeaaQ08fwijUyuu6L9ak0fhD72VSUDivIGxBclqNHKWd2YrZZGy1rX+JF6TDfMkbtmh7BN/zOgLpmm7A5rjVJXyyvcEelSl6h+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QYQujI/I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TBo+iMi6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKBas7f3407849
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 12:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kybWWPjVRqLZtCLxRW8OdT69bB3HpyM4+4Y1yEo1/Vc=; b=QYQujI/IgdfnDoLr
	z5pme9U28TsPB1q+c6F3q5hir96TghVshozPpk/ZQUp9pX9x/z8Si0Wib3vYToDU
	mER94FOk/BXhPwmuECClTidqxEn4sZ5P17mShAlZdGpou8Y0JmKHdzGHrFJhYCSf
	SM8k5FR1sv2sonpUdTjgdl1q4Y7mP0GTxWRSXqnU/L6LP28xtL2Xyic9bR2+j9ZU
	O5MtF0ExbUiSbMHkKW9i5YfD/0/0ulpuDTQMASudXvlLL+Jp/7kVv3dRjKSUdWhf
	QtYSBRgNgvXEslNxruAG7F5kfDQIwGbpIaajLJ5wr0wcsk3HxoWh3XLwDvSbP2Sd
	znUVSg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahm812nqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 12:11:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee05927183so2300741cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 04:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763640664; x=1764245464; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kybWWPjVRqLZtCLxRW8OdT69bB3HpyM4+4Y1yEo1/Vc=;
        b=TBo+iMi6pGZ/Lh+2yBQdDMTFS6HRpDye+WWZ5vPmwg0AwB47r7nWB2GXmXqOBI67UJ
         NjhIhx/uak+94AxuckIfaDtDe/rPjjV0HtERWDxCCpmWT913h839LJ0KwuQsrFYDouAv
         jX3yOpxkpAz0tgPTzz9E+Di4BLXSbgqD+a2Y/VXIf03vMOBQCL1OYsQxAnBPH1QENnMp
         KOV0ZNsXWK2nWGPGVnwL2MF4nEsMPnFmbY0hobG1abyKqcr8VLxygbcshP8D0lrhW7E+
         XLfYZ8DVYOebf1mBdyehdvZN2uM5Kb+al8WuDHd0ap4TPOekgJjRNe+C5CimgXnF4Mhn
         6/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763640664; x=1764245464;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kybWWPjVRqLZtCLxRW8OdT69bB3HpyM4+4Y1yEo1/Vc=;
        b=i+pFX0ls48HBd4GpMDX8QS3wYWMWxCah8k5+wI0XJUmL1x7tzKwaTx2pOwckOXC1AO
         Nk5xXbncUcF0P/MAslsmyx73ff0q7mZjsMVEheu8UoQ58m3pwxgvLF0SMaGK+u/l9Jrd
         5J9cpDdn7gWwVyqHu4jsjJp1AiRRcBf1uA65B1+jeOZE0b0G15Q7WPNSDTqQPR4rRGPC
         KC8aCxbytkk7h7wUpkbe024+IQ1NvfrNuunwNIqhc5YDYvW8IGpGyH0+Suz2zC2cUzyc
         /srRFDO2Ksbpnm6J+YvXQAFMOKrNs+e7YnutF5vkQCJoPZlxR4AMj5q7zTPksjXjdg/s
         e15g==
X-Gm-Message-State: AOJu0Yy42N1ZS7CWWKwr8cf163Q2y/LacNW/JBjsJwb+9LKkUqeJBoss
	82Mf8fgrgRwHqt9cqUOglTSCY+rW7VOoINYK+A2DCmLLKgciS1wvd5MtBu/CM+UDQQWddkubIGI
	fM2WELfc0PfCJltiLPV4LDwRQHGIlu0/zhEh4JgtrBm2wzUttjrxwc7geQYczQ6pILDFr
X-Gm-Gg: ASbGncu7YSYQsIt9GYks96mb6ln+h7bsUIn+LLEAQV7hD5oH9ETzmM/zSImCNkEv7wu
	dnNJ2KpUZ2vH2F8v1cwoIXYbvJB78V/MfZJ3CCb+kbIk5Tj3PDNv++CtjkcYyAFxSji6XrZAxH8
	S2BIL68TTys6gmrWE4plNr11lejYnifz3g3mq6noj0tN6DjO9t1vq8aBAudzWEwadD4EId6vRDk
	RjNahBcAEPxqkBNuJmpp1KFFVySHpGZVb0TSmGfOefIu2Sk35i5mu3gNNDNyXyGXmE9V+uQ7VPP
	oh79V78WHrC4x7HAfK6rtoaLU9uqliRPVHPSKIgxEsrlBx5r6RhdrCyxXU47Sz3la5mbO54cYnI
	/d/qEZdKu2Fb9wQazyEaNlR9RRfNC6iQwJm1e4TsY6iPx1A/bVAGSeHcTOJfG0fPKoMs=
X-Received: by 2002:a05:622a:292:b0:4ed:b7f0:c76e with SMTP id d75a77b69052e-4ee49723b53mr24514431cf.8.1763640664042;
        Thu, 20 Nov 2025 04:11:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHivoDHEac0E8i9LKK60VuwTkp8BI3Br/o1/N7jrKQ/I7z9Nqd091W8EW4YkeLLHm5SG2OTmg==
X-Received: by 2002:a05:622a:292:b0:4ed:b7f0:c76e with SMTP id d75a77b69052e-4ee49723b53mr24514181cf.8.1763640663640;
        Thu, 20 Nov 2025 04:11:03 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654d56a70sm194154066b.22.2025.11.20.04.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 04:11:03 -0800 (PST)
Message-ID: <7d31f45b-1062-4118-8769-49209908f2ef@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 13:11:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: monaco: add lt8713sx bridge with
 displayport
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vishnu Saini <vishsain@qti.qualcomm.com>,
        prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru <vvalluru@qti.qualcomm.com>
References: <20251120-lt8713sx-bridge-linux-for-next-v1-0-2246fc5fb490@qti.qualcomm.com>
 <20251120-lt8713sx-bridge-linux-for-next-v1-1-2246fc5fb490@qti.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251120-lt8713sx-bridge-linux-for-next-v1-1-2246fc5fb490@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8X1FB6PeQGV9AgT6cUkYtChWDsl55GwL
X-Proofpoint-GUID: 8X1FB6PeQGV9AgT6cUkYtChWDsl55GwL
X-Authority-Analysis: v=2.4 cv=SJ5PlevH c=1 sm=1 tr=0 ts=691f0559 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=S05nYBC_j6DkukOZ6w4A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA3NyBTYWx0ZWRfX7oaGbOxwitGW
 StZn2/OSBxQevPXR0v/JHxu7+I+RT5JqClPtBUwdlav9u1pXWnRi/YzPrVanyXvTproiRD3pPhz
 cPcaMPNvC/VWNZTRsAIy/yuxmal1DgHtxBypje7Veqmg4koOIgH20w0R0erpXq1vDl+nl3xkpsM
 83zD5le04N3r7ZiLgTPFKj4rUqD3ANpQ4l4ZYZIWa2oICz5UBxjPGv+ciq+vMEzzEeFEUTKqT12
 q0xyvdggYw5Avnp27ln1qMWpCHztOKRHHtiSeMjlkWSm+jRBo9FcvCE63lUQWrvdx/jC9k0y20j
 CCsw7wDp8Hcx+pajRE9AFm+GbSmHJN6b6nO7rp6MQ7ryq+pBrb7A1mcvcVXZXDsIWFhg3aWUCAy
 ialu/2PlCXpVSyRGbQBsDVriw0rQTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_04,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200077

On 11/20/25 11:58 AM, Vishnu Saini wrote:
> Monaco-evk has LT8713sx which act as DP to 3 DP output
> converter. Edp PHY from monaco soc is connected to lt8713sx
> as input and output of lt8713sx is connected to 3 mini DP ports.
> Two of these ports are available in mainboard and one port
> is available on Mezz board. lt8713sx is connected to soc over
> i2c0 and with reset gpio connected to pin6 or ioexpander5.
> 
> Enable the edp nodes from monaco and enable lontium lt8713sx
> bridge node.
> 
> Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> ---

[...]

> +&i2c0 {
> +	pinctrl-0 = <&qup_i2c0_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +
> +	lt8713sx: lt8713sx@4f {

Node names should be generic, so bridge@4f

> +		/*Display bridge chip, DP1.4/HDMI2.0/DP++ hub*/

Comment start/stop markers should have a space after/before them
respectively, however I'm not sure this comment is useful given the
dt-bindings already describe what it is

[...]

>  &tlmm {
> +	dp_hot_plug_det: dp-hot-plug-det-state {
> +		pins = "gpio94";
> +		function = "edp0_hot";
> +		bias-disable;

This is an SoC-mandated function on the pin, so please move it to
monaco.dtsi

> +	};
> +
>  	ethernet0_default: ethernet0-default-state {
>  		ethernet0_mdc: ethernet0-mdc-pins {
>  			pins = "gpio5";
> @@ -451,6 +488,13 @@ ethernet0_mdio: ethernet0-mdio-pins {
>  		};
>  	};
>  
> +	qup_i2c0_default: qup-i2c0-state {
> +		pins = "gpio17", "gpio18";
> +		function = "qup0_se0";
> +		drive-strength = <2>;
> +		bias-pull-up;

Similarly, you can move these settings to monaco.dtsi and keep them as
defaults since 99.99% of I2C users will share them

Konrad

