Return-Path: <linux-arm-msm+bounces-15239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D2788CAB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 18:25:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A422B1C66011
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 17:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C49271C6A0;
	Tue, 26 Mar 2024 17:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tflyxy7o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C101CD20
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 17:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711473943; cv=none; b=XV1xPv3EqZXV7ZjgP/W6xJ5lnrAn4ygMY8EZk/vhagc+KXp927+/uvQoKNlJgR0KukrZeufoA0WcX1it0B6ZhYl9IjYO5MwujbltjkihOpK4t5s0SJOI+5XHJ8pbaiZzk3J0OGzWMEv0f2fJW2WzjuqMdq6JzHV8qJV54MgxS34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711473943; c=relaxed/simple;
	bh=yyQwpK/tvNeVmAcL6V3vNVLP7qfT3WoMXUkxWnz/n9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y6qWYZbuGFywe7QN4ppgWxbGb5z3fy6XFJ1KQ1JsB2fVIU7rBR5z/GlS55BVzLO3/CtnmeCggeRD0ZOgDxoI0Q71bebpCtcUQ92YnOJ4ReCnzRqkrRcajg0InHMIDGnWdldX1eg//c1vT8OLXZkNWuqybR2bTJQVLqJj1baQqeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tflyxy7o; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dcc7cdb3a98so5871050276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 10:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711473941; x=1712078741; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TEdNW8/uGdjjd6EX6eCNJ+oK6HuOhO4oxjWYMugQ7qE=;
        b=Tflyxy7oNp9t0pU1CyrGyusUO4RAs4dtRi6Vr/VNFfYX84cS/UgkTlHxFFgSHcw1jT
         4Q9pMnshnr7o0O8cbgHIqhiXDHCfMCC71zMpsB/pucunGktQ9F6JSy0DYW+HAJ7lRBF7
         xngC+ptCYxLvTEa8JSO3VeWYYdUBIrEwVzpFm7pccV0iwufVpimC2nQUy5qRSgFjvI7T
         qpZ/+96MIDs72oIUhOL02yefixAINQBzWkE4ynzaSHQLnS5kWOUur98pj0PfevxvJzeY
         rdhY+5xoC2zDCghGztRolBcgY0Y3cWYPnnCzCBhTVAVnL2E0ynx1lPKySv7CWdNPFCUO
         nmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711473941; x=1712078741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TEdNW8/uGdjjd6EX6eCNJ+oK6HuOhO4oxjWYMugQ7qE=;
        b=vlvKmHzj3Zf1Lqu2qP4f3nEkQItIqs1ovOUFdQvGLYwgC3ivKuTz9LD3hB7N3Ci62z
         ChC0O8mwK7QG6UxyuNLjZaVmYa9ZuXOP8PtLbdJKUq6SffkTmFJpuHWQGef2vh3LuLIR
         pVl3N5TiQwkgzwrC7GS+XSifjgdRvca/gHT0L0ELIpM8mY7LKsH6CRE4BgJK397008lJ
         nVcpZyBYvcoM5iC1viukFO6IA+7XjbmlrgUMkaGX20bR6G/8oYDg+HwuS479Y93Ahs7Z
         d42LM6c/22lbRYCh0cqZemSBaypJciyVWHORmLP774nGmV2NJZM5XrScyNtS3eRmkpYJ
         F1QQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUhSA3OaHFbG34P5bWTEE1XLy7aHcKZKSeoEEiqTK/UuCEPyeYV2+Cv+YHB+hUlrOeJ/MUIsm7vWo4vw7fEpvIJYlcwAxjvx9jQPXkPA==
X-Gm-Message-State: AOJu0YyxwzQOrD/ziw070cElEo/Bp4MZHt2Ly1WFLFcwjkzWerrDJATt
	w01/E6DCepJsM5mBnmE8G1RKmGNzbp8QEet0/S5DG3NVzqZ/lxS4yOM02bjjiW9g6uy5x+3DGjK
	eJIOzXsrVpBbEwRFbC3UyimKtNDlZnTVcRIDS4w==
X-Google-Smtp-Source: AGHT+IElgsfXK1k0/1DM7zOc8OoCYkRnDISpRbo+Bkm3BattXbANP61MPSEV6vui3iEtoCHBc2Kn/kL4l17pBRyy4Qs=
X-Received: by 2002:a25:db85:0:b0:dd9:2a67:f470 with SMTP id
 g127-20020a25db85000000b00dd92a67f470mr1553098ybf.25.1711473940945; Tue, 26
 Mar 2024 10:25:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240326-msm-dp-cleanup-v1-0-e775556ecec0@quicinc.com> <20240326-msm-dp-cleanup-v1-3-e775556ecec0@quicinc.com>
In-Reply-To: <20240326-msm-dp-cleanup-v1-3-e775556ecec0@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 19:25:30 +0200
Message-ID: <CAA8EJprVYSSXj5y2TDLiUVTR4r1qaYjgbBDswaHAFeapQ0wPcw@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/msm/dp: Remove unused defines and members
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Mar 2024 at 17:06, Bjorn Andersson <andersson@kernel.org> wrote:
>
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
>
> Throughout the Qualcomm Displayport driver a number of defines and
> struct members has become unused, but lingers in the code. Remove these.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_audio.c   |  5 -----
>  drivers/gpu/drm/msm/dp/dp_catalog.c |  1 -
>  drivers/gpu/drm/msm/dp/dp_catalog.h | 17 -----------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 -
>  drivers/gpu/drm/msm/dp/dp_display.c |  5 -----
>  drivers/gpu/drm/msm/dp/dp_display.h |  3 ---
>  drivers/gpu/drm/msm/dp/dp_drm.c     |  2 --
>  drivers/gpu/drm/msm/dp/dp_link.c    |  4 ----
>  drivers/gpu/drm/msm/dp/dp_link.h    |  1 -
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  2 --
>  10 files changed, 41 deletions(-)
>

I'd have preferred to have this split into somewhat logical chunks,
but I think it doesn't make sense for such cleanup.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

