Return-Path: <linux-arm-msm+bounces-22456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C93890588B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 18:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83D5BB20AE2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 16:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38FB622F0A;
	Wed, 12 Jun 2024 16:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TVfDJhjR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15501EF12
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 16:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718208929; cv=none; b=sy1j9Kwl5EqUYMg/BCLjVSdD/Xsme8+OTiGWlXS8khoXDqIswKG9XD6foXKB7K46yzy+qSNhCZ75IelD83Wne96LvsLV/VQdhYscG9wCPn7KzPwysxFPlUBkAhR+kZBQiUpWkT5ZfUY8r5BsRDBCITgPMNkeDfK6uQ8W3PM1NVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718208929; c=relaxed/simple;
	bh=5cmFbegrmXFBHS4WW8ziIwGksQiKssUPXoQUtXM6F24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tH87rrBqrZ85WCjez1c8qYfHIDktJ/RykscIIxHTYs3Nm3UGNFTqKZFeuGjjHTnPlfgIrENtCf/S0K/Lc2m6vP/yJeoigKuytpibWTpKTQNLxYk/myZzZtZRHbh+PE6wjTJjiGh7cpF3gyvJX0BmsASUsD7i7uIfoX2z/xWk+kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TVfDJhjR; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-62f3ccc877eso8282997b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 09:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208927; x=1718813727; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cmFbegrmXFBHS4WW8ziIwGksQiKssUPXoQUtXM6F24=;
        b=TVfDJhjRFIG31EjhityqLqrplLVj2w0OrUk6DLEMCxcCj77BrZRwjC/NU0/k7A+B22
         2NH8mZCr2uC6Plx0W3R4axFfvJPAzYEKUSmZOo2n00SELZ3eU1z47vcGV6a3vA/V1mXz
         00Y6ZlnaMffhVyJ3NvOCS3XxJDjNToY3c8gpRPL66kIa2ZH1GLLZKiNt/rAYDSfBiKo6
         wumjOQ4qa9lR4FXyJ6d41iAmwfAnjgMdGAz4Lq4EsCyAAY3rE1bRnv0rcQlt01Ir9aE/
         Xv5TWhgAEEg/HywnDvhRfSq2RmJLSiuzWga8lqOy4se8/D8ZrW7naiSHQXD7VUfxDZ9E
         Ae2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208927; x=1718813727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5cmFbegrmXFBHS4WW8ziIwGksQiKssUPXoQUtXM6F24=;
        b=oMHq3xNrDqyWWHjzto8NgzBhY6rsmkgaHAh8y1JtkO6PasjquBflnSzD9HEZ5eykF3
         hSagL/+U54iC0AWNSnAR/1bOQuB0JsxREDmbF3CQySf3UAKTt/JYBnReeJ3E5hDXvvX0
         h/ZOqb3X733LQxhMhB36q8QhZ6Wl+KRMxMMZHlpaZcG0BOhlZ6qLGQlOQtouc5WiVQSc
         6CYCTHYVXs4iLQE3ksDLNc5Bpy2HjhbF+sHKn9znfem79BJoy75nC2l1Fqs2R5Rd3UdT
         /WyhHMZXbqvPY4d85keiRUOoKwcyOCGZD1CC4ID+99AfPtWWceqrESI6pxQHcEjWB1Q0
         nErw==
X-Forwarded-Encrypted: i=1; AJvYcCUSxu3MSk2RSTLUFN7uKKo+9+pBVQEX98pIihSLM6Qjharpkfgff3JVRlk5Nt50FPYi1PvYuZTJU/5TiLB5fsAAdTTr0DtqDCV/3l2K+Q==
X-Gm-Message-State: AOJu0Yxt1/ZZgSRIUa3AoxS8ofExTZir8+fwavz+gfdyxxx1pSyYJWqn
	Dlnv5Trp0QFIcJ13R02RneSICIECFJxeBzSviTMBajzuxcOSAbprdK57hxCCZw3NdJ/Zt8K53Z2
	LcKjz1VR6+H+ZmwQJ2cDVgy0m60P0+mrewX3QUg==
X-Google-Smtp-Source: AGHT+IEyUjk336q5wze0GKQr7UwMqrUsrkoBVG2K5Qz2pv15hllZ/Fn+1uT5B958G0aEQ/a+dPl8Ea9AwDS4xrJVWhE=
X-Received: by 2002:a81:4806:0:b0:61b:f6f:eab with SMTP id 00721157ae682-630bc30a68cmr838027b3.2.1718208926557;
 Wed, 12 Jun 2024 09:15:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240522-fd-hdmi-hpd-v2-13-c30bdb7c5c7e@linaro.org>
 <deaa2a50-9e16-4f23-8c13-34947ba4e4e0@web.de> <CAA8EJppn_mVzmd==-bs8je8VjXrNrWu0hNXWAGuP+TP3DARReg@mail.gmail.com>
 <1cb42d85-2eb6-4544-b4ea-8a75416cd287@web.de>
In-Reply-To: <1cb42d85-2eb6-4544-b4ea-8a75416cd287@web.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 12 Jun 2024 19:15:15 +0300
Message-ID: <CAA8EJppXQ4sMsm+VXnJdjYa1g_U8_LKwRL_u86DsF6Up4rnaqg@mail.gmail.com>
Subject: Re: [v2 13/14] drm/msm/hdmi: ensure that HDMI is one if HPD is requested
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, LKML <linux-kernel@vger.kernel.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 12 Jun 2024 at 17:32, Markus Elfring <Markus.Elfring@web.de> wrote:
>
> >> Would you become interested to apply a statement like =E2=80=9Cguard(m=
utex)(&hdmi->state_mutex);=E2=80=9D?
> >> https://elixir.bootlin.com/linux/v6.10-rc3/source/include/linux/mutex.=
h#L196
> >
> > I am not.
>
> Under which circumstances will development interests grow for scope-based=
 resource management?
> https://elixir.bootlin.com/linux/v6.10-rc3/source/include/linux/cleanup.h=
#L124

I consider guard() and free() to be counterintuitive, harder to follow
and semantically troublesome.

--=20
With best wishes
Dmitry

