Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F20F59ED67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 22:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbiHWUg7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Aug 2022 16:36:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbiHWUgf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Aug 2022 16:36:35 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F97D261D
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 13:19:01 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id w19so29655689ejc.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 13:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=l1iBTcJ+I4g1JTfLPRirKOb7WIUh6Sd18iAIN/V+zHQ=;
        b=c8YudHngMrJ4MJ/hfh+NjYvkynkWBEcm198z3KwNDaSkrf1RxEwqATZXSwqBGDFOTT
         hlQPvg5TesRDlRGUuREBGEinJDUhhl1SRcCV7VC9o4AYNQB37qJ+t2nQXkBvWmX+j4No
         3cW0/JEE7YEr4J5wK93gzjyGDLNaFzJp88t0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=l1iBTcJ+I4g1JTfLPRirKOb7WIUh6Sd18iAIN/V+zHQ=;
        b=MgrPo+bsqNmFdTC/GP4UE7eEfcENu/8Pr3osODrojRBg4+pDKIRBsVuHbXptavNiIl
         UMX9LdPJEjHRez7Uy1pYxqTsXRhbt/VhTC/DldY304HpW8eWdCHSnYwTxEKXmPcmuCBa
         AIObts1YczGtIQ25Klaq7orXc8Sh9+ezCmJSQwqwTCrYQ5nl+F45h6DyXQI9pRvjZoW0
         +pN+Qu3oaVJAuJJBxGT0g462Y2tRxMQJznMwO+VtPLlaDbTIniap8slmuIIsIwvzdJil
         AmT9AcpVbVbzlWedTanZtb3mqEyw55zSy7xDF9sWUw+kf4nX8xIBmL4kMRvHminihbFF
         4eZA==
X-Gm-Message-State: ACgBeo2uXEISJ9ir/ZmPjggQMVbFtKz/v+E47J1Qi7cg7sDzBLTmmiYy
        c50IOi29/7az+tSA9/FoZPaii1Ue/VY+QMXONFc=
X-Google-Smtp-Source: AA6agR5e0QD0wkA18DdzBJTCarBJuxvA5XRuWKrNaTrb51LxAygY/KZlsZ7TJpper1RfLiU8u5tZNQ==
X-Received: by 2002:a17:907:a069:b0:73d:70bc:3702 with SMTP id ia9-20020a170907a06900b0073d70bc3702mr822673ejc.109.1661285939424;
        Tue, 23 Aug 2022 13:18:59 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id j16-20020a056402239000b00445f545e4besm1930082eda.59.2022.08.23.13.18.58
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 13:18:58 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id b5so14023891wrr.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 13:18:58 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr14338202wrr.583.1661285938285; Tue, 23
 Aug 2022 13:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220726102024.1.Icc838fe7bf0ef54a014ab2fee8af311654f5342a@changeid>
 <20220822193153.zn2oxljmd76awqot@halaneylaptop> <CAD=FV=V_V-M1fJmeWH_=wG4GB9GERL9ToAZTwAjX9i-6k6QkWA@mail.gmail.com>
 <YwTQ1i5s5cwowRss@sirena.org.uk>
In-Reply-To: <YwTQ1i5s5cwowRss@sirena.org.uk>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 23 Aug 2022 13:18:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V5VF-cwN7xiqz5HHPORrGGDPgVehC7zwQj2xfi0mi2Jw@mail.gmail.com>
Message-ID: <CAD=FV=V5VF-cwN7xiqz5HHPORrGGDPgVehC7zwQj2xfi0mi2Jw@mail.gmail.com>
Subject: Re: [PATCH] regulator: qcom-rpmh: Implement get_optimum_mode(), not set_load()
To:     Mark Brown <broonie@kernel.org>
Cc:     Andrew Halaney <ahalaney@redhat.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Aug 23, 2022 at 6:06 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Aug 22, 2022 at 01:13:55PM -0700, Doug Anderson wrote:
>
> > I guess at this point I'll wait for Mark to give his suggestion for
> > what to do. Options I'm aware of:
>
> > a) ${SUBJECT} patch was written as a cleanup as per Mark's request and
> > we could just revert it.
>
> > b) We could make it so that failures to get the input/output voltages
> > doesn't count as an error when going through the get_optimum_mode()
> > path.
>
> We could push the checks for a valid voltage down into the drivers, a
> lot of things aren't particularly sensitive to the output voltage here
> and are much more sensitive to the current draw.  Depending on people's
> attitudes to DT stability for Qualcomm platforms we could also fix the
> affected DTs as well, though that doesn't stop us handling this in the
> core too.

OK, patch posted with this approach. ("regulator: core: Require
regulator drivers to check uV for get_optimum_mode()") [1]

[1] https://lore.kernel.org/r/20220823131629.RFT.1.I137e6bef4f6d517be7b081be926059321102fd3d@changeid
