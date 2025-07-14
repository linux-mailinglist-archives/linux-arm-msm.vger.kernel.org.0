Return-Path: <linux-arm-msm+bounces-64869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 854BFB04817
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 21:51:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3C1C7A6612
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 19:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36CA2309B0;
	Mon, 14 Jul 2025 19:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WGPQ++58"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7C91CD1F
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 19:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752522670; cv=none; b=DI/FTQpiXqoBCXrqIcg2c70zHhyoTqx8mfvYSvxmhpXCGgg8h7mdPWAhd2E4oEz+KGdRL1sd8HCDJ9+ClpM/E/+nxcMvMalXEQezFop0e7dXwsdokrU5mK4wYi+bLVzX8/zzaUyqeyylL7ImDq81SpW/eX4yfqHgRybnd14s9y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752522670; c=relaxed/simple;
	bh=P2DjgQqNmhul/3Tjrh71ORmKHZE60e0bzK86Zvefny8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JlXnj9ouQcZmk/9Pnos5a9mKk+i5XSpYK0sO6ZKmffEs5wydlmESnRKzbhT9akJegbzZHG/GKagYKJgoKCfFN22ilai+fL9I/08jDSiqgA3Fn3QNJQdCUvsZyBApwLPUW+XB83yYyln4b4gL6DREUzRpkW2vLHbbnjnjoS1MhiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WGPQ++58; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EGSBbS011518
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 19:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=cHAxU5EnEHUmmvSd/XnW201tIJmHnogoSkLScD389cU=; b=WG
	PQ++58bGoF+QZqX8R59+SGOPQ5PGrMacju4rWcCYnLEkDxTgEJpKP7YkBwD154sq
	9WiG72nCnuXda1yJIvewzAF2zawQFDgKGOrKExlFBKoLj/C5y2wPx78Nha1PiqBX
	Twqo/auhtkq8WhM6evSTi0ZYi8n2erpzgm1acGEMk5bghAeqxykWQAqEBUU4Ed1M
	6px2RztULwEMNBz7M641NHGu5GdxX+hx+qOrB4EdMRESJYB1B3te87vDc7l/x3OX
	87+DDYTkC0cUF5H7GaNoudRFJssKsuEC7qnwnBxO9NyxB58x4yf3P3OyrQRN9MXf
	LIGd1bQId2+prm6eMjow==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dygghy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 19:51:07 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-61573600cd6so979228eaf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 12:51:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752522667; x=1753127467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cHAxU5EnEHUmmvSd/XnW201tIJmHnogoSkLScD389cU=;
        b=wRACh44N84YT81VWfGpffYzXdekEHmgiHBDmKHI5seeY9zeBl6ndV+HxfMrggF4De+
         ivvFhqNdoUrsrC7Z0YssSoWeB3sqkIMTHt1hkQVv+Z3tNFDwbHT/3HEIEO8+E7CdnlZl
         vvdDKaJqCgNqiL3tZ2S918a62a4eUc+mJrDkclzR6hVqxASOE20q0uUyKPig+LFymU7c
         cjeaecippekacYZ/WXFp7yShPCK+pAb9Vzl+uforiLSGt5/jnGXSoBoW0HvO8ytGVd0c
         06zd3xNh/KmsNzY1palmXkHPTA6Ny8o7yc5YDCMzJJ9hzJkwVAcKm8tVGVM7iHdArcLC
         fFtg==
X-Forwarded-Encrypted: i=1; AJvYcCWLpPI2dBziPs8/vUib3PEa38B3i9PNUY6nkHyl3hHrACItLld25Y9b3gQwK0fd0QP7VwZOOr6wh1mLlwRR@vger.kernel.org
X-Gm-Message-State: AOJu0YwUNyhEjeat3uZdc4a1FE8i2AT3jOu8JFjhsW2bvC9+CnLDjHK9
	qJlewTS/B0OqL33nm6nBA43Er2CA2XjIs3xA8W5aKqpu+iGKCJwYZi9oF5W+TFJAprEFMO3Gs6P
	k1YP7Y/xKqfnZaO0W0QITU1CLYlfeQgrQ0NtQQquztN9JSuOZFAVSlE7dqA4aeNZ9XLLiIa48Ye
	7CiyuYlbkhMw1v68psAS3JSGJ7HguLdUtP5FzEvvrRY8c=
X-Gm-Gg: ASbGncuBZUdBI2taKdP1HVcsqEjhJqaHig0ri7BB0HydUVuf9y0VsqZqr8lY6U7my2D
	UK1O+b50BaTWpCaT/ridUimYStBsF72MCSbibeCz7uk+wlO151RcB+jPXb0v15wHeADZt2znikm
	8VZ5BWsZayzTvu56qk2NWt3lI5ci5ICrD4k0lQN3oaeNdKQdL8FcBG
X-Received: by 2002:a05:6820:2b14:b0:613:90e1:729a with SMTP id 006d021491bc7-615933298d2mr395642eaf.4.1752522666645;
        Mon, 14 Jul 2025 12:51:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvNOTRr7nTbzGLFYFpm62n4sXgSE9iNBusqXlHlebIghEEjvoyILcY8+9jbV1NxN9chrsAuYDFxtNto888VVg=
