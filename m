Return-Path: <linux-arm-msm+bounces-13840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD16878442
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 16:55:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D29DB209B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 15:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3FF44C6E;
	Mon, 11 Mar 2024 15:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LuNb+mYX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF7A4207B
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 15:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710172550; cv=none; b=KDupEUuVk/t8DluXnRpKIu09561pBPcjkDq2Y7jUTiscJrvpMN3eYUb11UItzCVp8YHK/TL/0I6KTGYcj3x1/KgAlphH4L9fndbtrqtVjWsUHpCiubeXUlOM7OlOEFFRz/3WjGwMaPvclIFy0+KRsIVJ7WzAvund7ryvFcoN6wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710172550; c=relaxed/simple;
	bh=zAsRd/e7o/S0lwDHO1zxbIWbR13kViGojdn5+lrShxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZbtuPBGE7EIKN9HEJiAJTBWEJ54d5gNPtA/wk4UN8ZBJG9JeclgGpenZEPu2VKrQEjBoTNjiwOSSkYc+t8Fi6wd3XlGYnY3QSUEyZG+YKMldc/rxNN7MiQgiqNuWsU3RjAYGS8LR6fcr1Wrk3EOr1o+zvKZsYgpe0EMR0wJLeXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LuNb+mYX; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dcc80d6006aso3003139276.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 08:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710172547; x=1710777347; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IqC9Cou3SqyEXPU8Ag0leL7h0m2p/RlcBNsi4UjO6rU=;
        b=LuNb+mYXOteZjgCO8zrgBqJpXAOxCiHAGgRJg5GpvvMdNxvKLyhbMd2KxJql+SlWSu
         V6kYKWf5NsaZ1Fb9XdLZT21zivaDCrDx+RNksD19VBt8k4Xce+NRaGVtJkQm7jgwlAw3
         cL+D69/QkNsHvT8EEMp0Cv1tCTuUCrDr5pSCRfzlIoLKRvHUOqpHZuxsuePN1jh5ryLm
         XxCKYLQzOcim/bdcJd4n/uZhVYw9uRpamEKhFq/03mJWBuazakbbwEOB3kK42lMLEP7H
         Z43yEVFDGOXIgI5zkWUIU7utktidrjNsk21BNmCw0e0592w/uv+rfO2bobqUxui2LEij
         gJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710172547; x=1710777347;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IqC9Cou3SqyEXPU8Ag0leL7h0m2p/RlcBNsi4UjO6rU=;
        b=hKc6Bizw7AZgMAj5jsUSCNemh90kjdJTNHEIdKlwKhTtnafoVzXTZZDhyXanF36HSk
         /i8YqPTFDLNLuFif0IrASNYif8MTGon+2SRTT8E8bquB+nWwfuYcLO31qTx0hHJOHQpq
         b8VfH2d27tQWme5jWJ1zVtICj2GTpB4cHqkQXLLXIBoSfHjhLqXuiwLr1H7/vKZ91xho
         U7iZXYBPUqaMzSJk/SIACqeXL9ch6RZlsFAvzVkq2JUytIWucrp1PfLnh8YY8pVTsRvY
         /NzJimkEbu1JbhXpxPq3iNhFJux78Tmq7IEecODYXNWOGt1B+1raEQNC563CzUjp809N
         V2oA==
X-Forwarded-Encrypted: i=1; AJvYcCX4w2Sf6Eenavyu1bSIpxEqkPizXh4O3C0sSBuUyUHUeLSSy74nWHVfaGBwkQBDYdUQlnYBC6RIW0UgHD5/cQSomUyNHzRID7j6OgFd1w==
X-Gm-Message-State: AOJu0YzSBLqOIHidiuOeuWfHDEV/qVwQlG13LthDaZZLrnu5dEXSpv1h
	BKzoOOmvA3CJIUym8se6FOL7aRWRY98l0G0CNjDebxt98vidYvJ403Worxxr3PqL/1GQZFpLH36
	zZ7yaEgVnhl/eamZikQlQKAmzJFesw+3CDIzmGg==
X-Google-Smtp-Source: AGHT+IGNX134IbCCsLQRWXyywz13RFYP9bvVZBJlu71sgGeu+KHfyUSOWNSXf/TCnAknceGuIOz3jGsPdLcOJglC0KA=
X-Received: by 2002:a25:9388:0:b0:dbf:ec4:311f with SMTP id
 a8-20020a259388000000b00dbf0ec4311fmr4334667ybm.58.1710172547331; Mon, 11 Mar
 2024 08:55:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org>
 <20240309-bridge-hdmi-connector-v2-5-1380bea3ee70@linaro.org> <20240311-divergent-friendly-python-2c7d5d@houat>
In-Reply-To: <20240311-divergent-friendly-python-2c7d5d@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Mar 2024 17:55:36 +0200
Message-ID: <CAA8EJpo-+qypK4gLrQGcCYi-AVtVzuCjh4HgJ6kRNsMTtNKKMA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 5/5] drm/msm/hdmi: make use of the
 drm_connector_hdmi framework
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Mar 2024 at 17:46, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Sat, Mar 09, 2024 at 12:31:32PM +0200, Dmitry Baryshkov wrote:
> > Setup the HDMI connector on the MSM HDMI outputs. Make use of
> > atomic_check hook and of the provided Infoframe infrastructure.
> >
> > Note: for now only AVI Infoframes are enabled. Audio Infoframes are
> > currenly handled separately. This will be fixed for the final version.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> I had a look at the driver, and it looks like mode_set and mode_valid
> could use the connector_state tmds_char_rate instead of pixclock and
> drm_connector_hdmi_compute_mode_clock respectively instead of
> calculating it by themselves.

Ack, I'll take a look.b

>
> We can probably remove hdmi->pixclock entirely if we manage to pass the
> connector state to msm_hdmi_power_on.

I'd like to defer this for a moment, I have a pending series moving
MSM HDMI PHY drivers to generic PHY subsystem. However that patchset
reworks the way the PHY is setup, so it doesn't make sense to rework
msm_hdmi_power_on().

>
> And that's unrelated to this series, but we can also remove
> hdmi->hdmi_mode for drm_display_info.is_hdmi.

Yes, that's the plan, once I rework the audio infoframe handling.

-- 
With best wishes
Dmitry

