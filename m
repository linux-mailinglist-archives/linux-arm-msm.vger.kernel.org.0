Return-Path: <linux-arm-msm+bounces-3519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2E5806AA5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 10:24:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41A1F280E09
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 09:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866701A71F;
	Wed,  6 Dec 2023 09:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SfTwvksU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80CA010E3
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 01:12:47 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-db539ab8e02so5269510276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Dec 2023 01:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701853966; x=1702458766; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ff5+UzJ+HzQvyI9Kv5LqVNtPJDYPRZAn3y8IpX5aL58=;
        b=SfTwvksUFh9tI4flYkE4Rbqypi5jyjsA6ZkdTQpC7KeJGgRB6NBut+pofMjAwUawZn
         M/gAi9/bzHVc8OxqhU3O0Pwe1BhbI9TW0n5dxVjSI1g76uvvdUrZabrCYfdIHcGbEYkZ
         EMRdEj7RXEQwloeY5ra71GCX8kfClB38v7BS1KesdMI2Vpl6fQbF5QPPX73M/NnI0eg0
         92epXtRd9ywBQTy95c03DaiGpZZs2HIBPisaDhxG0OT8j80rX7kIGNLJwO/WJqug34up
         hVMfGccyvz7zGon4G5QmypPps5Qz/2Wfmrv09Il78n2b4YXPQrMPPEfshilPF+dxUNv9
         H8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701853966; x=1702458766;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ff5+UzJ+HzQvyI9Kv5LqVNtPJDYPRZAn3y8IpX5aL58=;
        b=Bar1qTjTkQaAJRckd1uQank0E7oPLwsoF84oN17QjIAhpa66+XJwNHRqKl6lqaXLCr
         RokBaWm+xyp4AWBdNry85QubBNqUIjGohIBEs2JxmfnohibiewowSOCa2qvKmilvv1J+
         JMnbehRSFUip+D8FpRuEwYmWgpoUZEgXd/0ca6dwNECNyrwOhP8Zyu1FQ/k50gntNG1z
         YUYmeFQP1/5zijWQpBf3vwAkVglx+uq4Xzgw6jY3ZhLbtFf1fGFYj/1nxEO8N59FEf/P
         QwKRSPKp/z2NRv2/arAED5Jcn89fNB9WxCubh1wSjX5WkdE8R1UThL+FQ0qH6aG2G4b8
         HsGw==
X-Gm-Message-State: AOJu0YwWoy+WB/okcr45so/Q+PME6jf1OVcm669gpgC6CcYxd/O8Jtdo
	H/QcgoyuqCJFnn5aT9oUUMrUbXo1gnIakDNzqvSQYQ==
X-Google-Smtp-Source: AGHT+IF0IeDJuQTQHa31o0GrY9n748UF5ySeUAAC+78Y2uK2gEvwmXjDq5q4H7heMWz5QEHQTEqoZpREOkNduuqkEVs=
X-Received: by 2002:a25:2fca:0:b0:db5:4e46:891d with SMTP id
 v193-20020a252fca000000b00db54e46891dmr385828ybv.12.1701853966723; Wed, 06
 Dec 2023 01:12:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231205220526.417719-1-robdclark@gmail.com> <20231205220526.417719-4-robdclark@gmail.com>
In-Reply-To: <20231205220526.417719-4-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Dec 2023 11:12:35 +0200
Message-ID: <CAA8EJpppdueDRZ+J+X=QVViQNdhdY93TnDRfUyHXE7-AfQM6+w@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/msm/adreno: Move hwcg regs to a6xx hw catalog
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Akhil P Oommen <quic_akhilpo@quicinc.com>, Douglas Anderson <dianders@chromium.org>, 
	Bjorn Andersson <andersson@kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Dec 2023 at 00:06, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Move the hwcg tables into the hw catalog.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 560 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 558 ---------------------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   3 -
>  3 files changed, 560 insertions(+), 561 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

