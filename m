Return-Path: <linux-arm-msm+bounces-88703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39535D1771D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:01:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C21773024E41
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C533806DB;
	Tue, 13 Jan 2026 09:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hX+iY9Z3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UVL0yP6B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE5F3806BE
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768294807; cv=none; b=d/aMesph69VoRrZaj49N0iW/ZYx/LEtSztXGPR0BZ85f5qdl6gtQZKpmRLZlMgi0WJzEQgnIr+wLxwUUhEX9UUFuIKQVdbuYo+wNRhfx5So+qjRxP+st2b8nDHcWGu1C1e1wewc+Cxnq9XPA2BnTeoDcal2kvK/DTYeWy4CDmEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768294807; c=relaxed/simple;
	bh=FCF4q9qOJWS9NHXKZoBM8Iw1gaRRvlvQn90wrWegmwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jma6Nv6JrpnPpZsIWa0cuAIyglEsgQGANr5W2y7X5+ufWNMDzgeE6BBecVv9GD8CfI/rTizwbjO/ZAf2R8KdPeg5su4WKeDd9j6+M9Ec9R9abVUD1nPuSsxGgC5wHJi8U5af7CgVowSZrE7UYGQIT7Riq5pzQN/Lv6c9oCe7e5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hX+iY9Z3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UVL0yP6B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5h3OR3816754
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	815T0lxMWytul4mq7PTn7K3i/c3uKyORiv0nGB/LA3c=; b=hX+iY9Z3grFRMtgm
	amM2cTlj6Jn2G+wam16kjJXHFUJG/HqBRLt1OLGH1sKpsbKINAfg0wkLh/DyJ4D8
	y8uTTZdoNUA1NVCLmA3EeApUPLsKYP3myGhQxRztBaxmidpvsm8JkpqCLF5wnfKL
	slcUcI7WDNemjQ6bO6k7svLcphB0y99GuJVGPr42GJa089rEYZZABEhs1UjMu3lh
	1N3iHcbP8yR1hnJLwnu/GZLLQkPn56XFVItGMA/HkYjCn2IVCoP4pKrXjbdkD87o
	QYlptcM+U1JC2IDwW1qkov3xbyctPt7tDYJKLPl2Y28i2s2tjV+3C690FgQ4m9lG
	1zUMYg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng55rjhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:00:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1e17aa706so38668911cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 01:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768294803; x=1768899603; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=815T0lxMWytul4mq7PTn7K3i/c3uKyORiv0nGB/LA3c=;
        b=UVL0yP6BvyK/czYpTwEOJGnV0RotpTHLaQqRXm3HJGgPnNvNLbhnS8/x5UQeKO7YoA
         jaAWyPvdIOy8aAQk75PS52lhexnN4QUl/DDUtnUOVR4La5GypHtEupC/Hdyv3snRMtQz
         PqrhCUo91pop1qsCZqO1xE7KR1S4biXeSSJyk+6QTNR3zYXwJzOKN7A2Uh3SPjnjAiUg
         8EymotSkDB0+jAVnzW0nC1H3mwLPOyrfdmiqs0K1qRgJ9fSxwG1B8v+mqafw5cXEE8uy
         ZsawxmkiaipIYl6UixyVfHqqMKVLbodB5L7KXphN9pO5GWZh88stNM6ByGchjuaVSy/4
         3U3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768294803; x=1768899603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=815T0lxMWytul4mq7PTn7K3i/c3uKyORiv0nGB/LA3c=;
        b=fZfBAniUAUO3SJBdYMlQ9ySD7JjlvQ6jcdkFmVLJqw3YUx07BmHOqLLsCWFimZwULn
         83Kn6jdkkX7AaaReeDGVevp23qKn/Osm+mdNZgMvijEU4XJknKxyTFaynlh9nbrcW7J3
         AzFuv8Xy2hdK0Ss9zAIfGTlVfiX6Ds8gNpbrW1mbhmCFXRyKwumWNvxlqMF2pzLTaAWY
         FPFa/pEgVjj9J0Zdo85rlmauxwLCTYf95v9OtrkPiacluleb8iN/abz9WBPhZkU8V8U8
         ncBfZ8TsbjXHP9ER66f+idTkzbDxYGmoK/wPVdGin2dvC7pAJl/1E1CSCP6paLfhCT4k
         s+Rw==
X-Gm-Message-State: AOJu0YwuB3ZbNgdfaWjZBjsYdXu740fy997YI4iY7rF8EUNJiGRH3GTQ
	HJYzg/566M60ABH65LeIRxCLrC+4Av3NrAKe1eqKds9NQJFnEIe3d+esyxsbf7ebes3u4ShVKXU
	bmLRGEsDck67zbvu70awvZTG93gTCRgrq0jSKPgDrBFKX+XLDeHIETxCdqBSBdFLJZD2B
