Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 768817AB022
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Sep 2023 13:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233291AbjIVLD2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Sep 2023 07:03:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjIVLD0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Sep 2023 07:03:26 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B32FBAC;
        Fri, 22 Sep 2023 04:03:20 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: alarumbe)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 2AB356607298;
        Fri, 22 Sep 2023 12:03:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1695380599;
        bh=wXSEIbq/K8kiAYrJuMuWZuTjJmcTmyqx7vXAGyjqEuo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PNXIUrVnI3zfpD/o9V6Srvtwpz+lY6DtO5MRZEPiGJreVRtOd6TAOOJXuN18Yo4C+
         ETU695ehyNkW8No6+UYz0cRAJJR9yxEwJ0pnKfyfwa5PuDsooIe3fieT/Yhgww/csa
         G/MLjjKse1U1LpLI69gH5uHLoqVJHJ93NxCQIztzAcOHXDGw8jYWm4v140Xa9nK/Lh
         SvcQKFjWG5fSIY42mUsEAFR+bsl2DoLC6vcFW/HuzyTEqGkfPp8MIJMAFw+gmYFcDY
         j2PnqjRLrr/LK17eGxQnxwc5IyBZpCACmUzDcLuxvK7XVcMq5eOnUMJOiAmte/c5SM
         +3aVpuuvPR4bQ==
Date:   Fri, 22 Sep 2023 12:03:17 +0100
From:   =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To:     Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
        robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, robh@kernel.org,
        steven.price@arm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        healych@amazon.com,
        Boris Brezillon <boris.brezillon@collabora.com>,
        kernel@collabora.com, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v6 6/6] drm/drm-file: Show finer-grained BO sizes in
 drm_show_memory_stats
Message-ID: <rn5metso2yr2kyxix3fh2ub77jpjf6avs754eshgpd2lu33bkw@33way22pozgh>
References: <20230919233556.1458793-1-adrian.larumbe@collabora.com>
 <20230919233556.1458793-7-adrian.larumbe@collabora.com>
 <ccfa3697-b015-ff35-fb92-0efcbd1d7d7c@linux.intel.com>
 <6b9c8566-926d-40ff-7907-228d317fab3d@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b9c8566-926d-40ff-7907-228d317fab3d@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21.09.2023 11:14, Tvrtko Ursulin wrote:
>
>On 20/09/2023 16:32, Tvrtko Ursulin wrote:
>> 
>> On 20/09/2023 00:34, Adrián Larumbe wrote:
>> > The current implementation will try to pick the highest available size
>> > display unit as soon as the BO size exceeds that of the previous
>> > multiplier. That can lead to loss of precision in contexts of low memory
>> > usage.
>> > 
>> > The new selection criteria try to preserve precision, whilst also
>> > increasing the display unit selection threshold to render more accurate
>> > values.
>> > 
>> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>> > Reviewed-by: Steven Price <steven.price@arm.com>
>> > ---
>> >   drivers/gpu/drm/drm_file.c | 5 ++++-
>> >   1 file changed, 4 insertions(+), 1 deletion(-)
>> > 
>> > diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>> > index 762965e3d503..34cfa128ffe5 100644
>> > --- a/drivers/gpu/drm/drm_file.c
>> > +++ b/drivers/gpu/drm/drm_file.c
>> > @@ -872,6 +872,8 @@ void drm_send_event(struct drm_device *dev, struct
>> > drm_pending_event *e)
>> >   }
>> >   EXPORT_SYMBOL(drm_send_event);
>> > +#define UPPER_UNIT_THRESHOLD 100
>> > +
>> >   static void print_size(struct drm_printer *p, const char *stat,
>> >                  const char *region, u64 sz)
>> >   {
>> > @@ -879,7 +881,8 @@ static void print_size(struct drm_printer *p,
>> > const char *stat,
>> >       unsigned u;
>> >       for (u = 0; u < ARRAY_SIZE(units) - 1; u++) {
>> > -        if (sz < SZ_1K)
>> > +        if ((sz & (SZ_1K - 1)) &&
>> 
>> IS_ALIGNED worth it at all?
>> 
>> > +            sz < UPPER_UNIT_THRESHOLD * SZ_1K)
>> >               break;
>> 
>> Excuse me for a late comment (I was away). I did not get what what is
>> special about a ~10% threshold? Sounds to me just going with the lower
>> unit, when size is not aligned to the higher one, would be better than
>> sometimes precision-sometimes-not.
>
>FWIW both current and the threshold option make testing the feature very
>annoying.

How so?

>So I'd really propose we simply use smaller unit when unaligned.

Like I said in the previous reply, for drm files whose overall BO size sum is enormous
but not a multiple of a MiB, this would render huge number representations in KiB.
I don't find this particularly comfortable to read, and then this extra precision
would mean nothing to nvtop or gputop, which would have to scale the size to their
available screen dimensions when plotting them.

>Regards,
>
>Tvrtko
