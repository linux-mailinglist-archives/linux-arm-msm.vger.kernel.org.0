Return-Path: <linux-arm-msm+bounces-72247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AC9B45475
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 12:22:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A2BBA623B0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 10:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B292D5406;
	Fri,  5 Sep 2025 10:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhf1vyfz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CE42D46D8
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 10:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757067699; cv=none; b=evXSzgpw9k5EgR7PbXo6qOmLie+JvXQgeAPBDsHZuw5+WZZp47LOC0hCNtOm7CdQ+dkQjgLb+oUfuoMg/t9N2+gHMlSf7U08MFlixTKXojYB1hziPqK9HHrNvqSiF+EixlxFlyMABNlVMC619jYeX8Nv2MvFeWvZo3sGYgLnHCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757067699; c=relaxed/simple;
	bh=qCppbG+eQP46tSiZEY0crGxJVA1nNjzZ4wk6qR9CveA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cx8EPKB0a8EaMpfdFZvnl38O8Zi97b90xBn8lSqXQKdWiXvgxIs4sxa3vvp0VMfjnI3BKW8zoeOfVLTH6EEsBZOsYtLgjDa92C6i0gTy5V5czUtfmpuWlkmxxoP0LQ2p6OkPPySoI+dM/ScCOcUbprMJwmtn5pCM1KTZEQraJaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hhf1vyfz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58591On9022479
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 10:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YhX9I5xQxAo+v+fO6pOEhRjl3CA+K4fHzStrCxl2ggk=; b=hhf1vyfzR3s0A5fM
	DAhvWijlnL9vn8hTAJrsAS/QJdRIOzhUHe4DNHvnBAM8c6AlYh6iIUH7pJtEFPQ8
	0W8Qs4oByESPGxBuOwNPJhtOEGmpRK2+H5KNJf/n+NNGQBqGnz6ex49pvHYybjXH
	kxSnv/O2nXS8q3iEocuDlNoyLETuVmh7SPehXjajgThSuYwgnk8O61mLDSz7CqQm
	hkI71xkbjw9EObY1O7inRyc3U/U9yYF6yfqqFgu2yUATzP3N0/ZgjkdL8xOc8vOZ
	c6D3WLQXrPYKgFRfHQ79XI5Pnt3JOGEOoFrLASo8OVKMl1/74j9dkudyDdA8hRzz
	0pa5ew==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj74hh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 10:21:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-721eb9fecdcso4430786d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 03:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757067696; x=1757672496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YhX9I5xQxAo+v+fO6pOEhRjl3CA+K4fHzStrCxl2ggk=;
        b=fqWuo2c4LDn6myqa3BzlE1CEaV/k3hjmGe5vFUcsRVOg9pDDKzJ68tGglCJ2NOkAyw
         KQTnL2Xfbd9pz+SJDne/izMs3RhGfzJAzMuikYMq76iNbzKYttXaYcIW1egiREM/O41D
         HP9V+V+ZLq9JzbYI6nKGPVF9eYdn8+f1CTePZ9GBOujj2WfORlOUwYqOyAGly+13OPPb
         gtZHsFofUjcE8P6z8Q3/HwmgKWudCZRtNQU2qzp9y6bD5hJ+m3de5O3XnNMVE6PWOfcR
         lxk3aFsowtaNBL/DGGhL931231hhi7cRVEViUiP1HyJdTxP6hFpyvbt1lcQpPMrqr/IL
         C1kw==
X-Forwarded-Encrypted: i=1; AJvYcCV4xKubQEP3n1kjNcdt+EsjzhxBt1mpBw8peBFC1hJ25Vddj8fbmLBPv1G9yP8BbIYPJNUQShcbSYgEJhe9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6ZuKbRxTywXVv7flwfStbMkXn2j0RxQ2FqpbOCOI05WXU4Or1
	Lsy10bJ4DrcVAbemrKEUIPLy5+dyg6/qPYtOkvB5jp32dTJ0bQ9z5CYVKMal5meLGYtOzQQBhaY
	74MvXxo5idzU25mH8eAKj0cXQLkQL/Te8uo6yzblIwGXwGThUrC0BLJek/IfyDh6ELHoD
