Return-Path: <linux-arm-msm+bounces-59268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55443AC2A92
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 21:47:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16F674A5A0C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 19:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE6D81741;
	Fri, 23 May 2025 19:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MsbVjZNy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E40199FA2;
	Fri, 23 May 2025 19:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748029640; cv=none; b=hCdYNASmZTJEsdoekvA9qq6LxhFXsgIjyJXuMmIWdsuj+1losY3c4X4H3swVFZhR5Ov+dTMQFQKmXDM+OtUJHFFsjERx7j9Lckk0sArK0FNl1amOYyMGkRLJk0rQheYq6QZIOSvzIRpnF400x2rNIUqg/Pxoa48AU7gA8z+lB/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748029640; c=relaxed/simple;
	bh=+VynkJKUi6iB0jWAUwK9ODcIAFLrKwGyC512ufHL3RM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZjEtdM1qjyOhO5HQ8En6T8YBskTpB0qUiVKJeQdYxs38UdRuJnxGy8DXZ5GIIe6AoTUyfAp5VAmN3balhVbkKJ/xiMUNsDgIJdeMJsD0nSW8QWruXaY1NjUQqKUlV84HE+mWvbhYv3dlRC44rCixrtDIy+RhDgDEc2kmZscO8Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MsbVjZNy; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-867355d9c4eso5425639f.0;
        Fri, 23 May 2025 12:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748029637; x=1748634437; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xTx5Tkcc4tAifmBrsylr4nsmEii+zQ8+Jh8552iEWQ=;
        b=MsbVjZNy3d+EcubickxCF/5lGo1tF8hGfVU1JuHjDxf/pLHrRjV4Sf76uToyz+BFdn
         MU4rXDjwOVvMqRFPqoPL0wj6CWUNyix5FjPFrmngAOIfHwhL19q/SU1XyLvscLaGBhFm
         VWXdEODycxi4SeMQzEe/IDMoey4KEUpLiJ7qwwVXuiteP2n+xh+IXqZI/AhrGTNt6KZj
         Ot4peoSXD1zgIT6LZOSE5GxaFCoFwERMjP+mtW0X1fB8YCj+KPHJGaKnitNbbC9dGEm2
         dA2GRSEw2zx0tT9PNS3IJBNEOHUkLtgHcNo39ulg0F1nu4s53/cxZNF0Xw4UMcNiYERu
         jxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748029637; x=1748634437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0xTx5Tkcc4tAifmBrsylr4nsmEii+zQ8+Jh8552iEWQ=;
        b=Irr8TuI08p7ZZfMOApJuN23IhkDdsal9OXoUv7BFl5tUiOIGeo7ZmaJrh/DuKi2iYg
         KOilrdLP7w8a2WPYiOM86gJm+Y8TZ5a51IPwa7hI9EQN1EeB6ImITgrhNbS48oEAtXfY
         1kDn7mB409e5yNZGyBkH9idNMLMTQ2XOJgxtibn3tzknm7WSVegMdsegx6CS4j37aVdz
         30nty3dxTjM0KjyrmdbpBOPfDNwQY9YI3ojOzkAhgc6Cc8CXVbFbHunNCyEP0ePxDv8O
         BAhrLq859Rw9mPXCIhpVeP5apKU7tGRTJNrrVfSbJcSaKhKeTAdeFa3I5/HiLdqcObCe
         AS6g==
X-Forwarded-Encrypted: i=1; AJvYcCX1+P4F1Rmu4hQJFeNixLnbhayeHPk8yB32q6k4gj+0RbskOReANWCA/NK5Nw5eiZwaQ4vrKkR+xDu6rJw/@vger.kernel.org
X-Gm-Message-State: AOJu0YxaX5OwXZ8Ow24gWRvIfJlaA1k2iPZPJzPlvzaspIREKDqUiOT5
	G8cjka6/MuxPAXch3WnF2outf/2Yl2fqM5LSImGQs7gPmcGBEUiEJd6aAj8F3kgVHbiY2g61wNB
	9ZG9LxLNNrKzwBmoRrpHr/8WDYQE7C34=
X-Gm-Gg: ASbGncuwDiTzWiMhVY7XpqVzOctQ/qO7QHank4ASZrJPwE9RUI201i1QsHsPJgBY4Vr
	/WnxFU4+3tla+EV+TvuCY8olv6GLj3AUUY/9D418508tLoIlfzNbBVzIYp98VGoT5MiZLS/llVb
	yClshDfQOLC5nBy5/Ei/x9ecsn4PmVLzg6AqXokKvurbSgewBfLY15NK3hgsaFkQM=
X-Google-Smtp-Source: AGHT+IFWDje6NNTquxxAPXwoxMyqNzaxL2uF7sc0xx1f98VZW5+HEkKLTmIJ4UiMx/tbe6xDWDKiVZOs4DRHe2tC0YA=
X-Received: by 2002:a05:6602:481a:b0:864:68b0:60b3 with SMTP id
 ca18e2360f4ac-86cbb8c26efmr90424439f.12.1748029636788; Fri, 23 May 2025
 12:47:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523-maintainers_update-v1-0-0396d439d6af@quicinc.com> <20250523-maintainers_update-v1-1-0396d439d6af@quicinc.com>
In-Reply-To: <20250523-maintainers_update-v1-1-0396d439d6af@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 23 May 2025 12:47:04 -0700
X-Gm-Features: AX0GCFvBY15UeeGYGwIEPRqVrDOITLOCIOYTf9QLT4deGUW6CYNsO2N0tvqvzOo
Message-ID: <CAF6AEGtR5CmrjKkqj82gpdJ8s5FqxGvkiCDNw=ZtcWLf8jbTFA@mail.gmail.com>
Subject: Re: [PATCH 1/2] MAINTAINERS: drop myself as maintainer
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: linux-kernel@vger.kernel.org, jessica.zhang@oss.qualcomm.com, 
	lumag@kernel.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 11:27=E2=80=AFAM Abhinav Kumar
<quic_abhinavk@quicinc.com> wrote:
>
> I will no longer regularly work on this platform. Hence will
> step down from maintainer duties.
>
> Also, add Jessica as a reviewer to the MSM DRM subsystem to help
> out with the reviews.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Acked-by: Rob Clark <robdclark@gmail.com>

> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90b70f37006dbbf3baaee2c7a481e4fa49bfb3f8..3bc0da6f9033be0d5da35210a=
84ba189be4e5c0c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7638,8 +7638,9 @@ F:        include/uapi/drm/msm_drm.h
>
>  DRM DRIVER for Qualcomm display hardware
>  M:     Rob Clark <robdclark@gmail.com>
> -M:     Abhinav Kumar <quic_abhinavk@quicinc.com>
>  M:     Dmitry Baryshkov <lumag@kernel.org>
> +R:     Abhinav Kumar <quic_abhinavk@quicinc.com>
> +R:     Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>  R:     Sean Paul <sean@poorly.run>
>  R:     Marijn Suijten <marijn.suijten@somainline.org>
>  L:     linux-arm-msm@vger.kernel.org
>
> --
> 2.34.1
>

