Return-Path: <linux-arm-msm+bounces-49379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D206A44E17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 21:57:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A931176530
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 20:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C4B20C46B;
	Tue, 25 Feb 2025 20:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hEnpq2bB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34C4156F57
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 20:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740517035; cv=none; b=Mg4GxSmdDbwcci0Ca//3bo6YlZqob6F7rcdrJR5T/VWliUGdvlRDpvsClwXm7/v1MxFwHTJUlK1VzRM8ptFmlj7bpa2BPWGYVKVWa3iyMZbxQc4y8m3lpLOIlMoDafBxMFfODMG5M7F5072HO44ybkDNBrswjV1ZY9aI2zYrWW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740517035; c=relaxed/simple;
	bh=Ho2tqjl8RDylbwgCGJsLcMFxwZUteXNFVsZvLqhv/J4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l1UbmBqDG92QWKJeX//psVE5eriMb9idCTDKOozJS6p7yIWTH9ei/srAWpRiG/WuprRsYut2S3qfsnzONEw/eSDsozbrrPyzE4Vs+fbvOMXwddSNvYY08SAasKg32Dn9qwtPw1xE++ywBWIFTb7+1xFN29gNH0oYpgXWKlNA4MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hEnpq2bB; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so441772e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 12:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740517031; x=1741121831; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RC4nwCVky+xPc0uxnaEdDnOXaTOZCldxGM13yaUgyKU=;
        b=hEnpq2bBclErB10VRewV/heBsllNtj/RkNZP3JbPvS9U8DZafDKwiXKxSflRHLKFsO
         aSWI9IzFXm1/KU4W2o7f5tzgkPdwlp2TyUknllJC2KAsg0qPuZYVYHRM9ImBDLxceX96
         g9QK0iZRo2vJP2QDj8vNpBG6aHY+ehoZjwaN1Kq4Qn6We20+DbAw8RZYRs5fsYMi6uCZ
         cqkUbEp7nA44lzwGcmXgT9/IUdD32q1sXW8H2yP8oXiq8bTtTlWWBKg6B/tziVG5s15b
         xkna29tSQM58+4JS7Ho8ZswatUjgJaWPeQQ+cPH8ib1H3fZacqlC/n6WXrJFJVlzkzzU
         GTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740517031; x=1741121831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RC4nwCVky+xPc0uxnaEdDnOXaTOZCldxGM13yaUgyKU=;
        b=uL0iOzP6w4Ow8XfsEl7TR5dMAZYG42JNqDfb283t4nnC4f+FA5O4ZalpOwq3lDrLB2
         1yq/gGy27MPGIx74vCRnp4XfmA7C9cbcoJteb/iArAaTqo6HAHIxmweAbm8QVuqaz/u2
         YeZmDmbt/C+zF82QaTMnDuqjCqZrPVXCXGS2nndXWqmlPL83T22Yv9kbd9levCLByakV
         8s9cDvZp0Vu1n3eI3ANKw52U3923IyHaDWWoHuUr451VkQDRwn2MK5+Hr0K/kspOhs/P
         5zYW/KsCf+s7i0SNWdIO5bYfIvXXEJS97RXTE0tWJU5syVQoVFQoAGsXHKOZe4eIv66h
         4W2A==
X-Gm-Message-State: AOJu0YyY18gTx6OYb4CcCYvTE3z1vjN126AAjsf5LTn/fM+ZtYz1063T
	9QQuTp4iLrEmW9knwMnGUc8Z3RQ9IVKpo/dgoDshcYWDQaPMj1CnwrgZHVOeYwY=
X-Gm-Gg: ASbGncvFpWXfxDdZLOOh10h2fukWsBMLc9QEsH0LmfMWuftIRsdT/4sCzUzbIcg4kiJ
	kDxXfEBOl/ll7x1h/n7P45zdDvtvgRg/uaBy84ByA2UQzZyldsmufkXRoXl/i48zcpBbaR3yWuJ
	dvmrR9y2IDhqZHnUw7c8M8m6PLOP9dcVTF8TW5iLQVOo3Qarur4CMKfN+VRYFV9pzVUM5fM1jlL
	7jhny3dgV296HQNLQVUr/vbTJcrwjhVXL1vQHcfXNgYmISGOUqOou4R9wBgNAMJjkLOKxFICsju
	FUJueKlZEq22EBJtoWMmdlsoC+Q9l4htgwyNjXkSXi1J9eaInmMxvQlVtdJs/sttmZbi3t+xjD3
	MQqZPPg==
