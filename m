Return-Path: <linux-arm-msm+bounces-19553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4FF8C0868
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 02:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1400B21218
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 00:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773E510F7;
	Thu,  9 May 2024 00:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Hw2WppAv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB83610E9
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 May 2024 00:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715214515; cv=none; b=V0s1eIGfcwiQmGaPAJLdW6W2Biv/ArlvqDgiPn7ZNGTCb4BoC2n9QQLV/MkvYDunfBYYbt9OBGGp2zT71sUGzck2KA7O5y8Wi2KeIXTX63dIRfEz1+sDykNiZgPttNrPRAVid8TEMKLQJOepP82dlAyoUmHE+mUlxiNvx9aJeTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715214515; c=relaxed/simple;
	bh=V7Z93WRnPd6lnnQhJgTDhVba2h0S96dv3o2cjGDZJsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l2tJ6r5RsbXOBupQv9bC7sbiPAV5DLKBeZoaGRG4aWhHBJAC11OUgxDAdrOYMgeD2eLiKCYoEWbovj/e0jXlL2uv8E5NdlEETxiyV9SoT8fFEFaWwuxsLfVfMBmnSEElm70VNPLD6ysNJq1ghjwctRyBaV2KUXNVljK7C6EDFeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Hw2WppAv; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a59a387fbc9so69407766b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 May 2024 17:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715214512; x=1715819312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNeX2fBf0OvUGSKCQhqRKM/UWS2VcuqiFL3hMwMX2kY=;
        b=Hw2WppAvAElB5auPR67X89SOWR20YKL8Z5N8Sa/QO6L6DZFAoYHb71ZRiN5p5EprYg
         aDhqT5v/zcMAaML70Yi+f3pYdDpRuwNMR5yYl69SFqxKzbDrOlPAlc18EuDLsw1o37Ls
         xrCtzqMysYM3EnWJta2HQ7M6A7M7LaAE7eLgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715214512; x=1715819312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNeX2fBf0OvUGSKCQhqRKM/UWS2VcuqiFL3hMwMX2kY=;
        b=KDXzXc1X9fl4ft++hAWa7nJRxOfmWPHonKaghJWZm+10d8w84HqfeJfeRG7oedTrtR
         34xiYhv8ViBn7Xg8I/lDvE4vUFA/jFvR0gJ7KYsaWH4wNMp5Af6c8nrks6GCi09zZ4jb
         +rFEmHtasiKy7NGSS9JHz9sMuRe3V8fwKhBLt/gVzkFhsvoNcBYFS8O/bOVW4EeMnyoE
         8Qxmej9N9ERzEExBYW9knE2g7DH/Dy5ROKIsVyTqu5yGaL/ksfEZnaRkCTqFjub3CRLf
         4mGVl1Zn4xJlaQl559cqbUbBQ/5UDQ4VGNqktXpVn4CSm7ewZS+0U5YggAdbj884/R8O
         /TLw==
X-Forwarded-Encrypted: i=1; AJvYcCXshLUV1HdV2ANFDts7ahmq5q/ynFSdCgict5a5lhcfj8Hs1xdQ4QOiFHouHIKpKgJbQGHvPl+uL0S8EW/AbOdmBjTjn5d0aRQB19Bq3g==
X-Gm-Message-State: AOJu0Yx1DkM9dwFdJT63kS/O6G6Hpys2tXYxx6/Pls6ZXoVg9L3/usqc
	hhRcBnhL3hFrHa7XCakf2DcElzlvssi8E/MEeky1CKFtTjx4RBLaLerC7VSjGadwAhHoG8Y5AcL
	k+dTk
X-Google-Smtp-Source: AGHT+IEhPbJKzpNdtONofILRXyTrcZWjwc2xfUqfnTxOFPraPZgX3bZqxGWZs9q/JAxE9bwwhw6acQ==
X-Received: by 2002:a17:906:3284:b0:a5a:1257:bb3c with SMTP id a640c23a62f3a-a5a1257bc11mr57098866b.7.1715214512066;
        Wed, 08 May 2024 17:28:32 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781cfb2sm15633566b.24.2024.05.08.17.28.31
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 17:28:32 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-41a428374b9so17805e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 May 2024 17:28:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWl6dYancEguDd+VR2325pTTubBnNbqPaIUfVqiX4S1wcKry1rO5Phm7Oap1TWjqC/H14XKdf2dOfD4+AE6izpQ6cOEYvEL5xzCUG5orQ==
X-Received: by 2002:a05:600c:35d1:b0:41f:a15d:2228 with SMTP id
 5b1f17b1804b1-41fc26b9f66mr933245e9.0.1715214511425; Wed, 08 May 2024
 17:28:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507230440.3384949-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240507230440.3384949-1-quic_abhinavk@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 8 May 2024 17:28:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xa6LJEWZwdUXvFVPQ0-qnDZroDi6tkZaLFHiarJ2gyew@mail.gmail.com>
Message-ID: <CAD=FV=Xa6LJEWZwdUXvFVPQ0-qnDZroDi6tkZaLFHiarJ2gyew@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: remove python 3.9 dependency for compiling msm
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 7, 2024 at 4:05=E2=80=AFPM Abhinav Kumar <quic_abhinavk@quicinc=
.com> wrote:
>
> Since commit 5acf49119630 ("drm/msm: import gen_header.py script from Mes=
a"),
> compilation is broken on machines having python versions older than 3.9
> due to dependency on argparse.BooleanOptionalAction.
>
> Switch to use simple bool for the validate flag to remove the dependency.
>
> Fixes: 5acf49119630 ("drm/msm: import gen_header.py script from Mesa")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/registers/gen_header.py | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

No idea if we're supposed to allow python as a build dependency. That
being said, I can confirm that this fixes the problem for me since I
ran into it too [1].

Tested-by: Douglas Anderson <dianders@chromium.org>

[1] https://lore.kernel.org/r/CAD=3DFV=3DXnpS-=3DCookKxzFM8og9WCSEMxfESmfTY=
H811438qg4ng@mail.gmail.com

