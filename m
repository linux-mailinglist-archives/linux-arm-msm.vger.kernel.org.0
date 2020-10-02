Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CACA6281E2E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Oct 2020 00:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725730AbgJBWU4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Oct 2020 18:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725613AbgJBWUy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Oct 2020 18:20:54 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93853C0613E3
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2020 15:20:52 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id y194so1338953vsc.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2020 15:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YO3BKY1t3RoujCw4IEgcApM9xQo/s9/vmUvLTebAFNM=;
        b=m5FbwErQrFIkbcAHJy1GVJKbl6vRV+J+dt+nYMjgxQRPRNTF+zT52nUaMxENOqrjhP
         wfGGITQx1Bwxme2YbRfw2q+zmy+r4MYafc0n8+L6LrKWj277oua4N5WISIphdRHMinkc
         mWNUIQnXPSk5zYx76rd8L+TV2t4MuZSqWGziw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YO3BKY1t3RoujCw4IEgcApM9xQo/s9/vmUvLTebAFNM=;
        b=B+p7y5uTAgyiajJ+dVAHXkGAgePFAXV14ZYlw3X+eGcHeI345ONFLIiwCJUtydN1Af
         YK2miAX4snnSChlGEWCDMokvCBm9hXeY2ubH3+tXb/TTLOjjoVAaxILe2jI83+4EOx0Q
         mny1IGGDeM7b5pSbn/vUvR/KQfSUPeVYmy+jlyUiW6LyKj8ih5YT3g+W15Tn7RQFjkgS
         xDSr+VkaAl1ibGYbGmpbP4Ds7oLRJym1PGRlMh3e20nZjTaYoK8nuG0ZDhA8Bz8ChHCy
         asj49C1J6FLTHpMXLCXUnlK3epm+7KVPeqCbAhIXCjTIi//ssCjl5B5BX/m1aPBqj7nP
         H2GQ==
X-Gm-Message-State: AOAM530pYHVwPdeR4EIk6l3sYz1ubaCqDPX+92p4ekYkW+rt5syS7CUG
        oR8bGur5AfH9jc0uK9fON5MbqkOQeLUirQ==
X-Google-Smtp-Source: ABdhPJyQgBYEyzqrYCTVxeRIXiYybFHGevZjyj2ApLNCdmsONSrddvdHCLTLFXmeiu4hRSv/zvo/aw==
X-Received: by 2002:a67:6816:: with SMTP id d22mr384478vsc.0.1601677251216;
        Fri, 02 Oct 2020 15:20:51 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id n9sm448779vkq.31.2020.10.02.15.20.50
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 15:20:50 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id a16so588288vke.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2020 15:20:50 -0700 (PDT)
X-Received: by 2002:a1f:d986:: with SMTP id q128mr2544346vkg.7.1601677249682;
 Fri, 02 Oct 2020 15:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200929205807.2360405-1-evgreen@chromium.org> <20200929135741.1.I8b447ca96abfbef5f298d77350e6c9d1d18d00f6@changeid>
In-Reply-To: <20200929135741.1.I8b447ca96abfbef5f298d77350e6c9d1d18d00f6@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 2 Oct 2020 15:20:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V3+V0uBiC_whvWEnv1TSkXt-MfnK+34Kir_kfTymejSA@mail.gmail.com>
Message-ID: <CAD=FV=V3+V0uBiC_whvWEnv1TSkXt-MfnK+34Kir_kfTymejSA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: nvmem: Add qcom,sc7180-qfprom compatible string
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
> Add an SoC-specific compatible string so that data can be attached
> to it in the driver.
>
> Signed-off-by: Evan Green <evgreen@chromium.org>
> ---
>
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> index 59aca6d22ff9b..b16c8e6a8c23d 100644
> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> @@ -14,7 +14,9 @@ allOf:
>
>  properties:
>    compatible:
> -    const: qcom,qfprom
> +    enum:
> +      - qcom,qfprom
> +      - qcom,sc7180-qfprom

You don't want either/or.  You want both.  At the time Srinivas didn't
see the point of having the SoC-specific compatible string here, but
now that we have a reason for it maybe he'll be convinced?  IMO you
essentially want:

    items:
      - enum:
          - qcom,apq8064-qfprom
          - qcom,apq8084-qfprom
          - qcom,msm8974-qfprom
          - qcom,msm8916-qfprom
          - qcom,msm8996-qfprom
          - qcom,msm8998-qfprom
          - qcom,qcs404-qfprom
          - qcom,sc7180-qfprom
          - qcom,sdm845-qfprom
      - const: qcom,qfprom

For some context:
<https://lore.kernel.org/r/CAD=FV=WjvAWVmq3fTh=_f2p1Dv+sXg1RV-CqZr8KRgHe8_wT0w@mail.gmail.com/>

-Doug


>
>    reg:
>      # If the QFPROM is read-only OS image then only the corrected region
> --
> 2.26.2
>
