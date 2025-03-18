Return-Path: <linux-arm-msm+bounces-51691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E86A66F11
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 09:53:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C3C33A84FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 08:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE762045A1;
	Tue, 18 Mar 2025 08:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mX+2bnAV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7F51A3056;
	Tue, 18 Mar 2025 08:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742287957; cv=none; b=FNy/xbAJmi2BVkkgc+Lh3baPTr4vGxHTOZHbXs0BAGbnHMjL/3dVopE3PbSJ/Z2ev7BrnBh5zV4o/EWxu+mdfgFGjNAkx5vcdAeZdnWQEzW368h/aWbrMf3QfoB5xivO+WdyiG2OXKTyTN1Izmn/U2XS9DNruIahxP5LjWcFp84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742287957; c=relaxed/simple;
	bh=Nekzz6fBfS4uQY6xszVTs6sj5myK1wR2V9j2ijLK7eY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oHkLOfhC8/BcAenjy6Kg2cl7gZSBox96t/jna7Enf2CPxHqptNVuxPs9PcfGdlugEQ2a2OJULKxHsuieBlA69OUplRHa5UDZ57QRC/U2+kqt9EcZ18gWwEaEZTU4aI4arMnKbuRdy0C4L5RBYM7K+/dBNO5s0E+A+nxYMnWACZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mX+2bnAV; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ff69365e1dso3551226a91.3;
        Tue, 18 Mar 2025 01:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742287955; x=1742892755; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nekzz6fBfS4uQY6xszVTs6sj5myK1wR2V9j2ijLK7eY=;
        b=mX+2bnAVfrb24PXJzlqW7O55Hku7bGKxLp4zplWiI6DugjRUlK/BOqPubPsBBNBZaK
         wDT0KFD/iNg+FLsErBvPCVgPM2RwTivp6teX7L9ySki5uuHWpdlZbMsIfSLtITZMrUxK
         eFoe5/NA0BBf16sOSEx832kVgbf4z3IImA7jpIE+Lo5kfFI+dZT2coj/XJufwnkXccZW
         ahbwG6vWl4SN54Wq8Ys8tH6HLiYEbWyvIAfJlgjn3oTrNU2QdPaQ0/tfSQDuQxjWS87o
         wuVW/Bo6+X5YcFE3oo767B0vYsvf0i3PlEqRvjeYTXBpb2ZSn5iYEqwkaPVt/CE1BHaH
         ffFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742287955; x=1742892755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nekzz6fBfS4uQY6xszVTs6sj5myK1wR2V9j2ijLK7eY=;
        b=bSD9PfGXiLY3Q/WwW10vuOWf50e8akTdKRiuW9kXsWVERELSPuqa1h3miDqeRQFfIP
         YwtxJdLMkInFkEgEmzDVwhq+HGQA7gfCf1G2XoNR92HTzqWUUGwgz/Tdj3HmVQWC/jzj
         1Kv2HklBx24wAgqYRk32wvK6yozUlIxl4cYGo+tTkkoSTn4M57h0UvBU/nAh825wxIdb
         zsD2EV5B4aSVskaacWHEiRhsh3yL9GT2tmG6bMpy7JvmRuL8TNqnIHc5nZ15gRl7OKqJ
         lF0eYNUxT0oO//y/bl4FxfSJsGgPl5iC81szj6JGO2QkH4TAFU+0sXOiPXY/WK3iOonk
         75yQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/COGkzyhh4ubvOzDoLv/4PjK9TDYQifPSLAXvjHYltxk0jbpeDvlv0+Ot9bObcig0sSP833oSvsopu10X@vger.kernel.org, AJvYcCVhQmGxOKiXLydfkHQ+CD7FWjC/2ESJZZ7jczm+AcZBltwRUwyqzl1gWuNC7BbWaXvkCRYQVXfAuFk52ERvUg==@vger.kernel.org, AJvYcCWx86laTXdxIyagM1e4l5OzAj5su5B8JFShB7VYJfFcEnN8C5/ZCkJIYLz16rPf7Cu6iWqLaq76p5E4TaHoEmYhqQ==@vger.kernel.org, AJvYcCX0DpSzgMUI1lFCwLfA4wXeiKQNCbxGNCCSOLrDwlItcUVkBTKbGv7jn3QVoqCVEpuQ7q6kstv+9dqp@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8bwchwrsDI3NDCE3QCMw0Yz7QIujCuUiYF4fUMOUUhMBIeO/J
	rbHV3/ifuXBGzWNT1ipvcLSiKpux2e6ErZHjdSlHuoKvNzZtlJTtHN4FpFvsidEKpvG9qpzQmOh
	9z+wkb8NHuGIfJzsJAITPv1HM35lmhMSYx795kQ==
X-Gm-Gg: ASbGnctClB6QlClEHgj4OWKyZTZHV8iZqUM6NyWc7N6/O9IzfxMoUuQYk7NLSQmmFIx
	xYKDpYWzRXmAR7sduSdg64O9w5Kl9KyeGmF1L9to4TRqSixD97jY0M6S/hM8ejUlCO744E4rLw2
	0kNenSkRfkVTGH/nJBnHn9D5zIxvqZaGJIAg==
X-Google-Smtp-Source: AGHT+IHxBtGTYr3jKDOjfudNcmvMSpsoyb/R4JeFGP2QOzJVyaFM9HhxQUDogb4lJVnRc6RbdFlWwMuZrsbX9LPrL68=
X-Received: by 2002:a17:90b:1e49:b0:2ee:e518:c1d8 with SMTP id
 98e67ed59e1d1-301a5bc1823mr1936322a91.30.1742287955176; Tue, 18 Mar 2025
 01:52:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317232426.952188-1-robh@kernel.org> <20250317232426.952188-2-robh@kernel.org>
In-Reply-To: <20250317232426.952188-2-robh@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 18 Mar 2025 10:54:07 +0200
X-Gm-Features: AQ5f1JqTpuM0NFbEd9b70zQbznVEgiaQyEKWqlPuOjeLEzVp-2Bgl4hMPBt9TEI
Message-ID: <CAEnQRZAwd-e=j2bfHimx9xjQU-2=Anr7fJ_w98t3TAweZY4J8w@mail.gmail.com>
Subject: Re: [PATCH 1/3] of: reserved_mem: Add functions to parse "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 1:24=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> Drivers with "memory-region" properties currently have to do their own
> parsing of "memory-region" properties. The result is all the drivers
> have similar patterns of a call to parse "memory-region" and then get
> the region's address and size. As this is a standard property, it should
> have common functions for drivers to use. Add new functions to count the
> number of regions and retrieve the region's address as a resource.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

