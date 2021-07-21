Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0E6F3D0876
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jul 2021 07:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233069AbhGUFFD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 01:05:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233286AbhGUFEY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 01:04:24 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98776C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jul 2021 22:44:58 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id h9so1747590oih.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jul 2021 22:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=OZ+eKXyM6tJgPfiMyzHLbhC2Gq2GeuohG8n3p1aQmww=;
        b=a3ltlIFw3PDaPGWCtUL30D2NpHapO5Ew/TlfmUCEZKmzpGNEwGkbUPHe6vnMTnS3T3
         SRzQtCjriEnnevgAxqb6+5turJkmn7YkBhK9zRjTD10ejpbCW4Giv3aLNrQHV/3PwCQv
         cjwUI5lGJC+bixz1gLOaXL3vtrin4B8En2Xq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=OZ+eKXyM6tJgPfiMyzHLbhC2Gq2GeuohG8n3p1aQmww=;
        b=SqBFlPiAH+6c5fMo9/XEtU/f21XjPlgcHA21gM53DsHtR3jnn2N+K+WnQCt9bu8ZYu
         aUdMBmnUCWmV2NsYESHW0400WiA21wsdoL3TXks8PTkMVKLLEVAS+/nvUfM2f7SgAh5V
         EfTuaWPqdHx7DzBlvHZbCT3ohN630qa4w1YmtVJ7ek2s1dlbis/5o9BPQ8Won53gGVJ3
         P+hnaiuE6BvrYnRz4K5N5oO/OcBeERwrwsxr6ok+w05CPVAW3jk63d2W0wnugSp8hFba
         +IPn60sGA0jQglYZcZVsjYZUXqBF7T8fdlBl1eSYONVKYqGWf7OYQvKgCJdTe1MlKvoS
         t0+g==
X-Gm-Message-State: AOAM530JyTOr4VYahFWXgBlCA2MZFxagWZYDEvzZZfzF8TIINyco9rJw
        Fjg9Ns/AK9ctRpXFFYcqqPRQTQuiELhJ2z4GMPNfOQ==
X-Google-Smtp-Source: ABdhPJyGZbF5q862hBiaxTRq3Av5De0RIunb58CNjCEgt4NMQAmb8EQUvqsGkvMKuQY34ShS7h5O9N404r3ozTEhOl8=
X-Received: by 2002:a05:6808:114a:: with SMTP id u10mr4804173oiu.19.1626846298050;
 Tue, 20 Jul 2021 22:44:58 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 05:44:57 +0000
MIME-Version: 1.0
In-Reply-To: <1626775980-28637-9-git-send-email-sibis@codeaurora.org>
References: <1626775980-28637-1-git-send-email-sibis@codeaurora.org> <1626775980-28637-9-git-send-email-sibis@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 21 Jul 2021 05:44:57 +0000
Message-ID: <CAE-0n50HwmuYWnqs9TYJYEoB=-BV8Bbz+AMUUy5t9dtN1jSsjA@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] arm64: dts: qcom: sc7280: Add nodes to boot modem
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mka@chromium.org, robh+dt@kernel.org,
        saiprakash.ranjan@codeaurora.org, will@kernel.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2021-07-20 03:12:58)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 5ed7a511bfc9..3fb6a6ef39f8 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -1219,6 +1224,21 @@
>                         };
>                 };
>
> +               imem@146aa000 {

is sram a more appropriate node name here? Is imem a generic node name
in DT spec?

> +                       compatible = "syscon", "simple-mfd";
> +                       reg = <0 0x146aa000 0 0x2000>;
> +
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
> +
> +                       ranges = <0 0x0 0 0x146aa000 0 0x2000>;
> +
> +                       pil-reloc@94c {
> +                               compatible = "qcom,pil-reloc-info";
> +                               reg = <0 0x94c 0 0xc8>;
> +                       };
> +               };
> +
