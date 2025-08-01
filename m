Return-Path: <linux-arm-msm+bounces-67332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 800A3B17FBA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 11:57:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B257D7A6957
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 09:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ACE3226D00;
	Fri,  1 Aug 2025 09:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qaIYTcZS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E17A20F087
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 09:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754042267; cv=none; b=NKlBV+jHhwuECCyX58MT96EJemR8DemiOSPmtoI5CNKafXaADM7gxmnPssVUQV7XiYjiQFDGGfgUWnJg1qop7fGUQEyvjSHLdRdtL5hlweXYQ9RisdwXNJzVWGrYU+tnI0IPjphTGtoczPjlPKQF4WeTC6c6hVWcTMObjicnosI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754042267; c=relaxed/simple;
	bh=sZOOR57Yve7+VvLNzoRvCeWxbTSvOUWtNN9jpE3cmxc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lZUR6qx/jCioA5Ea9GOm5HO1jGF4E2mVObMjR0gd87+iQZta05zfDo0mVUCgzFMBUazKAfaBa7McId2o9f3i+ocAF15pU67KtC1K4WN0Yd8WjZBjk6Y1j0h+RT/y7etv0NfJRuZUNzp1gwfPtfL0Yqmjr96FBciefnBuxO6V0PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qaIYTcZS; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b78d337dd9so406425f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 02:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754042263; x=1754647063; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VbBODNH9DSThm5SeIXhQXJFSfFVhTqqwIgLxqRhp64U=;
        b=qaIYTcZSiUNUOD15W1d9W6/ZICathuLIX08WElKyA8jwq6Sh8MAsRsgu7xmbDBZBpi
         JIG/ipcBZYQfCIPxOtJg3k2Dv04aZ+k7tKHxrXDVoWiaKsqu1r463BrTaNp9vPjGkyLP
         ijsorrmYD8q6nVnQYBEnPMga//gmdHCJ09viWd2yX/WRLLvBa/YwCb2Qp21w2aVZAxwk
         wUWGzD1Fi8WYoH/cLd9S/ufz84mRwpkKR4RG+n+stGVuBvGmKf/qMIyh4iUeFDdyWlET
         0QYmj6fWrwX3HkFmHl71hZZQR2wwdayYaqNve12bHL75SIlR/8LH00SrGqYIrkVsBQZB
         lN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754042263; x=1754647063;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VbBODNH9DSThm5SeIXhQXJFSfFVhTqqwIgLxqRhp64U=;
        b=BvEu96huenfydtb85R45/gOENJV1r4hGepkDoID1ZyMqw8IAjJ3oebDsUMBVFnq9Kq
         XLHtXeKMKxYeSa1r36niG3JUtK+8X+TTHmp69zR+apTQjU9DrsrvZ03RTxAA/Dq4QWNa
         Hm/nVUG20jDT75E3RN6fkk++fEz8zXjdreyrxflRqvP9+UKOjLhf+YUUJZcpHd3C+1XR
         onxxaiSQGIVsdCKgm5TYMYWqnpY7cXswVC3GCKsSQ9ofTE7NBAUe7Zs7xvKCjuSi7jmk
         YTz8856kdfCYUgSm/9I5XuxqEZ3AzW4G++Fw/p+e8dQumQnn46e3KXLWBMhnoEoWQr13
         u3qA==
X-Gm-Message-State: AOJu0Yyp6FJ3KrZr8HdWOrE/mFEHvfreTc8lHGtmkXah87my3lgHOTPJ
	DTtqRlFp54DG7CDrrareUytyJszLKYacYvNNBXFyLf8tWQ7A8MqNOYDcB1ZVMtmkM8M=
X-Gm-Gg: ASbGncvfbonypdovTNqZwlIUWwmJSAnKB0xRCkusyRsYxLeXN0XR9oChm9g8PhxPHdS
	DOYOw9WrAeQymwOMDii9juNt6jNcHQ8XYhrjsNG0CcApFrVX6pzTHOV2f/PIbCVG4UoWhxgvKOl
	bO7mgXJcrqMBD1YRAI7qKSRiV4WUGdFY7Z8bZlfNqQD3plGyWOxRQmTPfbs1EsGNUoDvWnu4CoK
	fUjdqRt3plYzbCXey7lC5oc1gL+SzjMrGHpdyOy4dQJNTxDKDkXbCKmlJwLrhzw7pFVqCN9z8ei
	OsNdGAV5P6JcX8URBfInoG6z5sMQhfgPQ35UvcBDh4mPh5ExCKM9ot55PkblDY7rw7B6W9Mwoze
	y6H02AjacI1HNenL7KGdCiEBdbF+ZySUmRY1rjA==
X-Google-Smtp-Source: AGHT+IHzyoDcCiL+JPwQRfpK5ouMx59bmsQZVcTlRlpf7ucs7d1aEnm3ysW/zjth+CEaShGfegwMlQ==
X-Received: by 2002:a5d:64c7:0:b0:3a4:f975:30f7 with SMTP id ffacd0b85a97d-3b79501ecb9mr8611991f8f.56.1754042263555;
        Fri, 01 Aug 2025 02:57:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-458953cfe56sm102692665e9.20.2025.08.01.02.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 02:57:43 -0700 (PDT)
Date: Fri, 1 Aug 2025 12:57:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [bug report] drm/msm: Take lru lock once per submit_pin_objects()
Message-ID: <aIyPkrQl0YPu5ke2@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Rob Clark,

Commit fc896cf3d691 ("drm/msm: Take lru lock once per
submit_pin_objects()") from Aug 2, 2023 (linux-next), leads to the
following Smatch static checker warning:

	drivers/gpu/drm/msm/msm_gem.c:565 get_and_pin_iova_range_locked()
	warn: sleeping in atomic context

drivers/gpu/drm/msm/msm_gem.c
    546 static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
    547                                          struct drm_gpuvm *vm, uint64_t *iova,
    548                                          u64 range_start, u64 range_end)
    549 {
    550         struct drm_gpuva *vma;
    551         int ret;
    552 
    553         msm_gem_assert_locked(obj);
    554 
    555         if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
    556                 return -EINVAL;
    557 
    558         vma = get_vma_locked(obj, vm, range_start, range_end);
    559         if (IS_ERR(vma))
    560                 return PTR_ERR(vma);
    561 
    562         ret = msm_gem_pin_vma_locked(obj, vma);
    563         if (!ret) {
    564                 *iova = vma->va.addr;
--> 565                 pin_obj_locked(obj);
                        ^^^^^^^^^^^^^^^^^^^^
This takes a mutex but Smatch thinks we're already holding a spinlock.

    566         }
    567 
    568         return ret;
    569 }

The call tree is:

update_cursor() <- disables preempt
-> msm_gem_get_and_pin_iova()
   -> msm_gem_get_and_pin_iova_range()
      -> get_and_pin_iova_range_locked()

The update_cursor() function is holding
	spin_lock_irqsave(&mdp4_crtc->cursor.lock, flags);

regards,
dan carpenter

