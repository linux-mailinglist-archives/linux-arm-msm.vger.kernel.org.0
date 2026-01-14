Return-Path: <linux-arm-msm+bounces-89011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8A9D1EF49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 14:05:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B7DE3001579
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 13:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9B839341C;
	Wed, 14 Jan 2026 13:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H3WQsVUy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W3FVvWDq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38721235063
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 13:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768395846; cv=none; b=XaBnB+L5O6056uItGSbvrdwPjYC1wiaX2Tsmk8gHKUC2rxI9P1/nC1SHd02LVUhWC5MrlMLI8ilzgRRyuVtO/gtXeVLBp1C4BB5sWKtA2Zqr59Ru94O34U8TTHTQTF827L6atMF4SxFmSU36bOlSq+s+XPjPkQwRSEsqrg0Vt/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768395846; c=relaxed/simple;
	bh=IjYN9iNwDTv1AS+jAYkWswbm93j92j4WmZMLvSN8DCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IRCoDPVWetW3/KaZtjyHeKADpVN4ClE1u+g78QwxjuDlQZUp/IklKnkvWyHcIbbc8FZOVVyOpxtd0cP7x2sN6hwwSTZ75EBH/1ZVTKX+NoNamGLYEAJqaOn/Xdf0/DRjSyUU5nyQc138j7f8ecX+qULMhVJCWtUWYv+Vp55Pws8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H3WQsVUy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W3FVvWDq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EChVpr3925445
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 13:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KJ4ZKrU5wUjm+QcszxQKwHaTpu9hrE5/hQwJ2CGyoKI=; b=H3WQsVUyvLwTPk/Z
	QhLVPVus9LYyP3qSGryrlg7Kdo4dVL3/fTb3iy1gCsZ6+YG6FkYqJ3SXPNkrMxpP
	C7lZNnUk9mOU1I+q1LpgZG60ChLWbolAO6LSVGVQYPS/XxJYtYQaq+YX9vh4deR4
	/zgMLBm03NTaIvcW93UGoPxVNhzha51vtVl9K+H8Apgg2EbSX/FWgFVW1nyYfLok
	EIV8jQr3ATF4GS2nHimqrHD8snHO4IZHtOE1nFp5o4Q8zg7cXAKQO63G754zqEon
	7bShjYxJxN+9yBx8Fjbmz23LYsyFYODAjxEmDrHwJqbqg2J6eUb7mtaypZZzQ6Dj
	DT+Hpg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbdbr1qe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 13:04:04 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5636136aed8so12283656e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 05:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768395843; x=1769000643; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KJ4ZKrU5wUjm+QcszxQKwHaTpu9hrE5/hQwJ2CGyoKI=;
        b=W3FVvWDqILy7LVpOIpZd1HfyqSbUjCUI6PhAsHaCfUMNnrLthv1H+tGT1c2qccg/WI
         4ALWR5S5N32rEQjRMY8EVvGn/htcZi0RW5a0zwEbqwBTMCuFS1JbBsh+oMoslMigVfVd
         ArPXK6mKDsTE0ItPPg7L6SVvYH3bT4ift36FVOqLGM3mtl5wlpaBQz9KP43w4LnI99G8
         sE8oHAS+AwRNRLjISWM56041w8F8Y2v678gphNZwmheYO+XFlJsig3lszSHa+SnuOuPi
         zNQCEBQHWTKqAaxRUn1AQZkVU4D5z78Z7JbGJEclVd1IOSLIafnDmp2TS6wOQyE6pbCR
         s7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768395843; x=1769000643;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KJ4ZKrU5wUjm+QcszxQKwHaTpu9hrE5/hQwJ2CGyoKI=;
        b=TgR4EOpkHCKW3VUOtrzyqT8H/tFizrfhcMIFCEgYW3WA8cgx2rwn7iqG7/s4BVEkKQ
         qY9/pe6qr4YTv85n8Jd2n/9VJnkvpC5CUUp1rs/nXKAv9Kw6E1Sg+j5j7or2kr71u0Zl
         xULMpsO5TbPVvVX8tOeXrNltFaCaiNZmrrryxX4z6sh/u/U5vLrw1EteLLzAowBguDaj
         RmwpLuq/bDJiNWqc4RzKnUUb+wIiFvpley4iPbvklWP8SIVnVFlun6QrefxSoEe0MXTe
         e7Mls6Fa2V1I5vgluqACDmxXFtl3bxbxu2LWH7YOM0CkqMAuQlVxlGRp5aq+N3NRzX78
         PcHw==
X-Forwarded-Encrypted: i=1; AJvYcCU2FNjPQeiZom+09FPN7doO1kHXiugBe9ajHTY/bt3AwF74ZQjPEWC2ePhaiqbieTnoVcn9wC/w81HtRyE9@vger.kernel.org
X-Gm-Message-State: AOJu0YxngDQxcjl3RSAS8oT9HBsbxDX6Ue7ZTgm1Vb450LrTmGOCRiRn
	LVVtl0W3Jw9E8ju2ifnE+D+A7VFf8r7OMxg+x+3CKW6UvhTMc0kapd/BWfRDf0J4tZdU0zt+0RK
	5/mCic/iK028G6CtHWNmxYh0KLG9zZgkvASefKfEZw93wZG026PWsyp6XCElEUTaLs4qU
