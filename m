Return-Path: <linux-arm-msm+bounces-75644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D60BAF9F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 10:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CA0616741B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 08:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465CF28002B;
	Wed,  1 Oct 2025 08:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lPY2n258"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67151DFDAB
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 08:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759307385; cv=none; b=s8+ch8NN9m0ZH4ccltg0plcRLRECaW6fiaDn4ULQ/2WiZXl8k7EbhoNuuQDAtv8Jf21ztjiAxpw/d9U7QPJ3zsWIE965J6YuX+dGMTXwwwi0Nj/2hFrh52xC5x45pDGXozWQZBx1Wf8fNhoojFX2uJ+k1r0DSh+iRZDawD0I9fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759307385; c=relaxed/simple;
	bh=iqZxrMmOCUso30RFZ6gTRXsEmOGLnP6HtbNYPwF1Wfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HckTOO5alCpvU9H/4D/cRXlJQnw1EEcFFTV/fPU2TnC7KJLd73I0tV3FFDu35vDVSYSnp6KTYESJVQoTEcBUjAw1Hom0mu18sM/FnoEJQ7mIr4+v5t9w2f8K6iW2MjKewdUnHUJQNVXN4MwWthgK89xw6Lh6pD0VkG98jI/TLJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lPY2n258; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UKqfDH009556
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 08:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A4bz1NnqQrT8sw5X8qWBPC30nWyB7EeMqsmSDdrK1ss=; b=lPY2n258l+FI9ZYs
	tQEPtA1Y7rKFvvhrDRtfR3xIn8CddVUsdPczxKYspN6l3bvWOFF0781+Gz6PW01C
	RRhoYGkpp+1p0aX82pS0nEh/4hBRYgGrhYLp8PBMh05/uAmf9PY9IHEkuiYkWmlg
	42IfkoT5d1lvWF+YGW3Q3ivi3MPORBtxePZ0AzB2j/cxJLt89/0XOuYjZ0yILENh
	RGHtVKvvi87G8CXUentc5KTtbmpIGiEGr5KrDe+V6u4S7qcADzKeS0st5tMQedqd
	xPz8ZIE72QYHnuPsB15cmqz4vd07TeUT/LTedkWXmu67dQmkxqlzC72RTgLdxLen
	oV+TNg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e977unty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 08:29:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e231785cc3so7118371cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 01:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759307382; x=1759912182;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A4bz1NnqQrT8sw5X8qWBPC30nWyB7EeMqsmSDdrK1ss=;
        b=fjIqBkQzP3+OZwExVwbxKtFd8mf5ycYtyvjY9k/Bd5Ps15Ma7OZlUNr5ztUpWN2TJX
         r84l1CsiWsB1wUU1iiv97yhN5IIIlKnvKsGAyVxG6679/33OdMdUgrbizuwkw5h/614I
         bWhEGPFRu27T5QgPakAC1BT14ZU1XihWQ6BYeRJ/bDYowcWtWNl4HsFxsLjsnzOjfvco
         MPlFwxdQvucqeLusbgxx6mSEDxwJz585G/qS2v80clyv5nv44lGVP5nxsANzCwjdCHP0
         yOQ7Z5Ffm0tTo+vt5pi4FpBN2945zh2OmJyQudLe4FwpKjJiNmSDKtqYX8zLKJ5TK4Xh
         WWLg==
X-Forwarded-Encrypted: i=1; AJvYcCUOt8ifcHmNuEcRj4uYBOdMW3JnML2irFQ5VAAcpc8ZA3NtuZ5NlaMk3AA8g01y9ENuGahjkVrmIf/W8234@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+eVn5ocYE3pJrmHPFXwmcUXeji/f3phfdBFlVz3Jl0fEGtxJO
	QwsZmUzvSlDeLPwp1QGp5OvrahjKJ2RDB4JuwR+ZH9O+s/n/IX84ZeUWL3HOCRHnEbLBbAyFSpq
	3gGjCUFiRsuJP/Kl6xcusbCGgDFOBn1cE+m3zCwzUQAtbvlw8r47cEgBLj3LbxYdAg2hN
