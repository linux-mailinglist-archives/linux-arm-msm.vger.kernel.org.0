Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE76043F2AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 00:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231539AbhJ1WYb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 18:24:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231532AbhJ1WYa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 18:24:30 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A43E0C061348
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 15:22:02 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id y128so10425764oie.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 15:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=safjzndEbzjU2SwVTVE4zVWj+HK5y+hvxFtF+3nUUHI=;
        b=U0ZkmgyT3PB6z8814OGZKCNDizIxnQdvyYawTAPG4+SG23OU7CcuGn81meGhTVps2h
         26NJy4m5OjlUnqEWnhqsu9dCo07ur5BZor+93s5vKlA5qdw7WV0S/K9zTk5tQ6ej+TSz
         5rB5I89fDFJwaM6vz/CYeHumeD+voBqWcR/k4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=safjzndEbzjU2SwVTVE4zVWj+HK5y+hvxFtF+3nUUHI=;
        b=ZL/fHt1iTXYiCanT/T7519+CffSTnYkmpkrdY4d/BvdiLdWLsHlSbWYY5wadguJ+BE
         hY7i2xCeveAkQW+9J3uO+lGCf9qG1wzMreF3gYEsfi3xuijOZ7FI+2g/XHLZkDooeHiu
         JhGO+ZYuIRWjV/BE5V9JQZIqQgJSiSUUVGatEYSEWZBlnwLC0zhHYaq2Bj+VI0oeg+L9
         aThZCbzpaBzc/isQx28gE8EbzQWeqEJYt9QS8skX2Y8Osg6XSba1QRTDcRKNUCl+pkl+
         LqawiPaN6QF10EzapSOLA+50ryYsmZWyx2oBbhulN9g3C6ktpSNCATJYXDjsGacZd9FZ
         TnJQ==
X-Gm-Message-State: AOAM532cEcyhGsj0GTTXeyI8MfsHPJRIbMxssSmO67spkLOn1r0OZXjR
        /m56VJHnWw3vNthH8yNUKlBjXH5Um3nedqpcIjEnHA==
X-Google-Smtp-Source: ABdhPJxwad3KZP7ykLYAovaRb+WkgtPUCXvy7JwNFEV0mCgGDN/cpVWWW0Gfk8jtDIeN7WucT9ADa66p1oLzUwiatZ8=
X-Received: by 2002:a05:6808:2128:: with SMTP id r40mr3516798oiw.164.1635459721995;
 Thu, 28 Oct 2021 15:22:01 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 Oct 2021 15:22:01 -0700
MIME-Version: 1.0
In-Reply-To: <d92c73d1-32b1-8d95-f3b5-ff103b330621@codeaurora.org>
References: <1633614519-26680-1-git-send-email-srivasam@codeaurora.org>
 <1633614519-26680-3-git-send-email-srivasam@codeaurora.org>
 <CAE-0n51qO1q5ZF-fAf2Gma9a2B+iSyoQnJdJ8Fnmsz+DG0rwPg@mail.gmail.com> <d92c73d1-32b1-8d95-f3b5-ff103b330621@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 28 Oct 2021 15:22:01 -0700
Message-ID: <CAE-0n537neZdwb3vP4=8N5vj0EwYnDnA-U7O=fckPvP52baCrg@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: qcom: Add sc7280 lpass lpi
 pinctrl compatible
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
        broonie@kernel.org, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        perex@perex.cz, plai@codeaurora.org, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
        tiwai@suse.com
Cc:     Venkata Prasad Potturu <potturu@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2021-10-27 00:47:52)
>
> On 10/7/2021 11:29 PM, Stephen Boyd wrote:
> > Quoting Srinivasa Rao Mandadapu (2021-10-07 06:48:38)
> >> Add device tree binding compatible name for Qualcomm SC7280 LPASS LPI pinctrl driver.
> >>
> >> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> >> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> >> ---
> >>   Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml | 4 +++-
> >>   1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
> >> index e47ebf9..578b283 100644
> >> --- a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
> >> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
> >> @@ -16,7 +16,9 @@ description: |
> >>
> >>   properties:
> >>     compatible:
> >> -    const: qcom,sm8250-lpass-lpi-pinctrl
> >> +    enum:
> >> +      - qcom,sc7280-lpass-lpi-pinctrl
> >> +      - qcom,sm8250-lpass-lpi-pinctrl
> > I suspect we need to split the binding because the function list needs
> > to change. Can you make a whole new file that's probably largely a copy
> > of this file and/or extract the common bits into a meta schema and
> > include that in both the files? Then the function list can be different
> > and the clock property can be omitted in the sc7280 file.
>
> As most are common functions and fixed number of LPASS Lpi pin
> configuration across platforms,
>
> Only diff is ADSP bypass platforms 2 clocks are optional. Otherwise
> clock design also same for SC7280 and SM8250 based architecture.
>
> So I feel Keeping common file is better for now.

I don't agree. We want to be very strict about what is exposed. It needs
to match exactly what is supported on the SoC, not be a superset of it.