X-Gm-Gg: AY/fxX7YrOifRLjn+BTTaRgVKoX/lxUts2QJQsek97Sk8N2affmMm+ms0x+1jCm6BhU
	3ErNDlpuY5Unpukkc5P8IAEkbVXuCd01y6FpqsaZlhZbhs/WNcUrS6wmxfaRQE7pfWDAscOuzOi
	kqkpv3mviXniGwn5e8Di2AeSTKIrQqSxh36UqgFmB40WyaprJdCC1Zzc24algz1ZoV/7gPSCxow
	GFuFwl0/EObAcpSAQAwhFphZUgVA1DzyUWIhlwr+KX0trt2VCDUlbOTSRJSQLzCY4ZlqFRvVLlG
	L5TF9o5OW8r/Z2w4IQHSRTX6VrvTBCgs0VfCFWZV8vhEEtExDjqEEu+8ATkcZx7w8BoUtUo4jnC
	RuGW0WzCvpPAkGsXQqsFmK3XLvWI/uJ+swKTbvB62WlWUx0tKyaGBIA71+6y9F2v6RJsqyUII7q
	d7YIcDJqjt16vZSOS6SvrhInE=
X-Received: by 2002:a05:6122:80a7:b0:563:6d01:a514 with SMTP id 71dfb90a1353d-563a0a13139mr844068e0c.17.1768395843543;
        Wed, 14 Jan 2026 05:04:03 -0800 (PST)
X-Received: by 2002:a05:6122:80a7:b0:563:6d01:a514 with SMTP id 71dfb90a1353d-563a0a13139mr844040e0c.17.1768395843125;
        Wed, 14 Jan 2026 05:04:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba104a29dsm663104e87.89.2026.01.14.05.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:04:02 -0800 (PST)
Date: Wed, 14 Jan 2026 15:04:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yedaya.ka@gmail.com
Cc: SzczurekYT <szczurek@szczurek.yt>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kamil =?utf-8?B?R2/FgmRh?= <kamil.golda@protonmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout:
 Add Focaltech FT3518 touchscreen
Message-ID: <qd4nu66ph23gtcfybxilpmphsih3e5hkfzpvsmjyxcnep5f5za@rhxwi3rmlx67>
References: <20260114-touchscreen-patches-v2-0-4215f94c8aba@gmail.com>
 <20260114-touchscreen-patches-v2-3-4215f94c8aba@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260114-touchscreen-patches-v2-3-4215f94c8aba@gmail.com>
X-Authority-Analysis: v=2.4 cv=NvncssdJ c=1 sm=1 tr=0 ts=69679444 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=sfOm8-O8AAAA:8 a=265TD53DL4np_nqDF4EA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: mgqcIJxIea7CGiu7sB_f1HuRiD8hxKn2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEwOCBTYWx0ZWRfX/aYJiVf4VVnW
 j7tgdORmQ5ngLhzqfaWSgmoxGGOnkflLg1zd1ZFeTZrqcFVdB4HLjLiwOVsvPdTuvt5DzRc6t6l
 t6kqBHsojuW/9Z8ZpLFMdk/lYmhKYFlYZWStJzFsxcyRTQ7Qcpmx037TwohWxrPN9KBSOCZelDH
 pgFqS6yHRenEHBnxotc93PRj5HfzE2bJ+gNsua6FTlncizHFfCsBeIOdKKmPOOqWT+TaJy3HmyC
 ChPMPuyDKMbZcHUSUvI3W3+MNlpYWXMqsvYb0cNE7vCJNGTXvwNf6muGAMGsOoasXJv+1RqWk2h
 K4GUw/MWOuMrGArtjvBCzlufi+0D3ZZrJ3DXg9C6jlX0GTfXtce5TwDz5qEoQjHqGzWzC8/XXrr
 PtFB1e1QJjhbQZNoHE7szbfQ6b9ng2LGmMtstV7hhoplLlDwNTZf/nNBla053J9DgtXkW1J33Ns
 Ggo9/6vMJqnGK+VcWyw==
X-Proofpoint-GUID: mgqcIJxIea7CGiu7sB_f1HuRiD8hxKn2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140108

On Wed, Jan 14, 2026 at 11:31:08AM +0200, Yedaya Katsman via B4 Relay wrote:
> From: Yedaya Katsman <yedaya.ka@gmail.com>
> 
> Add device tree node for the Focaltech FT3518 touchscreen on
> Xiaomi Mi A3 (laurel-sprout).
> 
> Enable qupv3_id_0 and i2c2 bus that the touchscreen is on.
> 
> Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> ---
>  .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
> index 994fb0412fcbdf5466f87a325c48b697a37b514b..97feed708d3b6483eab72cfb0ae39be6f5ae3a11 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
> @@ -119,6 +119,18 @@ active-config0 {
>  			};
>  		};
>  	};
> +
> +	ts_vdd_supply: ts-vdd-supply {

ts_vdd_supply: vreg-ts-vdd

OR

ts_vdd_supply: regulator-ts-vdd

(It migth require to be moved up in the file according to the sorting
rules).


> +		compatible = "regulator-fixed";
> +		regulator-name = "ts_vdd_supply";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 83 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		startup-delay-us = <70000>;
> +	};
>  };
>  

-- 
With best wishes
Dmitry

