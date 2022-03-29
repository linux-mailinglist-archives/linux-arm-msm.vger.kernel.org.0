Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 998384EAF5F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Mar 2022 16:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234191AbiC2Oix (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Mar 2022 10:38:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237975AbiC2Oiw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Mar 2022 10:38:52 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96A1614A6DE
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Mar 2022 07:37:08 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id yy13so35611321ejb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Mar 2022 07:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EcuRjEXPtepaNw67w45p1dvod6pvQZQGq0SXmPy4MNM=;
        b=LN3ysnetZQLcHg9zh5VkpeCR5hv0qVm90OFT6sMlmHkcc0GNBDYZgWZ33mcs81Jucv
         ANcDd2CpVBdtKihImZNmBIKegZEm6pTFHkLHCQNPjduL7vcbkvvRGM6oFlHhh42/EIH+
         zflvjmlE5dxoQAZOtZPdlBvGmEPeFlsxFH87vMgbFgZduhk/xFFLUYkD9VoeVfibAeO9
         2c489J/YOw2H5iBgPQv+kHXbOxlBPlhzPUggTKmbm331Rp1BRLBOojM2loQGea3ae0Wt
         PbXWVa76Q5vjNOrZ08rM4qASeDpnqmzA/dOYDGO2cTLF5CRxjDJ4LCImqhPkoxxP2qrQ
         Ixsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EcuRjEXPtepaNw67w45p1dvod6pvQZQGq0SXmPy4MNM=;
        b=gQiAl+q2NSxsIS1Ci79Fo+7OhCJbc6rAFBEZjVFEkd6IANkgdQalh1vVEYK7SJJbUH
         SL0lLuN1rZSXrk64RE9bvA+RZlMRwl0IpkeHn/DwN+IaE8p6U/c8icw/jYFa/W3GMKWo
         M040DUt9Iw7Adj529C+EHu8MzBiRVupRiFvTyo1+kGoIu6fYzTuoftYaGN8GtYc1FZOq
         t+WXsBUiYUt4uCapJJoB6HKtELW6pKEGkjCK1IzTec4vGHI5Owoddb3+Z4YfPiOwz9rP
         0BwN04fSTvNM3B85/fjakgVaJtntJx2Hco75+2Xx5mDrApB8p72aiEAy8rGKD9BBjtMB
         +vtg==
X-Gm-Message-State: AOAM530T14+d3yiA9EZCP7/h3uTvisAcj8yg8rOip8LI5z2qnA0CM3QD
        S7JL+xhjTXXprEn6zyKqewgdqYa9ilhQKcirw0c6jw==
X-Google-Smtp-Source: ABdhPJzndU+hlAGsMBBHh3Q+ShVaQhl5rWLyscG/0jqOREe5OuXAZESfMX1K8aSunzXjtjrjXAK8MjbwH73ALpccOCM=
X-Received: by 2002:a17:906:7307:b0:6da:92db:c78f with SMTP id
 di7-20020a170906730700b006da92dbc78fmr34999509ejc.35.1648564626968; Tue, 29
 Mar 2022 07:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220324121734.21531-1-quic_jinlmao@quicinc.com>
 <20220324121734.21531-2-quic_jinlmao@quicinc.com> <YjxjXnXAXVXfZqr/@kroah.com>
 <e78ff137-fc5e-ff00-0e57-91304288d860@quicinc.com> <7d571b9d-2066-8217-5485-da0e6ace65eb@arm.com>
 <8698dc76-613e-a00d-340b-220c752d9449@quicinc.com>
In-Reply-To: <8698dc76-613e-a00d-340b-220c752d9449@quicinc.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Tue, 29 Mar 2022 08:36:55 -0600
Message-ID: <CANLsYkwZxqYMtx-v=OZoZAYshFHW2s_7isUq1UgUV18pVvSB8w@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] Use IDR to maintain all the enabled sources' paths.
To:     Jinlong Mao <quic_jinlmao@quicinc.com>
Cc:     Suzuki K Poulose <Suzuki.Poulose@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Mike Leach <mike.leach@linaro.org>,
        Leo Yan <leo.yan@linaro.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao Zhang <quic_taozha@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Hao Zhang <quic_hazha@quicinc.com>,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 29 Mar 2022 at 07:56, Jinlong Mao <quic_jinlmao@quicinc.com> wrote:
>
> Hi Suzuki,
>
> On 3/28/2022 4:33 PM, Suzuki K Poulose wrote:
> > On 24/03/2022 14:23, Jinlong Mao wrote:
> >> Hi Greg,
> >>
> >> Thanks for your review.
> >>
> >> On 3/24/2022 8:26 PM, Greg Kroah-Hartman wrote:
> >>> On Thu, Mar 24, 2022 at 08:17:25PM +0800, Mao Jinlong wrote:
> >>>> Use hash length of the source's device name to map to the pointer
> >>>> of the enabled path. Using IDR will be more efficient than using
> >>>> the list. And there could be other sources except STM and CPU etms
> >>>> in the new HWs. It is better to maintain all the paths together.
> >>>>
> >>>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> >>>> ---
> >>>>   drivers/hwtracing/coresight/coresight-core.c | 75
> >>>> +++++++-------------
> >>>>   1 file changed, 26 insertions(+), 49 deletions(-)
> >>> Your subject line is odd.  Please put back the driver subsystem in th=
e
> >>> subject line so that it makes more sense.
> >> I will update the subject in next version.
> >>>
> >>> And how have you measured "more efficient"?
> >>
> >> Using IDR would be better than doing a sequential search as there
> >> will be much more device  in future.
> >
> > Where do we use sequential search now ? For non-CPU bound sources, yes
> > we may need something. But CPU case is straight forward, and could be
> > retained as it is. i.e., per-cpu list of paths.
> >
> We use list to store the paths for both ETM and non-CPU bound sources in
> patch below.
>
> =E2=80=9C[PATCH 01/10] coresight: add support to enable more coresight pa=
ths=E2=80=9D
>
> According to Mathieu's comments, IDR is used now.  So i added "Using IDR
> will be more efficient than using
> the list" this message in my commit message. I think we need to use one
> mechanism to store ETM and
> non-CPU bound sources.
>
>
> Mathieu's comments:
>
> So many TPDM and many ETMs...  That is definitely a reason to do better t=
han a
> sequential search.
>
> If an IDR (or some other kind of mechanism) is used then we can use that =
to
> store paths associated with ETMs as well.  That way everything works the =
same
> way and access time is constant for any kind of source.

As per my last sentence above, the goal of  my comment was to simplify
things so that we don't have two different ways of managing sources.
But if that ends up causing more trouble than benefit then it should
be avoided.

>
> Thanks
>
> Jinlong Mao
>
> > Cheers
> > Suzuki
> >
> >
> >>
> >>>
> >>> thanks,
> >>>
> >>> greg k-h
> >>
> >> Thanks
> >>
> >> Jinlong Mao
> >>
> >
