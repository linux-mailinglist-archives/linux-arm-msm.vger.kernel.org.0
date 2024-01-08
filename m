Return-Path: <linux-arm-msm+bounces-6689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA05827ABE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 23:43:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC8BB2846A4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 22:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC5656467;
	Mon,  8 Jan 2024 22:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zulj4hRQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8171556444
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jan 2024 22:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dbeff495c16so923183276.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jan 2024 14:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704753823; x=1705358623; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yWZ/93/0FZh/gn5cm1zBSBRnDMVQRiaGGWGBlyAPerw=;
        b=Zulj4hRQBQqUsrVTWYLTCh3nADDUu0H68KFPSFSZR8A1qBm01R+qj4gE224SInKaSk
         OzNHK4iqpf3qXnC5pBmxW+KKZuWhvApUz2bSEi2gxOUN3c9qu6UhSuKORTIlDYb3M749
         oaVqoEHr5QUgy9UUGsL5bBM2sgfu7LKIfYvTC6v8HCmkTFjmF+z3jmEeSFgvrY07qdMb
         xORPyJCYYgSGyA00VARmpKpyiLEFQi/kKsITpErGXBt1rZmrCmL1LneoilJZcDEAKx74
         KvRGSMDpa+2LLnmz0i5CHuLCwN8DP71TQKBgIE9DGqCpQJKT+4f7I6SI9V3+kkSceclR
         GgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704753823; x=1705358623;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yWZ/93/0FZh/gn5cm1zBSBRnDMVQRiaGGWGBlyAPerw=;
        b=MepG388wgF27EV2O7aPoh4YTdmFxdDOichPSQp4Yj8ZyaqcraxpVQt36B4VG+7VdZn
         bXxKPir2blNwixKiYVtsBxZ07nKOJk8YnbawSkJGj2Bqwdjx4wghDMG0vnvTkm3RXyXr
         I2TvdB/CTC0VmW38HJwdobjiSVZBB6VbHf4ZQVnczcAqHH7DD48Od2Zp9GVpp/A5r+sn
         +9P5hOpIWQiCKPDhteUAoo+GT8XVnCvO0PKNAc+k6IZyf/dyfAI74jd4CNH8h0l5ePQJ
         NRkYAu7b+mF5wdusfcYl6FuQ0q5+/XtRtbItm00IsBhof4ytI63zMPBzO1Ws34CUUPcG
         DZZg==
X-Gm-Message-State: AOJu0Yz1vpc5E9MzpqY8Zvj1CYFu9TK/jdKD+4v4Y3XH9E/8wzkvbWoN
	cjz3RE3nFRqTFQLQw5xobyV13Bz0zr6X24rxArIq/51I4qfMKtnw2x1Ef+vxDmI=
X-Google-Smtp-Source: AGHT+IFdl1xSh3s2jD5qgED4ACRR92qOyXXHTlK0brp8aUmpvjPvWC95g+KDfZXY9Fwki8NSHqhSBb3lWuSIPGPXyf8=
X-Received: by 2002:a05:6902:2510:b0:db5:4d4b:d8a7 with SMTP id
 dt16-20020a056902251000b00db54d4bd8a7mr2127690ybb.50.1704753823315; Mon, 08
 Jan 2024 14:43:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231225130853.3659424-1-dmitry.baryshkov@linaro.org>
 <20231225130853.3659424-5-dmitry.baryshkov@linaro.org> <2a536654-b5ec-3599-6f0a-2e369b080c70@quicinc.com>
In-Reply-To: <2a536654-b5ec-3599-6f0a-2e369b080c70@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 9 Jan 2024 00:43:32 +0200
Message-ID: <CAA8EJpohQoApcvJuxt5_Xxjx88xSCxPyCkeAbXHsG7s1_6o3wA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Stephen Boyd <swboyd@chromium.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Jan 2024 at 23:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/25/2023 5:08 AM, Dmitry Baryshkov wrote:
> > dpu_encoder_phys_wb is the only user of encoder's atomic_check callback.
> > Move corresponding checks to drm_writeback_connector's implementation
> > and drop the dpu_encoder_phys_wb_atomic_check() function.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 54 ------------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  9 ++-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 57 ++++++++++++++++++-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h |  3 +-
> >   4 files changed, 64 insertions(+), 59 deletions(-)
> >
>
> I am fine with this change with respect to how the code is today.
>
> Hence,
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> But if we start noticing a pattern like below in dpu_encoder.c's
> atomic_check,
>
> if (INTF_WB)
> .....
> else if (INTF_DP || INTF_DSI)
> .....
>
> then, it will demand bringing back a phys specific callback.

The problem is that INTF_DP || INTF_DSI does not have the
phys-specific implementation. So while I agree about the INTF_WB part,
INTF_DP || INTF_DSI either should go as is, or it should be refactored
into output-specific handlers.

-- 
With best wishes
Dmitry

