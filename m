Return-Path: <linux-arm-msm+bounces-83960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D1BC974E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 13:38:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5F71D4E10E8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 12:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9212230AAC2;
	Mon,  1 Dec 2025 12:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LO1J/y9M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WvjXxDGE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AFC2DA76F
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 12:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764592708; cv=none; b=n0LlIc5pepiJXHXOinW/2Wv6n9q5QqFtgC4hHi1Z33UT7rXKFW7rrjy/6SZc9n55MA4AJ/X9OVyY7NqnIY4tTJi7zPkOgxCbPSmhl+hDCMSgsIjdMl+oNTxZGjJklHNFHYaksG/s4I8zhzMvUhbs1EPe7xzOdjnHDgeMK1/i+Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764592708; c=relaxed/simple;
	bh=KWOuLZ6hidwbE9TypQPKFmH8VsQsNVIc9SSYi6JlIQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YMxxViaXTfNNw2x0D9ltRGVxcFZOahSAPQIJj81un40dwiqlBRohGGHudHmP7sqDHztd1X61QBv2EaizihFgQFTqDU5cW1uoeS45LpgD4md/ZZvUi1jc3U/n96YZufJlSeUj2BlOPjTI2suva8hoTe/GEiwHc2HWCOrzMxbhr6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LO1J/y9M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WvjXxDGE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1A7u2E435893
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 12:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vf/BxP0mgWbgh9NhPSJR1YuUPlhPxjgnkQcac/3egYk=; b=LO1J/y9MQGtuPti4
	6WXEBziCHwB+6CCAeVaL5jgKRLSwJRFPr5UbtivjyMvaYXhMhvLFDouzprkbT5HK
	OyfEB8fksExcRlJe2+NPaEDLLWbbqaggqhZv5p5ZxCqUYf31X0T1brA5AblmdSRA
	37A38/AB5FeehMc+fBg7g3IFYYimO+6RccEZLru/OTb05WX1kyRjqSTXTViGKhvy
	HU8ftrbVUr/bCrkzPj2ZctoCGT9mUY64IpgkALJQ/8mpAj4dPrWQKd3+df/gKoyT
	QIuyPucUgJfM3EPmX+gw8tbWoUZLrPnOnHlP+pROuARncw0AsGMqZl2IK+dUvYd0
	I05aAQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as909rcfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 12:38:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6a906c52so7489261cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 04:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764592705; x=1765197505; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vf/BxP0mgWbgh9NhPSJR1YuUPlhPxjgnkQcac/3egYk=;
        b=WvjXxDGEvZ7pLzP89pq7/ZPcPteFrAMFF6+f8UY9owthp+NazacGDcfYQAdFVEALu/
         SisAUGgJ2+tpCXIwDF10S5v8BwDKEclQn1Jqt1NikFU9YyVlZLVWTUvYYrPjM+UkeNo4
         M3wBxLn8W1vU3eaLevw30ruzrgPI92xvy/lHAPoeWhh8OT8CyXKfgwWSp/vY84Wc4drI
         rii1l6S1pXNcEm5+NnTWzjUKEK5D1D+aItreqWVff0JvXz71mvxRbnEJS6SY8oiXcw3B
         JkgBw2YpHmfWgMYfXnXGC7OAWsAzTc5XgWQuwxlg0w0OC3Zh++8DDA6vJM3OWs+9Zf6f
         fb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764592705; x=1765197505;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vf/BxP0mgWbgh9NhPSJR1YuUPlhPxjgnkQcac/3egYk=;
        b=rXUzBAJBAU7JXV7AFP00R6dAThFs4qMIiI+eWM4g6OPa5g4drzaZUKm3JnMGogkJd6
         ZLQuNYtTfiq54OZVZR/M2Ik9Eb4Kp8Zpek76mJMyG3yS9YTQjRLV3SsNBi76hGjK71VT
         bEbGAQaTfs0Yv7wDouaUo9EJJdxfSsI+97rZNK2A9lKjB/oaoJ1mAUq38i351zdIPEQ+
         uA96mPJP8N0qZXpAM+X1fFdfpsOJFAfUvnGE8S+yjuavg6ExLLti2QxEZi7JqEHnjgR0
         3IupHBHbCP5hz9i53TRWoJbKzdQ3AEYx4NWbVLGIUqSxHhUs7P9NNHAE43vyx9KYeMrS
         iX2A==
X-Gm-Message-State: AOJu0YwiUN7WTKTWkWatwvGs63qunlUPvkC1DqUIVu5bTkyyqfm0hVQw
	ITG95y3TkBs59+PA/uEiWVsPKs82RSRKhd43DB47mQ/m+9SyQr8W81G5S0F8QnmEtrKKvh6HOOL
	w5lB8jLZQRllzbwkh+vkhDeovnGTxbFXMcwmaYMhj/cIJjSbYztFI4RnxP/OA66CB2tyG
