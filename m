Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8B127056E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 21:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbjEPTR3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 15:17:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjEPTR2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 15:17:28 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77C627DA7
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 12:17:27 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-561b65b34c4so5674937b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 12:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684264646; x=1686856646;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NznzujyOJyNbnjSaoz9CRaFsnChHQPszQ2ixGOczZrc=;
        b=NwMpZ+r4QJ/cUpYDi0gsuyYSS0blzpn4/pHjC7ud/sM1GUt6nG4ke/JtOgCZKKMsBn
         Qw9SlDRtgA+Jj9QXPYeNgmfot9rAgXeYa53Yi2QCO69sI6BAS1UOhccVAlg8dQ2NjfjH
         2rXoN18JNZcaiAeHnyduMOTQ+aFdzBby7mAgHBdszpwtmRWi1IEbnq28UTQ0zYXrvIwr
         rgNb3hejJXpwyCTgjaVuFHkPzsW1k/pplmbbiPTUeoi7Pp8KbjGEKVPU9Toti2s3T4f1
         CjlUO/hi9Tu5zIVnhiqz5Z3keeJ9LZgviTE9u2YE5jYO7xfDiUODLEJaz/xQVPg8Lafh
         xm7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684264646; x=1686856646;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NznzujyOJyNbnjSaoz9CRaFsnChHQPszQ2ixGOczZrc=;
        b=eN09T/bcKKJwMnXxvtkANJXpoVXFbxYMztQ0WcqsiquiQTNLTe23NxXvzI/78Ivs6K
         txKytm1R1jEmyDV+QKjCNsB4vb/csA+XzfZuEPH0ySfHT1D3TwHnKvqn3StI+c9JzD53
         wbFKfP0cfn8C1RsbaDcMUE6FXbfWNyI1uaUUE/d/OsoBjO++0dB1rMGxiNKeBVgY83/B
         7Q8/vBQRTRz6EX+zAHbw5EZlrKGri4MKaw92WBdicxqHMEy2v3tEXE0HMqyalpW7aaHb
         A8WfPKocNKEypD5lMAG18Mr9HTic9adpjWT3pfvACYxcxqXaEXt4vPScP+Sk6Qro9B2E
         NnvQ==
X-Gm-Message-State: AC+VfDw0X4GO3MRG3xh6eYDIvIuZFrnnRi/HcbQmbiW3kvbXqayEdlzP
        WFmY7wOwdLZw4poOOddVyxoBpJ7VPGTshcadoQKJmA==
X-Google-Smtp-Source: ACHHUZ4fN6ZvOHVMrjpM38dbrTF0vq9ndvGzrrcTvQuObM37IZqpp9d3swNrt6OnWc5xKOZXJLqNXPG/9NwnyDG/1d0=
X-Received: by 2002:a81:c214:0:b0:561:8c2f:d050 with SMTP id
 z20-20020a81c214000000b005618c2fd050mr2528895ywc.15.1684264646646; Tue, 16
 May 2023 12:17:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1683628357.git.quic_schowdhu@quicinc.com>
 <343182748e12b6a4ac57d336405c50e36fc5520c.1683628357.git.quic_schowdhu@quicinc.com>
 <CAA8EJpp2x2OEB2sg+caKmjkDYJp_NJ9mXo85FxTZr-9zRXHNhw@mail.gmail.com> <7d397e67-5d56-4975-98af-1ac9746c07f4@app.fastmail.com>
In-Reply-To: <7d397e67-5d56-4975-98af-1ac9746c07f4@app.fastmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 16 May 2023 22:17:15 +0300
Message-ID: <CAA8EJpoMGyAJBTw1-=+NT=ysy+cpc4EpJSv1SABJVh2BscdJ+g@mail.gmail.com>
Subject: Re: [PATCH V6 1/3] dt-bindings: sram: qcom,imem: Add Boot Stat region
 within IMEM
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 16 May 2023 at 11:16, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, May 9, 2023, at 13:35, Dmitry Baryshkov wrote:
> > On Tue, 9 May 2023 at 13:53, Souradeep Chowdhury
> > <quic_schowdhu@quicinc.com> wrote:
> >>
> >> All Qualcomm bootloaders log useful timestamp information related
> >> to bootloader stats in the IMEM region. Add the child node within
> >> IMEM for the boot stat region containing register address and
> >> compatible string.
> >
> > I might have a minor vote here. Is there any reason why you have to
> > instantiate the device from DT?
> > It looks like a software interface. Ideally software should not be
> > described in DT (e.g. this can be instantiated from imem
> > driver-to-be).
>
> There is nothing wrong with describing firmware in DT, if that
> firmware is part of the platform, we do that for a lot of
> other bits of firmware.
>
> However, in this specific case, many things are wrong with the
> implementation, and neither the DT binding nor the driver
> makes sense to me in its current state.
>
> >> +  "^stats@[0-9a-f]+$":
> >> +    type: object
> >> +    description:
> >> +      Imem region dedicated for storing timestamps related
> >> +      information regarding bootstats.
> >> +
> >> +    additionalProperties: false
> >> +
> >> +    properties:
> >> +      compatible:
> >> +        items:
> >> +          - enum:
> >> +              - qcom,sm8450-bootstats
> >> +          - const: qcom,imem-bootstats
> >> +
> >> +      reg:
> >> +        maxItems: 1
>
> If I understand this right, this "qcom,imem-bootstats"
> device serves as an indirection to store additional
> properties of the system in a memory area, but the description
> of that area is more complex than its contents, which
> makes no sense to me.
>
> Just create a binding for a firmware node in the devicetree
> itself, and put the values in properties of that. The first
> stage firmware can still use the same interface, but the
> actual loader that assembles the DT can get it out of that
> and store it in the properties. With that done, there is also
> no need for a kernel driver, as userspace can just get the
> values from /sys/firmware/devicetree/ directly.

This sounds good, except the always-present issue of the devices which
have already been released. Usually we can not expect a bootloader
update for these devices.

-- 
With best wishes
Dmitry
