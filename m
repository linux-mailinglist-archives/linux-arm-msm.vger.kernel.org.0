Return-Path: <linux-arm-msm+bounces-49351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC438A44966
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 19:04:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81CE93A3BCC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 17:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEBC2156F3A;
	Tue, 25 Feb 2025 17:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DJATxHVj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4FD18C93C
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 17:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740506310; cv=none; b=AdOoO0euSZefT5XjbmdPwNU2TQsPoA6+1y/KQ9HZ5KKvSLjtlM4z9b7xtbQDQDj/fkd0qF2RsszXxGAZgog8wXzp12s8gEDOCbV1OQrFIvJlgtNwlR+9tgpKJNWH8M/WwijFHuqiSTGfg2DJH6CdAypVPDSwW8nmgxhxx0+s3AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740506310; c=relaxed/simple;
	bh=MuemuIVSx7MSh9O/nBP6FH5Y+T4FTJXhoSvtuThWmHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VVBesAJPi6zHmCNFE/CmWywgbUX7E/WkLaE6EvXpeIlcqM+HbfLyvEWSSf0Ukl3NZCVew/Z7SsVr+jGYi/h+J7ecyDGyxaUlrMJeo8W7vY7xagiIx36MNDrAYZdnaW6KW54QuKDufIxR08rI37L0ApepyEgL4nWvsIpDo4MvIYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DJATxHVj; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54605bfcc72so83715e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 09:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740506307; x=1741111107; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1kr6d/FQy1Jy2g1Mw9U1HLC2PC/Dwa2yo10n3xo8EDY=;
        b=DJATxHVjEoeXm/sAfvAG5zo/FX4CpMHfe+IXZ2c+2YJgOI7BcPe6JRm/4dR+B6Hi68
         AQaBUclztLSmFDySy2GECdwXnQkO3n1sNRbEs06jUzGBEjGBezmKGSeV/DUoXbmSF1h/
         wwnD89CnIP/iAx5UucL0YZV+KV7bKnk1s2ifolNv1SYGPPpw/MrWMTiYzu2Tmwdh1ml6
         sE3rlreRLyEoUR1zYdldHop38PYbQitpRSCgRfpq42zUHcz32bEQ5Qm3izspNlxmABLv
         bnF4Tw3vWSZltLQmnRspWzwgIHIipdDEo/quQp3jyHv9wGORBmlATmiIc03bB7BFWVxT
         adYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740506307; x=1741111107;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kr6d/FQy1Jy2g1Mw9U1HLC2PC/Dwa2yo10n3xo8EDY=;
        b=QMGa81DMmzGBuMfzjMvkFj3Oru4gBdTKzltO12jzneUTNxtH4IIEl+0DzDzvxCZzTD
         prJKlIdrD5k4NGa2+cEUW7/sKpuCxDB/wtszje1Orz5ZgFaZpnRlImJqXdkwicNht3uW
         VIrKq9rq01NIvr+58cHb7lPCLKz/MavYu5EBhau7D0z382DpFDikl/uPDIjUfivyzfVx
         Lzrkd8wYTV5ZMlT9kF9Njd+cAsz4kiNG2vBrbEIQjeuJHLXrgn/OIrk79cbL2hXsR3E0
         vCTUBWlx85tIwhxYWdDO9w8fS8lR6Y07Et1GBMl5Qk5mXOwQvMQzcgGQr8x8/9p6+31b
         Mhqg==
X-Gm-Message-State: AOJu0Yy4pBG4r7Q27JKjgSROZYuIGHHbsj7/R2FZXCGqkZqwom4PARKN
	noH2adlGJmZGzvFgSZSv2Rt5Xy14F4+8luNqDq1djTqMfIziPOEPxh4NfHpnbfAVWl+YbbrY0LA
	G
