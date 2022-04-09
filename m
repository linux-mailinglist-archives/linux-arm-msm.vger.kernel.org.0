Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0D964FA08C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Apr 2022 02:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239933AbiDIAVB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Apr 2022 20:21:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239418AbiDIAVA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Apr 2022 20:21:00 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA3E52AC7E
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Apr 2022 17:18:54 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-df02f7e2c9so11379678fac.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Apr 2022 17:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=50xptwVRrkuRO66P0RVniJpVpOVm1a9lccHqnLvTlfE=;
        b=AmiZYX62pPfnCtUyEyYbUUuIlm5QJX31JlXqQPG6DdRm11ixOurVukbq0OobhW9wNJ
         +wLsJm0MDe/0tw7a55pwdBnRAILieI+RDqSF9L0Zs3yEut5/tC6bluMxaao84HHXBhd9
         GxWIr4DvBJARM8f/S01X5h197q3UTNPG3UFPsPQe4RIwcPLckiG/gvcbxKKnIApOljzN
         NH10WkvcZAbVpO6Y9RFo6WxTDa00Y/u0bqPtnf2XivcJM0smlmWqFLCF5yqpZX053O4s
         XWqx8JvrPjHsYircGxNfKtuWuB8jWl3RlN/p3A1wJfikJfK56owM91jz5XtDSKSdCi+6
         73YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=50xptwVRrkuRO66P0RVniJpVpOVm1a9lccHqnLvTlfE=;
        b=UdjG+JTVYuUJD7er4KJiOewctU2Tcz90jAYpG80bjAiV45AYUjhVHuNWMYsLbbU7QL
         n5FaZ+y3QNMTtw5fIYKS6uKC6oj2j5mvpscCwqFQZUk4xgYztnP3sQ6+GIbfOnQKHaj0
         tRVSR9B3HVMpfe7dWNgbbLPJUW0Ht4614fojjePmRXrD8fjRjfMOluxvHC2JnhvWjgUs
         tLnXnz40JPkwvTM+axYppxzYh0+sU72eVmyxY1lE15EbNBIS0mDAGzqprrqOkzvpeeMC
         +e1Ay9nJixE4m+RmNjSIXBRNVfOjNck4SLFCYyWntVQHujGmX/lQs67bF8Z64asKdFHp
         bkmA==
X-Gm-Message-State: AOAM531myYV3o7iqV7r/9rqw9bC5RwzDDJt+dCR8cSdGuWgD9pSuxFj5
        /llbBhKn01UEqoYfD82KSeC30Q==
X-Google-Smtp-Source: ABdhPJx+aln7MEBB70i3l11Ekrt/TtO5AGwQEfIeBbGMN8Y1DEbJs0dkAoACV8uHpyJPSysMYr8KLg==
X-Received: by 2002:a05:6870:41d2:b0:e2:1465:b63d with SMTP id z18-20020a05687041d200b000e21465b63dmr9960149oac.164.1649463534279;
        Fri, 08 Apr 2022 17:18:54 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id 184-20020a4a03c1000000b003240492fc15sm9159240ooi.36.2022.04.08.17.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 17:18:53 -0700 (PDT)
Date:   Fri, 8 Apr 2022 19:18:52 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        quic_msavaliy@quicinc.com
Subject: Re: [V3 0/3] arch: arm64: dts: qcom: Configure cts sleep pinctrl to
 bias-bus-hold
Message-ID: <YlDQ7GyxSSIOsHVq@builder.lan>
References: <1649229362-31183-1-git-send-email-quic_vnivarth@quicinc.com>
 <CAD=FV=XieM5MHMBBV9d7jrbiN+8RVdo6=_XSNf9L-yqEZUTO_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=XieM5MHMBBV9d7jrbiN+8RVdo6=_XSNf9L-yqEZUTO_Q@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 06 Apr 10:04 CDT 2022, Doug Anderson wrote:

> Hi,
> 
> On Wed, Apr 6, 2022 at 12:16 AM Vijaya Krishna Nivarthi
> <quic_vnivarth@quicinc.com> wrote:
> >
> > WLAN rail was leaking power during RBSC/sleep even after turning BT off.
> > Change sleep pinctrl configuration to handle same.
> >
> > ---
> > v3: apply same change to active state and other sc7280*.dts* as well
> > v2: used bias-bus-hold as per review comments
> > v1: intial patch used bias-disable for sleep pinctrl in sc7280-idp only
> > ---
> >
> > Vijaya Krishna Nivarthi (3):
> >   arch: arm64: dts: qcom: Configure cts sleep pinctrl to bias-bus-hold
> >   arch: arm64: dts: qcom: Configure cts sleep pinctrl to bias-bus-hold
> >   arch: arm64: dts: qcom: Configure cts sleep pinctrl to bias-bus-hold
> >
> >  arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts | 12 ++++++------
> >  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi                   | 12 ++++++------
> >  arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi                 | 13 ++++++++-----
> >  3 files changed, 20 insertions(+), 17 deletions(-)
> 
> Probably the subject of all the patches should be modified to talk
> about what each patch is applying to. Having 3 identically named
> patches is not ideal.
> 
> I'll let Bjorn chime in on whether he'd rather adjust the subject
> himself or whether he'd rather you re-send. In any case, with the
> subject modified then for all 3 patches:
> 

I've been fixing up a ton of these during the last few releases, so I
think it's time that I stop doing that.

Please resubmit this with subject prefixes that matches the existing git
log for each change.

> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks,
Bjorn

