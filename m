Return-Path: <linux-arm-msm+bounces-52093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32306A6A82F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 15:16:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD8F21889EFC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 14:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C9C224236;
	Thu, 20 Mar 2025 14:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f+//xFNG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2C0224224
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 14:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742479818; cv=none; b=ZKw6Ex+rXFKHfQLV62Yyw/moloLwAeCojaQ2MgOOqQ5lMlg+6QiSRFr9KX9NPyjwaLgKsl980ETwC6eS1Jdr7owm/+3a0KFOdNDS696UtmQcf57rw2BlY0KZrtHWMR3uPe0WWMu72xlZpztQ5IKgX5UPwOJOHKu2y5PnL9kiysU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742479818; c=relaxed/simple;
	bh=s9l2NK29FWKMvXALTznvduzAySe6UJPpHquolLsiQd4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YD6+cZ7Jf1K440P5jf08CfHv45t/6JhhY/TN6yNlbag6JB4uo+ZbmDZRyeqGFOOVhgJGAakTvPHbI9pmzI1nUx7DO50PLQ7urlG973MoeYWaptdSkxiqL7sY8wP1Gzw5ufgrkRJt3IPzpLwxvT4mt3P1EyBNZb4LahiCCdPvC2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=f+//xFNG; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5497590ffbbso969789e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 07:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742479813; x=1743084613; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9l2NK29FWKMvXALTznvduzAySe6UJPpHquolLsiQd4=;
        b=f+//xFNGGZvxwxj+Vv383dFinOad8cYAxDRm2hYWi9ZpiYh5IcwqheYJu+jwyDvaQD
         ue7jTqQG0doCfezleeJzCE56D/D4eNgXs1vy8qg8YwivgN/EdjQ1T65XPtvJ3bmALPLn
         NBmEHKeGt8VKue9m3UTIxwalqA+Xozx5KPDec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742479813; x=1743084613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9l2NK29FWKMvXALTznvduzAySe6UJPpHquolLsiQd4=;
        b=NTQSfw4SWt/mA0T/EWsgvyjzBk1tXLzAoItlYNklDzcuHrndSND02nkz199JE4PB3v
         QQx9SfC3SQr1xJjn+s2pdu++8pviB+LVwGDBJm2ulR1IQDzhyGzvyTegR4eYrkNSakJc
         1q8HDkv/shV6TN+P0FsHwntElxLyDWxOtRQl6c94DxnZ3ySa5q3+yvLKdSSsI+CI2VJR
         B00n7ETsQ0Do/F+kmZ4OFvbgbAjkGzviWXltKvGmUKb7qxwA+hIKzaWnYOIcTdkM/ql0
         jS7i7ezaaaTeIPpjgK8e3jO1HDyV5liYo+9e8Lr7mzbhE/l7jeg1c47OiLrRBOgfpypm
         nKpw==
X-Forwarded-Encrypted: i=1; AJvYcCV+aBUubPBt3CMhlBhRIxgtC3z9yvK8coTYEpULcWfFeDafrnWT5ERmMkmIVSro+HYL/iQISyBmMReXo+cY@vger.kernel.org
X-Gm-Message-State: AOJu0YzhZNZTJxhQwi0Zl/77rgwVUrUk7fs7lidgfhIhGeM9yW2DR1EY
	wLHgYJEyWCV53SawI0UAexW4nM5DPqM1NIhlcCLv43fIqimZ+mC1QVIl+GQyXOQaU2EbDr9vDjm
	H3A==
