Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9849B7202DA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jun 2023 15:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234408AbjFBNOk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Jun 2023 09:14:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234817AbjFBNOj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Jun 2023 09:14:39 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9907AE54
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jun 2023 06:14:14 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6262be06e41so20561336d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jun 2023 06:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685711595; x=1688303595;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lbyPb51PUU9vujG848UEmxA9BGlz0whFY4MV5fQj0w0=;
        b=qGWH/1bXYEzE2F7UnnX96OoaTmbGGJoVpNHNDFD6Y+H1xZ6vjQZNHXXfIhwYOX0RS9
         ZZCQi5K921TAc7mdOgNuJbweg/epBmeb/4+6kvnw2JgVQ9y0iqh0aUT6PW+ua6VLm/xK
         ssEorZY+F5LrTXa0TT7gZ1cIc3/sNneEdJW839DsWU/YEhuFycg7V+fbEoSEiT2WTUJA
         bVGEy7eDqB+sk8kD38d3+vEKtCgPZmEwuRH8WSbEgPIB79cIrBTVH1+kgpbHAPl5otsC
         UcjL1y96nGQGFubjtAPcWaTMCFNhyBi2Hg1vkHP0IoxZodRYbBwiROPT0+6LiQjiJld3
         7sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685711595; x=1688303595;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lbyPb51PUU9vujG848UEmxA9BGlz0whFY4MV5fQj0w0=;
        b=jyDIBmHf+10vziRuwdrTP7ld584K0/aozfNwMVA1gXL8Lp2l/wSRrbs54bgn7yHJVa
         KGIInP+yiCSpdYbpQzzsgmXyNceLn8sKiglcSHfoCsajqAbQ09MqjGH+U3DaRjK/OWLb
         kbPX0mqYNlobHYryELscrXFsikYxvr9PpHatWoZV5arE6Hq8fOG8K8mfeyUjHjq+x9yx
         ECfvz0y/ihgwBReRh/TOHGCN92nd4KPKXpLS6UtCxjflvu9tcrF2mhVe2d8HgXLFhOLn
         cWqFdc2bTfxnLCuPvVogG5e208pY0Y7LxS6g8lJwjtqjhYbt2R81BZJLRvW0Z/GuUFSm
         tb/Q==
X-Gm-Message-State: AC+VfDxmKeGGPQ9G51W2mmnK2duayIoXA+HomDQtg+116qs7cYG7/auc
        4uYss14i2FGQUrD1xZHNT/noKDt/sa98H4NDeIvxbA==
X-Google-Smtp-Source: ACHHUZ4Pd8rkTYRSbfpRv+e7lK1HpfUnzaQipyvb44jP7vvORuNcC4OW6/uX3ZUCF3mEX9y84D3H/Jv5R8kjk8GpAwU=
X-Received: by 2002:ad4:5fc9:0:b0:5ef:8c79:fe92 with SMTP id
 jq9-20020ad45fc9000000b005ef8c79fe92mr18248218qvb.3.1685711594910; Fri, 02
 Jun 2023 06:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230324063357.1.Ifdf3625a3c5c9467bd87bfcdf726c884ad220a35@changeid>
 <CAMi1Hd1avQDcDQf137m2auz2znov4XL8YGrLZsw5edb-NtRJRw@mail.gmail.com>
 <552345c5-b1e9-41f6-f275-b6eeeb51df25@linaro.org> <CAMi1Hd05z8uBotO4vs7Ropmt7W2gSA__tTu_=X1t0mze7bXrhg@mail.gmail.com>
 <CAD=FV=VSFDe445WEVTHXxU1WS_HGUV5jR5E8_Vgd4eyhn3rHyA@mail.gmail.com>
 <CAMi1Hd28FJUjB8A-9YF7xpKOzSyNWXX3qung4aDjpLBhOvw_eA@mail.gmail.com>
 <CAD=FV=W13L0H88G1gt8qRnXfpV-_7E9QfHufN_a23_B1bb=aww@mail.gmail.com>
 <CAMi1Hd1WCtNvNaY_kVMx5F8T0nMVHvsjk9LsSETCMWWQyaq_Vw@mail.gmail.com>
 <CAD=FV=W5Y_SHp0y2MEs8d1k255bm_PXdRYEmYei+g79pjnzYuA@mail.gmail.com>
 <CAMi1Hd2OeL940r7jq0=Z_oxE8MYVioy0YnJXQC_5e0vJONd2sQ@mail.gmail.com> <1bc79c48-7cba-476d-9a7e-5754a88fcdae@sirena.org.uk>
In-Reply-To: <1bc79c48-7cba-476d-9a7e-5754a88fcdae@sirena.org.uk>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Fri, 2 Jun 2023 18:42:38 +0530
Message-ID: <CAMi1Hd2BLB6H3QRLB5svRTkGoXaUeEsakNsmfCOjbDBcCEeqkA@mail.gmail.com>
Subject: Re: [PATCH] regulator: qcom-rpmh: Revert "regulator: qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS"
To:     Mark Brown <broonie@kernel.org>
Cc:     Doug Anderson <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 2 Jun 2023 at 18:07, Mark Brown <broonie@kernel.org> wrote:
>
> > > If you reorder the nodes in the device tree, I think it'll change the
> > > probe order. Does that affect anything? I'm wondering if there's some
> > > sort of delayed reaction from a previous regulator.
>
> > Hi, Bumping lvs1 and lvs2 regulators up to the top of the list in the
> > DTS https://bugs.linaro.org/show_bug.cgi?id=5975#c4 does seem to work.
> > I can't reproduce the crash in 125 reboots so far, while I'm still
> > testing with only qcom-rpmh-regulator kernel module. I'll do some more
> > testing with full system running and send this re-ordering fix I can't
> > reproduce the crash further.
>
> So whatever the issue is here it's a timing/race condition - this seems
> like a workaround which works just now but it's not getting to whatever
> the actual issue is and that could come back.

Hi, I'm happy to debug this issue further or test run any
patches/ideas if that helps.

Regards,
Amit Pundir
