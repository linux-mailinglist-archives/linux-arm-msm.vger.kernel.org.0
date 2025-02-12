Return-Path: <linux-arm-msm+bounces-47826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB21A3328C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 23:27:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A30993A9084
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 22:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C446204587;
	Wed, 12 Feb 2025 22:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ABWIiiPq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB63202F68
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 22:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739399266; cv=none; b=Bsgg9IDoBRoh4EDN6GdFs4sO+3XUZJASJ95/vuYUSxYLHUHK1I4PWXecskY2SCRJu89ScGNkGn+PBOecKkeJZ3wf95mM/5SOIRPaYiGv4k3qZo/hlWk862NQb9xis141zM3d/SuYwzuA+7vQFYbSJaqgPKZYwY/AegM7UkUb/mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739399266; c=relaxed/simple;
	bh=RuVfgyHjpa0Dr8v3kLqklchuQuADCZEXTGbZnpszfzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jisuLrsl0rkEISMSQyym+xX4H8cgqSt0BGkRMkATFqcAx/GI6OWH3BZ0FPShF4TClAiVFSAD+ARSC1Wiu6HJMDDx14RoqdoSUMcz1LJ3ipfBIWmgg5c+VhlVRhXnCgY9dUcHFNVkZrrnNjBFljIcZ3MwGcD9u5Mi17vruczQKnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ABWIiiPq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CJcV4U012503
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 22:27:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p2R/RTt+0MfG1Sv58vOwjs183HLY+inpys37nzh2bbQ=; b=ABWIiiPq+geEJsAT
	QAIgs/Qa7LVlfMV7TFGq6lZNEdi+WZKz1fBnP62E8jwUGBbs4QO5ZF53lZkR77wu
	L6EQWxVu76KH0F2X1EOgIYoc3eKshXkHEuEQOqwbwWAVXiBw+edkg6/RN5x8xZMs
	yF2KED1gH9YsgRtliTOXR8M8V18iPcxDHHAkymtpe95VAjSO3udeT207AsPme823
	F473kKrWEnZxGqxa1C7q1ZmvCu8eK5k7BCWM1w6UTS3aePcRam97emPekP8PoFxX
	ZLJuMd4Pnn06cbgS/s4nb2BN3fxCATB0+GYyjM+7yp3PPKwPVnJ1OCgiEgOLELuM
	5PLh4g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44s1yng9uf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 22:27:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c04e38655aso5213585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 14:27:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739399262; x=1740004062;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p2R/RTt+0MfG1Sv58vOwjs183HLY+inpys37nzh2bbQ=;
        b=sQvy78+ltsELAq4p3cGx9HaWQtfh0ejLa3wap84tMRltDNZPRQw9dStj2Bu+XY3/iN
         bTCYpqNxcRlfJZEzTmeTPpnunOu+DjwrkuJUP8203XdIQVfDDRRvlZqO86gCHDK7UWys
         oN43KHxO/D5/xqoIZc9Ve2nz5vaGV52JkX2fyN7LI45R3dIfVWtlc0pWcxNc8RgXLGfd
         8xm1rTae3wrBwYmr1uZ7qekhRQq5YVIvFquoRDgvgsAcSftfnulrqPu66OV5OFBw65lh
         QRGjjOh5Bc8gASjP4rdU4S/GaKHUEZX1JOTrl+A0YD3+7AAFUnFg6KIn3g1nx3ChGPpM
         B3EA==
X-Gm-Message-State: AOJu0YyPhIcB6ihMsksFHOmW37fqsTMx4lJGZV0+Bd/5EBCO+9UsQwiG
	CGzEKMePG6eOAAOp/MR7WCIlVCC8IZHjt8PkWFnWbplI2ZjVfMlxZ+UUUaOMCtX2GgQR7+e8Mwr
	Fno3V8EqJ3aIbFJtUqTler5KqTWJ9t9LxYrY309PM6tJPDq79/16PJGI3C6UAmZl3l1Pt9bDN
X-Gm-Gg: ASbGnctXz6XU77xdFEu8PFuhHDsX9ZZb10TuqqNQOfYU81L05hXNUNcLLfTAW+0Y964
	BvBjAZBPx1Gu7ezRZ6GQmcAVuJWfLAvy0ymPgDRtaYBL/qdJONvOxZz35Yow8Us+IvIvsYx/de1
	S+XaYVJzlbOPR6tGpm41INF+m6K+XOJ5fdEductSgAPUbTHBvhAHQpIh4Ed3L38XgbgiajIbiUL
	JQuomLaJjbwooTAeXPOgom70nCuGn1HhLrUoL2brUCB4D7Do1s1rQBhwKUTsTD9bt74LlEXKD3w
	GIawxD6kyPv3IS7xkAW28P8Q9SZ4jQJOnikgMSJJX1g6OShJiyfjArF427w=
X-Received: by 2002:ac8:5dd2:0:b0:467:5d7f:c684 with SMTP id d75a77b69052e-471afed5648mr27378741cf.12.1739399261975;
        Wed, 12 Feb 2025 14:27:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFm7HwjnD8TfrrD8qTdjd3ZCWCL72oFAhN3KcFlNCVuMikLAd4knHaHey2dB/mkKLaZ7ZWWgA==
X-Received: by 2002:ac8:5dd2:0:b0:467:5d7f:c684 with SMTP id d75a77b69052e-471afed5648mr27378541cf.12.1739399261580;
        Wed, 12 Feb 2025 14:27:41 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53376756sm4479566b.115.2025.02.12.14.27.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 14:27:41 -0800 (PST)
Message-ID: <82fee126-4e03-4366-8dad-d8ea98081beb@oss.qualcomm.com>
Date: Wed, 12 Feb 2025 23:27:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: pm8937: Add LPG PWM driver
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Daniil Titov <daniilt971@gmail.com>
References: <20250212-pm8937-pwm-v1-0-a900a779b4ad@mainlining.org>
 <20250212-pm8937-pwm-v1-1-a900a779b4ad@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250212-pm8937-pwm-v1-1-a900a779b4ad@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Jts-wjcZNqSWh8ClkYwRvpMwtig0cbw9
X-Proofpoint-GUID: Jts-wjcZNqSWh8ClkYwRvpMwtig0cbw9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_07,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=986
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502120159

On 12.02.2025 11:21 PM, Barnabás Czémán wrote:
> From: Daniil Titov <daniilt971@gmail.com>
> 
> Add PWM/LPG node to the PM8937 dtsi so devices
> which use this block can enable them.
> 
> Signed-off-by: Daniil Titov <daniilt971@gmail.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/pm8937.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8937.dtsi b/arch/arm64/boot/dts/qcom/pm8937.dtsi
> index 42b3575b36ff4d37df11ccb5ed68e965e3716300..d13f39d81386b9493e33411e7fa0fb69e94644f4 100644
> --- a/arch/arm64/boot/dts/qcom/pm8937.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8937.dtsi
> @@ -143,6 +143,14 @@ pmic@1 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> +		pm8937_pwm: pwm {
> +			compatible = "qcom,pm8916-pwm";

Please add a new compatible with this one as fallback, i.e.

compatible = "qcom,pm8937-pwm", "qcom,pm8916-pwm";

and add it in dt-bindings

Konrad

