Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B81D56C48D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jul 2022 01:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238523AbiGHTvt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jul 2022 15:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238431AbiGHTvs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jul 2022 15:51:48 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D00CE87356
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jul 2022 12:51:47 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-fe023ab520so30497657fac.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jul 2022 12:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=/gjPq+VtGqMyAx5uOhmiX/uYDdGj2/BayEk8UBg9x5U=;
        b=EMlmWFkf2LyyZsQ5T1TsVdwR8rDVGGi3xwaulrUugfDD6FWcRkZvti0JpiRvGrz2rc
         ugAb9GSwRyIUafQaLitKKtGSTwVYwPQ32cl2bg1KM/kaBM7zQ8k1poRPWCk/qaXdx1lN
         hLPD6MSbtz9+I0C+57durvBHXqAK1oScchki4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=/gjPq+VtGqMyAx5uOhmiX/uYDdGj2/BayEk8UBg9x5U=;
        b=6K5Aw99iqij0EmYoAAwlEFyhtHXoM/0O0Drw+xnN0Qdx2ZNKTNQPWnTT7FJo4y8GAf
         qs+caYYHY7PlN70N0bP2pYtrJ0R9L4imtrIepW9T36dHFhOO/tGfjuUAUO3qg/l3QygJ
         g0nfrfpwo7Jo52kQJjX1yclIc/2UykUSXd8A08QRnfZc8/QpencjGkM/FovwAkTkG5/8
         ZQe1P1K5lcx4XyWmlwD99e5h/VYxi7kYPF9fjPcMuQUIAXXpdA88SpXZv5Zcwwf88yEZ
         VyqTkF8IQ/w4CTCoTk+7osPE+nmk5wP+j4fXQLM/HWKGbsaV5EuZQWMf9+qpKddcBLga
         uq/g==
X-Gm-Message-State: AJIora/0Jah4Vqsh/vg9TyrVShUsCmK3X9nbvqoJDF6wDAhhFvjgtUrX
        fS7JRexfZlE4Abv7doPmBsymkgkBcaGvnQ1Qu1jYww==
X-Google-Smtp-Source: AGRyM1ssYBzg3aw7EgpsvaBBCDRNrYkf2xVI0tLWP0CzvvlIHFIxz3sX3z3EmX3zGt2Lb4rzOjeEU3+B74yyqCcdFnI=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr942418oap.63.1657309907213; Fri, 08 Jul
 2022 12:51:47 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 Jul 2022 12:51:46 -0700
MIME-Version: 1.0
In-Reply-To: <eb22ae44-b347-1566-939a-4ca840688f07@quicinc.com>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
 <20220707213204.2605816-2-dmitry.baryshkov@linaro.org> <CAE-0n53zV2OjXxjJ_AwCDcAZvOY+BU0-xipxQkup3muHMRCPXA@mail.gmail.com>
 <b8ee5a03-1168-d5ca-97fe-f82a9d7e453e@linaro.org> <CAE-0n52YGDOSZpL+3d=_APsOwVvrJG7uR-x1AcsBej5KrDct5w@mail.gmail.com>
 <eb22ae44-b347-1566-939a-4ca840688f07@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 8 Jul 2022 12:51:46 -0700
Message-ID: <CAE-0n51YV7Oo1HSsoyL-9F=h_wVZh210cScB55qLDD9CM2vXKg@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: msm/dp: drop extra p1 region
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Abhinav Kumar (2022-07-08 12:38:09)
> + kuogee
>
> On 7/8/2022 12:27 PM, Stephen Boyd wrote:
> >
> > Yes I see the same address for P1 on sc7280. Maybe it's a typo? Abhinav,
> > can you confirm?
>
> P1 block does exist on sc7280 and yes its address is same as the address
> mentioned in sc7180. So its not a typo.

Thanks!

>
> Yes, we are not programming this today but I would prefer to keep this
> as optional.
>
> I did sync up with Kuogee on this change this morning, we will check a
> few things internally on the P1 block's usage as to which use-cases we
> need to program it for and update here.
>
> The idea behind having this register space listed in the yaml is thats
> how the software documents have the blocks listed so dropping P1 block
> just because its unused seemed wrong to me. Optional seems more appropriate.
>

It doesn't sound optional on sc7180 or sc7280. It exists in the
hardware, so we should list the reg property. My understanding of
optional properties is for the case where something could be different
in the hardware design, like an optionally connected pin on a device.