X-Gm-Gg: ASbGncurCSC4IfcZvq6pkl6uB3n8H10hFYarJNXUxHqzARSSB1v6MMAy57K7L5l/epl
	tDLZxi+tEX6xbyhdbNCgdNz4NPTuHXdZTR29XqP/mJHMI2HiK4/R2oN9kv+HiUxbxZ8raYAxHIt
	MCnoNVkONnx+PAhF4s9MMC9R8HEw6XGt2JyErlzfKiSv/cSOZHW9sztBbdIoLFYS2IXKg4cCWqz
	4KnV+oxzm/CXJESVJO6dRKRGV7ODsWOxjXi3EuFE6oOtzPGUfE7N+RI6X1Xeh/fK/Wf0dZHGJyI
	53k9MkK0RN+3TAO2Yoouv6A1pooiLi77St7HooLhpS1yCj+/xI67U1KOAGdHACSjKOPF2CqexKn
	cOsz9lA==
X-Google-Smtp-Source: AGHT+IGkHEvgIIfbZAqOgHLpKus9PcVasPLlY5V6IFk/rGEQb+8IEPE9UGG2WuATzUd3x9e1FtOaEw==
X-Received: by 2002:a05:6512:3ba1:b0:545:31d8:f384 with SMTP id 2adb3069b0e04-546e418d42emr8418369e87.10.1740506306966;
        Tue, 25 Feb 2025 09:58:26 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514f4ce7sm230452e87.159.2025.02.25.09.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 09:58:26 -0800 (PST)
Date: Tue, 25 Feb 2025 19:58:24 +0200
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
Message-ID: <ne35ljkudi5jta2cby7fgjzqsd5sjpwcjpwhv6kmedq6nomho5@txynsflvtc6f>
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-11-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225121824.3869719-11-quic_amakhija@quicinc.com>

On Tue, Feb 25, 2025 at 05:48:23PM +0530, Ayushi Makhija wrote:
> The anx7625_link_bridge() checks if a device is a not a panel
> bridge and add DRM_BRIDGE_OP_HPD and DRM_BRIDGE_OP_DETECT to
> the bridge operations. However, on port 1 of the anx7625
> bridge, any device added is always treated as a panel
> bridge, preventing connector_detect function from being
> called. To resolve this, instead of just checking if it is a
> panel bridge, we should verify the type of panel bridge
> whether it is a DisplayPort or eDP panel. If the panel
> bridge is of the DisplayPort type, we should add
> DRM_BRIDGE_OP_HPD or DRM_BRIDGE_OP_DETECT to the bridge
> operations.
> 
> In the anx7625_sink_detect(), the device is checked to see
> if it is a panel bridge, and it always sends a "connected"
> status to the connector. When adding the DP port on port 1 of the
> anx7625, it incorrectly treats it as a panel bridge and sends an
> always "connected" status. Instead of checking the status on the
> panel bridge, it's better to check the hpd_status for connectors
> like DisplayPort. This way, it verifies the hpd_status variable
> before sending the status to the connector.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index d2655bf46842..9b6303267924 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1814,9 +1814,6 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
>  
>  	DRM_DEV_DEBUG_DRIVER(dev, "sink detect\n");
>  
> -	if (ctx->pdata.panel_bridge)
> -		return connector_status_connected;
> -
>  	return ctx->hpd_status ? connector_status_connected :
>  				     connector_status_disconnected;
>  }
> @@ -2596,9 +2593,10 @@ static int anx7625_link_bridge(struct drm_dp_aux *aux)
>  	platform->bridge.of_node = dev->of_node;
>  	if (!anx7625_of_panel_on_aux_bus(dev))
>  		platform->bridge.ops |= DRM_BRIDGE_OP_EDID;
> -	if (!platform->pdata.panel_bridge)
> -		platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
> -					DRM_BRIDGE_OP_DETECT;
> +	if (!platform->pdata.panel_bridge ||
> +	    platform->pdata.panel_bridge->type == DRM_MODE_CONNECTOR_DisplayPort) {

This is incorrect, because there can be other kinds of bridges in the DP
chain. I think it's better to check for !eDP instead.

> +		platform->bridge.ops |= DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_DETECT;
> +	}
>  	platform->bridge.type = platform->pdata.panel_bridge ?
>  				    DRM_MODE_CONNECTOR_eDP :
>  				    DRM_MODE_CONNECTOR_DisplayPort;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

