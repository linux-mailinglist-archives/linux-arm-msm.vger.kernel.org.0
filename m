Return-Path: <linux-arm-msm+bounces-40916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C43399E84EF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 13:04:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFAE1164873
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 12:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2056146D45;
	Sun,  8 Dec 2024 12:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wHYM4ASi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A0822C6C5
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Dec 2024 12:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733659436; cv=none; b=ckWRnm35+ly8Sug9txZsja7S5osRSmgsl40MTLsQV4iahdLW5PPChUKHbIy4XpDirQ/Ok62s/X3Ick9Mxqs2SGNA7lBekmuhmWLFXVaY50gIU27h7S61oK2DLL2QNE87T5QyZVkNI6tQNqSGGCE7mJc7KUOULFA2K1Zum/YVOG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733659436; c=relaxed/simple;
	bh=i4i2KTvvcGXnfNa88f3hgnNyCsQjdJSad5vlbLdJYz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PCdjNgB9Ghd23RgxMbQpWnKMpFH4DkEDSMKz5TxPQLhhj69ejVS6Nu9LsSVh8oJLnUipjvG1DwzfRzsTMXeLszLuFQzvvGLLdovQSjPQj9SriICpmJa1NJ3B6ayr/mxq/Tt1FQxFsG9dbdE/1BNzWgoT30g36xqP0Zhv5eSpZCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wHYM4ASi; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53e3a37ae07so1235544e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Dec 2024 04:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733659432; x=1734264232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9KXx0ApNlsijlOZA0ju99Q+G9M5R7Yx2sQkciVcDS4=;
        b=wHYM4ASi8O8OhZwxR3OsJGNrnDA1jWyBwIPbVGIp/u5VwC3EaIZlha4iu8p/AVS6og
         nDe2YaZ5nMQ/heqKZY/fDNIZYOvJwhN0zeNffvdHyXwz1qFjHCjM6D+Ut/9Bq1xb92yN
         8DAefMcEwogs51tMAhdgxseN1FGr1NWGjBKaWYnOD0KB8syL7bHxRAOs1tqfspz/Sbnb
         K133+R0ZNHuz7Gyp8fc0yGGCC8AoKLzy8UXUZIaxBDoyuxy46vB0XMIUW/BCdjFPSx+o
         DkqsxovudhFli2WrPzZqDkOO0Z2L4LlR+N6lcjMemADTSRHJQIRLwzV5BIIauEQzpJGK
         y2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733659432; x=1734264232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9KXx0ApNlsijlOZA0ju99Q+G9M5R7Yx2sQkciVcDS4=;
        b=aNfDUTyspQMj+m0YOfvjtd4LVrJPLV7OlqDJb7UNzArP+Nj2PFzyWbv8j2bq8pSCIk
         N1KTCatcict4+pPwPKSN0E85P1dfJCDWtKFZs+bTslJixVVD8hWmmYOnSdG5ZDqxl1bZ
         RkVlASNMA5QiBPYSxIiB0ysO04ai0D2/2Jy5cRk3Qmj0s3f8PDXRjDwlSe+tq5tnq3zz
         0XNio+tr4W/TI1mPOJogVuTGRihz1Vg+2/zPCX5dbcOLQ0GS6N5gPnQ7McApfmCwiXmr
         LZ8cuIkHQqANSuNF7dGSJdTaj3QIKdQ4ZX8UVxh3RBjVQBNDgn6Ro0jJ07VH+biD1RuX
         gjUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTR6WHJXk8TIiq+DJW925U0rH8cK7heEvAH0t9FU2ViXeCkSFp0RA6IXbbpfMgtNZw6sWs3ZLpXVhJGJaI@vger.kernel.org
X-Gm-Message-State: AOJu0YzaIwdPFYeYT1UT0jWW2e0MPEz8lMv+PDjhTbqbF7A0+SZ1tcSj
	642yAibxjR2Jvxf7pzozgIbw1IVC1nptZDxpnlXy4PC78V5GbcZ7RREjDfs/HO4=
