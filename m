Return-Path: <linux-arm-msm+bounces-57754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9FDAB5D72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 21:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E67367AE933
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 19:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA662BFC89;
	Tue, 13 May 2025 19:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ya/hrhfJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275341E51F5;
	Tue, 13 May 2025 19:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747166074; cv=none; b=a/QOC+52FPa76MwOC7zH5NFyYkJ9PfvDQU5ZOijzr8fMDQHg847eq8QOsmKCVmLLaEOFo7o7AUGb4OkdLainsr2mj/KyrZ7qI85mS8Uj3B/xYAdfkZkWHokS5JAI6NoBuz35wAdAKGnQLoAHkSueyOtxEHByLhJvnE69sXvrPQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747166074; c=relaxed/simple;
	bh=hugLF2QQezq2CihtG3rzaOXbfOTzEU7JBPbmmjzAz6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fwmtVWDwN3TeoLLD95D5yKRWOMx1eb6ZIL25t70knPSxcUUtqtgiocV7c5YgUwh2fTXd034K6AELHoGopyTYJBjEidFt+Hd6D4hH6wGux/Y7u5xWbAQmGrp4CbyCNjsOgFcSiJHvVgu3Gt1rgjy00f+gZhV/w20sLzmERQSPNZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ya/hrhfJ; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3d817bc6eb0so31983695ab.1;
        Tue, 13 May 2025 12:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747166072; x=1747770872; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/t/gHhhMRzRsZJHJonG5aB+f1lyT45c1amcNji7Dww=;
        b=Ya/hrhfJqMRC/DoKdIdO4YWY2bLYeQjShFTkzuOl7lSNoC7zl+SwwYNt0xxQ+SHOdF
         SsFGE4RNCYDF11rLkrYtbsHDXd1DG84FhXRke7yyBylxFsW2G5UuhPAyaic0pCpC2CFx
         qzyagbbnIjDcljxZKElyh9ErLyFimQEPCjibkzWST27IC298HZYhzqxlRBYoIU+BrAL6
         zKzxKyaXNbudBgtvec/6NIZSTS4yVqjGo6s5fiucn+//JZplOmuB8XqlUdY9pkoqrfHL
         O9UbGPdiNdVsvZ+u/VoAZ2b+PnFHPTkAIQ517x/wgqBpbqdYlIyCrQB9tu1t9hPyWZgM
         DN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747166072; x=1747770872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/t/gHhhMRzRsZJHJonG5aB+f1lyT45c1amcNji7Dww=;
        b=W1hMtNV/PZHOKMrhG/niegQzL5xA+aQxtspedSq5I/5cGmZSdXjgzUASev53RM5ULL
         zTXwY9eomZ3zMh56soFFN94/zxfsUQEaHY71FcSnsOOtn6SMy1C9NMpTQ5IyyF3i2Rgy
         37HaoC/VMg3SMUbvjW55wZOcR8gW2h8csvDkVgzIDLe/6swhCSaQaUwDppgKQG4VmCgt
         N+7a4hcXHcRv5DLvI3IFQcPGsjxZT7cvVS1vXHUcpDQ5ZHPe7LXjjenDTK3p9stvbp/7
         eaqAG1kD6YCzlch/KaTWBiEyxO8vTgrdcwzal3cW4yuC6ZrmKPEp8vkdJ8vBfWW43lXk
         OF2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUk/fcHZHcnm2VH3oC7yfH0t9jLx6dBd39XKgbX1dcU7j0q3JpdgR6HfRdcbB4iDbTlP6Hli/pu4sI1PQKE@vger.kernel.org, AJvYcCVN1dhS5sOy4b9qgNEATBdOlnlczYdM1no/68FAKLGrmGEbegwRRjN1gy/ZHI+n/SkaPKmBw43+s8mJ9apE@vger.kernel.org
X-Gm-Message-State: AOJu0YwOxt1VT+rFTaz0lGwSt4y4kJUiPz0rtk3OQYh1DIpx7sNhrVia
	SPMd46Cuu5OwKakLwt0PQe8xMl37lqQIbrCTpGcljDlnmSXuBdVG11KKNY90oALh18d8ABBrO40
	DTgmOGIpnfJYs1DtoeCjL7UGEVZ4=
