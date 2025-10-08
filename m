Return-Path: <linux-arm-msm+bounces-76478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C304BC64E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 20:33:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2D02D4F18C9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 18:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B2BB2BFC60;
	Wed,  8 Oct 2025 18:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kBn02Xab"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0375A2BE65E
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 18:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759948383; cv=none; b=srRX+wcm4F3eUlgjYnKtFEIsbuO8SkDgDIeh7V0XFyGoF4eQplsHJEqfxPpEamGf/pUSbwccBUXQTtk7Dvxh4Uz2kpB4PAhI/L4pP8isasO+1V67Lb1kcngz54YLmshMzGYDJvYOmIAwDTz/d3Qwz7JzxQfOrarpIO4sBwx+wRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759948383; c=relaxed/simple;
	bh=qDke/BM2wmbXha3fCsJTXgNDkLrvuoMC8xxXT54rWIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QDzlA3rBcaDESxAVtHsM6TwHwZnLqJM5DUx26IRluRZ/imb4jgg41CeIc9pvMi7gbTMxSquPSJw+LGb/LT4Lzyr7zbn+EvrW7fhMqhSDtWUOzjHOgBMjtOjgVFnc99U3Hpw0UR8VSPH27+aJuVoQUZ/in7QPrZ6Z3eUxNDBIwSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBn02Xab; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5aOs013634
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 18:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uFD4df5RVTDSBvx+9GtUJ4Q7
	lrBDG5kW26hkOSa8Kxw=; b=kBn02XabcCGocFusnfHbgnDuQWz+udQzsY6QxV/X
	NupzML/17+PkjCXr2TSO/QNts0KXHKmDsfrVRZVlWrjKwchjJqKrHN/Ilyar6hCT
	xMojJyUMw91HgYHLcATnP8bgAg7jrMH7JMszaDxhljK0bcHJy6WYwIQ3kyaWlDX6
	Ttczkfl1vHfXeVDWzrs0Zx/MJrY5WGnvnjJZuvF6JLb/MoRUjI/aqTs0o5bYQBU7
	RZMWR1QEnHl9XskyXNn24Y/VFx4nj9IymCenT2n9lg9pCjxeRyGDywL5RaHEOuir
	BbHeKmry/irlA05ieDpKqINMpVTA1teSnErBr7N13Wi0oQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4j086d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 18:33:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4dbd8484abbso2303841cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 11:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759948379; x=1760553179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFD4df5RVTDSBvx+9GtUJ4Q7lrBDG5kW26hkOSa8Kxw=;
        b=guC0S7bXvqgM4zL+xUWwdAUuk+6J1Y/CryCV9YOb+rAP5pfTHGh7c50MKkX4CfCGBV
         r1xAN6UesgCunVfrFy4X+ckrAZMOd3jJHbdpwS+GMILAlup+hozSWlwLBViNzqu61Y/B
         /qVQOgRDYLOm2nB0ledpdAhfp74hYgyo+8PFwu/t8RT/oML78xVm6wHwY25nsn/J4KXP
         vqWx7bowzwEiJBMLs7OX4uHNjZscuLy1QF3C2NGBiwNYKUT5y2/npyYzlmF+F1hv7aq1
         NXd9lFQbW+yAf5fxLoVKwwGsSvO16L0GHveI0RDyf//tM6ZFAiw4ErKOO7Hh8f0ZquM5
         4ZHA==
X-Forwarded-Encrypted: i=1; AJvYcCWjrn1xbJ125/FiKr1nnwhi0ivzYBF+2ksUSqA2hoPVWf538BS3DuHgwrfAbQT1fX7ElI4RH26zzltA/aCB@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfe4UVN3dYwN+QMSpXNn26VViz53yWHa5CIeSNZETQ/rTRXcXm
	47S/aRFyA1Xf3gq15QEcNMm5qfL+PdjXD2DbIH0/4YGlj53I0Ppni7vm94Y3YZ+6BUt24xA6eGr
	IxDpnZj0WYRw79OrZji5TEs9Ls3Hibbta3ycnaSdqcf4Q76ieSklyTBqijLHWz8+lzSQmwqE6qh
	7W
