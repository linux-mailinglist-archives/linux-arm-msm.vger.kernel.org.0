Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA01457CC13
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jul 2022 15:37:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbiGUNhn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jul 2022 09:37:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbiGUNhm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jul 2022 09:37:42 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 367A07E33B
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 06:37:41 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id t3so2243756edd.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 06:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8/cqmxcIHyGuuAd34yH5EGseYF2qIVCLxif3aKApjO8=;
        b=jQFRTYzVKfF7XyCxEjMIsHJZa8HQ0iHL21yIQj1Gy5IrYzGHlCXHfSFcxJI/9zfPHT
         zrlQ5VDaVZr9dhrwrr88VgBc/CzeknSxs3+qAQLyANBZAwoUZp3X4O3J+Zc5mvXCQ2yz
         U7eTH2JhxhZDOYg8zidV39R6zFx+zpmW4Of24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8/cqmxcIHyGuuAd34yH5EGseYF2qIVCLxif3aKApjO8=;
        b=x6EfORa8wWTzBAbqz2/lkk5E/q/3k8ARZNFIy8Ec1ajhAo9CZFrhuDzk22FiadzATA
         G8CDv8515UAaikGaB1rvzrP+6R+F3DSVZoJs5Mm88xqNjU6Bbm5rNGyPO1SEcWv5tWio
         NI2hqShGxwywbbsfwCwtwnK8Mb5mMWO2+aHpAOpv+BnFWmx+j5FM+tWXQkXhHjaAPdPZ
         eRBT6A/EPgpOvfSl+JD7qAGXwp7KBBZVjb43NtLTj7k1yAa99AOH5TEKNm0FxUvZyyEd
         +gZKtR3lzezXgH0cZgUmXxtCy14SBz+idiBcqDwcXrj4Fh7nnLqHxhO8rjWEqjDvxhfk
         LRpA==
X-Gm-Message-State: AJIora/J8XoUyys8CgZftEneWt21ZH4lEf+yr9hLBnKC1ljRd2jrEiGF
        hs4oiGzPPuPMvB696zjHpc6GWR0jFmPgna7H
X-Google-Smtp-Source: AGRyM1sLN7wtf60aix0Lj1ZZDAcDgjuhndAyy5p+noTOOoco8d8dUl0ah5c7eo7WeOQH7KalWSZiUg==
X-Received: by 2002:a05:6402:4c3:b0:43a:f612:179d with SMTP id n3-20020a05640204c300b0043af612179dmr57292252edw.422.1658410659151;
        Thu, 21 Jul 2022 06:37:39 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id g1-20020a17090604c100b006fe9f9d0938sm865810eja.175.2022.07.21.06.37.37
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 06:37:37 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id c187-20020a1c35c4000000b003a30d88fe8eso3342497wma.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 06:37:37 -0700 (PDT)
X-Received: by 2002:a05:600c:2e48:b0:3a3:1ce3:3036 with SMTP id
 q8-20020a05600c2e4800b003a31ce33036mr7949226wmf.188.1658410656948; Thu, 21
 Jul 2022 06:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220721033918.v3.1.I10519ca1bf88233702a90e296088808d18cdc7b1@changeid>
 <20220721033918.v3.2.I7ecbb7eeb58c5e6a33e32a3abf4d6874e6cb725c@changeid>
In-Reply-To: <20220721033918.v3.2.I7ecbb7eeb58c5e6a33e32a3abf4d6874e6cb725c@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 21 Jul 2022 06:37:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WSBgupLFMCZgianck6uTkAyqrG0WK2ChSbNbJdhOPdLA@mail.gmail.com>
Message-ID: <CAD=FV=WSBgupLFMCZgianck6uTkAyqrG0WK2ChSbNbJdhOPdLA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: arm: qcom: Document additional sku6
 for sc7180 pazquel
To:     Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
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
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jul 20, 2022 at 8:59 PM Yunlong Jia
<yunlong.jia@ecs.corp-partner.google.com> wrote:
>
> The difference between sku6 and sku4 is that there is no esim
>
>  The different SKUs are:
>
>    LTE with physical SIM _and_ eSIM
>    LTE with only a physical SIM
>    WiFi only
>  Both sku4 and sku6 are LTE SKUs.
>  One has the eSIM stuffed and one doesn't.
>  There is a single shared device tree for the two.
>
> Signed-off-by: Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
> ---
>
> Changes in v3:
> - Bindings and dts in the same series.
>
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Not worth sending a new version for, but normally I expect the
bindings to be patch #1 and the dts change to be patch #2. In any
case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