X-Gm-Gg: ASbGncuoUt4jle2n/KnZyrpl7ZVybC6WK5aRYE4JStfCptykwxRpLgKXE0vfJJ7jY3s
	nEOTD1lvEV0Dt4z84fIFVR+w56RGGd+AHG81sE5Ktft/oxJ0ZmQUDMEr00MvM2XvB/HrfJ5HK9h
	+0kO4a3Chbyc1F0588i+RaJR1uu80tfSPoqJCulglZKUkhKkh9Wy3RVudVW2F1p+SugMiUL/CiM
	K7ZSo8aERDA+K9AhX+6R+Z7vvGA2jSgddKx4Ms0abXbf9UjN02EWryfYtInmrrR3a25+at6VNJ6
	GbRYElUrw1lYsIyHMHi4+Ap9hRuLU6iPbm5DMwZoI2WvHSB/Eq04m6V1Q7oRvu56UOMMxaCLMqO
	6F4YVDDsGPOfzaXUaGk6bEz39Jf0=
X-Received: by 2002:a05:622a:1444:b0:4d9:5ce:3744 with SMTP id d75a77b69052e-4e41db86a41mr22416191cf.9.1759307381792;
        Wed, 01 Oct 2025 01:29:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSUqL1RsW5QiQi/riKCanq1p3YM18OkyHpHFi5otusy0fPMrF9AasNPUvKABfOrGjygx+Caw==
X-Received: by 2002:a05:622a:1444:b0:4d9:5ce:3744 with SMTP id d75a77b69052e-4e41db86a41mr22416031cf.9.1759307381329;
        Wed, 01 Oct 2025 01:29:41 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353f87511dsm1323076766b.43.2025.10.01.01.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 01:29:39 -0700 (PDT)
Message-ID: <dfd4a03b-22ee-4ea0-af4c-9184a464cad5@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 10:29:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: qcm6490-shift-otter: Enable venus
 node
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
 <20250930-otter-further-bringup-v1-6-7fe66f653900@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250930-otter-further-bringup-v1-6-7fe66f653900@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1uFNZSic1pi3XpicejgJJH2OdiNbfalQ
X-Proofpoint-ORIG-GUID: 1uFNZSic1pi3XpicejgJJH2OdiNbfalQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfX++zFIIO7Wn1J
 71yYGO6PsfW0OirvUfBG2Pj1Rzx0KvSQ8fnIZ0KhE2sd0QhFi8CH1+a7WdeJH4rRsSSeeamAH8D
 gx7VvZZE8qMmQVLdFfaO86axI/ynW+kO3iKJ2+9pg76rAIg6dI3qd6+ah3c8AVwwtu/PCqjkaAa
 hj25R4hffXCO/B6SeTSgXoZS43TTeZbOGSAkug0Mvhb4lxVPBRADYvVxgbKrusLzdFpAYeXDHQM
 PfMcPYTd+bJxFg2y4Ec1VsiTJsFMg7u6mNlhLqh74R1Rdc+KTy+eVfemDOnDaHpcmg5lrppS2q7
 7hVLiTtYhhqk/7zz7sSsJJRIRgUjiWmyGSwCzFXPs3dtdfQUKQQnyoQc6S/KAK/VH6aweRv7CG2
 pMuzohwMuaAewrW8EWnasxeMANdLNg==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68dce677 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=7Ovdx5uLAAAA:8 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=Q9X1YL7jsAXwpJAzmCoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TQZWkJv5rNK5-PaLMsrg:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043

On 9/30/25 4:32 PM, Luca Weiss wrote:
> From: Alexander Martinz <amartinz@shiftphones.com>
> 
> Enable the venus node so that the video encoder/decoder will start
> working.
> 
> Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
> index b4c69dc50ed0f0b3cb45341a01c89210bd261993..98c1ad4c21118831f079c83f4fe66ea30c141fac 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
> @@ -995,6 +995,12 @@ &usb_dp_qmpphy_out {
>  	remote-endpoint = <&pmic_glink_ss_in>;
>  };
>  
> +&venus {
> +	firmware-name = "qcom/qcm6490/SHIFT/otter/venus.mbn";
> +
> +	status = "okay";
> +};

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