X-Google-Smtp-Source: AGHT+IHRv8mh/QNtBZyrnliPjjpkMnU2s4zUsA7EqzstzJNaDy/fNbCuH+kkInHHb1dD5QukYC4paA==
X-Received: by 2002:a05:6512:130c:b0:545:2953:1667 with SMTP id 2adb3069b0e04-5493c57a2eamr788746e87.13.1740517031002;
        Tue, 25 Feb 2025 12:57:11 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b9d78sm271652e87.79.2025.02.25.12.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:57:10 -0800 (PST)
Date: Tue, 25 Feb 2025 22:57:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org, 
	andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org, 
	konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, 
	jonas@kwiboo.se, jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com, 
	quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, quic_jesszhan@quicinc.com
Subject: Re: [PATCH 10/11] drm/bridge: anx7625: update bridge_ops and sink
 detect logic
Message-ID: <yvjb7sd42uhvomsw2svotyxrvdxihsa3qch3lfynpaoap6g3hp@dcqmaw65zsk2>
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-11-quic_amakhija@quicinc.com>
 <ne35ljkudi5jta2cby7fgjzqsd5sjpwcjpwhv6kmedq6nomho5@txynsflvtc6f>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ne35ljkudi5jta2cby7fgjzqsd5sjpwcjpwhv6kmedq6nomho5@txynsflvtc6f>

On Tue, Feb 25, 2025 at 07:58:24PM +0200, Dmitry Baryshkov wrote:
> On Tue, Feb 25, 2025 at 05:48:23PM +0530, Ayushi Makhija wrote:
> > The anx7625_link_bridge() checks if a device is a not a panel
> > bridge and add DRM_BRIDGE_OP_HPD and DRM_BRIDGE_OP_DETECT to
> > the bridge operations. However, on port 1 of the anx7625
> > bridge, any device added is always treated as a panel
> > bridge, preventing connector_detect function from being
> > called. To resolve this, instead of just checking if it is a
> > panel bridge, we should verify the type of panel bridge
> > whether it is a DisplayPort or eDP panel. If the panel
> > bridge is of the DisplayPort type, we should add
> > DRM_BRIDGE_OP_HPD or DRM_BRIDGE_OP_DETECT to the bridge
> > operations.
> > 
> > In the anx7625_sink_detect(), the device is checked to see
> > if it is a panel bridge, and it always sends a "connected"
> > status to the connector. When adding the DP port on port 1 of the
> > anx7625, it incorrectly treats it as a panel bridge and sends an
> > always "connected" status. Instead of checking the status on the
> > panel bridge, it's better to check the hpd_status for connectors
> > like DisplayPort. This way, it verifies the hpd_status variable
> > before sending the status to the connector.
> > 
> > Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 10 ++++------
> >  1 file changed, 4 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index d2655bf46842..9b6303267924 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -1814,9 +1814,6 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
> >  
> >  	DRM_DEV_DEBUG_DRIVER(dev, "sink detect\n");
> >  
> > -	if (ctx->pdata.panel_bridge)
> > -		return connector_status_connected;
> > -
> >  	return ctx->hpd_status ? connector_status_connected :
> >  				     connector_status_disconnected;
> >  }
> > @@ -2596,9 +2593,10 @@ static int anx7625_link_bridge(struct drm_dp_aux *aux)
> >  	platform->bridge.of_node = dev->of_node;
> >  	if (!anx7625_of_panel_on_aux_bus(dev))
> >  		platform->bridge.ops |= DRM_BRIDGE_OP_EDID;
> > -	if (!platform->pdata.panel_bridge)
> > -		platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
> > -					DRM_BRIDGE_OP_DETECT;
> > +	if (!platform->pdata.panel_bridge ||
> > +	    platform->pdata.panel_bridge->type == DRM_MODE_CONNECTOR_DisplayPort) {
> 
> This is incorrect, because there can be other kinds of bridges in the DP
> chain. I think it's better to check for !eDP instead.

Another option comes from the aux-bus bindings. If there is an aux-bus
node, it is an eDP. If there is none, it is most likely DP (well, unless
anybody has been using the bridge with eDP panels defclared using
platform devices rather than the aux-bus.

> 
> > +		platform->bridge.ops |= DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_DETECT;
> > +	}
> >  	platform->bridge.type = platform->pdata.panel_bridge ?
> >  				    DRM_MODE_CONNECTOR_eDP :
> >  				    DRM_MODE_CONNECTOR_DisplayPort;
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry

