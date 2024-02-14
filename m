Return-Path: <linux-arm-msm+bounces-11081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D908F855325
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 20:20:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6ACD01F25ACE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 19:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E104013A86D;
	Wed, 14 Feb 2024 19:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RmG5T9yC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B14713A862
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 19:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707938429; cv=none; b=GhCl/TATvMVmUDlU3Pde59Ic3NxEC6pK7LmL8bUxuth3cDVUrk59lmUcIs2extLVoBmj4pWwCe6g3Nkp6w+yQ0T+dvG87GxqE+dOKtRt4jVWU6PfEnZDxSmuLpRW4CpsFApL1FslW1LtxU0CDKYM+y0e9Eh21gNtRfH8ewnMN0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707938429; c=relaxed/simple;
	bh=ywy9whWYwZRcUvzsB2Kq9UU/4CXmTdpich4QQ2qzTD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OCnu6Qeop0QKrtrhXvZAJcL5feMLQz37rJ7oDWKRxYpHKjBGw62jJMEd2JsEK72GINGwldayhfemIzccnisRRTs2IHTuSps4VMcc7qnRVmTlJe1aXJeWsSSUdkn7QigDYaguAF4CywFBAIMH8m2Br4VNzkrp6yl4hENBXT3zSYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RmG5T9yC; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dcd7c526cc0so17650276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 11:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707938427; x=1708543227; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B73bS06AIkXzjnqoVP2qP94tAmB+abCne/7xyPl1XbQ=;
        b=RmG5T9yChCDZyZ1L9ta8EteYXxkmXUaHqLqIl88lhsNgM/tVzS6vXlTlh847er1aF6
         pydVXHYKYRQ9wcEhjXe+gYJUjHgIABYeSAMgWbMA2jHK87ZBMNZDrwLMSSDfdmnMGubF
         Kqpc84LUSHyt3hUvQ1ePV4aZyNqsRA0o9PMxxHINxjv8Sy+oHakNKKDuR8fietc+BlMa
         KcVk4DguRYs1rPCitMv3hkqc4UFB4dJzJHKOGQmkX2nhBznOOheGFCR3nxCrqU1cjqAz
         lAib9ruN1NPyDUK6+4yYBAhnH/b5JOr4s+24lnT3zNslvAUJ2keZQONwiPNJxWX2EppR
         wgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707938427; x=1708543227;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B73bS06AIkXzjnqoVP2qP94tAmB+abCne/7xyPl1XbQ=;
        b=BPfhWYAJ9AWXyTH5L1G22OCZByqV3INWBOBKKQTskfsLGakVzvKNbc1LZkxK1uQYrS
         VBZKb4AjJzlKJDDcVSMc6Yvbqu83dO1x8nkTE/iQ9iEcHMcvqM2XBGLCnFTImIUZl6DW
         Y2/UEMi7Y5IAVsdICfvs6Y3xFS5/lBhrtuLA7GHVrRbo+GXXq3SgxwLKQw1G2i/qjtcK
         zbTNMwEQW1PyhhBbZqhCAxmiza63C31H2yaoVQqkq7wBlM5qr5Osm8ZuqnydVE2b074H
         8d6daJ0egcjivLl8imoSSmWiSP+T64Qkocww0t+t1wZCuvpMh72T37+5nYd+wNOrWkpX
         4vbw==
X-Forwarded-Encrypted: i=1; AJvYcCWmcvPpU7PkXwpFUAneFfk5yzJjDAPGD1r6C/cJv7cxwUZVOJjIpa4THpt/twG5jBF/DWuxT5dENMrF9C4/ldeTeVwAWvlBY0Wg1247aQ==
X-Gm-Message-State: AOJu0Yyj0QtiAFnL78tolhuLJkuIGnBJ6cRYk4UYaHiFyONoajBS4DK+
	YV0M23IOz3ASMViYbQooWbnC9p/xmCc/82vjHBxPVlpb3o7PSbQrqOW772xFE/u5Z5ywVfmuwk+
	AtJSpI3xXtw/QbYvZd/RxLKmEd6i827ZDIPpWCw==
X-Google-Smtp-Source: AGHT+IE9s7xRxFgyDDO/OOi6qfcHjatwcC09w9tCG2wbS1m6yq9DQHisEE7YMYJmWehqqbTOKLKef79RBRk0hbjJOXU=
X-Received: by 2002:a25:4156:0:b0:dbd:5bfa:9681 with SMTP id
 o83-20020a254156000000b00dbd5bfa9681mr3218536yba.37.1707938427173; Wed, 14
 Feb 2024 11:20:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208-fd-dpu-debug-timeout-v2-1-9f907f1bdd87@linaro.org> <1cb90bff-ce5b-c6d1-a3df-24f6306f833a@quicinc.com>
In-Reply-To: <1cb90bff-ce5b-c6d1-a3df-24f6306f833a@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 14 Feb 2024 21:20:16 +0200
Message-ID: <CAA8EJpotiHKT_NYphDs0-vhpvsybgTW281XDYbteUx8qOX=v4g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: make "vblank timeout" more useful
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Feb 2024 at 20:02, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/8/2024 6:50 AM, Dmitry Baryshkov wrote:
> > We have several reports of vblank timeout messages. However after some
> > debugging it was found that there might be different causes to that.
> > To allow us to identify the DPU block that gets stuck, include the
> > actual CTL_FLUSH value into the timeout message and trigger the devcore
> > snapshot capture.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Changes in v2:
> > - Added a call to msm_disp_snapshot_state() to trigger devcore dump
> >    (Abhinav)
> > - Link to v1: https://lore.kernel.org/r/20240106-fd-dpu-debug-timeout-v1-1-6d9762884641@linaro.org
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > index d0f56c5c4cce..a8d6165b3c0a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > @@ -489,7 +489,8 @@ static int dpu_encoder_phys_vid_wait_for_commit_done(
> >               (hw_ctl->ops.get_flush_register(hw_ctl) == 0),
> >               msecs_to_jiffies(50));
> >       if (ret <= 0) {
> > -             DPU_ERROR("vblank timeout\n");
> > +             DPU_ERROR("vblank timeout: %x\n", hw_ctl->ops.get_flush_register(hw_ctl));
> > +             msm_disp_snapshot_state(phys_enc->parent->dev);
>
>
> There is no rate limiting in this piece of code unfortunately. So this
> will flood the number of snapshots.

Well... Yes and no. The devcoredump will destroy other snapshots if
there is a pending one. So only the console will be flooded and only
in case when MSM_DISP_SNAPSHOT_DUMP_IN_CONSOLE is enabled.

>
> Short-term solution is you can go with a vblank_timeout_cnt and reset it
> in the enable() like other similar error counters.
>
> long-term solution is we need to centralize these error locations to one
> single dpu_encoder_error_handler() with a single counter and the error
> handler will print out the error code along with the snapshot instead of
> the snapshot being called from all over the place.
>
>
>
> >               return -ETIMEDOUT;
> >       }
> >
> >
> > ---
> > base-commit: 39676dfe52331dba909c617f213fdb21015c8d10
> > change-id: 20240106-fd-dpu-debug-timeout-e917f0bc8063
> >
> > Best regards,



-- 
With best wishes
Dmitry

