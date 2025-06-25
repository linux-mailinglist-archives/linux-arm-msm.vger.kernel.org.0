Return-Path: <linux-arm-msm+bounces-62436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D981FAE8192
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 13:40:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D88091886C2B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D30751917D6;
	Wed, 25 Jun 2025 11:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dtuawZ46"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E02738DDB
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750851595; cv=none; b=hRCBaZ/QvH4UhfB0PSxM0f4MOPk1lYf4xluQxy5xUsP5yfmLJKaS7m+vNDRJYOttW4xdXHvrsbUHeryKdDKYeGyaBrz3fEeC+HH/NvEpZzGoY3wVVNIXoPhuPmPZW3rdX+x+/bKE063zxCHvec4pKXuKneqFDWxFTjRjP72sf7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750851595; c=relaxed/simple;
	bh=C3JAMLbqJIpHXlQHI7FHWU33nNzthOTI2jHEkI8oJJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=czyl42IQX9X1rEau7Z2KNFSY/NfzpIFvbrG7AacDGQA/Ixb99hVieI+84+ysnBgmZG/SrlapqK7AG+Yftw7z4vSzfEWhZU/JlqGxMXg5cB6OHaKiYtbSy7dLYu99sirndXnEHug7ibZSW+idPY74msofY9B3P6Vv0bux/DElaSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dtuawZ46; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBH1DV015731
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D/9kOiApQXYH8AwtMI7zEvaiwqs42vrGQZ099rTXvMA=; b=dtuawZ46TwaUfPPj
	dya5rvusbKlmKciCKyMBZ3czC27aqrvA+878dsSLIZKCgSQy2mWSmaMGUtVMq1tV
	mF/9siDnq1I0PA6rxmFfab+wa+bPMZm2TUkdGHm2RakDaGViJMebpxm9RCnUi1YN
	vxsnaTVe4fYB8rftWcC5++0d5bOPhH36COoHiIsNRYAzlqUa8HQdq5eQnlermD+Q
	+VM2VBBum9TDrB7gJ62pbRQPJjs9obgQ+/8JSDRyRjlB6GjjP8tQtAQ8S4Xrocz6
	o+6AXBFEWWxkHmgkpUXah557wRpNQLv1OAIcLtWsKoaAcXF/QDA0Itf75TMdx78V
	udox/g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5rspb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:39:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fabbaa1937so12901226d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 04:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750851592; x=1751456392;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D/9kOiApQXYH8AwtMI7zEvaiwqs42vrGQZ099rTXvMA=;
        b=uh2LZEyZulEy2S5Yr/PJmS2kZ11ThiM4gu+La94V/wLiylUJf7LiyxaZmU3h2e5Z92
         E7Ah8wLxXM6p2C36pSqo2FiadV49ciZKqqiEAJ/p0oRc2OWaDcIrdlbN9/mFyn+O1DqG
         aWmz+iPKAdLzCMtEFM01GgHMQOm6d0VLmPduJb8vNfpSCEg76IQopKfWvy2xB/y4kB6p
         G/M+Df9Ieh3FAi9E7t4R9CAfAmol+6euI/4qXjf/X+d5KmBiKztQH8ODwtSUB+W6VqXM
         T1Z/vD9UwTGAf1LBSQL/EF2JLhEHE2NR0Vxq/QHdKCdmdPqBRrlBpYdxH8CgCqlfM4hs
         s0hw==
X-Forwarded-Encrypted: i=1; AJvYcCX0BRBxgn7bEjzmyu4ki3kOUQPgekfBgptCGBb246f0khm4/CN9UrMs4eulxPFqIowD0rQZKD7phPm50V08@vger.kernel.org
X-Gm-Message-State: AOJu0YwKC6aRLIa+XPU4TnGtYcSOhVTWEQCR1yDEu90WQJypWGxAOtrE
	n0YpzdVk5VWt9IbLOLFdP17SsOUua7XaFA+uu9TSeYgJGJPd2HuuJekrfnSbfh59/6Ec1XOGr8V
	NspY8vLhI1uVxGz1rVudP9aZXQkxBEja4WcgzREk8lekHg3FTjP+or+dwiOsvVqgtlrQy
