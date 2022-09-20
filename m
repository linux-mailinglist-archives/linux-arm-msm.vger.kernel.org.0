Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E34CA5BE3BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 12:48:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbiITKsY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 06:48:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbiITKsX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 06:48:23 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7E273ED77
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 03:48:21 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id a10so2554661ljq.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 03:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=rEGmknlYprbAXEKZt0aDiUeWs1wXNDCingS635ls9Fc=;
        b=HyqCxNPj5NRGA1a7SPijTw1BTZjf9krt+Mi0HRZjs9kmt3FQY1aAdhBWC9UuffmJ9H
         45ia3cDWPaAnBpdWUKG4FHblG2GDBKwA7SBc/OKHkI9fPc7ZgzMW0RkgTJD3OxeBC6ak
         ZjuLM/QAGnBJOD5eKjncckAICt5FPjj62iY8IHZ6tmZCEffiA13mxyc3Sk+ZWiVh7Kjq
         IugtQpJTs8mC58wTbTFN/v8J+GRVcrqUr2J1V5B9rMQhr2lGryjMnzbI+7pb/9uLLyau
         0m6/PWWkRvrt6p7DUDvKFpJJCqjAD4XvDWk5Vqm1aYh+uOxhgCnkOEATQU+a5j9TWsIw
         iWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=rEGmknlYprbAXEKZt0aDiUeWs1wXNDCingS635ls9Fc=;
        b=1uLJyGZtc/gg9sqJ49rcB3EvL84iuer9U+6Aw5IW4m2yoIBLbHphYlt6vlqOzTGEMT
         bp8pb+xE6VI2J6SPtecO7uznfxXnW8FdxNcSt1UhzYIblND8N8U2AawFF+iyMNRyJ7xM
         uY7AHEwZX3ovxPe7U7GG8VXgWiFpf6KWfS61lkMIY8JpgL+6CQkO5PwISKNPTp8H3WLu
         XL0yZ1wVWJe5r+IGTUCKy+rsr5AwmgcGuqwSessXXm0v9yw7TTNsW99Hqdx5idcyqf3f
         KosMnU1wBaoulPNJrt2Pio/yP5fOHFWTpVieDVLWiTU6qKeJTd5URBNE5SH+Z3qKeQso
         ipaQ==
X-Gm-Message-State: ACrzQf0JNpNt1+AfuR//6W2JuULQzYFigmK40zZ1QIKSG127a5D53+f4
        BL1+6JncI140rjKtGfT1HDmhTHfYKqkynnYiePcJVw==
X-Google-Smtp-Source: AMsMyM6LRzJcHqKA484dpEdut/aXm2HrrwXEfE2I0p+wciPdizqSlOjLEHCiJMmPkNcVNC5h8NjCwvWrM5xWucnrY/o=
X-Received: by 2002:a05:651c:1a29:b0:26c:2241:8aa0 with SMTP id
 by41-20020a05651c1a2900b0026c22418aa0mr6562812ljb.96.1663670900075; Tue, 20
 Sep 2022 03:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220919221509.1057574-1-bhupesh.sharma@linaro.org>
 <20220919221509.1057574-2-bhupesh.sharma@linaro.org> <bb577304-f048-8fd5-fc7a-47a0897ba792@linaro.org>
 <00dd028f-d636-0cda-40ce-01d5addcbec9@linaro.org> <ccc318c0-ee1b-d538-6d2b-bf85a3c9c6fd@linaro.org>
In-Reply-To: <ccc318c0-ee1b-d538-6d2b-bf85a3c9c6fd@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Tue, 20 Sep 2022 16:18:06 +0530
Message-ID: <CAH=2Ntys+JSurmZn5qN2Kuphi_5q6Ge7cZgd9KMTvAyLnd6JSA@mail.gmail.com>
Subject: Re: [PATCH v6 1/4 RESEND] ARM: dts: qcom: Use new compatibles for
 crypto nodes
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        thara.gopinath@gmail.com, devicetree@vger.kernel.org,
        robh@kernel.org, andersson@kernel.org, bhupesh.linux@gmail.com,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        Jordan Crouse <jorcrous@amazon.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 20 Sept 2022 at 15:09, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 20/09/2022 10:57, Bhupesh Sharma wrote:
> >>>             crypto: crypto@8e3a000 {
> >>> -                   compatible = "qcom,crypto-v5.1";
> >>> +                   compatible = "qcom,ipq4019-qce";
> >>
> >> There are few issues here:
> >> 1. Compatible is not documented.
> >
> > Its documented here:
> > https://lore.kernel.org/linux-arm-msm/30756e6f-952f-ccf2-b493-e515ba4f0a64@linaro.org/
> >
> > [as mentioned in the dependency section in the cover letter :)]
> >
> >> 2. Compatible is not supported by old kernel - ABI break.
>
> You cannot fix this with dependencies/ordering.
>
> >> 3. Everything won't be bisectable...
> >
> > I think its a question of dependencies b/w the patchsets intended for
> > separate areas. Let me think more on how, I can resolve it in newer
> > versions.
>
> DTS always goes separately so this also cannot be fixed with ordering or
> dependencies. However if Bjorn is fine with it, it's good.

Sure, I get your point. SInce I haven't sent out the crypto driver and
DMA driver subsets yet, let me stop and respin the series with the
dt-bindings changes clubbed with the crypto driver patches in a single
patchset. I can keep the DMA and dts patchsets separate and send them
out separately.

I think that should help maintain the ABI and backward compatibility.
Please let me know if you think otherwise.

Thanks,
Bhupesh
