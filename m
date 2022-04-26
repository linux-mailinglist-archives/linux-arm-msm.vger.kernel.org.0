Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D66F3510513
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 19:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236938AbiDZRTf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 13:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353707AbiDZRTY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 13:19:24 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96D1A62DE
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 10:16:16 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id d23-20020a17090a115700b001d2bde6c234so2165907pje.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 10:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8N/olBTMX6m2KUUfwtQ/PQwAKnFQsB+gSNHy/8mAD9w=;
        b=AKGMRsMmiks1knJFd2PZ6g/1E9nVWMxzXSqrwc7WuhfPeQB2bQ4wRPb6QkLNH1IrQo
         OgttFPiz12UD5hekpy79aLb3Zss+hWHOzNo5BFOpuQoqwUYZJsrtbHkYcUdSKdaMvpAg
         SOFCK0D9MpK3FCz0QsbJUckFULIua1Vo01uSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8N/olBTMX6m2KUUfwtQ/PQwAKnFQsB+gSNHy/8mAD9w=;
        b=cfWJN9I/NNPbEd2sDbcExVoVn2kry3hDZb1SqiuX63EYvFp/YrgtWObtA/5ve9oTrc
         A084Bu9+MlHDi/F8Ocy3I9QlecCEe/4d1A8afO59LrR16Vu4PcPveVmB5ZxfaawnDxaZ
         Ju4bePXwMwyqsuWqwR4HsIgeNE8Zv9hACl2msL7OdYrt5NMQmfFeZnCvq3JqOuLXBG1u
         j9zwRxMauBPoRDZ1fX6pMFQTrrjR2IcW/XGIEnBb1olk8e9vcT4BBY28g10RLvgZOc+o
         pFMnLS6GWTo0G9Kimy1gZz25QnA2rI1yy5W50XBK2wo8jHwMhlSOXoGpjx+tne0mmyxx
         jIpQ==
X-Gm-Message-State: AOAM533+SxIEznyQzbJ6PFxSmh/7ZAoZcTtKo02s7BwAlwJ0HQkcSiY7
        0j9BUIee1ge8FFn6/p1KjWBmwrHj1owibP82qix0+Q==
X-Google-Smtp-Source: ABdhPJwQYJDMG4HHGAXB69CyOV61s/x5aYmAWxELbcZ3/zM7/HAB4j4xfRf0ycAWJ4779M3CqzvSkF6k96srobeqZh4=
X-Received: by 2002:a17:902:ea4f:b0:158:5013:1403 with SMTP id
 r15-20020a170902ea4f00b0015850131403mr24232493plg.75.1650993376099; Tue, 26
 Apr 2022 10:16:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220412212558.827289-1-olvaffe@gmail.com> <CAPaKu7Tv1Mxt7Ao8kH2-MZDBK7EB0D41COJD8Sjze76t_o-qmw@mail.gmail.com>
 <ffe7dbc1-8a19-1e19-402d-27efc8e55b39@amd.com> <CAJs_Fx7OQ2OJo3pQ-ETT1827PtfuFsvn984gg8GeDVrqy0Ucug@mail.gmail.com>
 <215f55f6-97b8-5dd3-a2cc-fe42e19a2769@amd.com>
In-Reply-To: <215f55f6-97b8-5dd3-a2cc-fe42e19a2769@amd.com>
From:   Rob Clark <robdclark@chromium.org>
Date:   Tue, 26 Apr 2022 10:16:05 -0700
Message-ID: <CAJs_Fx69yhVQ6t1xdTqEs3kxiz1gZSZ2-qNA=Cq21j_BSaymrQ@mail.gmail.com>
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

On Tue, Apr 26, 2022 at 10:08 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 26.04.22 um 19:05 schrieb Rob Clark:
> > On Tue, Apr 26, 2022 at 9:42 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 26.04.22 um 18:32 schrieb Chia-I Wu:
> >>> On Tue, Apr 12, 2022 at 2:26 PM Chia-I Wu <olvaffe@gmail.com> wrote:
> >>>> In practice, trace_dma_fence_init called from dma_fence_init is good
> >>>> enough and almost no driver calls trace_dma_fence_emit.  But drm_sch=
ed
> >>>> and virtio both have cases where trace_dma_fence_init and
> >>>> trace_dma_fence_emit can be apart.  It is easier for visualization t=
ools
> >>>> to always use the more correct trace_dma_fence_emit when visualizing
> >>>> fence timelines.
> >>>>
> >>>> v2: improve commit message (Dmitry)
> >>>>
> >>>> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> >>>> Cc: Rob Clark <robdclark@chromium.org>
> >>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> This has been reviewed.  Should we land it?
> >> No, there are still open discussions about it.
> > I think if it is needed for trace visualization, that is justification
> > enough for me
> >
> > I don't really see otherwise how a generic trace visualization tool
> > like perfetto would handle the case that some fence timelines have
> > separate events but others do not.
>
> Well I just send a patch to completely remove the trace point.
>
> As I said it absolutely doesn't make sense to use this for
> visualization, that's what the trace_dma_fence_init trace point is good f=
or.
>
> The only use case is for debugging the GPU scheduler and we should
> probably introduce a separate GPU scheduler specific trace point for
> this instead if we should ever need it.

Hmm, AFAIU from Chia-I, virtgpu has a separation of init and emit..
OTOH if using separate events in these special cases is better, then
I'm ok with that and can revert this patch.  Chia-I is more familiar
with the visualization end of it, so I'll let him comment on whether
that is a workable approach.

BR,
-R

> Regards,
> Christian.
>
> >
> > BR,
> > -R
> >
> >> Regards,
> >> Christian.
> >>
> >>> (Or, how do I check if it has landed?)
>
