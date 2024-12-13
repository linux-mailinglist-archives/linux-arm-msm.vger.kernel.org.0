Return-Path: <linux-arm-msm+bounces-42200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB7B9F1B1D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 01:08:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FE4F16402F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 00:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B39ED1E3DE6;
	Fri, 13 Dec 2024 23:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aMkXbmxS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023B81DF99C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 23:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734134140; cv=none; b=Fja3yKigzzXUyVBDAoPkpO3sYLCN8sPKxWSSWs9FgRQNl0DSRDB9trVqbO7rqyoSFRIuygoj2c+kNjvYIEWujUdR9yKLmaN5kdMpH9g15DhyfvVaClmcoZiTDgLoQk+7s3MkG0odLtcUlzMWCu4km8zfhHAOec+gqYqgjhENMrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734134140; c=relaxed/simple;
	bh=R3fFiruPOWwoh18HdeyS8/D0tZqJ2vocifkOSPPF/Ww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TN02egmxz6tm2SQgu9FDvM5I2+rxWNj6NGxZjec+rxKyYpaone4ko2F1CZ+8YaGWLSoKcsd/+z6RZVBC8ZoHpmM7iWbyIU1PmkuLq9z1cUzny3S97xnKZOb2oXPYT+uOdTDwqlGvqjF6Qrc5jJhswt4pzY/5PDdzsaIeB2PWMsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aMkXbmxS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDIkc4s023331
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 23:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/xnO94cNP0YYeYF1CQE9V7trIwWBGc9LJ/rd4NjRnPs=; b=aMkXbmxSNkTzzQQB
	S9o0s4s3spQmhIUcA2RPC7SKgckPqTRHfuiA8RrXmvvvEOUfGPeif8m2ifwILC8+
	wMP6rKrYcbYUVAh4Oa/MXkaNUQUNIVy4TfKdToJEly3kUDxv/pC/g/10FgMC+XTn
	wxeAOkHnFHo7dGVqFoEHhFcb8r/8cDE3HDffg3O0JC2B7CEmfG/IVmPYA2wHLF6d
	0TBf4gLUcyKBzimTu0JeKDlSlGyW74eCZCShpZDOHi/+NgJ8OHIfMsnEoXUZj5CM
	PhyljobEv08BDqJSkCG6v8Ml6N0GbZal7hl50mAvXmewH45PScqSe7svDPVh1tL5
	Bz2a5Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gh2728k2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 23:55:37 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d8e8153104so5312766d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 15:55:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734134137; x=1734738937;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/xnO94cNP0YYeYF1CQE9V7trIwWBGc9LJ/rd4NjRnPs=;
        b=FbGW3YrgygIHjIkQ38QI7hfi8eJ4HSlc1ii0AwPbSbba3hObI1LMnry9GwSN0xaMzZ
         d9MaZlov/HboSELMgAltBASJ5aG3hr9jdYU3MITLungcYAq8XhD8b7qr2Tz3BiDyofFg
         LoYRDyiGJO8rolYEf6UkVY+WSqEweFAOylqGr0Zq6JF9yjpBWMa7NyJdFNAuSAQiSFx2
         kV2mWN89Z2dp7rvVYPFK90a57n3o3UToPkrOeHKc77wOLlUoFVS4gqfItLDiXqE8VZLY
         X8464vHAirLXPr0q0Gv7fSljfFgVYtJbQ/F7FXQfpWIpEr8zZWCMEbqZPXkDAPOXApn7
         5iEQ==
X-Gm-Message-State: AOJu0YzHKZbjG3ByuuYfZl/ImMM8FWO2dmFnpysTTqASg3Q+Y1JUpxbY
	r6wqBNtugEgb+l9A0xVF57NXf/zvsjKu3+ryGNpEaVSlDCX38W/kwFdiF9SyP6X0p6J23TbTApJ
	tmUjiEzWU0cF6S3A+6GIuIPaWDKC8czIQO8hMscwFwIeDc7Z9+098584G4FU6Bdbv
X-Gm-Gg: ASbGnct4FEj4ooK5kzboTd8JwF9qHUdmZtcvP08egVjK6YR8DN6NJwrydTSSO5adn6X
	yv4xgqztEhPBL7xB86abfWr6/qk9RPro/eKAWVsyYMXC4vyLRyAX93TMvp+zvCtJH9t9nCNDR32
	UjUcqQyHwPC8nfmQyAc6MjnW8RXd7oOfvZkbcglzRUMW/S9aHP8R8Gqw5fsYvdKzDGnB/S0XDMa
	dwluKym62vBVGdjSaTIZeV3eIKJK3Rsk3qbcAmUFk42vPDCsrAg799wAyVEDmfwy6wD+eY/WkyA
	t88UtAs+N66r6tOwDAQRMHX1/ieXp4j1QWA=
