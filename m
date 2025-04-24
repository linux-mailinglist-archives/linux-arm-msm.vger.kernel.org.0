Return-Path: <linux-arm-msm+bounces-55361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB36FA9AA07
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 12:24:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A145F1B80068
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 10:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C6A22129B;
	Thu, 24 Apr 2025 10:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EpruXzTc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1241E200B99
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 10:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490243; cv=none; b=ta842xWF7CI98cpJbXbnNTCTcsNWBn436JsglkfPkgLSUcUJ04nFfFdaBcy93n/P/ZYbNB1KNgCG4OnzRi9beiUAlo0eEt+/xx/fOhUDVDEM+ZcaDVhcbrIOZzG1coTHaR5cXrrLqib6VJaizRCevOjsqrrnlBX0DhhMKC9nhZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490243; c=relaxed/simple;
	bh=6TWXQGTUy8wIt2JEPMNkmc5GEl594rGt7tbRCILOuMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=edLp7sNe56CMa6pxSYHOSpF7C5OnVom2BCcjF10EHMS9G3GU8ASQMMaBPJmGfQiYn9Z1t1dRxlhh9AsfK15e6/t1Tkwi7muBwcO2xKSytK08DYNS8ImZJhKz6Cssl0OTnkVW8tZh4xY33Tu4+Z1v13TDDMWn7ngGbpiOHHBKtqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EpruXzTc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OAEd6v003412
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 10:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j4BDsTwObQmRXQvxX4u8s4xU
	g+eG5lJxHUSU9lC6EcQ=; b=EpruXzTcKEU5BmMvqpw/QQaUDBzAPkOffdIFSJEw
	FoyxdVwsIhNa31Czq77FhSSby3J1kLf5ezY2h26exod+X8nD+TK44OvLJ1NlMP6z
	yl8IVEbLkDv35gymNNLUqIFB+e0VbbfN/Qf0hBI6/5m2WpXf1Tk9/5e5MIRnfMOF
	UhuCaL7QJee2rrMAqxlHi/OsI5jR3jr7+TLcZxgUWVfOWUkMGy2LMRBmFnz2ZWXA
	kSCEh9R+HxRsWWoHKs2wfE3ECbwU1oiC0VWP095gcpEQykVfJ3KZcc6MpghdUPKU
	eNpEMR7PgVt9V3lDYgN+YpDvFCq8ZSUVLYvMutaFUDrDSg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0n4d3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 10:24:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4768d63b1dcso33058731cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 03:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490240; x=1746095040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4BDsTwObQmRXQvxX4u8s4xUg+eG5lJxHUSU9lC6EcQ=;
        b=pvcB8PCF0Zu4ldOoXezI9W06DD45M9rnzmo2+yuo4xgAsbhTmzThCWdVQ3MuoNoTpc
         5vR7sCDARr/8hAXperJxCjKVt+rRSoK0ccRrKMx+tEBpYvmLeC/l87zOXVVAF2XR9juD
         zWY/Ugpj3RlQp4bbTaYyu+WI6cpWjUOT8yQPnSGy+1XIfDpEvHExBRjHsleRu0PUZA+6
         DDOLlNCrB+Vak5qxZG1KPFj3CiZpWGAFyxl7tOarAIL7EdoPLYFM1xW9K9xY+X6iZ3w1
         MCjCiywqAxrAsJ82T1VEregExyb0rGWO1Tp7cHeqN1HCoOnP6qOnL9xVT4W7SU1uGSTv
         ufig==
X-Forwarded-Encrypted: i=1; AJvYcCUlFMbb8sr16vIqlNmwxL+7FOrcEqy3qLAutozSIUF0q5mFN8FeDs3FkJKenW2+eg5oXWGEMcx9HBPUUPXC@vger.kernel.org
X-Gm-Message-State: AOJu0YxClONeWLeW1trQy/biPvmoLFFZ3ypvdEofZWbL9KC7ZndqTGZR
	703+QESQ5ETZVBrHnSIzKZaqg13pVtGsU1MZKcuxMUUIIJIZmPSrFTTQ5PugC6Oz+TA6SZUf0Z8
	KjfwhVvSMXY46HqWz9u86Tlr8vczLJmkUGL5cIgLnorjt3hnngzfs+T/c23g+hlZr
X-Gm-Gg: ASbGncsNMnle9DJIONDQFin9wtAGA2YXq8MUgcftxAEchEVHPIF+GbUpTrndi0uJhWw
	EsfQ8RwWT9gS8L5QvJjf6W3PVsJRYRlrx8eJje0T8E+yN9dWxUPvaS2L0lnauv8VW1KRd7hTq44
	dq6euVgQ1KGO9bv0+QwB0rP5lyhfaUn+bX7jgJi0801Qay4tq98ZQSIUHK0z4hObFqfRq6rypMk
	9r9gkFStUM8WAOgDUpW5VpEFDeKyaU/DemCTcmfIADJO+Mg7LInuslKcQFA2AmyXqYwD9OE7FuX
	FB+dhadljpABKjYFaY1Cus5y0M7HAkCnndJ852Kf70qgL434HHH800kvlFMEkFO05QczbTmiSAE
	=
X-Received: by 2002:a05:620a:f0b:b0:7c0:b350:820 with SMTP id af79cd13be357-7c95859b8d8mr248843485a.5.1745490239952;
        Thu, 24 Apr 2025 03:23:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQQEXVZzHdQnlD3zO5Vs5rn2DZ4H/JAobpVLZpVt95WPenNjUM3LZuNMO+8GOdOAF/WC9wFA==