X-Gm-Gg: AY/fxX7GPo4PCOgLUPt8m7T34G7WLq6YIi0xh9fgs1sPJG6vrH0WUX9qyd1vELdzyQg
	IhqsbGLGpJ9laesOFrFflOdpzde3Ow1/Y5iCOcUCNnk1UyyL+cLqnzwYE/zJZsrTs1MdLGlL7Cb
	aEGOfh7roIVCBZHQs8MT9qQ9gFKappx3UKNeiI6SNIJ+QDolHgvGNzrF+Sl5b/s7o8mTG7RJgBS
	XJ10TM3fCwyO6VzqBkCX9/jRWqWjyWuTsQXelbmGv1Bh8/pM6No/MpEwoSNKrnRpq0+D0AXmuhv
	CU8bFdpDXg2NqpZRy11PKTgaAXIfoktp+Az0pM+iSfwx9HApwjDCkBRzhwX8gd2p0fdHvLEdODH
	44A/4jsM/AT0UpChb7i7HAlj4n3rGYsQw4PkMcDZnM7Ts5dUToHIRbKBlgDviEnwitNk=
X-Received: by 2002:a05:622a:5a8f:b0:4ff:b754:3a52 with SMTP id d75a77b69052e-4ffb7544295mr214248581cf.0.1768294803225;
        Tue, 13 Jan 2026 01:00:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZ8aGRfOzjpjUfk8j8SqmbSv/9Txkex+3v7i2/la0oLmXMS5y2aCzoIybMk3Mc0fUN+b1k6Q==
X-Received: by 2002:a05:622a:5a8f:b0:4ff:b754:3a52 with SMTP id d75a77b69052e-4ffb7544295mr214248291cf.0.1768294802712;
        Tue, 13 Jan 2026 01:00:02 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86fee09153sm877245066b.29.2026.01.13.01.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 01:00:02 -0800 (PST)
Message-ID: <2853a139-8ee5-49ed-8c38-4951a8b03ed7@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 09:59:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Remove extcon
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Gabriel Gonzales <semfault@disroot.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-3-8e4476897638@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260112-xiaomi-willow-v1-3-8e4476897638@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WrPbqzBiQb_XQq0ew8E2XEahDL2vogX2
X-Proofpoint-ORIG-GUID: WrPbqzBiQb_XQq0ew8E2XEahDL2vogX2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3NCBTYWx0ZWRfXyXTNK43GbeUP
 unX/v7X8QcITrdK5/n9UFMa26vTjuvyohSGpxLxhG6d6jehWkodfUEOwWXCdG+Jy/hECF3823tG
 brP84WQ1I0F2jv7/KjwJPF2zCc+lwELpYkp6aFY6w/a/hWicXlM8nCWZloDLW4Xs18pbwQq+QoL
 oHE80ZnsOMXzF0VKMThzUH/7nJhp3bILqKIPg1ZegAYNsZKdSREmDpKj05DGKLuBhOiQWnigPK8
 MWORczhNvbklPzcXhY4gIkdVDfCDWUBT5IESxR0uqBS/CE+wfGaAK+S3FkxT3mpTBgucI0kJZx9
 9y6CSqvIFhDVM3nUgyObn7/0zI2P3vIQJ+XlIeL6rWkdurKr1JruoxlZLfVfAwd1z3lYCn+m8a5
 NM6mD6c5pwJGZSHhMIys9ekuOkrD/ayrAQobb7BTLIrnH+/7OvagJKdIU2H5vWqBsLNEslLIhW0
 +d8zOURfqBThqef74Lg==
X-Authority-Analysis: v=2.4 cv=IIsPywvG c=1 sm=1 tr=0 ts=69660994 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=4INKmz3kzACxWPG1-2wA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130074

On 1/12/26 9:13 PM, Barnabás Czémán wrote:
> GPIO pin 102 is related to DisplayPort what is not supported
> by this device and it is also disabled at downstream,
> remove the unnecessary extcon-usb node.
> 
> Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
> index 4c548cb5f253..666daf4a9fdd 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
> @@ -80,11 +80,6 @@ ramoops@61600000 {
>  		};
>  	};
>  
> -	extcon_usb: extcon-usb {
> -		compatible = "linux,extcon-usb-gpio";
> -		id-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
> -	};

FWIW

trinket-sde.dtsi (downstream for this SoC):

	qcom,usbplug-cc-gpio = <&tlmm 102 0>;

trinket-pinctrl.dtsi:
	sde_dp_usbplug_cc_active: sde_dp_usbplug_cc_active {
                        mux {
                                pins = "gpio102";
                                function = "gpio"; <---
                        };

                        config {
                                pins = "gpio102";
                                bias-disable;
                                drive-strength = <16>;
                        };
                };
reading the blurb in downstream's gpu/drm/msm/dp/dp_parser.c this
seems to be the select pin of a GPIO Type-C mux?

Konrad

