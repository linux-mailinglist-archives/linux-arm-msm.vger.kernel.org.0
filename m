Return-Path: <linux-arm-msm+bounces-52846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9E6A75BAD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Mar 2025 20:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB3733A6739
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Mar 2025 18:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214E81D89FD;
	Sun, 30 Mar 2025 18:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UuGtsN7K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C7B1D61BC
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Mar 2025 18:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743357958; cv=none; b=TIEpV2If0wisM1erUW3j8kR4WKYHYG9qN9MDTLn2StWcL5hrpMnVOBsTqahOBA+9RlWI8uovK49lD1l84IKziUg3qiHFX4JGEZfc53D5si4OrWF/r4n+zLYfwTug7Xfg3IbOE6QDmM8SqL1S/KVPFhwHSsluF2ILdJ4afOzqKQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743357958; c=relaxed/simple;
	bh=hBWP/0soWHbq3zbQYt3u1v10HqYji3ePqIHWx3i+RwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AYhff2VlYqcTGNyldo22SxVUCGBQshsUFz0eUV4NkGeFvhMvflG7cXjCzoVHWkj62zFJlqdur5kWXoyPzaMmFvAO/4/ZLUdgM+nKvpBXwMQJpEksBCxKlr2/QefF7aiu4xQp4RLAsV3e5eftjoPl1n4Ubx4bV7UpjTHDIMPKuRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UuGtsN7K; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso23785225e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Mar 2025 11:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743357954; x=1743962754; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hnfsVQoN7BVQq/UCAqhsRfIkUla9FknIwhk198jk+nA=;
        b=UuGtsN7KdQHj2N6SmthPaWLXq/gB6M/L+fr/wek0DzgVOS2wyWr+EpT9t0Viiy1b++
         EVsFcWNccymGc/QUCj13XDTL778JUewl7aUrrB1euekYmr6X7dTmbDqIjvmYoiTmej6m
         pDPfZUvLtuYzFU54SbTDlAxfART2NZ/2eigHYB/keQqhB8jUd7TgAtMsDLgNXKEuncuh
         79m76oqcFH8QJjzkdAU7JzQuGpQ9KnxivaqZsNELDCp1TSdc07mz0uxEAhuoNBx+/YLR
         qGWEN3w0cSFYslP6E/ddCY5z9c21UVsfCuAu5PkqULKUHjeamaIPJ+uNGTtTSmOcEm8Z
         nMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743357954; x=1743962754;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hnfsVQoN7BVQq/UCAqhsRfIkUla9FknIwhk198jk+nA=;
        b=ujWzTlPdvluxQtuKE6SfPhE2xifPgwI9cwwf2i9DXd7FEwWzyN2nhScgSy71tnEwKE
         YO2buElbln3MF9mznG91DfUthPwHfsPMj2fURRQ9b11wkxvPcm7cVjv9EkceUOmaOzNK
         FNptEe1MG6cyi9XiKYB08OWmwxahYQHUVbRMQWRcbpMRrGOwXnhsU8QkkTN0J1r3oQPf
         +wYmWh+YEwQFM1Fc5gVZ5VRg4Vt59TGc9+jt7Rg8dehaYzpgRlWuc4rhQSZNo2J4I0lX
         xTAZtVs2uH/MH2zct7dVgV27hZQse+fOSSep5vKte9LDTKImgcOlsG92Nr1eWI5+ktIh
         P8UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWonjJESb7TRq+Clh2YHghuB3CqOy8I/8rjjTIeZfHUJ6Xk20gGj8W9MIxEgKDk2tzD6HMLb4gSciqF2pGf@vger.kernel.org
X-Gm-Message-State: AOJu0YxdW7Zpjgt2pHdEe9cXalq6kilcvWwIT/nvneXGuXfU3i8hwFnm
	LqBn5BlQm6+0TTFt4e4drAnboyiqdD3GxwioY8zXWwO+peEqDCbd7XvyX2bqd0FPK6R+ZRbdS/I
	Q9jbKpz3wIjEkW642evPC3K3RXjO+UXYMgQDP7g==
X-Gm-Gg: ASbGncuVhC3lQN1u/nCO4R1Py3gO/OrRWXKWQcKI+6J90ybqkEyTGASe67qMhXlut60
	1pl2ybjPMM2tD2dgjDdIVBrAm+llYUyzdp62BId4URLa8/CXDH3MzwQP/eA8HbEcBsKAmMnbkop
	Uh6yAQfmZQBDDRFs4tm53qkzTf6+OIOOLm/hgPNziNvWBXGhiRvVWsk9bKwag0WVUY/V4otg==
X-Google-Smtp-Source: AGHT+IHoos9QzanPsGiYgW04xbM8tHV8yEstV7nbyP17tfhgl5Tu6pOmCopyigYoqs8pQfUizNRz5NEJZ+MuExnPEyA=
X-Received: by 2002:a05:600c:3493:b0:43b:c6a7:ac60 with SMTP id
 5b1f17b1804b1-43db62b72e4mr57523125e9.10.1743357954536; Sun, 30 Mar 2025
 11:05:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v5-1-25083d9732fc@linaro.org>
 <f2odvmbhsfmkrkzada2a7qdjavomt2cjji7mbwibzlhxiz35ai@2qxnfb44eb2r>
In-Reply-To: <f2odvmbhsfmkrkzada2a7qdjavomt2cjji7mbwibzlhxiz35ai@2qxnfb44eb2r>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Sun, 30 Mar 2025 19:05:43 +0100
X-Gm-Features: AQ5f1JrPaoChzlVOaAUOxwhyfNR6iarewZ64iTBqQ4hyLv-fzJCFGnyzphgmD5s
Message-ID: <CACr-zFDUMzb+jKcBc1SfpsOiQsAJJ0jsPdS-vcA=OXy-K3pfQQ@mail.gmail.com>
Subject: Re: [PATCH v5] drm/dp: clamp PWM bit count to advertised MIN and MAX capabilities
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry,

On Sun, 30 Mar 2025 at 18:56, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sun, Mar 30, 2025 at 06:49:40PM +0100, Christopher Obbard wrote:
> > According to the eDP specification (VESA Embedded DisplayPort Standard
> > v1.4b, Section 3.3.10.2), if the value of DP_EDP_PWMGEN_BIT_COUNT is
> > less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, the sink is required to use
> > the MIN value as the effective PWM bit count.
> >
> > This commit updates the logic to clamp the reported
> > DP_EDP_PWMGEN_BIT_COUNT to the range defined by
> > DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN and _CAP_MAX. As part of this change,
> > the behavior is modified such that reading _CAP_MIN and _CAP_MAX
> > registers is now required to succeed. Before reading these registers
> > was optional.
>
> Describe why, not what. Something like 'is now required to succeed,
> otherwise bl->max value can end up being not set, although
> drm_edp_backlight_probe_max() returned success'.
>
> LGTM otherwise.

Amazing. We got there eventually!
I updated the commit message around this change to be:

    As part of this change, the behavior is modified such that reading both
    _CAP_MIN and _CAP_MAX registers is now required to succeed, otherwise
    bl->max value could end up being not set although
    drm_edp_backlight_probe_max() returned success.


I will wait for more feedback for few days before sending the next version.


Cheers!

Chris

