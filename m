Return-Path: <linux-arm-msm+bounces-84261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C0112CA0E5E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 19:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4B5353002162
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 18:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2796A314B82;
	Wed,  3 Dec 2025 18:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hbynybon"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507C13126C9
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 18:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764786006; cv=none; b=LdelA02/ryxszcfFNU9ji92OumHhKbIT+c51GOd20vERoAqckOS/NAMg45lsMqpOxd/0BbjjGVl7rNL6tCTDjcHuinsnw2bLxo/LpUj0s03AfvHe9bYhY/svZgjpo75rIqiXrMqeZ9z/6lWT2lcXLyv1cjS59xuX3L65Q1JUA+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764786006; c=relaxed/simple;
	bh=gZLo/pw6ELEWxXotAkEYCzae/7KZ4lYv7TwhnYNDLq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rXjNdQti533fRso1C3/sqgeZFIJ+6H2UjNMV+aW7G6Zu1VGcOhAZkQCCWH+cbXgruf9smWaM4lTwS/c3mf+oioX+MI9atmIXV6I34DMSTW6GlE4fzxWWNzddAManvHon26VXYypBQACmPluE4lW717BA9iNtm5r9rmzL5U8dadM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hbynybon; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-640ca678745so7730a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 10:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764785998; x=1765390798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o99uhCORWh/UFDqgDvKdfjHOH8a6cDuqoxB8tGN+bLc=;
        b=hbynybonpsio42ritMmWQA9rLjgwLiIMXAYHAHOH5QnvELTe8HD0TxLQj29w44XMnY
         G/qzI8eVnXftu823GFYUNIyiesZ5hXphIqe8miJhW5xdrjzwcEUPXUBUJfUx7cKW9oXP
         vkmU6oQD1nkxCsYJcD/y8ap/NaFpt0O5WlroY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764785998; x=1765390798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o99uhCORWh/UFDqgDvKdfjHOH8a6cDuqoxB8tGN+bLc=;
        b=giTSIpQ66hlYxDm+SwuD8AD3w778+fTr8N3mxbVUc2jjTrhBsDa23HIm0zkh+Ekh+L
         M8Btd99y4CIn5bdd9XQzBb4OfpWZd8zmwzWtQSU37bHzh2GUIvtVUimKYBhtED2QV7Bc
         Q7hbSMf7/cAoOiPdD4yaQafgigAkk+uUkgmmdvc8xR9JtetMmB6/CUMTjwynEQ6SgkHa
         0nKcZoZ2M7nax9k5lkCuWhkQeSqIN8cCA9euS2pWJ8kiXN7xFONa/k1ozN1O6ZOGoc8k
         US3NuEjog5Gd8OaRDtiKLtAA0OGNcArWQOvChmq7gS2rK2LLDzIuQuir6KpquYyngwqx
         APTg==
X-Forwarded-Encrypted: i=1; AJvYcCX4pNa+yQswZWurwtvMu9JM1hS6cUaCFEdJJ5suUmYwY/mJZpko6dWcu1s+XQq81KikZ0DNcTERZCNXzMS0@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ5TudgI5zANiotINYLr0sSAhXcs21Y493IES3gYSHvFYYZDRe
	BzWP8xZ5DIBTBiDJe3e9Ck0l0hdE06JzM6kJH+ly2+Q5mmu3iuQZFlA6n9kd768lHkh9lLsdM8d
	FQKVSj5eb
