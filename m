Return-Path: <linux-arm-msm+bounces-52096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEE6A6A8E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 15:45:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 174093B871E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 14:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E04F1E411D;
	Thu, 20 Mar 2025 14:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hSmKU+2e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE6D3594B
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 14:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742481909; cv=none; b=nuXarZ6FXEhBQY8tOjsZBpsMu5sWh0bxULByl3dWyMuXwTqH+ocNlgF14W6gAJ6qdml/Q/3tEdFyJQ1fgW2+SzTyk/6VUuXpkX4H65HprTv62hd5cd3ZPt9ZdnRvnTw7HvbA02CdKYK0QT5Y41bFDLrhJcJnJlpm1a1mOuDbLYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742481909; c=relaxed/simple;
	bh=okZxgShwz3RYL2XRi2ZqA6xqBFvvXnL42LzEF2ZGemM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PzkyHLh07Rv/BXA4t0UhiGx+T0zz15JYnTQrVvVEu0PRfSlrIQQm7G8qemmDCZVVWxo50GDo7UPXKg0z93HRbB35ibMxTX81dee86KLWAbDu1dVnDLV/5ZIZlW1Sa2+y3Z5vSMtRBcEy02qaG/8fuvIlzL/vUf8ctvAnbQnFAFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hSmKU+2e; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso792694f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 07:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742481906; x=1743086706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okZxgShwz3RYL2XRi2ZqA6xqBFvvXnL42LzEF2ZGemM=;
        b=hSmKU+2egcoGRw1MvQWpyYFG1jutlbhGziKIk3RoMFVsl3yUcvgwwx4cU8N4WGrHSc
         Co1iwbetjLFH5HHVdMLGo4vG5jQnOZWCfANoWd2gWnGQaeRhU5L5B20BqlL+uHNG7XJ2
         +4f7n4WykdMox5eMhnB/5mt/uxPy2QDefqOTCOe0+GVWppSnIyH/b7XoIRqBa+sNO6xq
         Xr8lG8Yw/7rB5tdiITV9ck9NwJQu88e7hohriSPuvf8FqdhMaxlkDvwJms/JnnYZea9Q
         oKwU6E3WR3gntGf7fAKanrBFd3WAcWeQjSMa7HAG10rO/GY4E9JscyR4Py+7+mbMuxA3
         +GOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742481906; x=1743086706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=okZxgShwz3RYL2XRi2ZqA6xqBFvvXnL42LzEF2ZGemM=;
        b=X5Z81P76GDZY3z2VqUB1Evyc0OOuVEHi+uVTVnRaUig+yyvvhoaIf3Aq+g31vrlW0y
         +HNSMh9fg4FkiKZ3rkxQoVnbCj1rdqYlkRz14hKRow/Or5ojvscTVpZ4uQbLZBGKbmAW
         0dubBNgZk/euHPi8sT9FfguOPj4hgR/1byphy6a6BbN1lspPjqVxtu+GDwDmfepnJvx7
         II2fuWIDvzoDlJUgUyL3d9KBN+ZrlWlnwycJii9tkOizvFIoY4QZGi0c+wfImfQ/EF1L
         zfMTCRXJOIHqHPeC2GeQLcphNl2jm/NwMSRptIR7NSp69z+w981WWx0UUhMRggDxq2R2
         s1zw==
X-Forwarded-Encrypted: i=1; AJvYcCWa68VEK8Uf+LDUWytuIDnNv4NULuIfOBD93uMioxYOSIH9m/aUhD8LkGAaqDyZ/rz45eJzY6RuTn3w0v29@vger.kernel.org
X-Gm-Message-State: AOJu0YwBKqWc9ToMihxANPCqpNvhR9hT7EOXOMSCeHia1h88cxSX3aNJ
	z2Dw3+aHBoxihZbH8TbkIHfW5Ygn9+RV+pGxU7FPnNSmmZe7e04VfYgvFQSZLOCX8f0qAjJgd+4
	0eEE2y9Ari5IOmnqKFteE/7KuLlNYf9dQqMXijt4r/VAecy2Dl0Y=
X-Gm-Gg: ASbGncuPdEkUAME3cDKyHZw6ca06ezNRxmCn2Njc3f/2N+Ec/sQ5deFePQq0lTTv52L
	Bjb98bg8Z1WDZyd9E0oQFWK9ACAQXu+n1Je/aM/rQ7M+b2V8mn2psOd9zNh6owp9TnMO18KOn9r
	vzF0tDdfXTHYl7YM/io9Ls331Rh9BD+HnLEXPHehH6nxDZGGirjBDpRU+iFFs=
X-Google-Smtp-Source: AGHT+IGbWi0qgqJjSn8J0xXrp3LVunPSnpp5v5LSPRBApvlKNAC5baJfPEJEZlkXAvygQxz6UkBvwZxhJxala1yxGx4=
X-Received: by 2002:a05:6000:400f:b0:391:31c8:ba59 with SMTP id
 ffacd0b85a97d-399739b3f33mr5606547f8f.4.1742481906308; Thu, 20 Mar 2025
 07:45:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320-wip-obbardc-qcom-t14s-oled-panel-v1-1-05bc4bdcd82a@linaro.org>
 <zgzivcjcygbi272q3dmkff767cb45uoffwtx37ij23pi2g5ubi@j5bxjdbgqaqz> <CAD=FV=Xn2cEKQ+Uj5Okemo4_RJ-1uJ_SQ5X5TycJs5bYdNpcBQ@mail.gmail.com>
In-Reply-To: <CAD=FV=Xn2cEKQ+Uj5Okemo4_RJ-1uJ_SQ5X5TycJs5bYdNpcBQ@mail.gmail.com>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Thu, 20 Mar 2025 14:44:55 +0000
X-Gm-Features: AQ5f1JrC6i7-T8NHX0lZyi2OWta0aE1vTDoug6ytYg33up7lQCpGbLgBq7tQswU
Message-ID: <CACr-zFC1ojVrvX4fCDO_M3_bvqLvBPSYuhMJUzXNwmjGjwpsXQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add panel used by T14s Gen6 Snapdragon (OLED)
To: Doug Anderson <dianders@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Doug & Dmitry,

On Thu, 20 Mar 2025 at 14:10, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Mar 20, 2025 at 6:47=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Thu, Mar 20, 2025 at 12:47:09PM +0000, Christopher Obbard wrote:
> > > The Lenovo Thinkpad T14s Gen6 Snapdragon OLED model has a Samsung
> > > panel. The kernel currently prints a warning due to not having the
> > > correct timings.
> > >
> > > This panel appears to work with the default conservative timings,
> > > so add the OLED panel to the list of supported panels with default
> > > timings.
> >
> > Are you sure that this panel can be handled by panel-edp.c correctly an=
d
> > it doesn't require a workaround implemented in
> > panel-samsung-atna33xc20.c?
>
> Yeah, I'd agree with Dmitry here. To the last person who wanted to add
> a Samsung OLED panel, I replied [1]
>
> It's much more likely that this should use the
> `panel-samsung-atna33xc20.c` driver, which gets the timings more
> correct for Samsung OLED panels (there's an extra GPIO it needs to
> manage). To use that driver, you'll actually just need to need to add
> a new compatible and use the existing one as a fallback.

Thanks; I will look at this and prepare v2.

