Return-Path: <linux-arm-msm+bounces-62220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2630FAE666F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 15:30:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC5AA3B2273
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 13:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C93D2C3253;
	Tue, 24 Jun 2025 13:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqAMrige"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9222C08A5
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 13:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771705; cv=none; b=dPWVDxF0k8jlGPSvLghWwQb2cuB6g3UejsCWK1bYQSoNbaCwFcqSUkEXPKu6uIi6uTRPWUJBxqDJdGA9xqeOC8EbyBEa9sQWCkHrvTp0aKvOshryJovCSNk/ifNZ4H/Uny3WvxMjswsNhjo+F4DR8ZVR0vdFWGfOXEb8dzURLEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771705; c=relaxed/simple;
	bh=lasfdr/TaGl7iQzxXsOYnVe4ZWgSTCOhymdRSnVVl4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GjfbD6+rjtRXOj97jdg4gf9SAeVfa0aeo/AnNvqFZW4yftl/2iaR2qrm9A6xyS1RmifGd23bQmlrwq7bjWvFGX2BbkQT94POpqZD3nJRQTdzel0nrCLgPP4mgji4QocMlInqh6aRBdvFX1M1hAq5jT2reL1NiqaFwOcihg585KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqAMrige; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O6YMva022517
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 13:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1xHRBt7S0QkIA0FEcCi54MhIM2gOS2cQRRBECPdtA7s=; b=AqAMrigeblmVfCoT
	kN8W6W+otX543cHItr3bjmHFVsVSHtXCDJyad9/KThtNRIKUK5pDTu1gguqFgnKs
	0lycQRdRxm0ydG8ysuZynBq8LkKdLz7Uapzu/V4IAyiQE34KUOov6oOzVA+9eUZO
	uQtJuzTfFrQ0hfEsbh9q3ZQakhi5Qbx3V1U9hvA4zPKEobkca3j0Vs2NhYlR41+K
	SedpIlwyeKvid+p9Z6YyAbnTVIx79TQExIxCObbUODJ2Zr0SgAxS6ds+83t36hzl
	DJaex7bbfvnMjogaKmbi7YLIdyNfeP336VNMBAz+cWA0hdmux4LjUaJssx3pvR+Q
	1QAIuA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rpvevx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 13:28:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b26e33ae9d5so6704303a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771700; x=1751376500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1xHRBt7S0QkIA0FEcCi54MhIM2gOS2cQRRBECPdtA7s=;
        b=Oeh1bhUg45xtx0z/ZRuKDxzA+F5z9dtSiy/JXHeulIyts+fCTBTCJVMAxQdqeNeY+w
         rmgu34sxeQlcQ4jRDjOucFR299KF62DLXWMbYiTrfSbE3jBBRh0OVPuxMUpPSAm7N5fq
         9zzQIbd4XR/mXz2/abMbpFKK8/FADwmkRHSOeMRdcgSnGtXK0shhpmvyRYNWo0Jd9Qkf
         0/CJmuUwe9hU2PUMPrJLlBqsFRNC2MczLd7t/yiJ2QRnJlg8DX+1iUoJqFTga8ScRcGP
         h268CJaSSPfr5psumb44jJYPcyDoprZTDHYSPru3TyIC9BcGZohv1j/ldLosPVAFoQyW
         Wi+A==
X-Forwarded-Encrypted: i=1; AJvYcCWYoitLQwuy5VhTARqh2unvgRjpFckFl3PvXy0m5piNLVaWlJq6cPrYOyCi8+YsoHo5hCsQd0/xB0XRro0e@vger.kernel.org
X-Gm-Message-State: AOJu0YxFWAIYSgWL9vQvNi0ORsCPha2kNigrJ29fDVgwGEIq5girKsdG
	nsxpOKzIj3ATd/w0vKuF4DV4I84hYp3igKwrC6sYub9i75Cp2bA6h/yq0nLgVSM+sjXURtHLrA+
	KaT8/0yqD5U3pYo7C6f2EiZb749xJjgaH4ZFMeKwukQykTHdnNvQ1lIaduOGTCNxik9rh
X-Gm-Gg: ASbGncs6wxOUzQQFR4TUMmg2msivU/1B3ei6LO/cY33+UtIubdQpdrlrUnxDOuS4L8q
	W7T0ke17evoYNKK+paIXaUFaxcLGQZGNIhsx3lyOrDTZGaa1XWw3bIlvBd4rzOZbhQ8oH7WmzOI
	MN/Vrqbk5LSnS3MbAJ3XrkJ36kgHsx1pClDnUqwlWQpn2KjsqGhInB53DzjkeoSVofeScO7uiFC
	hCS7K37/vKjIoBUGn48RllXJokfh2ZKWotRr6MtIVQ9VzGA3nzCj9UhxdJEBG3yDmp/+CRo4PfS
	BqT+TIKyFRrRkXyR/9nmK+DbypmnfRRdS+TTHi02E3HKmwDg5QI=
X-Received: by 2002:a05:6a00:3e0b:b0:747:bd28:1ca1 with SMTP id d2e1a72fcca58-7490d663700mr28575630b3a.3.1750771699606;
        Tue, 24 Jun 2025 06:28:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhSkFmD+5UXG4jGrsUbcWVvnGV+HYRoYvsylLGuSpLZ0cZAFjd7dWnoz7KErNAGSRJxIUwtQ==
