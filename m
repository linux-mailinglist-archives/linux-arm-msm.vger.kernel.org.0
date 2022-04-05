Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B48C4F4C03
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 03:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1575522AbiDEXIG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Apr 2022 19:08:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1573450AbiDETLI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 15:11:08 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C40C61C935
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 12:09:07 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id b188so53393oia.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 12:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=+2fqXM8JUf5DwDQtzJxsOwkBtwJFw5Gqvt+WmQEX/uI=;
        b=Veprx3ttQggks5cQbO8i0KUCPvNxmYkyfrcSQ+dlu3r2KMUxM/prPRRkNKK5FkgA2R
         c4CMJOLTqifeczv3jis31FaBbFJr2bIqERUgorEjNOU0V2V+N4ZvmF+nHzXQ5CnyEMc8
         RDmXuuwu8EOiCntCCDni1oO9KhooSgBPnYRIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=+2fqXM8JUf5DwDQtzJxsOwkBtwJFw5Gqvt+WmQEX/uI=;
        b=rlNJfb8EQBE1OHltboquwFqgSuNVOg/Qd0VKekuturDlZoep+bm5WNxD9Vj8Tb6WcA
         tH/Foi3qF/LrTKZBUsnDRF9Xp+imU6On6Q4GqoT3lsFBajZKul15r2cBGGJzFVJiX/zg
         Qgagy5LXjzE2+vamk5CTCqXMxoa9RD+UiWPtqjr+YQdDA94DseXEMbVBzyyP2iWx18vr
         kmxjCwygf3kFEG3mdMfweOAgmRS4gJ5cRaP5Da3da2H4JRazqtKgvumFMS8RA9txUSV/
         MLxlGZiDQX2xBw8cWUB6XzBusUzJpk09+QamcW3wlML7nVpsllObpR5h1Qf06hgI7Kp9
         oZ4g==
X-Gm-Message-State: AOAM533YXRs92b9pA8pD5LjFReWKemsUVpFWyYcggE34BPZgcdh4CPe0
        st5HsGdTVVzsD8lNdMMkoxd21zw7wgNytmixzAxGwg==
X-Google-Smtp-Source: ABdhPJxVQrIJEEsLECgeyAlKa1nOMAx8Ihqi51fqzaMW25crPXGyzU/YYh2XyyOqf5FeQzVxwuGnAmkOZ7o/RtTL9XY=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr1993155oie.193.1649185747131; Tue, 05
 Apr 2022 12:09:07 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Apr 2022 14:09:06 -0500
MIME-Version: 1.0
In-Reply-To: <1649166633-25872-5-git-send-email-quic_c_skakit@quicinc.com>
References: <1649166633-25872-1-git-send-email-quic_c_skakit@quicinc.com> <1649166633-25872-5-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 5 Apr 2022 14:09:06 -0500
Message-ID: <CAE-0n53G-atsuwqcgNvi3nvWyiO3P=pSj5zDUMYj0ELVYJE54Q@mail.gmail.com>
Subject: Re: [PATCH V9 4/6] regulator: Add a regulator driver for the PM8008 PMIC
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_collinsd@quicinc.com, quic_subbaram@quicinc.com,
        quic_jprakash@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2022-04-05 06:50:31)
> diff --git a/drivers/regulator/qcom-pm8008-regulator.c b/drivers/regulator/qcom-pm8008-regulator.c
> new file mode 100644
> index 0000000..0f6d5cb
> --- /dev/null
> +++ b/drivers/regulator/qcom-pm8008-regulator.c
> @@ -0,0 +1,205 @@
[...]
> +
> +static struct platform_driver pm8008_regulator_driver = {

Why isn't this an i2c driver?

> +       .driver = {
> +               .name           = "qcom,pm8008-regulators",
> +       },
> +       .probe  = pm8008_regulator_probe,
> +};