X-Received: by 2002:a05:620a:f0b:b0:7c0:b350:820 with SMTP id af79cd13be357-7c95859b8d8mr248839085a.5.1745490239479;
        Thu, 24 Apr 2025 03:23:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb8055sm176606e87.234.2025.04.24.03.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:23:58 -0700 (PDT)
Date: Thu, 24 Apr 2025 13:23:57 +0300
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
Message-ID: <s63lvzn35d7xcvw3kkmtasyinxbqa35juyxosdscfk6vhty4pw@hu3dotyklo3r>
References: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
 <20250227-fd-mdp4-lvds-v3-6-c983788987ae@linaro.org>
 <63e5ddf6-151a-42aa-b2cf-003d91b34a04@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63e5ddf6-151a-42aa-b2cf-003d91b34a04@quicinc.com>
X-Proofpoint-ORIG-GUID: 7A3KU87RHraxuFMHzhZFKZYTAo7Xtp33
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680a1140 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=OCSEMTtbVqUzc-lEabkA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 7A3KU87RHraxuFMHzhZFKZYTAo7Xtp33
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2OSBTYWx0ZWRfXx449B9eokE22 aG61LngdwFLrDAlVMnnDcBtKuLlQBhFkHqNp+GRqcL7VsGOkeQx0KDKl4uYTREhecFhxKT6jHHM 6/pm1wTmEJdMtNrsLb9EtcgawF1F61Eh2zRtp00cemrFvg3/aYjtAPXF8kmbZOWVrhiEs/WDsMv
 RbW2jQOZx6KnAA7M8pp+XqXIl9do2zNA/xxN0Hmd2r/fLICw21S+45Sz+V+ZI8jSvHfckUbiX4Q G+NuKmrLJ0VH8id+bSMLEBG0I152/S3imq7r84yrCiWXiRv5jNJ1l/4clMoxKifyM5wPd3WHt1S AL7xNoaCzwsovAtZDnFix8EKyDFYQRDT7Qeoa7XI+lCHLYC1N8mIAzw/WqPKnWimLOiVF2xtfS7
 yXl78igvPNfmcu186RhVZbBM0QFjWKfLH6tc7CN2YzL06RT8G3u8WehY0rOvr3dNbuyYKWfh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240069

On Wed, Apr 23, 2025 at 07:04:16PM -0700, Abhinav Kumar wrote:
> 
> 
> On 2/26/2025 6:25 PM, Dmitry Baryshkov wrote:
> > LVDS support in MDP4 driver makes use of drm_connector directly. However
> > LCDC encoder and LVDS connector are wrappers around drm_panel. Switch
> > them to use drm_panel_bridge/drm_bridge_connector. This allows using
> > standard interface for the drm_panel and also inserting additional
> > bridges between encoder and panel.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/Makefile                       |   1 -
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  34 +++++--
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |   6 +-
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |  20 +----
> >   .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    | 100 ---------------------
> >   5 files changed, 28 insertions(+), 133 deletions(-)
> > 
> > @@ -199,27 +201,43 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
> >   		 * bail out early if there is no panel node (no need to
> >   		 * initialize LCDC encoder and LVDS connector)
> >   		 */
> > -		panel_node = of_graph_get_remote_node(dev->dev->of_node, 0, 0);
> > -		if (!panel_node)
> > -			return 0;
> > +		next_bridge = devm_drm_of_get_bridge(dev->dev, dev->dev->of_node, 0, 0);
> > +		if (IS_ERR(next_bridge)) {
> > +			ret = PTR_ERR(next_bridge);
> > +			if (ret == -ENODEV)
> > +				return 0;
> > +			return ret;
> > +		}
> > -		encoder = mdp4_lcdc_encoder_init(dev, panel_node);
> > +		encoder = mdp4_lcdc_encoder_init(dev);
> >   		if (IS_ERR(encoder)) {
> >   			DRM_DEV_ERROR(dev->dev, "failed to construct LCDC encoder\n");
> > -			of_node_put(panel_node);
> >   			return PTR_ERR(encoder);
> >   		}
> >   		/* LCDC can be hooked to DMA_P (TODO: Add DMA_S later?) */
> >   		encoder->possible_crtcs = 1 << DMA_P;
> > -		connector = mdp4_lvds_connector_init(dev, panel_node, encoder);
> > +		ret = drm_bridge_attach(encoder, next_bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > +		if (ret) {
> > +			DRM_DEV_ERROR(dev->dev, "failed to attach LVDS panel/bridge: %d\n", ret);
> > +
> > +			return ret;
> > +		}
> 
> Can you pls point me to the lvds bridge used with this apq8064 board? I was
> unable to find it. Just wanted to compare that against this while reviewing.

It's the panel bridge, wrapping one of the LVDS panels.

> > +
> > +		connector = drm_bridge_connector_init(dev, encoder);
> >   		if (IS_ERR(connector)) {
> >   			DRM_DEV_ERROR(dev->dev, "failed to initialize LVDS connector\n");
> > -			of_node_put(panel_node);
> >   			return PTR_ERR(connector);
> >   		}
> > +		ret = drm_connector_attach_encoder(connector, encoder);
> > +		if (ret) {
> > +			DRM_DEV_ERROR(dev->dev, "failed to attach LVDS connector: %d\n", ret);
> > +
> > +			return ret;
> > +		}
> > +
> >   		break;
> >   	case DRM_MODE_ENCODER_TMDS:
> >   		encoder = mdp4_dtv_encoder_init(dev);

-- 
With best wishes
Dmitry