X-Received: by 2002:a05:6820:2b14:b0:613:90e1:729a with SMTP id
 006d021491bc7-615933298d2mr395636eaf.4.1752522666307; Mon, 14 Jul 2025
 12:51:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714173554.14223-1-daleyo@gmail.com> <20250714173554.14223-7-daleyo@gmail.com>
In-Reply-To: <20250714173554.14223-7-daleyo@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 12:50:54 -0700
X-Gm-Features: Ac12FXzMmQvS5rnzO5-iDknQYE-6ywvsNV2cxkydI09oPN8GV7Xk6HdI3xrZ3s4
Message-ID: <CACSVV00-DDnQYp-65Pi-XwpEKT1_jYik2=zH_bK_oJiGLxX48A@mail.gmail.com>
Subject: Re: [PATCH 6/9] drm/msm/dp: Work around bogus maximum link rate
To: Dale Whinham <daleyo@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: GCqET8sdq333wVDczf20vXRs0w4ixFwl
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=68755fab cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=pGLkceISAAAA:8 a=B0QqisOVu6ZhBNclzXcA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDEzMSBTYWx0ZWRfX4NeZyRxeVUSw
 cRL/ASD+qeQ0u7q36xDI4ZRotEEg9qqK/Sz3OQ4Zv0JUUluzzBzHU4Vgb1ewwVe+LJ1OscQuOAR
 /naV6v9LNGmo8pojEChdbDS5SQXjnXBvJmCS8Zpzvd3mgQuMNXD60/S/OZfmDXqq5eDQqq4N6J8
 iO46mPH1gzs0DyK4IRgAZtWbvE3lTjI8QXlp+BpTmR+dD1RnJfdTQOM1wDryie4fzfj8C9GkG4C
 L9q4dsdogRouKLra/+DmqLcdVAzZQkiRAe79PonNZ2cWPExDQfYdfxW3gQK8OjwYbbYkvjDTslY
 BkcHVDB7g2VKtasFiXKe4KG7M9Yw7HS9kFqqa902dkP7PGDLge5wGzPO1WWp54f3csGtX8++JDo
 15xU53fuGPJOVusg82SibxtGOSqdOGCyT6+dAdnooXM7JnjzcRR9P5FPOjb/0u36f3nDUMbr
X-Proofpoint-GUID: GCqET8sdq333wVDczf20vXRs0w4ixFwl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_02,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140131

On Mon, Jul 14, 2025 at 10:36=E2=80=AFAM Dale Whinham <daleyo@gmail.com> wr=
ote:
>
> From: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
>
> The OLED display in the Surface Pro 11 reports a maximum link rate of
> zero in its DPCD, causing it to fail to probe correctly.
>
> The Surface Pro 11's DSDT table contains some XML with an
> "EDPOverrideDPCDCaps" block that defines the max link rate as 0x1E
> (8.1Gbps/HBR3).
>
> Add a quirk to conditionally override the max link rate if its value
> is zero specifically for this model.
>
> Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_panel.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/d=
p_panel.c
> index 4e8ab75c771b..b2e65b987c05 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -11,6 +11,8 @@
>  #include <drm/drm_of.h>
>  #include <drm/drm_print.h>
>
> +#include <linux/dmi.h>
> +
>  #define DP_MAX_NUM_DP_LANES    4
>  #define DP_LINK_RATE_HBR2      540000 /* kbytes */
>
> @@ -58,6 +60,17 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel =
*msm_dp_panel)
>         if (rc)
>                 return rc;
>
> +       /*
> +        * for some reason the ATNA30DW01-1 OLED panel in the Surface Pro=
 11
> +        * reports a max link rate of 0 in the DPCD. Fix it to match the
> +        * EDPOverrideDPCDCaps string found in the ACPI DSDT
> +        */
> +       if (dpcd[DP_MAX_LINK_RATE] =3D=3D 0 &&
> +           dmi_match(DMI_SYS_VENDOR, "Microsoft Corporation") &&
> +           dmi_match(DMI_PRODUCT_NAME, "Microsoft Surface Pro, 11th Edit=
ion")) {
> +               dpcd[1] =3D DP_LINK_BW_8_1;
> +       }

Not a dp expert myself, but..

In drm_dp_helpers.c there is dpcd_quirk_list[].. which applies quirks
based on the oui ("Organizational Unique ID") of the dp sink.  I think
this would be the correct way to handle this.  Although I guess you'll
need to add a new quirk for this.

Idk if the surface pro 11 has multiple different panel options.  If so
you defn wouldn't want to match on the DMI.

BR,
-R


> +
>         msm_dp_panel->vsc_sdp_supported =3D drm_dp_vsc_sdp_supported(pane=
l->aux, dpcd);
>         link_info =3D &msm_dp_panel->link_info;
>         link_info->revision =3D dpcd[DP_DPCD_REV];
> --
> 2.50.1
>

