Return-Path: <linux-arm-msm+bounces-28173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1F194C424
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 20:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0DC43B21AC4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 18:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DEF01465AC;
	Thu,  8 Aug 2024 18:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r3Kp+QKc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39C355769;
	Thu,  8 Aug 2024 18:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723140884; cv=none; b=i6fPaPMGi3RukfnC+fmnCuodKKeXPyvvcKIIAuB0HH2WAnSpeGMubSiFRY8+9BQNDHgjZp4StFVrh02OK0zKxpXhtcHUIeeiMwvdj5x+fcjkPgVSJnW4TSpRARkUP01Ox6YsDdvd6vt38a0XoG8HrRxk+5cqETP3e50EkkObL7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723140884; c=relaxed/simple;
	bh=ibFfVd+cZefkmTwM6d8twhJsesdnyTlqQkfxlzP3LP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QSzGhz4a4QwcZkpd1LYq/EmQ9EhBhEXwIQ0QRbYKFbVh9XBVS07qXTUCsrzj/dMr6/5iopUYBENvov0S9I5DnJegb5r+FM0phF7eluobpu+oQOqHMqJUmeR3ToQBZE1P3QeIdN998I2q/EaETtAnwaFbZ4Erae4+qOfahJkESNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r3Kp+QKc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43CB3C4AF0F;
	Thu,  8 Aug 2024 18:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723140884;
	bh=ibFfVd+cZefkmTwM6d8twhJsesdnyTlqQkfxlzP3LP4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=r3Kp+QKc7YjOUcWlUM3Eji75cTqOSlqwxIl4/6eSAQq/tdrNgbJciLBOreTXacKk5
	 b5pFz71IbIK2ER6XsLox74hC88aJqd92nhu0MvQtVmB9cKM138e4BpK404i5NmHb2G
	 Md8SMHYEK1iqLo6Eujx8OS3w4UXD2iqU8DR2D/tU6d81crRInDi2eZTo4Xj16MyNzN
	 O7/4t+WQSTI+uzRYBAN9Mh6qFWdYtD6gN/moyYttCw6ThIgS7aNzWR0ilXPl4n2aHl
	 +qudIImKGyjVbKUg0cOAOpiz4lm94wGG59glLGyMKJ/auTFwlVnv3AQJ9LZRjlXRo4
	 Gx8/OaA1t0xjg==
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e0b7efa1c1bso1058603276.3;
        Thu, 08 Aug 2024 11:14:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVl3Uts3Jp/SpbCViLoDjt2ETHtWDvRiEVfEH2sBiDpWTE+FYpjXF05SH9V4GN/YHxnlIR6DCn149EKJL0CU3qe43Ma5U5irHoKqfrpujOdi3Pp+D1r5YGY5N3ZyupnPwp+KVZlLtMJpg==
X-Gm-Message-State: AOJu0Yxmc0AHi0S/pH8rdCot36KOe0kk5Zq0kY88xIvMPiJdr9JYpY8N
	YVTTE3/P+3dXOQTWR2xKMaN2Fn9S3wDZ2oA+T7BIleeks4cy3reGA/KATJEM3VaRq0808hKo4cX
	+OyQwuJ8AT2gXUpXl2vT8o7k1BQ==
X-Google-Smtp-Source: AGHT+IEHW63m/reJ+5nk0ZLtwsUSOqEHxAlcDSSSrv0YDnAxKdzHmdeUKgZ63tGttz01GnWGZofD6wAr6VBKgFt26e0=
X-Received: by 2002:a05:6902:2190:b0:e0b:bf20:4fed with SMTP id
 3f1490d57ef6-e0e9dab0676mr2973207276.24.1723140883504; Thu, 08 Aug 2024
 11:14:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729205726.7923-1-robdclark@gmail.com> <CAD=FV=Wo2nVzn6qvwSAFAnrFX4wtv6_ZCVZaL1K_DBBFg9DJ=w@mail.gmail.com>
 <CAD=FV=XMJ7b=2tt6_2oTGFXuL8XcmBxuDtQBoWdf_65YyS49XA@mail.gmail.com>
In-Reply-To: <CAD=FV=XMJ7b=2tt6_2oTGFXuL8XcmBxuDtQBoWdf_65YyS49XA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 8 Aug 2024 12:14:30 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLRTgQRPcfXy4G9hLoHMd-Uax4_C90BV_OZn4mK+-82kw@mail.gmail.com>
Message-ID: <CAL_JsqLRTgQRPcfXy4G9hLoHMd-Uax4_C90BV_OZn4mK+-82kw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: samsung,atna45dc02:
 Document ATNA45DC02
To: Doug Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Rob Clark <robdclark@chromium.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 6, 2024 at 11:52=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Wed, Jul 31, 2024 at 4:39=E2=80=AFPM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Mon, Jul 29, 2024 at 1:57=E2=80=AFPM Rob Clark <robdclark@gmail.com>=
 wrote:
> > >
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > The Samsung ATNA45DC02 panel is an AMOLED eDP panel, similar to the
> > > existing ATNA45AF01 and ATNA33XC20 panel but with a higher resolution=
.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > >  .../bindings/display/panel/samsung,atna33xc20.yaml       | 9 ++++++-=
--
> > >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > I'll plan to land this in drm-misc-fixes next week unless someone
> > objects. "fixes" instead of "next" for the same reasons discussed
> > previously [1] that the dts patch should probably be considered a fix
> > and there's a chance that the dts patch could land in an earlier
> > version of mainline than the bindings unless we consider the bindings
> > a fix.
> >
> > [1] https://patchwork.freedesktop.org/patch/msgid/20240715-x1e80100-crd=
-backlight-v2-1-31b7f2f658a3@linaro.org
>
> Landed in drm-misc-fixes.
>
> [1/2] dt-bindings: display: panel: samsung,atna45dc02: Document ATNA45DC0=
2
>       commit: 1c4a057d01f4432704c4dc8842b6e888a91d95df

And now warning in linux-next:

./Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml:2=
1:9:
[warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml:2=
3:11:
[warning] wrong indentation: expected 12 but found 10 (indentation)

Please send a fix.


Rob

