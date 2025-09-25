Return-Path: <linux-arm-msm+bounces-75089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC7BB9F30E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 14:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A423387D3C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 12:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4FFD2F7AB7;
	Thu, 25 Sep 2025 12:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cxmr+xaw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F43305077
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758802550; cv=none; b=Kg+Zlxb3x8UUmuWyCbJR6B4P2WqLpa9StV7zZlZQ5ECwLCaVG5bOE2kIWHZ+9rmZftvRBvAVKG64Gi2VxrfcXGfNDXoLi9xgUI24vTACSBPfS7V4Xv2ul1ri0W0Fzxchneq1+O4ImdZ4OGbsMARRbWxdXqCv9G1SjwpBUrD11/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758802550; c=relaxed/simple;
	bh=HQloABzlnB8r/NiJ4QOXbc7ZT8TEzRbdNF3WianAing=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YMG6R/cE4GmhuTYIuGTvoSh8rRWw5ClHuyDu2ADv+qzy+Cdn+FYQ5IyJUC98WVOWs1puikeubLZ/aHNt3bOLy2WqXIQJfPFe78wgbWhMdAXvul6FWAtgB9Q2NkHYw69dzIPV+AMqT890Eky8TTAI5u2TqBYo5FKMFr2O/SzHC0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cxmr+xaw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9bRhf027760
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:15:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ouVUk6EkYRj6EqW6mxcCGA12lGdj8Q5EsB1YmAFNCoY=; b=cxmr+xawu7/OiGto
	hKBFSxw1GOr7BwHSqh1fj6Wquo3GiKjmyDRK/yl1HXNPJD0jUKkKzqWMgH0CvLhX
	krW8IHyL/ZDiyfzMasbn/tY1z/bp2JWwyzMOZ+SyyHAGQNXTUxO70LCU3R+iOrp3
	PNGrN6HvL4o4+gdzd52P+WHgHlIQgDG2QJ6opnagCputPwiQVGJO6XqVVXwfUXgu
	iCPELS33nVpciqC8CmeLbXdRiD96Fwp3oXdGJslWFYza7C92A/HnR+l23HbAbXBx
	vRYM632IUoUHa4mQGfnS8TubLqshbozzT1UCkl5jW8JCL1C0JCT8iex4To2ozDJY
	kHvJ1A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmp0d28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:15:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-85e23ce41bdso10644785a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 05:15:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758802546; x=1759407346;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ouVUk6EkYRj6EqW6mxcCGA12lGdj8Q5EsB1YmAFNCoY=;
        b=uDhKuNraFeqOrdrD5c6gid4xfEoTcV8L5qE2lpLHSmIvK/sSLdQobJICkvK8Mg0uIT
         Ov/ZLyy70Wpko6LpDCstQPd771i7QihUY6be73ltPhic5VsQysKhS1ErBzsqx6G+8cCA
         SDTM0LlQYHc+1mnNhHBIJ+6HgxjCL8VU6ZIbTohC3NVIK+EJLL3vNntZk/U8w/SGUv7A
         I2YOle2aGCxTkBgF3EP7BB3LYBTsGlHVFIyAOCrqeZZtuUxGPxvm8/F+Ux7GReMAiL3g
         AuXBoosv/omks02T1aCgAA0FJSy3Rt9ZIZ79vB2i38TeHPa5kbtTHdmb6Ek8jSucIPyT
         0m+w==
X-Forwarded-Encrypted: i=1; AJvYcCWmmBCAcsbh3nqB0j5E8L7ilfctgWRqV7mMUmA2h1MmcS7S5HBGvjzcU/u1U0wJ4suY61oQV2cprsQ4nTl7@vger.kernel.org
X-Gm-Message-State: AOJu0YzxV0jxwMDOOK/3bcRugN5pwapE2ONRa/7Rel2tQZ6WWBbWYPqK
	DlMPRZ3RTQhl0+XBaSTsW80DadB9jQ6HkhpBg7xFF1Iwa9eTSrYeDuuoVeUrjHobdTP+ueLJX38
	YiOaXTu29EtRfjxm0rbvmJUfXqoWGU7OQLT5/EdwCbaugmZ90VX5PnL2DXfee4p3uLND/
X-Gm-Gg: ASbGncvldpCsKgbY0qaMqcUAv3t94WLRcxuHqDsjTzfzJxQJeCokSYHSvrMwk4GzXA8
	csD4xUYE2JCnIRMwl4FuAedfwhEeWk+nl9jv2jIY/B6itIMsEb2v8iw1YlUdSzUAH1KOvA+XN+K
	xZhjvGASIePLOMcKQ3H9TW83LIEVWEFN3z/KM7PgJQ8sdk60OUC9cshHznWI+IFuYgZtweHlg42
	NXEc6eIdj6R0zGODr1NJ4YY2WM9Lp+F5hDL5m80iA5yt7o76qlHj4Y8SODMCS59BM9YJMwxZq/x
	BiJgv4/p+848bxs1dlQBTM+D/f1r+BmBkvl6TyisW8X3MKnFWuIvS+r4nCL4Uc53M2WOhTF1xWS
	8YnVK7wR1uQ8m8nZzHNpj3g==
