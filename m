Return-Path: <linux-arm-msm+bounces-67432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E267B18B28
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Aug 2025 09:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2233B7A2B32
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Aug 2025 07:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F04211D7E5C;
	Sat,  2 Aug 2025 07:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nWcLDD3C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F102DB672
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Aug 2025 07:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754120952; cv=none; b=Drv2DCTGdFhKOyGxc7M8z0coGEAxf8ASE44TYG6ltgqP31OAsPhTXthJL5ZHix+NJK3L/f86+J1zBOLdlQIknAjaBnP9zOVTCLdFcf6UuDnpShBJ8tmn9b575vLB2Bh2qidXc66gSVR08vnMb9sKG4zv9OK2LF0aMMc8VTy9fVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754120952; c=relaxed/simple;
	bh=FKoaYGmRsPRckL1AeXo4OmW7KRxANmO5Jwe8b6B0G0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eO6AwPe+tTecv0GV2WXUMJJ5zw7NE3ITmcJLSvobutnY3CA1J+KguMGIlMKiauDwL1vzf3wMpolrARXdEv9ATlco2miolSo6dXGe7SEBoB+ogNrM+9+MwDYClt0+fLo88BZAN4CSCq0H+eT6urdwHFGeeVTsmxIh4Xq9aXCSNc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nWcLDD3C; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b8de193b60so35755f8f.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Aug 2025 00:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754120949; x=1754725749; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jc41eAaTwlF+ilpjGXVXKV/B+JMC260AXywvrCae45I=;
        b=nWcLDD3C0sGcuFAqvz9pKNNqFQePsEtAxi9rOO1eZ0EyXWlauPm+/YjDFrcg01Efg9
         9oaOwOYge6jjjKYSc5/FXq1eqpIRsf0/KM9TFbKPY3D40ZlD1ytu5CRWPH7guy10OAjw
         lqLTrGawOmutI9TUDww9QSoB8pKpHeR8eKWlQ2c6eBDq9vPxIht9/YRUiDzcmtgJaXL8
         P6VOgeqVZaPTW0m+XSe6ZmLLaz1iDF52REcuw0CyRtKcS/TxKpUqSBNR9aOGO1p6SsjC
         0XTdwaquHRgv/NkivDgpUxjtUBCAG+xGFJheKboy4o/u/bAH+xydOv6j2m/zxtnoYqDV
         KlsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754120949; x=1754725749;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jc41eAaTwlF+ilpjGXVXKV/B+JMC260AXywvrCae45I=;
        b=JCNAKWrp2lurEKv+gFQPMUlcjfkxlDz24M9pk9Jh6/TdtpMPNr4krelhJ5FDM5nZG7
         Tvmgrbyc0iPMqAO+ZULrGukJ4OeTneGAN4pqtKyI246gvms9FJz77ALz79OF7Nyaphgg
         BTG1eYDwViwVNow9HjCmGixWGmDaccI9qjUQeHyfQhOnA9uPALRaxI65Os9O5cjRanRE
         UmVBkX2WAYitgIyDEr/5KKzRBpBp/KLsz0IvBlIybowMrfG7VuqRoHllB62GakoJHe8U
         at6n73MX5CxPfnr258qUdjIs2lxRd1Qa5b6v/JqA7ijo2jlGsXmvcBekB1D07iBX3BKM
         ALCA==
X-Forwarded-Encrypted: i=1; AJvYcCWH0n2oVRomruKWmNeEgyFxZsG+HoyczTbz3u72f6h5uQYbOvTGQVwYKHnwyd6fPrALhvLxOirSFHm2Gg0v@vger.kernel.org
X-Gm-Message-State: AOJu0YwciUSGZIQ5XAgT0vYo+LRRS5mMFWO+049vAtNnWTO3Eu4Relvs
	8sBG+JP6oLUHmKXoEqbuX7J4wdjSmLCGSuGiA7CJcXEKV23IcuDBoj7MLEfeYFDMgAg=
X-Gm-Gg: ASbGncuFkqhxxeEzN56mPrN4jGkTnr2VykZmVlVK3XGa1jMx4N/oELSctUJEU9O1kCY
	ObB1vT0YF5WIvYsb/+GH65hmJpRwKWJmjG2aWykJ33GKqVlgTyl3y7hOF3Cw4J72nuSAmFvHfyD
	mSeWlVxrDgqq5NikEGfeyq9KFDTUxDO/GdFzrv9q7OKjmO9/oVBQQm5NVCa+J5tv02C9Rg0n6vP
	XJsdSTpOWPcjiHkteg8+vwmILWPQzMWaJpNrPwnZj9H7rWPnJyfbFAPILDKWWjk3/EENhX2+iJF
	8TzkM1JD3542JvO+/KQibFtmoyMRcqgMHRZNB2cqkHUyThD4vpqV8pLJhzVb50l1LiUd/03bYRo
	tH6yaoaRsf7MiVKS9aWmgmIXGhz4=
