Return-Path: <linux-arm-msm+bounces-3802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA7C809899
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 02:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3EB67B20DB8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 01:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35AD15D2;
	Fri,  8 Dec 2023 01:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UFgbV/f0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB9D31712
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 17:25:21 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c9efa1ab7fso18906821fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 17:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701998720; x=1702603520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUBLaybwTm71uGPidtWtYcj7suB58tDThikG9Ry5Y4U=;
        b=UFgbV/f06Uzb6gF5GLkrzYH/G+swr1ZS6mlfHH5QjXSJGTiCMgxvLd8g0Jfq+K+MX1
         tdiPBHid+z7+Zerri4o9zBWzpQrIZ+1EqwO4GTThBhFqSjmdPXQxCZZRO6mn9KxU0pX9
         KdEm+rSgsXH3l1eUzIC/hzngULRVCdYY+p+nzUaPnoNuT2XsXzR6/NvK5fakkgChPiV4
         jhBcss2ZhLoo2bAli/OXl3KQneUJetSBko8ME55VOdwN029oxL4IQf+wnuRFUa0LMWpl
         jbxUziMI1CtRtq0DX1cr7B6XzoYsH9FSOZtgMbzAT6kJDjtfO/Dop0SrpUfMOjBreBbI
         JP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701998720; x=1702603520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CUBLaybwTm71uGPidtWtYcj7suB58tDThikG9Ry5Y4U=;
        b=UHB3G3j4tiV5xZzel7ChxYnBF3FtI2U8KapP2I9lSXirylMl0o3V8o+u/5IG0AcBVp
         2YeUU1wv9UyGfjwwCVepGallAeEMO9RHqCjvkgtyUnMdqTyzv9mIaFBM68C9unBzPhon
         BQ2WdVsRD3fkQUo9Q42T+A1bwB5NocqdOqQGmEFVkmOOXPV71rm2pxjmxYI+JBsRZZAf
         HaRCONG1o7ruR6j4UuwSfkM7kHRO+EJvfJGbKpwhoi7C2ku+lchDFBekjKw0/2g6Dvq1
         YVBZ+ux8MDnu9rxLGndWVP84eMaB5rRKvjUYxEhBhjrHGM7ZJQm8MF47xwQT3Da0eccg
         ldaw==
X-Gm-Message-State: AOJu0YyjfIcT0MTwiRzRaCDydvuQCRBdlv9Pr/2lw/QVYb3mclPp6IXF
	8Qkhu1B3GI7XMVTw/GFJNlYfzw==
X-Google-Smtp-Source: AGHT+IF9bDKrRKCba9gxrOM/tv9o1YC1+NYXv7vs1r/qhP8tdOvA0jMXldtsflhEAx2LflOS1OjuMA==
X-Received: by 2002:a05:651c:111:b0:2c9:f427:9e52 with SMTP id a17-20020a05651c011100b002c9f4279e52mr1019018ljb.134.1701998720030;
        Thu, 07 Dec 2023 17:25:20 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g26-20020a2ea4ba000000b002c9f58169a8sm88639ljm.120.2023.12.07.17.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 17:25:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Vinod Polimera <quic_vpolimer@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: Fix platform_get_irq() check
Date: Fri,  8 Dec 2023 04:25:17 +0300
Message-Id: <170199868355.3399536.717291970669174612.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <c12bb69b-d676-4345-9712-48aab48f2b48@moroto.mountain>
References: <c12bb69b-d676-4345-9712-48aab48f2b48@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 06 Dec 2023 15:02:05 +0300, Dan Carpenter wrote:
> The platform_get_irq() function returns negative error codes.  It never
> returns zero.  Fix the check accordingly.
> 
> 

Applied, thanks!

[1/1] drm/msm/dp: Fix platform_get_irq() check
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c4ac0c6c96f0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

