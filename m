Return-Path: <linux-arm-msm+bounces-75656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA176BAFC0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 11:01:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 218A1192047D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 09:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD192989B5;
	Wed,  1 Oct 2025 09:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gSs/Fhrr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83E72D8376
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 09:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759309297; cv=none; b=X5RQbJbcPJBeMojIAo+Txn+WjEcGFzaOkDqZllOY98PEFbEcmfs19wWWY6Egvl+/jus0azE76yCBqDVPgNW2Zy7SiSeXAXJ8woxC5G2RoAL4f2jvjKQBDXvTjpJAgpxzFupaZpuCvVGmTcoQyZfKysShmiQhpBA7b5WqGi7QEDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759309297; c=relaxed/simple;
	bh=dlajLtcAMxSk0NrozjS9CF0M15RGimUH1gNNnAg1huI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cvzMuOMcBrab1ewlJ0BCVEyWBPaiXuQ6pxXW9qQb742xWDpftXGzIcBY7rL9hMBrGHM/HNsudA5pFLNDEEq0yES3j1Ds8r/VqtNwhjAZEqwNiO0lq0o7NC0B7Sc7JEUIusukX0fxuHV6jDwKsfG3oFfyEMX0IIhMBZ7W3ktuL7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gSs/Fhrr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UKp82C014790
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 09:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B42pLGH75pGjx/3inm5Dy5xji4vr0c5P39RfvM77Mi8=; b=gSs/FhrrepVTfPfO
	rrJQv6fw3OGskESs5DXaCijLP+v+YJwoJceHzDSVbZxNhYl8Qgx0qnt3J9BY5o0J
	OHRfhLiFnuPvxJTy7SurzjzFHD6/9uSlC2HdOY3CT/OyGiHkaXlnc5fhp1LeGbj/
	0hKdUlGca8b9qnR51NG0tDcpz6WuhKhWEC91YD5uik5UQbONhRiA1mMVPM7hTYaR
	eELunro5tlhROvAXtKQWfTX8F4P8oapwslYVqD2kaTfXhvQ+XZDQlqqI0mrFwWMB
	cbexr+CMuZoRe0VvYWSyp3Xkl9tEF+ULTT5Bcgmkd6pZjcruLc74PBUEYsyITJIf
	5TRBmg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vr3xs7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 09:01:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e231785cc3so7199381cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 02:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759309294; x=1759914094;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B42pLGH75pGjx/3inm5Dy5xji4vr0c5P39RfvM77Mi8=;
        b=jJItktnFaCYLfccUwZT/Mdyn5IlK6znHTWvfov5tSCCLs6D0kiZADrhQ+0te7ZtHBS
         2CYkRy89CjX2xfsbNME+zMyS5xZccH9T15M9af0aZGLrIXW76ZrKoB/5WIDWFkMFPl+E
         REdXuZFKHO1h5rkPN00aY0vtWUtZJvSquZkLNPrsk3Y8V/XqPaJ30Kh81Z6ORJAtas0K
         fvK//fXvSC427LZBJKPExYMUmA4nvw+WgSco9rri8ef9M5YaEqRMT2icywNB36mGNdl0
         6pwh5ujwRRUZBj/4bpEBC/84qVdf2YhGHOJGpExc2+Mgr3kLqNSWdI8fc69MLt3qPQ0u
         eC7A==
X-Gm-Message-State: AOJu0YyYfrw3F8/mcg9NdNC7VBm8sST0SexX2QMWvSewO76sSTpESepF
	lTQdV7sAzt77yu6SYKu209cKwrbkfymtQq5aYFSJGKdn1xqecTc5SrHP1RqYb1ngXBzNaVC7QPz
	XMUT/Y8lMZCniy802lRCBD+A2Es8GP5Hv0/HwCJRFDwUjNl2DmBP/Un/DhP3o9/F/G349
