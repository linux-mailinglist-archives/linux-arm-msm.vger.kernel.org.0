Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51AAC5BD58E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Sep 2022 22:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbiISUPI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Sep 2022 16:15:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiISUPH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Sep 2022 16:15:07 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFB2D24951
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Sep 2022 13:15:04 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id o70-20020a17090a0a4c00b00202f898fa86so337954pjo.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Sep 2022 13:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=5BYRBPM4zgHC3VahcAikqjcoL49FznoCsyxR5lJsfXs=;
        b=jGUM5iJdCo0C89YZE3pQLBoXd+In0uh5e7oBz3nuDxJWeEUeQED/sc+04OhosoSNn1
         eqW4JB7ME/K6EuVgW96GN1JTa+G+T2z78in6okYpiYYNHDXbQBXHKNjBX0IDQqzZJagl
         VJCbFfmrmHb0EJdff5fV9twN/BdOsJt1MXAKAQXlbJ6cdry8d35wVBULPMi2uU498/r6
         c/LLESssj4qH4qMcEkLU0AAdc4IhZfma7RGSfoQx3t7PVOAsvNO31YcjIO/Aq3xkeBJ1
         ZHFhSD8WlHlac8jZLZukS/pLlk2s9njSMno3H7vOf29XGr2p8Ys2Sr+JrZY2uIU62ocK
         H0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=5BYRBPM4zgHC3VahcAikqjcoL49FznoCsyxR5lJsfXs=;
        b=zKOMVZkOS8j8PPdTEuDNCe6zDhNkYfjL9IX+iMVniKcKIeXDzHN0src/3Ws+WsxqXb
         eCD6lZu20WaiCTT+4Gps228TZetEce9zXgTIWf7Y8ZBEVkAfZU9WDOOtCpCP7+2Whx6i
         8AJ874nW6/7M6iTAl+MHwc+KOi74rfKBCSJ5i7IgQMWWswNMK3uFJe2Gq8sL5Spn7sTE
         YzlssvJ6N6wRC44lmsiT83lCvIBsmuSXIae1kXy6kXfyEtCjPM9BdYm6VeLyrd0/+/P3
         54igVSKUkLnDeCeBBe5i2FaIxSX8nI8b0m/wloNxXfBGGWL11P/cnQerfQiRKXlQHq3d
         oBxA==
X-Gm-Message-State: ACrzQf0/U7NqxKMmeOlHGCNUYgddESDV+lVyUXXSvgDkoo9Kbo0mMC+a
        6XVa/l+OT+T7UzDWmC2+OveDmIGTUE6EBA==
X-Google-Smtp-Source: AMsMyM7x+ReDBhM9VXt6bAhzRSvtmB0maQ+OBP02xCg2iLo1g+0X6Z8rE3ao5xM0BsRhk0EF7xSi4w==
X-Received: by 2002:a17:90a:fe90:b0:202:a345:b7a6 with SMTP id co16-20020a17090afe9000b00202a345b7a6mr21338567pjb.14.1663618504464;
        Mon, 19 Sep 2022 13:15:04 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id b22-20020a630c16000000b0043057fe66c0sm6177279pgl.48.2022.09.19.13.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 13:15:03 -0700 (PDT)
Date:   Mon, 19 Sep 2022 14:15:01 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Deepak Kumar Singh <quic_deesin@quicinc.com>,
        bjorn.andersson@linaro.org, swboyd@chromium.org,
        quic_clew@quicinc.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH V3 0/3] rpmsg signaling/flowcontrol patches
Message-ID: <20220919201501.GD759648@p14s>
References: <1663133102-10671-1-git-send-email-quic_deesin@quicinc.com>
 <74224354-8543-559b-240b-0eda4d68fc52@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74224354-8543-559b-240b-0eda4d68fc52@foss.st.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 14, 2022 at 09:50:48AM +0200, Arnaud POULIQUEN wrote:
> Hi Deepak,
> 
> On 9/14/22 07:24, Deepak Kumar Singh wrote:
> > [Changes from V2]:
> > Trivial review comment fixes.
> > Avoid TIOCM_DTR etc signals in glink layer, use native signal macros only.
> > Glink layer to provide only flowcontrol on/off interface, no specific signal passing/receiving to client.
> 
> 
> Please, could you have a look to my series that implements
> your proposed interface for the virtio rpmsg [1]?
> It would be nice that your API takes into account update to
> support of the rpmsg virtio implementation proposed in [08/10] rpmsg: Add the
> destination address in rpmsg_set_flow_control[2]

I agree with Arnaud - I would like to see more convergence on this topic.  I will
not move forward with this patchset until comments have been provided for [1].

> 
> Thanks,
> Arnaud
> 
> [1] https://lore.kernel.org/lkml/e54bcfcb-8e37-9caa-b330-a7411820b7ce@foss.st.com/T/
> [2]https://lore.kernel.org/lkml/e54bcfcb-8e37-9caa-b330-a7411820b7ce@foss.st.com/T/#m7340a8e70fb0d8935869c4cef96863abda555c96
> 
> > 
> > Deepak Kumar Singh (3):
> >   rpmsg: core: Add signal API support
> >   rpmsg: glink: Add support to handle signals command
> >   rpmsg: char: Add TIOCMGET/TIOCMSET ioctl support
> > 
> >  drivers/rpmsg/qcom_glink_native.c | 63 +++++++++++++++++++++++++++++++++++++++
> >  drivers/rpmsg/rpmsg_char.c        | 60 ++++++++++++++++++++++++++++++++-----
> >  drivers/rpmsg/rpmsg_core.c        | 20 +++++++++++++
> >  drivers/rpmsg/rpmsg_internal.h    |  2 ++
> >  include/linux/rpmsg.h             | 15 ++++++++++
> >  5 files changed, 152 insertions(+), 8 deletions(-)
> > 
