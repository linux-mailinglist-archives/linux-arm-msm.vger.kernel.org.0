Return-Path: <linux-arm-msm+bounces-55582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D94A9C36F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:28:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75A793B10AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 09:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 223A2235C14;
	Fri, 25 Apr 2025 09:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mQfJItrK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB61F4C6E
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745573291; cv=none; b=E9kShtr48NOmtS6kuEzdGej5ODVvRXVl6b44MJX6HDHv+s/84vVPDoO0JVKY9RLLVZBZ1E3RVj9U/t4RoMcAFWThLjTmYKyAEFC2bUh+0kMGxVw3dXNFcxjQ/zLKQn2BTqCxnDHOHHOgHAzySAKsA5Pk/r6nst+mYT5YeGMhTjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745573291; c=relaxed/simple;
	bh=iQcxKLBtmBqHnu1nzKcXDSmV+Me+GwDK1oPblgbSRTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sgbBiOOGdFOUt2CXMc1SJ/cOtw4FLbUyc9asz2v354pQ0orsL9FiFEkB0ew0jiMYkekzjB/csLQQwOMJw5j8+9/VmjoJXeR2cZXm0Jv/dDvmuf9Vy2ZhkmfoNZvYck9AdiUkYQwu/xK9pH1a3xA9yZSOcOCTYH4Y7XMyMuruANg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mQfJItrK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T6PF022918
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:28:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xt2jjx4txmL59hNW/slqoBCJ
	/oGYSTNA7mQ8pWiEl4c=; b=mQfJItrKW7QKh1CevTs4eVfDZpk+xBmfsJ8ePfyr
	MgXxxMg3u2dgrr9RSzxFr9XbRswUPTH+hxBv7oQDcYv2Teli2ugzwXsX+l3hABqN
	aoQfN66dTCS+BqsgAinm9a3y3KMtVtU5oMaFdOh2iBBJiQQmCYBnc+dMC7bVJLeo
	I0g80pPZkllaFWAomLm5UI81/VsbNyJJvWCeALOkng4plnQj4JF6cVM17Spkd6jq
	od8pEIWi0ifYu/hkQ90atrmCfFyZCBoNPD1dDmfjC8MBH2Z0FWYibU4UiX3JCcEO
	DJEP1Ur5hWgMXAoy6BY0iH5ey4ypHT7Hk+VTBGaz7aFz8w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0gjwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:28:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2242ce15cc3so18790595ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 02:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745573287; x=1746178087;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xt2jjx4txmL59hNW/slqoBCJ/oGYSTNA7mQ8pWiEl4c=;
        b=i+SDHe39DL4CfkMUDY6rjC392lYDCdRdh06BulnnEl+O0ziipvR44g/Xv9gVHu+5gL
         R5o3RzJCra1XzV0UzwNWPA0yIi/1hhryRxgFeJCvacQZ/Eb9662E+lbsK8pO1eJYrBh9
         V81xuFSOqMINmPuHqLJ5owZmD4Q5TmUxnGwbQYJzKHh7p1j3fcSV7d6DwGGBjFxXNLxi
         ywSVf40JR8H8lgmgseWMucj9ASMtc66t74TcaXd/8D3TiINh3RjRknfkSWNqypgptqOu
         VRRXKtCkI0Catc9We76txj3gyjSt5iV3gYB4zngneZc6K0ghnYir6sZJq8QIyXI4Smp2
         hmdg==
X-Forwarded-Encrypted: i=1; AJvYcCVLQpwXaeEDI7SQJNpZxJK7mMcWPRzCkmCNOuM1e8MH9K6lGwHZ6uNcpbpQ1VwE+GZfdKS0I6kI2RCxIemg@vger.kernel.org
X-Gm-Message-State: AOJu0YyFmXJQMAdYDmCXTDwnh5H/vKMdcjkWOic8r5gjG/DLaJvTv0IV
	l1ptwVEF/4ZG4q9RQiNYL7T93FFD3Cfq6a/C9IkIKZuRe7f5i/HuGrQtTwHbio8UZNW44X6+Y0O
	cKMHpxndH8OXdFwfYdbQaJ0pM5GN2j10JHdWPr71br1RIwS39lkH+PUZ2KUm5hoA0X8pJOmTurh
	mJYnyBg7gG01EQlgagYzgKXHvK+lbH+k+Fq+vF+1w=
