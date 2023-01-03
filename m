Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B389565C3EA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 17:32:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233299AbjACQbr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 11:31:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233268AbjACQbo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 11:31:44 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72D17FEC;
        Tue,  3 Jan 2023 08:31:43 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id j16so12013918edw.11;
        Tue, 03 Jan 2023 08:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S2YWh/dkKNhGC//4LIzOt+gAfTsIhfEKiR0SLS2Kg3o=;
        b=FjoQIj8SceeC3CN8uhYrt2GPQ+hdG63GJIHDxj8eB1ism2E9WeRBKvIEqMwiMsOSBL
         s2M1oJa/1kfcbgKOsE9GaNCUQ/1lPEZilCivryeEIPhyq4rKn+TIqOtfQI6dSMWazaCa
         0Dx9pwyWSmCT4xDdXX9zY9MNoKCz09roeHnmzj2int0NrIVeUsMylruZiH+1y+idGKH7
         cmXcZQ8TBgroWNIC9PqEkvpkZyRmS5y/sOH9OyR6U3Ez9uUYH8RRXnZVPFmcxYs2CTlO
         OSEXCwhcMkMIpgLp3lGMqolr7kNwHYUY6rZVfk90zEzmd5BeFJZoZEsNdLzqVlDPMXd9
         Uueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S2YWh/dkKNhGC//4LIzOt+gAfTsIhfEKiR0SLS2Kg3o=;
        b=B6aDn963fGPKTx9XongV98W8V1j8gDCu8NGyZooYtGMY0hyNnu/1r6bDK9kSUzFxn+
         P9H1ovloHzoMafibK9KsTG6DzssJDJxjuvkU/owsI3Nf2TFsdNiTYsxg44oRuQDZPtOi
         BIvXC/kATGy3M4hG3/fJEZnqadCidDXdCI6QwFXS7bFUfxvN468A4HiekytjlAhrdvam
         n3fp0FRevRJZVHwshz1BXniJldaIWkA3FcUjYSinBwlSZzHDfSuj+OZqdKZN3V0jveim
         rCxpqV2RKujqEd533oblzVcROT7TLbbA46m1eCyD6RzTzqrlsvHMjohtyIyE2+nKYzeq
         1P6w==
X-Gm-Message-State: AFqh2koIBFtGFbNpxQcIiWBata5Sd0xll3SyjsOS/GFAZIoPxhyMIwON
        bGxg4YAeGqwxQmYiuNPfXlfdcRdt+UAuAw66L6w=
X-Google-Smtp-Source: AMrXdXvDtW2HNNVSlMhARn6WFq5LvS7z3hnIol2vx6eCOKTHPrsGaQOMvorgjovpDKyIyW3xkCcc+TO3uQSguAg6SkQ=
X-Received: by 2002:a50:ff07:0:b0:48e:b978:cb44 with SMTP id
 a7-20020a50ff07000000b0048eb978cb44mr455313edu.37.1672763502005; Tue, 03 Jan
 2023 08:31:42 -0800 (PST)
MIME-Version: 1.0
References: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
 <20221228133243.3052132-6-dmitry.baryshkov@linaro.org> <CAOCk7Noa1A4mBqg3OAxk3hnnUg-qjCeCE0tyhq3ktbFcETicqw@mail.gmail.com>
 <cf1f65e4-338a-c519-1401-91e13b5fd937@linaro.org>
In-Reply-To: <cf1f65e4-338a-c519-1401-91e13b5fd937@linaro.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Tue, 3 Jan 2023 09:31:30 -0700
Message-ID: <CAOCk7NrrwF8mO4tE3GG2KjajehuC7QthHjNjurZWCSXccZ=LVA@mail.gmail.com>
Subject: Re: [PATCH 05/16] dt-bindings: clock: qcom,mmcc-msm8998: drop core_bi_pll_test_se
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 3, 2023 at 9:09 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 03/01/2023 17:38, Jeffrey Hugo wrote:
> > On Wed, Dec 28, 2022 at 6:33 AM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >>
> >> The test clock apparently it's not used by anyone upstream. Remove it.
> >
> > IMO, NACK,
> >
> > This is not a valid justification.
> >
> > The DT is supposed to describe the hardware, and should be complete in
> > that regard.  This clock exists in the hardware, so it should be
> > described.
>
> Most of Qualcomm clock controllers can input clocks from
> core_bi_pll_test_se. But we are listing them only for a small number of
> them. And even on these platforms nobody provides this clock.

IMO the Qcom bindings could use some more rigor, I just don't have the
cycles to help there.  The ones I've looked at appear to be written
from the perspective of "what does the linux driver need" and not
"what do we have in the schematic".  Often "what does the linux driver
need" changes over time, which means the binding needs to evolve,
which breaks the interface.  It's entirely valid to not use something
in the Linux driver, especially as the platform implementation is
probably minimal during early bringup, but such things are expected to
be implemented eventually.

There is a huge set of existing platforms where we probably can't go
back and fix them since the binding is already defined, but going
forward, new platforms can do better.

>
> Maybe you shed some light here, what is the source of this clock? Who
> provides the clock, e.g. on msm8998 platform?

It is an external input to the SoC, similar to CXO.

On the laptops, TP88 (test point) on the main motherboard is routed to
the SoC pin.  I don't have schematics for every platform in the wild,
so I can't say if that is the norm.

-Jeff