X-Gm-Gg: ASbGncvLCqEUD6T/LHKsDf68rCHbdJTvg1iDf/Bp6xyZN/H5chOW+SXX9waYxNZN/0U
	eiuZJIxH5CasEgne9PUXV+Mnr32UbciUe7PFvMboIArslsHXjC+q/JQTF54FUlqWvr2/QLQSLiI
	QZnZsLv8uhqpSU9CJFzQI82vGf7yI3UuxwwAOi2XVCQ1F1KUD474kf1l3gjlfIxyBXcjEKYqFHB
	aRgqA/Er5rTx7ykLMBJHGj7kPfmUyg5YmejukWRhCYGeYriFJZ9JeBqo9yZ2DMaEJY8kBjQ0fiZ
	nOUbI25KCZ1Im2np1WunG3w7KQ9WMY18xcU1kz4fRG7CAjtlz+LIfnMygNsOP/icKhKNhFuSj5l
	RE0eeNOgu
X-Google-Smtp-Source: AGHT+IFvnCuMjKfsbZMOTSMFxSmUjYr5J+inZFbFJxPm5O1+AyBO5JQXQMwvztNXj/hgDDddogBbuQ==
X-Received: by 2002:a05:6512:2255:b0:549:4416:df02 with SMTP id 2adb3069b0e04-54ad0678646mr1192165e87.41.1742479813081;
        Thu, 20 Mar 2025 07:10:13 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d6b32979bsm5268541fa.83.2025.03.20.07.10.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 07:10:12 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5497590ffbbso969718e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 07:10:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVGLeMjnQ5gqCRt3/2tDwtJhmsDPD9VmCqVd9M2ZtVqHXtxvMGFdCLnSdZhhPbhdlGk132s+fyh/ZfJHYOx@vger.kernel.org
X-Received: by 2002:a05:6512:1312:b0:549:4f0e:8e28 with SMTP id
 2adb3069b0e04-54ad062b20dmr1419150e87.15.1742479811664; Thu, 20 Mar 2025
 07:10:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320-wip-obbardc-qcom-t14s-oled-panel-v1-1-05bc4bdcd82a@linaro.org>
 <zgzivcjcygbi272q3dmkff767cb45uoffwtx37ij23pi2g5ubi@j5bxjdbgqaqz>
In-Reply-To: <zgzivcjcygbi272q3dmkff767cb45uoffwtx37ij23pi2g5ubi@j5bxjdbgqaqz>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 20 Mar 2025 07:10:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xn2cEKQ+Uj5Okemo4_RJ-1uJ_SQ5X5TycJs5bYdNpcBQ@mail.gmail.com>
X-Gm-Features: AQ5f1JqCwIwBUwu1Y1sQAJLBekmg4FIUOmSSxOrj8jLfvkFWDtf9gs7NC20D47E
Message-ID: <CAD=FV=Xn2cEKQ+Uj5Okemo4_RJ-1uJ_SQ5X5TycJs5bYdNpcBQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add panel used by T14s Gen6 Snapdragon (OLED)
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Christopher Obbard <christopher.obbard@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 20, 2025 at 6:47=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Mar 20, 2025 at 12:47:09PM +0000, Christopher Obbard wrote:
> > The Lenovo Thinkpad T14s Gen6 Snapdragon OLED model has a Samsung
> > panel. The kernel currently prints a warning due to not having the
> > correct timings.
> >
> > This panel appears to work with the default conservative timings,
> > so add the OLED panel to the list of supported panels with default
> > timings.
>
> Are you sure that this panel can be handled by panel-edp.c correctly and
> it doesn't require a workaround implemented in
> panel-samsung-atna33xc20.c?

Yeah, I'd agree with Dmitry here. To the last person who wanted to add
a Samsung OLED panel, I replied [1]

It's much more likely that this should use the
`panel-samsung-atna33xc20.c` driver, which gets the timings more
correct for Samsung OLED panels (there's an extra GPIO it needs to
manage). To use that driver, you'll actually just need to need to add
a new compatible and use the existing one as a fallback. See recent
changes to:

Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml

[1] https://lore.kernel.org/r/CAD=3DFV=3DX+WnSKZTFhzdXEFfpKCEqfPDc77h7oG=3D=
ZU6Nqq6XHOmA@mail.gmail.com

