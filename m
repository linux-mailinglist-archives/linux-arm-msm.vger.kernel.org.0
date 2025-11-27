Return-Path: <linux-arm-msm+bounces-83580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE21AC8DEFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 12:17:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C183F3A72C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 11:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73B2C2FB997;
	Thu, 27 Nov 2025 11:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yp6uDTue";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zb24Ub8T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCB02EAB99
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 11:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764242255; cv=none; b=pix6BlNWhtuYs4JdubSpcxCqlg58wbTsHDsUoz6P47fkCgLAcNhn6yLcfT9PDL8RmZklULvvO+kHddQol7Kh5Q0V3kUtcJkjlxupDpCLBgrfB4g4EKBv2rkEEI2RepOTGMio3eAvUPKVfgViYQuH4UKpxFRJ4ACrW4fXgO1+GrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764242255; c=relaxed/simple;
	bh=j61bW7CErRTgwkL2+o321ZSQDF0nv5i2pKaRauHC2B8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rDcxH8/XPVbtrFsltyhXw2pvZitCHud4R5V2nWXtw2VfPFmigTE2KU6ovlkgAwbGEyoPLVzF45ZpYYL4tPWuL+ukbopRax7c97JfVEkb6MxGA2yJqv368JlRA3U5mECQ6wdatDu9A0MyUiWezN+wB0ULOINqGxShvdOCnHB0TqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yp6uDTue; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zb24Ub8T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR9G8k5606797
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 11:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ci/37DlTmxIfU8Bj0sC/lZy7VV9scGlmmWwDe8TzOzU=; b=Yp6uDTueOa/0AY1Q
	LjECEL8Jio10tBDtJhhKn1Mol7IDjJwyvIve3SYLLiNCbO1lSwrq5xLAeSJ9wNkK
	tBPhKsdzPXDyMKzVNHKzwznERPPYNsratU4V4ZrDwKHDneNTXHHIuTBu9HJ7jV+J
	bhu8DSs2HhLM1j3bn6YzHK+oQUDHVubsvGkOY8Uv+eqZC1eNjXUnozVoia1qi3ld
	6Mo791QDbVdgh3bteyHVBTtKWMx/q6qTcI97k3jW9CnPvN+Ty0E0gepxcLyXqbTt
	6Epm01YBKqlMJe/NU33Xmcjx6t0ABSBL0h3N37h8UHfh2ybz3FYkzWiKKAXLGMgW
	nZrEGQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apkv5gc0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 11:17:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed5ff5e770so1166431cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 03:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764242252; x=1764847052; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ci/37DlTmxIfU8Bj0sC/lZy7VV9scGlmmWwDe8TzOzU=;
        b=Zb24Ub8TDilJzRlMzsjlO6QcAOYEYmpUf02qChCXV/FPpHlTDjaRai84JC1X2SWYHQ
         o8R2sOl0qPK4lsHjOHu9H6Al0Z9u3TcXDRUdQvjtmBQSrNfMYXUEsZI3rQJ1WJYyGUvb
         qAopyibDcl8iWwC0h9A1rWvLhvdF34gE8TUhXxAm6vFCglwfr45/Le1ZzQk6sDDyT1qm
         TtqNQ/PfJoxuuFUZIuiNh54yaOUCymbP1Nka6Lylmd1Xx21eNmr5sGtSoXc9GFJjRBpS
         gfOGjhSMtmqKUws+6r3M7e7S4xR4KCZGgDZPXiE2Sr5ZxQgU16ifuGotYMZGfYoz+k1U
         Np0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764242252; x=1764847052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ci/37DlTmxIfU8Bj0sC/lZy7VV9scGlmmWwDe8TzOzU=;
        b=F0iBQWlxP+UpJyDE8xIPNywKGPMlaFve+4kdWgg+qJ3CwtS5tX4zvgq+USs8RVLX1h
         aaoRORsMcqa/yjb1QnDhdM1bavPu98eqYRTef/iwbW7Fh0lzlzIr/ArNyxJHsxtLYnhb
         zDPtRQNpSJwTuaFtWVuewGD1Sfeom3WuYtVIvzHSj20VyOKeHwOKnOsaPHzypLZe4NdH
         wlTqlT4OL4dt96TtskIg2Kw22CBHbe4B0qtyPfv3OQReFwbjfYCXfDK2w7K2M4JrgQ7n
         vk2XDzGsX+CyVRyoLEQtcPVQ+7fMKGHlAK2k5DLsSRZ0q9eNO0+XcqH+u9Pcn5EzJQo5
         Gosw==
X-Gm-Message-State: AOJu0YxMg3r8DHe/zoUyN7fmQdKfdybH77cv4mpaOlfJUqQs0qLM7ars
	FN1NjdXo/q/tRgbhszLhDnPuFZYyPsoxgba/Kj2Nt+j3odbURA1YlEAPG+wkMemsFxxNtDr+1lx
	en4m4B1p4TVV1GGOwaoWmaFxCOtUqZAczkLqbZOXwQpNCaYvvqbN+TG6ZhBJizN6DNgSR
