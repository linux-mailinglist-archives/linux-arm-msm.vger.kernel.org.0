Return-Path: <linux-arm-msm+bounces-36607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 662989B8435
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 21:15:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC4F11F22D0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 20:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA4C1C9EB5;
	Thu, 31 Oct 2024 20:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aab7pXSM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126E31A2562
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 20:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730405744; cv=none; b=e5diQZ1qlHw2FMQ7JMItkh9PstxM9hfrIYhWiiz6vztWJeXz9qc/pbjIUCxi737adjldREw7Xff/MBaDtB18oSYelg+7HToPDddejTNMHAnjpBrSjf78PAQZsBQNGhnhcvWtlPbjevbYI0yl1bfeo/+zJHtcgDYKGJ4yr7ebIuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730405744; c=relaxed/simple;
	bh=xkwtN3c2uPMRsUDWKPYJxOqAFJ86d1h+TMDWw5J9RDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QXo1JfiCX/86NdZqLwd5devN7h0s1+X2lPE7YuZkmlnuFynm5JCYnyvQpEgokGHA8M64sEGNg8bwxAhTmTxKmWvBYohokG+2D+QfqN2xv/s6wY/DAf3qRdTvJgp8tcPAmlQmS1cgDzSUm/7NcHTxfkCyfqyliK+4Dlr7ZlhjVyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aab7pXSM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VAmm6f012555
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 20:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZcPK5InsPBoM0ZnT+TI1iKYIYpxncNlyyq02fAIuo3I=; b=Aab7pXSM2f2FQ+SN
	yCMDflW34S5SVIWSVXsmuC7YvHfBNDiYf9v6Hd2X/f2VF+6xCslZbF538ktu0Jrv
	O8OwMZC4+cSSw4aABYeByd9RXqkiNxnysuy4iiSlyUh8rj/GrbkYOSpMZG7MdURj
	4FaVEIhxD3coN6Ng7bjLdTOWfctcU2q3NABoBw2hjqfecg3wZhQQWFBVEbiJFY/Z
	IW3PrjO8H4/qmf8EdJuHheMw2feQo4rbDuTljNPOyh1/CzoMSv+hersCA5G1W1cL
	lj/TmHHfGfnxqk128d3cT9xklJ9++jLgZ2mV2GwLYfD2FU8kgkv8MbGidhAKxy6A
	PYm1Qg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ky6rb1w5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 20:15:40 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-50d4973b2c8so14454e0c.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 13:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730405740; x=1731010540;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcPK5InsPBoM0ZnT+TI1iKYIYpxncNlyyq02fAIuo3I=;
        b=C8VlaxynjYv7J+oM/a5/DOJ6DR4uIAbQLAm+k0+pwsznsxv0OpZlYXYpr36Apb4a7t
         wE7r5qrt/uTGfQeKoA1A9A8N5PL3fKBKYAjTSrOPsDsf8Zf9bSXB1gCZrTyIi4X3cn3O
         Zo0JCag5nk4ybMKqb/SIOJl3SI9hkjFPDzaVjtke2Q+HfFivf89LDjasde45A4MY+bpb
         L7RG/AZnCiXw2z5kYMWXacIr1ANs+1nCHyHAoVd3bS94Rnbxc/jk8Dtukl+atpcXkqwC
         EAtwvTvYkuhwZS+Ynb//H84o1djNPTyOF93V0GzevYP5q80gJ7GGsocTIFYWaFuZZXJV
         Mnzg==
X-Gm-Message-State: AOJu0YxS4Sl49Vj1VQtIOJ3C89I1GexBajGIIdU3NxzjfGHX7lqzhZW8
	XWVbz2Gwe+NdoTd/Ny8yjHXZIumh9FPa0kwl5HGI8uOQ2btB9+qrc4vF294OvfpgwhpbvUBdrXr
	GQUSN5FlhQjuLAOux9nj0L+rlgJhAtj0pPglw52MSZ+gtxxo35pMwJb2SsdIfWrDR
X-Received: by 2002:a05:6122:1d43:b0:50d:99ce:b6a4 with SMTP id 71dfb90a1353d-51014e9a3c1mr5807058e0c.0.1730405739908;
        Thu, 31 Oct 2024 13:15:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzz758fYhX6RlSTvOSILAzTSI2OZl4txrPz1TsPQyrqBjk3Aq41Rb9eWsfv9N6sd7wCpZsmw==
