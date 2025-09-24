Return-Path: <linux-arm-msm+bounces-74633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D47DDB9B293
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 20:02:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0B4B1B27FD2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 18:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13429231856;
	Wed, 24 Sep 2025 18:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aIsBhjhf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CCF22F75B
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 18:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758736931; cv=none; b=STtDiHccAjrmntL3xMS8kYuDNIwPaG57fJKAyFD8ncrrUbQGcEAnVOcMJu9oO3/LEeYxro0nbkq1vOdRnGy6FAoxMu84TYVSiZ6e47clhMrV8/H89ej/GtQizGZ2GNmWhoIqyuh3WjL6anKNQh+GOlcay+fj/L5Lfy3JiqLo/MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758736931; c=relaxed/simple;
	bh=UYxYTt5+WfWAwY+aB6i20zZbM+/Pyq5iEdNwZp9YaAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WcHhhssxLX285R937F0ffLvxPg+/huYfulHbULQ2ZEoU1bcYSbGPfbfzBTvQ9hBvN6gpH9c2zdnB7DSOz5KchgRao9VAMERlGxlNC04YYybtePS/Y5rq7I5Bd1ybSSgL1vTfmLsjfnxHgT9f2tfWrkJ8sUFt1iOyaFkQeWedrG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aIsBhjhf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODMWtP023756
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 18:02:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pSWUBIP6OFTuLo6Z1De8G0wG
	CS7yFi6QHVszeQXIBZo=; b=aIsBhjhfmw75Lj2UmgwSjfiFQSyC5lTNEa0QzADr
	I0Tw8NoUyj6lGB7TDddj++G/U+DD2v5KJy2F54bHBz6sIl0qqPiTu0LUPguebZCO
	mdd1IVWYJ8PTVjddsRt+ZWR0RSF/+rpSBB4LiPz4svGae6c8SUb2wl9yVKjIgwmN
	dLr8f76/SfC1vtlC1yuXUHimv/4VhYGm/tGPp0ecxxZtgINrHwwUPD7c2KMmXVQv
	gPbqgkvtvcHfYPaBUhc36zcXniMG46eZ44RpQ7wNVWfuIPB5sdEw07SED3b4TGGh
	BB5qrISaYMPG5hrwvJqDgmlyq52/jBkZtr4FZBh9y8pnNg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0caxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 18:02:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-26e4fcc744dso469305ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 11:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758736927; x=1759341727;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSWUBIP6OFTuLo6Z1De8G0wGCS7yFi6QHVszeQXIBZo=;
        b=wF6Vw/gaXTSmMtNrCgVn87j3fNOB/Mk/05MdT53rhj5c1rSMBOXka71TfAHw8cn8vh
         +o/6fDTwItN8oKC/eoMt7ZD1xLj2vR5b9uqS8MmaNvoSbVKuTY/GBaa7GnXHVvwbQbz+
         hkjgG6mIgdGBLW2AMsri8yZSxwbfxkzot7EbyZcEy4s1Wz6LyUDHtzAC33Z1JzwBuaFL
         TrVpl6kNWpm3pDmor6BaB7WOF0yj5/ELqIujMGM6EP0zvZKBWYKYuWtlNj5BNLQyQ2/o
         BtpmrpbkDOEl8E5MFRfpPNMcRLMB2G/w8T/YZjEs2vX2qrBqA1HG8Q1zBPhQYSjRT90d
         q92g==
X-Forwarded-Encrypted: i=1; AJvYcCWysZ+W7uX3G8imcmPg+8h4I9bcXZzvKyJvjGRuLZi5tQDhWsuiKfK/pshRBc1mmMvhDBtybyv6KIR6ea3v@vger.kernel.org
X-Gm-Message-State: AOJu0YzY1a5/XrbRj3S2DplRDvE4m08oBJLxhwV2Frf909YKGWXHiNpK
	c08b0Sx5f+udWhQvgQqKqEtWqH8jLJPpwPEDpHpMuJYC40Mxf8bCR0980VvrNYBgJ0+0dVKDJWh
	XppTmDpwx0aL1Gkda6Q+qcpnEKTcTpIWzF/YO90qPNf63rDEswMCjkMi87I3a/Z3Uyv9HgdCEz8
	cw4zO6uX72FA/D6KmU3s1syJaDuYjcSJpbEnfbpcejakzM9lkSzlc=
