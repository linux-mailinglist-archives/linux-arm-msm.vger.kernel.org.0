Return-Path: <linux-arm-msm+bounces-55542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF349A9BE5F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 08:06:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F92C4653EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 06:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D462A22B8B1;
	Fri, 25 Apr 2025 06:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RFtSTVxY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D327822B8B2
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 06:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745561199; cv=none; b=tW3QjuF1ywLMfN4biF2xBR5WLBeq/4fRuQdpPlrOInGi366XeogQOoLx2O0DEfkh+vONgCO9W31gaFD+mF/8IrelkM3OZzTjE9dtkfP2eYRAgmbfZ3AVyWphIa7oTG4Z12eWc0KE2rENiR8Go74a90ydnR9QQ1poIkYxsfl03Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745561199; c=relaxed/simple;
	bh=CpBT/GJTl/qOHB8XXefQW8z5QInEFr8XQOgxoGfmDlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fmygkuiXSrFN9GkgncVFPV1BzJA3z+2Oiv59/2igI3L406HORNvOFgRM5Lb0HsPA3x8jMnitWo1ID8TGwSf16QVAmPqrUNv1Bkcgm56kUX9KAdWlgByZj8bXA8bJvjsN2AM2K6rDozzZpRUzbJlz5qCFIFmSDX4CwAs5kgzwZFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RFtSTVxY; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-51eb1818d4fso2533780e0c.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 23:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745561195; x=1746165995; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ajgJc89GPboKToxuB8Pj0D0uNjRPDnR6q+9b48EFZ2E=;
        b=RFtSTVxYzNOCGv2rnwTHN+3CiPKXQBATPCXeP6dr7gaQRpBhBoalnkY+LbUx0sk0K0
         uyWj5fDaidv+PnkUuO8tbvCDnuKmBCzQIZWOz1hEBc76bo18OqEBD5Oss8u10URqGgRQ
         BMs/R/kC1OEknsAsU25OZXJvGLGWnmeq+yhLXDIU5LhKz4jUdWSM0/q/rcBT1Vb5UIYp
         yibnkVOsVcZ4vQj/iAJ+eQ3TvnlV6RbQDIgst7u5CJ7Rlkd6Q4jQmnIFsYxEr9SWwjN/
         NmYo42eVBTKO60T5mAo/Q11+g3gVoJLKhg4TExj0Wq0SNGr03vP1PeV/Gv6UA8BHCwAk
         PWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745561195; x=1746165995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajgJc89GPboKToxuB8Pj0D0uNjRPDnR6q+9b48EFZ2E=;
        b=uaaCLecV5vl66U82/I78PB2VUAtnZxpwdJ+tOmQGkPA/SxZPnO63VQnEfIOFGVK8dw
         8WhiobrgOM+7piUuEeGOzTWYjzb0asC4T5l9bQk00eyberiKrsMdRB3H6wgyWZFcLl7J
         GPQHf1K5yvIZiNz0QmZ495uH37Ckq64avzUbTh3JduxJ5qLwBKqN2qGOzyY84ekfGrGQ
         X5z/stayidjYjgFtpXNyP7Jd7FIp9JBX1KCE5w5zlCLVd3rb86M/1Xry/wAaMm2J9eyN
         +WnQUtanmoErHuqBYONsa3pqicKXbnaDAO+8rCp5vPAhzqlQC08CT7i7xFrlD1aYnSIt
         Chyg==
X-Forwarded-Encrypted: i=1; AJvYcCX3va36c7riNw0xAsPd+dEO+3YN3oB1owszo2FZVcXa+05clJmHq+LcDJbmnlbAVY8TfuQFeQzDHMNAuNNS@vger.kernel.org
X-Gm-Message-State: AOJu0YwxPToTXoCOZyDksOKYIXhL6zua9TNfozinMI6pWbPUi5tdhVFn
	bmLlLYRobaS1rzY0+Q4hUL7wA3zQ995rwJrfJJAHvh/X4UCM3DeS9TFHEPWxUZfuPYHO8/ykfb3
	ylCrhfgVZYmZK9j8jmDFL8PYENsb8Ha9AWeJ3gw==
X-Gm-Gg: ASbGncv0HbUQzFN0VgB7BMWxTBfeh5SCA0JsHTXoslzcr+0Reryxfs/qkHVTvusYyKw
	fRw7431adiBv2waGzTeNdoDbas3qnMmnPTSOWJ3nQGsmC71PTnTyNQXroA6b9Z3ij9IcI1+FZmG
	by0aP6m4x6RRnqOn0wmHnz/p/fNgjLjrpblS5T8b+WPIxtU2qCVNhJ8AfH
X-Google-Smtp-Source: AGHT+IHk3Sh1recRtL0I0FAiNETtYwurKFY0CJ0FDTy8w0bAg/KMEvL/1tmqPiwb61pQkrz7JWUirq46fq8oitTFWfU=
X-Received: by 2002:a05:6102:3e87:b0:4c1:9526:a636 with SMTP id
 ada2fe7eead31-4d543fb6341mr362655137.15.1745561195672; Thu, 24 Apr 2025
 23:06:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYs+z4-aCriaGHnrU=5A14cQskg=TMxzQ5MKxvjq_zCX6g@mail.gmail.com>
 <aAkhvV0nSbrsef1P@stanley.mountain>
In-Reply-To: <aAkhvV0nSbrsef1P@stanley.mountain>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 25 Apr 2025 11:36:24 +0530
X-Gm-Features: ATxdqUHyh1sPNfszHFCKsjMSGrXxYsTXLBiYXGTypFcI7J1MgDaUy852FfJYen0
Message-ID: <CA+G9fYu1GagoVWnhNFnknWf0_zk-O+5XQXDiL-XUdt8knhJYaQ@mail.gmail.com>
Subject: Re: [PATCH] rpmsg: qcom_smd: Fix uninitialized return variable in __qcom_smd_send()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
	patches@lists.linux.dev, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Frieder Schrempf <frieder.schrempf@kontron.de>, Marek Vasut <marex@denx.de>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Apr 2025 at 22:52, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> The "ret" variable isn't initialized if we don't enter the loop.  For
> example,  if "channel->state" is not SMD_CHANNEL_OPENED.
>
> Fixes: 33e3820dda88 ("rpmsg: smd: Use spinlock in tx path")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> Naresh, could you test this patch and see if it fixes the boot
> problems you saw?

Dan, This patch fixes the reported problem.

Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Links:
 - https://lkft.validation.linaro.org/scheduler/job/8244118#L2441

>
>  drivers/rpmsg/qcom_smd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index 40d386809d6b..bb161def3175 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -746,7 +746,7 @@ static int __qcom_smd_send(struct qcom_smd_channel *channel, const void *data,
>         __le32 hdr[5] = { cpu_to_le32(len), };
>         int tlen = sizeof(hdr) + len;
>         unsigned long flags;
> -       int ret;
> +       int ret = 0;
>
>         /* Word aligned channels only accept word size aligned data */
>         if (channel->info_word && len % 4)
> --
> 2.47.2
>

