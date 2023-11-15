Return-Path: <linux-arm-msm+bounces-673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D08847EBE2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 08:38:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B44C1C20748
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 07:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388834419;
	Wed, 15 Nov 2023 07:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iT90UQW4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8DA4416
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 07:38:36 +0000 (UTC)
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98209C8
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 23:38:35 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5bf58914bacso71990337b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 23:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700033915; x=1700638715; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q1N5b4p/p13lbsRtP6IYe/M9cBHIoG53IIFCSkJ3nug=;
        b=iT90UQW40ncjhcZDsUHcFIbBixO8eDKDNFN2aRCNMmbCfYsRKCx4ucPTFNygcxuDsl
         /gDCBAtfB1vfYs3OlWxvfCbwDRXo+pNMtxoFOZ6mGhduo46N+O4R9uTdkUHwLIgTuV7q
         zWPlfjTq++IBNJYnb7SLwQ5JyhF9rHGMJBPiq56MckxCq+bd6nFmeNqUpZ5sR+goibvP
         WD55CcrsH+BLxEPIX5yjR1s2o/eJnXihcE6SZkJ/9y1ud9JStCwj5iYZWMoMyBfFuXvL
         BLPdopbGzS795Hr2X9Iu9KEVlQ8zKby5Cuhu2znReDIjBd/xvfAFsFkgd1ZzSMNEaUyU
         8osw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700033915; x=1700638715;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q1N5b4p/p13lbsRtP6IYe/M9cBHIoG53IIFCSkJ3nug=;
        b=Ua5R41my/dZQIN/peG/Og21ORNDa0quQ6OHYSX828KiutdroBrXMGFSU9jRXzi1E6H
         VzeqHXV2b5dS4YbNv461KG7fbJpHmgLcL+kkCqF8ECAGIkw+j+f7ntFqUgc7F9IEJ89h
         Vvc1PerGWW/nMkQ6zWpVIBaXCJ7cux8j06W98T2XwcTGNehAOkoFZiLh+eALJVyfKW9+
         vS6dw+kbKF6e8PkAhaB6er1J7wsQe9LAE+hL6giiNzWkPf0tAe9bcYi2a2XpWSfI3vJD
         Cj3ewUmD0uZ35/1ibRYnIHLHNo07/gjEUvjUTAo0sopW/tAiXjdc4KmxUepcuxXW8qCL
         FLsg==
X-Gm-Message-State: AOJu0Yz0DN3oQVfe+4v92KFH/NLcXkgFVgcBL91FSxYN5iRUqWq0GHFT
	obv+5x9b8FSul2JA4AUsEUMuh2yvJe0I0yjKRInUn6VWcTxY8E19
X-Google-Smtp-Source: AGHT+IHjbgTefhGkY80NO9CwFz5yFYBdsK6NjwMZVNPorX5RtHxDYe0wL9z9xFjGN0NQqPY9WuDeHuInEdv8SASvykk=
X-Received: by 2002:a0d:cfc4:0:b0:5a7:c8fa:c620 with SMTP id
 r187-20020a0dcfc4000000b005a7c8fac620mr11860582ywd.0.1700033914825; Tue, 14
 Nov 2023 23:38:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231114225857.19702-1-jonathan@marek.ca> <20231114225857.19702-5-jonathan@marek.ca>
In-Reply-To: <20231114225857.19702-5-jonathan@marek.ca>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 15 Nov 2023 09:38:23 +0200
Message-ID: <CAA8EJppg=pYh73ncHBCO6Ddv9gG7+WNnpwLYGEv6xEu_3MRNWw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] drm/msm/dsi: add a comment to explain pkt_per_line encoding
To: Jonathan Marek <jonathan@marek.ca>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Jiasheng Jiang <jiasheng@iscas.ac.cn>, 
	"open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>, 
	"open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Nov 2023 at 01:00, Jonathan Marek <jonathan@marek.ca> wrote:
>
> Make it clear why the pkt_per_line value is being "divided by 2".
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 66f198e21a7e..842765063b1b 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -877,6 +877,8 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>         /* DSI_VIDEO_COMPRESSION_MODE & DSI_COMMAND_COMPRESSION_MODE
>          * registers have similar offsets, so for below common code use
>          * DSI_VIDEO_COMPRESSION_MODE_XXXX for setting bits
> +        *
> +        * pkt_per_line is log2 encoded, >>1 works for supported values (1,2,4)
>          */
>         reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_PKT_PER_LINE(pkt_per_line >> 1);

Should we switch to ffs() or fls() instead?

>         reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_EOL_BYTE_NUM(eol_byte_num);
> --
> 2.26.1
>


-- 
With best wishes
Dmitry

