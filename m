Return-Path: <linux-arm-msm+bounces-50369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5FFA50196
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 15:17:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A273B189506E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 14:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A69C1624D2;
	Wed,  5 Mar 2025 14:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MG7RhF0m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FACE1519BD;
	Wed,  5 Mar 2025 14:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741184259; cv=none; b=atgagzA1GyTz/fN43ixIN4VxLAXhxososHJEz1RZ0jdO5yvAiddLmD+WMsH9NqZRiC0RRwOaoYesHoUjJqLeN9oPHCQmUk5uype9pvUuj+c7DJv1peSGRtRTfLMEjCJOdbv900Vn6l+LYjgqalY/NUy0CwN/xVwcarpXYOBlJz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741184259; c=relaxed/simple;
	bh=szqbKH7W9vbz4ovkEVsJkbRnb9ADDfH2Na4Vmjiwx4g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OdhdmTvmfoD+YKI/eiuKG/HMrVtFxA9Wh/yfYbFt8pBaxQ5q5+O449yzUYfhBxOJoUuPSbjVx7s74ZtBLi/JXsB9D7o/JR1MyxKz1xzmFUL2/cOGIb/N5F6qXvUSacuXwkrHzhcObe4R3DwKcsoDhtMUObrjumy027Hd1nDvr9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MG7RhF0m; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43bcc04d4fcso12767595e9.2;
        Wed, 05 Mar 2025 06:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741184255; x=1741789055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BvAmhIp672FcTh8QydCVgJQ9OGkof1lTKDgnIKxGf1A=;
        b=MG7RhF0mrpLyoJ1UdLoHjN0rvOp0+QJWOpYybZY5QtvllNYLqxQB+LI5BTmLzEBMm5
         Jw7lbAAvdjzGrTdxXp7qLki07iLyATNsKbhdFXR0dwIHqwEfZQ0Yc1OyXv5xgRFU2ywa
         9+PpcTmURwmTw2zkCZjtLGgUzOsMqd3rZEUjhnq5AR9q/vfY60qsx9IWsSQvAHe6tiql
         1IZnkQqFJ0EiI0b/5mK4GYaGBrqRlFi/P0mZ00CjKA828tJkRyrjGlxY/V7/5jt/e5Vw
         OogZrcQGIn9bxSV8pNsX2/hhLHzzAGSgRJ4cUJ1MjPcQTWVaLTU6OlOysdUEV/SrzNe9
         gc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741184255; x=1741789055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BvAmhIp672FcTh8QydCVgJQ9OGkof1lTKDgnIKxGf1A=;
        b=YC+HIbr6WUpV9aaAkwhkJx4WRF6254jod4v4GQXyO7oDL2tS/NyMix3JfngYF8sP/v
         IXsMjm+N+HrFcqoPBpPrI0YmJUqrm/kd+hHvESoGGuswEbtR9IHUEjV9FFuAHC/3Se6O
         JiNnSja/9G+ZftngUTjBpU8IR7acbMYD7CyoJnp5NJA+y2323ZHG0xdY4cK5Fu3oThLF
         QVsAkkLf1la4l7TqPKYZq4YPo0UqEOGgjSrWtrsvclP2m6Gq5iWhMHTZT2Dd718u1a2o
         5iKjFHCOWSEUQnwP0yLkfGv2YrE1ztQ9OftgewkgS60WUidZ6RATVsaHe9J1aIa+BKdN
         bRYw==
X-Forwarded-Encrypted: i=1; AJvYcCUUCCz/alWfxNJsDOJYO2bM7FI5S4f4rt8oE0ScvTbd1R/cazAi0tguEpdCtCOb/ZNqeAUIZ1+WbaHIaH2R@vger.kernel.org, AJvYcCVOhfilVoZJnAYGzq9w6TKTmtFwwCIOaAxbXS9Hr7B1MoExbvLGE6nOMgrc7p17bbt5v2shg8nR7HLqrY6GUQ==@vger.kernel.org, AJvYcCVn9qM2u7UKWt7kz12Wt2HQk9jISMuV407lDOaLFXkyyz87ybnNiwtY5sqUl04nLSI0gQjE28ElcBcmb4rfQII=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYPX/q4nN8jcqQeAzrWeu5Cq3oCJ0+dJIHxNdtcWVYivDdRt0Y
	kqqfGJ/D0AThqcNgXsAcGauzM5J5S788NfTIVnpOzcxNaOcR/YEA
