Return-Path: <linux-arm-msm+bounces-4330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F35080E439
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 07:23:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D89EB219F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 06:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846D215AC5;
	Tue, 12 Dec 2023 06:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EdFQLTHn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FE14C7
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 22:23:16 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5e1f852cb46so341267b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 22:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702362195; x=1702966995; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iiILM31E6DkzVgO2qo0gFXNyzTl9J/ly6YMsqQ+U4+s=;
        b=EdFQLTHnWygyrMxwQIZO8uzzre+Gf3nFfUScatS22dLPR9M+DHU5kEiUGnZ3PMpLPV
         T+lbZaG/Pwi1VxnDerEKJt0KnvRWGR0GE39J/X+0XJTOHzq2AcH+P0hIOOH0epmu7a/o
         DEckI/8lTIlWkWrlKFPZwDPMDrXxgEGKCXZ6YtUdoyb9iVkUnF8sgRtGOI5Wp/H26Byr
         5aKBtYVBjcDhIgYpEivdYEhlAj2Zftqe+a4qEHUEf7lqbHWlPIcwHNeHXbPqgt4n1Ycq
         mWwn72pMfuevDNuJJee9KDzgDsJSRxGA5q+ZiUhMfU5ONzeUiLBtpz9ixhYnVJLcsXvB
         JngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702362195; x=1702966995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iiILM31E6DkzVgO2qo0gFXNyzTl9J/ly6YMsqQ+U4+s=;
        b=j9Rxf4cee2NEPOajEsTw9slnZHq/SkaKT9kBc1rRgv9Q5Ign5W8tg53DpUvRtAoaxE
         yNylHPemBtPJ6HYphGu1wUiqRvQUcPCIqRY1fvl90mJS3MkLnrFGkfIuMTEXtGcsZ5yS
         3pq7Dj2UQcU7sdTfYO+VjtCm24enQvx0y0VlK3e9p2m6z1/zyKHJNcAgGxN07etnAEQo
         knH/VnHhTUyHzwOzHTc6TGDfPtLNmESk/rtIT8fKJPl3Zhda095fZz3V03AsvPPd8cYR
         AOYOUJrvU/8WHh4k5cko60lgn+M5RPL9+/6Pj///0I4pVj2Aj0j6PsHJk21/W7cbYspy
         Cm9g==
X-Gm-Message-State: AOJu0YxUGXeOezaoExXFZjgQv+97liSVdSM7SML6+fnFZb3ongofqrkN
	KZigD5f63qMklImjvbsge7cpsgvoaEPI1HBSWOSrVg==
X-Google-Smtp-Source: AGHT+IHMSmzL1GhX733i9qyeRqWSt5GjXz2vhpxca8+A+ee2K5EieVksUobvlXU13YxCT8ZtBI1vuiBvCLvFDFFustg=
X-Received: by 2002:a81:7b42:0:b0:5d7:1940:8dd4 with SMTP id
 w63-20020a817b42000000b005d719408dd4mr2237054ywc.59.1702362195612; Mon, 11
 Dec 2023 22:23:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231203003203.1293087-1-dmitry.baryshkov@linaro.org> <06daf3a5-f069-1209-8029-79c766e034e4@quicinc.com>
In-Reply-To: <06daf3a5-f069-1209-8029-79c766e034e4@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Dec 2023 08:23:04 +0200
Message-ID: <CAA8EJpqYAmbX6=wKYJ34=FxewCaqp9Lb8kqqCumL1i_wSZdvfw@mail.gmail.com>
Subject: Re: [RFT PATCH v2 0/4] drm/msm/dpu: enable writeback on the other platforms
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Stephen Boyd <swboyd@chromium.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Dec 2023 at 02:30, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/2/2023 4:31 PM, Dmitry Baryshkov wrote:
> > I was not able to test it on my own, this is a call for testing for the
> > owners of these platforms. The git version of modetest now fully
> > supports writeback.
> >
> > Use libdrm >= 2.4.117, run modetest -ac to determine the writeback
> > connector, cat /sys/kernel/debug/dri/0/state to determine
> > spare CRTC and plane, then run something like:
> >
> > modetest -M msm -a -s 36@85:1024x768 -o test.d -P 79@85:1024x768
> >
> > where 36 is the Writeback connector id, 85 is CRTC and 79 is the plane.
> >
> > Then press Enter and check the test.d file for the raw image dump.
> >
> > Changes since v1:
> > - Fixed the DPU_CLK_CTRL_WB2 definition
> >
>
> I think this series needs to be re-based as WB_SDM845_MASK is no longer
> present in msm-next and 3/4 patches in this series use that.

Quite the contrary: the WB_SDM845_MASK was added in
https://patchwork.freedesktop.org/patch/570189/?series=127245&rev=1,
which is now merged to msm-next-lumag

>
> > Dmitry Baryshkov (4):
> >    drm/msm/dpu: enable writeback on SM8150
> >    drm/msm/dpu: enable writeback on SC8108X
> >    drm/msm/dpu: enable writeback on SM6125
> >    drm/msm/dpu: enable writeback on SM6350
> >
> >   .../drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 18 ++++++++++++++++++
> >   .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 18 ++++++++++++++++++
> >   .../drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h | 18 ++++++++++++++++++
> >   .../drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 18 ++++++++++++++++++
> >   4 files changed, 72 insertions(+)
> >



-- 
With best wishes
Dmitry

