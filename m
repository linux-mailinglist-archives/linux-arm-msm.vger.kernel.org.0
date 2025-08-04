Return-Path: <linux-arm-msm+bounces-67643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66895B19C03
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 09:13:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86D03164AE6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 07:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14660235341;
	Mon,  4 Aug 2025 07:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dI3JTdWd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA68E231A41
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 07:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754291580; cv=none; b=l77LGImtsYmPNYPChzyLHlk6CqH4xbU3yaHABa6I8gYmM9OiB76HqvsYkl0W7QJetbYTEQU7ixz8LkMLMoT1vNt6nVEGsdeFvryFVsMcPorOV0SWYMmTz8gAJbSDBeP1N5ARCjtWvsL+HOl1hTJJr4qu/gCVTHN1IvKrA+e/BKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754291580; c=relaxed/simple;
	bh=xdYC72JJ3u7htZOUKbGLZ63oYKk+KQB1VjUcZKlqCvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aI7Y5RC54MocxVQzj35xT10OokRcDU1c35JsSW7GobooN9h8IwNLF5PaP7z2f91IsiJxHw+mH1AO9wm/qnJdQvH80au+tyKW55r2kJ/bVJSeZltZ5erItNV6wa/ZXXs79flSEd8guJI68FGxjOvIArooSn1tA9tqm+GpRezBLVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dI3JTdWd; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-458baf449cbso16229455e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 00:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754291576; x=1754896376; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pins6pCk0Fa4rQAmFrWg25RZups1O5EoRcd2l2gX4sE=;
        b=dI3JTdWdcQXT5UkUPZo5H9gekxJUmWBn5GkO0LPQIoz10j8u3fI6O7o5xFhn12oFK+
         KAJwYK8GLOKOe5BaZVN4qk1wdGhOuac41/Yrxon48nOqhFrIC00B+y1ewagDuBb1Rgor
         vs7/iYuzbZEcBK5OR9GatC+9SS3IpbR1CARLo+Ap7orxdleQ6eJLYMzLP8WVleM+z2Vf
         ChFKhe+I80Oi47DvQiVDLC6QeCvF1Mhr1mZ1NRVU0pljD6N+Amm702YbyxzUIBOMXCo+
         ifduf6J7hczywcLl7hvlC2DtihUTqmoH6Y/T8QDe5rjyON5duIBfkJjvi+bCkviS9Mrr
         gITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754291576; x=1754896376;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pins6pCk0Fa4rQAmFrWg25RZups1O5EoRcd2l2gX4sE=;
        b=CaS/Ozf+lzSxrx9aZ0TbrIRyo1C3ZuwMxF4GaMiI5mQYR5GcyPfzyR6GD52ul/Lw5g
         MOCnXltHZVz5bwhoP5LaeZD9ZBR9FtqW4nW7E1ZEXiWEWz/cMU56dGtDvQQPpmas5Nin
         L38FbBrwY0IAK7suSyeXEM6Vn83dNrnnPriP6D3onqpc7OQwLJHCh+k6jF5V425ERvLh
         TaBg5oNLs3R5Ifk4OHTH8H9tYJ0HjjbHuaC/vwCVfJmeqIKXAkeXZha/2+LbRApkcDNZ
         Ang7u2ZxLMpgGStQYMz84mqUtbDQm3cj5TzqjGN4509q3SMjZexNYTKAhd+AEGKHpEQN
         WHog==
X-Forwarded-Encrypted: i=1; AJvYcCUOEy4YOkH44MWqTF5g3Y6rsSS5kn281nZ0w5pNKHt23ORbHqYDEBtyQP5N2w2Vme0w3EnJ4WQ9RzuaJhzZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw86EiSGMAQcVzc4g8clbsBYh2LS0tB99oHk+kNrHMyo17CD6m
	kpthjMzii26DkxgkK7MmK/9Zt6D1H7ASHKtum4t1Nj2PzniqFiOGV/cfgYUAiOc0jA4=
X-Gm-Gg: ASbGncsjva8pKvUNMIuGJXoxMymdExaicgazvpqjCiORUHnzflzsjTSzr6Krl1lo1g+
	nKhSH/L/sxAXgPcPhAw8fA9SZYYN6pKdutEQcp7654YSyMngiizDMtD8cPM2eW1y4yO0DWo9WFa
	XWXwleNoixIRxG1KnyyeQlcIsN0Vaazsj0OQJafWa0waCZBgW3yL8c26xZ3UGO9eLdug52MvrYm
	Wamgpl8SMaNDvqoBI+hyKapXC7N/bJYK+pL8BIrYWhR9u16koHjps9dl+GDAU35jagzW9iWvPvT
	N75781uNJdMnkfdGEr84rJKya2oHY87SkHRBfrutz6DmD8hEZeWODi7puG5ma5WCPJeSlz8mdn6
	Nz3RhCxMX1YhsakLHMnamW556khU=
X-Google-Smtp-Source: AGHT+IFRLwySDJxGy6saRiUmoXuk2+5KeKGSB+JTT7r9m1nznyH/1R8mONHfgSxX/9MUe5BEsJDY3w==
X-Received: by 2002:a05:600c:4450:b0:453:9b7:c214 with SMTP id 5b1f17b1804b1-458b6b43c1cmr59832095e9.29.1754291576213;
        Mon, 04 Aug 2025 00:12:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458953cfcc1sm203814495e9.17.2025.08.04.00.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 00:12:55 -0700 (PDT)
