Return-Path: <linux-arm-msm+bounces-22444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87314905397
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 15:22:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD9021C214B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 13:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E910817799B;
	Wed, 12 Jun 2024 13:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JfE3Nu+l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572B0178CE2
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 13:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718198536; cv=none; b=rkpzdMrry0DmKSHsoNIwJcl1+hiSBTuSer4HTD0Ni5xL6/3faRDFdxIiF6eFwL2FNLCdkO65HQ1kiFA3j2hxXJmZbEUrgowp4ucvC77N0GdlkwPEIYR5qVO5vYdUM0ezKUpKo71io+29QRGzeEKUZ52bzITbwSnmHJFfAzpdEm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718198536; c=relaxed/simple;
	bh=RM/yyON+6lyB6Kj4FOxNNV+NuZ2jFCP1VoFpY0bDmWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rHAVF3t2YHiSr4I63pZ/BUnzF3X1pyNRnJR/av9QJgcPEOpmgD0V/SC8IXMbVxMqS8x1okxpfgU9Uj/iMzl6M71zkGQoqt/hHDmijMsWfqPREBoTEiJvjpYpr4EXolsuTAX/W6d6uFnp8mOEPt9LOVPlTDs4tJka/k5iVuGQjfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JfE3Nu+l; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-62a2a6a5ccfso28082317b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 06:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718198534; x=1718803334; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qsoWuzn17VvjikVzQz6+Jyxo7R4j3K1aNLPcDUzQdZE=;
        b=JfE3Nu+lmQGflisTTxgOBVHAJbnSfMDvQr63ehaSAYORVOR52uudhzIClbDtCANmx4
         GYiJqVM4BFGMns809djxKdwe/uCR8iFx/tiR9hD/xyrJFhPEpYJYyi0OGF4Qo9ePE6sS
         ZXimjFnq+J800ZP6lkvAOTHz7QbAQ3nZGqkaMb1J9oQrtcSPck7Rb9Nm2OyZiWxvh+rT
         gMDSk6C6k6FWYiy+M8XYDPGr+nLJG0mKRNWSfkrhvoHEaDz3UErKiT96yhWnTJ4FvKdc
         X0w9N7jApdNqrBSDw53srx3yJH9nonelAeJAt3UHm4wBTbDFAWs3M+RIIJ180LS4stKx
         yRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718198534; x=1718803334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qsoWuzn17VvjikVzQz6+Jyxo7R4j3K1aNLPcDUzQdZE=;
        b=qyoCO+R/Zp4TrAzYipJgObsZjbdpSNIzWwCLGCUYL9QMqUBlohanFEEIDL5UTypHAB
         XyHirddPV9rovxXHEnFKwLf8cbp4KKo4/3fm/RqbGje85QpP8hwW5AhYo6QQLFz/HcE0
         RRGflfweoazFOkut/9Yq7XUYM6zbf5niEfM+dQWVbjd0YfWuvZO2UpY/7uN5/ykNpcX5
         6PWIldWXQK2smcLw9NB5d1aduysq79h9qCQcZDhSpIlCVWisx877PWHs7uGtWIYKD1nu
         cJHwf5/Z+brdYnIAilcrmx5J6re1cSIx5yELR7Nur+duYu5ApMD0WLol5w0ZrXmw65xf
         Xpig==
X-Forwarded-Encrypted: i=1; AJvYcCVr6XVmR0Kp8yZveks5ETpVfV+E4HlKw/ANrey+On61OBG/gEU8lhqJVP1oRl9TNJZSpxnQqyt4Df4ZVu6g5ASCPmRh2z/6JTT4u+AVWQ==
X-Gm-Message-State: AOJu0Ywq8eQNBczni/iuo50fyHfQliwYYAKaf3czVdZkmA0WkSLK99p0
	Y3HHmvm7W7agfEQLmwfz2lxYSL8r4i0y3un7ihg3gtIVlivmdSCtAIPjjcymtfl9CY/IZqmXvZL
	TisXcYPjMcI+/XOsTa1AdQWEeM6bVrLBdtXHiSA==
X-Google-Smtp-Source: AGHT+IHOmiC+sARRKPnM20C1DGRPtMc6UmI9stZNJsOQF5EN19JWxDcLDuyjTBRVCwm3T5Vs6GZWTmySOdJ8QSidTZY=
X-Received: by 2002:a0d:d841:0:b0:62c:e8a2:305 with SMTP id
 00721157ae682-62fba375c1fmr16113497b3.41.1718198534271; Wed, 12 Jun 2024
 06:22:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240522-fd-hdmi-hpd-v2-13-c30bdb7c5c7e@linaro.org> <deaa2a50-9e16-4f23-8c13-34947ba4e4e0@web.de>
In-Reply-To: <deaa2a50-9e16-4f23-8c13-34947ba4e4e0@web.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 12 Jun 2024 16:22:03 +0300
Message-ID: <CAA8EJppn_mVzmd==-bs8je8VjXrNrWu0hNXWAGuP+TP3DARReg@mail.gmail.com>
Subject: Re: [PATCH v2 13/14] drm/msm/hdmi: ensure that HDMI is one if HPD is requested
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, LKML <linux-kernel@vger.kernel.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 12 Jun 2024 at 16:01, Markus Elfring <Markus.Elfring@web.de> wrote:
>
> =E2=80=A6
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > @@ -117,11 +117,13 @@ static void msm_hdmi_bridge_atomic_pre_enable(str=
uct drm_bridge *bridge,
> >
> >       DBG("power up");
> >
> > +     mutex_lock(&hdmi->state_mutex);
> >       if (!hdmi->power_on) {
> =E2=80=A6
> >       }
> > +     mutex_unlock(&hdmi->state_mutex);
> >
> >       if (hdmi->hdmi_mode) {
> >               msm_hdmi_config_avi_infoframe(hdmi);
> =E2=80=A6
>
> Would you become interested to apply a statement like =E2=80=9Cguard(mute=
x)(&hdmi->state_mutex);=E2=80=9D?
> https://elixir.bootlin.com/linux/v6.10-rc3/source/include/linux/mutex.h#L=
196

I am not.


--=20
With best wishes
Dmitry

