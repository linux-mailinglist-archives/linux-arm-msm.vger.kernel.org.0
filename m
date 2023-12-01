Return-Path: <linux-arm-msm+bounces-2826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8578004D5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 08:40:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9470828162B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 07:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9844115480;
	Fri,  1 Dec 2023 07:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bf8hLTZY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8970010FF
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 23:39:55 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-db510605572so233047276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 23:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701416394; x=1702021194; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r4ZRsjdL9I2iUGO1VnJG1tezBUm0g0FIW6dRQVzc5r8=;
        b=Bf8hLTZYbzzOYtoZPnVG+1UJauRzkOpd7ZOKV9os6r4cjs0pgJH3JjZIHaOsbWEzco
         +wHu7I3Z3K5ZijegIv57ahBhZy64Z9QeozUUFELWUU0rBosHKqdwutnjWhw4Sg0I0mxE
         nfDFM2o1F3dOoEZfV9F50wkFtoAEsTs7OAlY8b57PZtJwsyZvUMciA3CFtjgZhiaJt/W
         vzo3RwddA66dRxUeYdvR8ukLul2tL99JTu4CZpTCVtXKAy1YK7TVRWGbWKBjC+x0hpEc
         EI+zElkAfQjzDwsct5Fat6WUatKyHlHtqb9L0Osg/Y6NWH1nmX1vooAgYBRmjENu/yyL
         P41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701416394; x=1702021194;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r4ZRsjdL9I2iUGO1VnJG1tezBUm0g0FIW6dRQVzc5r8=;
        b=KQg4aki6K5lSA5UVg4l2wKo6MlZ0nFN1XqhfYu15V0TZr4YYjffuNhVs9RKhBAthxC
         Zjky7X/5eielwdEaKywsw7+iZ7Yv0SIhJZ8TdTEQ2VniwkQJiK/jpTYg7D+HX8eusjlK
         qaql4VL4+3Flfrv2zD5FLU37GpexLB56cJXiJ8VfRpVh/+1U9iMq/RD0LjrmHSkN0vM0
         kyJ2vw9g/EuUr3QKr8jDOOMlaQ9BI+7dp/jDhkvO2mZNGUWXKhvJMhAx5hJiRwhEHv+V
         VEXMkT1+6wVQpb05FWRv+Mz/eCHXsChisq2FHy3IOEShzplAxrYzaYvG/M0jlPGzpSNR
         qWtA==
X-Gm-Message-State: AOJu0YzZGaKV2O/h3EeOK7MSxjs3m+ir7KeIB+BpkMSaPQ2FRlwhEAJ/
	Ri/qflkrjZPLFWtnGN2AmSDZSzo69VQ2eMtPcKkKtg==
X-Google-Smtp-Source: AGHT+IG6YJFYpxxDEGA5/9WsFpWY9Xkeap+TYkek9J98RCloSx+NNN/prVWH9iqo7eEB0Fko9lDJ0o8Q44uv8RIxQR8=
X-Received: by 2002:a5b:ec7:0:b0:d9a:4cc2:1961 with SMTP id
 a7-20020a5b0ec7000000b00d9a4cc21961mr21395804ybs.26.1701416394767; Thu, 30
 Nov 2023 23:39:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231130-encoder-fixup-v1-0-585c54cd046e@quicinc.com>
In-Reply-To: <20231130-encoder-fixup-v1-0-585c54cd046e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 1 Dec 2023 09:39:43 +0200
Message-ID: <CAA8EJpof5LO7pyXaqgtbL=sL2a2Te2tzLF-NrTFT7n58pB3iww@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/msm/dpu: INTF CRC configuration cleanups and fix
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 1 Dec 2023 at 03:31, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> This series drops the frame_count and enable parameters (as they're always
> set to the same value). It also sets input_sel=0x1 for INTF.
>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
> Jessica Zhang (2):
>       drm/msm/dpu: Drop enable and frame_count parameters from dpu_hw_setup_misr()
>       drm/msm/dpu: Set input_sel bit for INTF

Please change the order of the commits: fix (input_sel) comes first,
then comes the improvement.
Otherwise if one needs to backport this fix, they either need to pick
up the irrelevant patch, or they have to rework the fix.

>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  6 +++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   |  6 +++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h   |  3 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 18 +++++++-----------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 11 +++++------
>  8 files changed, 26 insertions(+), 30 deletions(-)
> ---
> base-commit: 4047f50eb64d980fcd581a19bbe6164dab25ebc7
> change-id: 20231122-encoder-fixup-61c190b16085
>
> Best regards,
> --
> Jessica Zhang <quic_jesszhan@quicinc.com>
>


-- 
With best wishes
Dmitry