X-Gm-Gg: ASbGncudpzuRH3aPmivLaRNWVi0tHD4oxRm9NLSDDMdUrnxYxmKZauLl8VxJVOg62h7
	jgDsvnflFeEnOKN+TNdzGxvpdKQh35WOl6EYagdIkvqHZ3Mbea8x8fMNj9cEIAUneWC3l4BDfWj
	gejoCX//kWi/MDPGfyJ+cCDRk90H290Vqhayn5AY2/cuIK2kGgVAMdgOT53lN6NtJJj1KZ+KJe8
	ZayO7YUyn+iG+xhubU/YfUaD6+10pakYtqfRk375cQdTq1uTuMytLb8w77OgM8ZdpnIVWbLOwXt
	9m8JxTxTDlleQ+FjSzrg3WS/zrl4FSUslNBCFCp+d9E4B5d13WbLwHk3Uuzl5onARK9yiUn0CRM
	nDdq5gw0/bTwKd2ZXzveOCg==
X-Received: by 2002:a05:622a:1a04:b0:4b4:95d0:ffd3 with SMTP id d75a77b69052e-4b495d11860mr62588801cf.1.1757067696156;
        Fri, 05 Sep 2025 03:21:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsI15M5gOFq5piSlzss18AHTX4GYCxGcCIZkv13DSKshZ+1CACZN6exOPR+BcJ3u0qTjcFRQ==
X-Received: by 2002:a05:622a:1a04:b0:4b4:95d0:ffd3 with SMTP id d75a77b69052e-4b495d11860mr62588541cf.1.1757067695509;
        Fri, 05 Sep 2025 03:21:35 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0424cc1698sm1249620566b.21.2025.09.05.03.21.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 03:21:35 -0700 (PDT)
Message-ID: <2408b467-f1b2-491f-a701-4e45e1a1e823@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 12:21:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sc8280xp-x13s: enable camera
 privacy indicator
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus
 <sakari.ailus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250905-leds-v2-0-ed8f66f56da8@vinarskis.com>
 <20250905-leds-v2-4-ed8f66f56da8@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250905-leds-v2-4-ed8f66f56da8@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfX5T+aZD6ghLXz
 g0T49qES/HpCw9+lIuLtAgwZ16HQ01CTEqCjc9YYkl8ZqCLc7VgS/t6SRvddNnbyfVkVt49EaZ8
 PWU8xsuJJYlSQUwvvXGXWUdXQTF/oJZDYgL3dHTglZfXntPBI7pfNO9H0smlc4pznz9kcvoDNcB
 C3UZ92mqq7j1fK3LXDo6rtiqv8KNgHr73uhWMHtH7MKK1sVTFb3IVndcxxgJxBfgTWgN0PiK3+R
 zVIg0QsSsWjaUK+CEEDpVveFSJCaUfTee6xuZwCz+GEnXWgT+iBjdOjA29bsiyXIHnBbicRrGhh
 xkRk1GfZWDP3Qm1RCfdYjmFNkJkRRlRP6b9yVvjR57gp4kX4IDuA/WHE0r/VzXdN8JZzXbH+83Q
 KE4vUm8k
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68bab9b1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=I76Qk8w-AAAA:8 a=QE2y9RwVZUYpaLmqgykA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-GUID: zXiv-3bad-p_SjaUU-X9EF_BMPM34z9a
X-Proofpoint-ORIG-GUID: zXiv-3bad-p_SjaUU-X9EF_BMPM34z9a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117

On 9/5/25 9:59 AM, Aleksandrs Vinarskis wrote:
> Leverage newly introduced 'leds' and 'led-names' properties to pass
> indicator's phandle and function to v4l2 subnode. The latter supports
> privacy led since couple of years ago under 'privacy-led' designation.
> Unlike initially proposed trigger-source based approach, this solution
> cannot be easily bypassed from userspace, thus reducing privacy
> concerns.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index 637430719e6d7d3c0eeb4abf2b80eea1f8289530..03801b174713cb9962c10072a73e9516abc45930 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -83,15 +83,11 @@ leds {
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&cam_indicator_en>;
>  
> -		led-camera-indicator {
> -			label = "white:camera-indicator";
> +		privacy_led: privacy-led {
>  			function = LED_FUNCTION_INDICATOR;
>  			color = <LED_COLOR_ID_WHITE>;
>  			gpios = <&tlmm 28 GPIO_ACTIVE_HIGH>;
> -			linux,default-trigger = "none";
>  			default-state = "off";
> -			/* Reuse as a panic indicator until we get a "camera on" trigger */
> -			panic-indicator;

I think panic-indicator may stay, as it's useful and mostly mutually
exclusive (bar some multi-OS use cases) with the camera being on,
with the comment above it obviously being removed as you did

Konrad

