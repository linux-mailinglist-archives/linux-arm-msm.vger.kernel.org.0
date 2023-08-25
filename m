Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A667788FB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Aug 2023 22:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbjHYUSB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Aug 2023 16:18:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231187AbjHYUR4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Aug 2023 16:17:56 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CBAC10EF
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 13:17:54 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9936b3d0286so170836066b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 13:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692994672; x=1693599472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4MG4Y7KTbIUQEo4oi1409RKv9+4SxTW98bg1s1cKPw=;
        b=GrWpKq5qCWAOl/qCljbumGTWm18CTyDkFE4buGF28JEPf0EZ0jJYaMAXKEiLEAfBOC
         RA/iWnBdbzq5isvY3WVl02D6l8eqg0C3mh3jA9PJju5HZIa0Hi/raZoviuzkE44aDI02
         YLbwz1qATI+NWtedTySF44E9AijpItQHAMWy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692994672; x=1693599472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E4MG4Y7KTbIUQEo4oi1409RKv9+4SxTW98bg1s1cKPw=;
        b=AAVUQYqSS7oQSV0tVgGOXJ+I1FWDECQ0fVX5ln+jcK7oHUvVVzNXvlQoksV9wguvqb
         E8So/aX98QFidNeu7K7Zns8AK0Sx0H84IInCBW4+E33fYHyX2IM95i2EBp4BmG1MWAXz
         ZzLmxaTsZvJ6DShL64o4LzpanduGv819ahiPPC4UI8TDcgkVPPb+wMiyGz2Ly9fnGifS
         e5wDdG2xbMAX92CePiakVtOyaMRZ7pKvF7ofN+e54bG21BY7TPyOG0EF6N3Ifxy0G53f
         XdnUP02SCWgMwyAipFyzHhQ0C3z86zrHpIjaUao6xARxPw0yELz9cqKHO6j/W/aoNmi/
         sTYA==
X-Gm-Message-State: AOJu0YwygiF1KmgSII8ydHKQPgWAMD3ach+YXTR13H5P8TiT7slmm6Bf
        gb4nNYseJSZd2m8Rnp/A9cz9WqCMhqQyDrmes42qijdz
X-Google-Smtp-Source: AGHT+IFYTlhir2bA8PcaO+hoxjibaH7q2BDsiCkZIZwlNV9fTvOWXyi1nNgowNbTQdOu3+H1LZszqQ==
X-Received: by 2002:a17:906:cc18:b0:99b:f58d:1c49 with SMTP id ml24-20020a170906cc1800b0099bf58d1c49mr16110373ejb.53.1692994671950;
        Fri, 25 Aug 2023 13:17:51 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id q22-20020a170906361600b00982cfe1fe5dsm1284471ejb.65.2023.08.25.13.17.51
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 13:17:51 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4009fdc224dso4325e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 13:17:51 -0700 (PDT)
X-Received: by 2002:a05:600c:3b8f:b0:400:46db:1bf2 with SMTP id
 n15-20020a05600c3b8f00b0040046db1bf2mr67016wms.2.1692994670872; Fri, 25 Aug
 2023 13:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230811-topic-7280_lmhirq-v1-1-c262b6a25c8f@linaro.org>
In-Reply-To: <20230811-topic-7280_lmhirq-v1-1-c262b6a25c8f@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 25 Aug 2023 13:17:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XKeE7_ciuvfAic+24kyOF0yaFT7iCJWgN9NaW-zG+vKA@mail.gmail.com>
Message-ID: <CAD=FV=XKeE7_ciuvfAic+24kyOF0yaFT7iCJWgN9NaW-zG+vKA@mail.gmail.com>
Subject: Re: [PATCH RFT] arm64: dts: qcom: sc7280: Add missing LMH interrupts
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Aug 11, 2023 at 1:58=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> Hook up the interrupts that signal the Limits Management Hardware has
> started some sort of throttling action.
>
> Fixes: 7dbd121a2c58 ("arm64: dts: qcom: sc7280: Add cpufreq hw node")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> test case:
>
> - hammer the CPUs (like compile the Linux kernel)
> - watch -n1 "cat /proc/interrupts | grep dcvsh"
> - the numbers go up up up up -> good

I'm not doing much on sc7280 these days, but I did try putting your
patch on a sc7280-hoglin (AKA a CRD). I tried to stress the system out
a bunch (ran 8 instances of "while true; do true; done" and opened
something to activate the GPU). I didn't see any LMH interrupts fire.
Of course, with ChromeOS firmware LMH is _supposed_ to be mostly
disabled, so maybe that's right? Our policy was always to have Linux
do as much of the throttling as possible and only use LMH as a last
resort.

I assume I don't need any specific config option turned on?

I know that on other Qualcomm boards I see LMH nodes in the device
tree, which we don't have in sc7280. Like "qcom,sdm845-lmh". Is that
important? I haven't been following what's been going on with LMH in
Linux since we try not to use it.

For giggles, I also tried putting the patch on a sc7280-villager
device to see if it had different thermals. I even put my jacket over
it to try to keep it warm. I saw the sensors go up to 109C on the
medium cores and still no LMH interrupts. Oh, and then the device shut
itself down. I guess something about thermal throttling in Linux must
be disabled but then it still handles the critical state? :( That's
concerning...

I put the same kernel on a trogdor device and that did normal Linux
throttling OK. So something is definitely wonky with sc7280... I dug
enough to find that if I used "step_wise" instead of "power_allocator"
that it works OK, so I guess something is wonky about the config of
power_allocator on sc7280. In any case, it's not affected by your
patch and I've already probably spent too much time on it. :-P

-Doug
