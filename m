Return-Path: <linux-arm-msm+bounces-10081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C30184C7F6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 10:52:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F3241F26C7C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 09:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894D62261B;
	Wed,  7 Feb 2024 09:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ky96FDE7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA63A208DC
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Feb 2024 09:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707299515; cv=none; b=LtQEO8Bnp418Ecf5uw7SU6X8Di2dq8M2c3h5uOf9pZChT+YHItD7TfwB31fsrzmXF2eyKqNZgCRUWLbKmCiCP26nTeN85uPwk9YlY3Egju5QQRkhIBQC5n9IQV/r/SBUUnkRcfDi+TW5riSLnbd+tn+by6OpQXVLOIT2mktsyxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707299515; c=relaxed/simple;
	bh=KR2sG7J4c3ofHOmeepSU9gMmPKLoScOYxX43x3M1eFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bVpJQtF8dPyXhBYdRK7blpKXE2cgZnFRn3TIK2UWZJILBaC2BD3tLtkGrd1imrlZiIDW+eFpW2ESALcC7NH8krvLQ14fahBGCmPxsgSyCXiC9A7bZzcWFXCQEdRYCHjqtzFdPuxEGI2JA0DH0umJYXh0N4jU1OUa2IdlfW1X25w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ky96FDE7; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-60406302a5eso4495417b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Feb 2024 01:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707299512; x=1707904312; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tL/r8AXFGxGMMcyM8KcarAKkFwTyeEeSx1AZSjKfuYU=;
        b=ky96FDE7ziHgnLqlev77pd2UHXgEW/4rprecDW8MHgXeQm1ekDj+ud4MYzDUSCQKYf
         hphTkXd/Dv8GneMsGkuv3lli+ylZ1o6efp3GBgg012nkDM4a0FqkgIrX4PDf3oyPlVlk
         4KcXLYiUcGaYQC9wULjrHWmkEjyaFXTsbOalkZx7ZXTzQJFh9OIVRT+xiaIbhpdSy5Ro
         za7r+XDZz8hp7etUYtCPzIHrruOHzj1Q6GdtfNGOYlsK9UwJzMO5Osk0LHs6mI1ui5dH
         WYABlA5yxnPulYmBONbLUZ9A7CpPEv8Rckyi3xCOj1pOGm8vIaUMhBsJzdZiZ3/cSaTY
         p6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707299512; x=1707904312;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tL/r8AXFGxGMMcyM8KcarAKkFwTyeEeSx1AZSjKfuYU=;
        b=jJoTRCwEzLR7cGP62BM7bEdtRzSn6PDYdAeX4mcbVe5J04frfy95KwCPFwgTRQSgL8
         /l0OFHvuFjSm50WPepct1l3B3jbvF9TsaQ1L7bSoAfiQNVfNsdtR0/lWqXu1byhCWGK1
         w292mwB2WEAB0TW+Op1kUFhAIxH7QrhtoptyZY3C+muijmLgRARAnwGocMnIYqGDUU2g
         ttx4P8VpgJq8Q2XNyci4Uj9ikEGfjpEN4TzTCyzurhLXJvlMij+zL8R1ZUStwwUKyeU2
         yfkZUMM3im4NjD80NSASXb3kqojnoAoohN0PIGxpZkFz0leeYfWkpbz4nvq/d8h7UXPT
         Gz9Q==
X-Gm-Message-State: AOJu0YzExM5Mozr90ftobvIPcF4UafTH2Nuo+ENnQetwLXoQJ3opXrdq
	GM5SyBpyEsI2s9SG8lUoj9JBScJF3LRN5YkUEdiAzbAZ27gxLeVSp8+Ob8sRmAtKbTHzwMuec7S
	dh9/1lcnIsV8DzxlAK7+e8n5tKHRHeTVPN/VY7A==
X-Google-Smtp-Source: AGHT+IHijGzj8uRjINoynUtKvsODzePDZYI2IRClC5jIBfJbvgeat7fp8n2svTrjS5gczDAdT1OcKNi6CZuwYdJnwps=
X-Received: by 2002:a81:cf08:0:b0:604:5415:b204 with SMTP id
 u8-20020a81cf08000000b006045415b204mr3872325ywi.33.1707299512595; Wed, 07 Feb
 2024 01:51:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240202064039.15505-1-quic_ekangupt@quicinc.com>
 <d8e32f3d-1658-4dcd-a1dd-e37b664986ae@linaro.org> <41703424-f711-420e-bcb8-290f68a0aec9@quicinc.com>
