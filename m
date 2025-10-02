Return-Path: <linux-arm-msm+bounces-75812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2C8BB3ECF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 14:46:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D54C1880104
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 12:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160723101D8;
	Thu,  2 Oct 2025 12:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EwxJL9PQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2958460
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Oct 2025 12:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759409157; cv=none; b=i9nSwEnKAdKj7XF4vlRRx9hvLgTEIcCNwMgoxUP/6PxvXUiwyCJsp+X2I74QlMCxWtNBrT6GEZuiVBWuczh/2bgOw8iLKyv0aTaqcTQzi+e0TXdeCWL1YZKNR9r3q1GTJLtPvI+GDKonnAZO6XOAiXAx3U3DjbDYhEIEbS28o00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759409157; c=relaxed/simple;
	bh=OzzFAPU7JWZ8TpzU3HuOCxPSNDtVN3f9jsR9IwNrpvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MrGdtVanFs5UeW62vcXHtO/gb2CayJ4R240ZDh/5rxX2B44xu5g7dO6qsYU8oJZ2TC1zhJwh6xFoLHCdGHtCgGTG/w2dNHBF65AwAqWIjcMB6z5zUBX4lfZ40DX3kdWStPpDIBNQ5r8hH93F/8Kg786PxV5o/eyA7LDyAVB4T7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EwxJL9PQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5929Cuj2021211
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Oct 2025 12:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YY2yji4SSSuA6J/yxS5x4trG7A7YFsSGcBCsY+ncM5o=; b=EwxJL9PQC7aJuoqn
	LdT9BOUTUxKZRh2dmiDMqqKRZ1wK9Dty8AkT/SPyPw52V+Ty9WWSu7KezbR6s6nP
	HsNY902d1nePKn1WyA75BO2DOMlvpUl+5scfZNG6LbO4m1G5s66rly/8/iTjfYc7
	g/Z10GXWozFzm/bMIpTQGwR3RP/S7dmXvqm3yhW2Tjd30Xfct8IOMp7KezoPfADJ
	PGZY0yBK0YXIbJeG35boExCos6Rs4fgbd+yMAWkWAwi127PvkuPY5SK77/CEtjYF
	T26fCu3re4msgHrScgex0SE0Fz6Ypa+nalasGcdK64pp3c39dyjZVKZqNOnoEcvR
	NYdrhg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49gyu1c1uu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 12:45:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e0f9bedf1aso2739771cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 05:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409153; x=1760013953;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YY2yji4SSSuA6J/yxS5x4trG7A7YFsSGcBCsY+ncM5o=;
        b=Zy95OgHJuDhv/IGDNQmWjelqjpOzChPN0U9U1ECQO44h4cpeVKvzL8iFPLzqE73Nos
         EVeyPIs3rFGQMVI1OcENEbmW5xbPqjkup2G/Gaog2GmotOJS4VvZbtu9m7W/2/VVbt/1
         yIuQo/q1GX0KeyZcTbjHVut+He4GtSnHyhqI6KO1F451N9BDkcB18WDbTqHvjOwc5SlL
         iYBy19jfIDJXBPYrPgofS4w0foy8e6KRiD8Ll5kifmb8Nr/NNrsa+ScXV2auNafVZUvG
         c1JSJ0GNjOFx1GDfa3GLAUj4mPRGsTBugxDE6eVKfyJMNM/qdOTaaW6DO1P2fPETueRL
         x1Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUzcWnN8C9ol9G8K1x/bFlsJJVsvebWALB4WnTvi6u0stglh54riaz/KeKjIHLRxF4x6CRDZ0scvKZQTR4O@vger.kernel.org
X-Gm-Message-State: AOJu0YwO3c9zw4kbJM6ylkhD07czaCeOieU/E2ZL0i2Xvmp3yHVRrH+c
	K3Fzudd/tu+5ngXEeTv+UVyv1RduuOCKSbS7glrkZ1tgPLmlWMiPXuhVsYCFH/r8WamfhI1qoKS
	E5epWEROt5f4lqhi9FiplFv/O6GuoZ1J83gseoDtuphGhO0eLRzpJIPJ5FTIXLkQYB1tW