X-Gm-Gg: ASbGncsypdmnbB0FqYF/4FYXRnkBNtbYTCPT6ye+zT9djws+GuZlyRLLdDuyBzoUWJG
	befw21qALcFrXrXoVH8U9yStsYdeKP+OvLQ4Nf2P5n6l+8IHfrzdCsKnpj0OloMtHDt3+Y4xNgX
	bUBKTs2Q+VACnrY090gJ5FhEAYho4UWF/ucyrDVwM/aF6RF2jCILdqv+/Nn80PJcuRiakX20I2C
	e7msM2fGRvkUGe8Z23E+9hZPJPtBe+FkJlSCw7gpDG/Mit3U4Z2LBf76Ju1s6jtvqzq0WSV1pw/
	hChNK48z5KOaXXnVOJCx4WOjG1KUeqlJxSEWZNRnHwtrupUtIB8LVBSMWhThl6oqV2Iz/YmeWLd
	JfhA=
X-Received: by 2002:a05:620a:2552:b0:7d3:c69e:267 with SMTP id af79cd13be357-7d42976a0cemr132721485a.12.1750851592135;
        Wed, 25 Jun 2025 04:39:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGH6OiOdnFqNQFHZY08dzGnG49pbYdELxhLBkXKRuNNZyM0qKripYKhU48YUIEPhjYcS4p0BQ==
X-Received: by 2002:a05:620a:2552:b0:7d3:c69e:267 with SMTP id af79cd13be357-7d42976a0cemr132719985a.12.1750851591653;
        Wed, 25 Jun 2025 04:39:51 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0ba7a3fcasm160221966b.117.2025.06.25.04.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 04:39:51 -0700 (PDT)
Message-ID: <1bc82082-32aa-429d-afcc-5b7050c82518@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 13:39:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: pmk8550: Correct gpio node name
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250625-pmk8550-gpio-name-v1-1-58402849f365@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-pmk8550-gpio-name-v1-1-58402849f365@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: W7Oo6U7c56Zp5x5Hx0Oq3WOzzg5F6PzE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA4NyBTYWx0ZWRfXxDXn+OWEE0Bp
 APQon2/aDiXR8nPQyhUNn9H3vWWveVFXdgLIF4cel+gYoVLnn3Pac+vcR1hge397WhXH4nj3aTf
 uhyDIyDFP9tXo5CG4WeoMeyBySszEjYV95q9usdMwyct4gu+5SJQ1AbQ8koBlIZA22DGzu/4ppn
 Uv8Zyl60M/zCyp6/uM1apX30R+H2lKulNrWV0YnhFA0qH3YwyxV/WpCkB3G+bQFHgq+aEUBuH8m
 EsMcwdkQXn7LK2vZDNg5Kobd+3kC4NIsdqHqPFelEb1YoxFn/GCoJuh/DLbsptGgVkyPyL0DgnG
 HGmGCtJyLf/9S7qFpw9vBpoYoAGrRsXPxKdnCcm6DYVt4cLnc58cw4WXY8hioUIrngpCCquigq1
 55iTv+XCAKLCUEBxqbk2kDWQUM4+Wdrt6ddFv/81qM/ao5PMtrfUhZn3EwQ780zn6BYOAxGe
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685be009 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=l60TpK_hX5jhcLL__Y8A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: W7Oo6U7c56Zp5x5Hx0Oq3WOzzg5F6PzE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250087

On 6/25/25 11:11 AM, Luca Weiss wrote:
> The reg for the GPIOs is 0xb800 and not 0x8800, so fix this copy-paste
> mistake.
> 
> Fixes: e9c0a4e48489 ("arm64: dts: qcom: Add PMK8550 pmic dtsi")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/pmk8550.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> index c7ac9b2eaacfe6e8363448d9d2ffb4ac8f5f4dd2..583f61fc16ad570972ac166aef12183382ebb4c5 100644
> --- a/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> @@ -64,7 +64,7 @@ reboot_reason: reboot-reason@48 {
>  			};
>  		};
>  
> -		pmk8550_gpios: gpio@8800 {
> +		pmk8550_gpios: gpio@b800 {
>  			compatible = "qcom,pmk8550-gpio", "qcom,spmi-gpio";
>  			reg = <0xb800>;

I was surprised DTC hasn't caught this, but it seems like the
relevant check only runs for `simple-bus`..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

