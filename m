Return-Path: <linux-arm-msm+bounces-3359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D610B803E5F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 20:27:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9132F2810F2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 19:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C98315B0;
	Mon,  4 Dec 2023 19:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kNsUwEuu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A865CA
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 11:27:15 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-daf4f0e3a0fso3029946276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 11:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701718034; x=1702322834; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UF8RbcFRVKtyYFhAN8G8o+Q8uKVHcH8Bwv/QadBueXY=;
        b=kNsUwEuuYKGBLagRTnFnfD9uJvpHTfNHudPTMampQuccKJSNAxL2TPqU06Kxj61OFZ
         fwYAqjxij7T30dX5/X4smUj5GcQNvYNeBA5mLVS2Ruk06tI0bOO3CirZTQLQh6j9RlEt
         KZzkl7CF5O1mIsKQ7P31gwdEHWMhY5eknfVVK7zETjhvanHs0kftY5fVQUhbj6coEuGe
         Fc4IzeVvtfkc/ZgfrOC8l1ZZKudJPzQW8Aw58c/axMQ3ctvp7ohDQAKnr7tFe8jJCHP7
         98LBy0nNlmTtqdfD0xMIDEI44BNMfLL+IwwdZSNaWSH+TsqIoSvmB+SjXn0PGpZZf/xh
         Fxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701718034; x=1702322834;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UF8RbcFRVKtyYFhAN8G8o+Q8uKVHcH8Bwv/QadBueXY=;
        b=pfhxghs7R0p1unLLghl1Nx+15wK+1i/yNd20ZRLrHBz1oD3bFNm2YakbtTArrxNJzy
         CX04CQ1qs7Anp55ZbrVD1gA3FeDToD+lTir3TkG3CeAw+Vj/vBxPo/ysUIauEOIHPuta
         zZcN/6TzCN6yZBLpXmhjLtxM/d/tSZqT4McLW0j/zHNWaLMROrt3H99LZs9t08pcUFSH
         luzr2jNuWkkU76Hbg18IgUbuYXRRgHIXjhOk9urfmSfy2D9Sr3orpbTFfCrJyMSU1tqq
         Upb1ZpZ0/OjFzCXgSsdJTgq5+iHJNAbBWdaZSQc+qlr9qpY0FYl4I30dXo+QqUqw6sdE
         GzZQ==
X-Gm-Message-State: AOJu0YzIelNpTpLr4KSuOX8D/57GURuy5z81JgneGbpLFvRrkOWEMwP8
	bxmVBl3enylyBfTDpkhcCvZ/WMy6pFd0t1gEqJ9U1w==
X-Google-Smtp-Source: AGHT+IFoS9lomMmrh7QB8FJlwDVYrAZR+sV2AF3ZiBtQnFSGI4Cd7vfNSSh1Odm+EvCiVHdtf49u0rl6x9sTO4+Vl14=
X-Received: by 2002:a5b:6c4:0:b0:da1:5a1a:e79c with SMTP id
 r4-20020a5b06c4000000b00da15a1ae79cmr28151716ybq.50.1701718034319; Mon, 04
 Dec 2023 11:27:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231004031903.518223-1-dmitry.baryshkov@linaro.org> <5ae4729d-3a06-ef77-be9f-d93e91caa06c@quicinc.com>
In-Reply-To: <5ae4729d-3a06-ef77-be9f-d93e91caa06c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Dec 2023 21:27:03 +0200
Message-ID: <CAA8EJpr7ot-JLD3J7NY2AVQSE6UKhRmZErckwwa+6Wk+8cvwfA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: drop MSM_ENC_VBLANK support
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Stephen Boyd <swboyd@chromium.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Dec 2023 at 20:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> On 10/3/2023 8:19 PM, Dmitry Baryshkov wrote:
> > There are no in-kernel users of MSM_ENC_VBLANK wait type. Drop it
> > together with the corresponding wait_for_vblank callback.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  3 --
> >   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  1 -
> >   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 28 -------------------
> >   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  9 +++---
> >   drivers/gpu/drm/msm/msm_drv.h                 |  2 --
> >   5 files changed, 4 insertions(+), 39 deletions(-)
> >
>
> No users today but will need to be added back when features such as
> autorefresh get added. But, as usual, we go by what in the driver today
> so I am aware that this will be a lost argument.

Hmm, what is the difference between autorefresh and the PSR / self-refresh?

>
> Hence,
>
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>



-- 
With best wishes
Dmitry