X-Gm-Gg: ASbGncui/jkl8V27V5UHYRsARmmKinGxDQPSDuGMJjhWx1XXGyrc8GDr/9YGCDrl8cg
	zegjuM+i60YyeWvEJ4TW63cw+u7vGoghsOASsSqmFmaAM+lSPfD0x1sck8vjhn+JOqrWoLalYH+
	p7RPq4lf0=
X-Received: by 2002:a17:902:ecc2:b0:224:1ec0:8a16 with SMTP id d9443c01a7336-22dbf5ee6c8mr22878805ad.21.1745573286931;
        Fri, 25 Apr 2025 02:28:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7sY9pNe21FkhpOVYLUJOVzPn9xf8OZzxysQbok+sCqT4QpEP41QTCap95a4a+qxhM7yJVJ2G9ynG4MaRKCCk=
X-Received: by 2002:a17:902:ecc2:b0:224:1ec0:8a16 with SMTP id
 d9443c01a7336-22dbf5ee6c8mr22878495ad.21.1745573286549; Fri, 25 Apr 2025
 02:28:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
 <20250227-fd-mdp4-lvds-v3-6-c983788987ae@linaro.org> <63e5ddf6-151a-42aa-b2cf-003d91b34a04@quicinc.com>
 <s63lvzn35d7xcvw3kkmtasyinxbqa35juyxosdscfk6vhty4pw@hu3dotyklo3r> <402bbda7-33c6-49b2-89c7-37372cc07457@quicinc.com>
In-Reply-To: <402bbda7-33c6-49b2-89c7-37372cc07457@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 12:27:55 +0300
X-Gm-Features: ATxdqUHcGBSXlw8hFJp5C9Ri6LceneKkEY0gyZGnRt8lLgLrZ0UNEEiCOxxayBo
Message-ID: <CAO9ioeXhjrOyKz3N3oU6QxW+u6WUC4R5XXqWgb=7iF7Hk0Q_nQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] drm/msm/mdp4: switch LVDS to use drm_bridge/_connector
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: 11NfSwbGDMDlMrLu18jqZalEBkScE-vt
X-Proofpoint-ORIG-GUID: 11NfSwbGDMDlMrLu18jqZalEBkScE-vt
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680b55a7 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=ZLr3lU9xobrfYbAAIvMA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2OCBTYWx0ZWRfXzmk7EoG4fWNC 0YVey5+GLWZCN2mUCiY57GXn2NGoGMsBnK7OxTbVVWLBtnvpRYwpa7rKPgSMp0AnuKqcrMljGtF Ktbf0xWxMx6J36rtSzj7MpSzEVePTJCDtKjoz+4M0uz7Fb1urM6rNzOwyfoCGhEOkaRM6C3kuZU
 Pf9CYN5W08TeOs7IWWJhOB1C7Bd8oyVas/10yfEoeAxnraXzn2aEd+IigHc43v3U7LDKx9GbwbL 2TNKZz/Zq9DGcCgjqHWXqsah6ZEYtSymR6sgodNOFrWPjIlFO+NO2WFYPzNc+koay5kZe+Zt0ry 3Br7yKr/PrLYtWKUN2lkQrVjCX7yBWTEKx/YjZ9BncW+ADMtnBoZgYHI4O2LTikh4wtlgLcfUQ3
 BuiGggLzRbRCNGK8GrHinSDIiztAqOMwSOLPsteQiMYlSvrHXpkFSTJDEC9UPLbtj2XX0sXE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250068