X-Gm-Gg: ASbGncsAABR3hmhmOPEyfVGLwwpm5VayHKgxdZukmHZ69CnbsAlY2e9U1BoV/T3MuNN
	Cr4WFkmzQeKCryRlyaok6B8KB8LrCkiQE6e9CyUpN8ZTIJoD/iA/lzFf3UzRdLDO5vowz6EKvgp
	xrKPEe656Aaac+Ruk/X78WUmG0zGEk+TVXOP20eRjjCUlpQOaJhduDzcjdM/Bm5s4qD8MmS/mHe
	GXg/TWtTJZz8Tfr3evVbqmPMM+zWOKhjydxd4WhTIrLuxwyTONCtPvGPCORLh1/s7r7PskYf7x7
	+j3Gsr9FJQ55Ovc0XiHfch71ED3T/oyLvcvwqUSNH5htNjkf1/ZwH76JeEhk+75riPlbr/eTYgM
	XEoGf1CPAJGajG/Te5GZwnqXgoRg=
X-Received: by 2002:a05:622a:547:b0:4b7:a9cf:91f with SMTP id d75a77b69052e-4e41db8694cmr60789631cf.8.1759409153100;
        Thu, 02 Oct 2025 05:45:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbmbyMEl5laym4ZtpLS7VwZdkHI9TTQtdN0M0ejOF2Wn4yjL/VQhmP9xk0GUaubrnM6JYvaA==
X-Received: by 2002:a05:622a:547:b0:4b7:a9cf:91f with SMTP id d75a77b69052e-4e41db8694cmr60789321cf.8.1759409152494;
        Thu, 02 Oct 2025 05:45:52 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865e7c47fsm203494966b.37.2025.10.02.05.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 05:45:51 -0700 (PDT)
Message-ID: <1be80052-3ba5-46de-804a-de995f8db5d4@oss.qualcomm.com>
Date: Thu, 2 Oct 2025 14:45:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable CCI
 pull-up
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Daniel Scally <djrscally@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wolfram Sang <wsa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20251002-dw9800-driver-v1-0-c305328e44f0@fairphone.com>
 <20251002-dw9800-driver-v1-3-c305328e44f0@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251002-dw9800-driver-v1-3-c305328e44f0@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RfGdyltv c=1 sm=1 tr=0 ts=68de7402 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=6H0WHjuAAAAA:8 a=Q18OPwUwxCoJDF6_gJkA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: -h7kv6GHvzFWlvLj-T_ZqtkqTjnkhogy
X-Proofpoint-GUID: -h7kv6GHvzFWlvLj-T_ZqtkqTjnkhogy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAxMDA1OCBTYWx0ZWRfXyq+k8iSZn8nZ
 93ndMvXJYJvymtLEAP2fTB6HlEXA5mtPuUhQzgAr9JC1E4dRNxkc89b1q+ZYSFmFmY2bt/gMsrl
 KhM12hGsKX/5LWjYI5rLGZjsiSepdpGC3hT8VfLq4Ek/8YNUmbji5awhzPMIqLNp+do6rh6i8t5
 hE2sgY2wzJJUk+y4MfCCSPoZpgFIqLqwwcYSjSrdT/DiwZD76g6xnfh9xL3Ggr5s679gNx0BLyy
 Rczp6iGdf/HG48RysmBhvzv3r7ukVL6mL+SAKXje6I1SF4p1ccr/RWJZqNn008iopZNZaIm874T
 P3CKI8GAvyQElzQOhK9kJq4AoDiQp5wTUpHD2ZdrZcCeTsu4MJmExtBA52vSCnp2/Y0bCPW1132
 wI3BMl2jSppwFzCs2PDhINA3wy/MyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_05,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510010058

On 10/2/25 12:15 PM, Griffin Kroah-Hartman wrote:
> Enable vreg_l6p which is used as a pull-up for the CCI busses, to make
> sure I2C communication works as expected.
> 
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---

Makes me wonder if we should maybe extend the CCI definition
(or maybe the common i2c-bus binding?) to accept an external
pull-up supply, as this is a common problem.. (+Bryan, Wolfram)

We could then shut down the regulator when cameras are not
in use, preserving some trace amounts of power.

Or maybe L6P is already used as a pull-up supply for more things
onboard and should be always-on either way? Could you please
check that, Griffin?

Konrad

>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index e115b6a52b299ef663ccfb614785f8f89091f39d..2dd2c452592aa6b0ac826f19eb9cb1a8b90cee47 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -749,6 +749,8 @@ vreg_l6p: ldo6 {
>  				regulator-name = "vreg_l6p";
>  				regulator-min-microvolt = <1700000>;
>  				regulator-max-microvolt = <1904000>;
> +				/* Pull-up for CCI I2C busses */
> +				regulator-always-on;
>  			};
>  
>  			vreg_l7p: ldo7 {
> 

