Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ECE5295458
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Oct 2020 23:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506323AbgJUVlK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Oct 2020 17:41:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2506317AbgJUVlK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Oct 2020 17:41:10 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00B3BC0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2020 14:41:10 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id l6so2106283vsr.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2020 14:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fiI+ivAkRfzoArXOKg0GeDaxWAM5Ef0WBWauCl2e4lY=;
        b=GU69OBpfiopIipOmEG3+SBUQ1TFsTZ8rOfH655pf1Au0FRsI5BvydXLkZZwCr/xC0U
         uHuaDjnbmUV6JIic2c6K+dAm5Ef3ZoyV0ceaZIEbwQkKhjuDGwHTKAWhUs+YGVG3VR1R
         s0ph1pA08bd6Fm/7mOHhwfOLs4GY2x57CH+nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fiI+ivAkRfzoArXOKg0GeDaxWAM5Ef0WBWauCl2e4lY=;
        b=BFlLUddho3GHoO7zOAD4wtzC+lwH3FMtvKyzmYSpJYxhgtFASO01Ea8jT8JSB2eeJE
         JfT9v68i1fGsVF730PS4xW+zvEPF0tuB8ZR+2MmCPHx/ZUtq5gPxBP2qGrHATeJQx6Ny
         cSl8uC79DJEpItWinRO94SzckTLBlo/GpTsb9tBKYMPoZIvNCa/TOs+4JNT/UIrDyYf5
         QkUOIwPm9eK3X1u2WYzP3MUVt9hhdKQPntCe0NCMloV9wRveCMqPskER9lT4smDY8N8u
         p0C+9o3BWkTgrKubkjEJYHlaTITo7HwQod8NsLyxlkkTjXzNdzPTBdlGqG88ZxhS0K8Q
         2uvg==
X-Gm-Message-State: AOAM532br/aLiy/5QjhR7O4+x8pp9FXuS6NTatO7B7IpXy/fwUqxgpPR
        nr8XUHpDWPPTi3So05CqzpnAyTGyD8OIRw==
X-Google-Smtp-Source: ABdhPJwrS+AQ5Jd2zNwG4Xr4oimtDS3LNOq8sycY3qTKtdMzOsZnJAN3ztaWDm/KlRzC512aTytwLw==
X-Received: by 2002:a05:6102:21aa:: with SMTP id i10mr126106vsb.9.1603316468547;
        Wed, 21 Oct 2020 14:41:08 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id v136sm326101vsv.26.2020.10.21.14.41.07
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2020 14:41:07 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id h5so1839610vsp.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2020 14:41:07 -0700 (PDT)
X-Received: by 2002:a67:e3b9:: with SMTP id j25mr3757348vsm.37.1603316467072;
 Wed, 21 Oct 2020 14:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <20201016192654.32610-1-evgreen@chromium.org> <20201016122559.v2.1.I8b447ca96abfbef5f298d77350e6c9d1d18d00f6@changeid>
In-Reply-To: <20201016122559.v2.1.I8b447ca96abfbef5f298d77350e6c9d1d18d00f6@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 21 Oct 2020 14:40:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VyBxXFLGsPZFpX29xFL5p8ZZPQ0uJEku3Wo04VFOEZOg@mail.gmail.com>
Message-ID: <CAD=FV=VyBxXFLGsPZFpX29xFL5p8ZZPQ0uJEku3Wo04VFOEZOg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: nvmem: Add soc qfprom compatible strings
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

On Fri, Oct 16, 2020 at 12:27 PM Evan Green <evgreen@chromium.org> wrote:
>
> Add SoC-specific compatible strings so that data can be attached
> to it in the driver.
>
> Signed-off-by: Evan Green <evgreen@chromium.org>
> ---
>
> Changes in v2:
>  - Add other soc compatible strings (Doug)
>  - Fix compatible string definition (Doug)
>
>  .../devicetree/bindings/nvmem/qcom,qfprom.yaml      | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> index 1a18b6bab35e7..eb1440045aff1 100644
> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> @@ -14,7 +14,18 @@ allOf:
>
>  properties:
>    compatible:
> -    const: qcom,qfprom
> +    items:
> +      - enum:
> +          - qcom,apq8064-qfprom
> +          - qcom,apq8084-qfprom
> +          - qcom,msm8974-qfprom
> +          - qcom,msm8916-qfprom
> +          - qcom,msm8996-qfprom
> +          - qcom,msm8998-qfprom
> +          - qcom,qcs404-qfprom
> +          - qcom,sc7180-qfprom
> +          - qcom,sdm845-qfprom
> +      - const: qcom,qfprom
>
>    reg:
>      # If the QFPROM is read-only OS image then only the corrected region

As Rob's bot found, your example no longer matches your requirements.
It needs an SoC-specific string plus the "qcom,qfprom".  It's always
good to try running "make dt_binding_check" to catch these sorts of
things.


-Doug
