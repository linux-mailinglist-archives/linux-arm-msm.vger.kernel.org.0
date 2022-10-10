Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C0215F9CD0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Oct 2022 12:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231835AbiJJKcM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Oct 2022 06:32:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231856AbiJJKcL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Oct 2022 06:32:11 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE6D646623
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Oct 2022 03:32:08 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id bj12so23821046ejb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Oct 2022 03:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sUmw0IHEGVDgOguiSCvP9wAQuCGVsQC+HnuP25zWN0U=;
        b=LmRr3kNfZrjya+cXTq6NOY9D9HWbQCawhGqHsLhSpWXlrNAEPQIm50xmC9ce6ayxWb
         VXHsMsnSbQGsNS6ohnkNOlbBtIErwKG7Vel5nq9L9MBKef0ctH2iwKRybQlhWyT7FgSI
         0IhTlD2paGZRZRX2f6GVEAxTsnlkW8essDcyTreCzDweSlhPal4GtwxVtl1yo9np8E/3
         XAg0fPCYjMr6GZJRgBRxrpBxegzsxj6bHTS9/4veev3TnzsScYxTHPQXUKIKxChZBgqy
         vKdl8ZzPgTPZDVFecGzd1/t96eS4BOfjFGoD8PDBp3AGq700vUjZInavp4hh6HmoHqJF
         2Idg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sUmw0IHEGVDgOguiSCvP9wAQuCGVsQC+HnuP25zWN0U=;
        b=hY5ztLrrdnYw8oYScUumw7iMMkZJ6e47d2XIKePxDw2SusTS++1B6TDZ6X32EQ7M3h
         4FyN8AlIa0eEmMK1HCV4Liy2jAUtYQ8fNKrZkTaRI3V4Nd4yy+KQ29wLhGXThz0+IMaG
         L6QntKPLO+MrPSVKsVNAizOEznV5dQF0LCpzkH0o4Oh1IVNPQK9Qu3QE1N/9G0g5T3xf
         /k1fT3TB4f5hVFAhbAW0CFBT1+Esgr0cdigsstDAmOrDG+thgZdwrqgCD158aI8HcYDZ
         qcPcgE7R2W+7GgysvStZOI3k42sUV79/DbJ0KhbPJBY/vQQy/ZY5f3iCRtraGvk4qYri
         dtww==
X-Gm-Message-State: ACrzQf3L2KSkYWmO9j1Cn9osn13Wlh4optd2asBWvqz0cSY9cCFBXPep
        8MFQNAVUMDOKfI2cLNf64JUQpA==
X-Google-Smtp-Source: AMsMyM6qC8gsE/9iSUwLTzN2y/cZjDjz7nNKiEj5v3E8mrkTZ2TT2fyMPxM5Khu1zEiilpzvPd8U6A==
X-Received: by 2002:a17:906:8a76:b0:781:7530:8b05 with SMTP id hy22-20020a1709068a7600b0078175308b05mr14279569ejc.489.1665397927517;
        Mon, 10 Oct 2022 03:32:07 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id j10-20020a17090623ea00b007838e332d78sm5108915ejg.128.2022.10.10.03.32.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 03:32:06 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 10 Oct 2022 12:32:05 +0200
Message-Id: <CNI6AL1JKZ1L.2QLO9D3KZJ2MR@otso>
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
        "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@somainline.org>,
        "linux-arm-msm" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
        "Alex Elder" <elder@linaro.org>,
        "Nicolas Dechesne" <nicolas.dechesne@linaro.org>,
        "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>,
        "Bhupesh Sharma" <bhupesh.sharma@linaro.org>,
        "Abel Vesa" <abel.vesa@linaro.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        "Robert Foss" <robert.foss@linaro.org>,
        "Srinivas Kandagatla" <srinivas.kandagatla@linaro.org>,
        "Johan Hovold" <johan+linaro@kernel.org>,
        "Vinod Koul" <vinod.koul@linaro.org>,
        "Stephan Gerhold" <stephan@gerhold.net>,
        "Caleb Connolly" <kc@postmarketos.org>
Subject: Re: Qualcomm DT bindings and DTS cleanups - tracking community wide
X-Mailer: aerc 0.12.0
References: <62e95ea6-6b72-a159-56ab-8bb11a5800c8@linaro.org>
 <faa4e821-00e0-4ee0-0c62-b5eb6f75abf7@linaro.org>
In-Reply-To: <faa4e821-00e0-4ee0-0c62-b5eb6f75abf7@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Krzysztof,

On Tue Oct 4, 2022 at 4:50 PM CEST, Krzysztof Kozlowski wrote:
> On 22/09/2022 16:32, Krzysztof Kozlowski wrote:
> > Hi everyone,
> >=20
> > Quite a lot of people are working on Qualcomm DT bindings conversion
> > (TXT->YAML) and fixups to Qualcomm DTS. We track a bit of this effort
> > internally in Linaro, but that has many shortcomings and we would like
> > to track it rather community-wide with the support and contributions
> > from the community.
> >=20
> > What to track:
> > 1. Which bindings to convert to YAML,
> > 2. Missing compatibles (either entirely or because of missing conversio=
n),
> > 3. `dt_binding_check` warnings (usually connected with 1-2),
> > 4. `dtbs_check` warnings.
> >=20
> > Rob's bot gives us daily output for 1-4, but how can we track current
> > efforts to avoid duplication of work? Also it would allow people to fin=
d
> > tasks for them to get contributions to Linux kernel :). Is anyone in
> > community interested in tracking it together, in a public way?
> >=20
> > If so, where?
> > A. elinux.org (needs some formatting when pasting the output from tools=
)
> > B. gitlab pages/wiki (maybe scripts could parse tools and create the pa=
ge?)
> > C. gitlab dedicated repo - some text file
> > D. Linux kernel TODO file (might be difficult to keep updated)
> > E. kernel.org wiki (requires LF accounts, AFAIK, a bit pain to edit; I
> > have it for Exynos but I don't find it usable -
> > https://exynos.wiki.kernel.org/todo_tasks)
>
>
> Hi All,
>
> Any thoughts on this? So far I did not receive any responses, so
> probably this could mean that there is little interest in this?

I'd also appreciate having something there. Similar to the count of
similar warnings that Rob is sometimes posting, I personally don't
see those apart from checking my boards (msm8226, msm8974, msm8953,
sm6350), where I recently did a cleanup spree for 8974 for low-hanging
fruit. Of course given that not every device uses all the functionality
some things that are disabled on my fairphone-fp2 device I won't see,
but only when checking other devices e.g. lg-hammerhead.

So some gitlab project with issues for each thing would be pretty nice I
believe. While I probably won't tackle big topics like mdss+mdp5 because
it's just very complex, I'm happy to pick up some small tasks that are
(comparatively) quick to fix.

Regards
Luca

>
> Best regards,
> Krzysztof

