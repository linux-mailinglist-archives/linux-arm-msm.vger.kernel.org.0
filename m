Return-Path: <linux-arm-msm+bounces-20093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5698CA73D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 06:12:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D5EA1F21641
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 04:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BABD91DA53;
	Tue, 21 May 2024 04:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TCJteCuG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0316FDC
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2024 04:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716264762; cv=none; b=MrLvzASI6Juk1fof+CV+PQZn/ebSAxjKyFFaUc2SbDN5P9a0OjniXCYGcxOCz2E+1MrpADYnPwqr0ay72lUE5lrBDCZPjwAKKNsNpRBtZgNJBCOgjXkwzBFV4838cFasjIRJzI4qhJbCS6IoryLDpP2E5ymJQSMJyQl6I7rTcO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716264762; c=relaxed/simple;
	bh=O92KeYUkA1edHwlwkgSl2dByMiiKmyF/6D5jrMUsaIQ=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DnzQ7FBOhIgND4tYkCSSiBLZztiqY49y8kIj6TkeaXO4UlwJ67gkzTCKw6XbZfJ/L0XW2Yy8ep1WCL/7PRbahyCSewTnI60p05gAYOzIRmujouwuiG+tI2KuOtSdqniS9E+IE3EzUyGOkvqIOWB2lZ1ZS2vgB33424dZnVnMsac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TCJteCuG; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-792d65cd7a8so190427685a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2024 21:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716264760; x=1716869560; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDK8WDfUBYYirSWO06T0TVOheARrNR/0B8M0BZ3uAqU=;
        b=TCJteCuGSX2EXaKRCsBoBMOb5dK/dicBSL/0kUkHsR5XHVrmHiW4JVmw6yw6n/CBUV
         fCjAnIeV/ERNQw6Vt5mn1GKy55xVI5VxFbyPfmMJK/SMRciX+IPrbIeyMZlZOMlrRsAu
         1ASGpxwwtPo5n8+cPwJ+EGutcFouHcM+wSIL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716264760; x=1716869560;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDK8WDfUBYYirSWO06T0TVOheARrNR/0B8M0BZ3uAqU=;
        b=W+LDqo/rYbATIOPSvfYaDmnL579aL6xSbsPsYC6hR/PFcJOXdghVd0Vsfgy9bUnj+n
         nCN33R71j5YIrkAz9l+1+l8dx6eV8BrFhExvDepxnzHuVRty7moWqBXzgUjy07X5KpXs
         q8iHl/7bQmsQOJelT+Q0fxyvxrODd1mc04TpyLZ+cITi0NAYiha0GOos2W5lsxWzjeaa
         /gP10M/n0xKBqwKSSfdJ6VLZSmpub6vN752/dt+WHfSocuhaLm3zAe/h7IVVbJL+4Mf7
         7+MXd1nF8O54BVFnx0VQe5cmhpg9qzDseb3cYoa47dsJEGTg1g/2IJ3L00J6LFQYALgW
         lhDg==
X-Forwarded-Encrypted: i=1; AJvYcCXkMBt/sqoaK6RBoF/mbk7opaCbiLMMHY3gY1ffhXN+GI59dw7R4jveFGKSpR62k+NQBZ/X2sIYfsXffZZW244laO/RhnyPNvKwxHf67w==
X-Gm-Message-State: AOJu0YwHI3KlweHrTRqKQ7wZ2yHEfAtGXgvl2i3eY7ugvPc8WfYLEjyA
	R7JuCf1DFPMXN7d9wQLS4rcgTOJmQy+iLlFlic8+XWYAx0DzS2hzs/TjrkC1MF0gaXEOGOnw6PG
	XjBXHnNepNWNIACOYxNZBTqVXJXtiaBni4RUD
X-Google-Smtp-Source: AGHT+IH+wekBZ0lrLtGQB1o7O9rCbCkIv21Dk0Sq8vPde6mos/k0ulEy29KCnMHFyBn7FO/k9cX+aqOaPP9RXBhho0Q=
X-Received: by 2002:a05:620a:280e:b0:793:b91:2dbe with SMTP id
 af79cd13be357-7930b912e08mr1615135785a.40.1716264760099; Mon, 20 May 2024
 21:12:40 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 May 2024 00:12:39 -0400
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240517233801.4071868-2-quic_abhinavk@quicinc.com>
References: <20240517233801.4071868-1-quic_abhinavk@quicinc.com> <20240517233801.4071868-2-quic_abhinavk@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 21 May 2024 00:12:39 -0400
Message-ID: <CAE-0n517DSbNim+K3=N2J2R0iZn44MS3siLKkhdLq05GTfaHtQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] drm/msm: register a fault handler for display mmu faults
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, seanpaul@chromium.org, 
	dianders@chromium.org, quic_jesszhan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Abhinav Kumar (2024-05-17 16:37:56)
> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
> index af6a6fcb1173..62c8e6163e81 100644
> --- a/drivers/gpu/drm/msm/msm_kms.c
> +++ b/drivers/gpu/drm/msm/msm_kms.c
> @@ -200,6 +200,28 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
>         return aspace;
>  }
>
> +static int msm_kms_fault_handler(void *arg, unsigned long iova, int flags, void *data)
> +{
> +       struct msm_kms *kms = arg;
> +       struct msm_disp_state *state;
> +       int ret;
> +
> +       ret = mutex_lock_interruptible(&kms->dump_mutex);

From past experience I've seen the smmu fault handler called in hardirq
context, so it can't sleep. Is there some way to grab the register
contents without sleeping? Otherwise this will have to fork off
somewhere else that can take locks, runtime PM resume, etc.

> +       if (ret)
> +               return ret;
> +
> +       state = msm_disp_snapshot_state_sync(kms);
> +
> +       mutex_unlock(&kms->dump_mutex);
> +