X-Received: by 2002:ac8:5d92:0:b0:4b7:a9cf:91f with SMTP id d75a77b69052e-4da4b0490f1mr25219131cf.8.1758802545971;
        Thu, 25 Sep 2025 05:15:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKDTicP+At3tb6zBRvj+8JVoPm7W3lOGpEI+urWVr96LG5JzmbSw4XR7btbmuKOwHogSvf9A==
X-Received: by 2002:ac8:5d92:0:b0:4b7:a9cf:91f with SMTP id d75a77b69052e-4da4b0490f1mr25218681cf.8.1758802545476;
        Thu, 25 Sep 2025 05:15:45 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545899fc9sm153299966b.91.2025.09.25.05.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 05:15:44 -0700 (PDT)
Message-ID: <81822df8-1978-4f22-93e7-87b79e1fc9f3@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 14:15:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 2/3] Input: aw86927 - add driver for Awinic
 AW86927
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250925-aw86927-v3-0-1fc6265b42de@fairphone.com>
 <20250925-aw86927-v3-2-1fc6265b42de@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925-aw86927-v3-2-1fc6265b42de@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d53272 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=6H0WHjuAAAAA:8 a=pLNEalJQesa3U4KxjPAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: dGkmPheM8QFNBqKbKj9fTAfaQsvepj5n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX8Getbs13ed/X
 tUZVbq+JWJ2LKKM/XipO2Cr97buPW4pN958buug3cKaJsUKXjga44n1zlblIJTb6OHu0jkGg0Up
 6gWDMOoA86JBLwF7bCwUoFAMq+/3rYjW3ke/MtUZgqLHbIZDH8b8m6t3pFnIwy7lRiTzdjjKxQ4
 WptqkGyg2ucwcZ417xK2YP2L7OOkAplMVkPWnRCjMBtQ2DP9WHND/rXZXR7j3hm46ObVMXRI8in
 x3MOjhVi5S9z8TMbZFRVIrKJBb0/rsNEdcPaGmySNKXJzUmlzlexQeX4ge0/0I8xVEaktebqAGG
 kU/a1OtyAk6jGhEa4zqnoAeNKhdl5VLCesXAu2+j8fNy8e22uv1qd+3zSV08w9d4O/UbFkMvlLr
 raCriEbL
X-Proofpoint-GUID: dGkmPheM8QFNBqKbKj9fTAfaQsvepj5n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

On 9/25/25 12:07 PM, Griffin Kroah-Hartman wrote:
> Add support for the I2C-connected Awinic AW86927 LRA haptic driver.
> 
> This driver includes a hardcoded sine waveform to be uploaded to the
> AW86927's SRAM for haptic playback.
> This driver does not currently support all the capabilities of the
> AW86927, such as F0 calibration, RTP mode, and CONT mode.
> 
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---

I'll give you a couple of cosmetic comments, feel free to ignore

uint8_t is abbreviated as u8 in the kernel

[...]

> +#define AW86927_PLAYCFG1_BST_MODE_MASK		GENMASK(7, 7)

GENMASK(n, n) is BIT(n)

[...]

> +static int aw86927_wait_enter_standby(struct aw86927_data *haptics)
> +{
> +	unsigned int reg_val;
> +	int err;

"ret" is more common (for "return value")

[...]

> +	switch (play_mode) {
> +	case AW86927_STANDBY_MODE:
> +		/* Briefly toggle standby, then toggle back to standby off */
> +		err = regmap_update_bits(haptics->regmap,
> +				AW86927_SYSCTRL3_REG,
> +				AW86927_SYSCTRL3_STANDBY_MASK,
> +				FIELD_PREP(AW86927_SYSCTRL3_STANDBY_MASK,
> +					   AW86927_SYSCTRL3_STANDBY_ON));

this is regmap_set_bits(regmap, register, field), you can consider
dropping the _MASK suffix too

> +		if (err)
> +			return err;
> +
> +		err = regmap_update_bits(haptics->regmap,
> +				AW86927_SYSCTRL3_REG,
> +				AW86927_SYSCTRL3_STANDBY_MASK,
> +				FIELD_PREP(AW86927_SYSCTRL3_STANDBY_MASK,
> +					   AW86927_SYSCTRL3_STANDBY_OFF));

regmap_clear_bits()

(also regmap_assign_bits() which is a conditional version of the two
is a nice piece of syntax sugar)

Konrad

