Return-Path: <linux-arm-msm+bounces-55785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AF7A9D4FD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 00:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96BB31C01465
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 22:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A6D5139E;
	Fri, 25 Apr 2025 22:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MLdIKN2E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A46619DF8D
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 22:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745618743; cv=none; b=tecpswl84rF7NEeq/Ln78g4E0iSurcXk5rBinrbL9IS0qYxYoXpgP2diGbA9ESRt9IEjVF+SMrNswv9ASuf6Rl7J0Baeoc4CzBbpSvGi7+w09zakmMfsNRMsmKUJbZwWzNp70a071MlZVg7KxJUPr2bDn3QaY6vm5ICVTVOFjqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745618743; c=relaxed/simple;
	bh=dMg1Rw0gfe+cDvJBKwcnpFBNWrLQZWWVAp6xpIbbju4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S7p/gY/172/Z0spWjq0kh5cyw9JQkiBj/lW5fRcEATFb5yi96nkYuN3oP51clSLh2MEa4hQdsqf9/QbQ3PB/iE6vZ8WGKKKK1cvXc58cN95CMdDnE0Rs0ocF/etpkl8TJiOPqfAw8LZnqDScTFk8WZMdbVWuXEz3C5BFKgYuGRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MLdIKN2E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJrsx012812
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 22:05:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gA4yp+/b90fSn6clFQZZzifa
	lY2iHyX9v6vgtAPGerI=; b=MLdIKN2EXvsOizn/XCkfURZkl9QDLDeoiSS2c9Wa
	p8x+X/W6c8gyUcZQwL4T69yD3jIrHIwB61h+dMjMqQM/1g1oJm67bGzhGogiQHAl
	+1JpkT+1TI9EilEG6o+WDBcFNEJlRN8I+03yW+AqXyK5m7DwxQsTBKaO/1BZBF5J
	SZeLHDoTtOD3IZZ5aXz3LZMUPtzveFbx51z1S9RkLryZ9jIFmahp8Fwbh/uad5j/
	ek02fMFL6rcLOLHDgWMKZF0fxIkmqhcg6EseaA6oLALSrigLmD4eWc/9WE38E6xJ
	gGsIq0ZQ98A4F/1rPt2uA16ibEG7s7lMXKuhEouakcGQIA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1teee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 22:05:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c0c1025adbso584859585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 15:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745618739; x=1746223539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gA4yp+/b90fSn6clFQZZzifalY2iHyX9v6vgtAPGerI=;
        b=uQqQ2B3822Hama9hXuFpFWV+MCXMYY4fsMsU7cEVtDlniNVnV9YgZbWELeHP4vvRvq
         vWxnf6RSS/mkPas8thzoz/yByKO9arpBoIecNYhhMsboBfJcIhjm8URCQM2XkDUvOwjG
         Umn+iJnlvZUGZhWKNBrbwTCFiF7eXYAkzWSACsYrlcFgfekZw7Ucf0cziCN0w8XK0Tbs
         Nq+r4Xi8ezEvKVlw5rua3Mi7RcYHRATq4eYMAV6cfgg7NMbaaUrgQ7mtSAcM72yewlev
         nsmqb4tlKai7G1bjainr66o4FKf6rGwASN0U52dESk0gqZz2CScFiDi8oMb4yP45jCKL
         RMSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUk+An3S/L1F6RRlV/pz0vDaNcUmIGTeMM1FJbBUP3bLZWd13pwZ77Q17TQvKxpDJ+4RRM7rBKqFTr5HK3c@vger.kernel.org
X-Gm-Message-State: AOJu0Ywipahc3DhfXzgHFVqC711mkLTC6dcSupIRkvXf9eGzFLMJcrwn
	2CsEcr+k0BQEGlf7By4AsvyDxJez7AZGDEXIRw02T3WPKkJmOFnmZRH4Eb6jO8jPEybpRQzi9hi
	wobGHKysLjY72QQhwzzuSOTKVg02hFIK3M11tCwdBxiXjDlkjyt5vxb7IMhto3VqA
X-Gm-Gg: ASbGnct/SCP1PCSuIxirhGA1mEjftMsEoi6voGtFXsHWnY6VVwgpJIOsmaA/Quvzi6B
	pSGIjVmFxTQXFjYZM05eDBRWv4J3G8f/lf4puuVI+cMEEDJbqeKJVslRypxwg0mJNG/3YmX8t0m
	PRXBFJTUW06IeFM8xVeJ1iPfsDQLR/oP9I4l4SeXe/ykzj2hoV459ppbGRMOr0500Vq2WcyqDV5
	qX6cAHsQS1+HIpdR4Ea6fH9n7DouBIS8Zx9uyUxoY06JVdHd5lwYx5bFedki89m8ciMYku2b2UE
	csejcSfdlMCMDbihcBLpfZr2oeQVHJvsqRS9FgsETYwyn0gIBaCzoL3As3ovYxTtNSf7ZZS5sYY
	=
