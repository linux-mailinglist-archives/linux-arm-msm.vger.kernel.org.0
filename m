Return-Path: <linux-arm-msm+bounces-15319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BB688D302
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 01:04:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED8761F27894
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 00:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09BA160;
	Wed, 27 Mar 2024 00:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FxYQHcbZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2083F1FB5
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 00:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711497868; cv=none; b=GNus0kWvjiCds1gUdi2tMPU7SdO//uwzUz03QmLsqpvIhh2IgEp0T4C7jDJmiX53EczvR2EOl4lKiVDOK6cuMRuJLu2Zei4OKftgAY+KiUKcNjHydBU+qNsNXUQIgekprSopJ4SUIFZLScsRqyoEhlLcCoHyjF2ZGzk+zMATv4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711497868; c=relaxed/simple;
	bh=g9MvZWErk7nPFpq4LhbhjEehJuwP1hbGVKHQhwQs7mg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KLSYSD2DJTcL3YjL/ACvpC8HYMIYvtSQ9DUK2/OrB938uQl3WO9ARhW3ZACyuv7iFG1eXq6hXUwGJZUUSwZ8iaQ6O15cK9GMM9TYy/WBXx8N+heWWZ+fqOPEeMRAN1EasKip1P7PiQKhE9QqZfK5slHEQjSxZwisOWCaRrv33Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FxYQHcbZ; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc742543119so5917420276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 17:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711497866; x=1712102666; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cdWwjlLjRKWPoRjlQky5MiZwOYfdmEHMy7nWkUa2pJg=;
        b=FxYQHcbZsF2L8NSlhL1SgeHc1OcuEUmVPZEgzOEA/fYvV7iXRXwEtuo8rWMNZoAuWs
         chEZaXnfM4fHUS5Yb3zYx92KjzCXTvdj89Mgmn5SdZcKKLzR0/QBlb2mMzGdPVAdWeo+
         bPtdUATGRCZEuPDPhHQ8FtEdzEQlDluFcRQ5IfasHvPcSKnyq5WR4WZFzelY5iSatCNy
         3+km2aYHAeEY+FupYx1kOwiKi23QYpbqqutgx4Reh7Gtat+GyKX1+hCywUNvMGKQTam1
         ZMx+goMUf8/k2zCPERRZQVn/ba3QFNgblqQav8cvuFw2IFH/shjXHPBoOfHmMPSF9Dof
         HKIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711497866; x=1712102666;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cdWwjlLjRKWPoRjlQky5MiZwOYfdmEHMy7nWkUa2pJg=;
        b=ps9KzJu2+InlCUmsCDawwg9283K8LQ1aKAJUJ36iZtyxGP8jsTT1jOgf5H9ER56ANW
         94q/pM5zeuZywrR62AXnzAAle7f5LZ/U906qzQ/pnyWs2vNviFhMWcZ6PGxw622f64KG
         cS8py1+jBdhVMjZ044OQt/A7XOoRtBluM1U4Pl/mYgvNFltU1/bpslIxCumkJoIT3vpJ
         UwXc3w33QBXHTkw88+kSY+kRRv4Eb7KfGPiS+nve8I3/GqSMwJuEvF4mOtAWzgcideYD
         6439wgEGzvrTfOt5rYQyTsCN4oqqBgcdGE0nx5bctb6vvcdSVekXGSboDvsUPw3iwTA5
         qu6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/lt4Wred3+Ylk06qZTHNTi2O4FbxcquFdUMszbRy/zKztEKKlDY2xbVhwPfGP9nmhA8vG6puCtnWkH5MKZPKCLYyTljqZDFx5UHzzkQ==
X-Gm-Message-State: AOJu0YwDZXd86iMTMcwDMQAzHsCLlCw2tp1M9TKa8dHzx/TmRm5Ip/32
	A2vtCkIt8EE6b1iskrqn+pJKEjh/govLvjFj4hB/3RMlMWEkITPxodduPPYr5VmkLEU7WtffAsN
	INPo2UGzBbmT/nG3Z+7N/CbcVafF6VoAxK0bfNA==
X-Google-Smtp-Source: AGHT+IHHf7+YNvPzDN4JuLfBI6UVtPxAG+UoXbABP3viX1ebb038qkns6OH4xyJU4zdD7VxtUJLuinCpZqrd6ZCFyoY=
X-Received: by 2002:a05:6902:4c5:b0:dcf:f525:2b81 with SMTP id
 v5-20020a05690204c500b00dcff5252b81mr2609255ybs.46.1711497866103; Tue, 26 Mar
 2024 17:04:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-10-cca5e8457b9e@linaro.org> <8c866d80-f98d-29de-59f5-3055184fa115@quicinc.com>
In-Reply-To: <8c866d80-f98d-29de-59f5-3055184fa115@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 27 Mar 2024 02:04:15 +0200
Message-ID: <CAA8EJppGmUPympav=NR1oYTPGs=b-DKs3a_h3oWs8tToLQOK=w@mail.gmail.com>
Subject: Re: [PATCH v4 10/16] drm/msm: generate headers on the fly
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Mar 2024 at 01:49, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/22/2024 3:57 PM, Dmitry Baryshkov wrote:
> > Generate DRM/MSM headers on the fly during kernel build. This removes a
> > need to push register changes to Mesa with the following manual
> > synchronization step. Existing headers will be removed in the following
> > commits (split away to ease reviews).
> >
>
> This change does two things:
>
> 1) move adreno folder compilation under "adreno-y", move display related
> files compilation undere "msm-display-y", move common files under "msm-y"
>
> 2) changes to generate the header using gen_header.py
>
> Why not split it into two changes?

Basically because there is no difference between object files before
we start moving headers.

>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/.gitignore |  1 +
> >   drivers/gpu/drm/msm/Makefile   | 97 +++++++++++++++++++++++++++++++++---------
> >   drivers/gpu/drm/msm/msm_drv.c  |  3 +-
> >   drivers/gpu/drm/msm/msm_gpu.c  |  2 +-
> >   4 files changed, 80 insertions(+), 23 deletions(-)
> >
>
> <snip>
>
> Are below two changes related to this patch?

Ack, I'll move it to a separate patch.

>
> > +targets += $(ADRENO_HEADERS) $(DISPLAY_HEADERS)
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index 97790faffd23..9c33f4e3f822 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -17,8 +17,9 @@
> >
> >   #include "msm_drv.h"
> >   #include "msm_debugfs.h"
> > +#include "msm_gem.h"
> > +#include "msm_gpu.h"
> >   #include "msm_kms.h"
> > -#include "adreno/adreno_gpu.h"
> >
> >   /*
> >    * MSM driver version:
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> > index 655002b21b0d..cd185b9636d2 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -11,7 +11,7 @@
> >   #include "msm_mmu.h"
> >   #include "msm_fence.h"
> >   #include "msm_gpu_trace.h"
> > -#include "adreno/adreno_gpu.h"
> > +//#include "adreno/adreno_gpu.h"
>
> you can just drop this line

Ack

>
> >
> >   #include <generated/utsrelease.h>
> >   #include <linux/string_helpers.h>
> >



-- 
With best wishes
Dmitry

