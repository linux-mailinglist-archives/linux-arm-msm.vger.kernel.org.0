Return-Path: <linux-arm-msm+bounces-40156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B572D9E2FF9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 00:39:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D35DB28A1E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 23:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774EC20A5E0;
	Tue,  3 Dec 2024 23:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oDPxV6H8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E876205E1C
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 23:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733269099; cv=none; b=Mekuz87jE0Dz78XHHay5EBGcjr1LHkD9rWts3sEGiYh4jdvaObVSyhP8lULuboTZxqa5A9R1oztBQ5U08nAqb1h9Eldmmc8djseqyTezM7l6/m6aK0u9xTsQyu3p6DN7/Li2dVu/S/+JnpAls5FjxbQbw6JocDA96W6WxxnRyFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733269099; c=relaxed/simple;
	bh=7HPRDhBmNX229it5gZJpFg3uexTNN2BzNHQC2yu+IS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cmUiZfgtecGcLMq5EhX2MC+sPNeZCPUoSGcb3aNCFFeAhFo8vr/n4+FFWExAibe4Ny/8bfBnKVCY4+j+nfgt8NOScTYbWEYnHL89fEMb3xk6QpsR9LHfieHW1wRiL7IKXFrED5H1d8mznB9E7D3xFQ3+/tOXyQtthov8NHwGzMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oDPxV6H8; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53de79c2be4so7428639e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 15:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733269094; x=1733873894; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PvIkRrq0tXitj5MQqLQ3oqy5bggdWAmTtXbggggiuHU=;
        b=oDPxV6H8xIYc2tK/rpEa/CmuCJ6dY56vdJx8foBvsyawW483k5QolaXacWIdFpXLGL
         C3dvpoNhGGywbcHYg0QJwOgSxlP9wVb1dvFDuMpTM9jRmrip7VgBjGMbOo+CbFpQR2Eo
         9XN5d+PQAxneala9O9k4My7ZA/HqMtrTio+kFBax78lQ+SYoS08XxSd1doQLf3he3av0
         HXbbWnhfem3WktBW7S/4OiWjLYwlLSMJiKmP96kaDi1s69HvcRcr6WTyKfUaV67JlkSY
         WqjXPAmlz/j1TaMVEvVxP4DqdPfex8NFJsl66h0/LGFt8WH96Srcx9jGStwAjiNRE7+Z
         8s5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733269094; x=1733873894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvIkRrq0tXitj5MQqLQ3oqy5bggdWAmTtXbggggiuHU=;
        b=JhI7XbtR6je3HJCbcVeJIdgwPG4uzDpHkJp4gv2zcVLvLDBUbe7dbanwvaWOkPh5z6
         +8RGFMsdUdPblcmRtDd3VYFd6VUAyDHGz5CXmytJ+BOrHN0iALvslr1JJGR72q65v2M+
         /sXOIFJWRm/M65QVwAbNS2yrZUfLWHy2u9Cc4ee6YRptG+qWVbcEbwWGsiwLRW+YjQ5S
         nbq5OJwfF+eh46WlIOR68qJsSPPxIfPqYLTE4s23KmmD4LYfEUDQ9wABFuWHJ//pP+pW
         yH852xJXpR1N4t7k2FgLr5rw1omzN+dlcptKTln5WXYTdEoha7lYIEYqdUsJxAAn9a7b
         vO5A==
X-Forwarded-Encrypted: i=1; AJvYcCVn/Pdx64TN8aEkPW4heSTyzU3gYaCgFBHz1OLzPPtE2goEaYnvHaQ/bFpoHTOFm3GK7q/z8yUqXE4pZflj@vger.kernel.org
X-Gm-Message-State: AOJu0YwHXVTJefmm6zOQNV5e+/UlyhEv1uReDCCEa7dkADPBTXK6/RDI
	ubdKkzhFrDHlvA33gx+AJ/0GWJDsl5dz1G+kThkGC2GrcK1y1JWrXCrR6C+uZ9k=
X-Gm-Gg: ASbGncvaWNYknrI98uM0fjlwRnSE2LtaSn6R6/Xyk6bmDvw4OUuScB2vQvqVj8j0Ica
	LHMwKEien5JEtJCCn4I9eyFIdhkMfv2XluXbf+55pTkl6aOLuGpviULmwwsS5/IVXGZjOjQNhyp
	gN5KxkHRXuq52L99Xp/NT4Lq5vRKX5jI5+9W7lbC0ClPJ7ZSJxou6/BSpdeE4MXMkDfwVJBgnHX
	M5ALJWKqYzDbtWRWGRgVvnL7Lrk0cKQy80leE576BCu/pHhohHM+2DMetP0YLxnFE4brp2svktZ
	DLCa5tVbHeJh3x6Io0CE5F5Jtd2oOw==
