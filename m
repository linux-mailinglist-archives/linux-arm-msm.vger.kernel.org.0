Return-Path: <linux-arm-msm+bounces-61634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E6DADDDCD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 23:17:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F878189DF03
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 21:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38EA32F0C49;
	Tue, 17 Jun 2025 21:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MLLjC4fq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3B12F0020
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 21:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750195062; cv=none; b=BjKbIPUHbrbnU2buUqt4JqTsKuBkq/IW4D49QwjMR2dOZI2Hj0o8wTcZLp37dyFYNh+Yy0FE0IrG8ZUpODLHlXLfx+E+RFfvy1YOR4WbK7o1yPTQ5JnIQ41bCpK4DUxW7MDP5GgXRjU0LhsYuN67HMXBbzE2D4CzxiyUTZbidm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750195062; c=relaxed/simple;
	bh=Oc3wFGHZjYKe6oz/Y/IvLBiaMoXgWFyYaPfVregWfSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y4JQioIuMovetsKKtTpLZUXkbYKwuSpXUjXTYxycfR2oXVpQU3FUizONrQ6uzBkWYDH4IZGs6o0JND2j+CqVHfKCGFaTjb6QDFLGlhAVE/uy1iSnKJ3/yVIH/0Ijqa5TL2hpYr5npmCA5gOWMmV8uj8jHKs8gkx9P/KqurklcyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MLLjC4fq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HDBJoW007205
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 21:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F2B96TFx/KL9jzZyjSrVip1zy+zPM/f/59CxS6xFHzE=; b=MLLjC4fq+VG7/JHX
	Tzb/Hp1CI+Il6vu2th+V+EVEuMOSzEiwC6EaZU892T60l1TmRe0JvB0DelRiLQkl
	ulgnaXV8OwCa80GSA7pUzjrjWUdJvhR5suyuTWcSt+KO2hegZQMbIE+kO/nK7N6g
	puFW2MeZwehuiHxqLCcJ67frG8kR95Erfhb7mdwlJwU8fbjtaYzOlR3qxIwiibbV
	ehS0w88xM3BcPkuwL05Ws+bGt8OZttYIDGNRdqRzO3tEBiQBB4MaJKP+2h3seXx/
	XYXifChGbktNduo+4II3nApP4Pb4VG6rYfct6Zz8emD7WptQIDqYKxvDIDuEa0KY
	F9umNw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791enhq85-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 21:17:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0976a24ceso206346085a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 14:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195057; x=1750799857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F2B96TFx/KL9jzZyjSrVip1zy+zPM/f/59CxS6xFHzE=;
        b=UdUlsTogFoGP3xr6nXzis6ICWIoFnomKeGqbyIRo6FmXx/Ps2bUL8we8S2draiCHNc
         vaffR1uineAnEiPOfXvIIS6o4sgNIpp0ZUdVSfF0tTq1bpvakkplwnljcjpswq0Cnxer
         9XxeYycUy+JCNpD6A3TECI1KIFHMpJ5nmlJYudZbg00Z+3vb4yySmHgdeAm+J6oN0rCS
         Z5oejz0PSX1CjascqTbB+rkilfs7TP7XiV9gt041buUs7BCxSWyCdj1Wg3+rbykZf0DX
         J5M5JA69ae1cp0rm0kpvQAxD1lgbxf87JgTyrbOzJPp0HRlVyCNECj9797LVTluX0l0w
         m7yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpboGstPV9wmCIlzYKYqONcWtkANM6jzNh8XdtZP0exJXHurGS5dtE1k01GO9KlUz59r+eHMn2tngLWJ8U@vger.kernel.org
X-Gm-Message-State: AOJu0YynhRbxpoVw8XaNFDE2nMcj6DU7y63GBv+Yj3h9FgE69hoMvrWA
	RVfwE14ptI7CpfUnCOUwDHmW9t2Yxcwnpqu/9F1r+jcIneV6Ezd7qyg6D6nRJvhE95f/M79NZZ9
	y5l1tWK8hMWpo+hl0ioNLeVku5uvQhDe+QZysaSt2Z3JziHnhCVbJIcLqDQdhJ5sVlL93
