Return-Path: <linux-arm-msm+bounces-79453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AF2C1AB4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 14:32:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FF886204C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 12:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75F37347FED;
	Wed, 29 Oct 2025 12:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZ6nJaY6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DFC8fK/a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DFA346A11
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 12:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761741304; cv=none; b=BdfQVQp1D/5zB4UGphYl3kGz5BZ3ykef0yb1Qe8BYCHkuash2aO52Er7cWt1rGLl7XzO5nE6sevoyDBj47wJKgMqSIMjd4t30szN2Zi7dT7FUZJBwJ5ajVOWQzZtNdpt7gfZW9RRPI3PVU2Uio+gWXoEkzfGjpTr0HQv0VEZQJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761741304; c=relaxed/simple;
	bh=dnKBgkT1Amxz2EOcqaHGfJ6KsEaQ2Zw2NCM8IZjdjvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o1aqtqz8NjWEdG60OTtwO4/4ijzE4tf9+pTtUlM5wu1HFg39gqS+u+44ZFd4yVLBNUiQtFe3yGn2mxtNyClrxRM+aFmN3xAO/GKKoxBPd3BSbVXZgqe2buU6HKG2sSsXZJwgdzPzT2MHmPIuU4Jwyx2xQcUTMUgiRQX8w1JvojY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZ6nJaY6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DFC8fK/a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TC6Pmd3676883
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 12:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IfxBhg5EA7KNG33hDreKmS9S
	RAlwrx3aLVwNmvAZprk=; b=MZ6nJaY6z1YaZe5CbP8kvziWuXbRFcKTxnHqMQBi
	nxND2dtzHlBuxNcHZxE6PZAYa8+d/bXE/yyiJZ9xeS2khgahWdwlirCIUzxINVNZ
	8z0yYIavabj6XgRYCKLifhXJ7TgZjtiMtSKo4sFY5C6l2jTKVXvDCBwh1Lv/mxqf
	r+O+iksUDFN8C4T5VnsbR7MtmhzsYLfYyq2IwerAa6AKutp3Fi0A7OuV27AHbRKD
	Fy5GQzCtf8Xl6DgPrq8Dr2WgcWRmrqltIyySDixkjIiZm/VlJpyczsv/+OIn55Gq
	WP4j8RICXbt2Ds5KmoLocJ62BTNO0kAdNa4iEtF68K+mHA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1jgfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 12:35:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ecf2adbd3bso27032491cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 05:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761741301; x=1762346101; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IfxBhg5EA7KNG33hDreKmS9SRAlwrx3aLVwNmvAZprk=;
        b=DFC8fK/a6Qw5a3T+qxcsGVXxZdgYFbRWmgYoiNf/94YsQ6uzX6uMkoSuifa9YkZIvv
         0b+C5qoGzFd9j8uBk8of40WhAHF0MQI1ddclJ5WDRkPnadipV2He+CeMNn490qLd6kc8
         00iEahSk+PTrv+11St0LeH8oAw6UlwyDEMeFYjXxO6BngESxkkAm8PZvu1WGnOYnQ9Y0
         /kQLLvWrmCVlktZLBk5qf3hBamdf5eHp1Fop13c7DOBPsREySmmkuB8y4lW9UUyj8tUI
         o3J4DIW0921YZN/0R+DUm98ggTQuYA0+ewQ84W+ybY/kgJBHZZRWU/MjVbVmyxoZphD4
         WLew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761741301; x=1762346101;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IfxBhg5EA7KNG33hDreKmS9SRAlwrx3aLVwNmvAZprk=;
        b=tR7ysPGT/OvWAHh6FNGplh5CcsWEf3dFl9QBj0WT9kqHkuBdOM2AepVNIQbceSm7Fb
         fmNZLnG3DwSZ3NvNgLhfK3NSF450sAsLCPvqVCo+4du1tuKTP7OZs94BGQFZZshGmpFa
         nGqhKY/Y8Owb8Ia2CZFPb/j4cmtvDtKhLMxRlDZZM/g+QX0MDhBMNS83AS3+9XXC7i0+
         rxsZ/8qTMk9kHSNoisaehM9qG7m36NV+atyUiiLHP0SZmywjWBQFQlM1dCOmDgdPWM+z
         j37YT2T9eZ6GUeoAMaKfCOcEoLNVjkvgNlrIvFHHjC/SbclBo8LCQ0AK2lepzx+6su53
         ciug==
X-Forwarded-Encrypted: i=1; AJvYcCV4j0SnICpTpwVxKxheRFPZ9ekho7mphbnAcsH9pUFKIVwUqGBude6crrxNDU8e62YmluRBfVOftqLrcAJU@vger.kernel.org
X-Gm-Message-State: AOJu0YxvuUtnNgS5bLiovFiFueQfzF8Qzsq00cLAl0xwTwxbk2C64S4L
	kOfgj/TaowzjJgzwsMUQjKxNO38WljiPr9YjFnfRYXrbXOqUdATvhmAzgqnp45IBsU1FX4p++v2
	P88QygckhAwgh2P8It+ZURZ+JgkUbeK2HboBf2hC9JZPITu5yA2Y7duA5Rj92Lh6weDeD