X-Received: by 2002:a05:620a:439b:b0:7c7:b60f:ebd8 with SMTP id af79cd13be357-7c9668711bdmr231390085a.24.1745618738730;
        Fri, 25 Apr 2025 15:05:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdgrN7WJlVehxgxhc3ZH7Rkg3DTR6wldgq1l7nBjGdY6u4B1QzquINtludebsBQfjLm/Hh9w==
X-Received: by 2002:a05:620a:439b:b0:7c7:b60f:ebd8 with SMTP id af79cd13be357-7c9668711bdmr231384585a.24.1745618738270;
        Fri, 25 Apr 2025 15:05:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e816ed359sm590061e87.146.2025.04.25.15.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 15:05:37 -0700 (PDT)
Date: Sat, 26 Apr 2025 01:05:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Subject: Re: [PATCH v3 6/7] drm/msm/mdp4: switch LVDS to use
 drm_bridge/_connector
Message-ID: <sze7kbefltaduma5x2ch2zmz7lvrcsddjdbehjjh66y2xoodem@cky22gnkqvxe>
References: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
 <20250227-fd-mdp4-lvds-v3-6-c983788987ae@linaro.org>
 <63e5ddf6-151a-42aa-b2cf-003d91b34a04@quicinc.com>
 <s63lvzn35d7xcvw3kkmtasyinxbqa35juyxosdscfk6vhty4pw@hu3dotyklo3r>
 <402bbda7-33c6-49b2-89c7-37372cc07457@quicinc.com>
 <CAO9ioeXhjrOyKz3N3oU6QxW+u6WUC4R5XXqWgb=7iF7Hk0Q_nQ@mail.gmail.com>
 <99e0d2b9-d866-4b52-bde8-a6d89f35aadd@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99e0d2b9-d866-4b52-bde8-a6d89f35aadd@quicinc.com>
X-Proofpoint-GUID: 35lNQilRC_c2HHpj5BFBgVOcDwUU778_
X-Proofpoint-ORIG-GUID: 35lNQilRC_c2HHpj5BFBgVOcDwUU778_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE2MCBTYWx0ZWRfX495JL3pQoSON JU5HP489Nu19VLU/Gknw14IranjeAIY3LLJkxYGGMKEra5ktgMFr+0BpN2qyNhYdx/Snef3b2HC g4UZftFEO2dIiDIBXhvyl6mRyZEGT6ldd9JhV+/USpszYj/XusdGloEtf6WEuF8K6U5qVTo5hUv
 vaguTl8v0ricJe89U6+mS9tN78gZFjtE9niXVgCPb275NMXbrnxCBWsCcy+uFE9HR8hWRdv5DDi 7y5j6p7ltZOQ6YcIge+vRpU+KqiLN1M/36l6bmFqqDs7ddmUmzD7aUDjzT1CgBtG46VxLdzrn0K T8W9DN8JEEsfvHjcP+E2DY1MGyWANXcxEK6YxJNMknsshg+GiMgUfH4Oe9bAPzKUPZwD3uiIuWg
 nen43fJeW1d489dHV8SKwDiDIGdD0j3Xn9dstaVZZEDLbxS0ewB5Tw5b2raDKtJ5deZyUJTv
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=680c0734 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EXU9CONyTfQLJbyJyrsA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250160

