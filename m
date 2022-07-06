Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE3C15681DE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 10:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232391AbiGFIim (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 04:38:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbiGFIil (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 04:38:41 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF26E220E2
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 01:38:40 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id i11so17273714qtr.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 01:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yZeWRbdm0aBOlWn7qVDcIEht0ORnbpskXapDRiYU5KI=;
        b=sF9zkTyHKlIwaf0tUZ8m6fmbf7MRLsWb3B83eSFiM1OC1xWlMY86LPQ4f0S3UBvcav
         Om4abZFgJPV52U7m0RP8umwDeO3QRpJ1Zl8rO8JCrbfKBBTCAq0ZXQf3jUpw+SW25TDl
         gcoF++uBthZ2802zF8MoOuP1172HYClBYLCajSFR53TILLK+wchCqtbn3tIFvSXykKDJ
         lQdoq4Xq7ClIifV8c6B4bcPkzGvBDMKkr26QMB6QUefow75yqzVLrrZahIV5D591okEI
         BoIIdzzSr2W8wIhwy7LapRRojihCCoukM79C7ihGQwHdh+MBLe9sPQQLkVvNSVAwfN4J
         OXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yZeWRbdm0aBOlWn7qVDcIEht0ORnbpskXapDRiYU5KI=;
        b=7v6Stn93bop1kpNGTLBTuvVmCWk9q7kmlCvZOkt/M8h+30dTE0f8BpqUws8cs6ICiP
         ++F0OcsghBGhfkz/+NELe6UcjgiYzZd8U3Gjy9KD4AmjXTsHQS2aZxEnVXZEtS0/7mam
         A2wlv+6jcJCHmWWZtUgUJW9UDOb/tMWRqZTgOt+idRY0rXTHpNolYw3S//hyro0v4hIk
         B/o8mI+87suL/9iwSXNbbqHKshZa3wvT/Enfsk6ATtj+k8Nc3SpMBG82rOGLzQFixuux
         HNaxxFKFait6YrfwM/7G+MyR/T6O418YvR9U+Wt6lrcyu2GeauK2CgIQEW3XJMukDGnK
         gpOA==
X-Gm-Message-State: AJIora9GCTx+S97yejq8I24+4N6OEz9KsNKWKYtpbyGq7fcX8wRXXrRY
        BS6ZBVBPLAFQGg6BCDYLYHZIMhWqQADyTe53yqRM5g==
X-Google-Smtp-Source: AGRyM1vKYydaCock1NFLZ/7/PKkuQyy6x2aKKCvVpvDXdjr6st9YjndlqGt79e2nEpR2XHqbEhAA8YUPKoArXq2RLxM=
X-Received: by 2002:ac8:5956:0:b0:31d:28dc:17c with SMTP id
 22-20020ac85956000000b0031d28dc017cmr29824698qtz.295.1657096719864; Wed, 06
 Jul 2022 01:38:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220705191327.1684277-1-robimarko@gmail.com>
In-Reply-To: <20220705191327.1684277-1-robimarko@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 6 Jul 2022 11:38:29 +0300
Message-ID: <CAA8EJprNqeXPPMPZYDEcutjVraHCe=boFO0HTs_26ti_txQ8TA@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] mailbox: qcom-apcs-ipc: add IPQ8074 APSS clock
 controller support
To:     Robert Marko <robimarko@gmail.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, jassisinghbrar@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 5 Jul 2022 at 22:13, Robert Marko <robimarko@gmail.com> wrote:
>
> IPQ8074 has the APSS clock controller utilizing the same register space as
> the APCS, so provide access to the APSS utilizing a child device like
> IPQ6018 does as well, but just by utilizing the IPQ8074 specific APSS
> clock driver.
>
> Also, APCS register space in IPQ8074 is 0x6000 so max_register needs to be
> updated to 0x5ffc.

As you can see, this was changed to support SDX55. Please either make
this configurable, or leave it as it is.

>
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
> Changes in v5:
> * Use lower case hex for max_register
> * Update the APSS clock name to match the new one without commas
> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>

-- 
With best wishes
Dmitry
