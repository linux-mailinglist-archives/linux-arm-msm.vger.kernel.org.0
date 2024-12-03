Return-Path: <linux-arm-msm+bounces-40071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 162249E1D8E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 14:29:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9219B3B74B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 11:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5309E1E47C8;
	Tue,  3 Dec 2024 11:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c+fZm+EU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D481E47B9
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 11:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733227073; cv=none; b=u+XeBXUG0iDu/Zag9WsvI100HkWIkCjdn/1NZVyB46drn+zBg2oWGUNqvs1J39f5mhAOQWk5wwzTNwT/iDh8fzlD0sdn2qCyThhaCqHsX+F8azh1ORWu173AdrEx79i5U+w0+9sm2Df4+JDqSaKbYmc3dDu5WDINdn1425RX9uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733227073; c=relaxed/simple;
	bh=Q9+AiQ6s0aWeS6kzWsVPhOJmvynbGm/ye7+xXZgGDSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NJYWfKUmhrRr9iwOhiYjSF6GCWpwf7678ND2QpNDeiWDh3FTF14fv2B9ubGLKSc5EYwcDCSJkbZp268cbftjesdo4rSnCE2mXAO1NICUdWOkohmj9nvKeHefB5I+JjVvDU0P42lD+B0q5KZwKQS4pD4gY18pOWpWMosk48cZA9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c+fZm+EU; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e3984b1db09so3933661276.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 03:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733227070; x=1733831870; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BbMpTWPQcQsU0HRaX/c6zM2bDkZbOjiVConTuGe+jZE=;
        b=c+fZm+EU/RrrAoTPD83ZHxZFQxF30ZORotoDDljCAlRv92VWJGoYrgX6pJ7lFAPl0U
         /Wx1EmEeOylVASJrEjYSgVqibv/G0iw2CMJApCmvmxM2AGI/z1EpC+urSvb/UkwuBU/6
         qGDys60o8ZCZVsit2MK+Nb9s4/cHUXCqraw4uL9CG/FgJ2MniMivtYkyO1Rrykvgzstn
         rJcXku1kYyRJOoN+jIq8Nblr2PRzruaJwXRreBnVnQ1e9nEsfnVIu7NRKHlDFSDZBlxx
         2ORzaeKw1+lOcH+Qola+3CXbdYMvGTdkxtVPCQqSE/HIMHq8+VThm8teCAH9z8J400Tr
         5Etw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733227070; x=1733831870;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BbMpTWPQcQsU0HRaX/c6zM2bDkZbOjiVConTuGe+jZE=;
        b=C1fBYPMo4UKuIciKT/aeZax0C4QCJXRLza+mRH3XVjyfRAse0PCilPGKRxtHKpHv5m
         +bEp51J9boo3e9N4QMcFCkMbXgOzYLqTmOyaUX/ftXqJBCjU/ixqV9wjzE285nRimwc6
         COb2EaRzUYy8DxZTcOPrHj/JT5tNQ4cEws7lJ2Dz+5XUsupp72iOacvdxI4kiQMMegRK
         QOHe1AYf+WBoXdJ4hG3kphLuIJZzzCCwGGLvPrWxd4eW4evVUVPHj8gYFDQrBOTeBW+o
         uMEhtFktokfOuvjeDSXCoVijsktNOY9bu2E86QV0aq+yazFejOvjHqG2AntA77p4XhHx
         +IYg==
X-Forwarded-Encrypted: i=1; AJvYcCUfDaVC6jJDpyw+92Dzhjxcc0KZkZ/Ejxg08+97VQadnR/p/vGn3Te8Q7lQFFq+RS8ShIYXDsiMNO2ECFEC@vger.kernel.org
X-Gm-Message-State: AOJu0YyIwG7zbJ2e/BDqWrJrCuqRmSC9ffNh9W1yVJ0m63eHI1wKt6Bh
	mcsKob0xy2VFgZ7bCPxL+bw8itWir4NWQM3/emiFm/rlk2QFlMUmOar04cFtZCeD+qnBryQLBmw
	hGZjx1bMYyx3f6i1tOlPuWMVznFu81JhX5zNaJA==
X-Gm-Gg: ASbGncshsS6hlTxXDXXoIJrvo+nMXM73ewAjwe9szor86pKci/aaGLowWb8lR/q6Lq0
	hKylrEgHwPDpN4Y6mZPmNWh0+hh9C6g==