X-Gm-Gg: ASbGnculSwnXzEKvU3vr7w2zNTSUUYV0uXOgBYdbQHT2o/ZnmAo+g6qYK65/KvVXY0j
	peRk/IDoBEWt5Dgl2/QHaB3NfaDjakisyioDNWm4kBLBDSUodpqgAp0upqjEvxmL8fx4LvkjAFf
	Y0FUMjeyB6Ko7sAprjEuctqyYS9jZ9nEyJKcafGBOZRnCXlcxIpKlz14p0R7UV2KXjE3rkyK790
	f8C+Pi+HIokTcdelQrhNoFuWJn40s6sUDqg4ODPsJVV2Semle0kZec3OW3q6XpC/6qMHqjGIPUQ
	kJVr1R9N+91iIf7/3cjG8D23WVWh68MoLiCu8oH9rv+fBScph5l5bHdmlUOpdvDrFpg3xQoyPWr
	Vmgk=
X-Received: by 2002:a05:620a:2a04:b0:7d3:c69d:ed69 with SMTP id af79cd13be357-7d3c6c17e62mr872990185a.6.1750195057552;
        Tue, 17 Jun 2025 14:17:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuadPbrh1VUll8Di3mBOdCudw6vbTTmMGIJ2ZdldP2NKImhDqIStGDB8oViB5MQ3gsuN40MQ==
X-Received: by 2002:a05:620a:2a04:b0:7d3:c69d:ed69 with SMTP id af79cd13be357-7d3c6c17e62mr872987885a.6.1750195057185;
        Tue, 17 Jun 2025 14:17:37 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec88fe514sm933483166b.79.2025.06.17.14.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 14:17:36 -0700 (PDT)
Message-ID: <c2e21596-8d94-42c0-9a21-f77d510a8cff@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 23:17:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: msm8976: Add sdc2 GPIOs
To: git@apitzsch.eu, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250615-bqx5plus-v2-0-72b45c84237d@apitzsch.eu>
 <20250615-bqx5plus-v2-3-72b45c84237d@apitzsch.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250615-bqx5plus-v2-3-72b45c84237d@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _ZBG-mxPoR1psH4vURTdZarmJsL4eW9m
X-Authority-Analysis: v=2.4 cv=D6RHKuRj c=1 sm=1 tr=0 ts=6851db72 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=qC_FGOx9AAAA:8 a=HDjIzE35AAAA:8
 a=EUspDBNiAAAA:8 a=moa28MdQsDLXcwDZZloA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=fsdK_YakeE02zTmptMdW:22 a=y3C0EFpLlIT0voqNzzLR:22
X-Proofpoint-GUID: _ZBG-mxPoR1psH4vURTdZarmJsL4eW9m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDE3MCBTYWx0ZWRfX3/4NlGo7EfRA
 oD34VZQbjLS50X/n0ORII6jzMfl8dNIZbKQzxmpj3Mo0gL7sLI/FLgg6PMnoethrUmeT8S0Mmc0
 AqbkIrRJI+2V5Zx8XHUaNM4kvv9ojsSlidDOlfAMnSf1mv1PMqobaEHIJTrwWWlucj6CBNHmppb
 yW6EJGbQjTkeg/+N4m6szVAhqgvcQ+9HrDhtXh/ImULqqO9gEevEh1vo5Co82uzwHXgqwhiwf+D
 DFPQJgweUutOXdINXQ73zywl5ExsJEIlbIHVmcAQhcRexZ7zXVoIbJRS2gn8mmam8iedlBI2aIB
 pcscyHNufF7xwIZtUW5UWJG9j8giqm3CO4+BTQSoPJKN2/OrMOIM9vDrTwb9mKLNkNs5tfY8Mq5
 FNBDb4GuIXM/oYoLFVteqQWsqZlgOTPA9A7cbu8Yhx+ulsBPsMSltctezjHR6v1+P3P0opvt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506170170

On 6/15/25 10:35 PM, André Apitzsch via B4 Relay wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> Downstream vendor code for reference:
> 
> https://git.codelinaro.org/clo/la/kernel/msm-3.10/-/blob/LA.BR.1.3.7.c26/arch/arm/boot/dts/qcom/msm8976-pinctrl.dtsi#L223-263
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
>  arch/arm64/boot/dts/qcom/msm8976.dtsi | 36 +++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
> index 2a30246384700dac2ec868c6f371248cfcc643fc..f9962512f243d6c1af4931787f4602554c63bb39 100644
> --- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
> @@ -782,6 +782,42 @@ blsp2_i2c4_sleep: blsp2-i2c4-sleep-state {
>  				bias-disable;
>  			};
>  
> +			sdc2_default: sdc2-default-state {
> +				clk-pins {
> +					pins = "sdc2_clk";
> +					bias-disable;
> +					drive-strength = <16>;

Should you send a v3, please reorder the bias properties to below
drive-strength for consistency

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