X-Gm-Gg: ASbGncuAZDRYKCapbZ/hzEKW357BUmhDxNE9e6S9zQnuV3k5v+xGmbeZAzkBedfos6n
	GcIVHKMVQY5ZDdIIujH8+c4mCyK9i0K0+GF75+h0lPKXJT7w0+8hVrpxkFJqg3qd8aWb8VwhDWT
	dWaFLhO/0KjNb4hfqMSZjE9e325IW67Aa41TZJpU7bKgP663y4uqMMer8WgbBJw+fG6umDb/sDp
	Y6pIzCok5MeIk827uP7KqVqh2vNZXR/x665aOM0iMtp4DwJWd29neaDEYaEYnM+Mnhz0vj1U5Nw
	3NDw+qAL1n4GzL0aWHqDwFgPjiqmgvnrhzuZm0ykFX/5f1pAmNz92B3zUdPB/7OdS9h56oZh331
	JuPijMBNGT0rk0M953GcjsASDvfw=
X-Received: by 2002:a05:622a:11c7:b0:4b7:94ee:4fb2 with SMTP id d75a77b69052e-4e41c54729amr23669201cf.5.1759309293320;
        Wed, 01 Oct 2025 02:01:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFghnDnhD89xfq3NpxumOgiOvGyipA7QKcNPEFFvbSfXFdc2E0wmIKiKI+YIF9fBkkm1d+LAA==
X-Received: by 2002:a05:622a:11c7:b0:4b7:94ee:4fb2 with SMTP id d75a77b69052e-4e41c54729amr23668841cf.5.1759309292804;
        Wed, 01 Oct 2025 02:01:32 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63662dc0a3csm3035680a12.48.2025.10.01.02.01.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 02:01:32 -0700 (PDT)
Message-ID: <57774099-08f1-4ede-b992-19f220bf8059@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 11:01:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/11] arm64: dts: qcom: sdm845-lg-common: Add leds
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
 <20250928-judyln-dts-v3-4-b14cf9e9a928@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250928-judyln-dts-v3-4-b14cf9e9a928@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jPOGeXb3OXVNkaG5iVddtcnnU7EJmLYt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfX5YsbzsnKpHTn
 ip1PP7xZr9q1YTVV2KxbeZLp1zycs5iaq9AAouJHoYW/8M+Svojzh6WG9zNrCOtAgqoaC+OCyxu
 ERzwYYBUtjbPY1KshTBPe0i1gRTWP/F0Z6T+T7SFLUIryoKvopUkUnMaodqjReKOghoBgppqBft
 Lau6pNhfMOP9cLFWn/YNt7YaCbCTga4GQJFFhbELBpFZUKkzurklciahwQpTuFqVfuCPPkqw7Cw
 fdgLFaEbUnDSGRQ5Oa8aLy6zaVu6QrYQwRDcsjiBFJugsIvjuvaxXTT2LfW/l4wcTYQIqLoNMFw
 Bcn6w5OxT/U+mAlNnb3aGaLJa47EXwZFsHOdex1Hj5QEbR81qA6lFF5PmMh+pfmbrShpKgKHR6F
 v5aQYHGeOkaGEVXjXd8d22miRAz7oQ==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68dcedef cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=sfOm8-O8AAAA:8 a=Gbw9aFdXAAAA:8
 a=kAMZL_UcEcdRErClG6YA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TvTJqdcANYtsRzA46cdi:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: jPOGeXb3OXVNkaG5iVddtcnnU7EJmLYt
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
> From: Amir Dahan <system64fumo@protonmail.com>
> 
> Add the multicolor status led in the phone's notch
> 
> Signed-off-by: Amir Dahan <system64fumo@protonmail.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 28 ++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index 4c631df56f262ba9e730f6720abd94d374b14692..2a612922ecf7ce3f8a0734cb1a31a8a81efdb4f2 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  
> @@ -504,6 +505,33 @@ &pm8998_resin {
>  	status = "okay";
>  };
>  
> +&pmi8998_lpg {
> +	status = "okay";

Could you read back register 0xd000+0x45 (LED_SRC_SEL) on downstream
and make sure the value matches upstream?

A msm8998 kernel fork I have laying around on my computer always seems
to write '1' in there (which it claims corresponds to VPH_PWR as input)

Konrad