X-Google-Smtp-Source: AGHT+IFEAY3DxNqKHxw8mhGMitDTHIqwhcTfqELsGsjzfMmTb1zcKOW4rDkr5UYxAPj+4eEnCeVPww==
X-Received: by 2002:a05:6512:10c5:b0:53e:1c3d:d1ae with SMTP id 2adb3069b0e04-53e1c3dd2c2mr500865e87.29.1733269094445;
        Tue, 03 Dec 2024 15:38:14 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6496903sm1980271e87.210.2024.12.03.15.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 15:38:13 -0800 (PST)
Date: Wed, 4 Dec 2024 01:38:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH 3/3] drm/msm/dp: add a debugfs node for using tpg
Message-ID: <uv2phgi72mmw5c462ijsqlqedeiv4gahrwi26i2luqkhgwmfxc@ycj7jrujdj6w>
References: <20241202-tpg-v1-0-0fd6b518b914@quicinc.com>
 <20241202-tpg-v1-3-0fd6b518b914@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-tpg-v1-3-0fd6b518b914@quicinc.com>

On Mon, Dec 02, 2024 at 12:42:00PM -0800, Abhinav Kumar wrote:
> DP test pattern generator is a very useful tool to debug issues
> where monitor is showing incorrect output as it helps to isolate
> whether the issue is due to rest of DPU pipeline or in the DP
> controller itself. Expose a debugfs to use the TPG configuration
> to help debug DP issues.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_debug.c | 61 +++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_panel.h |  2 ++
>  2 files changed, 63 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
> index 22fd946ee201..843fe77268f8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_debug.c
> +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
> @@ -197,6 +197,65 @@ static const struct file_operations test_active_fops = {
>  	.write = msm_dp_test_active_write
>  };
>  
> +static ssize_t msm_dp_tpg_write(struct file *file, const char __user *ubuf,
> +				size_t len, loff_t *offp)
> +{
> +	const struct msm_dp_debug_private *debug;
> +	char *input_buffer;
> +	int val;
> +	int status = 0;
> +	struct msm_dp_panel *dp_panel;
> +
> +	debug = ((struct seq_file *)file->private_data)->private;
> +	dp_panel = debug->panel;
> +
> +	input_buffer = memdup_user_nul(ubuf, len);
> +	if (IS_ERR(input_buffer))
> +		return PTR_ERR(input_buffer);
> +
> +	status = kstrtoint(input_buffer, 10, &val);
> +	if (status < 0) {
> +		kfree(input_buffer);
> +		return status;
> +	}
> +
> +	msm_dp_panel_tpg_config(dp_panel, val);
> +
> +	dp_panel->tpg_enabled = val;

Does this need any kind of locking? The driver performs some actions,
then we write the global state. What if the user in parallel writes
different values to the file?

> +
> +	kfree(input_buffer);
> +
> +	*offp += len;
> +	return len;
> +}
> +
> +static int msm_dp_tpg_show(struct seq_file *f, void *data)
> +{
> +	struct msm_dp_debug_private *debug = f->private;
> +	struct msm_dp_panel *dp_panel = debug->panel;
> +
> +	if (dp_panel->tpg_enabled)
> +		seq_puts(f, "1");
> +	else
> +		seq_puts(f, "0");
> +
> +	return 0;
> +}
> +
> +static int msm_dp_tpg_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, msm_dp_tpg_show, inode->i_private);
> +}
> +
> +static const struct file_operations msm_dp_tpg_fops = {
> +	.owner = THIS_MODULE,
> +	.open = msm_dp_tpg_open,
> +	.read = seq_read,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +	.write = msm_dp_tpg_write
> +};
> +
>  int msm_dp_debug_init(struct device *dev, struct msm_dp_panel *panel,
>  		  struct msm_dp_link *link,
>  		  struct drm_connector *connector,
> @@ -231,6 +290,8 @@ int msm_dp_debug_init(struct device *dev, struct msm_dp_panel *panel,
>  		debugfs_create_file("dp_test_type", 0444,
>  				    root,
>  				    debug, &msm_dp_test_type_fops);
> +
> +		debugfs_create_file("dp_tpg", 0444, root, debug, &msm_dp_tpg_fops);

I'd say, skip the dp_ part of the name, everything in that dir is
DP-related.

>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index 0e944db3adf2..7910b11fd685 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -50,6 +50,8 @@ struct msm_dp_panel {
>  	u32 max_dp_link_rate;
>  
>  	u32 max_bw_code;
> +
> +	bool tpg_enabled;
>  };
>  
>  int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

