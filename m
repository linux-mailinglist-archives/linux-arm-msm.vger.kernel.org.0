Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9683409D83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Sep 2021 21:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242447AbhIMT6a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Sep 2021 15:58:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231727AbhIMT63 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Sep 2021 15:58:29 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AA1BC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 12:57:13 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id m7-20020a9d4c87000000b0051875f56b95so14995259otf.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 12:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=oVrHBVnA82OtmOYjdYw081CjAbJqok+5sFDiTTmJyOY=;
        b=FKMBKQTeyyzPpKaEb0ZcqQGcGxi2u+oJ6BAbbSTLb/qmG6yYs7aD8TekL6WQQLnawc
         gVaE3anPh7aiJhwpP4AmOxXAdbB/YtbBELHX2VQZ7uyUKUlafQsivwu2uKS9ajmfmqof
         WuOlWoTKO6xgV1zumIHyL4ZAU1I5UwdVXEfIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=oVrHBVnA82OtmOYjdYw081CjAbJqok+5sFDiTTmJyOY=;
        b=CHbX8VJtzhBVnyoBbEWcPd6hVaQhn8/S4vosmb+OfDIUnboxkURj6fAQtWhJURJCNc
         tBkcXQfyfwHnNVnRtaA8ZoEAUQxFGeALRpk283MmY/domEDqtLyK8N1pRhZVGgp+dIum
         aXqM0qEg2qKhl8rg8PS/HrvRhZoOUyjeANZIVq2jxCx6DjrKAIzNGaCrA13KiZ+elxuo
         DTembenzGR1MzofRTrJuaB5Q0Tob5HsIc1cydabBhJyih+rU3z/EH8R0Nw9GE/ino0HD
         6WkBCh281+VxYeIJpAJwjV2ZQv/oSpBgC9DDp2+EGaGnG3lISA1QecReM9HQV9FzYBmp
         CpQA==
X-Gm-Message-State: AOAM530V7Su8nllsRrX3/fP3lsR7+ic8EtntcXADP0hXYctp273WmhYl
        lTugXgBKjBBOFc3aKIWT7nJgXG1n6YLd+KT/o9MkAg==
X-Google-Smtp-Source: ABdhPJwQxAL+ThVF6V+sJim9YhLgx5h9y9zXk04Yj0aLrvGNLZyipOd51mVO66boDMbOaqY+usQDCemHnXuynotgc7Q=
X-Received: by 2002:a05:6830:719:: with SMTP id y25mr11159215ots.77.1631563032742;
 Mon, 13 Sep 2021 12:57:12 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Sep 2021 12:57:12 -0700
MIME-Version: 1.0
In-Reply-To: <1631530735-19811-1-git-send-email-rnayak@codeaurora.org>
References: <1631530735-19811-1-git-send-email-rnayak@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 13 Sep 2021 12:57:12 -0700
Message-ID: <CAE-0n51miUjP4dg4wQR_JBwNNvMNqAafv7jFvEKU+MrfQmhV5A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280-idp: Add vcc-supply for qfprom
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rbokka@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2021-09-13 03:58:55)
> Add vcc-supply for the IDP boards that was missed when the
> qfprom device tree properties were added for the sc7280 SoC.
>
> Fixes: c1b2189a19cf ("arm64: dts: qcom: sc7280: Add qfprom node")
> Reported-by: satya priya <skakit@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> index 371a2a9..99f9ee5 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> @@ -207,6 +207,10 @@
>         };
>  };
>
> +&qfprom {

Maybe that node should also be marked status = "disabled" by default so
that it can only be marked OK if the board has setup the regulator
properly?

> +       vcc-supply = <&vreg_l1c_1p8>;
> +};
> +
>  &qupv3_id_0 {
>         status = "okay";
>  };
