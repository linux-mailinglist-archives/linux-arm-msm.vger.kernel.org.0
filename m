Return-Path: <linux-arm-msm+bounces-41179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 245339EA324
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 00:51:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C500E2828F8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 23:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8226A1F63F7;
	Mon,  9 Dec 2024 23:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lFy38AmU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCF2224884
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 23:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733788280; cv=none; b=HNjI+K1peRkk8cbXlvStkwVbZzqAq68gTNYXzovBq0ZByURgxM5dktNtn7nW9Wt0uTLD+BPxGnTJUIYh5Ajccjrl5hRx7/mpg1EgQ5jiNnYF+S/BeBhfdEBSlGxWIC7FOrJRKLBaFQapNSHOmABLaVd0x4UdXEujkB4L9r5siQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733788280; c=relaxed/simple;
	bh=dzTrJBMj6sE/3OK6+ql4ROC6yDTwBHT8ksIVv6naSgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ir8PdWZnvJ4BfH/6p3f2qkHJh/UkZhHUYDTTjxemRFgXYUv4ES2SyWax0NgWS5Vesd6yLHvmM8P+D73LQGrJTUq3e2vd6eI6rFl51wtrx8PAczy/ZyGrkc9leuCeB6Z4RoHCQb91GmelmTduJts5aTkpMQ90gjPUqcRpX4BGOP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lFy38AmU; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so1918580e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 15:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733788275; x=1734393075; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pRhykAUu7/ugGdmMkmUVswA+egudUm0iBmbFkMPAE08=;
        b=lFy38AmUyJWvkoYQ5mkc8rwunJCJ1A/g8DSls3IxnQT1JWsw1Pqo1apMI1+17D45Pa
         BjGy/dsQCLwk3zwBT1ZnWefqhL8U1Du2NuhB9p0Lw3ljeJ4/awCBwPBqIXc3X1ok5YfO
         61iKFAnxSMGO9Oso/ID5Ch5wslF3rOaWvhhEXhUPnsYvji/Bfp2Eo7CNJIEaTGdbijQH
         XlrGZvOqyQxEvtoyVjS3aDo9mD/W5nfqJ7oD+oKYTQ/87vMryhQ9wsd1HENUETxI8niM
         JSZMm/u+qT17NPCLcY5zBDbH8KSySQFvX9UBLSdbWtNXKg2do+TbdGm9mLmYVbDc3iJr
         Jhew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733788275; x=1734393075;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pRhykAUu7/ugGdmMkmUVswA+egudUm0iBmbFkMPAE08=;
        b=L+3u59nqP19BAqPSy/JwWl1pMkxQSmtaItHvGKCqGYucgmW68lnK9flZAPELy65zNt
         tpYxi1T2jObU1LAWF5zkNsfb+zKUuBkae8TpiEYCkrcFevx8FWJu2Slo8hh9biElDcPd
         0CwC+NGiWjeGZeIyAohkdsldQh1GyDsWbqBKgDQ7bxpDESp7UDb1xlyi+05S68xnmrwi
         Ml65G7vCqUP6UiYljXNndiZJHO9a6eIZSM3KDNgktGn+/Nld/oVAohfChh9EeNGNH0Fk
         gkQCMxaMzwsxbO7FDz+V6mXJ+RSqIqERzp3bEC/ymeiTmViD1Fw/s6jgtMq7B3z206Mf
         OJ1w==
X-Forwarded-Encrypted: i=1; AJvYcCUO7h4x4O32S0X9VbN6QfAWGda28hHUR1skmMti0OltPx0f51mEk8dgdDjEtv83P+p+EjXOwaUc0be/X+yP@vger.kernel.org
X-Gm-Message-State: AOJu0YyjTa0xG8ebkoMMS2AgryQAtaO1W/crHo6G+UdbQMVO8eCMGCLw
	5IzgZfitqTYJhOKH2Q8TBkqvoguq4OxkPMdUZT12YI+zYIvZuAchC9Vz2edBzvk=
X-Gm-Gg: ASbGncse32CX0DS8u+CgQfufxxVJE4qC/aRQHyVrKCy5bvuu4FwEMR6M+k6E11BWAH6
	rwAuJdZ9NBEkNc4IEwe/ximBCIGitg0iUW0lY84YbchrXlO/hLyYg4lJsvKCBn/nWq8gGKAB/hq
	sgXOQYD6vaGvTUREowLbcmM6N2WDEufxKceoWrMbgAsWCa4FFdywpmdjsbD3NxVDTNAma8nAOMS
	jyvM6xNx3YP6kdNAZlLVpo0O1HTPXrwqsDYqeqqu8h+GufHiA/qMnKpkb893rgjqoBzYGT0NWPU
	QZBuQsur7QTnQsOjVJZ6Fs+V1XqynbL5Kg==
