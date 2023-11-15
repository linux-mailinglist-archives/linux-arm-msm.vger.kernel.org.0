Return-Path: <linux-arm-msm+bounces-672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C85E7EBE26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 08:33:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB06C1C20341
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 07:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F00B4419;
	Wed, 15 Nov 2023 07:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ctFsyR7h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222A74416
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 07:33:38 +0000 (UTC)
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A439C183
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 23:33:33 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5be6d6c04bfso67370717b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 23:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700033611; x=1700638411; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3FOA8cwIAyYlR65wDteBKmBM81DRgXu6MSA3Hl45V4Y=;
        b=ctFsyR7hPgeP33E5FpKYqxNfMZjPwJJm6Tt+ptjM29/78aJzfgM/iS8nZ62e5Coa6W
         5w73wgko7sL3GST4iIOUAFU1V5iXv1jOV+1+TlvDjFfX68Q4Wtpyx13JqTZWup13SOOG
         PwRjrfyX0EQTKtz5KBsFYbuxmBBA6301w/9x7IGOInvw5QLdXDkMkNVc4xV+MzrpcYgY
         HKsH3Lz3DIy6Yln6sbodDi7hFvNeumN7d0eoYy3VcfXLAd8egvB43wSoxZI6uTFkQEPO
         pMh0RMJHbnfQCY1pME08nJYYVOTPM9qhIIefY9lQhe79DWey6SQAqPRS3iO6sFD/envC
         QPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700033611; x=1700638411;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FOA8cwIAyYlR65wDteBKmBM81DRgXu6MSA3Hl45V4Y=;
        b=JzBmomT1maB5TDChlSlerqKDOCEkHkbxtvGTT5PJcoamPJbXX6K+jm9j4p9X2lWb0S
         QxQ8Dg2a+gBZe+aW33LE7H4oTyoreCrIdUErJt5LP/3NPcfcxVlDpr2iViSt9SCJyYov
         CCro0tkN+zXnwbEXukvQ9t15DkaQn/EnIdLd8OYGxPYyiYJIsBym5tQ/8qoKHJGCY/V6
         3idM3MVcM5kwvU3jAwfw4vBC9yyVpsENneZgk/lCrIaVyhgMo+rKSFn3j18hCo8IYbnm
         hF4Szo8pmURc6rWdwXDn09OIrSICR4zs/b4hTqFIqaoTvG4JpDjvFoftDVqFqCfSO+Bi
         6lBA==
X-Gm-Message-State: AOJu0YxagxOl6yoFv3VCJYfW0KSSK9krESb/0uhIH2KFN/VZ6b6qeCWd
	VnZ0sgQdbHyaJGqDDSQJHnIOnX+zQADxz8j7oLY4rg==
X-Google-Smtp-Source: AGHT+IGaoOYs+bd3ICE+icrHuNJQ+wn0eLONRAaiZI9vHUtjmK/ZBgnbAWkr+eRFLcDJ4ik1mFWd/zZtJNuRPE2VUow=
X-Received: by 2002:a0d:cac3:0:b0:5a8:187d:d5d5 with SMTP id
 m186-20020a0dcac3000000b005a8187dd5d5mr10457931ywd.35.1700033611715; Tue, 14
 Nov 2023 23:33:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231114225857.19702-1-jonathan@marek.ca> <20231114225857.19702-4-jonathan@marek.ca>
In-Reply-To: <20231114225857.19702-4-jonathan@marek.ca>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 15 Nov 2023 09:33:20 +0200
Message-ID: <CAA8EJpoXF+DtVxNwK1Lr6WVzTgoGGKybzeOQ384RYyT71Zdksw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC
 (fix video mode DSC)
To: Jonathan Marek <jonathan@marek.ca>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Jiasheng Jiang <jiasheng@iscas.ac.cn>, 
	Vinod Koul <vkoul@kernel.org>, 
	"open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>, 
	"open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Nov 2023 at 01:00, Jonathan Marek <jonathan@marek.ca> wrote:
>
> Video mode DSC won't work if this field is not set correctly. Set it to fix
> video mode DSC (for slice_per_pkt==1 cases at least).
>
> Fixes: 08802f515c3 ("drm/msm/dsi: Add support for DSC configuration")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

--
With best wishes
Dmitry

