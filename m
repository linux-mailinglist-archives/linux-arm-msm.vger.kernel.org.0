Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F1B77307B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 21:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbjFNTDY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 15:03:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbjFNTDX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 15:03:23 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68CCD1FC7
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 12:03:22 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-62dee8362b8so19023216d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 12:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686769401; x=1689361401;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5KxR5s+1q8F9IZW4HFC1+utbLHDsLoQkCQDVt50jepE=;
        b=jU14Y6Jo5XBK9x3Zp3uMHjLrpHlkpyPdyVDZ2p/7aFP5Qa+KrZHvkLVTWvulgsp0Ud
         NpuY9Lgx+4wCzXvHRQ5wh6VoI+tzaSiIW6l2WoukZFN+BlpkzuYwLN1sQz6t1UwWcG1T
         XE9grfTnRN/O7B55LpjlD8NsUQJhdT4kjbTT9jCGpu4I8nJ8sMvbBt/8HiJUXQyoGKHt
         6y8PABOPUX7E16PFmRPieOEt7VOjA2XiIxD6fO/vnA3OyyVBkNvrQ80ML2Jl1s0dmXfP
         Ppwl2t76GJnZ9pFGOPyLDxFq6ZFN25Sf/G3rLYw2l5P8hTNEUlmbPwavJy/Ukb9YahY3
         khow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686769401; x=1689361401;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5KxR5s+1q8F9IZW4HFC1+utbLHDsLoQkCQDVt50jepE=;
        b=Ptyr05t2OVIL2kROPant6Q+WRd23j2RvN3KYyX6GZt8vvhoLgldXnGhz5+wa8c8M5V
         SrWdjRWi9yTr7lvZUWuwf9Sx8BvWnqNI/RephPwibRGsyyyRTarHLafTH6+WXP+eudIE
         KoLOQd6enDAHko7I7xWxHxM78zdRRodiLk3tOr/YFazbhblBrnlISCUg0BOXgBB9g2Gn
         zrjN0ssleEZLln8U04ELU1iLoQe/54Oy0taiynidkR3kNZz7vxjtuAwqm38Y4zg/0qVp
         JxvwJ/tLCkNQTMVVjNg+bjG7plM5TsJdjrV2djlCgwvgmBQUyvZVV3aJuVcNEO+Dbag0
         Ch1w==
X-Gm-Message-State: AC+VfDyujeZRTFoFOLBE2rT0T3PhJ/lMO2nBQh82Faz0OK35PHjNjwJv
        XpDwRiYKOg4C6RzYu9VnfH6oxv0DCPMbAHa9zKFoXw==
X-Google-Smtp-Source: ACHHUZ5JAhpNNg/DP1KXT/cJBUBpoH3nzGXm5nBrZHQB3OXKa+lcvMH9FDvBegx91mtTRmVpMFshm+RDxZ2C8IcYakU=
X-Received: by 2002:a05:6214:f24:b0:62d:fe50:1a79 with SMTP id
 iw4-20020a0562140f2400b0062dfe501a79mr5185509qvb.45.1686769401311; Wed, 14
 Jun 2023 12:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230324063357.1.Ifdf3625a3c5c9467bd87bfcdf726c884ad220a35@changeid>
 <CAMi1Hd1avQDcDQf137m2auz2znov4XL8YGrLZsw5edb-NtRJRw@mail.gmail.com>
 <552345c5-b1e9-41f6-f275-b6eeeb51df25@linaro.org> <CAMi1Hd05z8uBotO4vs7Ropmt7W2gSA__tTu_=X1t0mze7bXrhg@mail.gmail.com>
 <CAD=FV=VSFDe445WEVTHXxU1WS_HGUV5jR5E8_Vgd4eyhn3rHyA@mail.gmail.com>
 <CAMi1Hd28FJUjB8A-9YF7xpKOzSyNWXX3qung4aDjpLBhOvw_eA@mail.gmail.com>
 <CAD=FV=W13L0H88G1gt8qRnXfpV-_7E9QfHufN_a23_B1bb=aww@mail.gmail.com>
 <CAMi1Hd1WCtNvNaY_kVMx5F8T0nMVHvsjk9LsSETCMWWQyaq_Vw@mail.gmail.com>
 <CAD=FV=W5Y_SHp0y2MEs8d1k255bm_PXdRYEmYei+g79pjnzYuA@mail.gmail.com>
 <CAMi1Hd2OeL940r7jq0=Z_oxE8MYVioy0YnJXQC_5e0vJONd2sQ@mail.gmail.com>
 <1bc79c48-7cba-476d-9a7e-5754a88fcdae@sirena.org.uk> <CAMi1Hd2BLB6H3QRLB5svRTkGoXaUeEsakNsmfCOjbDBcCEeqkA@mail.gmail.com>
 <CAD=FV=UKyjRNZG-ED2meUAR9aXdco+AbUTHiKixTzjCkaJbjTg@mail.gmail.com>
In-Reply-To: <CAD=FV=UKyjRNZG-ED2meUAR9aXdco+AbUTHiKixTzjCkaJbjTg@mail.gmail.com>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Thu, 15 Jun 2023 00:32:45 +0530
Message-ID: <CAMi1Hd12S+bKyp=CHwoioYoojtFzaA1tey19BqAFi+4DeJR__w@mail.gmail.com>
Subject: Re: [PATCH] regulator: qcom-rpmh: Revert "regulator: qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS"
To:     Doug Anderson <dianders@chromium.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, 7 Jun 2023 at 04:59, Doug Anderson <dianders@chromium.org> wrote:
>
> From a black box perspective, I guess the things I could think of
> would be to keep poking around with things that you control. Best
> ideas I have:
>
> 1. Use "bisect" style techniques to figure out how much you really
> need to move the "lvs" regulators. Try moving it halfway up the list.
> If that works, move it closer to the bottom. If that doesn't work,
> move it closer to the top. Eventually you'd find out which regulator
> it's important to be before.

Hi, I tried this bisect style technique to move lvs regulators up in
the list gradually and I found that they need to be enabled atleast
before ldo12 and the ldo regulators which follow the ldo12 in the
list.

>
> 2. Try adding some delays to some of the regulators with
> "regulator-enable-ramp-delay" and/or "regulator-settling-time-us".
> Without a scope, it'll be tricky to figure out exactly which
> regulators might need delays, but you could at least confirm if the
> "overkill" approach of having all the regulators have some delay
> helps... I guess you could also try putting a big delay for "ldo26".
> If that works, you could try moving it up (again using a bisect style
> approach) to see where the delay matters?

I tried this approach as well earlier today but I don't know how big
"the big" delay can be. The device fails to boot if I add a settling
time of as much as 2sec per each ldo and lvs regulator too. I didn't
try increasing the delay further.

Regards,
Amit Pundir
