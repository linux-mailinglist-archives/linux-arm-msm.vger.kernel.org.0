Return-Path: <linux-arm-msm+bounces-4483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 195E4810679
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 01:28:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ABED1B20B71
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 00:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 545E6ECE;
	Wed, 13 Dec 2023 00:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LuZcnf6a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76930B9
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 16:28:17 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5e196c128fcso20144167b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 16:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702427296; x=1703032096; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tb8aSVzncfyxWYm9ow9y0V7DPZwSdLYGXr8ZJbeVeXk=;
        b=LuZcnf6aHJMKnlEUzsw0sWeDDMv4Jnm4m0Xw0YbsBE6pxa8A1Mur9DBY0rsznV1st7
         CEuJ00pF24kj4K5mRoLoCqIljAoWNjDg8K34jDgs635Uesdj9bADhCZQQ97VD3y6AjHS
         p4fUed9nfv1eDNJHgeL1t26aMyMfvn+wO0R4Xjt6vMBTaMD+3OuslZsrKRvTj+kRsBAm
         5Pe/ym/fL5rYBqlab14U9dnJHQEB/5Xg5+FqXgSnSPiFbtIgEAcIePWYx3AmoCMzD/8c
         J+DU30MVorTGmp0oWF7Z5e7TEE+Wr+auX4iJI5y6BmSPZIIg72VdzQtYYSsgJdjfcNtY
         ZmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702427296; x=1703032096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tb8aSVzncfyxWYm9ow9y0V7DPZwSdLYGXr8ZJbeVeXk=;
        b=CXYXw/WTPxG0Vl5omljvmRy7CxFJ0gaqHcM3G36lDsXegFnrvVXn3CcZ3Juu4dpfne
         t2WX7P5GEUziUfawrzrn5XB/MldQVJ4JO7f5NjEd098uKsK7acRdGFmKgb+G191px0Tl
         MBeQUgIszhuFtLeR2rWxCSk89GKreqrhukbB++Cs2d2e7vPywvnI7hRadgyHPvVTV1q7
         WuypfTLmAZ41XdkA57ar2wA2gReO67F+FeSm1gRGC289ovSaidItBtzb39K4UWTTdsm4
         uxCrQ7ARLnkJsdbDLlExPJ9ITbW+kMly7lIUB0jwv1HmRiz5fvhDy+2WUX1uEbPHFdbP
         PweA==
X-Gm-Message-State: AOJu0YyymL0n0D/c64F8u+DgGUJiHMWlwWln3zzw7/4aXohYrTXg3z6W
	p4yPoCCHiFX/m/zkot9S5msZmUwTye+ApbPNULFYyg==
X-Google-Smtp-Source: AGHT+IHG/jUedozgL5SGa448xXkNlA78a/sNsmuZlJogKjmEDh0VLDGbZPHcXZSz85VeopQiVm5cQCRmqKovzMN83i4=
X-Received: by 2002:a0d:cb0c:0:b0:5e2:bd18:b253 with SMTP id
 n12-20020a0dcb0c000000b005e2bd18b253mr87186ywd.24.1702427296677; Tue, 12 Dec
 2023 16:28:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231212231101.9240-1-quic_parellan@quicinc.com> <20231212231101.9240-2-quic_parellan@quicinc.com>
In-Reply-To: <20231212231101.9240-2-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Dec 2023 02:28:05 +0200
Message-ID: <CAA8EJprRknmPSh-7iYMp6vBxcbBDSyp4fyD3VtXUxeVzp-F2vg@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] drm/msm/dpu: Add mutex lock in control vblank irq
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	marijn.suijten@somainline.org, steev@kali.org, quic_bjorande@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 Dec 2023 at 01:11, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Add a mutex lock to control vblank irq to synchronize vblank
> enable/disable operations happening from different threads to prevent
> race conditions while registering/unregistering the vblank irq callback.
>
> v4: -Removed vblank_ctl_lock from dpu_encoder_virt, so it is only a
>     parameter of dpu_encoder_phys.
>     -Switch from atomic refcnt to a simple int counter as mutex has
>     now been added
> v3: Mistakenly did not change wording in last version. It is done now.
> v2: Slightly changed wording of commit message
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  1 -
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  4 ++-
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 32 ++++++++++++------
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 33 ++++++++++++-------
>  4 files changed, 47 insertions(+), 23 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