X-Received: by 2002:a05:6a00:3e0b:b0:747:bd28:1ca1 with SMTP id d2e1a72fcca58-7490d663700mr28575577b3a.3.1750771699195;
        Tue, 24 Jun 2025 06:28:19 -0700 (PDT)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c882f5b8sm1961515b3a.95.2025.06.24.06.28.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 06:28:18 -0700 (PDT)
Message-ID: <c7361a7e-a1e6-4327-ac7c-243fd8846f7d@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 18:58:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 3/5] dt-bindings: iio: adc: Add support for QCOM PMIC5
 Gen3 ADC
To: Neil Armstrong <neil.armstrong@linaro.org>, jic23@kernel.org,
        robh@kernel.org, krzysztof.kozlowski@linaro.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, agross@kernel.org, andersson@kernel.org,
        lumag@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konradybcio@kernel.org, daniel.lezcano@linaro.org, sboyd@kernel.org,
        amitk@kernel.org, thara.gopinath@gmail.com, lee@kernel.org,
        rafael@kernel.org, subbaraman.narayanamurthy@oss.qualcomm.com,
        david.collins@oss.qualcomm.com, anjelique.melendez@oss.qualcomm.com,
        quic_kamalw@quicinc.com
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        cros-qcom-dts-watchers@chromium.org, quic_skakitap@quicinc.com,
        stephan.gerhold@linaro.org
References: <20250509110959.3384306-1-jishnu.prakash@oss.qualcomm.com>
 <20250509110959.3384306-4-jishnu.prakash@oss.qualcomm.com>
 <8736dea0-2a5b-49d8-8445-239e5d11174e@linaro.org>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <8736dea0-2a5b-49d8-8445-239e5d11174e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685aa7f5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Bk9QF8R_Bm2aD44dtyUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDExMyBTYWx0ZWRfXwAexk3Ump++A
 jXn46FAGU1vbaidHeDSESd/1TYyKzYz3x4CJuOCEBKfGUsmb18L8zBfNXzVjd3I/mHrkUrV5PvY
 OYk4/BupT0TQFLLnA/mx6FtBq0rbzZEIWGVnw8lP8OF8K+zMHW/2oGuBFnFwGarCyOOFW2zcS9f
 XPw0Z28iswcnT7vie5gVaQ/jlq0Nf0Z7INyZ+hzqhIB9P9kfKPpT1OfO9hdU7/spm83niU6QqYT
 tNyj9I7uVeXhALj1YzG/KDX7ZAXR/DHUtBZV0xVAzSa2Kobj1/1deBfBAv8+cOBNVjzqz9jPkrN
 /E2s+CgHSsPGrPWbk0jfU6b6o80PoLDjEQhBoVFZv/lWxfNm/YoqlgCdS8RI5wy9+pg/sllub/U
 H0kBTv5qyxm2TmpX95y+ZGw1giMPhZOflwrXdg5Tyn7My3wXn9c5WrOzCEy8Az2BXFj/vikl
X-Proofpoint-ORIG-GUID: Virx0XwsRVOqOhyIlVuFkDwulGhWFVHZ
X-Proofpoint-GUID: Virx0XwsRVOqOhyIlVuFkDwulGhWFVHZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_05,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240113

Hi Neil,

On 5/9/2025 8:05 PM, neil.armstrong@linaro.org wrote:
> 
> Hi,
> On 09/05/2025 13:09, Jishnu Prakash wrote:
>> For the PMIC5-Gen3 type PMICs, ADC peripheral is present in HW for the
>> following PMICs: PMK8550, PM8550, PM8550B and PM8550VX PMICs.
>>
>> It is similar to PMIC5-Gen2, with SW communication to ADCs on all PMICs
>> going through PBS(Programmable Boot Sequence) firmware through a single
>> register interface. This interface is implemented on SDAM (Shared
>> Direct Access Memory) peripherals on the master PMIC PMK8550 rather
>> than a dedicated ADC peripheral.
>>
>> Add documentation for PMIC5 Gen3 ADC and macro definitions for ADC
>> channels and virtual channels (combination of ADC channel number and
>> PMIC SID number) per PMIC, to be used by clients of this device.
> 
> The following is missing to allow it to be a qcom,spmi-pmic subnode:
> 
> =========================><================================================
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> index 11da55644262..b97f0e7b269e 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> @@ -127,6 +127,7 @@ patternProperties:
>    "^adc@[0-9a-f]+$":
>      type: object
>      oneOf:
> +      - $ref: /schemas/iio/adc/qcom,spmi-adc5-gen3.yaml#
>        - $ref: /schemas/iio/adc/qcom,spmi-iadc.yaml#
>        - $ref: /schemas/iio/adc/qcom,spmi-rradc.yaml#
>        - $ref: /schemas/iio/adc/qcom,spmi-vadc.yaml#
> =========================><================================================
> 
> Thanks,
> Neil
> 

Thanks for catching this, I'll add a patch for this in my next patch series.
Although I tried running full dt_binding_check and dtbs_check in my local
workspace with my three binding patches applied, I could not see any error
related to this, I'm not sure why.

Thanks,
Jishnu


>>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---
>> Changes since v5:


