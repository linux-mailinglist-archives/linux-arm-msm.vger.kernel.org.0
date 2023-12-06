Return-Path: <linux-arm-msm+bounces-3517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E647806AA1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 10:24:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6B9C1F212D5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 09:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B16C23761;
	Wed,  6 Dec 2023 09:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZNXBy+lA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8973D10C6
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 01:10:44 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-db54ec0c7b8so605824276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Dec 2023 01:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701853843; x=1702458643; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9n2kthQbWTkNG2GdCSNciiPlzGwjGTmUOsOXRq6uUuY=;
        b=ZNXBy+lAjJ0UZY2tYwI839okbpIMEVyxAxzPa4/b3MqjchcuREcMdc3mJ1Uf0S4Gji
         QELRocPEwAspjSv3QoH/I/CjNaeSNV5tAqkVfN2dYYgHJE4mj3cjEybL7WQu8ts2UhBz
         3emm0e27U0LZn3VxgBIFv+JRyxD8ag9AOQHRHKKX1SA+aLumQSM2lszhjgNPoQAMcQpo
         +CvY1ov3LyIUkd1dJA0TAmNak9Pen2RLHzFqO7Pum5dPxWZE8WRFkj4t5LyTUV49BRn5
         RxK7XqklHanj75yw6B2dddGVL1eREaiz4OEpo8Xdak3F/DH+/6o398AhywSoQ+X0SGji
         HPWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701853843; x=1702458643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9n2kthQbWTkNG2GdCSNciiPlzGwjGTmUOsOXRq6uUuY=;
        b=pdhBiYTo4KbrZOm9neOQvWk9PVGrxCVSleNRdjVhh6z6Wsl1M6jR7MzzEk0tvVAHL8
         SA7zZ+Ro4xL/2SfsFaK6p8Ty/+tndp0eJIglrE1Tdtt3Ju3BbFUDL05JVDcjhEBBobsh
         zKteUF6dJ06ip7HdToOC7KIjQXBCNf7aXSIH3RYUZ7phmBryfbL+SbncYrBR0XeOd2Jw
         ittGxG2sUAN2+9dQWQ2nvXHJlV9yECyoq553heTKOECtrlDncfASrnyStnSPyUWTAwxZ
         fzI6+SRpfu0fkUDpCXzuvDwGgSK+aR0iAGqzuJvAu8yhYx2EugWkjvneDqihyhJj/Bax
         GkEg==
X-Gm-Message-State: AOJu0YyE4f5uh4oyGcvlbDDXpS62Iprm7sSfO6Ulc03db7ZclhXa02bz
	oZdDQvqfm0v82JrN5nTl4DLbsV7NERiB3ePHPnXblQ==
X-Google-Smtp-Source: AGHT+IEXzruhFFkHB0Fa+/n84Bb6lIWEsIELJtEm0FOsD8vWSyRbbfLPr/HFQvgfnZNoovdex9inHxAp8BUvFfqaPBM=
X-Received: by 2002:a25:cf13:0:b0:db4:d68:d450 with SMTP id
 f19-20020a25cf13000000b00db40d68d450mr2003989ybg.25.1701853843738; Wed, 06
 Dec 2023 01:10:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231205220526.417719-1-robdclark@gmail.com> <20231205220526.417719-2-robdclark@gmail.com>
In-Reply-To: <20231205220526.417719-2-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Dec 2023 11:10:32 +0200
Message-ID: <CAA8EJpoguMhnO2LbQvpbSiuq6PAxqc3cT1nLKFmrA43sP9c-3g@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/msm/adreno: Split up giant device table
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Dec 2023 at 00:05, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Split into a separate table per generation, in preparation to move each
> gen's device table to it's own file.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 59 +++++++++++++++++++---
>  1 file changed, 51 insertions(+), 8 deletions(-)

-- 
With best wishes
Dmitry