X-Google-Smtp-Source: AGHT+IGJDg+6ps6Mjc9ekjWCPSzQ0GJRPDNUWN8QdOsqxwaMblKCLjyVVDDVhNK92I/A+0L9596+VQ==
X-Received: by 2002:a05:6000:258a:b0:3b7:8984:5134 with SMTP id ffacd0b85a97d-3b8d94708c7mr1655077f8f.16.1754120949205;
        Sat, 02 Aug 2025 00:49:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-458bc39e694sm9541765e9.19.2025.08.02.00.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 00:49:08 -0700 (PDT)
Date: Sat, 2 Aug 2025 10:49:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [bug report] drm/msm: Add VM_BIND ioctl
Message-ID: <aI3C8c4iR3PmIMGE@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Rob Clark,

Commit 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl") from Jun 29, 2025
(linux-next), leads to the following Smatch static checker warning:

	drivers/gpu/drm/msm/msm_gem_vma.c:596 msm_gem_vm_sm_step_remap()
	error: we previously assumed 'vm_bo' could be null (see line 564)

drivers/gpu/drm/msm/msm_gem_vma.c
    521 static int
    522 msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
    523 {
    524         struct msm_vm_bind_job *job = ((struct op_arg *)arg)->job;
    525         struct drm_gpuvm *vm = job->vm;
    526         struct drm_gpuva *orig_vma = op->remap.unmap->va;
    527         struct drm_gpuva *prev_vma = NULL, *next_vma = NULL;
    528         struct drm_gpuvm_bo *vm_bo = orig_vma->vm_bo;
    529         bool mapped = to_msm_vma(orig_vma)->mapped;
    530         unsigned flags;
    531 
    532         vm_dbg("orig_vma: %p:%p:%p: %016llx %016llx", vm, orig_vma,
    533                orig_vma->gem.obj, orig_vma->va.addr, orig_vma->va.range);
    534 
    535         if (mapped) {
    536                 uint64_t unmap_start, unmap_range;
    537 
    538                 drm_gpuva_op_remap_to_unmap_range(&op->remap, &unmap_start, &unmap_range);
    539 
    540                 vm_op_enqueue(arg, (struct msm_vm_op){
    541                         .op = MSM_VM_OP_UNMAP,
    542                         .unmap = {
    543                                 .iova = unmap_start,
    544                                 .range = unmap_range,
    545                                 .queue_id = job->queue->id,
    546                         },
    547                         .obj = orig_vma->gem.obj,
    548                 });
    549 
    550                 /*
    551                  * Part of this GEM obj is still mapped, but we're going to kill the
    552                  * existing VMA and replace it with one or two new ones (ie. two if
    553                  * the unmapped range is in the middle of the existing (unmap) VMA).
    554                  * So just set the state to unmapped:
    555                  */
    556                 to_msm_vma(orig_vma)->mapped = false;
    557         }
    558 
    559         /*
    560          * Hold a ref to the vm_bo between the msm_gem_vma_close() and the
    561          * creation of the new prev/next vma's, in case the vm_bo is tracked
    562          * in the VM's evict list:
    563          */
    564         if (vm_bo)
                ^^^^^^^^^^
NULL check

    565                 drm_gpuvm_bo_get(vm_bo);
    566 
    567         /*
    568          * The prev_vma and/or next_vma are replacing the unmapped vma, and
    569          * therefore should preserve it's flags:
    570          */
    571         flags = orig_vma->flags;
    572 
    573         msm_gem_vma_close(orig_vma);
    574 
    575         if (op->remap.prev) {
    576                 prev_vma = vma_from_op(arg, op->remap.prev);
    577                 if (WARN_ON(IS_ERR(prev_vma)))
    578                         return PTR_ERR(prev_vma);
    579 
    580                 vm_dbg("prev_vma: %p:%p: %016llx %016llx", vm, prev_vma, prev_vma->va.addr, prev_vma->va.range);
    581                 to_msm_vma(prev_vma)->mapped = mapped;
    582                 prev_vma->flags = flags;
    583         }
    584 
    585         if (op->remap.next) {
    586                 next_vma = vma_from_op(arg, op->remap.next);
    587                 if (WARN_ON(IS_ERR(next_vma)))
    588                         return PTR_ERR(next_vma);
    589 
    590                 vm_dbg("next_vma: %p:%p: %016llx %016llx", vm, next_vma, next_vma->va.addr, next_vma->va.range);
    591                 to_msm_vma(next_vma)->mapped = mapped;
    592                 next_vma->flags = flags;
    593         }
    594 
    595         if (!mapped)
--> 596                 drm_gpuvm_bo_evict(vm_bo, true);
                                           ^^^^^
Unchecked dereference.  Possibly if we're not mapped then it's non-NULL?
If so then just ignore this warning.

    597 
    598         /* Drop the previous ref: */
    599         drm_gpuvm_bo_put(vm_bo);
    600 
    601         return 0;
    602 }

regards,
dan carpenter