X-Received: by 2002:a05:620a:4609:b0:7b6:d754:2076 with SMTP id af79cd13be357-7b6fbf34839mr251746185a.12.1734134137004;
        Fri, 13 Dec 2024 15:55:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHiB+qr/6TD32GoaPC74bztsp+aMojvpX/jfNnwMR0f0UY/F6jX6DVzI79ejvIQ6QMrD64TPA==
X-Received: by 2002:a05:620a:4609:b0:7b6:d754:2076 with SMTP id af79cd13be357-7b6fbf34839mr251745685a.12.1734134136627;
        Fri, 13 Dec 2024 15:55:36 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab963b4faasm24867166b.193.2024.12.13.15.55.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 15:55:35 -0800 (PST)
Message-ID: <a95220e8-8655-4146-baf3-cd11703eea95@oss.qualcomm.com>
Date: Sat, 14 Dec 2024 00:55:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 12/14] arm64: dts: qcom: sdm845-starqltechn: add
 initial sound support
To: Dzmitry Sankouski <dsankouski@gmail.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
 <20241209-starqltechn_integration_upstream-v8-12-ec604481d691@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241209-starqltechn_integration_upstream-v8-12-ec604481d691@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WI94OG-0OatZMqGa_LMtzsDCxWrcvgBE
X-Proofpoint-GUID: WI94OG-0OatZMqGa_LMtzsDCxWrcvgBE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130170

On 9.12.2024 1:09 PM, Dzmitry Sankouski wrote:
> Add support for sound (headphones and mics only)
> Also redefine slpi reserved memory, because adsp_mem overlaps with
> slpi_mem inherited from sdm845.dtsi.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> 
> ---
> Changes in v8:
> - clarify FM with FM -> FM radio
> 
> Changes in v7:
> - replace indeces with constants from dt-bindings/sound/qcom,wcd9340.h
> - add spaces after 'link-name' node
> - remove not connected digital mics from audio routing
> - add DMIC(0|2) -> MCLK routing, because digital mics
>   need clocks
> - align mapping comments, add dmics comment
> 
> Changes in v6:
> - refactor: s/starqltechn/sdm845-starqltechn in subject.
> ---
>  arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 223 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 223 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> index 65f33be55da3..3a049459aeb3 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> @@ -11,8 +11,16 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>
> +#include <dt-bindings/sound/qcom,q6asm.h>
> +#include <dt-bindings/sound/qcom,wcd934x.h>
> +
>  #include "sdm845.dtsi"
>  #include "pm8998.dtsi"
> +#include "sdm845-wcd9340.dtsi"
> +
> +/delete-node/ &adsp_mem;
> +/delete-node/ &slpi_mem;
>  
>  / {
>  	chassis-type = "handset";
> @@ -97,6 +105,16 @@ memory@a1300000 {
>  			ftrace-size = <0x40000>;
>  			pmsg-size = <0x40000>;
>  		};
> +
> +		slpi_mem: slpi@96700000 {
> +			reg = <0 0x96700000 0 0xf00000>;
> +			no-map;
> +		};
> +
> +		adsp_mem: memory@97800000 {
> +			reg = <0 0x97800000 0 0x2000000>;
> +			no-map;
> +		};
>  	};
>  
>  	i2c21 {
> @@ -590,6 +608,211 @@ touchscreen@48 {
>  	};
>  };
>  
> +&adsp_pas {
> +	firmware-name = "qcom/sdm845/starqltechn/adsp.mbn";
> +	status = "okay";
> +};
> +
> +&lpasscc {
> +	status = "okay";
> +};
> +
> +&wcd9340 {

So this looks mostly good now.. but I noticed that the nodes are
referenced in rather random order, please re-sort the references
alphabetically

[...]

> +		cpu {
> +			sound-dai = <&q6afedai SLIMBUS_0_RX>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6routing>;
> +		};
> +
> +		codec {
> +			sound-dai = <&wcd9340 AIF1_PB>;
> +		};

(and would be nice if these subnodes were sorted alphabetically too -
codec < cpu < platform)

Konrad