X-Gm-Gg: ASbGncs0QFdfeICBR7mpAQy/jYemz4LQ9qtMjckVipouXe0HU+9BQyonug6baHWaZAb
	zheOKDOUozUGMzBSZoJxc7hle9rPvecW3bIyAZC+MZTb09QPVhpKuoRCSlLJg6KKM85ayFZDko1
	fyvwnQacsTebSMbI+Eh+gLhf+zHZg8tv1S7m20ldo1FttKiYVMg6A1wdzGhBUuSfijfzYsztr9Y
	bWOz6h/YdKt+KwuI+pzY1WtqtxOcVUqoq4wNvfy3J2OohdDfBy6dFeeAC1Hnx/XOAiYKG3Niv26
	r76vbmCxywnBrybjWxC24W+5K7BnKs+bSOcb3F5WEk3cqmgkO5N/J+a/QB/qicKfKNIB8cTeBZV
	pbRiFF5H4Chxl69cPAON3EEXN0CdvF1UZFcjKaioUiMgyEGyaj2dQ8tqDAWaJe9M1W7g=
X-Received: by 2002:a05:622a:151:b0:4ee:1924:c6fc with SMTP id d75a77b69052e-4ee5883a43cmr226703631cf.1.1764242252102;
        Thu, 27 Nov 2025 03:17:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWrKzvgUfp7pp0dFFrDH8KDul8sGDdmqACAOw/2L3t7uZiKm7I3Nq5DZgJOiLy/6fXAl6I3Q==
X-Received: by 2002:a05:622a:151:b0:4ee:1924:c6fc with SMTP id d75a77b69052e-4ee5883a43cmr226703291cf.1.1764242251587;
        Thu, 27 Nov 2025 03:17:31 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5162bb6sm140900866b.12.2025.11.27.03.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 03:17:30 -0800 (PST)
Message-ID: <61e9791e-5222-46f4-a13c-6358a06a3912@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 12:17:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dsi/phy_7nm: fix rounding error in recalc_rate
To: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251125-msm-dsi-phy-7nm-clk-rate-v1-1-17141806e3a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125-msm-dsi-phy-7nm-clk-rate-v1-1-17141806e3a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Mt8T2zIlxmGlmPXmKHApThQ_lvdIBid-
X-Authority-Analysis: v=2.4 cv=O8k0fR9W c=1 sm=1 tr=0 ts=6928334c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vAqZcY3_g_uuhliy_rEA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA4MyBTYWx0ZWRfX/1cwxWbsADmO
 zPn8iLWIdmsf3aZ5prgXnF+zPNJgfuTZVU2tqJ1Za8pFYpCCfG3ptBPpt+TFXCDqBK7ByN0C0K0
 4TpeE1oI65OGraHgTOlbkVsyeJa8NtCD9PKI/1fx0woEwwmNnRTzT0kclaot9QvHuTF+wDnT+Gb
 V74MInueUUu1g2y98OV/Y2spIuyLdS6ghMkEtwap8ormXnpQ4uP3ujGgSzoWXcm+m0GEx21a2pl
 AjrLxqU3t+QIEG3WnfXLD+xZaOFeaTcf28vTj4Ja4d8nwf2VyOQ7omn3FQZxDU+ribvhA9R58CY
 tEFLVaywwEM0Zuoav9p5r2d261L9XQkDmnrdapxvLUcU+vIpiFk1uqKOn/dAvPbGE8lC1u909Iv
 XOmQfcPwJGqLr28HndtNxNUuxMdtUQ==
X-Proofpoint-GUID: Mt8T2zIlxmGlmPXmKHApThQ_lvdIBid-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270083

On 11/25/25 4:25 PM, Prahlad Valluru wrote:
> Required vco rate is set by programming decimal and fraction
> from 64 bit calculation. This programmed rate is not exactly
> matching the requested rate and corresponding recalc_rate is
> having rounding error due to this delta.

Feel free to wrap your emails at 72 characters

> When setting byte_clk and byte_intf_clk from this pll,
> set_rate on byte_intf_clk resulting in dividers getting
> reprogrammed, which are already set from byte_clk.
> Convert this recalc_rate to KHz and back to Hz to round up
> this delta in calculation.

This feels odd. What if we wanted to set the non-1000-aligned rate?
I think the solution here would be to properly implement .determine_rate,
so that when we request e.g. 1 GHz, the clock framework will be aware
of 1.0001 (example numbers) that will actually be programmed

Konrad

> Signed-off-by: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 32f06edd21a9..00f20c5a7c73 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -598,6 +598,12 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
>  	pll_freq += div_u64(tmp64, multiplier);
>  
>  	vco_rate = pll_freq;
> +	/*
> +	 * Recalculating the rate from dec and frac doesn't end up the rate
> +	 * we originally set. Convert the freq to KHz, round it up and
> +	 * convert it back to Hz.
> +	 */
> +	vco_rate = DIV_ROUND_UP_ULL(vco_rate, 1000) * 1000;
>  	pll_7nm->vco_current_rate = vco_rate;
>  
>  	DBG("DSI PLL%d returning vco rate = %lu, dec = %x, frac = %x",
> 
> ---
> base-commit: 63c971af40365ee706c7e24f6a7900d693518f09
> change-id: 20251125-msm-dsi-phy-7nm-clk-rate-26723a3b686c
> 
> Best regards,