X-Gm-Gg: ASbGncumVyYYdxRPFQA19lG3IZWQwSOW8iHw1YksS0qRdhcNXxh2tjKc35xJLOaKIEa
	nwr4TqbKa+7njHyd/WdYuQT/2NbcCaQb5F3oYJ2Vws7cS78BxcoM2EcIjnwH9LkdpKgtvuPdBlY
	XDOWzIsmCmVBoe1ZfA1eioIOU32Wv0aD2R4a/uDLRQlWeiGbxZcRkF0mIu2X0WQKk=
X-Google-Smtp-Source: AGHT+IEVFIiwgENc7UkbS77UjLlFAdiO1rH+CkYa4UauxVyc8UQRPx2oUuCyvt1y5p4MXBN6IR7VjiMR9ik/DGcAcLw=
X-Received: by 2002:a05:6e02:1487:b0:3d4:276:9a1b with SMTP id
 e9e14a558f8ab-3db6f7ecf4dmr9598155ab.16.1747166072138; Tue, 13 May 2025
 12:54:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513-ci-disable-sdm845-v1-1-9c3ca7d0f24b@oss.qualcomm.com>
In-Reply-To: <20250513-ci-disable-sdm845-v1-1-9c3ca7d0f24b@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 13 May 2025 12:54:20 -0700
X-Gm-Features: AX0GCFt0d3XbdcQmZrgMu4T2VTxsDC9QLhRzGl8nbsgyaF66JVYaMmdLJZ_-FOY
Message-ID: <CAF6AEGtoKsB7waADtCWz7q=fTpfXJ+yqoEeCNvbvschegHT4Qg@mail.gmail.com>
Subject: Re: [PATCH] drm/ci: disable sdm845 devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Helen Koike <helen.fornazier@gmail.com>, Vignesh Raman <vignesh.raman@collabora.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 11:51=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> The SDM845 Cheeza runners are currently offline. Disable them until they
> come back again.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/ci/test.yml | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index 84a25f0e783b6ca7f8a993c709d5a0fc86bf18d3..cc685833e8d2747dd21dc9a54=
9c3d405431de8d0 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -180,19 +180,19 @@ msm:apq8096:
>    script:
>      - ./install/bare-metal/fastboot.sh || exit $?
>
> -msm:sdm845:
> -  extends:
> -    - .baremetal-igt-arm64
> -  stage: msm
> -  parallel: 6
> -  variables:
> -    DEVICE_TYPE: sdm845-cheza-r3
> -    DRIVER_NAME: msm
> -    BM_KERNEL: https://${PIPELINE_ARTIFACTS_BASE}/arm64/cheza-kernel
> -    GPU_VERSION: sdm845
> -    RUNNER_TAG: google-freedreno-cheza
> -  script:
> -    - ./install/bare-metal/cros-servo.sh || exit $?
> +#msm:sdm845:

Jfyi you could just rename the job to start with a period.. (with the
caveat that for a job that is extended elsewhere, you need to rename
it everywhere... but that doesn't seem to be the case here)

BR,
-R

> +#  extends:
> +#    - .baremetal-igt-arm64
> +#  stage: msm
> +#  parallel: 6
> +#  variables:
> +#    DEVICE_TYPE: sdm845-cheza-r3
> +#    DRIVER_NAME: msm
> +#    BM_KERNEL: https://${PIPELINE_ARTIFACTS_BASE}/arm64/cheza-kernel
> +#    GPU_VERSION: sdm845
> +#    RUNNER_TAG: google-freedreno-cheza
> +#  script:
> +#    - ./install/bare-metal/cros-servo.sh || exit $?
>
>  msm:sm8350-hdk:
>    extends:
>
> ---
> base-commit: 8f5264d302e803e7ef82a61f9632a0d2ef67413f
> change-id: 20250513-ci-disable-sdm845-fca26359229a
>
> Best regards,
> --
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>

