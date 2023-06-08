Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF53727CB7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jun 2023 12:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232125AbjFHKZF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jun 2023 06:25:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236209AbjFHKZE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jun 2023 06:25:04 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 761FF173B
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jun 2023 03:25:02 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-75d57fdb014so36847285a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jun 2023 03:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686219901; x=1688811901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4tpowvLajrSGqwxArwQ8XTVeRE5lzXRcv/YtqNdBw4=;
        b=MTA84B0sr5UDGyDh5iVn5msSmAbrDm74UHfyejmOT+JGvEDf6wd4Is4XJesA/gh+/a
         XJqwzSWwyaifR7HuhXwN9A6CpAiG0Wbfa0lHg6Cz8rRrfoNOoxbQgveuYuIZwi65dPYk
         dVpMzwlSqrICOxm2BPty+v/UdVd/kKV9aTz+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686219901; x=1688811901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4tpowvLajrSGqwxArwQ8XTVeRE5lzXRcv/YtqNdBw4=;
        b=HBmCf54ccN5MrUPqAyPGFEIzeNoBjGN0WOSTdwJX8j2f2qbtoElPtr0ZJrnOngRzz/
         0NZgS5Ngci1aHSMuLy5cU04x6Ou6ulUaMxJJn8sD5P4ZNwKKMaAZv2HmGr4LT8I9d5AA
         ci98s0mVjBmWki2+wrrhJdSwTZOx60vUuio30YYQod3sIYQDPQcLk1MSFq85G8Ttlsbh
         TXO8zRD7smwwSATlgky7OutZzbA8DtbFW+NicCHWYJComkkYcLYGSb/g8hDTpqrO7WlN
         UFBKbYSBHKsTu/noxda/0rSgqIRnrOwPybzNVDO89OVkSLrj2yR2cwWK3HyxcKuwWQM5
         8kBw==
X-Gm-Message-State: AC+VfDx7z4cgwGVDU11faryd1ozAaIcWpNyfIqyH8F6UsYcnKgZcS+yM
        8VcZQ8v0boy+qr6Wm3uZeoJeTQ9z+04h+6cs2klhDQ==
X-Google-Smtp-Source: ACHHUZ7WAX3FVVtyQo8sQvalCkyD5aDTx7YmgEqB1TLPzT0nhZRpn4t6w6J/MPN9YYNJHc+tsK00gA==
X-Received: by 2002:a05:620a:28d3:b0:75d:536e:2188 with SMTP id l19-20020a05620a28d300b0075d536e2188mr6406821qkp.59.1686219901464;
        Thu, 08 Jun 2023 03:25:01 -0700 (PDT)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id m22-20020a05620a13b600b00759554bbe48sm242740qki.4.2023.06.08.03.25.01
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 03:25:01 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-75e4497597cso35849485a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jun 2023 03:25:01 -0700 (PDT)
X-Received: by 2002:ad4:5f0e:0:b0:623:690c:3cd7 with SMTP id
 fo14-20020ad45f0e000000b00623690c3cd7mr1200397qvb.47.1686219880090; Thu, 08
 Jun 2023 03:24:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230321102855.346732-1-benjamin.gaignard@collabora.com>
 <20230321102855.346732-4-benjamin.gaignard@collabora.com> <6c4658fd-3a64-b3f8-67cd-17ed2d7d3567@xs4all.nl>
 <20230531080331.GB6496@pendragon.ideasonboard.com> <608ae7d6-3f3b-137d-08d2-d41a240be2c4@xs4all.nl>
 <20230531123945.GF27043@pendragon.ideasonboard.com>
In-Reply-To: <20230531123945.GF27043@pendragon.ideasonboard.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 8 Jun 2023 19:24:29 +0900
X-Gmail-Original-Message-ID: <CAAFQd5A6sz1BhEjiWyXH6B1TBTLt0ivAc6N0Vd73hebnpc7fKQ@mail.gmail.com>
Message-ID: <CAAFQd5A6sz1BhEjiWyXH6B1TBTLt0ivAc6N0Vd73hebnpc7fKQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] media: videobuf2: Add a module param to limit vb2
 queue buffer storage
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        m.szyprowski@samsung.com, mchehab@kernel.org, ming.qian@nxp.com,
        shijie.qin@nxp.com, eagle.zhou@nxp.com, bin.liu@mediatek.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
        yunfei.dong@mediatek.com, stanimir.k.varbanov@gmail.com,
        quic_vgarodia@quicinc.com, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, ezequiel@vanguardiasur.com.ar,
        p.zabel@pengutronix.de, daniel.almeida@collabora.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 31, 2023 at 9:39=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, May 31, 2023 at 10:30:36AM +0200, Hans Verkuil wrote:
