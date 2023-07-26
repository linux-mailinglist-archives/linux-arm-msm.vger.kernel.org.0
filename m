Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEA6376415F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jul 2023 23:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbjGZVpu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jul 2023 17:45:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbjGZVpt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jul 2023 17:45:49 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 666C7FA
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 14:45:48 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fdd14c1fbfso458552e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 14:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690407946; x=1691012746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOSkc7sf6NMjkqcB2/E++RRa34t+M2+WHnNy72dRWQY=;
        b=mgWgtL0xmtNDB+J+vMgUJf5u9tvYOF08gLPAonehNflomYYSV2EUj45C9cOAGvzSxa
         +CUWkuc3o/LnEtOJTE8Ua46LP+4febaMKuAY127YxK4MhBKzvkFIIeQVzG5ai9guspN8
         1/s+AOOWvWpCDcEmCnH03GXqXE/ZF3hHK4/r2ROM+cpRXaENp6FsjwFrEqcIiRSrVhz6
         qgsBDCpkyELZmYjVQxkwBtlCiLTLqHXaSJyN8uXxOpnytLACmebK6egMJm7GHHDrau4r
         6ou+qp75LYRe2817o84xNAnj4A+lJg2frkfySKUhWZyARG2KVYK1452y5zUAJRx1wpPy
         zx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690407946; x=1691012746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOSkc7sf6NMjkqcB2/E++RRa34t+M2+WHnNy72dRWQY=;
        b=k3CsFJ7kSo5Qr1ZR613IYnKxZELVTnHvLXY0i8+MdyRgCV/OZbu9qC/DSfy78/Oy8j
         Fb9ueeynXqs3W5XRUEDOO1uJ8TH7sCG3YhPgEb51Fjyo3iWRKEyED3sYcYROmYL5+J95
         pWRfr1cLQ4VWIabs/NE68u85XJGqsSI70SpZ3tk0tg2nT3OqlBSj/qeyiLJ0hZYJgPTJ
         GSnDet/srxoRFE+7+qjC7C2rXEQXEWR3VXBBVm4+caYrW1BOJf9QZVF8bOUnuyt86cMZ
         nRrrwImkG7wMvUlz/diujmcCpguzG3qmBp49RtYxVDuXInLFtunkP7sjrxxvN7ZBK/5o
         arkg==
X-Gm-Message-State: ABy/qLbPASjzRBk5KywUHZfzmU95JaLpq7iV/iwvH+lcYpeQ9bzZQYd3
        BJQ/eajrZgjt9TYm9APZh2vpkB5hjIjzxRWgh4wIQ5pm
X-Google-Smtp-Source: APBJJlF9n+ERxsadCb4oNiJT5O6j6RrHVakhn2ecE9c96MDYfp6hWkC5dhgQ/HxS1m8dcpqX4zwmC5xB4jPktAe63Kw=
X-Received: by 2002:a05:6512:39cb:b0:4fb:97e8:ed8c with SMTP id
 k11-20020a05651239cb00b004fb97e8ed8cmr266635lfu.4.1690407946347; Wed, 26 Jul
 2023 14:45:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230706211045.204925-1-robdclark@gmail.com> <20230706211045.204925-13-robdclark@gmail.com>
 <4cdceddb-033a-6301-163e-89d27152e242@linaro.org> <CAF6AEGvtMRnWBQz_KOi5b1p40HjvAAHYdd64kiR3KsKWPBO+bg@mail.gmail.com>
 <0e805cae-d311-2b8c-cead-62621288a34f@linaro.org>
In-Reply-To: <0e805cae-d311-2b8c-cead-62621288a34f@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 26 Jul 2023 14:45:34 -0700
Message-ID: <CAF6AEGvC-rSRo7Z33+pz9SCRTWpvq2U-StWq+Afe44T4CJwr6g@mail.gmail.com>
Subject: Re: [PATCH 12/12] drm/msm/adreno: Switch to chip-id for identifying GPU
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jul 15, 2023 at 6:38=E2=80=AFAM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> On 7.07.2023 18:08, Rob Clark wrote:
> > On Thu, Jul 6, 2023 at 5:25=E2=80=AFPM Konrad Dybcio <konrad.dybcio@lin=
aro.org> wrote:
> >>
> >> Apart from all these comments, I don't really see the point of this pa=
tch,
> >> other than trying to tie together Qualcomm's almost-meaningless chipid=
s on
> >> a7xx into the picture..
> >>
> >> Since they can't even be read back from the hardware, I don't think tr=
ying
> >> to force them into the upstream kernel makes any sense.
> >
> > Sure, we _could_ pick our own arbitrary identifiers, we don't have to
> > align with kgsl.  But that would be a super huge PITA for mesa, which
> > has support for both kernels.
> Perhaps I'm biased towards keeping this kind of stuff out of the kernel,
> but I'd say that Linux should decide on one logical path.
>
> In between us starting this discussion, Qualcomm managed to introduce
> yet another way of deciding what GPU is present on the system in their
> downstream driver[1]. We're at like 5 now. Do we wanna keep up each time?
> New ID rework for A8xx when that comes out one day?

[snip]

> [1] they now read parts of socinfo from smem and decide the CHIPID and
>     speedbin based on that, but it's not available on most existing SoCs,
>     that was thrown in with SOCID v17

This is actually exactly what we want.. something that we can read
from hw/fw and that blob userspace also uses (so we don't have to
worry about qc forgetting to change the id, etc)

BR,
-R
