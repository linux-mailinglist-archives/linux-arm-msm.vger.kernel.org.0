Return-Path: <linux-arm-msm+bounces-10366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5115F84FC77
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 19:58:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1752B289E5A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 18:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C9D83CB7;
	Fri,  9 Feb 2024 18:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uf/pj6DS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC838289B
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 18:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707505103; cv=none; b=HRzxsKNz9HttHyV7j56WGIWvdOt8hF+FF+ZX2yKTmbKTLoV4fVII87yxuZCqDJfqjjkyjz9E6s0Ta4Sy5qC3Oo98RwyACGfo4ms8ErS1FLs2BoXm1K+/MAH0fHTmpAql6le0K1rswpZ6S9Jf5jnQkfvLvQmQ3YkPY9yDkCF4LxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707505103; c=relaxed/simple;
	bh=Lk3JaFxs2CfEJ8pA6iMQU8xmMZxQ9mIMQ/A1Nh5p8qI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ocQiUl3rgwkkPXTWD4U2HjbtnuS1eofZulcE5gJ+1ouvw7bnUPBzzsFeR4G4KzXV6euKqng2rPuEZ2qRilnv9+xbxF4vq492hceHOG8DMXLqoyVcRhTZzedZmxwWpoOEGq0MbvyOO1xINwlEAw6fB7Riijwj5hfr6zYLMexXqBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uf/pj6DS; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc6d8bd612dso1338491276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Feb 2024 10:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707505100; x=1708109900; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=awo/BCeLbFkRz9Dlg6VrbH43FXLlqcjUWJcmSLZJJiM=;
        b=Uf/pj6DSatD2Id+EVE6mRscNrKXJagoikiBImmxxLtD4cWI8i7vooq9yzYIbSqFwc0
         reLmFsS/cDczuSTZ21mvInTDlq4RbrWvCjgJyqyJvB1SacCc0Kv8iKzpF6YGRmtKMz3h
         IuX+HQXrSOqkByHbJUenGjhYR/evVd2qNVpJv5Dbgt7u3/f6URUJDsgeUH7zWdZV2os8
         qK922fWZ2z+sOHNabf5kta12SxCdRLXqF90POtuJ7e8SRVW4IlhPNjsbbw9KdYCz00mt
         GPV28j9Ure3FQfW2QmZLs615krQ3TKynsMAMHbA1OlpD6ixEI7g7yXPM9+OaVsNM8qzq
         DKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707505100; x=1708109900;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awo/BCeLbFkRz9Dlg6VrbH43FXLlqcjUWJcmSLZJJiM=;
        b=IDlQqWFjN1oaod68EsZpcQroGn6mSlVqAtEqi4AJ5w85aMSFwFng2xOvYkuvLTmTXE
         WwIvuZJmnt6tKkIWfsvQtFbpldQF0SUs7RSb8UcaGxnmPc0OvlR9IEPBBIcSVtVgox3D
         89z/zvSGXYns2lmy2v1HXUyxqmNGOiJL+kbY02QjlHSExOJDNFyhtU2x5NjtMrf0/rt8
         dfq5A9V/it0kaqtop5pnfliXrPYUdrXtDRXgEbzUXydwNx6OiM/pgjIsrmp7GnRu+jKU
         ulGrtXdqH3kWPaK3uWAffq0ZeSO2AQ/XZp5JjV9g6nuqOCQa6aELldMDv/ztCBQqkT4i
         9t7g==
X-Gm-Message-State: AOJu0YwIyB7SYRzeUAXwYxZzjMktEGUGpWmFOGwPlZIj7Xlx6P2EhjrN
	G9CEi2t8elCKxr7CHmRD+khyE0tvJc2sZMC+8QPYI+4bY3eAaXdVl+wTxhytgU6jPpRVwfMiVfo
	3mIT2vd/scvDdsApJwBUYfq1lSMnD5C+jsszeZA==
X-Google-Smtp-Source: AGHT+IEb9542YJRhGlr5tTb655Bco/sIqzumPYkKYYv3shLKDvBLR/Rw+lw7ROAYYvzXuW7vbjo071txTmkH+A3fY7k=
X-Received: by 2002:a25:6645:0:b0:dc7:492b:aad with SMTP id
 z5-20020a256645000000b00dc7492b0aadmr49982ybm.2.1707505099966; Fri, 09 Feb
 2024 10:58:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208-fd-migrate-mdp5-v4-0-945d08ef3fa8@linaro.org>
 <20240208-fd-migrate-mdp5-v4-2-945d08ef3fa8@linaro.org> <9a4bf513-4390-3e36-f3b7-f9fef1c296fd@quicinc.com>
In-Reply-To: <9a4bf513-4390-3e36-f3b7-f9fef1c296fd@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 9 Feb 2024 20:58:08 +0200
Message-ID: <CAA8EJpoVivjg2KKVgf725C2cwMCOk=JK6hz65ewTheBAb8t_vQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] drm/msm/dpu: support binding to the mdp5 devices
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Feb 2024 at 20:44, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/8/2024 7:01 AM, Dmitry Baryshkov wrote:
> > Existing MDP5 devices have slightly different bindings. The main
> > register region is called `mdp_phys' instead of `mdp'. Also vbif
> > register regions are a part of the parent, MDSS device. Add support for
> > handling this binding differences.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 98 ++++++++++++++++++++++++++-------
> >   drivers/gpu/drm/msm/msm_drv.h           |  3 +
> >   drivers/gpu/drm/msm/msm_io_utils.c      | 13 +++++
> >   3 files changed, 93 insertions(+), 21 deletions(-)
> >
>
> I thought we had agreed on a quite version of msm_ioremap_mdss for
> vbif_nrt_phys?
>
> Anyway, its not something to block this change. Hence,

Excuse me, I'll fix it when applying, if I don't forget.

>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>



-- 
With best wishes
Dmitry

