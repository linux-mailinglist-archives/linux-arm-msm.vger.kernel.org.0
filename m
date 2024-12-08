Return-Path: <linux-arm-msm+bounces-40912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 454F09E84D1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 12:51:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CD4C1645B9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 11:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD903146A7B;
	Sun,  8 Dec 2024 11:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hzv4VF/w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DB71459F6
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Dec 2024 11:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733658671; cv=none; b=KwSdFPeirEYiOInaSKDl+m8CA7/Jf4QhSBRcV48nz68UlYu701j2WLTaZ8dxqi8sS0/W4sDjqgRnYsR6ZDesvMPfQX+JK9dL5QzD3IaAj4ZB++RdLLYMtM8IRWkzPTI884IIzKk+H17VME9zNOZ5M/e+7sEnIutfiE+xKaQQbxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733658671; c=relaxed/simple;
	bh=EJBI7ckWwHleaAAyKHfoAVyz5AfHC8lsTPOMhnMxmcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ge/R0YYyB+e+Pc+sp+7cPk6dPihfZMV4udfPdpvDEWCPHYVxMqkSzgDQInpsPWsQr7w+jmytGgQCFFlynPYyaGBbSly8RCGr3zaQHNj1DYvYMxphBFb4DPA3CZmTFI3daCH8nqiyk76JbnMEoWmgTxufTiAY8qiDjokYqJlIkCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hzv4VF/w; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53dd59a2bc1so3295337e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Dec 2024 03:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733658668; x=1734263468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BjiC5PAenMu08TFijRNbc2fm2ozHjMgrzs8cxLgoxyE=;
        b=hzv4VF/wW0EAuiuJJuGwbbry2w/uj7Ix/MKQaFz6KkozvVMJIuA1eCM/8xfLb4WlZJ
         r1whh9t4lA4c40b4X+96kKZtePlrdniygyOhpKXcFzQm1f/gBgOXuii3KNPYLG6JmIgl
         2DVckgPAEXiLkQX3un4oASUDk/zA4NIO8wK8x41Jb3Vd2PvJnAk2j1VD6/HbiYCOzhhF
         VwKJWb6YSjD5cLeS3scyC5zgaRHJAPDZ7ZmWfI3mTJydWYcRN8WU+cvCDJ0yoFcTu499
         ya8ksPnyGFhSq5UtBauxNk5ZYIFyLbzeKrBGo6tU6mAkRdYNZjap1qpenIH/Cyv0scx1
         OLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733658668; x=1734263468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BjiC5PAenMu08TFijRNbc2fm2ozHjMgrzs8cxLgoxyE=;
        b=crIKDnOiJTy3GXHUKS/dO1qCdJjgmViu5Hf+9IDjZdNwZql2qqD18rFNphYcmGXCK9
         5MLjLIGcrgl4c5Kpkr/wW1Bl2lexbojkmakMBluOxdSO/D6S8yEFwk8sF8HB6leBehYQ
         gX+ZglYuNe6ikxNT0zt/YAliKrByvpH686ucba6o9sQYlyVx2wYHsJWtH+ey15nFpuED
         nDOey14zhkPJKonbZJxSD2k3XNH7AdZ2TfD8CqUkG8/vv+URQNffGKlTBL+q2r6PtiE6
         Q8Vs+c8GIyJ4olGmm2gpu21XOkWf00Dsb2OVk4ehWVNXtpYtmxP7IzERk7pcrWJ8ajB4
         eJjA==
X-Forwarded-Encrypted: i=1; AJvYcCWRmxMMsq8gfajjX/XIe9QNxP/Nniv3KnaEPaftf98qcvkyN5P7LWVB65Ku3tMzaW63Xgb5KMcRZ9K53Ys1@vger.kernel.org
X-Gm-Message-State: AOJu0YxcFbwJKW8crzyQyxCwnxYL5khjqyrk5whAqRwTmGLeGQRr3WAb
	35CVePQsOPckqzG2gOwNbmM1pf8PgvZcN1Et+ZhZtEbzWZDR7Da8ejyJ7NC6Bf0=
X-Gm-Gg: ASbGncs87Pve8yCO1L6J6GdGATx6qnCj3sMZR2m9hijEFTrUuaPZ32BqB/Em9ALitnV
	KHLeekse70JIv7izWQQLJWXLo/JEwfmcD6OvZnCAPhinWamN8dQl8KTt1PgNAFTttWkW3Y/fayP
	n2LkHQtV7AxLCchQAC+cdU1T83wWSUTZoI1HiMNmwo2OLl9PqdIZPsIuxGSkB65WZOh28AoTgyS
	5LiRO0B4YQDYHiAOxJ2NQDoucHbEEGiMO5ZMRQQlk/oJhkidKBTpm3HQv6Y7zDjLa/jXQXiqhBN
	rLbO9QESDJu3W4iYLqRmK7Gp3xxo0A==
X-Google-Smtp-Source: AGHT+IETn40N7+7crT4iVG8T/A8ynVmzE/UWImTWcqofhQT1b5XaQk0o+SD2OB6XC+TybBpfRfOZsQ==
X-Received: by 2002:a05:6512:12c1:b0:540:1be6:f15e with SMTP id 2adb3069b0e04-5401be6f545mr507128e87.0.1733658667917;
        Sun, 08 Dec 2024 03:51:07 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53f93369b98sm354427e87.280.2024.12.08.03.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 03:51:06 -0800 (PST)
Date: Sun, 8 Dec 2024 13:51:04 +0200
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
Subject: Re: [PATCH 27/45] drm/msm/dp: make the SST bridge disconnected when
 mst is active
Message-ID: <mzo5hjocxp666mfadqdmzzbkcbzcga3aatqtv7p5jfrlfeide2@hmmamwhvbfik>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-27-f8618d42a99a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-27-f8618d42a99a@quicinc.com>

On Thu, Dec 05, 2024 at 08:31:58PM -0800, Abhinav Kumar wrote:

missing commit message

> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_drm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 920392b3c688821bccdc66d50fb7052ac3a9a85a..225858c6240512cf2c5ca3b5eb52cf9b7f4db3e3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -27,7 +27,7 @@ static enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge)
>  	drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
>  		(dp->link_ready) ? "true" : "false");
>  
> -	return (dp->link_ready) ? connector_status_connected :
> +	return (dp->link_ready && !dp->mst_active) ? connector_status_connected :
>  					connector_status_disconnected;
>  }
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

