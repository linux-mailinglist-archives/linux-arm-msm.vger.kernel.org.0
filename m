Return-Path: <linux-arm-msm+bounces-10971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B01854409
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 09:29:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDD9B28B7E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 08:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DCCE125A8;
	Wed, 14 Feb 2024 08:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WbOf/DOz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F33E125A2
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 08:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707899393; cv=none; b=XYOG+L1VM8hC7LEYrEv9XqOjKb6F07Sqvt4sqC4/km25VG6AJu3dHcBvzm7l+ND57GjYQKfjjWGXM185PH75esq9AQmrRc+S65sIb2z6+z9GorI8Lvs9xOPsfpYxuRSl5c3LY/UUVEaCICAYhG0uDn9oE90v+4dtOTBJfYGPLIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707899393; c=relaxed/simple;
	bh=qChK1qQ6Od/4UgKn1tzFNFtQzd4F48tHVbIEhF5Dd4k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VFzv3lQbuDqmQtVCp+2cKD2NxVp1r+ksQZN5w6Ksv0Ujs73tc6Or+ZCP1q68QCmxNWhpMfzC+4MWLphLg6czo2XTGpNLpp7i0FnWTZpcT9QFYIgySElIvG2EKt0MOqeUhaaRvv2x4Kh9pc/6VV+RQduNf/NSds1omgJCVBQM/wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WbOf/DOz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707899390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vb/g1159e0DO4hnfKwx1FD37+ejv2muFNbaldYH/o+A=;
	b=WbOf/DOzNJhNMPt1goI1XfasuprSc8+6yRqXY2+0+0FI3xzI2wzSCo+VbOY8ioaoNgPjsi
	llvD91D00yfXBVyQ0+6Fv4J5hE6Ea6Pf+qzhOotylb2FW4cYu4EYkl6bgfwMyMS0b97Nii
	rjVWDPIp+sQTwF3osNqUEuxrDiAGzXs=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-4hdeFteBPpe5rocpo2sTuQ-1; Wed, 14 Feb 2024 03:29:48 -0500
X-MC-Unique: 4hdeFteBPpe5rocpo2sTuQ-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-511535180b4so4128051e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 00:29:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707899387; x=1708504187;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vb/g1159e0DO4hnfKwx1FD37+ejv2muFNbaldYH/o+A=;
        b=GH1gMZdKA5cQhuXgM/oNoBEpDU06Rg8puZ9XCFLpXMQShinlwvi1zteaKqgX7bIa12
         TtqJVvx2FhW0oD+VseS+G+W1HvpM35VLRwKm7Rzzs2n8gt2ea//678Pe9gQQox9oQvY7
         37tXkv+YReyTrTVtPofRMn5HgLr38Lg+EjpIKe1wsmt8gM8H3hfcFzRFgPvZqDGOB9Nw
         O22kD9KIzhBKWbg3KavSUgM6Z0bZYep+7BEdoCWrtTsP7Yxdu7b1qc+3HN8itRRl5BzT
         c74QDG8ZcJy3qBowlJwhIYrpPKbylHozbFakPhVyz2wC8BkbZ7YmQ7yIFgjj8x+r2w7y
         W88Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9HD3iHeCvMhuuyoGBC1m8LaVjrYgqDPAXDUwQ9/PW5kgfJWGz8OVw8S6K2u1xTWdfzJD8LaPKqlish5z2K+50PeQ3fuLDWg8zooO+Rg==
X-Gm-Message-State: AOJu0YwJa5JGB1dIFl4c5TxkAnntC2yeqa7J7uihJ2DiBQWM5BDUey2M
	+e4T1wMrGy9xfDO197JV1caRgibFrITLhsaZOuAvisfbCz0STHaHKHwibWBueWtj193go/kE8zP
	X2adRZNsZU7b4JGQhfVmWLuyMIyrtYkfeZM1G8CBc9K1iFS0rODdJPcUepf0jbUQ=
