Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69DEA281E41
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Oct 2020 00:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725764AbgJBWYr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Oct 2020 18:24:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725550AbgJBWYr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Oct 2020 18:24:47 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE2F6C0613E2
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2020 15:24:46 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id n7so585965vkq.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2020 15:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Is9HMQBaKKpXSbhbkh1D21fxGJNsnpUrasuh/KfwOMs=;
        b=LrkwPd555VbQlCZQ4xerSYMa0Gu7RuBh/yiOpWcQkbL6/qFkXomFafvaB+/MIVXo56
         UBGC2w9Y3SA86our4/801mlePd7aZjptVYZ+lOa/4nPJgC584tBwqYnAiKaDqGMjAjZ1
         Xy4f19llRVO3lAHvjLjmxxgQxtl1Chl4/sZRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Is9HMQBaKKpXSbhbkh1D21fxGJNsnpUrasuh/KfwOMs=;
        b=jyoaqnuvNDn63CkFnv7AoL2lu/20rGUHC5nrI2qoMndxTSakjdl/p3wPy/IDIS2rW0
         74rtmufG10apOY8WUBhfWdHV1CxF9boKECpZ11H4vTfSv1zlZi0T1PRepNk/LGK/fD1w
         RtNHSJk/4+HTRuMW1Qad/9jNn464B6JejbtfDluv2qI2InEl7y8mu3DiY7hMLpQcLhKX
         jEZW8/fBdD1SZ7Du+QEUlJtlvPvC+9HmfTZH8ACKqgzgUawRZvLcSsHk/BjHRL09siAv
         ahoWzBTcLHZrm0LQZgfeV8YS4NXTZg2iBuXtMVAeMbvnKg5zDXQ7bPiWzSsUYaM8Bl4n
         Q3dw==
X-Gm-Message-State: AOAM530o8UJGTQ+n6sdsDnmbQ3svR8VY9GnGX42Ie09USKVU9SssGc07
        do3Yku31prjbs9r7wkyOLxJ6Hh6QS72tHg==
X-Google-Smtp-Source: ABdhPJyzJofSwcI21PYqBDWmixWSQI7IqRnzKwiAII0bv7BkkZaGiaDice7+PQVz331ocsdGBX/W+Q==
X-Received: by 2002:ac5:cd88:: with SMTP id i8mr2760676vka.4.1601677485847;
        Fri, 02 Oct 2020 15:24:45 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id e21sm421733uam.16.2020.10.02.15.24.45
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 15:24:45 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id f15so788398uaq.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2020 15:24:45 -0700 (PDT)
X-Received: by 2002:ab0:4542:: with SMTP id r60mr2618461uar.90.1601677484614;
 Fri, 02 Oct 2020 15:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200929205807.2360405-1-evgreen@chromium.org> <20200929135741.2.Ia3b68ac843df93c692627a3a92b947b3a5785863@changeid>
In-Reply-To: <20200929135741.2.Ia3b68ac843df93c692627a3a92b947b3a5785863@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 2 Oct 2020 15:24:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XDYS_QdwM-O_m0Pw6efkbTX+6UZSjqhjuJ8xDwMpZy6A@mail.gmail.com>
Message-ID: <CAD=FV=XDYS_QdwM-O_m0Pw6efkbTX+6UZSjqhjuJ8xDwMpZy6A@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sc7180: Add soc-specific qfprom
 compat string
To:     Evan Green <evgreen@chromium.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Sep 29, 2020 at 1:58 PM Evan Green <evgreen@chromium.org> wrote:
>
> Add the soc-specific compatible string so that it can be matched
> more specifically now that the driver cares which SoC it's on.
>
> Signed-off-by: Evan Green <evgreen@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
