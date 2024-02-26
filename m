Return-Path: <linux-arm-msm+bounces-12544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C052286727F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 12:02:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F10C51C28841
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 11:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B064A22337;
	Mon, 26 Feb 2024 11:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NluTPxjr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C051D52B
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 11:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708945286; cv=none; b=XtQWhbKCygvzZp/0LhLdSsyHkB+/BJFKYzpWzdDGgWP+D8eeyCMFpLPLkRaGves8GkHzmubMvEpZT3EPgw2IYJUjay86YVI027l7B1vE2ieh0m9y04QYzzxH87mWINIperrhsQDdzgLHhi0WIypx8idhA8bcnbdYumxxwFNy/uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708945286; c=relaxed/simple;
	bh=A4ne5+Slg2HkJx8gwvhVVZQEIc/c+ua176d4rHlNGIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jFz9khGY1zFRv4zcrYQMQkqGSPuxLIeZuLa6V0u4iZvhylEqFQIzuencfdnUB5qPKt6XszPpU2wr7CbjgxO6vxBhhCQcMA8OreU0ONTYoxEbCXNnUPBOcue8TtdG6BRMFZMhsV2F6x2g58T1npt0rNumiA7I2DZr7oicweWU4jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NluTPxjr; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6087396e405so19126037b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 03:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708945284; x=1709550084; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9vvbj4M1K552Kyc5nJnZJSPi9kSGaKnUsSXP9LMZNY=;
        b=NluTPxjr7Lb7YKScVHGmDJJIg65/2nPDZ/2BeRI3rUtMJPZwWWZUHk+3ql28LuQl0f
         rEzHFDD141ziXePjdFzLzILROKxDpTJmALnZaNKjnq5XKe5ONLyKU4ONm89SPxK1/c0r
         mfYLM7Lzh8in6w3YzI8rcMGTATujDKBg/bZXhq4Wq8ZnjFs80u2tGXMwuFWuzPET9OGH
         sW9obMLAR7cClaaBxMMfpEpzYALoVDorZDj6qtJauKJCvSMVCDXcEUiqmQVxvf5HY6vI
         zHhcM2Wv0os7EQCu0N/3n+3XCBohYMNBeUPXyBf1nVXWRxZ9ubluXOa/XpPmBoaC4HXI
         vJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708945284; x=1709550084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o9vvbj4M1K552Kyc5nJnZJSPi9kSGaKnUsSXP9LMZNY=;
        b=Ei8Bpsm/CXpto5rxTykbhRpAh1eim2o+ML3IKxwsZ6KXDvpNa+ji33lnNgf1ZmuBfg
         lrU+B8PE+Pew7tqWtJJ5fCUgxI+m+tn2PCzH/zAK5/pmnCBc5FsEX2jakLsaaH/L9Xhl
         lg9mN69NUVtOE2WV8j74GamTP/hNUsdhiNMp+m280RkATGtwLQWjoBDTdrlySELuRCJr
         RIskz0wiFDyYUC5RQ5u37irT2AC27581SWlUHRjA1z9zha5xTRsnvWKDGRDodSpCwsEU
         UdZSqEK0rQNQ/N3/4zXuDvfwXFhqvYjkhhf8QLiq4MwhIZ7aO6u5ic3fEYx3COlCyAZ9
         hO/w==
X-Forwarded-Encrypted: i=1; AJvYcCUdHAjfETo+3T+ohycfhDdT6Vf5Y0tX1dHGPPSmqZVRdrX0n3M2BZunYfzG5mgMAcST7HQklAY8Kx1e4e0iAm6I6dIOY18Hy9i1Bp//CA==
X-Gm-Message-State: AOJu0YxJW6QCniRG9ym5p0NzbW2lQdKDwLswIJTVwlrVi0MU7zUdjTRp
	uINEbNrcFXHLQGbXnUpP75ULfVYe1zI7qQ0nHnJix/B2xi3aTRj+xwUEkiZKV61hNNdxLGU2W4B
	EzxTkjv++E5a4bUQWLHCgfo+0eV4llxjBRLiAAQ==
X-Google-Smtp-Source: AGHT+IGWyU4Q4HdX9n7xc4slBFaFWHwTYHJMp+KzDqdE1Y6SP2yHpPH7gTP9J4zbLMGsJgEkmHbIOprjDy6blCt21uI=
X-Received: by 2002:a25:b184:0:b0:dcb:df38:1c20 with SMTP id
 h4-20020a25b184000000b00dcbdf381c20mr4047405ybj.24.1708945283859; Mon, 26 Feb
 2024 03:01:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
 <20240226-fd-xml-shipped-v1-1-86bb6c3346d2@linaro.org> <CAK7LNASGcs9Y3Xr87EBQhwB3Ep_t8aYFE=nCq2Rr04krwn9Thg@mail.gmail.com>
In-Reply-To: <CAK7LNASGcs9Y3Xr87EBQhwB3Ep_t8aYFE=nCq2Rr04krwn9Thg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 26 Feb 2024 13:01:12 +0200
Message-ID: <CAA8EJpqhjXjaKKhp3HGxpwN+fLnL9tC_T1ibpK4TVmgayeaQwg@mail.gmail.com>
Subject: Re: [PATCH RFC 01/12] kbuild: create destination directory for
 _shipped handling
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Feb 2024 at 08:33, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Mon, Feb 26, 2024 at 11:11=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > The driver might decide to put the _shipped files to the subdir.
>
>
>
> Please stop this sentence.
>
> This sounds like we are not learning.
>
> https://lore.kernel.org/all/CAHk-=3DwgSEi_ZrHdqr=3D20xv+d6dr5G895CbOAi8ok=
+7-CQUN=3DfQ@mail.gmail.com/
>
>
>
>
> > In such
> > case the cmd_copy might fail because the destination directory is not
> > present. Call mkdir -p to make sure that the destination directory is
> > present.
>
>
> There is no justification for this.
>
> If you need a single generated directory
> (drivers/gpu/drm/msm/registers/, divers/gpu/drm/msm/generated/ or whateve=
r)
> that should be super simple.
>
> Why does scripts/Makefile.lib need the modification?

Could you please tell me how I should handle this?
I was looking for a way to generate
drivers/gpu/drm/msm/registers/foo.xml.h and then use it during
compilation.
In drivers/gpu/drm/msm/Makefile I added $(obj)/registers/foo.xml.h as
a dependency to the corresponding object files and then added
drivers/gpu/drm/msm/registers/foo.xml.h_shipped file.
This way Kbuild/make will attempt to call cmd_copy to generate target
file, which thanks to VPATH expansion boils down to `cat
$(srctree)/$(src)/registers/foo.xml.h_shopped >
$(obj)/registers/foo.xml.h`. However this breaks as there is no
$(obj)/registers.


> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  scripts/Makefile.lib | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index cd5b181060f1..94373eeac420 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -297,7 +297,7 @@ endef
> >  # the copy would be read-only as well, leading to an error when execut=
ing the
> >  # rule next time. Use 'cat' instead in order to generate a writable fi=
le.
> >  quiet_cmd_copy =3D COPY    $@
> > -      cmd_copy =3D cat $< > $@
> > +      cmd_copy =3D mkdir -p $(shell dirname $@) && cat $< > $@
> >
> >  $(obj)/%: $(src)/%_shipped
> >         $(call cmd,copy)


--=20
With best wishes
Dmitry

