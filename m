Return-Path: <linux-arm-msm+bounces-39877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E6B9E04FD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 15:31:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DCEBB352E2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 12:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6925E1FECBC;
	Mon,  2 Dec 2024 12:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OutcDAXn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967261FE468
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 12:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733143698; cv=none; b=mHI1UPwjj9w01y37UVu3TKeiPZvCA2y9CiQQBrCt00d4vCTbpurH53Ix+SUnjHYgDbnruaZH1nKyfVFe0ph1fsT//7wnSfhwA34N0CtQHRm42Saql9b3JU8d5fhPqWw0NBVkb0/UQmy4o3Kcmo01MnSquTuka///CVfx7HvAtzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733143698; c=relaxed/simple;
	bh=laa6BssUejMlQcfX793zsytcX8qkrj2UQOQ3LkZp8JM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G6zlc18F5FYXsv9QpJ+qU6+Ck21UWbc767V5XnKeUUL7VB+GHlguDuI1nF0xCzj9Og+JXdWV7XLimxFwCC3GSHJ31e30Bt+bvOJxesV6xwDG21cQfCzN8CGF1M4Qp7PDflnGYJd0m2yaW4o6fh5iwzySpVH9ZXaaj9X4k6cq3dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OutcDAXn; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ffa12ad18cso44949141fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 04:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733143694; x=1733748494; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fie7JF114hIAOnlVTghL7ISjHHMtgNMPufk2CdTyvzg=;
        b=OutcDAXnyfjOlvW0Aea6i+0mleaf2z1gAMlSIoM7PUTYPCsER9mYu7bbIrmHCHqNU6
         ZRoDQjdhoC6RYBBeF3E1TQD7zWw6jWfyVInGRa4J9AT93Vumci00+fmguWUZmElgf4eW
         PqtRZvBxaipUmWoH+g7S6Vv6v7X4ZCQHBpdIpugGD761nbqHcQxgJoUeTfj/Ie4rzCkK
         ZjUiJatkIZCE2THnsWXRAQ5ZeQsYqzsJxDrlOK1SNsTaEQSBAHzeVZYEvaHwsvXO+082
         W1DvAOhXmdZE1UYMWrk4icOnjrROS9pZ1mnhLIQdAQ3G8gmaZpRYs14LNynw6LZR33+/
         nUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733143694; x=1733748494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fie7JF114hIAOnlVTghL7ISjHHMtgNMPufk2CdTyvzg=;
        b=frErLh6PtKYVGnSNwUnJZuOzTvRHDckFbXM9dZhIEnw16ES60Hf+Q5/TaQaUx0ikLT
         PQJpNEfgMAcgVtdnIJfKf9o0rq+s0hkoo0lx1CA5kLRSMsxt4Eq6awAwflpz7ahHuXw1
         oPHLnwbeH/lc8BkKMD4X54IZsz05bAb+Dw9uV+Ib/sP3+tSfCnXqxU/6FcugwcbdShOO
         77YtR+EJhxZwilXLfwKqC6cSh+5EYwxVHBZpAmK/T/Ou2dJOqQAuxvA+GmZLWyOVa72k
         AZTD9e8+5YuFu3gclwA0mQ5dwwW+47A5bWnnwMZw1kuDkF3dMoRboXR6LX3pO+2cMc3N
         MYiw==
X-Forwarded-Encrypted: i=1; AJvYcCXfscVbs216xR8Olt8f136uG/NfOtCt0cYedQUrED4S15ODC81K/Fq4hpwukPdkjBGyZaflYfz2+RsuJIN6@vger.kernel.org
X-Gm-Message-State: AOJu0YyCEjhVPoJN+LBmL83ivMUCRxSbBjuEjhMObLKQQYN5szF9whTp
	a2VDp5saQpwYo4fKXyU7NPJK7NIRL13e5uimQ0muQj2YRnvLIJKaIhpFdDcbxW4gLrNTISjVwHy
	Q