X-Received: by 2002:a05:6122:1d43:b0:50d:99ce:b6a4 with SMTP id 71dfb90a1353d-51014e9a3c1mr5807041e0c.0.1730405739545;
        Thu, 31 Oct 2024 13:15:39 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e565ef518sm99105666b.118.2024.10.31.13.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 13:15:38 -0700 (PDT)
Message-ID: <0bceeb9c-1604-408a-a465-e7ac4d05b3f3@oss.qualcomm.com>
Date: Thu, 31 Oct 2024 21:15:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sc8280xp-blackrock: dt
 definition for WDK2023
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kalle Valo <kvalo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Merck Hung <merckhung@gmail.com>
References: <20241030-jg-blackrock-for-upstream-v6-0-7cd7f7d8d97c@oldschoolsolutions.biz>
 <20241030-jg-blackrock-for-upstream-v6-3-7cd7f7d8d97c@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241030-jg-blackrock-for-upstream-v6-3-7cd7f7d8d97c@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: P-0Q9pZ-gMlbZWGv4ZsoF8uptbgShbEc
X-Proofpoint-ORIG-GUID: P-0Q9pZ-gMlbZWGv4ZsoF8uptbgShbEc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 clxscore=1015 phishscore=0 mlxscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410310153

On 30.10.2024 12:02 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Device tree for the Microsoft Windows Dev Kit 2023. This work
> is based on the initial work of Merck Hung <merckhung@gmail.com>.
> 
> Original work: https://github.com/merckhung/linux_ms_dev_kit/blob/ms-dev-kit-2023-v6.3.0/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-dev-kit-2023.dts
> 
> The Windows Dev Kit 2023 is a nice little desktop based on sc8280xp.
> Link: https://learn.microsoft.com/en-us/windows/arm/dev-kit/
> 
> Supported features:
> - USB type-c and type-a ports
> - minidp connector
> - built-in r8152 Ethernet adapter
> - PCIe devices
> - nvme
> - ath11k WiFi (WCN6855)
> - WCN6855 Bluetooth
> - A690 GPU
> - ADSP and CDSP
> - GPIO keys
> - Audio definition (works via USB)
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

[...]

> +	wcn6855-pmu {
> +		compatible = "qcom,wcn6855-pmu";
> +
> +		pinctrl-0 = <&bt_default>, <&wlan_en>;
> +		pinctrl-names = "default";
> +
> +		wlan-enable-gpios = <&tlmm 134 GPIO_ACTIVE_HIGH>;
> +		bt-enable-gpios = <&tlmm 133 GPIO_ACTIVE_HIGH>;
> +
> +		vddio-supply = <&vreg_s10b>;
> +		vddaon-supply = <&vreg_s12b>;
> +		vddpmu-supply = <&vreg_s12b>;
> +		vddrfa0p95-supply = <&vreg_s12b>;
> +		vddrfa1p3-supply = <&vreg_s11b>;
> +		vddrfa1p9-supply = <&vreg_s1c>;
> +		vddpcie1p3-supply = <&vreg_s11b>;
> +		vddpcie1p9-supply = <&vreg_s1c>;

Please update this atop

<20241018-sc8280xp-pwrseq-v6-0-8da8310d9564@linaro.org>

most notably including a new supply (which will likely be identical)

> +	compatible = "qcom,sc8280xp-sndcard";
> +	model = "microsoft/blackrock";
> +	audio-routing =

Please don't break the line, see e.g. x1e80100-crd.dts

> +		"SpkrLeft IN", "WSA_SPK1 OUT",
> +		"SpkrRight IN", "WSA_SPK2 OUT",

Oh, this thing has a speaker!

[...]

> +&pmc8280_1_gpios {
> +	edp_bl_en: edp-bl-en-state {
> +		pins = "gpio8";
> +		function = "normal";
> +	};
> +
> +	edp_bl_reg_en: edp-bl-reg-en-state {
> +		pins = "gpio9";
> +		function = "normal";
> +	};
> +
> +	misc_3p3_reg_en: misc-3p3-reg-en-state {
> +		pins = "gpio1";
> +		function = "normal";
> +	};

Sorting GPIOs by their number is preferred

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-nodes

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <70 2>, <74 6>, <125 2>, <128 2>, <154 4>;

Do we know what these are for? If so, please describe it (also
like in x1e80100-crd.dts)

Konrad