X-Google-Smtp-Source: AGHT+IEhnOWNc8nDA8aa1lu4OIkxgMXSLt9ThRjs6xaPkXjn9+eTZi6alA19l127fCfpf/93hP7YWw==
X-Received: by 2002:a05:6512:10c4:b0:540:15b2:fd2e with SMTP id 2adb3069b0e04-54015b2fef4mr3108085e87.9.1733788275188;
        Mon, 09 Dec 2024 15:51:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30221998b4esm4881421fa.110.2024.12.09.15.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 15:51:13 -0800 (PST)
Date: Tue, 10 Dec 2024 01:51:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, Leonard Lausen <leonard@lausen.nl>, 
	=?utf-8?Q?Gy=C3=B6rgy?= Kurucz <me@kuruczgy.com>, Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v4] drm/msm/dpu1: don't choke on disabling the writeback
 connector
Message-ID: <eysj65p526ice7taxh5c7whvyb4o4rnxnydgs6wz5ccnjh5mlj@z6xqdbqqy3lw>
References: <20241209-dpu-fix-wb-v4-1-7fe93059f9e0@linaro.org>
 <9c42bbb1-bf6c-4323-95f9-0ac9e7426d0c@quicinc.com>
 <CAA8EJppMA-AREJata0MWHCDYC-7ra723zhC4Nu_xD59O0mX_Ag@mail.gmail.com>
 <a22262d5-f1e3-498b-a850-d377f29166f1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a22262d5-f1e3-498b-a850-d377f29166f1@quicinc.com>

