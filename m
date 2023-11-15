Return-Path: <linux-arm-msm+bounces-670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE007EBE11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 08:27:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2617E1F26407
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 07:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F078BFBEB;
	Wed, 15 Nov 2023 07:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="spmse6T7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF4FFBE9
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 07:27:05 +0000 (UTC)
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8B649E
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 23:27:03 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-d9ca471cf3aso6627616276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 23:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700033223; x=1700638023; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LI+hHZDGsrVLiENiIy3H+HbnGc5/Pj6x1urZCnZBE0A=;
        b=spmse6T7H4y/R88xcfBAML8JUIp4Q1ZF4yUW97y88txZduH/1j/Q+QDFgTsLA/Ofdh
         kzxCG6GRgEsDT+NGL/iDWikV4LPbp2fzcw7ezgKtTLWC5SsYqkbGAdroF9nDsXEuMH+u
         WswlXBmWQYY8kSKZaZMMQWNtY1nMMOObiX/jRrpVlVisguvLkgBIEQJ+2iSQM2Ef7MKC
         1amTeCZsYsIkIWsj2PyIUrXcaUP+u2OAWuuDC1Q4fS1FX6lcu2gqghibeQxmGSP8A0ro
         hr6gXq1N9LlaX43KZ7FJRL7GUn4vLfF1gqd/glQynmB2sgxNHmgByIx2KeCTHU7yQa2P
         97tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700033223; x=1700638023;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LI+hHZDGsrVLiENiIy3H+HbnGc5/Pj6x1urZCnZBE0A=;
        b=C+x3rLoeYkZVzqMC8uGAgtFgHCbAmHX8T5eZdJPV8CoHI/JVutHyJYbTdLzsLIWDDf
         gGcbyGAmwLjFkjygliCpRgskAmlWsH1HG55Cd8o1+jOokKZQM8wd2Zc30kR4m8AvUksV
         mx/3bW9O+o0hHgN+UEnmE4iWIQq4bfCv9JowG1eP7kI9DFX5E2SLXYrRBl3xradmvtmY
         q7klV3FRvOGP4UG18222Py1Xmb0mFrJs4vQU68i/a7grjGZX5+FcBC9TviZJk2rMpQKM
         5VWwZsLzfEav5DiPuRzVpLjDuU9XW0qOYHShyszJ1FEjLm9tN752hJ/dCiqy4VW3hOJs
         Rm6A==
X-Gm-Message-State: AOJu0YzQLiZ6twhlczb+rPWClWDwJ6nqaqkMb3+rtgksfCh6r+sArZs2
	LYeiDb3IPFhgbtjG7aJdautrYjBKKeYfQ5ZhFR8CwA==
X-Google-Smtp-Source: AGHT+IFg14cjgoXzSIT4pD+JIPGzFocy5oWeTNMHBVe/p8YI7kp1xT3oW6AV6W2ZE8rVTAhJZNFOUYyiR/qUPm+7sR0=
X-Received: by 2002:a25:25d6:0:b0:da0:6876:a8eb with SMTP id
 l205-20020a2525d6000000b00da06876a8ebmr11431431ybl.46.1700033223136; Tue, 14
 Nov 2023 23:27:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231114225857.19702-1-jonathan@marek.ca> <20231114225857.19702-3-jonathan@marek.ca>
In-Reply-To: <20231114225857.19702-3-jonathan@marek.ca>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 15 Nov 2023 09:26:52 +0200
Message-ID: <CAA8EJpq-bdb_ue1LAXjM+TH97os4eeHyUeNy+51wh44M_J2TKQ@mail.gmail.com>
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
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> index 2a7d980e12c3..f0b3cdc020a1 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> @@ -231,6 +231,7 @@ static inline uint32_t DSI_VID_CFG0_TRAFFIC_MODE(enum dsi_traffic_mode val)
>  #define DSI_VID_CFG0_HSA_POWER_STOP                            0x00010000
>  #define DSI_VID_CFG0_HBP_POWER_STOP                            0x00100000
>  #define DSI_VID_CFG0_HFP_POWER_STOP                            0x01000000
> +#define DSI_VID_CFG0_DATABUS_WIDEN                             0x02000000

BTW, could you please push this register to mesa?

>  #define DSI_VID_CFG0_PULSE_MODE_HSA_HE                         0x10000000
>
>  #define REG_DSI_VID_CFG1                                       0x0000001c

-- 
With best wishes
Dmitry

