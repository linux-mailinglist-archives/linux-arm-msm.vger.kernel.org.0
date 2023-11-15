Return-Path: <linux-arm-msm+bounces-669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4787EBDCC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 08:21:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 879831F264E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 07:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F7A5249;
	Wed, 15 Nov 2023 07:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vGTOeYXk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798EF5247
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 07:21:13 +0000 (UTC)
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E344BE9
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 23:21:11 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-da7238b3eb4so7046490276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 23:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700032871; x=1700637671; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0vD1Bck5HDYUM72yjoV0Q8qgtg6QFL0VXndDmXOf70I=;
        b=vGTOeYXkXO7B5xaZcJzyfPyusCnJ3iFNzHKCmrYZpCAwqvBFF48WmoRFWP3L4paAUx
         JyTF1/QksxnKvzRIwsqNoEWEC09+2duksCi/Aj8g2SbcDEDtm2LtlNl0/7UzC/pcnHog
         tP73IDVf0iahAJbzv5V1zG0hMXfYTIapZLYs142UuodfN6GYzdagRJG/n6ms8UWro5/i
         BrwsW0/UI3hxoXiVa4zarTW0kIs0LWB6jPDy7HOQUOSQv4nz6wvK3AZPx45ZrRw2gx3H
         kcFO5E7PCZPmABXz2zUojPEEvRjrMDKPrnuCjBzIDNvxC0dnLD3qRUvHV7PzhDqmBBs5
         lhKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700032871; x=1700637671;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0vD1Bck5HDYUM72yjoV0Q8qgtg6QFL0VXndDmXOf70I=;
        b=BZOVAN09v/1A2yd+mTpEEGtjSxDlQPDLUJy4W8SeZ/fI+k7sTViMyy/nR1dYNuUqr0
         nNpCAJ2d7VrWwZ9yxDUrZSpQeE3KigYPGAAnqlEk6k6LnIlLfx/zijFa5QmbCbs2vWZ+
         No54v86p+EUb8xIWETsuj8bfZ+2RN/OjAFTze2ZgBZHduYzTEPX1st433kE7KzjT7Hyu
         VKInz/v9kQtoYcc19f9m0+tjc2AqWwiC+1fj7bTF1kp7s1nlya7pGslM9O4dfihuwuOs
         dCwy1WhkHMpLALWP4+37M1CTIr6M9v7+LarhprDdnPs9hAkG5mZ2JqJHEmjGdmPwCw6E
         yLBQ==
X-Gm-Message-State: AOJu0YzQ4gxSlwvjy+vk3C+kEr++x1NLAO77Mqg63Z5TsWngBFpY5W1+
	EBQWQ6CtKmmBk4ZFQtSY1YEt3JvecsPj13MElcXgcA==
X-Google-Smtp-Source: AGHT+IEULgD391byZsXPtXNbPcw0yCylBtdnLApeQVAUxwBDpohA/yg4/aHXgsob+pZ1sRHJYNKdu3NZUuCiQiUASW8=
X-Received: by 2002:a25:107:0:b0:d81:89e9:9f48 with SMTP id
 7-20020a250107000000b00d8189e99f48mr10803617ybb.63.1700032871066; Tue, 14 Nov
 2023 23:21:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231114225857.19702-1-jonathan@marek.ca> <20231114225857.19702-3-jonathan@marek.ca>
In-Reply-To: <20231114225857.19702-3-jonathan@marek.ca>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 15 Nov 2023 09:20:59 +0200
Message-ID: <CAA8EJprADPYpJBUkq_TA381xntkfHbBVMm5h4qwwg+vM7GzzRg@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] drm/msm/dsi: set video mode widebus enable bit
 when widebus is enabled
To: Jonathan Marek <jonathan@marek.ca>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Jiasheng Jiang <jiasheng@iscas.ac.cn>, 
	"open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>, 
	"open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Nov 2023 at 01:00, Jonathan Marek <jonathan@marek.ca> wrote:
>
> The value returned by msm_dsi_wide_bus_enabled() doesn't match what the
> driver is doing in video mode. Fix that by actually enabling widebus for
> video mode.
>
> Fixes: efcbd6f9cdeb ("drm/msm/dsi: Enable widebus for DSI")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.xml.h  | 1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
>  2 files changed, 3 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

