Return-Path: <linux-arm-msm+bounces-73789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB7CB59F76
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 19:37:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 240353AB30A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 17:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F308028D8D0;
	Tue, 16 Sep 2025 17:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XjSML6OU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B61D279DC9
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 17:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758044272; cv=none; b=BqqhhzpVYs7NfnbvirvIjtf6JWtvCMJ+JeuSlVn5nJzjTxFNx7aBmZd0ybYMHjCj2193BMiiMGicBtkkBzRA0f/lJwiH8NeJ1jbsdml2YJC2EBymbNOgW94FAsdubPnzZLDPAe5A00odJSDZjpkcH7h2nv19MZ/fNSLHCjGCF28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758044272; c=relaxed/simple;
	bh=o9AjeXchvXfEPKYgjAC9nU9OAG8F6lmbsmC0Sb6EfhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oAnhXxisrzXeqiW0Jfio2cHiOsLFurBOissApGYOWRlsPQf2BlQZl99QpmddghCb+qQqCzJq7MGjZeyjsZx/6/+xxi63KvS36zt82a6ZFDcdcf8TcGWLRsMoVY1lWb2xt4AYNukVj/y0T+H6oH8GLengolZgiHuH5gf+fLcuXXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XjSML6OU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GHStj6020031
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 17:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=asmJMTOYWO6MF0j8LTYTYFsk
	hlkUXWRnPY3+bCKiCFM=; b=XjSML6OUsA7YEzsSUp9jzWcCdOj2nMcPPedHkIu9
	SiBG0MbFV6Eh9qVS+Xi9etlfsevozD7saVGyecfN/LKtlqdw1bGuB3a3EInXjH2B
	dPbYiMHzMSydct75/ZBHqiqAc0JzK9XTfbWVBUYKb4uiVjkQ9EZYsVRIfbojdbw2
	oflzVPFO8/qEfWOD91rhhvYmkL6vor2rSW+mTDuiagjZLfVjj7aVnwj4tdX6sKTF
	DnoPQ0AcJyG3kDCZCNmn2+/akw+kwI3gA5vyKlAFzpbmERkFAcAIwufRc6qF5w/N
	SJ6er7IRlPl+rAL/GMAAxSL5jceGigwoA/poIUa4/As7Fg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496h1snctp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 17:37:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b60dd9634dso134743691cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758044269; x=1758649069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=asmJMTOYWO6MF0j8LTYTYFskhlkUXWRnPY3+bCKiCFM=;
        b=INilhHRddzaYpgMGPZ1ptaRKvy8L5R52BmQEn2bYNaMZqGyyp0dIxikJIWaN99v4HZ
         h3RHvuoajEY8btH4ZsA0qG0BO7AJoKUbYtJzrWph3GocvzsbsPO2pyWAvJMWVVA/HCPW
         lb/AW6/kNVwvajncJ6XuTMdaqf5f7EOkvzxdOCSTxm7Fhocs//r+rpNGJ7mme/t6P70M
         f6BnOrA3cjTUPl3s1h1rsmBFoC0rLTeOmHBR1Mss5BpdBgoamAW0ej340f61cCXrbpBZ
         eT8/W07qnG51JNeGoFpjPVuk/hZ/hYi9xDjKAnHDqsQqxDpwG9Hv18psnYi40QQ4I0T/
         rMWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVd+hdsBVst0NXK0cRBnnmc/Celi4evj5ppJ8eklDp5XobpqsDDzkeXLDlfavneXdYtvIN0+9bhi9HKEYG@vger.kernel.org
X-Gm-Message-State: AOJu0YzOEqIesBfxEmfaTuh+NgeEmwhrDN+mJi6hYyytgsxWP8YLs5Kv
	vym0GB4iCdRpeEpegbuNzlzW5AhB8ThnQlsbjAq07YO8RmiPIYcbFOR7SPWYFF/s3dJSzAW65/1
	k/UKAjNqT8ZglBVApDgWn7cNMtpuNRFmLaZvPCvPY8opFR7cfYjNCMlbSxA+j9Aj+NN2M
X-Gm-Gg: ASbGnctXtdraNmslA+0Nb1Dt/jKdht9h+ogfRqGbX+wFltahUODU3V67lqHPmLePqto
	8i41WRs9pMJsCtFA14vbaN8oUa4xBUQLiJ6bjIBifl3nLDhRAZj1DyLIzcTCmNosi0s06ofAnYd
	O7BSorYtVbe8UD6iLUPynTiUq72HDokA7Y6NDlXPbYuPca9dvP7kGBB/MnqHpNRkQX26Cfbtx9I
	QYVrxDA0dOhWcqZWo6UBmDqA0Bjnzudu6/ALWtqGWswT+GxGVZsoBmeI03Xg+/9b4n0+eqnlrXJ
	76MC3SEAsWF9zsWqZjROnYSnMjnwPbZQ1Lq0NAa3nSrV5OnwEuiFEMEN28Q5n7YBzia0FsFpYyH
	e5X6N9qkF90RoFKO65nWFM1gvcdT7lDRSZLH0k7bwWHqrgY5qrb3s
