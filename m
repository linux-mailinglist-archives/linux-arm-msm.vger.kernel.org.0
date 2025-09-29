Return-Path: <linux-arm-msm+bounces-75487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0ECBA87CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 10:59:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F3383C4486
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 08:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9651A2C028E;
	Mon, 29 Sep 2025 08:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CgQghBqq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB47726CE34
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 08:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759136314; cv=none; b=KkDnRMYIfjuz53Q6Lal/1wSzNYK/A7ZXa/ayKhMJTp8nS5rVgmV/LorMiDWcmijXNeCQqIQXn5VDoiw4AgTOL8Gngu80NHrGr2i2YdwpDkQzQ2l6b6CcGVRuGt6LC1EBqL9PsHKyniZ18AD4JMdULoCLEaoGLVTVMU3aR9TR4as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759136314; c=relaxed/simple;
	bh=W5RVkBnKmsxc6H3VKwcDAVQ0kUrB/s8qRiUIqWgXJjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlMvofILOrD1GGYBnEQ0DT5cmuIAKAl66szdv3gVzfH1m6+YdUJIuhuUsYfIMhHeaHBLeTm9d03l9YjF1tNziBCsRR3tY5XBDA365yDcDBDT8T+YOVOZkr66bOR1Oh3UWy/dtlm9HPAuiGApPQU9d6cstBMM1at7q32irtCmNls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CgQghBqq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SNrQDB010542
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 08:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wSequNqFSYA0hQaFMGDh8sH2
	KqbBMi/C9WAGDMfQdVw=; b=CgQghBqqAX6HNwF8cUOrkL+/imUDeljUBwxSMLqU
	EABUCjKImHemM61jfkSa5ngSAaIIN9qk6jx0xNtyw/ve46+UV8CrZ855qA5wkC0j
	FSgIqWNYpuQxbvCgAz83PFQjPOdJBELHYSvfXbYkYH/oDfo4bcf37VgPicVaACDa
	AII0m6+fC6Qsd6ILfrex1yeoqb6DclNrOokHpZOgLmXoY+CV2NQHiV4XpasOiexT
	GvMBOrNzWP8MbsKx+20UPxjPyi71gb4UoYmKNhadnp/a3/onTUYD1TZcHHZKoqBL
	zVv/0A4znKvD6uCf1A4OqshGicsKhhpGhIwxE8Tp7fwnuw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851cf8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 08:58:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4dd932741cfso76388621cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 01:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759136310; x=1759741110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wSequNqFSYA0hQaFMGDh8sH2KqbBMi/C9WAGDMfQdVw=;
        b=G43y/VL27AkXZ3vYCMOAN9XuvLu8V2DVD+T9GaInUnNdUc88iNFUwikydX9NVsbpM8
         Bb5AxSzeO7PLI3r4KaNub+ZDqyUgSa/CWJM53Ba6KJa7d3nkF6ulPQXoXxXLxqadVzhH
         72HXj1bvZkqNWYHIJZ8EqvEajg7p/JdoxhhUQ6NeOMuDDAANeBBpkLcgtyGZofDDtyUg
         gD8d9ISGOvmDhILJjgGaH743PwMr1/6jJI7l8FQGT+L4Yf4nKEMVlknAiUl6AREkdv6F
         A3uH2mMkdVQl3Du7yRftFhPNittqDxBJ5hchHB9pn+g6BjqRdAMjddwHGzE5hT28nFA4
         6RLA==
X-Forwarded-Encrypted: i=1; AJvYcCVCQ+gsz3mcN+9dN6IZ+U9fA8qISKqWS9WzmU3oQihshzLCX0Cmf4viy7zzqEX0QhNY3TXEpfPLdCfquzYr@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs9QcMGJ/UQ7fR2A6ys2/Y2PsRRZX5XEPdgocPZN/upMpnU+7y
	b5YAtCEuQmpHxXPCyzFHTZNPt9Cnf9V7JIAeCnSEMiFh0smm6vSCvGIyZ8vxjJY4bUUwYvj/+50
	dWgLYkiWIW0hNWBrgiHCaeTSf9oKfQVTdVLwmoK5GY6/1ggL5u0Kgx/1e2zp8WcEnJ07y