X-Gm-Gg: ASbGnctyAM4ktcO0bmZOzht6jRA8PDUrK5XY6FoIQN3ScNuEH4LUOC2Xilks0sy8ro7
	arEba3Tlgmq6/ljRMXFKbDWC0GXH5956AAUNz6JsnB0ubigTn2+W6dufZluGiUx3B1ESIVo/4QU
	LAEzI7PVBy0+FyPQZarsXgmZe3v8Wo4F4aJtUoCmViWrrtKQFvYQns2fZfMf7yOnZnyfzQyMmAu
	vemUbdyIBuJfaqPIypIJn9kUHWHHUKheLA3/lGkKgmk1eFlpG3Ge3BAuu9esThQIondLkJl21N2
	pQMhRkF3CILmlyLcl06VreQUsnEgnIu7pXhFqfG8m7VLtlzXOuUeo6K++5BiK/4hO4SL9FKB9B0
	C0iIb1buOueAbtNu9XXUVut8CW93dJwo24ha2ggVLQnGYP9au6mTVtFRGf9wQo1Qg79tVQyatUL
	O1mnjMIlV2zSUp
X-Received: by 2002:a05:622a:14:b0:4b0:8e2e:fd9b with SMTP id d75a77b69052e-4ed15b552aamr36075291cf.28.1761741300985;
        Wed, 29 Oct 2025 05:35:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHm3Q+dGlW8otQlZhFsV0mtQgmLxmSohXRXXVuIKe3S4ieVAm+unm8XOsCtG+LLQlVUTpOAZA==
X-Received: by 2002:a05:622a:14:b0:4b0:8e2e:fd9b with SMTP id d75a77b69052e-4ed15b552aamr36074791cf.28.1761741300397;
        Wed, 29 Oct 2025 05:35:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-593041884c9sm3457534e87.96.2025.10.29.05.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 05:34:59 -0700 (PDT)
Date: Wed, 29 Oct 2025 14:34:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tessolve Upstream <tessolveupstream@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: talos-evk: Add support for
 dual-channel LVDS panel
Message-ID: <sfxvtfzzstdbt7in6z6ztsjfy6e555fr3sjbi5kqkv5sk77b26@kl57zs7iuuvk>
References: <20251028061636.724667-1-tessolveupstream@gmail.com>
 <20251028061636.724667-2-tessolveupstream@gmail.com>
 <d05fe82a-640f-4a09-9d83-39bb5aff179d@oss.qualcomm.com>
 <9208d2ef-79da-4e80-ac1f-e01fa5feae0a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9208d2ef-79da-4e80-ac1f-e01fa5feae0a@gmail.com>
X-Authority-Analysis: v=2.4 cv=Nu/cssdJ c=1 sm=1 tr=0 ts=690209f5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=AN02phsTtlwncWaBwlYA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 9zI8UC8FBybCmcAQgSQjtFXK6jxCtYUo
X-Proofpoint-ORIG-GUID: 9zI8UC8FBybCmcAQgSQjtFXK6jxCtYUo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA5NSBTYWx0ZWRfX/qkJOEOGRKWc
 pIBapsFBisDry5prKLv5fNS1/VL+TcThK1b1qrAiYfoi3WI4l7Lux4PCwxl6r4hM6Ae9CR1mf4b
 +gLsK/YmNHuNnt+QqGERSpipJSOGD8xcHiScLUyykxX/xoDC9eVfHbkk8LHdUX/rbs+6zGLVAJ1
 jjXLqbZvEzsTGqHDeV6DQwXE4T5KI4lBq5B96F6Y8w14iYIcwlLfufTOuT/wIrgm8RJ+EYmOdM1
 TY5R0JSoGgCUH3tiq6cHF0/AzeM742VZ220sT9D4aziLP/PttR7nOvjdRJNq7Z1jITwIoOSS9Oi
 A3OsGtYJbzYY5gU/A3PXR9Cm4NyXjmwNVVo9S4oOYRzl6TMv5GJPZSAFvrh+sh4WQyUJiwLkvSh
 dEaDm3pCynh9ipRjgCZCi3ww00awMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_05,2025-10-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290095

On Wed, Oct 29, 2025 at 05:50:01PM +0530, Tessolve Upstream wrote:
> 
> 
> On 28/10/25 14:55, Konrad Dybcio wrote:
> > On 10/28/25 7:16 AM, Sudarshan Shetty wrote:
> >> This patch introduces a new device tree for the QCS615 Talos
> >> EVK platform with dual-channel LVDS display support.
> >>
> >> The new DTS file (`talos-evk-lvds.dts`) is based on the existing
> >> `talos-evk.dts` and extends it to enable a dual-channel LVDS display
> >> configuration using the TI SN65DSI84 DSI-to-LVDS bridge.
> >>
> >> where channel-A carries odd pixel and channel-B carries even pixel
> >> on the QCS615 talos evk platform.
> >>
> >> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> >> ---
> > 
> > [...]
> > 
> >> +	backlight: backlight {
> >> +		compatible = "gpio-backlight";
> >> +		gpios = <&tlmm 115 GPIO_ACTIVE_HIGH>;
> >> +		default-on;
> >> +	};
> >> +
> >> +	lcd0_pwm_en {
> > 
> > Use hyphens instead of underscores in node names
> 
> Okay, will update in next patch.
> > 
> >> +		compatible = "pwm-gpio";
> >> +		gpios = <&tlmm 59 GPIO_ACTIVE_HIGH>;
> >> +		pinctrl-0 = <&lcd0_bklt_pwm>;
> > 
> > I think your intention was to use pwm-backlight and wire this node
> > up to that
> 
> Soc does not support the PWM interface hence we are using gpio 
> as "pwm-gpio" by setting the duty cycle to 100%(i.e. "no pwm")

Why do you mention PWM here at all? It's perfectly fine to use
gpio-backlight. That looks extremely suspicious since you are not
referecing the pwm-gpio device at all.

-- 
With best wishes
Dmitry

