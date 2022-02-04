Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4D354A9831
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 12:06:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353208AbiBDLGX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 06:06:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244242AbiBDLGW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 06:06:22 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54CA4C06173D
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 03:06:22 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id d5so5157095pjk.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 03:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u+mYL+VzywIVH26wS1HSxqDrA1tNqxXc8JG+oEDOr+8=;
        b=yhRDisL7/XY+wHS0fCkXmr0aYHrSarzzvh9s2j7O8Za9jVx0OzhyRofVwMqUGNcwMw
         NbRZoMK0Cw6uLjIiUQDidP7EhZgKhPuOmvuKV/SsAQM53lTEGzytHR2FpzZ57pz3g/xo
         j0eCfuWSCSjdXySTchww4Di6ZW1rCJDNpcIC48mYsAxAxEJz3frfb102UVeFyV/yTUyE
         UQ5o1TiJ7F9ANqb59ldrG83GxXHlXf+OCrT3pF0lgiVEsTM7m74qHlTCmuqIqkkgN/iF
         788piO9ip9CBrV/l5iGKJZ/N8VgNE/NDJ2ZM7nL3l5+OdwFMubrybaqylZHWSWdrH+55
         gM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u+mYL+VzywIVH26wS1HSxqDrA1tNqxXc8JG+oEDOr+8=;
        b=Rl2T/PAAyGx3F3kS7+KQVWbizy+IIpDMM4cZiFwbAqvCHTog5e6Rl9czBjF/cSrtUt
         QtGRrMPbiA0vQR1UdVZqvkW8s9h1pKT231+uNJqHhSFk+VTg/cceaMv65Nf2JAz3A1G9
         DKvDYQ1sMevokGyrZkwdzfC0YLHmNC7WzaVXiAksAGOYfz9I+gLQAMfbBigfxS6/eWN5
         SDkWEM4Ol5b41wF0VmZlYiM7fSPvCGzy1STp4ndQlZwM/QDmTWG3hQp1gXMiKWVhjM4a
         C4k+4TXdU40IhtHx+ofliW3vY3SMNRdbGLAGfLnnto+Gu4VN9WtgkXf+SdnOkeIAxIQe
         4yxQ==
X-Gm-Message-State: AOAM533sKVtLc/bhHYM09iq06oDLzrfqpvqW44ZcYJn36vcIXmlVzn2W
        WalH+xcgmAf98/OcXDEFupSgdpi1YBFdgh9VAt7Qbw==
X-Google-Smtp-Source: ABdhPJye2EDtOdfXqiaul0IQT95mWq+ySddR6CuIfiNMAjJY8THJkrzwSprn0HEScCiK/lI4uJlCQO2+CmuXjmkcx6s=
X-Received: by 2002:a17:902:d355:: with SMTP id l21mr2632623plk.117.1643972781751;
 Fri, 04 Feb 2022 03:06:21 -0800 (PST)
MIME-Version: 1.0
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org> <20220203164629.1711958-3-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220203164629.1711958-3-vladimir.zapolskiy@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Fri, 4 Feb 2022 12:06:10 +0100
Message-ID: <CAG3jFys6V3TD3g8xDb1qzkGCiMj_Rxxq3wBkZL9fBjPx5VfxZQ@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: i2c: qcom-cci: add description of a
 vbus-supply property
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
> Quite regularly I2C bus lines on QCOM CCI controller require an external
> pull-up to a regulator powered line, to be able to define all such
> cases an additional vbus-supply property of a bus subnode is wanted.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
> index 924ad8c03464..9f5b321748f1 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
> @@ -60,6 +60,11 @@ PROPERTIES:
>         Definition: Desired I2C bus clock frequency in Hz, defaults to 100
>                     kHz if omitted.
>
> +- vbus-supply:
> +       Usage: optional
> +       Value type: phandle
> +       Definition: Regulator that provides power to SCL/SDA lines
> +
>  Example:
>
>         cci@a0c000 {
> --
> 2.33.0
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