X-Google-Smtp-Source: AGHT+IGQ/9s5DEKVq56LcELRCgbbSUJDxrGME9rneM000XHdp2t+8py1fz0BjAa9e/C+4ixWTgkXDY5JwOAFrvAaJEA=
X-Received: by 2002:a05:6902:20c9:b0:e39:93ab:dbab with SMTP id
 3f1490d57ef6-e39d3e39f09mr2319862276.28.1733227069673; Tue, 03 Dec 2024
 03:57:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241118084046.3201290-1-quic_ekangupt@quicinc.com>
 <20241118084046.3201290-5-quic_ekangupt@quicinc.com> <2024111804-doze-reflected-0feb@gregkh>
 <c3b285b0-33d1-4bfa-b8ab-6783ff5ed78d@quicinc.com> <cn7pqvhw4x4y7s5hbgzjpvyjnw4g6hoyepic4jai7x2fjdenxr@ikr4hkorbuwb>
 <365c4709-b421-4af8-b521-a195630242de@quicinc.com> <nsaq3zungvyhuikz35arvxmle2fovxh422jpyqxuleh57ufqnk@bekeh7qr7y76>
 <697e90db-6ecc-44ac-af86-6c7f910fc902@quicinc.com>
In-Reply-To: <697e90db-6ecc-44ac-af86-6c7f910fc902@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Dec 2024 13:57:41 +0200
Message-ID: <CAA8EJppbptPryu_O3G3YAapHT=Ai+MAdA38FtSU=YvWb+mqa1g@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] misc: fastrpc: Add debugfs support for fastrpc
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, srinivas.kandagatla@linaro.org, 
	linux-arm-msm@vger.kernel.org, quic_bkumar@quicinc.com, 
	linux-kernel@vger.kernel.org, quic_chennak@quicinc.com, 
	dri-devel@lists.freedesktop.org, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Dec 2024 at 07:22, Ekansh Gupta <quic_ekangupt@quicinc.com> wrote:
