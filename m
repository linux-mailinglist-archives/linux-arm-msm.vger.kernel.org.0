Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C0DE5EA659
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 14:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234230AbiIZMl6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 08:41:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234614AbiIZMlk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 08:41:40 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30C63115F65
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 04:18:29 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-3452214cec6so65199027b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 04:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=WvDse09bmVqe1v4bAMTxO1zF42M4yNVVMYmxZQhWitQ=;
        b=xdf57XKzjdyAQ9JfIDTR4dZFijfC7ZSxuluOmfABDC/fyCasGGVkK0noDxxxMT1bYs
         eNd6miXruXqog21Vm8KOZGauYAKx1TCMmnvIBVFNx+tLH9svmLyr6KOc20Sy0H2vAy02
         Mx0zddjMpJBKfG7Z/0yWkrMMgb0fngqUytR6U8Wa5SXKt268V8Ntd28P/BpIRClN+lD7
         ya2jDOizOmDkWhU9Q38TO+O1P/3pyY4MKUdAEgNNbbZAz0ypEykROEhdjSGa11AxUhpZ
         6i/0mWtyMzvrS9QcZs0bSYJ1DQnhNyZppq0yfCXExyPnUxedti+OfULym6lLY2NHipky
         60KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=WvDse09bmVqe1v4bAMTxO1zF42M4yNVVMYmxZQhWitQ=;
        b=fFPImrj8b5TwDZXbYJXmM/CwCO/hLBI7t9R8YJd3+ZquLKXMIXewlfc09ocaTTh5v9
         TtjCZZselVOxLL4qXRswkEH7tVBxg6a7XhWRObYZxiM+hMaEoBRsw9LABldzb2Gr0tRy
         ShSHP+0aUT0QkGa0dSiy0Y7p0H37gHyh1QvVpHoHOFxmweqTLFuX7rfoATXO1BhhVD2+
         IocLAeBidjxT19cWsUA8lS41pGcMlMF6pDSnaUjS+cjIqgwS3w1uEEXbyIOKxWKnldkl
         nQZwISyYZgvEMiBeqUJc+8qFOa/CB+zLGfZVRX7CSMTzqwLUDakerx9kpjeRMPAGUQUT
         aoYw==
X-Gm-Message-State: ACrzQf2kczYT+QfPNzouoGPhtS0lL2eVqQ1iStnvdWU7370BTyoilE66
        DN5pqhqFimhN/6MCX7+WdggsUuzgCHUMqKbDNWg+NA==
X-Google-Smtp-Source: AMsMyM5Tz7DUFDW33OpYyhT8+unBKHG5TNYkQGqQQnVd2QORmiiOiYZshfL+0/MqqJBQPrposOqCWQOY4K7zjY7ltNg=
X-Received: by 2002:a0d:d68a:0:b0:350:a7f0:7b69 with SMTP id
 y132-20020a0dd68a000000b00350a7f07b69mr8231573ywd.132.1664190989438; Mon, 26
 Sep 2022 04:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220720073326.19591-1-krzysztof.kozlowski@linaro.org> <7fdcff6a-9db9-a9d0-4013-7d3ff5fd5d8c@linaro.org>
In-Reply-To: <7fdcff6a-9db9-a9d0-4013-7d3ff5fd5d8c@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 26 Sep 2022 14:16:18 +0300
Message-ID: <CAA8EJprom=CfxPQke5JjZi0CSSvvB=cw1RxOO8StLThpASG3ew@mail.gmail.com>
Subject: Re: [PATCH v5] dt-bindings: qcom: document preferred compatible naming
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 26 Sept 2022 at 12:30, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 20/07/2022 09:33, Krzysztof Kozlowski wrote:
> > Compatibles can come in two formats.  Either "vendor,ip-soc" or
> > "vendor,soc-ip".  Qualcomm bindings were mixing both of usages, so add a
> > DT schema file documenting preferred policy and enforcing it for all new
> > compatibles, except few existing patterns.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> >
>
> Guys,
>
> This is waiting for two months. If you do not like it, please respond
> with some comments.

I'd say, this is good, it documents what was agreed before.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
