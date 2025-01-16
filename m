Return-Path: <linux-arm-msm+bounces-45279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3972A13C73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 15:38:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5515D1886CF0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 14:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7384022ACEF;
	Thu, 16 Jan 2025 14:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="du1iJ+CL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8E11DE8AC
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 14:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737038327; cv=none; b=HQkgCv/TnhvYuY5Nyn5BeisOG46Lh0AhNMGD4zgZ9oob3wkMWx7jGDcY/rf3zgYvbCH7hQknXETAvTyED/3ZAdZK4pfw3IpDg3XE1/NF0easFO0tDmVJ7K8w9cloQPYOCZnuwgzFrOlKTOpxH41usVcnPr6KxtsLB+O6AwA3XBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737038327; c=relaxed/simple;
	bh=s9KX3OeX0oh2Os+s17soVzF76QWxE1ZTHrMz39gkecU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bytx8iIA1cb3SRLYWPaf7abLM2CKtmWggHZSBclKxy+/MnhqjArfcldNXjw0fRFCiYqpR2cGOVwVBN/lhoBHo2plts3tc18rXo/3XfELK/nVYgWGCNvfLjM/KzBZEabTE43dYcy2eJjY91NwPkYrXpFafrcc9mnKS4SUqqUeyh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=du1iJ+CL; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e46ebe19368so1587275276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 06:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737038325; x=1737643125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sUIcPz38QbpKX9h6m3eh8VNlVAfuLU05xadyi36SFA=;
        b=du1iJ+CL1K4ZWmgu4og87UJXODRnIOigtLikRcEAftKY+d0tky+jkZupM+Kw+rZ2nt
         M0g8cfzmIWL4YNS+s2xJIE/TMcd6bxo9mk6aaeFil/D7hNG+1YDBLhVnfKxToltgMiG1
         yv8mIjBK4KTi5k14Fndfu44dTTJ0iqBJkg+O53jmBkYYc5D21usqCESf7nQydxWp4MOY
         bqZ8FdzRys7JOzKrvbCiYbXnCtk1nKgj1ncpw4vdLocDs+7ADhbCfzcj07lk7CInYSxw
         lJtOiqf3dokunzsONx9ZgcsEq4rGnH/1G0J4x95T6l6Vu1pC9DLHuAn6IkfpeRX1+7JJ
         QUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737038325; x=1737643125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4sUIcPz38QbpKX9h6m3eh8VNlVAfuLU05xadyi36SFA=;
        b=LCkVTtCqq7sXNEqiGh3N3lzyh/E9L/OzoilBDuGsVpb1iZT7N6RICe/2WCQX6S7evl
         uYai5N33osB5ibzNEZD8ySQLJWE7zf0sfgXH2fO7klu5OOcYx2wa/KWG7jxiLfWdZDy3
         mV9BM5mU8lPT6p0wvU7rBSb5kbVu1ZgMvH/Qdw4mnZvSnGJs4kiAhjaI816ToZDygYlM
         dkxIJjuxqhQcKwZNR77Os2rRtpqk/W2CAFuztv+mmM1ph63qzJc5Z/NV0Cm/sNv+4h9s
         60QJzadOh/om7Aii3rd5lUYDHpNzo56DJuYorixOEX0V5iNeps4uya1GFrywmKWQL718
         Tasg==
X-Forwarded-Encrypted: i=1; AJvYcCVm2/Dyr4haIbf1tkGp5lfM50zWo1sh7gfBhIwGPvGOdB94TJoS+p+xV5EVjX8bxaAuTxYOuNkVFBavZjuI@vger.kernel.org
X-Gm-Message-State: AOJu0YwHe3ZKRUAgFrN5eSbINb3+EOp32EbYvcpm9J7g+ml/vVGmE0vP
	MFWxfs+sqnS2V7k3NDBBZADdpqIUprWnXMt/ShXnidT6KNuqC5nmx8J56+uxMGJ/0DJ0pjeN3hv
	UbwB0NZd54r5LdZ7hDAN3JWhyAiYJmZ8k/ayjYA==
X-Gm-Gg: ASbGncuujaxRQy861nIrozAXEZvJW2LTMqLgghjzaFJWMvBHn8MzF2LSiuphqJXBO+8
	MCvj7jDeQ9LRTYmDOMV5svck9nqQpLm6v3kVE9Q==
X-Google-Smtp-Source: AGHT+IHOmbG1mD6fGJJB2xukA+ZpXzy/YryWJ0zz+QlXQESUVO+WN4GQocRWOc+o1TUVXuEW9Tg1LF6+dlVSmsfz8Qg=
X-Received: by 2002:a05:6902:13c1:b0:e57:935d:380 with SMTP id
 3f1490d57ef6-e57935d04c2mr4699707276.47.1737038324734; Thu, 16 Jan 2025
 06:38:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-1-74749c6eba33@linaro.org>
 <ra4uugpcufctn2j2sosrwxewlwpivsmc6tidadf4kuostv4cq6@ev4di2547lla>
In-Reply-To: <ra4uugpcufctn2j2sosrwxewlwpivsmc6tidadf4kuostv4cq6@ev4di2547lla>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 22:38:33 +0800
X-Gm-Features: AbW1kvYbGirLS3atLWsRwGLM7BY20-3qOo7Ga2zt7Vg794uzAKzvm9X0mlofT5c
Message-ID: <CABymUCPc5z+9SLeKy04Rg79B9sZUPUf9osJ6UJMKiv2cTXynxA@mail.gmail.com>
Subject: Re: [PATCH v4 01/16] drm/msm/dpu: check every pipe per capability
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B41=E6=
=9C=8816=E6=97=A5=E5=91=A8=E5=9B=9B 15:44=E5=86=99=E9=81=93=EF=BC=9A

>
> On Thu, Jan 16, 2025 at 03:25:50PM +0800, Jun Nie wrote:
> > Move requreiment check to routine of every pipe check. As sblk
> > and pipe_hw_caps of r_pipe are not checked in current implementation.
>
How about this version?
    The capability stored in sblk and pipe_hw_caps is checked only for
    SSPP of the first pipe in the pair with current implementation. That
    of the 2nd pipe, r_pipe, is not checked and may violate hardware
    capability. Move requirement check to dpu_plane_atomic_check_pipe()
    for the check of every pipe.


Jun

