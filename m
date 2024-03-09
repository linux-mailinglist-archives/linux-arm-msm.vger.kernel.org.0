Return-Path: <linux-arm-msm+bounces-13756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EA48771B8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Mar 2024 15:54:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4737EB20CB9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Mar 2024 14:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14E21BDF4;
	Sat,  9 Mar 2024 14:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BN91Sc0X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0FC79DB
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Mar 2024 14:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709996042; cv=none; b=QJKSH1NEXYLGEdSOUQLpiMVjtR+Fq6C/4eFMZNFw7cjedFlk52oauiRPF5/eI3POLoSiJBVbT6on6H2iPQuIfZlK8IwP9sD4Fh5DcOCMJrM0l0HtWtF87r9yPyAFoI1sxqe1OoonPhjJgx9ku+iVZJqkTAbFEl9+U1X5uGKugmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709996042; c=relaxed/simple;
	bh=nZVZ+cgfheuGrsjhwMbLKIVDmx925C7s/+ewxVKFVxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KjgF5CW4Hiox+VQqUXXEnKakcEvtRQOl6DJ9/oacseCEd4dyTqDzH6MRjgOR5R4O/qrN8cd2y0I4J2U0rq2IM0yLQzW1GaTfcmXOkl5+sUdK3Xta39TvI4yptyoymOnPlst3KWLQPLGlZcJQSkcGl0cWr5pE4l4HSaeOmWZheyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BN91Sc0X; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6e50e8dcc72so1096315a34.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Mar 2024 06:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709996040; x=1710600840; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eA04sqjyv1s/Dz3T5kRYEcPdCWodFVKdwAB148+mkYo=;
        b=BN91Sc0X8sCnmINrZZg0VlYOxhLutcVJ0qp9oHFK35n7MOcZkWfC/KKYmqEh5VIYel
         Vsj1celR3WeNxBwCd93BCvAiyn4Z30FQvJSRk3+OzTUOGmhyNzmhZiR74H1ZnYWng62B
         gxHwWKAyaY5Zqn8Gi27J5//Llk81dRvd93FLDJuqJ7HDRL9ok29gIPXIisF1sHD/CAvW
         pxf49UFTvw/gAaButsSZwPcOUjP63ZgFNoP5vRASUKS7mh8MK1LlAJn82Px20tf7jCqA
         xzkAA6aYAypOuH+zIPByDYQCEYnEHmvkVE9abp11jd4ptY5vdJ4TtR2eM+5mHw+fe64S
         DLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709996040; x=1710600840;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eA04sqjyv1s/Dz3T5kRYEcPdCWodFVKdwAB148+mkYo=;
        b=X/Ec7v3UzIlocT9HI25HcCx1/N4hLeyF083ogSDrhsdY731xEjZvTlTCxby1L/W2T5
         7XT6kSCgO/TmJOZ0mMhkK3Pvtuw4WFOE/iS9O0j6bNrf9EGlmV3q4ljYKY8qJIAz4liP
         TZOw7nCgkXggcHujM2HAIHsK4220koAeD4Jq4OlThwm+jRWU2nJCmbhCaPXhnaXEDvnM
         HG+KfNCf5tXM26b9GtuIhUmVA7aIetojVfrjwm0WoajDpGsYDijDkuXJIiNLFxoczEqC
         F8YqtEUcnfD5qDOJnEiugm/6kuHek4Y6W2MSUCuruHj6jtctXEJksvhs8SBE1+MR0OjR
         hBJg==
X-Forwarded-Encrypted: i=1; AJvYcCXIK+7SaoHoeum261dS7sXb8k/e2J2jvxi+k9H5cyXuDPEfNOqqc2KLNu13AX8ivqa1BfNTFUl8NkmpwS5uyR+HXYR7ht7JlG6W0bwUFg==
X-Gm-Message-State: AOJu0YzpQqLApmTCuQydY+CY5GTBYn4OGUDXeshLTRd07DxPo81LZChi
	ozBTHVpOF+BnPwvEQWvdnrhj7G03j8Y6eA8TGphPN7fR9wNvbWoGTOfnadX3Lju4SDM6xrlcgum
	wH+/bxOTnNiM3SeB+tfASEosI2EptgUXDs9Qc5A==
X-Google-Smtp-Source: AGHT+IGh+XRVvBrKiaVYq3PacuzxQQy/9lP1FD2uNT0gS6x67HG5T1oQcujWS6KkWYVspsQstMOvbHfqwxCdAZfKq98=
X-Received: by 2002:a05:6808:4483:b0:3c2:1596:d5e7 with SMTP id
 eq3-20020a056808448300b003c21596d5e7mr3213978oib.46.1709996040196; Sat, 09
 Mar 2024 06:54:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org> <20240309-bridge-hdmi-connector-v2-3-1380bea3ee70@linaro.org>
In-Reply-To: <20240309-bridge-hdmi-connector-v2-3-1380bea3ee70@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 9 Mar 2024 16:53:48 +0200
Message-ID: <CAA8EJpoBO--ZrOjJqWwmcKV+tEvyJ-H9jGxkhK0rAZ3Tw2gVMQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 3/5] drm/bridge-connector: implement glue code for
 HDMI connector
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 9 Mar 2024 at 12:31, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> In order to let bridge chains implement HDMI connector infrastructure,
> add necessary glue code to the drm_bridge_connector. In case there is a
> bridge that sets DRM_BRIDGE_OP_HDMI, drm_bridge_connector will register
> itself as a HDMI connector and provide proxy drm_connector_hdmi_funcs
> implementation.
>
> Note, to simplify implementation, there can be only one bridge in a
> chain that sets DRM_BRIDGE_OP_HDMI. Setting more than one is considered
> an error. This limitation can be lifted later, if the need arises.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/drm_bridge_connector.c | 118 ++++++++++++++++++++++++++++++++-
>  include/drm/drm_bridge.h               |  82 +++++++++++++++++++++++
>  2 files changed, 197 insertions(+), 3 deletions(-)
>
>

[skipped]

> @@ -705,6 +753,16 @@ enum drm_bridge_ops {
>          * this flag shall implement the &drm_bridge_funcs->get_modes callback.
>          */
>         DRM_BRIDGE_OP_MODES = BIT(3),
> +       /**
> +        * @DRM_BRIDGE_OP_HDMI: The bridge provides HDMI connector operations,
> +        * including infoframes support. Bridges that set this flag must
> +        * implement the &drm_bridge_funcs->write_infoframe callback.
> +        *
> +        * Note: currently there can be at most one bridge in a chain that sets
> +        * this bit. This is to simplify corresponding glue code in connector
> +        * drivers.
> +        */
> +       DRM_BRIDGE_OP_HDMI = BIT(4),

Note for myself: before v3, handle this bit in drm_debugfs.c / bridges_show.

>  };


-- 
With best wishes
Dmitry

