Return-Path: <linux-arm-msm+bounces-75658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB28BAFC7C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 11:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D5067B07C7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 09:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C44022DE711;
	Wed,  1 Oct 2025 09:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fsGcKY/n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B992DE6F4
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 09:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759309481; cv=none; b=V21hTV0gpJJC9N19hKlkkGVMvo99nY1aKCiAT/UEXjXOa5xn8wSoAwVwRDVy/5vK9ZCgA+V4YBiukhIm5AChcjrnZZ0D6PIysv+bdjFTKUSxl0anO4yep++K02Fn14oO1rfuI2JfpeXF+4fXvHsVQnHnP2bDoNoO69AadrMXeDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759309481; c=relaxed/simple;
	bh=4S0VnWznaWtdgnfy+s9AoFLLT+aZCxWxxJMZ5f4FHhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XRE7rYqvQllQQlj4ykBxYUMRy9E9RDrWk1wdFc/G3+PuAaLubFRk8Yl6xtsFqj9eyBeHwck0nCUYGmJBHEFOa45YkILopQt5xSxJlqxlp6uy7MIqg4wJvgokkBO7g1Qjyc5T5ViwFpapu5LZ2z/UCLCbqKrFa9r80e1kZXEV+sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fsGcKY/n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UKp82h014790
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 09:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CfNVsHbqOEK6Djc44jlTWFITLsi2qwa8KQYpesfCqo4=; b=fsGcKY/n9ChfDxYE
	sW1NGuwvVgOdEZFxAmIuOIZKXUTjsG3Z2u7lQ/U1fPiotbaUtfEtJl9UmvDCWW+A
	tIk2pcXpnZSgjNTvZP6xl2ozx0H97IVeOug6GXxQCppNhK/StYAxLAj+hQpgiMy+
	44dnQ9koBf+QL4xHVJGKLEadmqQlg8PsZwH6LiUPEjk+nrrze/lusU5rKh98dB+E
	YYD6deXp6JNygXQiucgUfNL2Om9gvADO+yr1P9lV0O10GFz/JDKFJLxKm5XHQDwJ
	0GDxhf+0i9k4MJUWgQCI+xIhuqxdcGIdyCPRawXtMrx04pVUOfrJRWiFyCSMCR4D
	BMY9xg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vr3y1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 09:04:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-860fe46b4easo188044885a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 02:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759309478; x=1759914278;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CfNVsHbqOEK6Djc44jlTWFITLsi2qwa8KQYpesfCqo4=;
        b=Z8VYDY/7FvFnERR4t1y0If0oHiJIY08cRMPkrCMq+XRChCgSEzm3OJ3E/8fthY/0lW
         zGxUBfKdW2mEGlV9L2N31OJaI/eYOXbVDoedEECg3H3UHAGwEIFC31yoDxrv6lWljR/x
         KzLq3yCdI0AK/ek0JzBhxjt06QW4uDNcyi+C8xk40BRQteKT80/n00dhWqegZBNdpo0q
         NTRmwtXlkKpZsm7CKoPFXy7J+EN3Z4Yf49V/zww/jiWyMWWv9zOsa59zdiTs9BvWVjNV
         zNst5FA8wkS2BDhXmJmD+0FjTp31YcDWz9hcIocK8vygF4ANOsB+Ee6Mzrhh2amYRmI+
         2HFw==
X-Gm-Message-State: AOJu0YzSm4RLkAKwDdarwyVPglgHC0W9o/M8SdyQeuX9iCWhsiGvwMue
	wxdPzto1Ch9B7gv7Q1+JxkHM7uLPgEsKdm9XyH26dcOHb/hM3ZpC5h8WkholTaGR+UqKdsKLSV+
	qwYvTEt1mZKzvTWoDY53gBzaWvGERGNzG7J5SCmoQDsNRV9nTMNi6TgbvE11es07OyBhU