X-Gm-Gg: ASbGncv5BYCT8TyYfrKAmBKfLwNRVvvEGHgrQH7pYaB50vK6xlCAoEAPM1CfE0lJco5
	6t3BPof08xMP4vZfWh3+Uqc1lN3A0Nd0j9NcsoUZK5M/cqFycvu1OJ0FPTHPutJ9zJ5JaTBD/1V
	gS0abC7+s+q6td8ki7KhQtCvLiZDF3gn1I+gco9ZUmyCe+GDnQhuzwNABDiwqOWjkoEO0064/RL
	Z4Gq2zMmO+5iJAFXMK/8XFzBFr/fvXWr+UKxSk+NJKNZFwoCL3PtW6h+0+SzQvfVCIla86aNhTN
	zGAfSFfmDeU6rqp31dkfU6XRc7WixaCoTEUVp/QZhAr1uCsrob9eyDGg4sUKwOPrlX8bXssJnFp
	sE+1UZ/aSRiKAmdBQ6J5B7vNQHpxDnubV3VByuu5WMDc6yA8BychtF57Ohw==
X-Received: by 2002:a05:622a:4243:b0:4b7:aff5:e8c2 with SMTP id d75a77b69052e-4e6ead657c4mr64863791cf.58.1759948379394;
        Wed, 08 Oct 2025 11:32:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFr6nmjALj73kuexerv1ij3pJGq6WPs4p5tau95RG0qWiEpKmUR81JMI62GzhoYVdRJukhxfw==
X-Received: by 2002:a05:622a:4243:b0:4b7:aff5:e8c2 with SMTP id d75a77b69052e-4e6ead657c4mr64863281cf.58.1759948378796;
        Wed, 08 Oct 2025 11:32:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3bd2f3csm22438751fa.59.2025.10.08.11.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 11:32:56 -0700 (PDT)
Date: Wed, 8 Oct 2025 21:32:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: msm8939-asus-z00t: add initial
 device tree
Message-ID: <q6iwjhhzr3gp27jnytm3xa4cxi7tw6h4x6grpvtnnxjwfhp2p7@25vjxdyzy6jz>
References: <20251008182106.217340-1-xerikasxx@gmail.com>
 <20251008182106.217340-3-xerikasxx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008182106.217340-3-xerikasxx@gmail.com>
X-Proofpoint-GUID: 22TWSLpGTokulY3F9KeC2aFo-7JHcLaW
X-Proofpoint-ORIG-GUID: 22TWSLpGTokulY3F9KeC2aFo-7JHcLaW
X-Authority-Analysis: v=2.4 cv=f91FxeyM c=1 sm=1 tr=0 ts=68e6ae5d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=rlI1ognr9DFfacYL9GkA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX6NjY4gJgij9X
 JvBThA6QOYbca6XGwsA4oEYFkYai4eb/qIwXa4XHr91qv0hzxms6+jEU6Q44+kKsjj0A5DBBZ5A
 lVOGo+vVJ779AsfGJ7HKIIa/Uk/CIksq8pgH3YqbcXq3+Ee6YTJmxpWs/2sWD5TZ01PVi8ZdeYC
 /gBJtUyORVwBMShZMvXGXqnxHQghByY2ZaeuYEYqu57m0aLgP2sAMfS+LKAKytGvdVoi6s1WEoX
 oUEjj2QWDxGigguXaPjWy0OMndOePxrAHM8FYMoAvcCF36ibCaBFlE1AXErj37SKijnX0Kg5XVR
 T5gougoyYLfG5uUNwHgsV2leJ9Zih9dBOVJI9wc3JFUZtMeyHoVI2rhFxTZ8Sjjs8K04vF4EkFN
 EbKGluk0t2BxDsGacR44jd/TReza5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Wed, Oct 08, 2025 at 09:20:20PM +0300, Erikas Bitovtas wrote:
> Add an initial device tree for Asus ZenFone 2 Laser/Selfie. This
> includes support for:
> - UART
> - USB
> - Internal storage
> - MicroSD
> - Volume keys
> - Touchscreen: Focaltech FT5306
> - Accelerometer: Invensense MPU6515
> - Magnetometer: Asahi Kasei AK09911
> - Vibrator
> - Audio input and output
> - Modem
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> 
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 256 ++++++++++++++++++
>  2 files changed, 257 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

