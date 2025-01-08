Return-Path: <linux-arm-msm+bounces-44427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DD4A05FEA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 16:19:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 597C81664C7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 15:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999791FCFF0;
	Wed,  8 Jan 2025 15:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w1nswO97"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220D919F133
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 15:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736349586; cv=none; b=IouEi15+HP2LlXgpdCueRTxeFgjUa4mi2y6hvqh8i7qWxWY8V8QBG+XyquTPwlLWPTt4Y4wJtG6LYBIg4R7HMJN7/x/hjXzLrv81bYbxDEy66IEPQ3cXcR3NdOnYyppX8fZLAk1JGEpeOibXzM/TzL8OpKpwdGJ7fV7tFz2Or/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736349586; c=relaxed/simple;
	bh=S8+xIJyK33ZHzGHOInxNuQ7XoyymzN8JimDgUHl2LMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l6V45L5u5vPdcGnjdEDhEH+pYv1QjB05gTkGVOiTwyBGAmVwN7aAbTT+35w7TEqckyb1uwVSz26kiMAi/yBwQA4vvQUMDysjwtkzBGh/tl46S5StkFwg44cZMaV+7EOvL12C6AyzQZp5fHCPOz9zKXWM3sjyoPCSQpWbILpwgaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w1nswO97; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-29fae583cc8so513903fac.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 07:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736349583; x=1736954383; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6Zs0x6zXwLhMKy2YimFx22u5+ybSyZ3K5Ks5ZMiPS6U=;
        b=w1nswO97nSovzBwOLaHKx4SpsJYjHKGgtOmETPKgjB70I93z7aFcPmlzw4fZ7RVCB5
         RmiUcjIhdE07Z5Y85oQzjoD9mWGBzjKNpxwEbG8l5qh1fpUfoSHMmtIWK8G3TNRkL/X7
         T5Kghw2O9vIDWOyAiH3KqwoIxRiZ72bWCDRYrWGFBY683VdUiw6kwYPSnFfn6dZ8mb6x
         Zy7vLQd2djt6rpmm20/GHUAra8Pstu2CNO1AxMr1aaa4CKCeWKnxCLN8nebS9O48uf7l
         Or3lDESEI6Mn9rsJsNYXb2/YIG/QhkSXSVcUcjykJ05gqvLb7rx3v4jrZ61q2aEw9DYW
         UXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736349583; x=1736954383;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Zs0x6zXwLhMKy2YimFx22u5+ybSyZ3K5Ks5ZMiPS6U=;
        b=RO2D9g3T8Ad47EoH/HWgRO748qCpQuE0+zLBeeYoWp0wtZYZMDfwmXcjQDTHyLQ+CC
         Fkf6+IOpkYD3DcAceIT4Sz5CZ9C3WfCk9WBFU9b9YjdHrA28Ncw1h5B2mYQn21IPc9Kp
         411FRkqdPZM26OqnCqkJtQbcQtlM1h+yBm7xW5/qpYDnqIpNWxmHRn4hIATzkT4M/rg1
         svsSaHfLSZG9syUh5Y7wzGv+gt3zjkE9ihnmGSUSiNxo5CanxL2b8AU6zDBRmaq+K8K1
         re7KKVLHky+oAqVqJwxeqKmfJA+xn6BGZ3xrAv7pLREtkOYx6NbXCNbpER5Qy3YtjAUe
         Lifg==
X-Forwarded-Encrypted: i=1; AJvYcCUj2mXnpY+Qv6IRJ2H5D/865hN+FF5IjCx8KjbTpNDE0X6c4AKLP1tp2sR0eZvGBqtzH6NjnsuUQebe3Cv6@vger.kernel.org
X-Gm-Message-State: AOJu0YyoOOGtKY2vtYUICXM8RtXgNd3X+a34ettV9plLlaLS9AERnc/e
	ETKcn5DKDNaEu+9ywMoATPPRsx7io/NvzISoJmdtLny+zyJsQqrXoTEeSE4bM+sghrNqtHRLiMt
	CwOBc8JSY7Flo+lyZLcbHbFQD9qlEE8mgtHH96ksb+Ya0FuHCaRo=
X-Gm-Gg: ASbGncuQF8rGNPk8D+pYkTM8iW+JdLtX8XdeOD8utvzAxndagWexvjG/bT2VZ40QGfl
	O1MtihHO1BYT8aNWo43FUrk7gRSMoGilRikdt2Bc1jmQWxaOOp9NR3KmDNi5gADfThZRi
X-Google-Smtp-Source: AGHT+IFdcASMuSPx7wnPTSOxzCIvnK5AZhtUpSDpvfTmQ7F1nQUlpr4kCBfb2r1WlGxp8XqNukwAN1+7QxEq5LVuoOg=
X-Received: by 2002:a05:6870:ff45:b0:29e:7629:1466 with SMTP id
 586e51a60fabf-2a9eaa986e7mr3988370fac.7.1736349583243; Wed, 08 Jan 2025
 07:19:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250108-mhi_recovery_fix-v1-0-a0a00a17da46@linaro.org> <20250108-mhi_recovery_fix-v1-2-a0a00a17da46@linaro.org>
In-Reply-To: <20250108-mhi_recovery_fix-v1-2-a0a00a17da46@linaro.org>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Wed, 8 Jan 2025 16:19:06 +0100
X-Gm-Features: AbW1kvZa6gRkeZ9H-nvbe12ihHDmXyCS470lzORAghiZyMgYmyhYw4TS9_LQmVE
Message-ID: <CAMZdPi9KiLczjETLwJG_9krn_z=Og0uZhYuajPeZYoBHanxMiw@mail.gmail.com>
Subject: Re: [PATCH 2/2] bus: mhi: host: pci_generic: Recover the device
 synchronously from mhi_pci_runtime_resume()
To: manivannan.sadhasivam@linaro.org
Cc: mhi@lists.linux.dev, Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jan 2025 at 14:39, Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.linaro.org@kernel.org> wrote:
>
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>
> Currently, in mhi_pci_runtime_resume(), if the resume fails, recovery_work
> is started asynchronously and success is returned. But this doesn't align
> with what PM core expects as documented in
> Documentation/power/runtime_pm.rst:
>
> "Once the subsystem-level resume callback (or the driver resume callback,
> if invoked directly) has completed successfully, the PM core regards the
> device as fully operational, which means that the device _must_ be able to
> complete I/O operations as needed.  The runtime PM status of the device is
> then 'active'."
>
> So the PM core ends up marking the runtime PM status of the device as
> 'active', even though the device is not able to handle the I/O operations.
> This same condition more or less applies to system resume as well.
>
> So to avoid this ambiguity, try to recover the device synchronously from
> mhi_pci_runtime_resume() and return the actual error code in the case of
> recovery failure.
>
> For doing so, move the recovery code to __mhi_pci_recovery_work() helper
> and call that from both mhi_pci_recovery_work() and
> mhi_pci_runtime_resume(). Former still ignores the return value, while the
> latter passes it to PM core.
>
> Cc: stable@vger.kernel.org # 5.13
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/mhi/Z2PbEPYpqFfrLSJi@hovoldconsulting.com
> Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Note that it will noticeably impact the user experience on system-wide
resume (mhi_pci_resume), because MHI devices usually take a while (a
few seconds) to cold boot and reach a ready state (or time out in the
worst case). So we may have people complaining about delayed resume
regression on their laptop even if they are not using the MHI
device/modem function. Are we ok with that?

Regards,
Loic