>
>
>
> On 12/2/2024 6:18 PM, Dmitry Baryshkov wrote:
> > On Mon, Dec 02, 2024 at 03:27:43PM +0530, Ekansh Gupta wrote:
> >>
> >> On 11/22/2024 12:23 AM, Dmitry Baryshkov wrote:
> >>> On Thu, Nov 21, 2024 at 12:12:17PM +0530, Ekansh Gupta wrote:
> >>>> On 11/18/2024 7:32 PM, Greg KH wrote:
> >>>>> On Mon, Nov 18, 2024 at 02:10:46PM +0530, Ekansh Gupta wrote:
> >>>>>> Add changes to support debugfs. The fastrpc directory will be
> >>>>>> created which will carry debugfs files for all fastrpc processes.
> >>>>>> The information of fastrpc user and channel contexts are getting
> >>>>>> captured as part of this change.
> >>>>>>
> >>>>>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >>>>>> ---
> >>>>>>  drivers/misc/fastrpc/Makefile        |   3 +-
> >>>>>>  drivers/misc/fastrpc/fastrpc_debug.c | 156 +++++++++++++++++++++++++++
> >>>>>>  drivers/misc/fastrpc/fastrpc_debug.h |  31 ++++++
> >>>>>>  drivers/misc/fastrpc/fastrpc_main.c  |  18 +++-
> >>>>>>  4 files changed, 205 insertions(+), 3 deletions(-)
> >>>>>>  create mode 100644 drivers/misc/fastrpc/fastrpc_debug.c
> >>>>>>  create mode 100644 drivers/misc/fastrpc/fastrpc_debug.h
> >>>>>>
> >>>>>> diff --git a/drivers/misc/fastrpc/Makefile b/drivers/misc/fastrpc/Makefile
> >>>>>> index 020d30789a80..4ff6b64166ae 100644
> >>>>>> --- a/drivers/misc/fastrpc/Makefile
> >>>>>> +++ b/drivers/misc/fastrpc/Makefile
> >>>>>> @@ -1,3 +1,4 @@
> >>>>>>  # SPDX-License-Identifier: GPL-2.0
> >>>>>>  obj-$(CONFIG_QCOM_FASTRPC)      += fastrpc.o
> >>>>>> -fastrpc-objs    := fastrpc_main.o
> >>>>>> \ No newline at end of file
> >>>>>> +fastrpc-objs    := fastrpc_main.o \
> >>>>>> +                fastrpc_debug.o
> >>>>> Only build this file if debugfs is enabled.
> >>>>>
> >>>>> And again, "debug.c"?
> >>>> I'll add change to build this only if debugfs is enabled. Going forward I have plans to add
> >>>> few more debug specific changes, maybe then I'll need to change the build rules again.
> >>>>>> diff --git a/drivers/misc/fastrpc/fastrpc_debug.c b/drivers/misc/fastrpc/fastrpc_debug.c
> >>>>>> new file mode 100644
> >>>>>> index 000000000000..cdb4fc6845a8
> >>>>>> --- /dev/null
> >>>>>> +++ b/drivers/misc/fastrpc/fastrpc_debug.c
> >>>>>> @@ -0,0 +1,156 @@
> >>>>>> +// SPDX-License-Identifier: GPL-2.0
> >>>>>> +// Copyright (c) 2024 Qualcomm Innovation Center.
> >>>>>> +
> >>>>>> +#include <linux/debugfs.h>
> >>>>>> +#include <linux/seq_file.h>
> >>>>>> +#include "fastrpc_shared.h"
> >>>>>> +#include "fastrpc_debug.h"
> >>>>>> +
> >>>>>> +#ifdef CONFIG_DEBUG_FS
> >>>>> Please put the #ifdef in the .h file, not in the .c file.
> >>>> Ack
> >>>>>> +void fastrpc_create_user_debugfs(struct fastrpc_user *fl)
> >>>>>> +{
> >>>>>> +        char cur_comm[TASK_COMM_LEN];
> >>>>>> +        int domain_id, size;
> >>>>>> +        char *debugfs_buf;
> >>>>>> +        struct dentry *debugfs_dir = fl->cctx->debugfs_dir;
> >>>>>> +
> >>>>>> +        memcpy(cur_comm, current->comm, TASK_COMM_LEN);
> >>>>>> +        cur_comm[TASK_COMM_LEN-1] = '\0';
> >>>>>> +        if (debugfs_dir != NULL) {
> >>>>>> +                domain_id = fl->cctx->domain_id;
> >>>>>> +                size = snprintf(NULL, 0, "%.10s_%d_%d_%d", cur_comm,
> >>>>>> +                                current->pid, fl->tgid, domain_id) + 1;
> >>>>>> +                debugfs_buf = kzalloc(size, GFP_KERNEL);
> >>>>>> +                if (debugfs_buf == NULL)
> >>>>>> +                        return;
> >>>>>> +                /*
> >>>>>> +                 * Use HLOS process name, HLOS PID, fastrpc user TGID,
> >>>>>> +                 * domain_id in debugfs filename to create unique file name
> >>>>>> +                 */
> >>>>>> +                snprintf(debugfs_buf, size, "%.10s_%d_%d_%d",
> >>>>>> +                        cur_comm, current->pid, fl->tgid, domain_id);
> >>>>>> +                fl->debugfs_file = debugfs_create_file(debugfs_buf, 0644,
> >>>>>> +                                debugfs_dir, fl, &fastrpc_debugfs_fops);
> >>>>> Why are you saving the debugfs file?  What do you need to do with it
> >>>>> that you can't just delete the whole directory, or look up the name
> >>>>> again in the future when removing it?
> >>>> fl structure is specific to a process using fastrpc driver. The reason to save
> >>>> this debugfs file is to delete is when the process releases fastrpc device.
> >>>> If the file is not deleted, it might flood multiple files in debugfs directory.
> >>>>
> >>>> As part of this change, only the file that is getting created by a process is
> >>>> getting removed when process is releasing device and I don't think we
> >>>> can clean up the whole directory at this point.
> >>> My 2c: it might be better to create a single file that conains
> >>> information for all the processes instead of that. Or use fdinfo data to
> >>> export process / FD information to userspace.
> >> Thanks for your review. The reason of not having single file for all processes is that
> >> I can run 100s of iteration for any process(say calculator) and every time the properties
> >> of the process can differ(like buffer, session etc.). For this reason, I'm creating and
> >> deleting the debugfs files for every process run.
> >>
> >> Do you see any advantage of using fdinfo over debugfs? I'm not sure if we can add all
> >> the information(like in debugfs) here.
> > Which information is actually useful / interesting for application
> > developers? If not for the fdinfo, I might still vote for a single file
> > rather than a pile of per-process data.
> I have tried to capture all the information that could be useful.
>
> I can try changes to maintain single file for all active processes. Having this file specific
> to a channel should be fine, right? like fastrpc_adsp, fastrpc_cdsp, etc.? Each file will
> carry information of all processes using that remoteproc.

I think it's a better idea, yes.

>
> --ekansh
> >
> >> --ekansh
> >>>
>


-- 
With best wishes
Dmitry

