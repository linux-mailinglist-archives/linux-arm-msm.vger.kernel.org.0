Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1234F5FAB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 15:30:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232266AbiDFNU4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 09:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233210AbiDFNUr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Apr 2022 09:20:47 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C52FCDAFCA
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Apr 2022 03:01:22 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id 10so3355136qtz.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Apr 2022 03:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nF1xNfj+J34XrxSolTF0D+orBqwvLN2KXHwwalZ4HTY=;
        b=wMZd4R/cJhJ0o5uoKdvVDyQbmt+R0cgDYTu4JUHaYhNncFM5q3J2vIFNDb6TYhq3LE
         1W4tlDgycH1xe5kmdKZiAKsDXZDO2eoIWr9IG4QUl2HXztiNpg2QEpXjEdvM+HqLQ0F7
         kEBsIzbv7rm5tWx89SgopcE6Y21ULM2Ra2BUCx0WoLeB3sHu7yglx2NCzrpL4W+1Ax6w
         xnLlNpMzURktWbZ+6A4hxd3K4LdO1umpftfSXwqwzTpZcGB1iWe3eRnfZKwRHtrDrzfC
         6ukVilvbwKDLkLBScgPEwiSVUIjS1oME067AS55bD9Lc2ooX2knRqNavt5FdWtw0kOwD
         bFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nF1xNfj+J34XrxSolTF0D+orBqwvLN2KXHwwalZ4HTY=;
        b=qf1tjf9VHPfQ1MiqJNG9QRpsBwdoS27Oitj+LGNajHkTqdI5zqtJWRCib2iQjz73Ya
         cdt8X868VXYlcb/HyMWhkiPjItCRUS9+IsKBFqClkEpoTrG0TUEO4Q3yLm8MaBzHPcKI
         2jifnkr5ja9mpVwKkfROBIkEAuizaRhs0ERwxubFm7ss+ZI3yCWAGcjNKKSOWSn9DgnF
         h/I9J/bwMHou5E+CwgIUR5N7ZSrcYIYyixAvWwnz9KeG/YG/kcM1BokSPLGUmzCDClcZ
         JmGx/Ql3qrGjDnyRmdRn+3+yIy/sUGje9HmsFaMrsEpwZoSo58syIRxjuTMBmhG0/sOD
         Zo4w==
X-Gm-Message-State: AOAM533vostNZO6faOdzASjN5A2MBdsqyP4tNXit/0gGgxmX6Z4N2/Xx
        JpFfSW0I984fXgoO66o4L8Vsb4bvgf7rrBCSYiVuQw==
X-Google-Smtp-Source: ABdhPJwifkB/hY55P59uzoya9A0itxh640pczG4PfHi0w+ZaI8JqLhcORl90QHWitXyvPRj+jQS9OQSCdNRAmmRwB0A=
X-Received: by 2002:ac8:4e52:0:b0:2e1:dad8:5141 with SMTP id
 e18-20020ac84e52000000b002e1dad85141mr6605974qtw.62.1649239280348; Wed, 06
 Apr 2022 03:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220405235059.359738-1-dmitry.baryshkov@linaro.org>
 <20220405235059.359738-4-dmitry.baryshkov@linaro.org> <CAE-0n501rjepeF3Oc6g05ctyGYdZTPR1+OMC=piQEtUZT+03=w@mail.gmail.com>
In-Reply-To: <CAE-0n501rjepeF3Oc6g05ctyGYdZTPR1+OMC=piQEtUZT+03=w@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 6 Apr 2022 13:01:09 +0300
Message-ID: <CAA8EJppOtqSD0+3C60Qz77oCGgq0=bqC6dLK8sN_S8uRvCQ0wQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm: don't store created planes, connectors and encoders
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 6 Apr 2022 at 07:03, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-04-05 16:50:59)
> > diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> > index d661debb50f1..ee3093890d97 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.h
> > +++ b/drivers/gpu/drm/msm/msm_drv.h
> > @@ -184,23 +184,14 @@ struct msm_drm_private {
> >
> >         struct workqueue_struct *wq;
> >
> > -       unsigned int num_planes;
> > -       struct drm_plane *planes[MAX_PLANES];
>
> Can we get rid of MAX_PLANES?

Sure, I'll drop all these defines in v2.

>
> > -
> >         unsigned int num_crtcs;
> >         struct drm_crtc *crtcs[MAX_CRTCS];
> >
> >         struct msm_drm_thread event_thread[MAX_CRTCS];
> >
> > -       unsigned int num_encoders;
> > -       struct drm_encoder *encoders[MAX_ENCODERS];
>
> And MAX_ENCODERS?
>
> > -
> >         unsigned int num_bridges;
> >         struct drm_bridge *bridges[MAX_BRIDGES];
> >
> > -       unsigned int num_connectors;
> > -       struct drm_connector *connectors[MAX_CONNECTORS];
>
> And MAX_CONNECTORS?



-- 
With best wishes
Dmitry
