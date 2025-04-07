Return-Path: <linux-arm-msm+bounces-53369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0B7A7DE13
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 14:48:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EAFC177731
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 12:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C19062505A6;
	Mon,  7 Apr 2025 12:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aSciZyyD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41C122DFB6
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Apr 2025 12:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744030052; cv=none; b=eCC6WgJR7UEPM33+aqBeKmEgCsc62ag17KxaYUrWag07/RK6tNgZ/SZfo3wss3jYbAtTDj/axMrjE9R3NNX+cAC6qHyG61FHqBF7kvChIjRU7S3Yh3XWAsNEFkiUBuMW7kJphCsS0bXC/bchLBspckt2L2gHlDfTnnUwopCwxvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744030052; c=relaxed/simple;
	bh=CKpCxFXfa7qApafzzxoR6KgBjbUrX2COqwSWDtyCHVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cC1LRlVYGoP7JXi7fJknRZJlzZchYq93F59Dv313z8obeBpc0AZKaN7JWwiJmWT+OlPwwzu/xu18iQBGK2ssvybuVKicmQiju4thOGa785DBYSRxcsBTj4TSeEM3hnD/Ck04+5H6V1kCqboXk3pw7sPVYpP6bnszz4yv6L5xxeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aSciZyyD; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso2568742f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Apr 2025 05:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744030048; x=1744634848; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ejwa9QkM9z1qj04KEhziISr+vDareUo67q+OL7JdUHk=;
        b=aSciZyyDPoozNKTnw1fpbN+aHBeUogyvAIGZ5J2YJ1oMbVy3555eI+CUde6s2WlRNS
         a08L0ivVw/3oPevOpeAL7xCL2BU+bbM98rAQ/GEZGs3y6W0oom6Cr6WvhJAjdy830i6E
         vFNaBrihZ6BJQ01wJaRlkxvvNXSXX6Oqyg9R3LbqEEuUNIb9mjaClewLLwhAnAlgLyKl
         N4cqUMIYk0jxSAOcpRcKPlOBL32L2VGQAUVFNNIxfsNG3wfZGRpIrGJa414qzNjqObsa
         L0LL6+sJfuRyDiES+FjbuEDPj2Iqsit8ZrE76oj5TlcYw6A/As24t8rC4IYl4M+BBN+b
         l3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744030048; x=1744634848;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejwa9QkM9z1qj04KEhziISr+vDareUo67q+OL7JdUHk=;
        b=kL8i8XbNQLeXGx7fSh+SJVVqvUHt9lzI7ZwF88gBX7r9HlRq3SPd2wcN6ecltZfmUa
         e3HvTXTRSyBZBxQ/s8rh0PherdE+Ioihtu5qI5w3H1Oe7fz4qPGQBndYtghWA1RB/S/D
         6DPRO7/IBYpavJEkvZFfKp7BZHLJzy0kB9eUL+WIacb5QwM5l9/oNgp3wghDJo1w9A/W
         IR3hOBNOQVxMOKvW1H0VDkFxmoHZ45uQqoVHysOECgviNxRI8zy6jtaiy/Nygh6cdKzp
         CG4w4sI3qjr0sebe2aypmXgRviuOmll/3BboXRYJozDQfhrZaOqjImvyh0lBQXBwqwpi
         kISA==
X-Forwarded-Encrypted: i=1; AJvYcCVfz6AdSqZXFytT6DUINL30pNevoZpMhrrV3FVIkPWdnmT7qL3LqaOYHrVZRMc6cpMNwrWnbwsqu4N+z5Jb@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsu+UlB6bh7MYMaSr6GUyoT628ekDkJ627KSlARLqKqdNY36zX
	M6TiPwqN7kGzNztRmUVQuUy/RTrcXscoqzPDhXgM6LEfVrrO7w5mekTzDOHhUq4cY2rwSL7uj6n
	mjrbLoX16+695FFCE2jcIaDdgPjJZH/64pqtHxw==
