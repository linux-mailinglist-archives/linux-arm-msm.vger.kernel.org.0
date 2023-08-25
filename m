Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB8D878915C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Aug 2023 00:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbjHYWA6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Aug 2023 18:00:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231236AbjHYWAn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Aug 2023 18:00:43 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69CB6C7
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 15:00:41 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-52a49a42353so2077316a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 15:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693000839; x=1693605639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhpqi3RsiTeSycikChKIyWBlkmV4boq70Ok6Dhkoa6w=;
        b=Hcex+n20KpYmrze4S7I3IT7jXAZjpWWeLKxyACv4IOBOi3lveq7d31L65l5xF4Gb/1
         cyStIYnapfrMQNuTe8mDrQE3kJP5YrrpWIkNMX6pET89RctAttmhBx2caM3WE6dUz0ru
         F+PiYnAkPQe4BNGjdpHLRuMmiE4ItC8i4LF9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693000839; x=1693605639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yhpqi3RsiTeSycikChKIyWBlkmV4boq70Ok6Dhkoa6w=;
        b=e8jHnnqy6zRJ/hODeDtuScF1tjR71z0EL39j52sjRBq6E7bE/kWkgHUZcdA+BZ9KfE
         KOqeXKBW96dQ4EG68EVXgPZXj8OsWlXyTEigBVpSl4TR/o5cNo53BTmEZJWx2wPBq5zp
         5IGU+wSp6xLIdXRmE1lIThdVmQ+099YE9NxGTNshrmvI8qy3bpLqffzKjoEUGrZqzpDs
         NxZoCjHsYa/4+SXA/2TScGdOLehl2xQVIQ3KC2JR+SF4elbEcWoSwiS7iQ4yIwrH1zJB
         f8cfry3hpCcQwMibiSR9JtYXM5r/2qFodKmOl8Kw0awpRZwkdTyJiNy/QWGJeymgwa4g
         rERQ==
X-Gm-Message-State: AOJu0YxqqA9zf7Lr1fbTRzDGMrDvYxPCQCPNwUsnwdlENIsGC3YSCaOw
        Tx/DHB3gDij+DZotIpXp1809Cj/nTYlcWa0yFJiuPg==
X-Google-Smtp-Source: AGHT+IGeVil9qMHxAo0qFWl6Z4vpLUwCzOgZTmORX+1utSdW2PfuQ3ziybueEi0Q23+DS0EK+Ghnbg==
X-Received: by 2002:aa7:cf09:0:b0:52a:1d54:2533 with SMTP id a9-20020aa7cf09000000b0052a1d542533mr8881323edy.9.1693000839281;
        Fri, 25 Aug 2023 15:00:39 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id f15-20020aa7d84f000000b0052228721f84sm1418799eds.77.2023.08.25.15.00.38
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 15:00:38 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3fe2d620d17so29115e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 15:00:38 -0700 (PDT)
X-Received: by 2002:a05:600c:1c86:b0:3fe:e9ea:9653 with SMTP id
 k6-20020a05600c1c8600b003fee9ea9653mr85660wms.4.1693000838168; Fri, 25 Aug
 2023 15:00:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230811-topic-7280_lmhirq-v1-1-c262b6a25c8f@linaro.org>
 <CAD=FV=XKeE7_ciuvfAic+24kyOF0yaFT7iCJWgN9NaW-zG+vKA@mail.gmail.com> <d413843f-5187-41ee-89aa-1f4dc0bc729d@linaro.org>
In-Reply-To: <d413843f-5187-41ee-89aa-1f4dc0bc729d@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 25 Aug 2023 15:00:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wh1xSz8MOt-GY7w_ha3shNpAnGOwXdrqJE17oJB+cG4Q@mail.gmail.com>
Message-ID: <CAD=FV=Wh1xSz8MOt-GY7w_ha3shNpAnGOwXdrqJE17oJB+cG4Q@mail.gmail.com>
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

On Fri, Aug 25, 2023 at 2:07=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> > I put the same kernel on a trogdor device and that did normal Linux
> > throttling OK. So something is definitely wonky with sc7280... I dug
> > enough to find that if I used "step_wise" instead of "power_allocator"
> > that it works OK, so I guess something is wonky about the config of
> > power_allocator on sc7280. In any case, it's not affected by your
> > patch and I've already probably spent too much time on it. :-P
> Hm, perhaps it would be worth to try this patch on a non-chrome 7280
> device.. Would you guys have standard android-y or windows-y firmware
> that you could flash on these to try out, or should I try poking
> somebody else?

I don't have hardware that runs anything other than the standard
ChromeOS bootloader, sorry!

-Doug