On Fri, 25 Apr 2025 at 00:00, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 4/24/2025 3:23 AM, Dmitry Baryshkov wrote:
> > On Wed, Apr 23, 2025 at 07:04:16PM -0700, Abhinav Kumar wrote:
> >>
> >>
> >> On 2/26/2025 6:25 PM, Dmitry Baryshkov wrote:
> >>> LVDS support in MDP4 driver makes use of drm_connector directly. However
> >>> LCDC encoder and LVDS connector are wrappers around drm_panel. Switch
> >>> them to use drm_panel_bridge/drm_bridge_connector. This allows using
> >>> standard interface for the drm_panel and also inserting additional
> >>> bridges between encoder and panel.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/msm/Makefile                       |   1 -
> >>>    drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  34 +++++--
> >>>    drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |   6 +-
> >>>    drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |  20 +----
> >>>    .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    | 100 ---------------------
> >>>    5 files changed, 28 insertions(+), 133 deletions(-)
> >>>
> >>> @@ -199,27 +201,43 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
> >>>              * bail out early if there is no panel node (no need to
> >>>              * initialize LCDC encoder and LVDS connector)
> >>>              */
> >>> -           panel_node = of_graph_get_remote_node(dev->dev->of_node, 0, 0);
> >>> -           if (!panel_node)
> >>> -                   return 0;
> >>> +           next_bridge = devm_drm_of_get_bridge(dev->dev, dev->dev->of_node, 0, 0);
> >>> +           if (IS_ERR(next_bridge)) {
> >>> +                   ret = PTR_ERR(next_bridge);
> >>> +                   if (ret == -ENODEV)
> >>> +                           return 0;
> >>> +                   return ret;
> >>> +           }
> >>> -           encoder = mdp4_lcdc_encoder_init(dev, panel_node);
> >>> +           encoder = mdp4_lcdc_encoder_init(dev);
> >>>             if (IS_ERR(encoder)) {
> >>>                     DRM_DEV_ERROR(dev->dev, "failed to construct LCDC encoder\n");
> >>> -                   of_node_put(panel_node);
> >>>                     return PTR_ERR(encoder);
> >>>             }
> >>>             /* LCDC can be hooked to DMA_P (TODO: Add DMA_S later?) */
> >>>             encoder->possible_crtcs = 1 << DMA_P;
> >>> -           connector = mdp4_lvds_connector_init(dev, panel_node, encoder);
> >>> +           ret = drm_bridge_attach(encoder, next_bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> >>> +           if (ret) {
> >>> +                   DRM_DEV_ERROR(dev->dev, "failed to attach LVDS panel/bridge: %d\n", ret);
> >>> +
> >>> +                   return ret;
> >>> +           }
> >>
> >> Can you pls point me to the lvds bridge used with this apq8064 board? I was
> >> unable to find it. Just wanted to compare that against this while reviewing.
> >
> > It's the panel bridge, wrapping one of the LVDS panels.
> >
>
> Yes but what I wanted to check was which LVDS panel was being used so
> far. Looks like for arm32 the dts is missing? As I couldnt find the lvds
> out endpoint. So can you pls point me to the lvds panel you verified
> this with?

I used the AUO b101xtn01 panel connected to the LVDS connector on the
IFC6410. I'm not posting DT bits since the panel is not a part of the
kit.

>
>
> >>> +
> >>> +           connector = drm_bridge_connector_init(dev, encoder);
> >>>             if (IS_ERR(connector)) {
> >>>                     DRM_DEV_ERROR(dev->dev, "failed to initialize LVDS connector\n");
> >>> -                   of_node_put(panel_node);
> >>>                     return PTR_ERR(connector);
> >>>             }
> >>> +           ret = drm_connector_attach_encoder(connector, encoder);
> >>> +           if (ret) {
> >>> +                   DRM_DEV_ERROR(dev->dev, "failed to attach LVDS connector: %d\n", ret);
> >>> +
> >>> +                   return ret;
> >>> +           }
> >>> +
> >>>             break;
> >>>     case DRM_MODE_ENCODER_TMDS:
> >>>             encoder = mdp4_dtv_encoder_init(dev);
> >
>


-- 
With best wishes
Dmitry