X-Gm-Gg: ASbGncsn+x9KdX4HJA5Xay9zhutB359eeeFPgYCMdePnKKtCLT1pPf8xpKg6CywANKM
	8ZbkJts4OxW3AfwMmJIxA7Sp6b/GIRk7QRgX3XUEw8GhSHexGraPv6uoKjZ9ZBNkwCutuwKZz1B
	w4K4KB2yZba6Ifxz+w4vi19hJL+6RKyB6wEKJTDMJtVSquMGukBAEVD8vm6lg1Y1Xsjqx2yte6W
	nO9HKa7FiCAgXlIsAaTrwBfPyCq2bZ8ndESRzDSP9sjL0N5gyPJ+pImF/zRyxyeF9g0GsBzyEiO
	MXpKagqH3Jne2wwRrHtQ6OB3k1QV2w==
X-Google-Smtp-Source: AGHT+IFwjlsNqlDKOJ2KJydHznaSKvB/vcfjJMFz80/Xir4D/PJioG03rVbSHX2IxiqPAUjyxM00qw==
X-Received: by 2002:a2e:a54b:0:b0:2fb:8777:7359 with SMTP id 38308e7fff4ca-2ffd611bf55mr113551871fa.39.1733143693651;
        Mon, 02 Dec 2024 04:48:13 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfbeb95bsm12841481fa.36.2024.12.02.04.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 04:48:12 -0800 (PST)
Date: Mon, 2 Dec 2024 14:48:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, srinivas.kandagatla@linaro.org, 
	linux-arm-msm@vger.kernel.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 4/4] misc: fastrpc: Add debugfs support for fastrpc
Message-ID: <nsaq3zungvyhuikz35arvxmle2fovxh422jpyqxuleh57ufqnk@bekeh7qr7y76>
References: <20241118084046.3201290-1-quic_ekangupt@quicinc.com>
 <20241118084046.3201290-5-quic_ekangupt@quicinc.com>
 <2024111804-doze-reflected-0feb@gregkh>
 <c3b285b0-33d1-4bfa-b8ab-6783ff5ed78d@quicinc.com>
 <cn7pqvhw4x4y7s5hbgzjpvyjnw4g6hoyepic4jai7x2fjdenxr@ikr4hkorbuwb>
 <365c4709-b421-4af8-b521-a195630242de@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <365c4709-b421-4af8-b521-a195630242de@quicinc.com>

