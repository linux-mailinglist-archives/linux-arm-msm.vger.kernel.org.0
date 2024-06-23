Return-Path: <linux-arm-msm+bounces-23751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B40A9139AF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 12:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C30F31F220C8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 10:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8002012E1E0;
	Sun, 23 Jun 2024 10:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O0pURa1c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA7D944E;
	Sun, 23 Jun 2024 10:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719139747; cv=none; b=kQZrER/W5xLl9jWLt/HOW+8qjUGZg13fpAQ07w1eBRckfbNbiSIYBzFZ76wtUmaOUp5IPJsaDULiNyKXR7FYH3Bl7WaWtNTq+i0NB5/CfJawaRuo4kq9gKSFnhcZx4u6BZDsWjbrNvvHW/zumxp/Gc3PELvK/F8B9RP9pOOesnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719139747; c=relaxed/simple;
	bh=X6fFwcZ2bciYxHGg1tV+do5pO+J0UpUU9qrl+KByrH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DUJBuKn3UT/U8bahqqhf1ZDjG5raXihPDukgNnSM5z5vW3Q7hhgTmP9BXttwZ9OtOibi9usQvmVBRNVbYOshT3g3gxOK4GApw0yui3eloHvZbY6tSYwm8Ccs0jmq8fo8IwcYZU3z7yBEF4vA1ecZLZY2v1KWyF15CHlQuz4fg3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O0pURa1c; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-71816f36d4dso1118160a12.2;
        Sun, 23 Jun 2024 03:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719139745; x=1719744545; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5tOKBNF1K6kM4/l3Ir2w3oOEOvrznnr6BloYrKa9764=;
        b=O0pURa1cOzyVKAtG9QML4oivBW49aGJ4dmSgRzH1Q/oeoUqivDPeCZcqEE0ijWqo8v
         n3E5bsJeFNm9YQb1uqaTAr8E2J2YAtvYbkfN52jbS5pSrS5V2fUWcOsN4L0WmOgTeVP4
         1pYXSg9niS37jDNtYn6rVEZavNQdg7mbF81rAufOlnkmh8z8lYyi6Fp2b5in8vk2uRC3
         rsPwDBWDZJt7Le+X1tOm8URI+2cz3sseKPR5EZFHgMlhnZr92vLk4tNyEPkbUrzI+3LK
         FguUA5iS/2H1FZKe6SNyBhiDVBRPA6soJbbfDeeltsxLtLvfBMNij+QIcZ/+vqBiwGJC
         8J4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719139745; x=1719744545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5tOKBNF1K6kM4/l3Ir2w3oOEOvrznnr6BloYrKa9764=;
        b=HwKL2mN7k0vMhIavzf8DiMeaSdoLrjyUCPXIfkBbo9mq3gYfHXl9Vy1Dk2BfOv+HPh
         g6aKQnIQPIHYSXgb6GAVT9omGJ8AIIig/KnadkiAjLrV+G3Whmn6Cm4/YmGOan+f1eRU
         cHgpfeTIwmgW5l9eji+gs/j10Z8MR+UB2WsRi9as2/mlK4uMlBME+zn6+xNMj2qRat6w
         eObGuuKr0hQz1XYnUSNqWGnr15A/Yt5ysXWoy6wZhJIQBjH2C6LUV7b6Wv/KyxLTMZsK
         sMUiztrCtLKWlv2PX7815Z9OtNaFHex+FaFBrZNNeSuqW9CIuQhWjlU5PTLop+G5AMsc
         Rc1w==
X-Forwarded-Encrypted: i=1; AJvYcCW1zgJwBRONwUZ4uRkU518zawwJIJ+aVjKqmVe6yG9NlalMCAab9BQFGUgMIokHs+grGkDwAcAdvVAxopZ59xTbyQI5g12t0P7HQL5ZEuTTu3jN8BsrPKoX7KC8HQ9dUPllxuzL8CwpMnxmc0I/ThP+koabLj5Ds2f0bw7JDoLte6cfwQ+S+ZM=
X-Gm-Message-State: AOJu0YzJkaGXMLkLxeKwcg5nJRfNVK5iAjl0d96jJJZPnjCJgEH/6MFB
	rQTn65FjugQg9CIKn7LqNG8XSMQyozP5FucocrQI+9yuowMUCCFvVpnMgACBIekyz3RevKV3WKk
	cIvDU2shNE05bNWJIm9xAAy0+T4U=
X-Google-Smtp-Source: AGHT+IEYhaua3z+8fvVxYKOlzI0SeXlh1Mqqe1m7wg491bift0wbb0Sz1XkAToMjWcbemVJ9AJKorDfG72cQicJRWyw=
X-Received: by 2002:a05:6a21:7882:b0:1b5:1feb:b3f9 with SMTP id
 adf61e73a8af0-1bcf7e32018mr2620120637.9.1719139745149; Sun, 23 Jun 2024
 03:49:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240623-dsi-v1-0-4ab560eb5bd9@gmail.com> <20240623-dsi-v1-2-4ab560eb5bd9@gmail.com>
 <hzslz54iq5sjmfhcbuj3my7cbjsu73acxeelih3jekr6rznz44@qie4c4w5lt2d>
In-Reply-To: <hzslz54iq5sjmfhcbuj3my7cbjsu73acxeelih3jekr6rznz44@qie4c4w5lt2d>
From: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Date: Sun, 23 Jun 2024 12:48:53 +0200
Message-ID: <CAGsSOWUDbvUMW95Xnjrg4z7TJ9=tj7_KHyek3xTuzbDP2_VhHw@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/msm/mdp5: Add MDP5 configuration for MSM8937
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Daniil Titov <daniilt971@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2024 at 7:59=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sun, Jun 23, 2024 at 01:25:52AM GMT, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> > From: Daniil Titov <daniilt971@gmail.com>
> >
> > Add the mdp5_cfg_hw entry for MDP5 version v1.14 found on msm8937.
> >
> > Signed-off-by: Daniil Titov <daniilt971@gmail.com>
> > Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <trabarni@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 89 ++++++++++++++++++++++++=
++++++++
> >  1 file changed, 89 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm=
/msm/disp/mdp5/mdp5_cfg.c
> > index c5179e4c393c..6413c0d3e237 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> > @@ -1011,6 +1011,94 @@ static const struct mdp5_cfg_hw msm8917_config =
=3D {
> >       .max_clk =3D 320000000,
> >  };
> >
> > +static const struct mdp5_cfg_hw msm8937_config =3D {
> > +     .name =3D "msm8937",
> > +     .mdp =3D {
> > +             .count =3D 1,
> > +             .caps =3D MDP_CAP_CDM |
> > +                     MDP_CAP_SRC_SPLIT,
>
> Could you please point out the SRC_SPLIT reference?
Is this would be qcom,mdss-has-source-split in downstream, because if
it is i think it is a mistake and it is wrong at msm8953 also.
>
> Other than that LGTM
>
> --
> With best wishes
> Dmitry

