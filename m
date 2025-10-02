Return-Path: <linux-arm-msm+bounces-75761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D6ABB2556
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 04:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07E541704FE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 02:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0FD817332C;
	Thu,  2 Oct 2025 02:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ShJwV9vW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E25934BA29
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Oct 2025 02:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759370703; cv=none; b=In9Po7Cm0cDwgKm43+sis46SbOdeYFKG7Gtm0y6ImwnoduiTe6KBU8EvZ5Jt3G/CfNfP6IKSnGVy9SLtxECoB75Qp2ISsbdeNxeq9Ss/OqKUa1HBhouMoCNxsqM4CVfiiMjjWtSqkBaws9t9Su3MImy6+DMaq0/mqfGECKSMx6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759370703; c=relaxed/simple;
	bh=i2h4eZC92yqEJGIKaa/DZItmj/L45/Z4A/0tsjVEhDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EYqwRjBOzWMtMho9ozbjZZfXlD3CkzmlpkhoxKzZyJLBQBHYkQUkSnbdbkLwNwVSbe0E+6qfqj7dWeg4bi7wLk/jF2PQKOE+MO3y9YNpSvRVUyvhCXyr0MBwtOr5AxPUF/JNDHXM+7MuPAbyBGzIbFPBHih+GgHRfieR+WdK9ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ShJwV9vW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IcUEq006537
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Oct 2025 02:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YPwm+P27wbaFxyVh9NuqbEoU
	jT6f3nVsJYKSXWrzzrc=; b=ShJwV9vWy4elk87HvRrZd2nyuHihVI6HbD2aLt+E
	gIJY9rYEUa9aQKCLjOfR3FXB5hN6X/TlCxjxrvu6n6truv0CE7n9K6Mk2ddxYRaR
	TuL/KyRcQe3hkCBSbLT3dZn8oGiGXN5boPszwngQr9A5nrZ61QbI2UhlAk1vvHqG
	sZEl29FomEl3vhBbJhepR5boxOV+HTifcBgzNK5t4Lz0j+V4LkTbwMNqqCzcSWsi
	1I/s9gW2W2mvZuyZPs5YENhUJbRSiOJChjOwdQE8w9ehRcXvibHmeXy/zGokkmnV
	CSW3IzGAe1lcxo8MkVHm7NAfew7fEsdE59xBrSKcBy8RIw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851pe81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 02:05:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d7f90350f3so9881371cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 19:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759370700; x=1759975500;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPwm+P27wbaFxyVh9NuqbEoUjT6f3nVsJYKSXWrzzrc=;
        b=bjX8XzmLmjF1V5oY8EFrWiYKuc9RvDWVJOjzpbRFVoz3iwIafdNEu+sL6g1lAAsZsf
         E8pnTRz07ficiiUXNfO9YM9cKXeYs6aa5IAHvKS9MRdh0AA6C+qX1+mLQdpfizj6uel0
         x2Sc5SXy/JX5ZG7zHKvkLFIEbgXbDA0A378cGHAvFAaRZohhMKkNPgwdrpSNQN6KlVp3
         E/rAXlOk2Jk7k6je9MEg1qtEvCbzdfMRQHj6uvNKxJgi4/L2g+nHdUS5GAsOAbxkpNpB
         8mvcpGZVyoDXwcs3IFcn6VBoD2Pi+ZyivHedUzFC/FUshN/Dk8qNYVoLIhkuFTDUMu0v
         Bmvg==
X-Forwarded-Encrypted: i=1; AJvYcCV7aP/5NVnPdSwTdbNWraGWuKD9dIeL0gcEHJNyTW2orXz+Vli73O1r3bQm5ZtWZuWFFC6gjoqetMr/nwZJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyUtaGLA/D7vqexG4dum35aU/9TII7griBkTm4ssJIsc7Xypygt
	s0qHfqYIoyym6/oBOMtoPx94Bx16xM+CDa3Qfho1dI+ePVeDiYoPp164w9giv0E5lxUbW2twFBY
	9/NNNx/RzJoL+3HEwQfjpGn2n5TbuWlvZT7WycwuK3jMwAMmSzREc2F7Yapjc/9OISMLE
