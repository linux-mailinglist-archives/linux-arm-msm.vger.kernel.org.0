Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B96C5719F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 14:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbiGLM2L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 08:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232197AbiGLM2K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 08:28:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9E6FAAA776
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 05:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657628888;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6ezubj+x8V1oMG/VgleHBRCXDdJg/g3Jj5Gyxz0aX/o=;
        b=H7lDvZNg+SVuZPi/e7livgiM7ToYXzmgq4zKXBP/NLkA2q47SRzIXcIpdjFApP9sSd9Oal
        f+2ao93kyxAQd+exAoeyl08Y84//quVqXGt+wrsSpahVAdecRYHeKoE6O0+32OUq8zWqOV
        pW4vdd+1GvFsd0SU91ijAIV7G5O09Rw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-wUKvUsOyMVevnLLkx28PCQ-1; Tue, 12 Jul 2022 08:28:07 -0400
X-MC-Unique: wUKvUsOyMVevnLLkx28PCQ-1
Received: by mail-qv1-f70.google.com with SMTP id u15-20020a0ced2f000000b004732a5e7a99so1699195qvq.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 05:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6ezubj+x8V1oMG/VgleHBRCXDdJg/g3Jj5Gyxz0aX/o=;
        b=DVOqWfBDiGxebWw+1sNWBV6AvlXEQmMzgTitcKJ1/QSz3AA+QFqb4x8FwkS+JrrE1z
         gnmOeAsFaipmj3r2+J+R5pwwC8OFD0yb4MH/tlZfCGWnDgiELVC+cH3k0H8rpbpmRBa9
         3+A0Ary92Ir9QgmznZOLJsHTMvr7swPNiXzZBYxrmbyJ03ULongzIxfWXlRooMJMTLfo
         eHVcAVgrXC5AfH/JhbzojFAGg7EgxsseD4H/EGh2OENMTabK7IKQ+yPsjGeVuaVPcYcV
         tTGlxOlMRTtMDyy8yq1W3nKsew8cmZKW1a3qQ6zcZ3YHnBIA43ISWt4LbFD74X4fmccz
         /JXA==
X-Gm-Message-State: AJIora/QrReYWIQcaLRcZEunz4kyjqKvcfGU1I6sNo1h6xDa761v4X6t
        afzb42B8EC+W9Ed1lStT5BOUsfFSwRZ2hXOsojS6/9xj/xxQ99G0rIBKmV4pArFV2243f/2CUus
        /+8FSGSmuLe5s7uJgbpm1m+tDJQ==
X-Received: by 2002:ac8:7d01:0:b0:31e:a8b6:4b51 with SMTP id g1-20020ac87d01000000b0031ea8b64b51mr15655958qtb.537.1657628887178;
        Tue, 12 Jul 2022 05:28:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tp0QbFAhpizOdM5MiCE8LdazkPKo9lplF/hD2JOGk4bxb8ASKJ769UXH42PhpI0jryr6FlfQ==
X-Received: by 2002:ac8:7d01:0:b0:31e:a8b6:4b51 with SMTP id g1-20020ac87d01000000b0031ea8b64b51mr15655938qtb.537.1657628886963;
        Tue, 12 Jul 2022 05:28:06 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::2e])
        by smtp.gmail.com with ESMTPSA id y9-20020a05622a120900b0031e9bd3586esm7576887qtx.79.2022.07.12.05.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 05:28:06 -0700 (PDT)
Date:   Tue, 12 Jul 2022 07:28:03 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Parikshit Pareek <quic_ppareek@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Prasanna Kumar <quic_kprasan@quicinc.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: add missing apps_smmu irq
Message-ID: <20220712122803.j3d2zgbqmlpzy7er@halaneylaptop>
References: <20220712080156.1364-1-quic_ppareek@quicinc.com>
 <CAA8EJppaTC8tJ_MTgDhogHBRXTVSOWXLZJOQwpONgF+RNNn2gA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJppaTC8tJ_MTgDhogHBRXTVSOWXLZJOQwpONgF+RNNn2gA@mail.gmail.com>
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 12, 2022 at 03:10:16PM +0300, Dmitry Baryshkov wrote:
> On Tue, 12 Jul 2022 at 11:02, Parikshit Pareek <quic_ppareek@quicinc.com> wrote:
> >
> > Add missing irq number 696, and correct the interrupt-mapping of context banks.
> 
> If these two patches touch the same device (and the same interrupts
> property), it might be better to merge them into the single patch.
> 

Heh, I mislead Parikshit into splitting them... sorry!

> >
> > Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> > Signed-off-by: Parikshit Pareek <quic_ppareek@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > index 7945cbb57bb4..1197d60c2827 100644
> > --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > @@ -1591,6 +1591,7 @@
> >                                      <GIC_SPI 693 IRQ_TYPE_LEVEL_HIGH>,
> >                                      <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH>,
> >                                      <GIC_SPI 695 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>,
> >                                      <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>,
> >                                      <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>,
> >                                      <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>,
> > --
> > 2.17.1
> >
> 
> 
> -- 
> With best wishes
> Dmitry
> 