Date: Mon, 4 Aug 2025 10:12:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: Re: [bug report] drm/msm: Add VM_BIND ioctl
Message-ID: <6117eece-fe02-40e5-80f0-66003b85997d@suswa.mountain>
References: <aI3C8c4iR3PmIMGE@stanley.mountain>
 <CACSVV00Bv+P2rzi0Wpnxba8VCTiVT_kK3voRZEZJGKrupSbigA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV00Bv+P2rzi0Wpnxba8VCTiVT_kK3voRZEZJGKrupSbigA@mail.gmail.com>

On Sat, Aug 02, 2025 at 06:12:56AM -0700, Rob Clark wrote:
> On Sat, Aug 2, 2025 at 12:49 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > Hello Rob Clark,
> >
> > Commit 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl") from Jun 29, 2025
> > (linux-next), leads to the following Smatch static checker warning:
> >
> >         drivers/gpu/drm/msm/msm_gem_vma.c:596 msm_gem_vm_sm_step_remap()
> >         error: we previously assumed 'vm_bo' could be null (see line 564)
> >
> > drivers/gpu/drm/msm/msm_gem_vma.c
> >     521 static int
> >     522 msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
> >     523 {
> >     524         struct msm_vm_bind_job *job = ((struct op_arg *)arg)->job;
> >     525         struct drm_gpuvm *vm = job->vm;
> >     526         struct drm_gpuva *orig_vma = op->remap.unmap->va;
> >     527         struct drm_gpuva *prev_vma = NULL, *next_vma = NULL;
> >     528         struct drm_gpuvm_bo *vm_bo = orig_vma->vm_bo;
> >     529         bool mapped = to_msm_vma(orig_vma)->mapped;
> >     530         unsigned flags;
> >     531
> >     532         vm_dbg("orig_vma: %p:%p:%p: %016llx %016llx", vm, orig_vma,
> >     533                orig_vma->gem.obj, orig_vma->va.addr, orig_vma->va.range);
> >     534
> >     535         if (mapped) {
> >     536                 uint64_t unmap_start, unmap_range;
> >     537
> >     538                 drm_gpuva_op_remap_to_unmap_range(&op->remap, &unmap_start, &unmap_range);
> >     539
> >     540                 vm_op_enqueue(arg, (struct msm_vm_op){
> >     541                         .op = MSM_VM_OP_UNMAP,
> >     542                         .unmap = {
> >     543                                 .iova = unmap_start,
> >     544                                 .range = unmap_range,
> >     545                                 .queue_id = job->queue->id,
> >     546                         },
> >     547                         .obj = orig_vma->gem.obj,
> >     548                 });
> >     549
> >     550                 /*
> >     551                  * Part of this GEM obj is still mapped, but we're going to kill the
> >     552                  * existing VMA and replace it with one or two new ones (ie. two if
> >     553                  * the unmapped range is in the middle of the existing (unmap) VMA).
> >     554                  * So just set the state to unmapped:
> >     555                  */
> >     556                 to_msm_vma(orig_vma)->mapped = false;
> >     557         }
> >     558
> >     559         /*
> >     560          * Hold a ref to the vm_bo between the msm_gem_vma_close() and the
> >     561          * creation of the new prev/next vma's, in case the vm_bo is tracked
> >     562          * in the VM's evict list:
> >     563          */
> >     564         if (vm_bo)
> >                 ^^^^^^^^^^
> > NULL check
> >
> >     565                 drm_gpuvm_bo_get(vm_bo);
> >     566
> >     567         /*
> >     568          * The prev_vma and/or next_vma are replacing the unmapped vma, and
> >     569          * therefore should preserve it's flags:
> >     570          */
> >     571         flags = orig_vma->flags;
> >     572
> >     573         msm_gem_vma_close(orig_vma);
> >     574
> >     575         if (op->remap.prev) {
> >     576                 prev_vma = vma_from_op(arg, op->remap.prev);
> >     577                 if (WARN_ON(IS_ERR(prev_vma)))
> >     578                         return PTR_ERR(prev_vma);
> >     579
> >     580                 vm_dbg("prev_vma: %p:%p: %016llx %016llx", vm, prev_vma, prev_vma->va.addr, prev_vma->va.range);
> >     581                 to_msm_vma(prev_vma)->mapped = mapped;
> >     582                 prev_vma->flags = flags;
> >     583         }
> >     584
> >     585         if (op->remap.next) {
> >     586                 next_vma = vma_from_op(arg, op->remap.next);
> >     587                 if (WARN_ON(IS_ERR(next_vma)))
> >     588                         return PTR_ERR(next_vma);
> >     589
> >     590                 vm_dbg("next_vma: %p:%p: %016llx %016llx", vm, next_vma, next_vma->va.addr, next_vma->va.range);
> >     591                 to_msm_vma(next_vma)->mapped = mapped;
> >     592                 next_vma->flags = flags;
> >     593         }
> >     594
> >     595         if (!mapped)
> > --> 596                 drm_gpuvm_bo_evict(vm_bo, true);
> >                                            ^^^^^
> > Unchecked dereference.  Possibly if we're not mapped then it's non-NULL?
> > If so then just ignore this warning.
> 
> Correct, the !mapped case will only happen when the shrinker evicts
> BOs.  The case where the BO (and therefore vm_bo) is NULL, is MAP_NULL
> mappings which are backed by the PRR page, not a BO that can be
> evicted.
> 
> Would adding a WARN_ON(!vm_bo) convey to smatch that this case should
> not happen unless something somewhere else was rather screwed up?

No.  WARN_ON() doesn't mean something can't happen.  Just ignore it.
Old warnings are always false positives and if people have questions
they can find this thread on lore.

regards,
dan carpenter


