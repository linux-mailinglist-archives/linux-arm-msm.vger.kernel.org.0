Return-Path: <linux-arm-msm+bounces-40739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C957F9E6A23
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 10:32:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A5152832A9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 09:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9541BDA8D;
	Fri,  6 Dec 2024 09:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iQ8XAqdA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33E4191F78
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 09:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733477571; cv=none; b=US3eGmunLD+wdCEUnco/rNlKQjfOM3+IBo7WqxWNI5sY8bi9V+M3wkSpSPB7MBPMXMkD1YIPzoIO/vnvbe9xbo9m60MK6AvxsOvtXXFxz3T4h2/mxgPlsL56eKILxL/qonCDKQSgYDpyFrsRfVmC7Da6dLjBw+LZMXcFnKP2Cks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733477571; c=relaxed/simple;
	bh=EmKTRyxfg9lnl9kzJeHA2gWiYkvhXSnTs3qA2lMvXCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=luvTHHc3LxZEs1fAk/SMRw0wBX+AcT3/L0HNNcIsnuCbLEDtTJVJMkXwcXdHZWp4rqZCP7VU/+FweAeNqCT5UD2WkSlz8mEGIy7bFbBEYmAnn+DJqc+ghlfU9+6QcgPHhRNto/VWmZmM8QUvqKPxIVnBa1T40VLznZr1f8AUZzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iQ8XAqdA; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53de8ecb39bso2475737e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 01:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733477568; x=1734082368; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zadEHboo0cdlPFvzQWo8pskzaBuEAY7TqZ8rPSIgr8o=;
        b=iQ8XAqdAoW4bzWYHQInHogmFX2hvpv4rlT35GSSzLmRmQXS0MNaoAKSXq7VKaigKlm
         1P6+GKXJBIqfj+TuoPKYec1g8lIkUZ/2WBOQQX1Qxz3S03OJvyaTPkecdnAOtrKgqwCb
         oymqD4Vn6PQt5UaTPf/CnNw0BBh+vRkCf9KSr7yDn5O9Qp41ASFdgAZe8leDPqwSO9bD
         bAlrhodeOQTUTkjfTpZrB36c9K4g6p/Uc07456aahuyfEqgi/1x4WscmB+V8rKapTqz6
         VIknAnutci9ZKZlLQotRukyWWyM5nCMLJIp9rbZM5WhXbAWxSAFQgUotUHccMIcwFq7J
         T+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733477568; x=1734082368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zadEHboo0cdlPFvzQWo8pskzaBuEAY7TqZ8rPSIgr8o=;
        b=gGTQOv1trFKmNN0WRnSj3lb9BX4cD8fOEMSfQzwqdT+eaI0BvSjeNcZ35bvQmMJDCF
         7hTK4pbaTOL005TFlN6Z85b7VU4qzP7VKC9ja9OgiO3AYmU37edwIiind7dfHPBnUX18
         ckJaKX+dxhZmTypzlhWx13a9ebKxAl1gIoGzN9BV9ven/3kvPsV5aXEpKFQgHM/qFbqX
         pgHZXM3S+PNwks45R7w2KbvEITOaFa3B3codFHsmjpfjZGwllAnfnN1FzQbkeEprsqSq
         wSSLU+E2wMmg1rHxriXGFebmVUajVdbZ2uoTTeDf9AzqgWPajgXrT9/eYx9oEsLVv1S2
         vmAA==
X-Forwarded-Encrypted: i=1; AJvYcCWvnF+PZuCOx4n3QsqCzUE/S9UItRwMxHi+fZQ/Za0XMA+M+Mrhp1bHxV7/0rGJl37jabQwpo+OYnLbY7p0@vger.kernel.org
X-Gm-Message-State: AOJu0YwcF9FWBQrETXuD9ZGMAqmqMnrmgVw/kHxZ3YCOwp7e9ahKxDFp
	gk6RE+j6FMe8NVXBHGtyu/cL6287lcNh6jhHvYdWTqzvVDopFTmd34yti2bOlZQ=
X-Gm-Gg: ASbGnct0A/yumnnY7RlJKOKo7Wwipxd1V1PVvpm5y9yEs6cP22N4YfDSzV5CPDiLuJN
	7Zxp3H9vndbiByDNPxwCQm5Qf+dI0QqmshkvOofqTyy2nT5/qRVpJ5b6zmJcfjguyHzwDDPCdGW
	VQkPIEd4/+cS2bEaSP9kyFJcX6W7xXKPbS7MCKTcL/LaEp55VgIU+dZvmqx3U6UCKvKMVfhengp
	KrjG8uD79vo+L5j9dvxri1CzoeAif9jFOL1R0pYYtDNviLbumlwpb9KCR/U/fa8H/crKslf32sx
	2KAdhVYLve6RDYcOjpGhqV61Y/vSQg==
X-Google-Smtp-Source: AGHT+IFt0oQZraChA0vm7bTmEKxi678+NtImtNYWtNbmFt/Emc59radqf3VL2rny8/rMaB+weccu/w==
X-Received: by 2002:a05:6512:31c9:b0:53d:eec4:2bfa with SMTP id 2adb3069b0e04-53e2c4fed10mr1145884e87.37.1733477567848;
        Fri, 06 Dec 2024 01:32:47 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229ba6fdsm449887e87.151.2024.12.06.01.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 01:32:46 -0800 (PST)
Date: Fri, 6 Dec 2024 11:32:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
	Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
	Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 29/45] drm/msm/dp: skip reading the EDID for MST cases
Message-ID: <7khoxaafl2eclgqe2jfwgdmruvtoug5fpjdkvcrmpcynddnloa@toooyaio7rzm>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-29-f8618d42a99a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-29-f8618d42a99a@quicinc.com>

On Thu, Dec 05, 2024 at 08:32:00PM -0800, Abhinav Kumar wrote:
> For MST cases, EDID is handled through AUX sideband messaging.
> Skip the EDID read during hotplug handle for MST cases.

But why? Isn't EDID being read at the hotplug time to update
drm_connector's data?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 033d238e956263c1212fce45aab01316ef341edb..a67bc7c1b83a5a9996435804ff7337f72dae93a0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -420,9 +420,11 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	if (rc)
>  		goto end;
>  
> -	rc = msm_dp_panel_read_edid(dp->panel, connector);
> -	if (rc)
> -		goto end;
> +	if (dp->max_stream <= DEFAULT_STREAM_COUNT || !msm_dp_panel_read_mst_cap(dp->panel)) {
> +		rc = msm_dp_panel_read_edid(dp->panel, connector);
> +		if (rc)
> +			goto end;
> +	}
>  
>  	msm_dp_link_process_request(dp->link);
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