X-Gm-Gg: ASbGnctqRy9VeanYJLTEQ1Reia2BkWv4lb0hOJDHkieMKwuiEEdDOTT6Ln0WXVGSFTd
	2Mak/iG43usiFRLtPFxLlI29HRaphsY+P0TCVTKiIkodRQ2b6pvX42dc04iJ1sURxCtvmIbD9+C
	QUIVvAcZ4OrDBtzjIdaExeStFn9+7W+FGxoKm+02BABSX2GFscN/+A8siAl7+v8MM09C8tU5DBH
	yZz3GMvGbE+3ySankMQCiZ4b3eE4Ucxt4sGogyGx+YcQgqmEh0b4ur9NnUznyTll/Uq8OT82h76
	KoXetmh8L2R/gvVwOK2GbTCVHekvSLA7JeY9HkF0D0c3y36UtnaGhUaZprTSXm9Mdor6kPC0r3G
	gTP0swL1T2qmVStsC2C2SjhTJDEMZhC7BykN/Tg+bjzA4xTMsfPvatxc41uz9eQAEjhg=
X-Received: by 2002:a05:622a:1a97:b0:4ee:2408:4e36 with SMTP id d75a77b69052e-4ee5b5c972cmr438714641cf.2.1764592705146;
        Mon, 01 Dec 2025 04:38:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIktgyEHZW/1IMc0NJW4hRWI1Ul1vhVGeaHmxVXEPJ7nVkOnEm9iQUL8B66CQB9NZy4FuBZA==
X-Received: by 2002:a05:622a:1a97:b0:4ee:2408:4e36 with SMTP id d75a77b69052e-4ee5b5c972cmr438714241cf.2.1764592704693;
        Mon, 01 Dec 2025 04:38:24 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59aecbdsm1180313966b.38.2025.12.01.04.38.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 04:38:24 -0800 (PST)
Message-ID: <09e5d84c-39b7-45a9-b7d7-9beb54fb2f3f@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 13:38:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/12] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
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
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
 <20251125-judyln-dts-v4-10-a5a60500b267@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125-judyln-dts-v4-10-a5a60500b267@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwMyBTYWx0ZWRfX6wLC/JvQkLs1
 Z6ppYv14pCyUYcN2kqbL4MD1eQ9RC655YA5tG9VGhYtodThPb4mlVcvvePwptQWwSkg/8pot3vZ
 Vl7jy9RDbL1BrH8yV8UocPn5IqTjS3K2IuCd+Oy2PCNojGp5bl2zueLaeBK4AA2KE+DH4IPnWDx
 wnuQ+QbL3PskLdJLUCbu7aCphx+oBr5YvjYLLsTVgFWB+S5y9TffQmUKYiwmlgPDbzgXLx2ZCVf
 ja4clqxVit9rTDvLeWSERyCUBgzdZgDiXHsbazpz7xG/J2o4Fseb0i1WC4rMRCuQv/Zc9ERhmJ3
 Z545t9FavTbJtTLp1dr/srdJG/aCK2tzD64tmNrzkCjSi57yhwFBoi/5lwqbppA0SOgBFhb1MMN
 hKFPbXDyUvAazRnIDThDIv3kpjlapw==
X-Authority-Analysis: v=2.4 cv=XJQ9iAhE c=1 sm=1 tr=0 ts=692d8c41 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Gbw9aFdXAAAA:8 a=EiCcalQ1L6XHdR4pprMA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: TMDYIZMAYBQGgjv3Ia6FrKtnI3tyCVoN
X-Proofpoint-GUID: TMDYIZMAYBQGgjv3Ia6FrKtnI3tyCVoN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010103

On 11/25/25 9:12 AM, Paul Sajna wrote:
> These regulators are required for the LCD
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> index a61f7bd65a7a..3188334d269b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> @@ -56,10 +56,27 @@ zap-shader {
>  	};
>  };
>  
> +&ibb {
> +	regulator-min-microvolt = <4600000>;
> +	regulator-max-microvolt = <6000000>;

Sorry for not responding earlier, you can retrieve the actual volt
numbers from the hardware by reading

PMI8998_IBB_REG_BASE + REG_LABIBB_VOLTAGE = 0xdc41

ibb_uV = 1.4 + .1 * val

PMI8998_LAB_REG_BASE + REG_LABIBB_VOLTAGE = 0xde41

lab_uV = 4.6 + .1 * val

Konrad

