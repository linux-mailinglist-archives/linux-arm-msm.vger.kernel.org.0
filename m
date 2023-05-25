Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72D9271027E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 May 2023 03:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbjEYBlt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 May 2023 21:41:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbjEYBlr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 May 2023 21:41:47 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D9E018C
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 18:41:17 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-561a33b6d63so293947b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 18:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684978868; x=1687570868;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XPb8KbqWHe/Wn3t/4V1Y6PByW6CmSIRbmZFJX0yAJoA=;
        b=XEGn6iPd5vpeNYMvA41VmOkgGH9AgDadjqE1Oc6nwCKkxYGx0VVKIIah21F9ex3jaT
         1nHhokwPrEz1TFiVl1xbQOZE+GlgROeMww3shaz4TNmkPcszLZxuObGeGu7qamQrTWPX
         ynIrtbnJ4b9huxnbybaPNJdv2AqOvDuH0MOkJjDkGx2ERX9KhfOixkRnWg/TJ4BIqOcQ
         FUlbOGfNDdTyfq85LGQIrLI+HaUM5XVJy7gZ5Pxm+hgSlbywV0GRspY+T9Nf45p42EB0
         60u0JNP6aCh+Ci+jel+2+Pl3dkNGz/fp5FYhMJN0iq/ILafCteqzjcaf3c+JwVsgCkue
         JJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684978868; x=1687570868;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XPb8KbqWHe/Wn3t/4V1Y6PByW6CmSIRbmZFJX0yAJoA=;
        b=dORevzkIUO/iCEmOeI11wofc1mOE+pZYpAT5skfvrCgaytrWB1BKAaSkxZ+ImoBX1v
         GajLpzAAYRzw2gn5vV6hNTKQ+/mwY52rUI98e6Y743l/BxhTjBRdzMEcirukdoVkX8Gu
         zb/JvDVgUdw1USYBU+QdZezgPkMlhDw0N4Cjo0OmmP5YWNm4gFqhyKZftqjaNqEQWV/k
         An24KLg2dvXlEtgmgq+0QtWZjbTXb3Tqf5ceSRxNO+kQt3qQe8WCZGARintwl3Mc6J7F
         /lYBDLrSLG6cVuk1T9PyJHluMRlnSkO5RhcULTQBOya19v2u5BndGRWuejYDx6Uq1mao
         MQHg==
X-Gm-Message-State: AC+VfDyaZhmuvGAhGShm22FxKyu83bR38ShhGfTNKk3Vwdfhgob/8W0s
        lXCsJN+KQrzCf0fRSuzwCbSCZUG9BPJ/bRbSs6cbLg==
X-Google-Smtp-Source: ACHHUZ4G0fhwhIuSz7DkdGZEtTI+BlzFsHD2f9cKjkO/4yG98O1uck+F/1VwYfyRrvBXQKrB7yHxMzYPav9LLRuna40=
X-Received: by 2002:a0d:df89:0:b0:54f:ba89:225d with SMTP id
 i131-20020a0ddf89000000b0054fba89225dmr19776586ywe.19.1684978868444; Wed, 24
 May 2023 18:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-10-dmitry.baryshkov@linaro.org> <4af411bf-290c-0818-bdf2-878b2da15146@quicinc.com>
 <f010d346-fdbe-62b9-c403-4928b2e929fc@quicinc.com>
In-Reply-To: <f010d346-fdbe-62b9-c403-4928b2e929fc@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 25 May 2023 04:40:57 +0300
Message-ID: <CAA8EJprOQdotGKv914khFuhC1UGLLwLp0nngPBORYtbCXJ5Nfg@mail.gmail.com>
Subject: Re: [Freedreno] [RFC PATCH v2 09/13] drm/msm/dpu: move pstate->pipe
 initialization to dpu_plane_atomic_check
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 25 May 2023 at 02:04, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/24/2023 3:46 PM, Abhinav Kumar wrote:
> >
> >
> > On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
> >> In preparation to virtualized planes support, move pstate->pipe
> >> initialization from dpu_plane_reset() to dpu_plane_atomic_check(). In
> >> case of virtual planes the plane's pipe will not be known up to the
> >> point of atomic_check() callback.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> ---
> >
> > Will legacy paths be broken with this? So lets say there is no
> > atomic_check we will not have a valid sspp anymore.
>
> I think it should still work, even if goes through the modeset crtc, it
> should still call drm_atomic_commit() internally which should have the
> call to atomic_check, once you confirm this , i can ack this particular
> change.

Can you please describe the scenario you have in mind? If I got you
correctly, you were asking about the non-commit IOCTLs. Because of the
atomic helpers being used (e.g. drm_atomic_helper_set_config()), they
will also result in a call to drm_atomic_commit(), which invokes
drm_atomic_check_only().

-- 
With best wishes
Dmitry