X-Gm-Gg: ASbGncuwWB8vaK054gviT9t8CQZwcFgUaDyHU4QdTawbC3530Mbh3RiPLF/ZOxSWmmj
	rPsmafWprOeVngDjsSvu9O85VdyZfOh6nYq/TkoGnE7b5P91Hrj7xBQufkMx5VKcFWIjU958q4I
	7s3VhjvHqAbmG1BrQSq/6S0uyaSv3oJmJljEFjYbRzoSNyX1iu5Zc9Nq/LeOEJ3SxTPXU1ghVwo
	YW0H1WfGnsAhMaTnEfbADzP1QvHnpvy6rA6M96FRjVl+j+HguUXbE81FGZpdkDQ8oPEqEwj/6tD
	eQG8Ptq9/UzjWp70k3/nSWE13TXjIt0zEcb9g9eMVpcRkJm2BKZnDzH3KGai03gKCdYmUyLSUpN
	V7Tf7Nzxi1fNAczJgYMi6fNQGBTDcn7tqaeEJre4hJWfHi5dqnIfbkupdyQ==
X-Received: by 2002:a05:622a:181b:b0:4d5:eedd:688c with SMTP id d75a77b69052e-4e561bc382amr25329281cf.13.1759370699957;
        Wed, 01 Oct 2025 19:04:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQQGDSt0rHIHFSUzcvM3T/tHBLD+F8aud41rHaI4N/HLGf0PTFbE91tgaLDaA/YTTUP68brw==
X-Received: by 2002:a05:622a:181b:b0:4d5:eedd:688c with SMTP id d75a77b69052e-4e561bc382amr25329051cf.13.1759370699404;
        Wed, 01 Oct 2025 19:04:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d21csm378662e87.86.2025.10.01.19.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 19:04:54 -0700 (PDT)
Date: Thu, 2 Oct 2025 05:04:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Junjie Cao <caojunjie650@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Jonathan Marek <jonathan@marek.ca>, Eugene Lepshy <fekz115@gmail.com>,
        Jun Nie <jun.nie@linaro.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/panel: Add Novatek NT36532 panel driver
Message-ID: <lfdhib6a7ct36nmj3of2setjft7ydrf6sfgtx7qued7qd56nhc@2xol3grm5re7>
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-4-caojunjie650@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001135914.13754-4-caojunjie650@gmail.com>
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68ddddcd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=pJp6QwA-p1Jx72zNNcEA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX7kHtaPIorWKM
 NjLYBYj17wdKghzCG6M3eDjAHDbb6yMIrsvcuL5WykV5j/p3qxnqpBZPgkrR57/hwPxAmrbx7rJ
 ic+uiHMofMpvSTf9T73XloyzCaIQqshWMp/73dKLWcM8I4HkW5DbrkhUaCYGcJqWVMftoH/1GUQ
 Ol3ribjpvQiqWdrRgMKvcX4drToaECcCnRxVFFMBcyWbLyIbpUDDmH9lTwAS4KfW0YVGpH0QtOK
 AFmA0yt9s9wddXIxqeiB8zL1+aufJNszr1K82i0wfucMIceM6jwu8pyKzs5qsFdFpcwkBsWC03A
 gBmY7tSZMuxr3kVJh9dbFEGLfGwTLR95t35y1KWZ237lMB3pOsQOAA7mWwj19XkgKzM5jcN/ZU0
 R4X5P48oimVJV+q2dV0LerPjMeYQ3A==
X-Proofpoint-ORIG-GUID: VfW2ZvbTilJjmn341islpu2hOtAu9t_T
X-Proofpoint-GUID: VfW2ZvbTilJjmn341islpu2hOtAu9t_T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032

On Wed, Oct 01, 2025 at 09:59:14PM +0800, Junjie Cao wrote:
> Add a driver for panels using the Novatek NT36532 Display Driver IC,
> including support for the CSOT PPC100HB1-1, found in the OnePlus Pad 2
> tablets.
> 
> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
> ---
>  MAINTAINERS                                   |   7 +
>  drivers/gpu/drm/panel/Kconfig                 |  10 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-novatek-nt36532.c | 437 ++++++++++++++++++
>  4 files changed, 455 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36532.c
> 
> +
> +static const struct panel_info csot_panel_info = {
> +	.width_mm = 250,
> +	.height_mm = 177,
> +	.lanes = 4,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS |
> +		      MIPI_DSI_MODE_LPM,
> +	.display_mode = csot_display_mode,
> +	.dsc_slice_per_pkt = 2,

As this is not a part of the standard, what if the DSI host doesn't
support this feature?

> +	.dsc_cfg = &csot_dsc_cfg,
> +	.init_sequence = csot_init_sequence,
> +	.is_dual_dsi = true,
> +};
> +

-- 
With best wishes
Dmitry

