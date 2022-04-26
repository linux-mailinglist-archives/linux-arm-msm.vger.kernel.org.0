Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 857055104E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 19:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231254AbiDZRJv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 13:09:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232009AbiDZRJQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 13:09:16 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CA0E31537
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 10:06:08 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id k4so19237278plk.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 10:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2bOAXdV05ngOnaAdgM1PB5gzMCRGIbydXOaP7Kl6nBQ=;
        b=SVMfpAb+mMdqVE00gH2Mh39sQeKFsd/ATsbbNWPBL/C3MYtGoz3lb0UpmG/PBzGVVk
         xPLQ8XDvIvLY6C8jz6GUEWdOlFkKUuxWnxggPRoVnkRQR4Du5y20v9/aifNNhJmxvSKZ
         ohdRhWLKpKf3H51ftID3WRS8UIhQaXAkERoEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2bOAXdV05ngOnaAdgM1PB5gzMCRGIbydXOaP7Kl6nBQ=;
        b=WsVB2No++qZ6PljzMVzCr7h0Rga2JBb09QejUeG7LckVEOYeMocxDmoT+qXQayEjO4
         Kj/7eVpjzEVRxBhiJGd/VagiE1HnQuvSdfl6w1r6soRyRJ3nXcCaOGlksS4vSgdBR9iq
         v1C+9yYv3Ic1A6IuFgfZUMR7ga0OrcPpjLybqfdWpDduRXPN436bifcFBns2Qi3FvNLk
         0bgc52bphYhgH5z0xnCMSCP4Z4nNGiWM+ArN/VtV2zsfQA4jmwp8KxNwZOIwSh+5/siC
         uHCpAi6NCX0Z7tY0DmzpJ/aDsrJevd1ym7QaKm0Xqe4erjUR9w980J2uKzPjPiFF4uCS
         VFVg==
X-Gm-Message-State: AOAM530r26iFA0OT6uWI5XGorg/r8iRgJMgQH31aX3Gcp6KkZISgndpd
        qys3d7BlbVnhZ5TFuZ2J85xuHfHvBWXatpp/mAcOgg==
X-Google-Smtp-Source: ABdhPJziBWuuXlLcANNapMCrTENULU79cINFh95+CzlTGasENmvcqLOM8a7K9yUv3HU8fo8ckeShRPRjdvUf9ljBzRk=
X-Received: by 2002:a17:903:1248:b0:151:9708:d586 with SMTP id
 u8-20020a170903124800b001519708d586mr24374144plh.15.1650992768013; Tue, 26
 Apr 2022 10:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220412212558.827289-1-olvaffe@gmail.com> <CAPaKu7Tv1Mxt7Ao8kH2-MZDBK7EB0D41COJD8Sjze76t_o-qmw@mail.gmail.com>
 <ffe7dbc1-8a19-1e19-402d-27efc8e55b39@amd.com>
In-Reply-To: <ffe7dbc1-8a19-1e19-402d-27efc8e55b39@amd.com>
From:   Rob Clark <robdclark@chromium.org>
Date:   Tue, 26 Apr 2022 10:05:57 -0700
Message-ID: <CAJs_Fx7OQ2OJo3pQ-ETT1827PtfuFsvn984gg8GeDVrqy0Ucug@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: add trace_dma_fence_emit to msm_gpu_submit
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Chia-I Wu <olvaffe@gmail.com>, freedreno@lists.freedesktop.org,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 26, 2022 at 9:42 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 26.04.22 um 18:32 schrieb Chia-I Wu:
> > On Tue, Apr 12, 2022 at 2:26 PM Chia-I Wu <olvaffe@gmail.com> wrote:
> >> In practice, trace_dma_fence_init called from dma_fence_init is good
> >> enough and almost no driver calls trace_dma_fence_emit.  But drm_sched
> >> and virtio both have cases where trace_dma_fence_init and
> >> trace_dma_fence_emit can be apart.  It is easier for visualization too=
ls
> >> to always use the more correct trace_dma_fence_emit when visualizing
> >> fence timelines.
> >>
> >> v2: improve commit message (Dmitry)
> >>
> >> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> >> Cc: Rob Clark <robdclark@chromium.org>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > This has been reviewed.  Should we land it?
>
> No, there are still open discussions about it.

I think if it is needed for trace visualization, that is justification
enough for me

I don't really see otherwise how a generic trace visualization tool
like perfetto would handle the case that some fence timelines have
separate events but others do not.

BR,
-R

> Regards,
> Christian.
>
> >
> > (Or, how do I check if it has landed?)
>
