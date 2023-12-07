Return-Path: <linux-arm-msm+bounces-3761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F10E2808E1F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 18:03:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 374AC1C20AD8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 17:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29D6125C5;
	Thu,  7 Dec 2023 17:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tzhsdZt5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34D351709
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 09:03:07 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5d400779f16so7582497b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 09:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701968586; x=1702573386; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eGavWJn3BFskMXePj8G/Gc7zkKDdmqreyDRTVCoA6Wg=;
        b=tzhsdZt53Pilc43ombspsat/1H/XDEHaxgmBs0PvPDtLvUOjabuRf8zD121xPX2o6K
         u1Dqb+z+8knUXY8FjpB7awzCOT1UvOsPEKflAxYa++5tIh+rf9g7DwauL1dLdEVJHpq9
         RbtFyScBYxKdo7HF4r0+5KHl7d8YJto4mNPHpd8riTiJzKFQnNU3G6N9r8+amOpqUsl1
         OR/zu3QWtM0RHnKxMLvavkkyoLRv9tA/INkAW8tGylF/Fcelic6Q3Wqss0tJ0mPFlcHZ
         yKhRJalXKfJeYptKR5SIiS/q0CM9M/4kwyTl5Qr1zBLPiOayRC5yjzUBEWJ0wmeEgC6+
         Lf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701968586; x=1702573386;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eGavWJn3BFskMXePj8G/Gc7zkKDdmqreyDRTVCoA6Wg=;
        b=UFrGrEZtZxhF2Gg5CEdNNDOjosWhSjpdy/H3+UBFoBQTCx8VK5ckOAU4yZG4S9BpmK
         ziFI8XkaUUk5+IJkQ7plINoElkGHZkt3MrgD5uDO+GjqpSousD/spKgNvWxEemf6LP6w
         urovdSCowsDuusrzgd0IGdJiBXW4UakiurfBjr1PIDy++f9Ni7Ck8S457b4NkYchbicI
         tgxwEVP1oSI8hZCIcrEBScK4H4tOxUkmH8NVjydf8EfvuueKd+l1Ucp+ZMamc6/HR4VL
         RJYK0JQXUDiJ6BXcwVaPtA19CSSmbeSNSMSb3a3XoCYcFeQLlTdOXjVYcJsPuedtadxV
         9+jQ==
X-Gm-Message-State: AOJu0YxQxXVtieE0MeE9qYIJ4J5L1chf428dRziTQcHEjeehyWKl7G6W
	50QmzaT6CdG3E4D6Kd5sF7HBR7zDKjSto62QSyrmVg==
X-Google-Smtp-Source: AGHT+IFi1Lw+dYQG5rp3RmkzlgCLipb19CQiXyiuFQHGeZdsmEG6DXb3riJxACss4LeAc2sE3dJFU23/biQpd2Etzf8=
X-Received: by 2002:a05:690c:2b06:b0:5d3:b71b:4d30 with SMTP id
 em6-20020a05690c2b0600b005d3b71b4d30mr3163725ywb.17.1701968586143; Thu, 07
 Dec 2023 09:03:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207-topic-sm8650-upstream-dp-v1-0-b762c06965bb@linaro.org> <20231207-topic-sm8650-upstream-dp-v1-2-b762c06965bb@linaro.org>
In-Reply-To: <20231207-topic-sm8650-upstream-dp-v1-2-b762c06965bb@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Dec 2023 19:02:55 +0200
Message-ID: <CAA8EJprskAYWm6M_yOOmUEHdWV9Ot3_VBxo4MtPYDKBizPHyuQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/dp: Add DisplayPort controller for SM8650
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Dec 2023 at 18:37, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> The Qualcomm SM8650 platform comes with a DisplayPort controller
> with a different base offset than the previous SM8550 SoC,
> add support for this in the DisplayPort driver.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++++
>  1 file changed, 6 insertions(+)

-- 
With best wishes
Dmitry