X-Received: by 2002:a05:622a:428d:b0:4b6:2336:7005 with SMTP id d75a77b69052e-4b77d08c1dfmr178883641cf.19.1758044269001;
        Tue, 16 Sep 2025 10:37:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEINTEPiFvuj+G9ik9pEiQhi0J/sHmetYeMmXJ12N3mEWuP8rQExfbslVak9k+CMhjZMs47OA==
X-Received: by 2002:a05:622a:428d:b0:4b6:2336:7005 with SMTP id d75a77b69052e-4b77d08c1dfmr178883081cf.19.1758044268385;
        Tue, 16 Sep 2025 10:37:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e6460f61dsm4437835e87.113.2025.09.16.10.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 10:37:47 -0700 (PDT)
Date: Tue, 16 Sep 2025 20:37:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH RESEND 0/2] drm/bridge: lontium-lt9611uxc: switch to
 DRM_BRIDGE_OP_HDMI_AUDIO
Message-ID: <3n5gjebxuafxgsl7yl6ife76cnfwblsggsp2kkcrbjjansbvi7@smi7zeexy5gy>
References: <20250803-lt9611uxc-hdmi-v1-0-cb9ce1793acf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250803-lt9611uxc-hdmi-v1-0-cb9ce1793acf@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: gUbTapdyjUwusEm8qix0zYdHsZsk7RlO
X-Authority-Analysis: v=2.4 cv=A/1sP7WG c=1 sm=1 tr=0 ts=68c9a06e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=BgkF6ddApZc5WCf5u_gA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: gUbTapdyjUwusEm8qix0zYdHsZsk7RlO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA5OCBTYWx0ZWRfX2XVObdDI5mnI
 wWAjRKolUMzMXo6TdyN1V3npZYgB3YhJkBr3+EN/XBq5ntgFsFdXIBVGWu+rnf4+22pANakvfSN
 bBzajp0liPytBjw/lRIFF9wDBZiwWcQ+mQpgsBQ+rwwDtLhHyfXX4kESzxRzg1kpEGU/JVddSTn
 mXEpf/vi4YMVu+OsH+U8WskOLSAY1U4/RlWsYnVCNQhOjvZps1FAFny56d61fERaS4+kLpPCrtH
 KbJVrsfMwjSc0gxTZA5hxCCx+56Yv8t6VrYO6boUdYK+eaynTMwPXM03oXFwLH8I/dS6mISDxF2
 UlFg64Rcsr4FWJ2GA1AMdivrx9PzJrmU/7dxhhyONYBu78IfGxvIT9GoOq3l7l23/73QieQDAa2
 037Z3hZP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150098

On Sun, Aug 03, 2025 at 02:53:50PM +0300, Dmitry Baryshkov wrote:
> Use DRM HDMI audio helpers in order to implement HDMI audio support for
> Lontium LT9611UXC bridge.

It's been waiting a while, it got posted as a part of another series,
but I think I'd like to apply this by the end of the week if nobody
objects.

A note regarding OP_HDMI vs OP_HDMI_AUDIO: there is really no point in
going through the OP_HDMI other than bridging the HPD even to the HDMI
audio through the framework code. The bridge driver doesn't implement
atomic_check (on purpose), the mode_valid() check is also performed
against a fixed table of modes handled by the firmware.

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (2):
>       drm/bridge: add connector argument to .hpd_notify callback
>       drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers
> 
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c     | 125 ++++++++++---------------
>  drivers/gpu/drm/display/drm_bridge_connector.c |   2 +-
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c     |   1 +
>  drivers/gpu/drm/msm/dp/dp_display.c            |   3 +-
>  drivers/gpu/drm/msm/dp/dp_drm.h                |   3 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c            |   1 +
>  include/drm/drm_bridge.h                       |   1 +
>  7 files changed, 57 insertions(+), 79 deletions(-)
> ---
> base-commit: 024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
> change-id: 20250718-lt9611uxc-hdmi-3dd96306cdff
> 
> Best regards,
> -- 
> With best wishes
> Dmitry
> 

-- 
With best wishes
Dmitry