In-Reply-To: <41703424-f711-420e-bcb8-290f68a0aec9@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 7 Feb 2024 11:51:41 +0200
Message-ID: <CAA8EJpqB4OG1n9maGuwo4BLRPctD6-nHJBvzauxoodS_Xji86g@mail.gmail.com>
Subject: Re: [PATCH v1 00/16] Add missing features to FastRPC driver
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: neil.armstrong@linaro.org, srinivas.kandagatla@linaro.org, 
	linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Feb 2024 at 10:30, Ekansh Gupta <quic_ekangupt@quicinc.com> wrote:
>
>
> On 2/2/2024 1:41 PM, neil.armstrong@linaro.org wrote:
> > Hi,
> >
> > On 02/02/2024 07:40, Ekansh Gupta wrote:
> >> This patch series adds the listed features that have been missing
> >> in upstream fastRPC driver.
> >>
> >> - Redesign and improve remote heap management.
> >> - Add static PD restart support for audio and sensors PD using
> >>    PDR framework.
> >> - Add changes to support multimode invocation ioctl request. This
> >>    ioctl call facilitates multiple types of requests from user including
> >>    CRC check, performance counters, shared context bank usage, etc.
> >>    This series also carries patch to save and restore interrupted
> >>    context.
> >> - Add early wakeup support to allow DSP user to send early response
> >>    to CPU and improve fastrpc performance.
> >> - Add polling mode support with which driver polls on memory to avoid
> >>    CPU from going to low power modes.
> >> - Add notifications frameworks to provide users with the DSP PD status
> >>    notifications.
> >> - Add a control mechanism to allow users to clean up DSP user PD
> >> - Add wakelock management support
> >> - Add DSP signalling support
> >> - Add check for untrusted applications and allow trusted processed to
> >>    offload to system unsigned PD.
> >
> > Could you precise:
> > - Which workload are you fixing
> > - Which platforms are concerned
> > - Which platforms were tested
> >
> 1. This patch mostly consists of missing features from fastrpc driver and it doesn't
> carry any bug fixes.
> 2. We are not targeting these changes for any specific platform. These features are
> applicable for most of the recent platforms .

Please define 'recent'. The upstream kernel supports a wide set of
platforms. We have fastrpc supported since msm8916. Please make sure
that your patches will not break on such platforms.

> 3. These changes were tested on SM8650 and QCM6490 platforms.
>
> > So far I've been trying to run the "getserial" on SM8550-QRD and
> > SM8650-QRD without
> > success, would those changes fix this ?
>
> Can you please help me with the "getserial" failure details? Or the steps that you are
> running to get to the failure? I can have a look at that to understand the reason for
> failure.
>
> > Is there any chance we could get an open-source minimal implementation
> > of a fastRPC SDK using
> > the open-source Hexagon LLVM like we have for the AIC100 ?
> > It would definitely help validating the upstream fastRPC implementation.
>
> Generally Hexagon SDK is used to write and test fastRPC use-cases which is well documented.
> Is there anything else that you can suggest would help here?

Hexagon SDK is a closed source toolkit. Both in terms of toolchain,
library code and generated code.
The fastrpc_shell_N, which is used to handle loaded code, is also
closed source. As such, it is nearly impossible to verify the code.
Please consider the requirements for the drivers/accel/ subsystem: to
have complete open source userspace. Qualcomm AIC100, for example,
fulfills those requirements.

>
> >
> > Thanks,
> > Neil
> >
> Hi Neil, added my comments.
>
> --ekansh
>
> >>
> >> Ekansh Gupta (16):
> >>    misc: fastrpc: Redesign remote heap management
> >>    misc: fastrpc: Add support for unsigned PD
> >>    misc: fastrpc: Add static PD restart support
> >>    misc: fastrpc: Add fastrpc multimode invoke request support
> >>    misc: fastrpc: Add CRC support for remote buffers
> >>    misc: fastrpc: Capture kernel and DSP performance counters
> >>    misc: fastrpc: Add support to save and restore interrupted
> >>    misc: fastrpc: Add support to allocate shared context bank
> >>    misc: fastrpc: Add early wakeup support for fastRPC driver
> >>    misc: fastrpc: Add polling mode support for fastRPC driver
> >>    misc: fastrpc: Add DSP PD notification support
> >>    misc: fastrpc: Add support for users to clean up DSP user PD
> >>    misc: fastrpc: Add wakelock management support
> >>    misc: fastrpc: Add DSP signal support
> >>    misc: fastrpc: Restrict untrusted apk to spawn privileged PD
> >>    misc: fastrpc: Add system unsigned PD support
> >>
> >>   drivers/misc/fastrpc.c      | 1949 +++++++++++++++++++++++++++++++----
> >>   include/uapi/misc/fastrpc.h |  112 ++
> >>   2 files changed, 1844 insertions(+), 217 deletions(-)
> >>
> >
>


-- 
With best wishes
Dmitry