X-Gm-Gg: ASbGncsudEHHHZrRKDfLRJli9Kboqi5zzfR2YXjNfxJOHchBS43NqGjf5kT8rgXf+Nh
	KARbG2z2JDctfdZjNPMrdaDBVFow781at2nX+MvkaISYgcwcvGX4C1PEbA36B6slMkKdzhVH+My
	Im6hcaLFtMPO84uqwVYYQQL0xwx83PRAIA9MVeTEwnidro2TVgqhln6C5Wa74=
X-Google-Smtp-Source: AGHT+IFtCtwBF1MQCSDv8kWR7+AawPBQWSSLTfZPWX6BoSv/E8BAZBB3w0TBcGKEjHI82f9K8I8unuvtiL9GOlAqfvI=
X-Received: by 2002:a05:6000:18a9:b0:39c:1401:679c with SMTP id
 ffacd0b85a97d-39cb35bda0dmr9467438f8f.21.1744030048103; Mon, 07 Apr 2025
 05:47:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407104828.3833-1-johan+linaro@kernel.org>
In-Reply-To: <20250407104828.3833-1-johan+linaro@kernel.org>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Mon, 7 Apr 2025 13:47:17 +0100
X-Gm-Features: ATxdqUHIKA4eGZ6sfftXvlzn5wf-8Cqh7uYF6-LkB4PNWkNHORpRrjxLgKXBxFo
Message-ID: <CACr-zFBAUrjRZ2s7oMO+7Qjk5X4zvdNb-9zYapTsuSqikm73zA@mail.gmail.com>
Subject: Re: [PATCH v2] media: qcom: camss: vfe: suppress VFE version log spam
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan ODonoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Depeng Shao <quic_depengs@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

Hi Johan,

On Mon, 7 Apr 2025 at 11:49, Johan Hovold <johan+linaro@kernel.org> wrote:
>
> A recent commit refactored the printing of the VFE hardware version, but
> (without it being mentioned) also changed the log level from debug to
> info.
>
> This results in several hundred lines of repeated log spam during boot
> and use, for example, on the Lenovo ThinkPad X13s:
>
>         qcom-camss ac5a000.camss: VFE:1 HW Version = 1.2.2
>         qcom-camss ac5a000.camss: VFE:0 HW Version = 1.2.2
>         qcom-camss ac5a000.camss: VFE:2 HW Version = 1.2.2
>         qcom-camss ac5a000.camss: VFE:2 HW Version = 1.2.2
>         qcom-camss ac5a000.camss: VFE:3 HW Version = 1.2.2
>         qcom-camss ac5a000.camss: VFE:5 HW Version = 1.3.0
>         qcom-camss ac5a000.camss: VFE:6 HW Version = 1.3.0
>         qcom-camss ac5a000.camss: VFE:4 HW Version = 1.3.0
>         qcom-camss ac5a000.camss: VFE:5 HW Version = 1.3.0
>         qcom-camss ac5a000.camss: VFE:6 HW Version = 1.3.0
>         qcom-camss ac5a000.camss: VFE:7 HW Version = 1.3.0
>         qcom-camss ac5a000.camss: VFE:7 HW Version = 1.3.0
>         qcom-camss ac5a000.camss: VFE:7 HW Version = 1.3.0
>         ...
>
> Suppress the version logging by demoting to debug level again.
>
> Fixes: 10693fed125d ("media: qcom: camss: vfe: Move common code into vfe core")
> Cc: Depeng Shao <quic_depengs@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

This makes my T14s a bit more peaceful during boot. Very welcome change:

Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>

> ---
>
> Changes in v2:
>  - align continuation line to open parenthesis as instructed by the
>    media patchwork hooks
>
>
>  drivers/media/platform/qcom/camss/camss-vfe.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index cf0e8f5c004a..91bc0cb7781e 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -428,8 +428,8 @@ u32 vfe_hw_version(struct vfe_device *vfe)
>         u32 rev = (hw_version >> HW_VERSION_REVISION) & 0xFFF;
>         u32 step = (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
>
> -       dev_info(vfe->camss->dev, "VFE:%d HW Version = %u.%u.%u\n",
> -                vfe->id, gen, rev, step);
> +       dev_dbg(vfe->camss->dev, "VFE:%d HW Version = %u.%u.%u\n",
> +               vfe->id, gen, rev, step);
>
>         return hw_version;
>  }
> --
> 2.49.0
>
>