X-Gm-Gg: ASbGnctuyUTwIH938u3tt+ADrVTj0VT2IXXukDa18sMZUdb0lRtz858kw5hI+ejG6m8
	rUf9NazcZekv5l4DB1aQwzntIywMTtQkFLQf8VMPfXCVK9qTmqc5a0JHgj+LPfczFG9R8+SW2u/
	F8hjAz4axUjzYjrUvJY3DwlcKp2PRAM4Ika3nD27nnGSz6EYRtExdbce/wjOd1C5FgNKNTBR7Zn
	M+em0swNByhBgwBt06WLEfI+d6KxfxAYPGnj1v5T6Ih8KpuXkDUlwxezuPUZo5NW/RDYQl4VNlK
	cSd6eGn8aoitZng04VjrN7+t9Kb4vgRJ/S8fpLWmJXSHgou/Ois2GRSJ00yUIBu30oHuBCH+L85
	z2nqHZWALz2TTPwFZirZxiUlQTAde0rACpNAtGPy8uA38XRisebh1ruQQfkQpMHyXjfl232ZvhH
	PGMF7FIXl36YlLMp+0empCV2yik6Se5hHcEoEpDIUb3yX4WxCQ0229WfK3EjMt
X-Google-Smtp-Source: AGHT+IE0CXUXciubM+fQA/eiuEDt7CDgX6nzJsOPxgV0uaIA2pwPQY/XE2GNxHEZoYlCxb1CIrQnGQ==
X-Received: by 2002:a05:6402:34cb:b0:640:c460:8a90 with SMTP id 4fb4d7f45d1cf-6479c4704ecmr2801441a12.12.1764785998086;
        Wed, 03 Dec 2025 10:19:58 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647a617f30esm402835a12.31.2025.12.03.10.19.56
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 10:19:57 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42e2ddb8a13so55611f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 10:19:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXZIsRq82DvffJEJGB9MGP2iEP1u5wxCeVAY5tSyvwWMs4ygwusU4q1PRtxH5XwrLJhGzF2K33fRTf58lO4@vger.kernel.org
X-Received: by 2002:a05:6000:2503:b0:42b:3bfc:d5cb with SMTP id
 ffacd0b85a97d-42f731d0475mr3346216f8f.51.1764785995967; Wed, 03 Dec 2025
 10:19:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203074555.690613-1-alexey.klimov@linaro.org>
In-Reply-To: <20251203074555.690613-1-alexey.klimov@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 3 Dec 2025 10:19:44 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wv7cBmLkVS688HOwemDvzyvjVDjXj=pfdrgjYpA0GtSw@mail.gmail.com>
X-Gm-Features: AWmQ_bky44Z4LDCK7KCL0i5nEFoSAhZRvLedqlkONzgJXUwW3vMGse6NdNy_cbA
Message-ID: <CAD=FV=Wv7cBmLkVS688HOwemDvzyvjVDjXj=pfdrgjYpA0GtSw@mail.gmail.com>
Subject: Re: [PATCH] gpu/panel-edp: add AUO panel entry for B140HAN06.4
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: neil.armstrong@linaro.org, jesszhan0024@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	vkoul@kernel.org, andersson@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 2, 2025 at 11:46=E2=80=AFPM Alexey Klimov <alexey.klimov@linaro=
.org> wrote:
>
> Add an eDP panel entry for AUO B140HAN06.4 that is also used in
> some variants of Lenovo Flex 5G with Qcom SC8180 SoC.
>
> The raw edid of the panel is:
>
> 00 ff ff ff ff ff ff 00 06 af 3d 64 00 00 00 00
> 2b 1d 01 04 a5 1f 11 78 03 b8 1a a6 54 4a 9b 26
> 0e 52 55 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 14 37 80 b8 70 38 24 40 10 10
> 3e 00 35 ae 10 00 00 18 10 2c 80 b8 70 38 24 40
> 10 10 3e 00 35 ae 10 00 00 18 00 00 00 fe 00 41
> 55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
> 00 42 31 34 30 48 41 4e 30 36 2e 34 20 0a 00 eb
>
> I do not have access to the datasheet and but it is tested on above
> mentioned laptop for a few weeks and seems to work just fine with
> timing info of similar panels.
>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] gpu/panel-edp: add AUO panel entry for B140HAN06.4
      commit: 2976aeb0de77da599ad37691963efbdcb07435ce

