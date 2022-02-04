Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 974704A982A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 12:05:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352950AbiBDLFK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 06:05:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345016AbiBDLFK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 06:05:10 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30626C06173E
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 03:05:10 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id z10-20020a17090acb0a00b001b520826011so12746268pjt.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 03:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jCuNfnWPlZWL/8TLKP3iIrA+Vkwgz9R03nr+zSG6Xt0=;
        b=clsUGfObLd2qY9+/OgiCmvGlTwPMOzCQlxgwDIbSEON92ogLqnCcw2nncGk3EA/Kgv
         dWYg5S3AJCgKNpnxKiIB0mZJF0S2IXKQJBDI5OYmEt7VG0iq8WXHyHgb38/E3GVVoAfE
         v9NipRi1Sv0YlluePVE2WGBXp7GuiV7RhCxz/YNSLKC7p2xEAU1ZNjSMVgDHIacztXrz
         ET5WKI869GHcqJp+FfF1ctHFfo9wqMkD6jQ+4iAhAtLk63ZbbPA3n3XKsOhdnJU/9BO0
         KSVo7p31DE/KG3Tm4m0Me/Vxyu5/U3Vz3BzKNVOcAVGo1cor5ibGGn2K3Qo3vNI4ivj+
         ElYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jCuNfnWPlZWL/8TLKP3iIrA+Vkwgz9R03nr+zSG6Xt0=;
        b=OVfkJnxkA/KgoyLEIdzF8YiZp6E5ehDNNfkHDkDtj0g8EJMk84Uw1pD0MMQJQ090jd
         Eb1K6RjX6AJFEqZepJOIZc3Epy0dWAMZyPgSQAo12/Zb8gGxn+xZQrp0zeQfzGBUygbF
         8xRrlRwpFn9O2fzxy6jtgATRVAxJYcQP+oR3tKC+83CyQpbPUgjjyFN6X+8szR5A4Sn5
         DJvJYz4sMVuvzTnXpj5ofHu1HxoEu1d/Jpn3csW24sz/m3EZQr/FRf7NJBfF+W1v01Vy
         iLRYZz8kydCVKpqmIs1UQNI++h/utOaKGDALKC+S3UX7o6IhgUtKngre/k49vOeGON0p
         sT/Q==
X-Gm-Message-State: AOAM530NcFq+TBok0XLUmgu0nIv+b5ZJ7s2BUo6tOmlYUevFHJkIEOeI
        x9NSVv0Y8him7haSdefFV8866CI8BoapkFTxgeSggg==
X-Google-Smtp-Source: ABdhPJztoI3AxEKYwRuYat4WTHVEWQ42+Xts2zDJzatNLXBnNPT+B/MqUrsh5v7UIThNuL3QBHV+z+YTBaJ8yxbX32s=
X-Received: by 2002:a17:902:714a:: with SMTP id u10mr2464033plm.21.1643972709639;
 Fri, 04 Feb 2022 03:05:09 -0800 (PST)
MIME-Version: 1.0
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org> <20220203164629.1711958-2-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220203164629.1711958-2-vladimir.zapolskiy@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Fri, 4 Feb 2022 12:04:58 +0100
Message-ID: <CAG3jFytVSHgvMTke_bDEmin3SC_23ELBn_HgvJ1=8B2eFnq4Dg@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: i2c: qcom-cci: add QCOM SM8450 compatible
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 3 Feb 2022 at 17:46, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> The change adds QCOM SM8450 compatible value to the list of QCOM CCI
> controller compatibles, the controller found on the SoC is equal to
> the ones found on previous SoC generations.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
> index 7b9fc0c22eaf..924ad8c03464 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
> @@ -10,6 +10,7 @@ PROPERTIES:
>                 "qcom,msm8996-cci"
>                 "qcom,sdm845-cci"
>                 "qcom,sm8250-cci"
> +               "qcom,sm8450-cci"
>
>  - reg
>         Usage: required
> @@ -43,7 +44,8 @@ PROPERTIES:
>  SUBNODES:
>
>  The CCI provides I2C masters for one (msm8916) or two i2c busses (msm8996,
> -sdm845 and sm8250), described as subdevices named "i2c-bus@0" and "i2c-bus@1".
> +sdm845, sm8250 and sm8450), described as subdevices named "i2c-bus@0" and
> +"i2c-bus@1".
>
>  PROPERTIES:
>
> --
> 2.33.0
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
