Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8C85F63C8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 11:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231221AbiJFJoX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 05:44:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230469AbiJFJoW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 05:44:22 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCEF88E0DC
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 02:44:21 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id c9so1589908ybf.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 02:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7BWHpYbPBZcnPFvYe589pBj9X79YNxD/NcOHx4kv/CM=;
        b=Febm/wWbExJdGGqNRevOwHUbMJEHOmIOkiZi0p1XaczbTI+iMBgT8HDzbEMgDYA1Fo
         zSZNhg7nI7iUSot4leNXZAy/KtsaoNOFtKiREXQmQnQONNxP7H49nP1o4Em5Nla3XBWO
         l9KWTMSmf+hirrJ8VqdT+uzyXoom0aZHnPIJoNBCuXjS+omkYFayvrAp1fDOpXtpCIGP
         iAh3ng2NIZ2Hx+htf6G0Xwz+fHe0a6ujAYXlfzjW24kJcv88V86PEyZsFoQEYc8SjJbl
         dysLpUJH/K7D/wY2nCv+0lZmJ5hveKNGbZiOAFR2h+01xf3oR7ygyFzYXfnnRtM6V0ch
         bQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7BWHpYbPBZcnPFvYe589pBj9X79YNxD/NcOHx4kv/CM=;
        b=kb4mOquGVvLpyXT8Y6Oyu/R/Vr1uH4CYzOPFXPXOX9A1lCSgOHmQaZ+9vsJbPxU4+r
         bM3Tcmt5LAPlKgumeFbbpykt7mFuhWD2fD+lJ3vLr/Rq5depmhSeyoLM+7gk9OtIhIUi
         jXw9ch1h1JR5adbuJ3vg72jGEB0KaIFktYb/aTgOTDr5qRH4WscwhtM6qcZya/uWMx4t
         nL7zjDLhypaFK3K/6LGTArPICOGsqmCobvnGFp4OmTidK0mWUeQ+3gvJjO4oaT6sVmGJ
         SE+OzrHW641wmmHYAvAoHPNFlT8gebly4naNwO2WqsTp4vwZVSv5BaOxzkkko6G8xVaf
         k5/A==
X-Gm-Message-State: ACrzQf3Ic0mISefs4CNtHe6jQHcw0Vf8fXbGODYpSobWyxPSXywDdqEn
        fXdUUqTZpBAVzun5BLFNxb36UXEp5VXBbEfn6xv0aQ==
X-Google-Smtp-Source: AMsMyM4XAM6T1VkzgchnRzF+y7euTnGNArNyFZnxnrdgYHkjkA7PISBPP+l3YJkllhMEg4Rgw87TKRw1lJC1hsnUVEg=
X-Received: by 2002:a25:3443:0:b0:6be:e1ef:4f73 with SMTP id
 b64-20020a253443000000b006bee1ef4f73mr273872yba.516.1665049460997; Thu, 06
 Oct 2022 02:44:20 -0700 (PDT)
MIME-Version: 1.0
References: <62e95ea6-6b72-a159-56ab-8bb11a5800c8@linaro.org> <Yz6P8wOPdRd9sjX2@hovoldconsulting.com>
In-Reply-To: <Yz6P8wOPdRd9sjX2@hovoldconsulting.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 6 Oct 2022 12:44:09 +0300
Message-ID: <CAA8EJpqY41KSPp9-X0_+x+SnoWqvKxfV_tzgnu7HiA80Lbd5HQ@mail.gmail.com>
Subject: Re: Qualcomm DT bindings and DTS cleanups - tracking community wide
To:     Johan Hovold <johan@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Alex Elder <elder@linaro.org>,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Vinod Koul <vinod.koul@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Caleb Connolly <kc@postmarketos.org>
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

Hi,

On Thu, 6 Oct 2022 at 11:21, Johan Hovold <johan@kernel.org> wrote:
>
> On Thu, Sep 22, 2022 at 04:32:00PM +0200, Krzysztof Kozlowski wrote:
> > Hi everyone,
> >
> > Quite a lot of people are working on Qualcomm DT bindings conversion
> > (TXT->YAML) and fixups to Qualcomm DTS. We track a bit of this effort
> > internally in Linaro, but that has many shortcomings and we would like
> > to track it rather community-wide with the support and contributions
> > from the community.
> >
> > What to track:
> > 1. Which bindings to convert to YAML,
> > 2. Missing compatibles (either entirely or because of missing conversion),
> > 3. `dt_binding_check` warnings (usually connected with 1-2),
> > 4. `dtbs_check` warnings.
> >
> > Rob's bot gives us daily output for 1-4, but how can we track current
> > efforts to avoid duplication of work? Also it would allow people to find
> > tasks for them to get contributions to Linux kernel :). Is anyone in
> > community interested in tracking it together, in a public way?
>
> Is this a real problem that needs fixing? I mean how often does it
> happen that people submit the same YAML conversion for example? Since it
> doesn't take that long to do a conversion, I'm not sure what tracking
> this on some webpage buys us. It's better to just search lore before
> starting a new conversion. Or search the linux-next tree to see what's
> still pending.

As Krzysztof wrote, fixing a warning/adding a new platform is usually
not a big deal. However converting old txt bindings usually results in
a significant amount of work. Fixing YAML and dtsi at the same time
can take a long time, especially for obscure cases like apq8084 or old
ipq boards.

>
> Similarly for the other points above, as it doesn't take very long to
> add a missing compatible or fix a warning it seems a bit excessive to
> try to track this manually.
>
> Perhaps a list of pending conversions or missing compatibles could be
> useful for someone who's short on work, but it's bound to get outdated
> pretty quickly.

I'd suggest having a list of `qcom-legacy' tasks: outdated DT bindings
(both txt and yaml), drivers using system clock list (rather than DT
bindings). DT files pending conversion to labels. msm8974 interconnect
driver. hsuart aliases. You name it. This can be as simple as several
gitlab issues, one per each topic.
At the very least this would allow us to assess legacy bits and pieces.

Note: for me this is close to another topic that was discussed several
times, but for which we never reached a conclusion. A matrix of
supported per-SoC features.

>
> > If so, where?
> > A. elinux.org (needs some formatting when pasting the output from tools)
> > B. gitlab pages/wiki (maybe scripts could parse tools and create the page?)
> > C. gitlab dedicated repo - some text file
> > D. Linux kernel TODO file (might be difficult to keep updated)
> > E. kernel.org wiki (requires LF accounts, AFAIK, a bit pain to edit; I
> > have it for Exynos but I don't find it usable -
> > https://exynos.wiki.kernel.org/todo_tasks)
> >
> > I am leaning towards Gitlab pages because they could be quite automated
> > - with CI or with scripts.
> >
> > The point would be to list all of tasks (1-4 from the first list), keep
> > it updated with new results, pick/assign tasks and mark as done.
>
> I don't really see the need for more process here, sorry.
>
> If I'm working on support for a new platform and the DT checker warnings
> gets too noisy I may pick some of the low hanging fruit. In the odd
> chance that someone beats me to it, it's not the end of the world.

I hope that we can finally land patches to support per-file check.
Then fixing warnings for a new platform would be very easy. Even today
you can run `make something.dtb CHECK_DTBS=y` and get all your
warnings (if the processed schema is up to date). However Krzysztof's
point is about old platforms, rather than new ones.


-- 
With best wishes
Dmitry
