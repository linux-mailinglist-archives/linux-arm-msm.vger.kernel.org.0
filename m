Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2980857BD3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jul 2022 19:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235921AbiGTRyP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jul 2022 13:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238015AbiGTRyM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jul 2022 13:54:12 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79E2A5D0F3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 10:54:10 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id z23so34432019eju.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 10:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ctz6Bj/1tsBk5/T9SJKUKyY4+CIziBZQwdo01hjp3G8=;
        b=lWkIFnYQD7yxdJ57mymN1bcXuzrHSYZCACCxSHvSeafJkvzxKZlV017M9cIEtJXSv5
         +ZFDy3IT9RrVDw6hsr/wUNGKWtnZ+YcKjdx++Ity5lrfjq6zIlz36my/ku9QrfAPnGMW
         p79Zo6qOUcw0VhLATLslDn3XqfD9hxLIWL+Po=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ctz6Bj/1tsBk5/T9SJKUKyY4+CIziBZQwdo01hjp3G8=;
        b=Ahlh4tfsAAKaw9iMfBZN65C7HVS5y9pLUj8awEwKsuPmpTdoQk6r2xhR0V3LEXpLyu
         isu2b9yFfZ5PIvGOYW/Np0zT+LuGbXxBOx5pbm+ikEKXQV6S7K2GvJpuZDt7fQK6zlif
         5DxWZXmiptNp+EBZiG5tHQqVeIPjRJ8bQ+mKL3E2sQNjOvTjYq6HMrk/6jHhFpRlb80P
         hrL/VokRewFSA8bQ/ZStCrsEp+jPRQE+eee/6I7GWUkZg68Xdy4IcBxi1NxP1hC53prr
         cbNfCGEx/FoLPf2QehfsQymi3XXzngnokOyE2c/h9bDVZ/xtmdROePpxNtQ2dxqY3wCC
         lQHw==
X-Gm-Message-State: AJIora8EcuPBlsMa68z6qjtdRebP5uZSqbOqufh4vCaXn6TO3/C4JuoL
        AT0Mw7i7V1eVajHXY0M9jQtOe52NipF3HHNZ
X-Google-Smtp-Source: AGRyM1sHWbr3maErZtdXeuz7NGXmjTFuweJYMFfhVQ4qQR9w/nbIfTevHed5yAZxCFDbB+yZC4SAZg==
X-Received: by 2002:a17:907:2c5b:b0:72b:54bd:40f8 with SMTP id hf27-20020a1709072c5b00b0072b54bd40f8mr36818706ejc.137.1658339648844;
        Wed, 20 Jul 2022 10:54:08 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id r23-20020aa7cb97000000b0043bbc9503ddsm579227edt.76.2022.07.20.10.54.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 10:54:08 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id d8so7229125wrp.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 10:54:08 -0700 (PDT)
X-Received: by 2002:a5d:5889:0:b0:21d:bccd:38e3 with SMTP id
 n9-20020a5d5889000000b0021dbccd38e3mr30862732wrf.659.1658339647846; Wed, 20
 Jul 2022 10:54:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220720025058.1.I5bfba8857ea0d43c747ecdc3a950875abd56927f@changeid>
 <7a04c9af-0ccb-7711-249f-73908fe7ec36@linaro.org> <CAD=FV=V1MqQzNxq_L8sGtu2JwAAL_FWKXkw9bhCHcD0DycFMUw@mail.gmail.com>
 <bcbca05e-2b75-a405-b1ea-21b276931a90@linaro.org>
In-Reply-To: <bcbca05e-2b75-a405-b1ea-21b276931a90@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 20 Jul 2022 10:53:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UEt4fcVaFvS8nr7Z0GNYM1T=mz7iUhwg+bBkWtbO4c1g@mail.gmail.com>
Message-ID: <CAD=FV=UEt4fcVaFvS8nr7Z0GNYM1T=mz7iUhwg+bBkWtbO4c1g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: Add SKU6 for sc7180-trogdor-pazquel-lte-parade
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Henry Sun <henrysun@google.com>,
        Bob Moragues <moragues@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jul 20, 2022 at 9:55 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 20/07/2022 17:13, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Jul 19, 2022 at 11:10 PM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 20/07/2022 04:51, Yunlong Jia wrote:
> >>> SKU6 is LTE(w/o eSIM)+WIFI+Parade
> >>>
> >>> Signed-off-by: Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
> >>> ---
> >>>
> >>>  arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dts | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dts
> >>> index 764c451c1a857..4649eaec6318d 100644
> >>> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dts
> >>> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dts
> >>> @@ -14,7 +14,7 @@
> >>>
> >>>  / {
> >>>       model = "Google Pazquel (Parade,LTE)";
> >>> -     compatible = "google,pazquel-sku4", "qcom,sc7180";
> >>> +     compatible = "google,pazquel-sku4", "google,pazquel-sku6", "qcom,sc7180";
> >>
> >> You miss binding change and sku6 should be rather added before sku4 as
> >> it is more specific, isn't it?
> >
> > Just to close the loop: the order doesn't matter at all. Neither sku4
> > nor sku6 is "more specific". One has the eSIM stuffed and one doesn't.
>
> Thanks Doug. Then the commit description could be improved, so reviewer
> does not have to ask such questions. Otherwise it is confusing to see a
> board which says it is for LTE version but it is actually not for LTE
> version (or whatever combination you have).

Yeah. I guess it makes more sense with the background knowledge that
the different SKUs are:

LTE with physical SIM _and_ eSIM
LTE with only a physical SIM
WiFi only

...so both sku4 and sku6 are LTE SKUs. One has the eSIM stuffed and
one doesn't. There is a single shared device tree for the two.

-Doug
