Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B9EA4E6AC9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Mar 2022 23:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355456AbiCXWlt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Mar 2022 18:41:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354422AbiCXWls (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Mar 2022 18:41:48 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACC04ADD68
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Mar 2022 15:40:15 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id t11so11021358ybi.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Mar 2022 15:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iiJcqfdkW8tVnyyJIJqmnqBzR0yFbfLpnmQsM64Y+cg=;
        b=wp4pAKae7bpigZHEaVAkKvlRVHXiX1Fm0lyuNqoHxbHRaCZL8vie+chEpU/oQPaVeG
         OVGCDSxIUOk2nuu9vcZ42gP0GdrmBV6hdomBnJPzkfITKq3PwpZxHPdG5jKqLOeyCGD0
         co2v/Fj9Sguys8kZ9AaKpjE3fsUpVpPgMby5/oS5T3QHUwrkf/mdNC+SddPQ1hWWBM7j
         V17N3hl8epFYRupoe4LtbbCwQ+q6XQgQDbLUzSJxtDKabfhjSG/YQGMPgHViJ9Wa0FJv
         P1nJLy+OcK3wa/iimPPZBeVkMGHbqi0K9J64TAM/Y6I3tghci9e/gXrqkHa9yLkfgm0a
         HCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iiJcqfdkW8tVnyyJIJqmnqBzR0yFbfLpnmQsM64Y+cg=;
        b=dcDmPW5YaI7pHtk3CaGu9OQ3TNWrOsGo4zeRQzpvK4suWVmm1+zrOzmp7GNlXdZntU
         TBat+mkmP09/lE0sT2LoXt9i3MiLXXeNI3Sf1lgYySr8TJMCKeOZLgB4lhLhZlHkPP/x
         9KS9HVsu343RnRYlOVT3wC5/FeTdELcvQPWgPrMftfmk+spaudrXBUvXsXvVrxhfX9Gs
         Q38dMnUKQquHRz82b9Jd7EAC1KbAyFPvmUhaBipFI6jHKsyd9JSFvqRfSqGOrAecn9Vq
         ulMZXzjloARkNTmdYJLhcT45J5nBYW4aNXocMLv7G1Uhrf2qgnD1F7S0Uy1TdRa46zwU
         2AFw==
X-Gm-Message-State: AOAM531SxZlWnK++vC4VeuKuv0TLYb75I9lqzELZ+a3SlkiTpsFYlrAj
        yWBuT1yDBIplouJj3Ehg0eWGf1DsBJbLO8ClQNvolQ==
X-Google-Smtp-Source: ABdhPJxMjNwxF5qivv5pR7igILgcbl1mvt24ax92h0BTQoZhDojKhfGKfvN/ROf52gxAyRswV3poNPDpP42Z6wybnkw=
X-Received: by 2002:a25:d088:0:b0:633:b902:2d29 with SMTP id
 h130-20020a25d088000000b00633b9022d29mr6865519ybg.626.1648161615005; Thu, 24
 Mar 2022 15:40:15 -0700 (PDT)
MIME-Version: 1.0
References: <1647410837-22537-1-git-send-email-quic_rohiagar@quicinc.com> <1647410837-22537-6-git-send-email-quic_rohiagar@quicinc.com>
In-Reply-To: <1647410837-22537-6-git-send-email-quic_rohiagar@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 24 Mar 2022 23:40:03 +0100
Message-ID: <CACRpkdaSGHno4pfnhi_rKeHWyOOCGDnku+jhyLHGrSfHr06m7g@mail.gmail.com>
Subject: Re: [PATCH 5/6] dt-bindings: pinctrl: qcom-pmic-gpio: Add pmx65 support
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org, rnayak@codeaurora.org,
        collinsd@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
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

On Wed, Mar 16, 2022 at 7:07 AM Rohit Agarwal <quic_rohiagar@quicinc.com> wrote:

> Add support for the PMX65 GPIO support to the Qualcomm PMIC GPIO
> binding.
>
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>

After the merge window can you resend this binding and the pinctrl
patch separately so I can merge them to the pinctrl tree?

Yours,
Linus Walleij