X-Gm-Gg: ASbGnctrTrxd1b/jYje6ilMTHt5QzkEBKIf8YPoVIECrZLsAtM/v+K6ZFbXdZP7oIxU
	Ydk3IRJOxvFk1NLm+gGYalWUwJtSvujso3M40If09cwhrEeWJ++DAKl0y8FR4T49Bb03M2vzP/e
	MIeVsPyMCFsMd+rsuJlo7Zon1q8rFkIVUOEgZOVA9rqiMItnY4HJrtT/pZYK3ACr/KHxlxsTxJ8
	elDRB8SLcegPPDlBsO3GIXesFqhiUSHno7nZiBx4VHT79IccN+m0+ou4+jWKbSWvruQNsSnRgE5
	2UJY1qXYSWxCEhyg8xrMu+qCN58G5hUi2QpiLItV2GzQCg/CUMKXq2bpyAr/Ui2xP3YvU5mMQya
	d9ScUCfA=
X-Google-Smtp-Source: AGHT+IHvrbtQypROMlLTHn2hwI/hJh1CATinBr60gY+FLSdoAnk3R75qGQ0/XKEyAvFG+ldQ1Dh+tA==
X-Received: by 2002:a05:600c:35d4:b0:439:9f42:c137 with SMTP id 5b1f17b1804b1-43bd298f9fbmr29484425e9.11.1741184254319;
        Wed, 05 Mar 2025 06:17:34 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd4291ffbsm18687465e9.15.2025.03.05.06.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 06:17:33 -0800 (PST)
Date: Wed, 5 Mar 2025 14:17:32 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, kernel-janitors@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Archit Taneja <architt@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jeykumar Sankaran
 <jsanka@codeaurora.org>, Jordan Crouse <jordan@cosmicpenguin.net>, Marijn
 Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>, Vinod Koul
 <vkoul@kernel.org>, cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC] Clarification for =?UTF-8?B?4oCcdW5kZWZpbmVkIGJlaGF2?=
 =?UTF-8?B?aW91cuKAnT8=?=
Message-ID: <20250305141732.26b91742@pumpkin>
In-Reply-To: <4c489b64-4c25-43e3-90d3-37f2f335d665@stanley.mountain>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
	<1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
	<13566308-9a80-e4aa-f64e-978c02b1406d@web.de>
	<54c30a69-71cf-4582-9086-50eb0d39f273@web.de>
	<k7un3bjavyt4ogscgc7jn7thfobegaguqqiy7gtypmq6vq7zox@l4bsevbsjrud>
	<29b32b0d-312d-4848-9e26-9e5e76e527a7@stanley.mountain>
	<e665514b-5a62-4afb-b267-7c320e4872af@web.de>
	<4c489b64-4c25-43e3-90d3-37f2f335d665@stanley.mountain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 5 Mar 2025 11:51:59 +0300
Dan Carpenter <dan.carpenter@linaro.org> wrote:

> On Wed, Mar 05, 2025 at 09:40:43AM +0100, Markus Elfring wrote:
> > >>> The address of a data structure member was determined before
> > >>> a corresponding null pointer check in the implementation of
> > >>> the functions =E2=80=9Cdpu_hw_pp_enable_te=E2=80=9D and =E2=80=9Cdp=
u_hw_pp_get_vsync_info=E2=80=9D.
> > >>>
> > >>> Thus avoid the risk for undefined behaviour by removing extra
> > >>> initialisations for the variable =E2=80=9Cc=E2=80=9D (also because =
it was already
> > >>> reassigned with the same value behind this pointer check). =20
> > > There is no undefined behavior here. =20
> >=20
> > Is there a need to improve the wording precision?
> >=20
> > There are words which denote a special meaning according to aspects of
> > the programming language =E2=80=9CC=E2=80=9D.
> > https://en.cppreference.com/w/c/language/behavior
> >=20
> > Dereferences of null pointers are treated in special ways. =20
>=20
> This not a dereference.  It's just pointer math.

And the 'fun' starts because NULL isn't required to use the all-zero
bit pattern.
Regardless of the bit-pattern, things like (void *)(1 - 1) are valid
NULL pointers.

Of course, while C allows this, I doubt NULL has ever been other than 0.
(It was 0 on a system I used many years ago where the O/S invalid pointer
was ~0.)

I know Clang has started warning about arithmetic on NULL.
I wonder when it is going to start warning about memset(p, 0, sz)
for anything that contains a pointer - equally invalid.

	David