X-Gm-Gg: ASbGnctT2GnktC5KHTDEdjFBOPSq12/gGN7Dk9mwIQ8LSjj4y5Cx7yPVcmEqkWX8CP0
	tfRHcdp2HiJ1HkMLwKAXmuwAKIJU6As4DdzDzIkFP8k03IpbJICiOKTSPSESPirkL1FSYGluFW2
	8GgI2A+5No1+zaGJ1MWuZ3uDiLuteY4lWonabQ5eCsXkfI8TuIse6H0g==
X-Received: by 2002:a17:902:fc48:b0:246:80b1:8c87 with SMTP id d9443c01a7336-27ed4a4974fmr8989355ad.43.1758736926783;
        Wed, 24 Sep 2025 11:02:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5VmtuJaJ4FUTe+FfHtk0uwoMs69qvC4ZVktOshLxRHet1WOOLGg/pw6UxmNBmfwikkG9MfLRfsTbV6YrLk6w=
X-Received: by 2002:a17:902:fc48:b0:246:80b1:8c87 with SMTP id
 d9443c01a7336-27ed4a4974fmr8988525ad.43.1758736926053; Wed, 24 Sep 2025
 11:02:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-dsi-dual-panel-upstream-v3-0-6927284f1098@linaro.org> <20250924-dsi-dual-panel-upstream-v3-2-6927284f1098@linaro.org>
In-Reply-To: <20250924-dsi-dual-panel-upstream-v3-2-6927284f1098@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 21:01:54 +0300
X-Gm-Features: AS18NWCTdNjmJ2KpP_0NKcgbLpYWYdnYEoHnk-FxT_mIPh1RGl91Lr1OC3FQLOM
Message-ID: <CAO9ioeW2AHDM3KSRu-WOvy+1De9tqfhrCNozw5Wkh=CJDHxFYg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/mipi-dsi: Add flag to support dual-panel configurations
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d43220 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=KKAkSRfTAAAA:8 a=JmB1tVOSonE3mgEak7wA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: IrRXA5oR0CUeRLa3Ij7AYUkJPPyKPCMZ
X-Proofpoint-ORIG-GUID: IrRXA5oR0CUeRLa3Ij7AYUkJPPyKPCMZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfXzm6wZIENrTFi
 12OBp/DJdy9Qn0s4E/8GpxM55+CG4ppZBXq5B2Ja0hijD45lQUJhm/fmFBRUkD1G40LmVm01GgH
 RCKTfEL9jK/gMUH/42m+15l0NKQ3t+ptX8TsI4UIULk8tu598ggcQIFkIzgt+NWuW8iaby3qyvE
 HRRX6Thk2xE8NgOZG0Eb9G37bGNcvm2KUwYNhaXwHwD2WgCSSg92oDR/11FzHFLUJeDTwHWBug6
 WkscnzU8LnGfw13qZ0g0O3ezBFLUUbGQ9KtSxeN57xP+kX6XDsb05nuyNb1sEFNoIFS5KO+ahiE
 4Kwu8ciY7TdlbHEenBEcP02rd3pqWaTgrANxbxFPTGsTAJT5WQkHDN3mTrvJjZDkOWKjY6QZS2r
 /Qf6Qcdo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_04,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138

On Wed, 24 Sept 2025 at 18:08, Jun Nie <jun.nie@linaro.org> wrote:
>
> Some devices treat two independent physical DSI panels as a single
> logical panel from the CRTC's perspective. However, two separate DSI
> hosts are still required to drive the panels individually.
>
> Introduce a `dual_panel` flag to the `mipi_dsi_device` struct. This
> allows a panel driver to inform the DSI host that it is part of a
> dual-panel setup, enabling the host to coordinate both physical
> displays as one.

How is it being set?
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  include/drm/drm_mipi_dsi.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 5a85ba01f402a3866b70828391bb417bb8dd5956..0faff285d9ffeb19e4523cdc7bf21c1ec20e6eff 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -170,6 +170,7 @@ struct mipi_dsi_device_info {
>   * @host: DSI host for this peripheral
>   * @dev: driver model device node for this peripheral
>   * @attached: the DSI device has been successfully attached
> + * @dual_panel: the DSI device is one instance of dual panel
>   * @name: DSI peripheral chip type
>   * @channel: virtual channel assigned to the peripheral
>   * @format: pixel format for video mode
> @@ -188,6 +189,7 @@ struct mipi_dsi_device {
>         struct mipi_dsi_host *host;
>         struct device dev;
>         bool attached;
> +       bool dual_panel;
>
>         char name[DSI_DEV_NAME_SIZE];
>         unsigned int channel;
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