X-Gm-Gg: ASbGnctCfEQ8oJZZMatZ60vjkhD6WMRwzmYHDKBWqhFFpxfE2BnCBs3oyLSlPFkN3KP
	9AebItDU0spov1tAcwG19EXSPuzV/cGHx8BKrBd3j5u5AH3uxnCD/tKbwh63dj+k8IrRHfjb53V
	7QtmlUwmGzeCSTZQZhNCuEJORLm84Shr3cG4Ar65itS4/1OHDoqrlI3IKP7VEwjIwjRnyXSvBef
	/tht11m9OB/7Rm/ml5V3mQLIjEQF+6drEL6PFV9zy/E66GLc3/7/VOi0cpmkG34E4MffBrwaPce
	0kjyrA+KzlUilQfvyZagODbrQEd85A==
X-Google-Smtp-Source: AGHT+IE3O1vDcG2I7HunwmWrjoW+AhnlewTum6tSDC7QGhQdfWJpHRGs4D0Utg5tFcMzbQvnOUmbyQ==
X-Received: by 2002:a05:6512:33d1:b0:539:e58a:9704 with SMTP id 2adb3069b0e04-53e2c2c2e2dmr2716844e87.33.1733659432037;
        Sun, 08 Dec 2024 04:03:52 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e395e0c65sm589206e87.256.2024.12.08.04.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 04:03:50 -0800 (PST)
Date: Sun, 8 Dec 2024 14:03:48 +0200
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
Subject: Re: [PATCH 08/45] drm/msm/dp: re-arrange dp_display_disable() into
 functional parts
Message-ID: <7bscw5btxqonvfo4fqbalhjdhs3hewtkcr3svpxonhsuawzpio@d4wbamnobcdl>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-8-f8618d42a99a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-8-f8618d42a99a@quicinc.com>

On Thu, Dec 05, 2024 at 08:31:39PM -0800, Abhinav Kumar wrote:
> dp_display_disable() handles special case of when monitor is
> disconnected from the dongle while the dongle stays connected
> thereby needing a separate function dp_ctrl_off_link_stream()
> for this. However with a slight rework this can still be handled
> by keeping common paths same for regular and special case.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 29 +++++++++++++++--------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  4 ++++
>  drivers/gpu/drm/msm/dp/dp_display.c | 25 ++++++++++++-------------
>  3 files changed, 31 insertions(+), 27 deletions(-)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Nevertheless,

> @@ -905,20 +905,19 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
>  	if (!msm_dp_display->power_on)
>  		return 0;
>  
> -	if (dp->link->sink_count == 0) {
> -		/*
> -		 * irq_hpd with sink_count = 0
> -		 * hdmi unplugged out of dongle
> -		 */
> -		msm_dp_ctrl_off_link_stream(dp->ctrl);
> -	} else {
> -		/*
> -		 * unplugged interrupt
> -		 * dongle unplugged out of DUT
> -		 */
> -		msm_dp_ctrl_off(dp->ctrl);
> +	msm_dp_ctrl_clear_vsc_sdp_pkt(dp->ctrl);
> +
> +	/* dongle is still connected but sinks are disconnected */
> +	if (dp->link->sink_count == 0)
> +		msm_dp_ctrl_psm_config(dp->ctrl);
> +
> +	msm_dp_ctrl_off(dp->ctrl);
> +
> +	/* re-init the PHY so that we can listen to Dongle disconnect */
> +	if (dp->link->sink_count == 0)

It might be better to have just two codepaths:

if (sink_count == 0) {
  msm_dp_ctrl_clear_vsc_sdp_pkt()
  msm_dp_ctrl_psm_config()
  msm_dp_ctrl_off()
  msm_dp_ctrl_reinit_phy()
} else {
  msm_dp_ctrl_clear_vsc_sdp_pkt()
  msm_dp_ctrl_off()
  msm_dp_display_host_phy_exit()
}

> +		msm_dp_ctrl_reinit_phy(dp->ctrl);
> +	else
>  		msm_dp_display_host_phy_exit(dp);
> -	}
>  
>  	msm_dp_display->power_on = false;
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