On Mon, Dec 02, 2024 at 03:27:43PM +0530, Ekansh Gupta wrote:
> 
> 
> On 11/22/2024 12:23 AM, Dmitry Baryshkov wrote:
> > On Thu, Nov 21, 2024 at 12:12:17PM +0530, Ekansh Gupta wrote:
> >>
> >> On 11/18/2024 7:32 PM, Greg KH wrote:
> >>> On Mon, Nov 18, 2024 at 02:10:46PM +0530, Ekansh Gupta wrote:
> >>>> Add changes to support debugfs. The fastrpc directory will be
> >>>> created which will carry debugfs files for all fastrpc processes.
> >>>> The information of fastrpc user and channel contexts are getting
> >>>> captured as part of this change.
> >>>>
> >>>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >>>> ---
> >>>>  drivers/misc/fastrpc/Makefile        |   3 +-
> >>>>  drivers/misc/fastrpc/fastrpc_debug.c | 156 +++++++++++++++++++++++++++
> >>>>  drivers/misc/fastrpc/fastrpc_debug.h |  31 ++++++
> >>>>  drivers/misc/fastrpc/fastrpc_main.c  |  18 +++-
> >>>>  4 files changed, 205 insertions(+), 3 deletions(-)
> >>>>  create mode 100644 drivers/misc/fastrpc/fastrpc_debug.c
> >>>>  create mode 100644 drivers/misc/fastrpc/fastrpc_debug.h
> >>>>
> >>>> diff --git a/drivers/misc/fastrpc/Makefile b/drivers/misc/fastrpc/Makefile
> >>>> index 020d30789a80..4ff6b64166ae 100644
> >>>> --- a/drivers/misc/fastrpc/Makefile
> >>>> +++ b/drivers/misc/fastrpc/Makefile
> >>>> @@ -1,3 +1,4 @@
> >>>>  # SPDX-License-Identifier: GPL-2.0
> >>>>  obj-$(CONFIG_QCOM_FASTRPC)	+= fastrpc.o
> >>>> -fastrpc-objs	:= fastrpc_main.o
> >>>> \ No newline at end of file
> >>>> +fastrpc-objs	:= fastrpc_main.o \
> >>>> +		fastrpc_debug.o
> >>> Only build this file if debugfs is enabled.
> >>>
> >>> And again, "debug.c"?
> >> I'll add change to build this only if debugfs is enabled. Going forward I have plans to add
> >> few more debug specific changes, maybe then I'll need to change the build rules again.
> >>>> diff --git a/drivers/misc/fastrpc/fastrpc_debug.c b/drivers/misc/fastrpc/fastrpc_debug.c
> >>>> new file mode 100644
> >>>> index 000000000000..cdb4fc6845a8
> >>>> --- /dev/null
> >>>> +++ b/drivers/misc/fastrpc/fastrpc_debug.c
> >>>> @@ -0,0 +1,156 @@
> >>>> +// SPDX-License-Identifier: GPL-2.0
> >>>> +// Copyright (c) 2024 Qualcomm Innovation Center.
> >>>> +
> >>>> +#include <linux/debugfs.h>
> >>>> +#include <linux/seq_file.h>
> >>>> +#include "fastrpc_shared.h"
> >>>> +#include "fastrpc_debug.h"
> >>>> +
> >>>> +#ifdef CONFIG_DEBUG_FS
> >>> Please put the #ifdef in the .h file, not in the .c file.
> >> Ack
> >>>> +void fastrpc_create_user_debugfs(struct fastrpc_user *fl)
> >>>> +{
> >>>> +	char cur_comm[TASK_COMM_LEN];
> >>>> +	int domain_id, size;
> >>>> +	char *debugfs_buf;
> >>>> +	struct dentry *debugfs_dir = fl->cctx->debugfs_dir;
> >>>> +
> >>>> +	memcpy(cur_comm, current->comm, TASK_COMM_LEN);
> >>>> +	cur_comm[TASK_COMM_LEN-1] = '\0';
> >>>> +	if (debugfs_dir != NULL) {
> >>>> +		domain_id = fl->cctx->domain_id;
> >>>> +		size = snprintf(NULL, 0, "%.10s_%d_%d_%d", cur_comm,
> >>>> +				current->pid, fl->tgid, domain_id) + 1;
> >>>> +		debugfs_buf = kzalloc(size, GFP_KERNEL);
> >>>> +		if (debugfs_buf == NULL)
> >>>> +			return;
> >>>> +		/*
> >>>> +		 * Use HLOS process name, HLOS PID, fastrpc user TGID,
> >>>> +		 * domain_id in debugfs filename to create unique file name
> >>>> +		 */
> >>>> +		snprintf(debugfs_buf, size, "%.10s_%d_%d_%d",
> >>>> +			cur_comm, current->pid, fl->tgid, domain_id);
> >>>> +		fl->debugfs_file = debugfs_create_file(debugfs_buf, 0644,
> >>>> +				debugfs_dir, fl, &fastrpc_debugfs_fops);
> >>> Why are you saving the debugfs file?  What do you need to do with it
> >>> that you can't just delete the whole directory, or look up the name
> >>> again in the future when removing it?
> >> fl structure is specific to a process using fastrpc driver. The reason to save
> >> this debugfs file is to delete is when the process releases fastrpc device.
> >> If the file is not deleted, it might flood multiple files in debugfs directory.
> >>
> >> As part of this change, only the file that is getting created by a process is
> >> getting removed when process is releasing device and I don't think we
> >> can clean up the whole directory at this point.
> > My 2c: it might be better to create a single file that conains
> > information for all the processes instead of that. Or use fdinfo data to
> > export process / FD information to userspace.
> Thanks for your review. The reason of not having single file for all processes is that
> I can run 100s of iteration for any process(say calculator) and every time the properties
> of the process can differ(like buffer, session etc.). For this reason, I'm creating and
> deleting the debugfs files for every process run.
> 
> Do you see any advantage of using fdinfo over debugfs? I'm not sure if we can add all
> the information(like in debugfs) here.

Which information is actually useful / interesting for application
developers? If not for the fdinfo, I might still vote for a single file
rather than a pile of per-process data.

> 
> --ekansh
> >
> >
> 

-- 
With best wishes
Dmitry

