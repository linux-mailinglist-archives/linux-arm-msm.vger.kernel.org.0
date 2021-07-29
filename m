Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25FAD3DA8C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 18:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231637AbhG2QTj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 12:19:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231645AbhG2QTj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 12:19:39 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABE71C0613C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jul 2021 09:19:34 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id d2so4309848qto.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jul 2021 09:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CQOpyHR0dniHjwxjRmNhdF/ycVh6frpl8ClqJFnJ9xQ=;
        b=ic/+jL/sRZ9YoobekO1A6TTBbRQSbO+0ZcaQ1XhRlWBY3radRJChbEef0Q7ltIrJIz
         GELxuymuBGzolOq87K5y7cqjYqwH1HVuiJHEo4OrtIt1w13Zq27SYklgQZi02gEdupO9
         OAnmex7mBJ1NfOgBYxwJ9gHRM0/OW2wT10jGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CQOpyHR0dniHjwxjRmNhdF/ycVh6frpl8ClqJFnJ9xQ=;
        b=Wtbr0NLo1AsUuLmhpNySqcCqCuv8euQiBICduQgqT+T+19DaRLfS46PnOclkXFz+3b
         TtqYJvrk/AIJriU2/kHUkrorJVFgmXbEwt9IhCVBcreizRCI/Iq6UjA8PaWN8MjxZmWc
         TLH9xYxlWgXIC95NoiVGeH1S+Z4lgfVh8Ib9J3GlY0qtH9T8PWl0gOHcRi+MSaC6pNJq
         WRu3o+LU9tBcymSQDFDb4VE/y9Z6k6ZJvpZm0+auj50R9ZFXu2VLW487J4lICN9lse0M
         PWOy5sOQucDs416BB969GQ1YBpcRhoRdcomQQnmLGXhmtmwbe2eAorsUyVv0xZYpCslC
         HBCw==
X-Gm-Message-State: AOAM5335dHtEv1yNCzWry/pNwG5rUm+90BtL2KcFiRzeTSXjXxeAvaFt
        YRjZ05S8dDhOrrVDwRIDpFQcyO0fkSG+KQ==
X-Google-Smtp-Source: ABdhPJzEMbAkrc/Z08JbaNXZvEr7BeMYKpTlnF862SIRFoIXt/soQM9ibGVZXxqbdZH7mJNUoDICcw==
X-Received: by 2002:ac8:4f14:: with SMTP id b20mr4833904qte.236.1627575573767;
        Thu, 29 Jul 2021 09:19:33 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id i67sm2049177qkd.90.2021.07.29.09.19.32
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jul 2021 09:19:32 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id x192so11212216ybe.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jul 2021 09:19:32 -0700 (PDT)
X-Received: by 2002:a25:2904:: with SMTP id p4mr7599226ybp.276.1627575571977;
 Thu, 29 Jul 2021 09:19:31 -0700 (PDT)
MIME-Version: 1.0
References: <1627560036-1626-1-git-send-email-rnayak@codeaurora.org> <1627560036-1626-2-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1627560036-1626-2-git-send-email-rnayak@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 29 Jul 2021 09:19:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vtp0HGFpoS4cdZOQ0GUBbhiyw=TuYxWNTGVAyMUKMhvQ@mail.gmail.com>
Message-ID: <CAD=FV=Vtp0HGFpoS4cdZOQ0GUBbhiyw=TuYxWNTGVAyMUKMhvQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: nvmem: qfprom: Add optional
 power-domains property
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        "Ravi Kumar Bokka (Temp)" <rbokka@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jul 29, 2021 at 5:01 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> qfprom devices on some SoCs need to vote on the performance state
> of a power-domain, so add the power-domains optional property to the
> bindings
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> index 861b205..a498a08 100644
> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> @@ -51,6 +51,9 @@ properties:
>    vcc-supply:
>      description: Our power supply.
>
> +  power-domains:
> +    description: A phandle to a power domain node.
> +

I'm trying to channel my inner Rob here by saying that this
description doesn't add anything and this should just be:

power-domains:
  maxItems: 1

Here's an example of Rob saying this:

https://lore.kernel.org/linux-devicetree/20210712151322.GA1931925@robh.at.kernel.org/

Other than that, feel free to add my "Reviewed-by" tag.

-Doug
