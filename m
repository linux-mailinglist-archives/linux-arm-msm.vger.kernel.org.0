Return-Path: <linux-arm-msm+bounces-11805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E29185BB19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 12:56:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D76031F21362
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 11:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A0D867E73;
	Tue, 20 Feb 2024 11:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iQUs7WiY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A7D67E65
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 11:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708430155; cv=none; b=I/18mTB3MKHP7wnR1+6gdpossrEZjSNJzKLcZYCUEdanYqHA7gh2KJX4fECvigH/JmPlU3o0gzVuYHh4Ir8CqjtrvIzPN2Ickot43olMNVE65dk38/OqKehUKYpX+/kBPHtavcT5ynUXd7KIG+J9hj5qbrdRbNB1j/eqVASaaaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708430155; c=relaxed/simple;
	bh=eRbFyA1HvnTiPA/WeNSsg+LGCPcb7wlEk3IxlkbWnAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OLZXzxTbNlFlODyvVG5novXuoHeAovcWfM9Zrq312f481A5smEWlQB0nL7lu7urfQd0h4A4wWmPxiTah7wLu9WAjtD3yV2KOW0CKvm6aIj5SmVM41nickUx1WSWF75xW5fVxMeDEjWvcOGrhIjPOd8NW+1Li6aS0/90CDjLyWhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iQUs7WiY; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dcd94fb9e4dso5396170276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 03:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708430152; x=1709034952; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uumLRt54NCf1C2r2Jw813VJ80gZwOfopdqyWnHS9j/Y=;
        b=iQUs7WiYRjzGkvUHMWXgnimq2PfuGVqXsXx1Wq+uIY5+jjT1HCeHKFV45dDyEn7XIB
         n4+z4z+b00r9QuOZEi+vm+eQy/KyEt5eF1ePUbWMfn8gwY/jHy+HlPX6mM1TYoOE+tj9
         5Ggoge+2oxr3yFaQE0hyPX+beq2WcgdOy0QEGxfQsnJ3N5DsDFHCUpSBT6RVjak5GsS9
         wYx46u9WxPVlXbmWxMMPtpN03FwMVdzEnYzRr7wNnkDjkIsUZQPtGKGLWbM8xDHO1I7W
         AwhAZNQaEgO09cJxGLmTeYx81DY2fLc/EaPgloi/igK70jCCp4EAB0n09SCFLFE023pY
         vIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708430152; x=1709034952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uumLRt54NCf1C2r2Jw813VJ80gZwOfopdqyWnHS9j/Y=;
        b=cwO1dWtpCdHMfql6bCx8w49TBTiarFjskShQ0XQ5kksitBwOsVLtQMjDUDJNNRChC2
         5S3N30ypjV+kwrUls/zd/lgCCQbqIV16tGufWPHLXpNYMyY1X0rRVT6S7jTg+SLK+430
         EImRw5qQNTH/1a33XkxYBEVLCMJiOWDOJt9NuvZ/loizoBujsLqtLTu4GwIHhyNhc+VT
         8P8du3u/vI6eBe+m8FWenCfTAsnDhZMPMaVKftnST30HqF/ynbPfhPWF66jMDdMcZHRH
         w5XsIvQnhQpgyj9kdb5Iz8D06TcGZGPw6gIIvzrY0KJFMulArtRQuCEgnUAX0ZICudnC
         MWkg==
X-Forwarded-Encrypted: i=1; AJvYcCUvQDsf5Lrp9oTM0v2WK7UyzCWj0qCHHNW5LRXS0Vp0NHUnvDIjv3lpGVfI1zcULkhfhMMNjekKUbfFMlpXnZS0khfgE22vK6KRaHnX5g==
X-Gm-Message-State: AOJu0Yz/4SZWVcEsA4iqgg7uTt3UU7eITWbvMW1HuZVsa5kCriUoDiCJ
	EW1yIZo5fU0fWs0ICM4KEzPAe6ut0yqDBYQNakSYwt8f/0lVVuXNIv3m/KpEZlbSgdK/qYVeQx7
	DOPRyijiFNIAF0rwNqnO381ta1+fk4V/UEwG3Aw==
X-Google-Smtp-Source: AGHT+IExpvpD8AgXA3aIHbCHCE4RqNcFOBxn35EoCinO8Hpk+aekmgbnXIo/496q/fTFdU86koAVpAivWwXL7BwqeFo=
X-Received: by 2002:a25:8d0d:0:b0:dcb:ef22:3869 with SMTP id
 n13-20020a258d0d000000b00dcbef223869mr12986540ybl.16.1708430151780; Tue, 20
 Feb 2024 03:55:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240217150228.5788-2-johan+linaro@kernel.org>
 <c95f5ff3-8dad-4302-9384-92a9b83f7bdc@web.de> <ZdRTx2lmHBVlcLub@hovoldconsulting.com>
 <1afc87c-2c1f-df10-a0c8-2a267d44122@inria.fr>
In-Reply-To: <1afc87c-2c1f-df10-a0c8-2a267d44122@inria.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 20 Feb 2024 13:55:40 +0200
Message-ID: <CAA8EJppH9ey97yKFUccNLHhMKs3eUS55+rY0tXm_a6KGp9jtug@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm/bridge: aux-hpd: fix OF node leaks
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Johan Hovold <johan@kernel.org>, Markus Elfring <Markus.Elfring@web.de>, 
	Johan Hovold <johan+linaro@kernel.org>, freedreno@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Bjorn Andersson <andersson@kernel.org>, 
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Vinod Koul <vkoul@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 20 Feb 2024 at 13:52, Julia Lawall <julia.lawall@inria.fr> wrote:
>
>
>
> On Tue, 20 Feb 2024, Johan Hovold wrote:
>
> > On Mon, Feb 19, 2024 at 06:48:30PM +0100, Markus Elfring wrote:
> > > > The two device node references taken during allocation need to be
> > > > dropped when the auxiliary device is freed.
> > > =E2=80=A6
> > > > +++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> > > =E2=80=A6
> > > > @@ -74,6 +75,8 @@ struct device *drm_dp_hpd_bridge_register(struct =
device *parent,
> > > >
> > > >   ret =3D auxiliary_device_init(adev);
> > > >   if (ret) {
> > > > +         of_node_put(adev->dev.platform_data);
> > > > +         of_node_put(adev->dev.of_node);
> > > >           ida_free(&drm_aux_hpd_bridge_ida, adev->id);
> > > >           kfree(adev);
> > > >           return ERR_PTR(ret);
> > >
> > > The last two statements are also used in a previous if branch.
> > > https://elixir.bootlin.com/linux/v6.8-rc5/source/drivers/gpu/drm/brid=
ge/aux-hpd-bridge.c#L63
> > >
> > > How do you think about to avoid such a bit of duplicate source code
> > > by adding a label here?
> >
> > No, the current code is fine and what you are suggesting is in any case
> > unrelated to this fix.
> >
> > If this function ever grows a third error path like that, I too would
> > consider it however.
>
> I guess these of_node_puts can all go away shortly with cleanup anyway?

I'm not sure about it. Those are long-living variables, so they are
not a subject of cleanup.h, are they?


--=20
With best wishes
Dmitry

