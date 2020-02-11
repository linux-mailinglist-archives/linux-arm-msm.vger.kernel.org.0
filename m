Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D256159875
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2020 19:24:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730230AbgBKSYr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Feb 2020 13:24:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:53262 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729169AbgBKSYr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Feb 2020 13:24:47 -0500
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 95D8F21569;
        Tue, 11 Feb 2020 18:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581445486;
        bh=15RkB8/lsxkdGVyrfUT3PmibNwKSs3pakIPq9O2QKGA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=A8Zqm6fJP2FLzduLIBDokEhN/2d/UrH1tTPxjD5ihd4BFsmr4U+TmlhZKIyLl5OeE
         y8tyZK1Z+LwxdaT3JO7a63fwdEV45iurNjgynCzt3Az2dG8qrc/SS5bt9W9L6m3vm8
         E4RlmQ+12GEi7n7znDshSniOcw1AMCbrmborQU5w=
Received: by mail-qv1-f52.google.com with SMTP id m5so5451862qvv.4;
        Tue, 11 Feb 2020 10:24:46 -0800 (PST)
X-Gm-Message-State: APjAAAVWVPt0aQfAjtZ+25pKee02DYuBkCsSHZvoTSb/5yltM791ECxQ
        DVFgRweIAJZ8wRqtiX/KlHfI0kJzeI87u4hfPw==
X-Google-Smtp-Source: APXvYqxfEK6hEL7IX2KvoJP4sjzXqu7vc6OB5e1z94Q1gXnPXU2WIumcI1fS/UN5s1vfda4olh8aSlNY95DTbeSQkqo=
X-Received: by 2002:a05:6214:11ac:: with SMTP id u12mr4114530qvv.85.1581445485691;
 Tue, 11 Feb 2020 10:24:45 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580570160.git.saiprakash.ranjan@codeaurora.org>
 <ff71077aa09c489b2b072c6f5605dccb96f60051.1580570160.git.saiprakash.ranjan@codeaurora.org>
 <20200206183808.GA5019@bogus> <f26464226f74dffe2db0583b9482a489@codeaurora.org>
In-Reply-To: <f26464226f74dffe2db0583b9482a489@codeaurora.org>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 11 Feb 2020 12:24:34 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKeytW=k5efjcfcuK6vbGggdO9nVdwq7YGNtMpzPQHWMg@mail.gmail.com>
Message-ID: <CAL_JsqKeytW=k5efjcfcuK6vbGggdO9nVdwq7YGNtMpzPQHWMg@mail.gmail.com>
Subject: Re: [PATCHv2 2/2] dt-bindings: watchdog: Add compatible for QCS404,
 SC7180, SDM845, SM8150
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree-owner@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 7, 2020 at 12:10 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hi Rob,
>
> On 2020-02-07 00:08, Rob Herring wrote:
> > On Sat, Feb 01, 2020 at 08:59:49PM +0530, Sai Prakash Ranjan wrote:
> >> Add missing compatible for watchdog timer on QCS404,
> >> SC7180, SDM845 and SM8150 SoCs.
> >
> > That's not what the commit does. You are changing what's valid.
> >
> > One string was valid, now 2 are required.
> >
>
> Does this look good?

No. First of all, what's the base for the diff? It's not what you
originally had nor incremental on top of this patch.

Second, a value of 'qcom,kpss-timer' or 'qcom,kpss-wdt' or
'qcom,scss-timer' will fail validation because 2 clauses of 'oneOf'
will be true.

>
> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> index 46d6aad5786a..3378244b67cd 100644
> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> @@ -14,19 +14,22 @@ allOf:
>
>   properties:
>     compatible:
> -    items:
> +    oneOf:
>         - enum:
>             - qcom,apss-wdt-qcs404
>             - qcom,apss-wdt-sc7180
>             - qcom,apss-wdt-sdm845
>             - qcom,apss-wdt-sm8150
> -          - qcom,kpss-timer
> -          - qcom,kpss-wdt
>             - qcom,kpss-wdt-apq8064
>             - qcom,kpss-wdt-ipq4019
>             - qcom,kpss-wdt-ipq8064
>             - qcom,kpss-wdt-msm8960
> +          - qcom,kpss-timer
> +          - qcom,kpss-wdt
>             - qcom,scss-timer
> +      - const: qcom,kpss-timer
> +      - const: qcom,kpss-wdt
> +      - const: qcom,scss-timer
>
>     reg:
>       maxItems: 1
>
> Thanks,
> Sai
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
> member
> of Code Aurora Forum, hosted by The Linux Foundation