X-Gm-Gg: ASbGncs67si8b7WSXBapgjnIqaE0n2kKEN3EFTt8ONH9R9/D3AxJZyCKlNEUBojL/05
	kH6hZKP7UjyiFbOO8MNITEKjz/oRPdl6n/Zv3S4TeoelXE0y/jK6bescQ3A47+ThzpKxIzTyOOS
	PC+fm0Hp/E/jXzmDWWoQYuNF7crnVMpaghYiPo/fKt3imYPAJX8PhRIeQYkLhuVc0P5MEI+YJaW
	kxlxfxGFj5Twtzap7gbaYoFu8zqHQGpg38vXYAAcaxO8zBLyulhTFLa3YoXKh0XhfoGuTeK4BE6
	wa3glDUHlbDmbDCuowlYdJ3STGBq2wHw8Ys2Yi9hJbOEMoc7d/cx3hsqTctfwmacc5l2m8XK7E3
	uAeM0Co65mGrBwssp1lwYw06hFEY=
X-Received: by 2002:a05:620a:1a9e:b0:864:1d18:499b with SMTP id af79cd13be357-8737116c812mr242353885a.5.1759309477694;
        Wed, 01 Oct 2025 02:04:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvUheZabbjOtgcpxEsJAvrgUPd6M+/fvvGGBhC3LzERbkqgTcCF2xkTYlVk3r+qDVu6l8ZEw==
X-Received: by 2002:a05:620a:1a9e:b0:864:1d18:499b with SMTP id af79cd13be357-8737116c812mr242350785a.5.1759309477158;
        Wed, 01 Oct 2025 02:04:37 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3dc2cf61dbsm666298366b.29.2025.10.01.02.04.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 02:04:36 -0700 (PDT)
Message-ID: <42463474-7fba-4df3-9dbb-24140581690f@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 11:04:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/11] arm64: dts: qcom: sdm845-lg-common: Add camera
 flash
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-9-b14cf9e9a928@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250928-judyln-dts-v3-9-b14cf9e9a928@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4VjmxUwX7TUfqTmjQyH8K0FeC9Hlxt-o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfX97IHBaWKY96G
 hQ+ncoH3HcydhngDidwFwltkXlVtQXn5X02rEAEZRQbJbbxSoFpRE+PES/W++HMeRHA698FMoNU
 4H/H840XoFarXWHtCM4STCmUABv8FeUa3tLWf7kafka/syWWYzIB2JbQbMZaU6e3ZitZtm9oLAH
 qhCLBKekg8Dv+sR0ZVggVHzbcGnVHaM7xfWSbxvVTHDkqRRSBrxa4w5QKCgxx91G6jQ+LTao/u+
 VOWqwmPahzO/qYotHufAdrFXsVycFy7fq2Ayzt7Nfwualgt6dleFGsHMF0yscj+n5H18W9cq1du
 JkzsBQm+CmDu9WztNn5zI5f9/iDQIrfvxn0nsG33dW+roHidF7MpO+PpfrxsT+Huvpk/oieOP0l
 FhF0amVH+mWAWkuAyMiD043Oa5l0Sw==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68dceea7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=Gbw9aFdXAAAA:8 a=INp5xvtxXxILuIktMPQA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: 4VjmxUwX7TUfqTmjQyH8K0FeC9Hlxt-o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017

On 9/29/25 7:05 AM, Paul Sajna wrote:
> So it can be used as a flashlight
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index a8c8706f2057d36d5ef4130f11d9ad417f93d575..f309e6ebc075a691c7a522238b4a93ba9e63f3c0 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -509,6 +509,19 @@ &pm8998_resin {
>  	status = "okay";
>  };
>  
> +&pmi8998_flash {
> +	status = "okay";
> +
> +	led-0 {
> +		function = LED_FUNCTION_FLASH;
> +		color = <LED_COLOR_ID_WHITE>;
> +		led-sources = <1>;
> +		led-max-microamp = <850000>;
> +		flash-max-microamp = <850000>;

Allowing the same current for flash (brief on/off for night photos)
and LED (flashlight which you normally toggle through quick settings)
sounds no less than suspicious

Konrad

> +		flash-max-timeout-us = <500000>;
> +	};
> +};
> +
>  &pmi8998_lpg {
>  	status = "okay";
>  
> 