On Mon, Dec 09, 2024 at 03:36:29PM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/9/2024 1:55 PM, Dmitry Baryshkov wrote:
> > On Mon, 9 Dec 2024 at 21:54, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 12/9/2024 2:04 AM, Dmitry Baryshkov wrote:
> > > > During suspend/resume process all connectors are explicitly disabled and
> > > > then reenabled. However resume fails because of the connector_status check:
> > > > 
> > > > [dpu error]connector not connected 3
> > > > [drm:drm_mode_config_helper_resume [drm_kms_helper]] *ERROR* Failed to resume (-22)
> > > > 
> > > > It doesn't make sense to check for the Writeback connected status (and
> > > > other drivers don't perform such check), so drop the check.
> > > > 
> > > > It wasn't a problem before the commit 71174f362d67 ("drm/msm/dpu: move
> > > > writeback's atomic_check to dpu_writeback.c"), since encoder's
> > > > atomic_check() is called under a different conditions that the
> > > > connector's atomic_check() (e.g. it is not called if there is no
> > > > connected CRTC or if the corresponding connector is not a part of the
> > > > new state).
> > > > 
> > > > Fixes: 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c")
> > > > Cc: stable@vger.kernel.org
> > > > Reported-by: Leonard Lausen <leonard@lausen.nl>
> > > > Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/57
> > > > Tested-by: Leonard Lausen <leonard@lausen.nl> # on sc7180 lazor
> > > > Reported-by: György Kurucz <me@kuruczgy.com>
> > > > Link: https://lore.kernel.org/all/b70a4d1d-f98f-4169-942c-cb9006a42b40@kuruczgy.com/
> > > > Reported-by: Johan Hovold <johan+linaro@kernel.org>
> > > > Link: https://lore.kernel.org/all/ZzyYI8KkWK36FfXf@hovoldconsulting.com/
> > > > Tested-by: György Kurucz <me@kuruczgy.com>
> > > > Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> > > > Tested-by: Johan Hovold <johan+linaro@kernel.org>
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > > Leonard Lausen reported an issue with suspend/resume of the sc7180
> > > > devices. Fix the WB atomic check, which caused the issue.
> > > > ---
> > > > Changes in v4:
> > > > - Epanded commit message (Johan)
> > > > - Link to v3: https://lore.kernel.org/r/20241208-dpu-fix-wb-v3-1-a1de69ce4a1b@linaro.org
> > > > 
> > > > Changes in v3:
> > > > - Rebased on top of msm-fixes
> > > > - Link to v2: https://lore.kernel.org/r/20240802-dpu-fix-wb-v2-0-7eac9eb8e895@linaro.org
> > > > 
> > > > Changes in v2:
> > > > - Reworked the writeback to just drop the connector->status check.
> > > > - Expanded commit message for the debugging patch.
> > > > - Link to v1: https://lore.kernel.org/r/20240709-dpu-fix-wb-v1-0-448348bfd4cb@linaro.org
> > > > ---
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 3 ---
> > > >    1 file changed, 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > > > index 16f144cbc0c986ee266412223d9e605b01f9fb8c..8ff496082902b1ee713e806140f39b4730ed256a 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > > > @@ -42,9 +42,6 @@ static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
> > > >        if (!conn_state || !conn_state->connector) {
> > > >                DPU_ERROR("invalid connector state\n");
> > > >                return -EINVAL;
> > > > -     } else if (conn_state->connector->status != connector_status_connected) {
> > > > -             DPU_ERROR("connector not connected %d\n", conn_state->connector->status);
> > > > -             return -EINVAL;
> > > >        }
> > > 
> > > Can you please explain me about why the status was not already connected?
> > > 
> > > In all the places I checked (unless I missed something), if the detect()
> > > callback is not registered, the connector is assumed connected like below:
> > > 
> > > 404     if (funcs->detect_ctx)
> > > 405             ret = funcs->detect_ctx(connector, ctx, force);
> > > 406     else if (connector->funcs->detect)
> > > 407             ret = connector->funcs->detect(connector, force);
> > > 408     else
> > > 409             ret = connector_status_connected;
> > > 
> > > We do not register .detect for WB as WB connector should be always
> > > connected.
> > > 
> > > What scenario or use-case is making the connector status to something
> > > other than connected?
> > > 
> > > The places which mark the connector as unknown seem to be covered by
> > > warnings in drm_probe_helper.c but the bug report doesnt seem to be
> > > hitting those.
> > 
> > Because nobody asks for the getconnector on that connector. For
> > example,drm_client_for_each_connector_iter() explicitly skips
> > WRITEBACK connectors. So, drm_client_modeset_probe() also doesn't
> > request ->fill_modes() on that connector.
> > 
> > I'm almost sure that if somebody runs a `modetest -ac` on the
> > unpatched kernel after boot, there will be no suspend-related issues.
> > In fact, I've just checked on RB5.
> > /sys/class/drm/card0-Writeback-1/status reports 'unknown' before and
> > 'connected' afterwards. You can easily replicate that on your
> > hardware.
> > 
> 
> Yes this is correct, I just checked on sc7180.
> 
> It stays at unknown till we run IGT. This matches your explanation
> perfectly.
> 
> > > 
> > > I am wondering if there is some case in fwk resetting this to unknown
> > > silently (which is incorrect) and perhaps other drivers dont hit this as
> > > there is a .detect registered which always returns connected and MSM
> > > should follow that.
> > > 
> > > 111 static enum drm_connector_status
> > > 112 komeda_wb_connector_detect(struct drm_connector *connector, bool force)
> > > 113 {
> > > 114     return connector_status_connected;
> > > 115 }
> > > 116
> > 
> > No, that won't help. You can add a detect() callback and verify that
> > simply isn't getting called. It's not resetting the connector->status,
> > it's nobody setting it for the first time.
> > 
> 
> What we found is that drm_atomic_helper_suspend() which calls
> drm_atomic_helper_duplicate_state(), uses drm_for_each_connector_iter()
> which does not rely on the last atomic state but actually uses the
> config->connector_list which in-turn disables all connectors including WB.
> 
> Is this expected that even though WB was not really there in the last
> atomic_state before the suspend, still ended up suspending / resuming and
> thus exposing this bug?

Note, atomic_state is a "patch", not a full state. Thus the described
behaviour is expected: it walks over all connectors and checks their
drm_connector_state information. Some of the connectors (if they were
not touched by the commit) might have been skipped from the last
drm_atomic_state structure.

> 
> I am  now more convinced of this change as I understand the flow better. But
> wanted to highlight above observation.
> 
> > > > 
> > > >        crtc = conn_state->crtc;
> > > > 
> > > > ---
> > > > base-commit: 86313a9cd152330c634b25d826a281c6a002eb77
> > > > change-id: 20240709-dpu-fix-wb-6cd57e3eb182
> > > > 
> > > > Best regards,
> > 
> > 
> > 

-- 
With best wishes
Dmitry