On Fri, Apr 25, 2025 at 01:01:10PM -0700, Abhinav Kumar wrote:
> 
> 
> On 4/25/2025 2:27 AM, Dmitry Baryshkov wrote:
> > On Fri, 25 Apr 2025 at 00:00, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 4/24/2025 3:23 AM, Dmitry Baryshkov wrote:
> > > > On Wed, Apr 23, 2025 at 07:04:16PM -0700, Abhinav Kumar wrote:
> > > > > 
> > > > > 
> > > > > On 2/26/2025 6:25 PM, Dmitry Baryshkov wrote:
> > > > > > LVDS support in MDP4 driver makes use of drm_connector directly. However
> > > > > > LCDC encoder and LVDS connector are wrappers around drm_panel. Switch
> > > > > > them to use drm_panel_bridge/drm_bridge_connector. This allows using
> > > > > > standard interface for the drm_panel and also inserting additional
> > > > > > bridges between encoder and panel.
> > > > > > 
> > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > ---
> > > > > >     drivers/gpu/drm/msm/Makefile                       |   1 -
> > > > > >     drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  34 +++++--
> > > > > >     drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |   6 +-
> > > > > >     drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |  20 +----
> > > > > >     .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    | 100 ---------------------
> > > > > >     5 files changed, 28 insertions(+), 133 deletions(-)
> > > > > > 
> > > > > > @@ -199,27 +201,43 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
> > > > > >               * bail out early if there is no panel node (no need to
> > > > > >               * initialize LCDC encoder and LVDS connector)
> > > > > >               */
> > > > > > -           panel_node = of_graph_get_remote_node(dev->dev->of_node, 0, 0);
> > > > > > -           if (!panel_node)
> > > > > > -                   return 0;
> > > > > > +           next_bridge = devm_drm_of_get_bridge(dev->dev, dev->dev->of_node, 0, 0);
> > > > > > +           if (IS_ERR(next_bridge)) {
> > > > > > +                   ret = PTR_ERR(next_bridge);
> > > > > > +                   if (ret == -ENODEV)
> > > > > > +                           return 0;
> > > > > > +                   return ret;
> > > > > > +           }
> > > > > > -           encoder = mdp4_lcdc_encoder_init(dev, panel_node);
> > > > > > +           encoder = mdp4_lcdc_encoder_init(dev);
> > > > > >              if (IS_ERR(encoder)) {
> > > > > >                      DRM_DEV_ERROR(dev->dev, "failed to construct LCDC encoder\n");
> > > > > > -                   of_node_put(panel_node);
> > > > > >                      return PTR_ERR(encoder);
> > > > > >              }
> > > > > >              /* LCDC can be hooked to DMA_P (TODO: Add DMA_S later?) */
> > > > > >              encoder->possible_crtcs = 1 << DMA_P;
> > > > > > -           connector = mdp4_lvds_connector_init(dev, panel_node, encoder);
> > > > > > +           ret = drm_bridge_attach(encoder, next_bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > > > > > +           if (ret) {
> > > > > > +                   DRM_DEV_ERROR(dev->dev, "failed to attach LVDS panel/bridge: %d\n", ret);
> > > > > > +
> > > > > > +                   return ret;
> > > > > > +           }
> > > > > 
> > > > > Can you pls point me to the lvds bridge used with this apq8064 board? I was
> > > > > unable to find it. Just wanted to compare that against this while reviewing.
> > > > 
> > > > It's the panel bridge, wrapping one of the LVDS panels.
> > > > 
> > > 
> > > Yes but what I wanted to check was which LVDS panel was being used so
> > > far. Looks like for arm32 the dts is missing? As I couldnt find the lvds
> > > out endpoint. So can you pls point me to the lvds panel you verified
> > > this with?
> > 
> > I used the AUO b101xtn01 panel connected to the LVDS connector on the
> > IFC6410. I'm not posting DT bits since the panel is not a part of the
> > kit.
> > 
> 
> Ok, so at this point of time, this is just the driver piece which does not
> have a real HW in the tree to be verified with.

More or less so. Srini tried to push the panel in 2015 ([1]). PR was
rejected and then nobody ever implemented EDID-based selection for LVDS
panels. I simply soldered the LVDS cable and used more or less the same
patch (I can post it separately if necessary). To verify the pipeline
you can use any LVDS panel defined in the DT, it should be enough to
verify it.

[1] https://lore.kernel.org/linux-arm-msm/1438088076-17606-1-git-send-email-srinivas.kandagatla@linaro.org/

> 
> 
> > > 
> > > 
> > > > > > +
> > > > > > +           connector = drm_bridge_connector_init(dev, encoder);
> > > > > >              if (IS_ERR(connector)) {
> > > > > >                      DRM_DEV_ERROR(dev->dev, "failed to initialize LVDS connector\n");
> > > > > > -                   of_node_put(panel_node);
> > > > > >                      return PTR_ERR(connector);
> > > > > >              }
> > > > > > +           ret = drm_connector_attach_encoder(connector, encoder);
> > > > > > +           if (ret) {
> > > > > > +                   DRM_DEV_ERROR(dev->dev, "failed to attach LVDS connector: %d\n", ret);
> > > > > > +
> > > > > > +                   return ret;
> > > > > > +           }
> > > > > > +
> > > > > >              break;
> > > > > >      case DRM_MODE_ENCODER_TMDS:
> > > > > >              encoder = mdp4_dtv_encoder_init(dev);
> > > > 
> > > 
> > 
> > 
> 

-- 
With best wishes
Dmitry