X-Gm-Gg: ASbGncsaArkYqWqRHUvTwCRpoyi4oEA5enho89PUXulkosFWHGjxqhX1Z776nGLm4yB
	3aiVU9t2Vup5j5J0L7Um4049JRzXS+p3yH8PMU2uYOOgZKNXs1027WbvxPd85LlZ55xizZE8j5d
	RZCkl5nVf/nDu+PLbmtRW/7SloZXI365p5Fm2FL7udRA0gWJ0ahkXYMBhVHfjABEw+1oa63Dr79
	LN/quTNSFSz6pDpBrgwFFaZRhZu9QngXEiqnFr6ey9XKpHUd8Wcp7ZHPInunOKGE7LoTyvs+Yd+
	b09iZkmTUdo7ZwY7yEskMi4z2wJitIjqfxRYwYIHF30vjjcGddSEHxPGnH3gKNd9FnHMXOuS/67
	LrQqMr1y5FATmj4dDCU4yhpKj4E9tH/ywKeBB53Ltkj75QhP2yP3U
X-Received: by 2002:a05:622a:5c17:b0:4df:45b1:1547 with SMTP id d75a77b69052e-4df45b11effmr106393311cf.69.1759136310526;
        Mon, 29 Sep 2025 01:58:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRXtkJG4+SzyzmUaBbzgU9Nn5Sl1tWg+sCFw1xHVc4pJ5o/wczABJ+K+k97kihrHCINuJSYw==
X-Received: by 2002:a05:622a:5c17:b0:4df:45b1:1547 with SMTP id d75a77b69052e-4df45b11effmr106392941cf.69.1759136310059;
        Mon, 29 Sep 2025 01:58:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5831343130asm3993046e87.1.2025.09.29.01.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 01:58:29 -0700 (PDT)
Date: Mon, 29 Sep 2025 11:58:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 3/9] drm/bridge: ite-it6263: handle unsupported
 InfoFrames
Message-ID: <y3sndmfnwtljkbrssyycg6scjujt4kkjfo3gjclo3suzvqdahl@bdrdzmiolcb4>
References: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
 <20250928-limit-infoframes-2-v2-3-6f8f5fd04214@oss.qualcomm.com>
 <a7f0ced8-d704-4a59-bcc7-e0bd4db113fd@nxp.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7f0ced8-d704-4a59-bcc7-e0bd4db113fd@nxp.com>
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68da4a38 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Wi-JpQQdkJIPRSjGzdwA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfXxLLSSn9Zx1Fz
 Bg3d+3ieMpRflct3iF5g2Oiq9Ww3ehfXZPFMo9rrtcbnESSYCT3fn+Y//dW8iUUJr/CA+svp92R
 jJeyIuNcnFCYwLr2KZnm0wMyqGJjgPVWuHiGa0Vr6Xpaut9o7AsIz2hK9b0AzklpUM5+H4m6UNh
 Mll1l9pqZAq1q1kUDmC+iiwwCLTN5VWiPF+I0sFxf9HCWwd9ZX6dV/0ajnKlkNmwSvL7azDFHLh
 nzG++u472RYRhLnX1A4eK0ozWjk1Y9F+SZHH0I8QFiPbhjkiXbUEqyLF1RXdkpXFxPD5RX+RM9Z
 HpX/J2fj9CY6YD8yVeFsVHWQ2MWjKb5j53ekK0s4MpW8sVb6eVctWsL0emKPboCa8sHONVGoMdQ
 u17uwYHCJUtEfEELy20JAsRiwRCfuA==
X-Proofpoint-ORIG-GUID: ZG4Qxaso2KYWq4MVuyqZJhrLwLFXebG5
X-Proofpoint-GUID: ZG4Qxaso2KYWq4MVuyqZJhrLwLFXebG5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_03,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032

