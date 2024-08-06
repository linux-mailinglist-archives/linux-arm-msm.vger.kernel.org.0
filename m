Return-Path: <linux-arm-msm+bounces-28014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 534D1949721
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 19:52:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D816283345
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 17:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F289E770E8;
	Tue,  6 Aug 2024 17:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hyOSwXl5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668ED74402
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Aug 2024 17:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722966762; cv=none; b=Lvprt28gBetNMZkxtkhyQNUKRf/XquOx7p5CFdiD689tiHhj+WM62HsI4jSGwU5ERz4iHE2sLZbj+Y3aosG8ToqFCYKa6sXjY8n+2XgPQA1FhbwA/xzducs6H6+2HIfj/2wpyox8qb8W7Pz37eqigM/V7byW0fSNOIaF9dbyWX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722966762; c=relaxed/simple;
	bh=6sEhV/UwJzHAc0B/xdv8Aikpej2a67uW84ZZ1V4NXJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nM7PFg1ukxwP7dvUVWrb0hJc7HjLUj3o/1l7aJisNqmmOvyfWjwOAP/jDbjeTYegpl+olKi68XTaA42TKhdCtyTKDcwvIkHGNqjNJgPI9s7AP3T/P06ca6j56aygRax+B9iqHFZvoBGgH9TM5RhPKQ5yygZGpqw++fJjiiFRKyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hyOSwXl5; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6b79fc76d03so5379846d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Aug 2024 10:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722966758; x=1723571558; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5W2l2GkWTnRzvV1UUGjKmQpo2CkW6GJdcOBrie/UAMQ=;
        b=hyOSwXl5TLqVMYYqejrutY6LSAjPENNbX/QDS6+QPqcKBpZZTTZ2UiRCTuPyXsMJrT
         uO7F89nfW5PQ0q3B/MqUrJGdIvowvyhsu4q/fW+FSUs8bVLR3HgzIGZe8gKv338+W/5R
         1x67n+9hKS7/jERCD6pk3bdnxwStoqNql/cjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722966758; x=1723571558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5W2l2GkWTnRzvV1UUGjKmQpo2CkW6GJdcOBrie/UAMQ=;
        b=LPShmG9TpF9rZLzYxec2gAS2Y/Rm2aKKF8A/X3czhGTsRpV0T6TU+s/Naqa3/LRVyh
         /zMu4SrJm9bzjNJaaLJqn+M289EUUQmHF7Y/6qKdj9jEu/J4iPmYOox7/pOmYs1dyXc6
         5KE9QL7fqV+boc36BK6/UGqNSEkQAF/J/QemnqhKHUEe0n4H07QcNhxL+n0K/0HnWl+C
         EPMFrfrAUHvXfjr18npXvPn6BPwijrUziuCkhOjj2L6Tis54YwHTWYbvF3rnm+Eg/PxB
         Lg04aKUNLZXiy+fjZcbyzYEHsw15waoA1pZC7OKYltgVui4IlFo7UI5cwyo1AZGvQn48
         wvDA==
X-Gm-Message-State: AOJu0Yy0NqLZrP3J48gi2ExX2d8Jc2jWdnFhGyiXMVVNcWuZj/u9zyRc
	nArvE9O74MVlXp4ea1liG1xK/spqytFNz1p2ZaqW1VVzERp447fgStD9fdmEQ6AF02LeQ1PPFTE
	WLS5Z
X-Google-Smtp-Source: AGHT+IHY9G0D/e0ILGcbnVpcMaAnj0skKGbQ0/rV2xa1MOI0g2UsLPNTO4iSJD1YfXssSbfLuNM6+Q==
X-Received: by 2002:ad4:430c:0:b0:6bb:b478:a614 with SMTP id 6a1803df08f44-6bbb478a631mr24761416d6.10.1722966758507;
        Tue, 06 Aug 2024 10:52:38 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com. [209.85.160.175])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c8778e1sm48683756d6.128.2024.08.06.10.52.37
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 10:52:37 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-44fdc70e695so580771cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Aug 2024 10:52:37 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa6:b0:444:dc22:fb1d with SMTP id
 d75a77b69052e-451c59c3f0bmr133271cf.12.1722966756828; Tue, 06 Aug 2024
 10:52:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729205726.7923-1-robdclark@gmail.com> <CAD=FV=Wo2nVzn6qvwSAFAnrFX4wtv6_ZCVZaL1K_DBBFg9DJ=w@mail.gmail.com>
In-Reply-To: <CAD=FV=Wo2nVzn6qvwSAFAnrFX4wtv6_ZCVZaL1K_DBBFg9DJ=w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 6 Aug 2024 10:52:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XMJ7b=2tt6_2oTGFXuL8XcmBxuDtQBoWdf_65YyS49XA@mail.gmail.com>
Message-ID: <CAD=FV=XMJ7b=2tt6_2oTGFXuL8XcmBxuDtQBoWdf_65YyS49XA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: samsung,atna45dc02:
 Document ATNA45DC02
To: Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Rob Clark <robdclark@chromium.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 31, 2024 at 4:39=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Mon, Jul 29, 2024 at 1:57=E2=80=AFPM Rob Clark <robdclark@gmail.com> w=
rote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The Samsung ATNA45DC02 panel is an AMOLED eDP panel, similar to the
> > existing ATNA45AF01 and ATNA33XC20 panel but with a higher resolution.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  .../bindings/display/panel/samsung,atna33xc20.yaml       | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I'll plan to land this in drm-misc-fixes next week unless someone
> objects. "fixes" instead of "next" for the same reasons discussed
> previously [1] that the dts patch should probably be considered a fix
> and there's a chance that the dts patch could land in an earlier
> version of mainline than the bindings unless we consider the bindings
> a fix.
>
> [1] https://patchwork.freedesktop.org/patch/msgid/20240715-x1e80100-crd-b=
acklight-v2-1-31b7f2f658a3@linaro.org

Landed in drm-misc-fixes.

[1/2] dt-bindings: display: panel: samsung,atna45dc02: Document ATNA45DC02
      commit: 1c4a057d01f4432704c4dc8842b6e888a91d95df

-Doug

