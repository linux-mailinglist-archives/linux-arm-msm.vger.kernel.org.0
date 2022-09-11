Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F2E25B4F33
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Sep 2022 15:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbiIKNp7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Sep 2022 09:45:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230241AbiIKNp5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Sep 2022 09:45:57 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 001D82CDC9
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 06:45:46 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 130so9178129ybw.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 06:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=5HqIOcG8x4likLdUFYhKV2vDY9FYKtBGRhEqTmUcrsY=;
        b=S0L2CvFshXTcGx2gV46rtMsvefTjoiczN+TXYgfWm41bgtY5+1jOsw23Zi37N3K9xE
         aA8oemxSJ8X44ndvDESNHxSgYaNeJ7mTyK/aBqONVba0zXB5J2mORlp/g6atZvc8N1Mb
         pfJPM8bY+vqXL5sIpUA9OZk1TvH7z/LBReR+5OpkdsnvDD5LPw4a0Dz5vWOfcbssPthJ
         jPy4+g0+7UGuUZ7leUeqENKSWArOTdfzeVt0Ta8cDtnKhGhgDl8O43G8pmbzi1veftNs
         ihWjWQW2XqbphhnfvFev+xbJsd3vzfxS6HPhACJsORvpF26WEIJie9CdMYt6fEJtk23Y
         uNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=5HqIOcG8x4likLdUFYhKV2vDY9FYKtBGRhEqTmUcrsY=;
        b=jmzRaIwBdoW0f6RXUuVu0+qv2+9vHov0079db4vYpP3BWrfKKJifBAH7vHUxuE9DeJ
         dy1STget5eokewHTGXCjJBcWVDxPI2zy1aaeNDdyQ1Tr+HQLx22WWk2HItKaGY8h6sjO
         IQOpxSd/0lQS83Azos6nHTRqDNbssyQh8Sd+s53geIeOAkMqdZfkcZiKdYUwibYaZt4U
         ZZXpJePeIZ9Sw/AL+wlWp3ozMyWOsjGue2aVTdX/ahxFl5Un6Jou/jpM0OPP2iJv0EQx
         /WEi2Bjqdb3KQGmUz9IhpzqYzWBWFflKgXip73jRKHI5ly6iWRSVcAQQ57hKYlF9O6ND
         zUqQ==
X-Gm-Message-State: ACgBeo0/9Ps0PCaz9ND7hwH//Vf9bgQRbgLaGDC10uwLyiAd+e58dDS6
        dEk/h/brTdKLjQbXtqFimz5/flDl52yQGHB4I9ZyOMd9KWk=
X-Google-Smtp-Source: AA6agR5b3srfz+0UXFR6VD9/hRFnzkydunMZcHEgtygrOZCAfrlPx9UUN7wz0ndz1t7d1pWP7P7GK4PEl9YOqEl2K/0=
X-Received: by 2002:a05:6902:1029:b0:6af:2c99:4630 with SMTP id
 x9-20020a056902102900b006af2c994630mr696449ybt.516.1662903946156; Sun, 11 Sep
 2022 06:45:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-2-dmitry.baryshkov@linaro.org> <3e525135-d205-eddc-ff2d-98c8321386e3@linaro.org>
 <20220908193705.GA3002673-robh@kernel.org> <1ebe64a3-fab9-1dd7-517a-01001a176d9f@linaro.org>
 <CAL_JsqLkV_fnUnc4cS=cdTvP3rKYAS011_+KZYiBGhXDx-pHnA@mail.gmail.com>
 <2204eab4-b22d-8ee7-4595-49139cb387a8@linaro.org> <CAA8EJpqHL-gO=zSG6Ek=-y4njGF5R66z0MwLeKZ9U4Ag1j51Og@mail.gmail.com>
 <e7a132e7-a819-ebe2-e6e5-c01cbfacef15@linaro.org>
In-Reply-To: <e7a132e7-a819-ebe2-e6e5-c01cbfacef15@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 11 Sep 2022 16:45:35 +0300
Message-ID: <CAA8EJpoPPRAQPfVQmSfrrDrroMp0bzvJ=-vHMRx72aKTBgPOTA@mail.gmail.com>
Subject: Re: [PATCH v6 01/12] dt-bindings: display/msm: split qcom,mdss bindings
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 11 Sept 2022 at 14:27, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 10/09/2022 14:54, Dmitry Baryshkov wrote:
> >>
> >> However I think there is no such problem, as Dmitry said, that ref
> >> changes anything. There will be always failure - either from parent
> >> schema (using $ref) or from device child schema (the one which actually
> >> misses the property).
> >
> > Initially I stumbled upon this issue with the dsi and dsi_phy nodes
> > for msm8996 devices. If I have $ref here, dsi1/dsi1_phy nodes will
> > emit warnings regarding the missing -supply properties despite nodes
> > being disabled. If I use `compatible' here, the schema checks pass.
> > Thus I'd prefer to leave `compatible' here. Not to mention that it
> > also allows specifying a tighter binding than just using the $ref.
>
> I don't think we understood each other. I claim that error will be there
> anyway, just from different schema. So your change fixes nothing in
> total schema check...

If the node is disabled, there will be no different schema check.

-- 
With best wishes
Dmitry