X-Received: by 2002:a05:6512:31d2:b0:511:6bbb:7ff4 with SMTP id j18-20020a05651231d200b005116bbb7ff4mr1650176lfe.28.1707899387161;
        Wed, 14 Feb 2024 00:29:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsLfgWG/30yrRsS8j6eyKwETXq3//aeDhjygzrlpII45P5KOddG3karYL+WkrkvZKL5sO5Sw==
X-Received: by 2002:a05:6512:31d2:b0:511:6bbb:7ff4 with SMTP id j18-20020a05651231d200b005116bbb7ff4mr1650160lfe.28.1707899386794;
        Wed, 14 Feb 2024 00:29:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVRJ5ra1Ww+fJK/5MMBRDzXr77JRTW+837gGQewt9e0TsXZDVffQkOcLqCpaO+UdjsKVB9ZOPD2U+h9i88g1DtSXMeY843Bt50MpnDUs4Lim21DIJXTf039lhSinIOjE7EqPwLfNc9D4R2/4h3RlF/pSPC5VDImI44l846EuDjqOKhRLUYXz1erKJabwn2k2f5UI+gudFD0p63bGI9JeTJ5MPSiTUA+AzcrQrPHMziCufhmxIsKt8n3IO0jNTEpdCo8jkReoJj56R5Xgn8j3gFCbTo3rQBVYNwOAoHIEJWvEl+RggDYFZ6Fb1rlO9RVWiYqkfwBNwGHoKgBivpCgj39F18nY8b4W6qztthYuIkracHTLCdiKk8lq3Zz8/XvX0MkG2+P9z6pwnaeGkSNoNWNRIELp1k=
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id az17-20020adfe191000000b0033b87c2725csm6133062wrb.104.2024.02.14.00.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 00:29:46 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Helen Koike <helen.koike@collabora.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] drm: ci: use clk_ignore_unused for apq8016
In-Reply-To: <20240213193931.2300211-1-dmitry.baryshkov@linaro.org>
References: <20240213193931.2300211-1-dmitry.baryshkov@linaro.org>
Date: Wed, 14 Feb 2024 09:29:45 +0100
Message-ID: <87plwzjvnq.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

Hello Dmitry,

> If the ADV7511 bridge driver is compiled as a module, while DRM_MSM is
> built-in, the clk_disable_unused congests with the runtime PM handling
> of the DSI PHY for the clk_prepare_lock(). This causes apq8016 runner to
> fail without completing any jobs ([1]). Drop the BM_CMDLINE which
> duplicate the command line from the .baremetal-igt-arm64 clause and
> enforce the clk_ignore_unused kernelarg instead to make apq8016 runner
> work.
>

Agree that this is the only practical option for the short term...

> [1] https://gitlab.freedesktop.org/drm/msm/-/jobs/54990475
>
> Fixes: 0119c894ab0d ("drm: Add initial ci/ subdirectory")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

>  drivers/gpu/drm/ci/test.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index 355b794ef2b1..b9f864e062df 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -119,7 +119,7 @@ msm:apq8016:
>      DRIVER_NAME: msm
>      BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/apq8016-sbc-usb-host.dtb
>      GPU_VERSION: apq8016
> -    BM_CMDLINE: "ip=dhcp console=ttyMSM0,115200n8 $BM_KERNEL_EXTRA_ARGS root=/dev/nfs rw nfsrootdebug nfsroot=,tcp,nfsvers=4.2 init=/init $BM_KERNELARGS"

Maybe add a comment here explaining why the clk_ignore_unused param is
needed ? (basically what you have in your commit message), that way it
could be dropped once the underlying issue is fixed.

> +    BM_KERNEL_EXTRA_ARGS: clk_ignore_unused
>      RUNNER_TAG: google-freedreno-db410c
>    script:
>      - ./install/bare-metal/fastboot.sh
> -- 
> 2.39.2
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


