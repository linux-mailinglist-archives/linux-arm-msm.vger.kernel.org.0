Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABD231FAC42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2020 11:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728199AbgFPJWV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jun 2020 05:22:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728014AbgFPJWQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jun 2020 05:22:16 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A0C9C03E96A
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2020 02:22:15 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id r9so6675547ual.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2020 02:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5DT2283QGSeLmNfRYosxvl4RnLSyjJEL1/ZqFVdUOJQ=;
        b=gbiR7iJELkxNmdiFG9i0jMjxFEi2lb7SY5/bBgrWh11d1mz9Ty/etYm5giSxwegNQs
         MRha2ZX2nS+57DDDxKnsIeqIUAysnFBvEJ9g2NrznEp48uFKw6y317kN/4oI2nbvfoYP
         MtpvaX3EAU4PXUqz5tyr3CCTvZwrAorztgU7Ynwe/RHsDvnAMl27sI4cq70yGcCN6VLD
         W1huILgMFI7IjGXsotocJGfn09BwBxuS8F7ihs1sLR4Jo7297v0roOgWxgcXMUY9tD6U
         qgq0K68V23qnMt+3xvffDoPhJ3oXeEXabuKD5+bEV8SusiKKV0nZK4zXGiCgy5ggNkoE
         Ozew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5DT2283QGSeLmNfRYosxvl4RnLSyjJEL1/ZqFVdUOJQ=;
        b=YnqsTkiNWCKF2M0PaWdkbrHceM3DQYMGekRm6Zjv6n/icvLW12nPlfU8ShC3vTgw2f
         pMNVgpuWgySaYPXnEA7HUFhFshOUTq3usB29KnFR7zsD6cJ0kb4XhCVEAw/uwflUoESZ
         H99erOImLBgXFqGQh/Tz+NzMz7S8npMpLRWaoh6/E2eQYwyiTxCuQPQR0Y3YSjz7lB+z
         jqBx1XdVKWUsrCrCkRql3VC9ZxemqRyO0edwh3CxqAcsW3QLwCsmJ+uzZY8KfVBD8DM8
         8Do4tkxqjC1wxij3dfsFdLYDSeDXsCkJMf2TRbLNquBih/pf3+9clGPM0Bwas80mWy/F
         NfWA==
X-Gm-Message-State: AOAM530oAatUL70x9AxFjbb88qX16LvswHFQDhOhpC0T3R225hwq2Mbv
        V9zJDMjNA+zsM0Vzo36Hteu1g8EEwjPL2WTe4EH49A==
X-Google-Smtp-Source: ABdhPJy0PnwHfzauVDw+Ug2b7tLfbgXqklE/dFIs6uKXZxsoJFcNcg5IvQkTzE3BVQgmfzvG6L2U8lbITGbUSMKo/AA=
X-Received: by 2002:ab0:186d:: with SMTP id j45mr1143930uag.104.1592299334487;
 Tue, 16 Jun 2020 02:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200604015317.31389-1-thara.gopinath@linaro.org> <20200604015317.31389-6-thara.gopinath@linaro.org>
In-Reply-To: <20200604015317.31389-6-thara.gopinath@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 16 Jun 2020 11:21:38 +0200
Message-ID: <CAPDyKFrBYx1dDK2UNvaZR1swB-9WiOy4V62hFU2-Ud_xm6gOoA@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] dt-bindings: power: Extend RPMh power controller
 binding to describe thermal warming device
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, Rob Herring <robh@kernel.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux PM <linux-pm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 4 Jun 2020 at 03:53, Thara Gopinath <thara.gopinath@linaro.org> wrote:
>
> RPMh power controller hosts mx domain that can be used as thermal warming
> device. Add #cooling-cells property to the power domain provider node to
> indicate this.
>
> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe


> ---
>
> v3->v4:
>         - Removed subnode to indicate that mx power domain is a warming
>           device. Instead #cooling-cells is used as a power domain
>           provider property to indicate if the provider hosts a power
>           domain that can be used as a warming device.
>
> v4->v5:
>         Moved the property from .txt format to .yaml format.
>
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> index 8058955fb3b9..a4fbbd88ce18 100644
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> @@ -28,6 +28,9 @@ properties:
>    '#power-domain-cells':
>      const: 1
>
> +  '#cooling-cells':
> +    const: 2
> +
>    operating-points-v2: true
>
>    opp-table:
> --
> 2.20.1
>
