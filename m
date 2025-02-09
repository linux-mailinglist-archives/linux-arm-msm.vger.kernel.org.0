Return-Path: <linux-arm-msm+bounces-47300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 83802A2DDDB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 13:43:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18B937A26AF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 12:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB6C74040;
	Sun,  9 Feb 2025 12:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r1sjGZAz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396C01DA4E
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Feb 2025 12:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739104992; cv=none; b=JxaImx/X8YTAvJjvGZhk+SygIEuWE6oJP77QzSDfS96DK8FH9scLgfa9VH4LrGYD7yJyTOSNW9X4sRhjvODKOCIAU7p4dPgJPBG+NjkZCp/SpWd3CG22HFPZ99l+TZEb5MfOIHAX+9KegF9I82qX1RW+LszTGO4CTEvw648ro8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739104992; c=relaxed/simple;
	bh=wxWeF2v5To5A1WT11xx6CXPlyDvQBrwn1l9siXzTEcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=alEPxUK3tb/KW/ya/nILkgrkNmv8qNWcmrwCmza67s73nkUb7nE62+v1oVNMLYaKfwOPlIuSpgRFEeXj1l10W7ycr6VrNkJnsrPTHpV8HMxub1NC5OTckU4id2VpljMzcsUWNkJEBkOswtnkSWjS9ZQeIwlGA0oErLqSYN/XDkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r1sjGZAz; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54509f46614so409910e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Feb 2025 04:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739104988; x=1739709788; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9gsXK1c1HmBF0r91iHeQ51YNAu0JZcecPSTcAdGkjgo=;
        b=r1sjGZAzLARvtwtCbBp+3wFiw1If5LLN8exh4OtmE1sKY29egfdTxHCHWwyQze79ja
         OgfIvPEBJF5nAti8z6jiKEXoCYiQdCTCdIURxiRnoRmLeMQTrxZDCFtQt9Wmq/QLF5/X
         Kd6BeADWiwcZRuTku2KVS64hxwHc7j4nIQGa5bsT0aEBx0bN63iYhlP55O5d+41Stt9P
         5+TXXflGlvML3fohl65KGcNfc+Cg1r9etKG9VBU2Us6R/rfgyDadR2MxeWPvDcIIDB+3
         30xd0NXR3BdMS7y5FEF48xckVLRX22eVCbsYHt8pjLsbJFC42Ux8FVc59c9r8BL57PgV
         MJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739104988; x=1739709788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gsXK1c1HmBF0r91iHeQ51YNAu0JZcecPSTcAdGkjgo=;
        b=Flq8onZ1Bm4zUu5OuXwwcvjT5vwONeViUNEFxxloMsc80FFJhu0M6n77eZkrtoZPOn
         GMpTLUMRM3tT8NLFsxNIQEUI0SRRIxnVhxdFUavQYM2bh+AlFqudkBsYhIrz8V1hPC3P
         HkX5mWGN9xtMLxfBwKYst+S19Ko/63ef+UujUAIIBmX7IjXdfQak68EhWl7gB/UQskzh
         ad0kjEijRzC7c+Wx5DyszIGrgA6A7cRn6mH9v3EgUHaiWqaCi/dj7R1WXB79YpxWrZpm
         9iYKgPz05AeCK0QIKy5wIiYrcECeWEo2Ne7fh9oUs2R3ifjpbWAXi3FiXPvW8O5W8CPs
         zjCA==
X-Forwarded-Encrypted: i=1; AJvYcCWsnRcuNkkj3PqoQv8OioeKoQrXP8APpsWCJXfXGwTwsFPW7LUFx15IDx/grJjPTDsiAumPQZD0CP0ManeZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzBOi/EALhuo3PMEaLUjRO0KfxWDrvd5t/rHmHdTas+ustRSdf2
	Lkm3S74wb07mypQ3FYCvywAT5gzaSEtXG2o09EmN7mplS8m2xvqV7hhplMBoI44=
X-Gm-Gg: ASbGnctVbbs9qURpuRewCXjQz17cKgXxmGn0gzZIGqx27ikK8e5LDl9bkBPxDqDvSMB
	RBQpLo2/BcZCpjcplL30YRrWwoFUh3Q/j93h5hHw6prS45FWaTy+IwjCxbBE/kHWT8YLE6EpYkF
	08mo/K7tlm5TsY6v1alIcNgXbWYHSlqF4Dh1cb9dDw4wxFWwzvj3WzW9Bz8hyZTy+lbx7I7mL83
	IyFkkXQvA4DEjlD7pi7UESSC2dlzsQzonPUwH2PB9r0+xtWw3isIKAhAUdKkMb8fjR5a8an02Sy
	rScuoXZu4VzqdkKfGnI4+PvKFA/J7zIVC1jNjskKasof4XImbnvOjM3IfwRu28z+CoEcj1Y=
X-Google-Smtp-Source: AGHT+IGo53O+US6XScRqpOTQ1EFQWQ3fdSrf5MEgBBs2ShlxBiJl7TtgukYGj4l7WJRi3NjYq3C2SQ==
X-Received: by 2002:a05:6512:a8b:b0:545:ba7:26f5 with SMTP id 2adb3069b0e04-5450ba727f9mr302724e87.46.1739104987991;
        Sun, 09 Feb 2025 04:43:07 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5450a1fbfc6sm146222e87.92.2025.02.09.04.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 04:43:06 -0800 (PST)
Date: Sun, 9 Feb 2025 14:43:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3] drm/bridge-connector: handle subconnector types
Message-ID: <k5ziaxb3jgqfxd3wadi4irk6kbtawudzkkatcmr635gidw6tf5@i62xyzbv2gyx>
References: <20250117-subconnector-v3-1-1e241c13e576@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117-subconnector-v3-1-1e241c13e576@linaro.org>

On Fri, Jan 17, 2025 at 11:50:50AM +0200, Dmitry Baryshkov wrote:
> If the created connector type supports subconnector type property,
> create and attach corresponding it. The default subtype value is 0,
> which maps to the DRM_MODE_SUBCONNECTOR_Unknown type. Also remove
> subconnector creation from the msm_dp driver to prevent having duplicate
> properties on the DP connectors.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> This is a leftover of my previous attempt to implement USB-C DisplayPort
> uABI. The idea was dropped, but I consider this part still to be useful,
> as it allows one to register corresponding subconnector properties and
> also to export the subconnector type.
> ---
> Changes in v3:
> - Rebased on top of linux-next
> - Drop subconnector property from msm_dp driver
> - Link to v2: https://lore.kernel.org/r/20230903214934.2877259-1-dmitry.baryshkov@linaro.org
> 
> Changes in v2:
> - Dropped all DP and USB-related patches
> - Dropped the patch adding default subtype to
>   drm_connector_attach_dp_subconnector_property()
> - Replaced creation of TV subconnector property with the check that it
>   was created beforehand (Neil, Laurent)
> - Link to v1: https://lore.kernel.org/r/20230729004913.215872-1-dmitry.baryshkov@linaro.org/
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 28 +++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_drm.c                |  3 ---
>  include/drm/drm_bridge.h                       |  4 ++++
>  3 files changed, 31 insertions(+), 4 deletions(-)

It seems this isn't getting any response. Also we don't have (and don't
expect) DVI-I and TV bridges. Let me merge DP part to [1] and drop other
parts.

https://lore.kernel.org/linux-arm-msm/20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org

-- 
With best wishes
Dmitry

