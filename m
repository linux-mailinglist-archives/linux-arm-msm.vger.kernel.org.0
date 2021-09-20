Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1E1D412A67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 03:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232467AbhIUBlB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Sep 2021 21:41:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231745AbhIUBic (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Sep 2021 21:38:32 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 725F1C122763
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Sep 2021 12:32:49 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id y201so11538018oie.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Sep 2021 12:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=RcfKZ8RQR7lkEDrRbmC3NNXvVvlQ4D4N2QPf10IkPsk=;
        b=VIWhZSszUjwNbxpn1xKTaTCO8/eniwjzjZNSj9/SrcvTosNfs1c+KEAtHJ4aiAulyh
         TSuSJ5ukOh0Dxqvn7SBlOsx1xNi/uKN4o0X+G08X/e+YM7hcASjH6n25jzrpmpokcp9E
         dTAMQOvhKeFnwFTLyaBDEm2aDiLrBSmtCqXYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=RcfKZ8RQR7lkEDrRbmC3NNXvVvlQ4D4N2QPf10IkPsk=;
        b=7VcitjRgtTfFu4Na+0onZ20XPdnqxXTUblj+lMe7iqiDJu9J3jPXJPJ+2W6hKa+mwD
         ovwQ3o24uqkEpYajDOjtEycJOSuIjjmakPDHL5xCs0S2pufr6rjv/1/GWy3RcOglcqBb
         eg8qX1neiQRiMsJciMXBYZs9dKb38sUMmw4Y5ZlRzOXA8SN+M82QUnh6Rc4YT8/ZKR8M
         7Uu/YmEBogMPxXyQ/JiooVkENZy44f61q6+5GYrhLXI/uWvZOs5eeXhImKDz8ajdqwY9
         kn57sfl+lkQqqQgqFvlhSNULXlM8m5XqGNdfnscl5JjCSgP8e3Z1QdpfcOg50mSEjDHC
         NLRQ==
X-Gm-Message-State: AOAM53336PooRgkol8347wVoQcB3a5/Y1azoLPQFkOe279tOCrp6Ith4
        kjIbsz2YCThGzdfDBJd2Qbd+sLibdwxKADK5g6rY5w==
X-Google-Smtp-Source: ABdhPJy5gNNMMyTTsHsOw5F7pEwhDmSOBb0xz/TedbZBQOomMd6+H6P35RPPrZR2q+09IXhthEvSnpFhcR2JLAAjhZ0=
X-Received: by 2002:aca:3110:: with SMTP id x16mr587519oix.64.1632166368784;
 Mon, 20 Sep 2021 12:32:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Sep 2021 12:32:48 -0700
MIME-Version: 1.0
In-Reply-To: <1631875538-22473-2-git-send-email-skakit@codeaurora.org>
References: <1631875538-22473-1-git-send-email-skakit@codeaurora.org> <1631875538-22473-2-git-send-email-skakit@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 20 Sep 2021 12:32:48 -0700
Message-ID: <CAE-0n51Xrv54XVLJwz9ENTtOhtCKWG7WtQg2o2+SFEoru1M4VA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: mfd: pm8008: Add pm8008 regulator node
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <skakit@codeaurora.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, mka@chromium.org,
        Das Srinagesh <gurus@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2021-09-17 03:45:35)
> Add pm8008-regulator node and example.
>
> Signed-off-by: Satya Priya <skakit@codeaurora.org>
> ---
>  .../devicetree/bindings/mfd/qcom,pm8008.yaml       | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> index ec3138c..de182f8 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> @@ -45,6 +45,10 @@ properties:
>      const: 0
>
>  patternProperties:
> +  "^pm8008[a-z]?-regulator$":

Shouldn't it be ^pm8008-regulator$ without the a-z optional letter?

> +    type: object
> +    $ref: "../regulator/qcom,pm8008-regulator.yaml#"
> +
>    "^gpio@[0-9a-f]+$":
>      type: object
>
