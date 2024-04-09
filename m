Return-Path: <linux-arm-msm+bounces-16855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BD58F89CF9D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 03:08:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4AF3B22CEB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 01:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69E3F53A1;
	Tue,  9 Apr 2024 01:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tV9xse1W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06D24C85
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 01:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712624917; cv=none; b=NQ3Uiv5/RbSgB0BMv4WgZElNHSyT0NSkad6oLrBduq19k7JtveTLNW4ekfFbA9yZrzs/NMxsB5eqJ1Tdj5QXMitzWE/fNnXnpT5rAxGB+DI8RTg3Ld+iuIVyCfWu/VlEhjk9sOIp2m9xCBDv3eX0ZAeB5eptkvDyjHCfEdNh2P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712624917; c=relaxed/simple;
	bh=LBwhlCZISB2W+Dbl7vZfWeWvtRLIIIDG3aeJd90Kjpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sHGJh1KRlY8WpIj2EtYMVc+3FqZjzwlXRCnM/a9iRB6PP89WgGxeTvuHeJagH/T/7SL4oBfgsOSWNoVPL0lSQi8DmKXP2DazpqCFJ8Dih9/p/PPn/s9bev0Eq5TBvtmcATHi5CkyX3xJmjokRigfZEi0HGAYSpeecKuTYzfv/qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tV9xse1W; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d47a92cfefso64565721fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Apr 2024 18:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712624914; x=1713229714; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y702sD6lZazSpofQh99p5zeY7MVLXMvfgYYg7IYQZsQ=;
        b=tV9xse1WfTDoPmbYNdQ/CF6BZcXVbjZZL+mo0dTVwtlVDL47LGc/ih9M+VuO78AVxc
         Dke3l3XglI+mj7iTJM4CWjZEi1XBKOeQNPg/aZbRVRQxHkic2KaA7JJG6iPhTPr+HN53
         Kj0HjQpy6UydHfJBFhamSDPC7w+7Hii+rOvc+LMy1XA1rsg0f4Y7HQdAvHYlU8sZvOU/
         fLq8gGv2aTqfJK5xrmVYC21xhojguoFVGBcGhhKXPRk/MheWXBqmntXDRagq5AQA4nYa
         eeJ+Vmea/57+WU1vZBbVTGAQrGSdWbP1qKrf2yUqb+VLPUlHQS2XOyhHrzLz5NZJbthT
         /2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712624914; x=1713229714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y702sD6lZazSpofQh99p5zeY7MVLXMvfgYYg7IYQZsQ=;
        b=YOEOYsNW0Hf0FOJvsLt9HuBrmtKiQOLV1w0pf0pXnN29e0A4cQTiY1EIJrwTkek4fG
         SGnsTlig3oVP2nQOLJb3ni0kJuZcA210Z4s1jC/Px3eQEUGykse9VQui/nLESfq54yat
         GIFYFmIn3K68tCt6FAyKubl/fr5QK9E8hOKScaGUJtXWJhbsC40KN5DCJXblpHxoWG+Q
         0CMW1w+UQywJbUUM2PhYQK+e06xzl7ZnCodxhv4uelghk60zkw3fWC70/swVSnuktoTc
         eVXC4x5cKyWpmMRQG8cdVdLtLafP8sN49LWYqodr0TEAm086+TzY2rnpIFsatC7LdSRI
         EJgA==
X-Forwarded-Encrypted: i=1; AJvYcCUz4hGELql0mlIgA6rcLiIN6oMDg/JN9kf3Ghv9tI8gxCWCfDJWb/Ga2bJ40icnS5iu/tLlLzWrvv2fRfecb4oaVola1g4TUzqeeuuwKQ==
X-Gm-Message-State: AOJu0Yw1bRsF/2nP35rBzeQTgy8Y03fXMwslHUyum6sduTNWKuqlgN+5
	nGKOsNVjQUTDrj7q9g6KM1ZikS42zFG3uhMww71XEf04QtS4JCSrpljJBafGQ2hTIma+Nabturt
	FsHaQRZ3mkN2zZ+HOemxK6wLVNC+x36bfpbHPAQ==
X-Google-Smtp-Source: AGHT+IHiy9qBSXkFrD9zOe8AVd14AwotGKD6BHTslXygXNglhd/58kA0ThQYKsDSq4+gjwlvtr0FPC+LDTBg0n+dnPM=
X-Received: by 2002:a2e:8913:0:b0:2d4:5c0c:77db with SMTP id
 d19-20020a2e8913000000b002d45c0c77dbmr7214260lji.3.1712624913705; Mon, 08 Apr
 2024 18:08:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
 <20240403-msm-drm-dsc-dsi-video-upstream-v1-3-db5036443545@linaro.org> <qlabqrtsnw4mu23li6r6liujch5mf7n2bdbuuqrsukwfw24bmn@nyw5sandj2cu>
In-Reply-To: <qlabqrtsnw4mu23li6r6liujch5mf7n2bdbuuqrsukwfw24bmn@nyw5sandj2cu>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 9 Apr 2024 09:08:36 +0800
Message-ID: <CABymUCORNVKOnNnZEhzLC9XjPuDOiVGuJ-NCh-r3VCXT_8o1fA@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC
 (fix video mode DSC)
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Marijn Suijten <marijn.suijten@somainline.org> =E4=BA=8E2024=E5=B9=B44=E6=
=9C=889=E6=97=A5=E5=91=A8=E4=BA=8C 00:45=E5=86=99=E9=81=93=EF=BC=9A
>
> Can we drop (fix video mode DSC) from this patch title?  It looks like mo=
re
> patches are required to get this done, such a mention is more something f=
or the
> cover letter.
>
> We could also clarify further to "set Word Count for video-mode DSC".
>
Accepted. video-mode DSC is achieved with the patch set, not this
specific patch.