> > On 5/31/23 10:03, Laurent Pinchart wrote:
> > > On Wed, May 31, 2023 at 08:36:59AM +0200, Hans Verkuil wrote:
> > >> On 21/03/2023 11:28, Benjamin Gaignard wrote:
> > >>> Add module parameter "max_vb_buffer_per_queue" to be able to limit
> > >>> the number of vb2 buffers store in queue.
> > >>>
> > >>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > >>> ---
> > >>>  drivers/media/common/videobuf2/videobuf2-core.c | 15 +++----------=
--
> > >>>  include/media/videobuf2-core.h                  | 11 +++++++++--
> > >>>  2 files changed, 12 insertions(+), 14 deletions(-)
> > >>>
> > >>> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/driv=
ers/media/common/videobuf2/videobuf2-core.c
> > >>> index ae9d72f4d181..f4da917ccf3f 100644
> > >>> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> > >>> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> > >>> @@ -34,6 +34,8 @@
> > >>>  static int debug;
> > >>>  module_param(debug, int, 0644);
> > >>>
> > >>> +module_param(max_vb_buffer_per_queue, ulong, 0644);
> > >>
> > >> There is no MODULE_PARM_DESC here? Please add. I see it is not there=
 for
> > >> the debug param either, it should be added for that as well.
> > >
> > > Would this be the right time to consider resource accounting in V4L2 =
for
> > > buffers ? Having a module parameter doesn't sound very useful, an
> > > application could easily allocate more buffers by using buffer orphan=
ing
> > > (allocating buffers, exporting them as dmabuf objects, and freeing th=
em,
> > > which leaves the memory allocated). Repeating allocation cycles up to
> > > max_vb_buffer_per_queue will allow allocating an unbounded number of
> > > buffers, using all the available system memory. I'd rather not add a
> > > module argument that only gives the impression of some kind of safety
> > > without actually providing any value.

Good point. It's even simpler, just keep opening new vim2m instances
and requesting max buffers :).

> >
> > Does dmabuf itself provide some accounting mechanism? Just wondering.
> >
> > More specific to V4L2: I'm not so sure about this module parameter eith=
er.
> > It makes sense to have a check somewhere against ridiculous values (i.e=
.
> > allocating MAXINT buffers), but that can be a define as well. But other=
wise
> > I am fine with allowing applications to allocate buffers until the memo=
ry
> > is full.
> >
> > The question is really: what is this parameter supposed to do? The only
> > thing it does is to sanitize unlikely inputs (e.g. allocating MAXINT bu=
ffers).
> >
> > I prefer that as a define, to be honest.
> >
> > I think it is perfectly fine for users to try to request more buffers t=
han
> > memory allows. It will just fail in that case, not a problem.
> >
> > And if an application is doing silly things like buffer orphaning, then=
 so
> > what? Is that any different than allocating memory and not freeing it?
> > Eventually it will run out of memory and crash, which is normal.
>
> Linux provides APIs to account for and limit usage of resources,
> including memory. A system administrator can prevent rogue processes
> from starving system resources. The memory consumed by vb2 buffer isn't
> taken into account, making V4L2 essentially unsafe for untrusted
> processes.

I agree that proper accounting would be useful, although I wouldn't
really make this patch series depend on it, since it's not introducing
the loophole in the first place.
We had some discussion about this in ChromeOS long ago and we thought
it would be really useful for killing browser tabs with big videos,
but otherwise using very little regular memory (e.g. via javascript).

One challenge with accounting V4L2 allocations is how to count shared
DMA-bufs. If one process allocates a V4L2 buffer, exports it to
DMA-buf and then sends it to another process that keeps it alive, but
frees the V4L2 buffer (and even closes the DMA-buf fd), should that
memory be still accounted to it even though it doesn't hold a
reference to it anymore?

>
> Now, to be fair, there are many reasons why allowing access to v4L2
> devices to untrusted applications is a bad idea, and memory consumption
> is likely not even the worst one. Still, is this something we want to
> fix, or do we want to consider V4L2 to be priviledged API only ? Right
> now we can't do so, but with many Linux systems moving towards pipewire,
> we could possibly have a system daemon isolating untrusted applications
> from the rest of the system. We may thus not need to fix this in the
> V4L2 API.
>
> --
> Regards,
>
> Laurent Pinchart
