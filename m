Return-Path: <linux-arm-msm+bounces-22722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 266A2908A09
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 12:34:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C7891C268E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 10:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785C8194127;
	Fri, 14 Jun 2024 10:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JTL+pShD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE32137C2E
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2024 10:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718361279; cv=none; b=WZGnM7GDUDv5/pd3jsxUF2XHyxcTCqPQi/8iqK92Edo2t/6yLHqkmlDmVJu7moYvT9sLyWHfciR53nGcbHp6Knuev+aUZ/a4Iz1NUssirxjrr+y4pUPtqKQDMnyJgexnhTCDdSGzG0iyGCAzgch241hLhj1T+UZl7RXX+Npx/8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718361279; c=relaxed/simple;
	bh=fu3Q/gpIjYAz0kA2UKd8Gur4509CyXpQVpYRX0JjAuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZvuzcKKhVPHTBfpfpn2+7QzScbr7D0u/mBDX2Xwl31hezZ+LVWNYi/SC/OAAKDJ3PH40lCiJST766gsCBkNp47Plw58owSmF97xpr34HV6Pg7PrimSsanho5hO7hlPK4vwLCsgeZTq2Fm0D8X3B91Re7cJZbTZYXTzXNfdWKYV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JTL+pShD; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52961b77655so2005134e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2024 03:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718361276; x=1718966076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+SCjC8XvS9+kPL9hXwY+0n971Ep94mX3iMJ+fsGN0OU=;
        b=JTL+pShDB/UlxwC+4vAYXl4wTZplzbs7DrmLVz0Qc8pPXd3nVJb4Mo8JXeSV2PcM0p
         0HirzcF9d+bIg+cxslCaTEP773x/vvG/Xc7tTrIxmGRoIizfaP1pIqBhMruLMu5acYey
         2W/Dz0/oossUF8mbfnboXZNz/CdrDaMTvIeSTSlZZ5Vy9t4ZU7IGSZLSO98DCAEsV8kR
         80howYUUMOlbXt+9NgvaTou6K9ZrrlVZ7xa3E7KLIdMAd9VbCTYx/LXtK4WH4glTQ5hw
         n/IVTklCKfU1JSYHkc1ZhYZC0Mn5hpLfKIJ1YqjU0mz5U/mn+pnfQQpljf0G6DfgdSk1
         NYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718361276; x=1718966076;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+SCjC8XvS9+kPL9hXwY+0n971Ep94mX3iMJ+fsGN0OU=;
        b=ogdXzg91ASYT6XorWk4afZ1xKfUkShlVRK/UU4wOwfUef4/g5AlOdEbCEfNxcc3+Gb
         FT9Z/puX+SToqxVDFTIhTtugIN1IuCqop9D3qeS48Yc32Ao6YzXhLw6LxBDSFqaBg2yB
         MZ1ERaM3ss76BjiBdW9YjZv0eSe9VwGOMKzH1MA2voVqtCpeTtrVQnwEDspaJ+e/EbiH
         0J3RRkNubFzwijJmBZyI+JkNarXptJy+K+FH+M0xk5Ul488Wt8NK0SVztUzxsvA175ZZ
         6/wLAVipRqVU1sAvjUoAJ/tQBh9szT3lMVrMHWZFPt8vVKF5wOuEU5xVXCJBXHvLQ3UX
         kzng==
X-Forwarded-Encrypted: i=1; AJvYcCVdcZK6YmNch04nnkk1IWQyZdChqikVAI66b6FSDD/U0gD0qipQXDBmsy2FIolsbVI1O8IrJf6IMbFWCZCB9wej7DGfnthUekV91phQrg==
X-Gm-Message-State: AOJu0YwX+sdFTxZavs0tPGkGF6U4xuxIl2l3C1LUTRvTtN/ugbG0NAWn
	4KWKIG1kbvFDb+8g1u19/04tcI9EwSfUZSK9WNxM/QI1fzq5AXFW9pEf23Agtak=
X-Google-Smtp-Source: AGHT+IG7vK4xnfjr6ZMqA2Kxd9IDfZOyD8VGXKKkcIqf585oiI/ox16W9zrKDD1Ba0SGjvsjDJfYAw==
X-Received: by 2002:ac2:5929:0:b0:52c:9ae0:beee with SMTP id 2adb3069b0e04-52ca6e90a58mr1504981e87.49.1718361275860;
        Fri, 14 Jun 2024 03:34:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca282f1c1sm472183e87.98.2024.06.14.03.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 03:34:35 -0700 (PDT)
Date: Fri, 14 Jun 2024 13:34:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 5/9] drm/msm/dpu: move dpu_format_populate_plane_sizes
 to atomic_check
Message-ID: <gcwsfv7ieedz246a54fjyjgn2skkro6dsohdgf5psyz3aebro3@7yqnc2kqrwyc>
References: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
 <20240614-dpu-mode-config-width-v3-5-29ec4069c99b@linaro.org>
 <df63b33c-2e5d-1e30-5b6f-8af3d2bd2c6e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df63b33c-2e5d-1e30-5b6f-8af3d2bd2c6e@quicinc.com>

On Thu, Jun 13, 2024 at 04:19:07PM GMT, Abhinav Kumar wrote:
> 
> 
> On 6/13/2024 3:36 PM, Dmitry Baryshkov wrote:
> > Move a call to dpu_format_populate_plane_sizes() to the atomic_check
> > step, so that any issues with the FB layout can be reported as early as
> > possible.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 ++++++------
> >   1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> 
> Did anything change between v2 to v3 that R-b was dropped?

No, it was my failure to run b4 trailers, please excuse me.

> 
> Here it is again,
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

-- 
With best wishes
Dmitry

