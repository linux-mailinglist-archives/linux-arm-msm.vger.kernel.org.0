Return-Path: <linux-arm-msm+bounces-16305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF4F8972A9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 16:32:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DDA31C26302
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 14:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E3352F99;
	Wed,  3 Apr 2024 14:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EblNiMH5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6B2433A7
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 14:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712154746; cv=none; b=KLC5P/1s1d8tlByfCVbuEmTtJuQNsqaQENi8IzndNJtBFX8G9cupXTBEvWIUKJ9fNzUgApbEfFccSXq6Ujm8uPUcExE9E+/evgCMK6kuXP9/L84Uk3GNvgu5jBnf5mbRHlzwjkPqbGEKxfGPLiPJGOP41/GEAIZRDNd3x+6e9QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712154746; c=relaxed/simple;
	bh=aipPs+nNO2Bho5jPcYvxXCxYtS5rlWyrH/B5Kl5LKTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ioXfRQPyaFfVWc+kpgWhhHYiiPTg10QX1p5sI0hTVA5lpOqz01Hn+droK2MSQkali2OMpNE6ChUJK5ONW4qKTX7WhzDPo2uVol6gvTCcNsyovxqaQR96w0brmSPfuLb268+Ai4przKrFYVyt5zhK+AftB3c7aiOwtbbA4Duw+A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EblNiMH5; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-ddaebc9d6c9so6066420276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 07:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712154743; x=1712759543; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34CSkv0ffEjJCmKkTU1MygJJn6kuTYj1aCVEbSSRxPA=;
        b=EblNiMH5l8EgC02lIbwS5FjXf1LFOG0qTTbXEn+bbZoFVgj3NdjO5FBBEG5XK1h/m8
         GOlw7Xjzj/L+Kq9zo12noOv2ls4agJVOPJxNolzHVV973/U5kpLP2kZfaAaHoORG+Ks3
         kNNt0KrklA1ui4B60kfShEs0gFNFrJUNvpq7QFEmOfVk8Bvb94M1u8ZaAU27uPtpOb/g
         JX4lV4wu2a5wFIrl75S3dt690GzMg/qHWdJW+PenGawFinFsAxTAftvc8iQbnHBYVxau
         etfBj6IKjmI6lzKIC5Pw4INxUk1v/l4qMPCBr4VJj0zIyY9JdwIrUAivx+oV0kZ6lc43
         j9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712154743; x=1712759543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=34CSkv0ffEjJCmKkTU1MygJJn6kuTYj1aCVEbSSRxPA=;
        b=bj4vHntX2rf9YwjrdtKl7YayNYB6jMxBDpLlh5gRkWyqlgPw5mpZDJjbQCK9rOd5hV
         TGRxS3V+cQYr/bTeCnPRE3RS1kjjVmh/yJfZxV6V6BnZfR3sA7xt6RMrTW+dMUn8fbQX
         5dbqru55I/iYxiOYO0LpBqdjEMUbsZpHlobSNAYVutWZywDZE189BafUiri97QDyHAC1
         9m49znnrXeJLGJvFA5pS9nTPW+JqEINn6WULU4QRSEuxMqDsXA4VdVnysoip01ulYi6o
         nGsfBjMAeBZPz2a2P5ZfIorEGhchyatP0Qu9IvLZgNkfjLCMwSOHGpxRNcg/6OPPS+nJ
         zlKw==
X-Forwarded-Encrypted: i=1; AJvYcCVp4jP1XBNjTHEEYCy1xATGpkZ2iTtwRI0eQlVY4SmbmMJ/cV33eOmDAfxZT57HiKAq4J/rDIQT1dlfJ5J92eGO3d/+GBIFEa1cWDKDrQ==
X-Gm-Message-State: AOJu0YzvC6I1GsGNXEA9TAB0G8ZxLRRmYDji4adFrrKKROKOKPTtK1Ab
	AYXXcPXDf4PRNi1oXrRVQRAFG43nYNEqMYFiXyWUPlaN0Sw5TbwmQRf3yKqV1/KaDvXsTX/kGB3
	ObRW33Wc9zLAy3qwyTFlpl5Q+N9RnFh3leEbX+Q==
X-Google-Smtp-Source: AGHT+IH98EISaj94HpDi2rlmrd8w9Fj6vSdDh3ZnOjMDuCqy7Y1IBEY6ToBgt88nGS+ar9pdmZ/9uSUzzjKPwGwom1I=
X-Received: by 2002:a25:c543:0:b0:dcf:3ef1:1997 with SMTP id
 v64-20020a25c543000000b00dcf3ef11997mr14153649ybe.1.1712154742988; Wed, 03
 Apr 2024 07:32:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
 <CAA8EJprd78g0jM4u2uY-vZnqQibbWevjxqzXFaPohkvmyWHkHw@mail.gmail.com> <CABymUCO0cpixiC9Maz5cd-L91qzE3_4QF=4qvNodpzaOR4Vi-w@mail.gmail.com>
In-Reply-To: <CABymUCO0cpixiC9Maz5cd-L91qzE3_4QF=4qvNodpzaOR4Vi-w@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Apr 2024 17:32:11 +0300
Message-ID: <CAA8EJpoFA3JsxzYrCR7Py8AHcOSrxUZRPO4hMMMDr1SrQFsWRw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Add DSC support to DSI video panel
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 3 Apr 2024 at 17:27, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B44=E6=
=9C=883=E6=97=A5=E5=91=A8=E4=B8=89 17:49=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Wed, 3 Apr 2024 at 12:11, Jun Nie <jun.nie@linaro.org> wrote:
> > >
> > > This is follow up update to Jonathan's patch set.
> > >
> > > Changes vs V2:
> > > - Rebase to latest mainline.
> > > - Drop the INTF_CFG2_DATA_HCTL_EN change as it is handled in
> > >     latest mainline code.
> > > - Drop the bonded DSI patch as I do not have device to test it.
> > > - Address comments from version 2.
> >
> > Which comments? "Adress comments" is the worst case of changelog.
> Adopted. Will add more details in next version.
> >
> > Also, what do you consider as version 2? Jonathan Marek has only sent v=
1.
>
> It's wired. I see v2 in patch title of below link. Just notice that
> there is v1 in the link address.
> https://patchwork.freedesktop.org/patch/567518/?series=3D126430&rev=3D1
>

Ack, I didn't remember that there was v2. Please excuse me then.


--=20
With best wishes
Dmitry

