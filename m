Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58F25573ADC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jul 2022 18:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237141AbiGMQLJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jul 2022 12:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236436AbiGMQLG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jul 2022 12:11:06 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 887EE4D17B
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jul 2022 09:11:01 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id l23so20693487ejr.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jul 2022 09:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I1yHtelLfIuuksB/OCx4cTvNALVYaFuUlJJrqkka4yY=;
        b=Q+lhLkXrv581QlmBwTnMFoFeQ0KhIhq1UWbsMA/nqfEmUfIoeWkNNQTl7IHZ+60/ur
         tpnQPIvURh6nerhexLU8wLj4J64GiD7EQIhcSIue1O6ytmXKUMjYp90zbJ8SCVOVIrLI
         Cf+vz7UW9lJs9WKlmfILG3E7L75M7wdsbI3PA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I1yHtelLfIuuksB/OCx4cTvNALVYaFuUlJJrqkka4yY=;
        b=sQ8R88PQXDCdUjDkkMy01mc5QOMO5KEVJBT+rrFKe2vg6czyZiueUB0N5KB2RyPUMa
         5Fo/hpvn5l7+Ej0RSWmsnLqQzjZ9gQy/jwT7kAIdSaeiLRpD1IxSxAkBgsKyZUYpTSky
         513UEWh6OILrg/NSmQMwrkt/XuMd++M833l58ntLXhykL7Lvs0nEXEiG/G664xJasyAq
         ubCK/Bd4DobZDlQDeGqN7alFM5+9D9BvVXfsiiopw4WBHigbvZrikBBDT+ABxZAXuQe2
         CcTE7+UnXzoKCJh56D4o8+pbfyRtea9NKe24XvYjWRCNWBRdPr5nwsujOa9xtpdq08E/
         qtXw==
X-Gm-Message-State: AJIora/tMsDynMpSWTnXYoQtS3Q4UI9eVZ+XQmD+xqA6W0/b8UGmB6Uw
        cFvwnlqnU1taykg6faXk2e8ml06rVR1q5hRB
X-Google-Smtp-Source: AGRyM1ufCE+hsdc++fuNacAOKKI5a+JIMr+OgIClr7NT1LBozPZtJavWcuIjKNLPnXXnzdoTfmsv+g==
X-Received: by 2002:a17:907:a042:b0:72b:4fac:1ddf with SMTP id gz2-20020a170907a04200b0072b4fac1ddfmr4350636ejc.285.1657728659854;
        Wed, 13 Jul 2022 09:10:59 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id su21-20020a17090703d500b00722e0b1fa8esm5198140ejb.164.2022.07.13.09.10.58
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jul 2022 09:10:58 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id j29-20020a05600c1c1d00b003a2fdafdefbso937280wms.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jul 2022 09:10:58 -0700 (PDT)
X-Received: by 2002:a05:600c:285:b0:3a2:e5fd:84eb with SMTP id
 5-20020a05600c028500b003a2e5fd84ebmr4497164wmk.151.1657728657965; Wed, 13 Jul
 2022 09:10:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220712150219.20539-1-krzysztof.kozlowski@linaro.org>
 <20220712150219.20539-4-krzysztof.kozlowski@linaro.org> <CAD=FV=VPHwkKUjanLtaM+cXdp+VGPExJ_XDe=-O8j=ayGNtnVQ@mail.gmail.com>
 <996a49ea-5fba-3885-09ca-5b9a92b840e7@linaro.org>
In-Reply-To: <996a49ea-5fba-3885-09ca-5b9a92b840e7@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 13 Jul 2022 09:10:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WdH0FLfQ-MMwkrHfo3xTjg8M2vxV5iO-CEpCDWG8NKKw@mail.gmail.com>
Message-ID: <CAD=FV=WdH0FLfQ-MMwkrHfo3xTjg8M2vxV5iO-CEpCDWG8NKKw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mmc: sdhci-msm: drop redundant of_device_id entries
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jul 13, 2022 at 9:07 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 13/07/2022 17:57, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Jul 12, 2022 at 8:02 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> This reverts three commits:
> >> 1. Revert "mmc: sdhci-msm: Add compatible string check for sdx65"
> >>    This reverts commit 953706844f0f2fd4dc6984cc010fe6cf51c041f2.
> >>
> >> 2. Revert "mmc: sdhci-msm: Add compatible string check for sm8150"
> >>    This reverts commit 5acd6adb65802cc6f9986be3750179a820580d37.
> >>
> >> 3. Revert "mmc: sdhci-msm: Add SoC specific compatibles"
> >>    This reverts commit 466614a9765c6fb67e1464d0a3f1261db903834b.
> >>
> >> The oldest commit 466614a9765c ("mmc: sdhci-msm: Add SoC specific
> >> compatibles") did not specify what benefits such multiple compatibles
> >> bring, therefore assume there is none.  On the other hand such approach
> >> brings a lot of churn to driver maintenance by expecting commit for
> >> every new compatible, even though it is already covered by the fallback.
> >>
> >> There is really no sense in duplicating of_device_id for each
> >> variant, which is already covered by generic compatible fallback
> >> qcom,sdhci-msm-v4 or qcom,sdhci-msm-v5.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >
> > Personally, I would have taken the extra step and added a comment in
> > the code to prevent someone from doing this again. Maybe like this:
> >
> > /*
> >  * In the device tree, all boards are required to have _two_ compatible
> >  * strings listed: a SoC-specific one followed by a more generic one.
> >  * Normally we can just rely on the generic string, but we always
> >  * include both so that if we ever find a bug on a specific SoC that
> >  * we need to workaround (like in sdm845/sc7180) that we can quickly
> >  * work around it without any changes to the dts.
> >  */
>
> This actually does not instruct the developer not to add new variants to
> the driver, so how about something like:
>
> /* Do not add new variants to the driver which are compatible with
> generic ones, unless they need customization. */
> ?

Sure, that would be fine.


> The problem is that this applies to several such drivers on several
> platforms (Qualcomm, NXP - these for sure use such pattern), so we would
> be documenting something obvious, IMO.

The problem is that the people adding to this file are probably not
device tree experts and may not know, so a short comment might be
worthwhile. If you don't think it's a good idea, though, I won't push.

-Doug
