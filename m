Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6C2C509901
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Apr 2022 09:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385704AbiDUHZs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Apr 2022 03:25:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376962AbiDUHZr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Apr 2022 03:25:47 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE31118367
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 00:22:58 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id j8-20020a17090a060800b001cd4fb60dccso4377631pjj.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 00:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cmd0E8Et4Aqh5aFcilCHXMmJJLWu1Jtl7bjaRVoAghc=;
        b=wlpnfsZ16kVfFPfp0k7Xj0f/aywbiZeLM4giSo7yBwG9EWkqD7nzRgzQ8sF933Mir5
         5J5YxRb1Sn613WSHJZqpEO1cao98as3MMx1p/h1VIRoV1NPKbuXITZTdwCBtB4w0Hvhv
         NzGU7bgDiaG0QTcoVX2PdwFTW0ISrwv8eCeKnOknh5CzqMN8fNsJnKqrH7Qbi/ATlAn9
         mc+ajMM1PLJX0m84nWKrxEhe11zMs3WDUqOwac9nZZyhtqOAZp/phrX55gcTelgupd9V
         L6Luf/Qt9k4lTI/FcV5s090CQk9HwX5H+l7eFF2QhizHRLp7sv23a5GpyZMNONzkqP1w
         mkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cmd0E8Et4Aqh5aFcilCHXMmJJLWu1Jtl7bjaRVoAghc=;
        b=NnZHSGzz7hsTAbY2alTaz1AzqBryS7nNKPl06OhIhgmyLCdAekQpo/q6Lt97js2K1x
         uGcF/0dbSUKE8Kic4n7cgf+U2F5MJ2NG1AfCUkqVyvd35sQk8I10A0IMPysgUz/WBx4X
         M10x973+aKRLrT30yv0t/gGsUJIn5C4cLAemc4jvNyR8/kMe2iYwIqZBmvFanvhGlZZ2
         fke4rdukIvENE7w2Edlk6Wdizz4SkEGHqmbehIqCSZcB1pacYzvEKFE3n8blfyklnwEn
         uVLakgraoGNp6yskXo87ThH0Zf1upHRg/YI5VdOWhCxy1dtcBiQo/cRz2gnTaJrwL9l5
         WdTw==
X-Gm-Message-State: AOAM530R/Sa6A+IgfFKGm0zW4xODG1fE2G4aLB8Qoe8deJoWAbLddnhp
        nbW5sBU0od7nNU34TZM6qBM0EDyqi/ROOJChey1KDg==
X-Google-Smtp-Source: ABdhPJwJ+eJ+vATRB/XjaodcI4GTsx+t0J1D+9WNX9bPTfhZ/WJLHVyG2MdACY15rk8788iGZEzyO+B/x7DhWAjNAjI=
X-Received: by 2002:a17:902:e881:b0:158:fd34:7b28 with SMTP id
 w1-20020a170902e88100b00158fd347b28mr18501645plg.95.1650525778165; Thu, 21
 Apr 2022 00:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220420102811.3157-1-slark_xiao@163.com> <CAMZdPi9WJsz5nyzQB39q=Jhy8_q2=N8VAucYMUYKUf_faL5csQ@mail.gmail.com>
 <55f0b74e.25a7.1804aeeedb4.Coremail.slark_xiao@163.com>
In-Reply-To: <55f0b74e.25a7.1804aeeedb4.Coremail.slark_xiao@163.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 21 Apr 2022 09:22:22 +0200
Message-ID: <CAMZdPi93zxGmb-ns0bNk6itcUck1=Hsh5Y9-FFCNBU2qNg248A@mail.gmail.com>
Subject: Re: Re: [PATCH] bus: mhi: host: Add support for Cinterion MV32-WA/MV32-WB
To:     Slark Xiao <slark_xiao@163.com>
Cc:     mani@kernel.org, quic_hemantk@quicinc.com,
        gregkh@linuxfoundation.org, bbhatt@codeaurora.org,
        christophe.jaillet@wanadoo.fr, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 21 Apr 2022 at 09:04, Slark Xiao <slark_xiao@163.com> wrote:
>
>
>
> At 2022-04-20 20:00:23, "Loic Poulain" <loic.poulain@linaro.org> wrote:
> >Hi Slark,
> >
> >On Wed, 20 Apr 2022 at 12:28, Slark Xiao <slark_xiao@163.com> wrote:
> >>
> >> MV32-WA is designed based on Qualcomm SDX62, and
> >> MV32-WB is designed based on QUalcomm SDX65. Both
> >> products' enumeration would align with previous
> >> product MV31-W.
> >> Add some new items for mv32 to separate it from
> >> mv31-w, in case we need to do any changes in
> >> future.
> >
> >On the contrary, do not overly clone the structures, and re-use the
> >mv31 ones if they apply. You can rename them to mv3x if you really
> >want to.
> >
> >Regards,
> >Loic
> >
> Hi Loic,
>   Thanks for your suggestion.
>    Actually, for different chip(like previous SDX24 and SDX55), they may
> have difference behavior. For example, the item of 'sideband_wake'
> of SDX24 is true but the rest is false. It's hard to say SDX65 would
> align with SDX55 until now.

I agree, but as long as the structure's fields are the same there is
no point in duplicating them.

>    Maybe I can re-use the same item '.config' for all MV3X products and separate
> them from device info(mhi_pci_dev_info).
>    Do you agree this?

Yes.


Loic