On Mon, Sep 29, 2025 at 03:56:31PM +0800, Liu Ying wrote:
> On 09/28/2025, Dmitry Baryshkov wrote:
> > Make hdmi_write_hdmi_infoframe() and hdmi_clear_infoframe() callbacks
> > return -EOPNOTSUPP for unsupported InfoFrames and make sure that
> > atomic_check() callback doesn't allow unsupported InfoFrames to be
> > enabled.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/bridge/ite-it6263.c | 27 +++++++++++++++++++++++++--
> >  1 file changed, 25 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
> > index 2eb8fba7016cbf0dcb19aec4ca8849f1fffaa64c..cf3d76d748dde51e93b2b19cc2cbe023ca2629b8 100644
> > --- a/drivers/gpu/drm/bridge/ite-it6263.c
> > +++ b/drivers/gpu/drm/bridge/ite-it6263.c
> > @@ -26,6 +26,7 @@
> >  #include <drm/drm_crtc.h>
> >  #include <drm/drm_edid.h>
> >  #include <drm/drm_of.h>
> > +#include <drm/drm_print.h>
> >  #include <drm/drm_probe_helper.h>
> >  
> >  /* -----------------------------------------------------------------------------
> > @@ -772,7 +773,7 @@ static int it6263_hdmi_clear_infoframe(struct drm_bridge *bridge,
> >  		regmap_write(it->hdmi_regmap, HDMI_REG_PKT_NULL_CTRL, 0);
> >  		break;
> >  	default:
> > -		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
> > +		return -EOPNOTSUPP;
> >  	}
> >  
> >  	return 0;
> > @@ -812,13 +813,35 @@ static int it6263_hdmi_write_infoframe(struct drm_bridge *bridge,
> >  			     ENABLE_PKT | REPEAT_PKT);
> >  		break;
> >  	default:
> > -		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
> > +		return -EOPNOTSUPP;
> >  	}
> >  
> >  	return 0;
> >  }
> >  
> > +static int it6263_bridge_atomic_check(struct drm_bridge *bridge,
> > +				      struct drm_bridge_state *bridge_state,
> > +				      struct drm_crtc_state *crtc_state,
> > +				      struct drm_connector_state *conn_state)
> > +{
> > +	/* not supported by the driver */
> > +	conn_state->hdmi.infoframes.spd.set = false;
> > +
> > +	/* should not happen, audio support not enabled */
> > +	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
> > +			     conn_state->connector->hdmi.infoframes.audio.set))
> 
> Maybe use drm_err_once() instead to provide the reason for the warning in
> a string?

I can change all of them to drm_err_once(), sure.

> 
> > +		return -EOPNOTSUPP;
> 
> As this check could return error, it should be moved before
> 'conn_state->hdmi.infoframes.spd.set = false;' to gain a little performance.

I'd say, it would be negligible.

> 
> > +
> > +	/* should not happen, HDR support not enabled */
> > +	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
> > +			     conn_state->hdmi.infoframes.hdr_drm.set))
> > +		return -EOPNOTSUPP;
> 
> I don't think IT6263 chip supports DRM infoframe.  The drm_WARN_ON_ONCE()
> call could make driver readers think that DRM infoframe could be enabled
> in the future as audio infoframe has the same warning and IT6263 chip does
> support audio infoframe.  So, maybe:
> 
> /* IT6263 chip doesn't support DRM infoframe. */
> conn_state->hdmi.infoframes.hdr_drm.set = false;

I'd rather not do that. My point here was that the driver can not end up
in the state where this frame is enabled, because it can only happen if
the driver sets max_bpc (which it doesn't). Likewise Audio InfoFrame can
not get enabled because the driver doesn't call into audio functions. On
the contrary, SPD frame (or HDMI in several other drivers) can be
enabled by the framework, so we silently turn then off here.

> 
> > +
> > +	return 0;
> > +}
> > +
> >  static const struct drm_bridge_funcs it6263_bridge_funcs = {
> > +	.atomic_check = it6263_bridge_atomic_check,
> >  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> >  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> >  	.atomic_reset = drm_atomic_helper_bridge_reset,
> > 
> 
> 
> -- 
> Regards,
> Liu Ying

-- 
With best wishes
Dmitry

