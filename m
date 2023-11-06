Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3C6E7E2119
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 13:16:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbjKFMQy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 07:16:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjKFMQx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 07:16:53 -0500
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30012DB
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 04:16:51 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5af6c445e9eso51451887b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Nov 2023 04:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699273010; x=1699877810; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EG5hPBkq6PdY2a7ADFXt5X7TvO05wy+79EbofVcknJU=;
        b=iVKi3UrYIKExlErMrrMt/p6fGWPgVTndPYFq5Ijsg1jAJorYt9P9uw9z5fZfhvH4h+
         eyhJ4IcBtyl3O2gVQJvDBKY/fX4mzoW978nG0isdTejvt2DUixctMT4ty4zPJn/w9cVF
         M92Vm+bgc62Nx+dQ/f87myQBMY+foYyBVxvjIFvciYmsfuEphpqapFyWSqgloISMJS/i
         SeGJHw0QpzDNQJ0vF9UwKDWmGjun24v6iVPdCfjQR3DSkYdDrBFXDqZ4GzeKhHvVE99x
         W+Jsx8jl1A0fnTEwIANY6kUWb5N7GoA+tgdT4vc8c9t661Lf2ob/uiVmdE5cFxh4ka9l
         Emdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699273010; x=1699877810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EG5hPBkq6PdY2a7ADFXt5X7TvO05wy+79EbofVcknJU=;
        b=S4xKFgS7SbKE/+kibCkY0YLEAJ2kY01tmWcaVhrxzc++v6GgFwc8Np/WZROzYmW1Ft
         GHiG4Qyc5lvXegl5/uH9dqWuY1Y/ETt/07JbBMxxQLX8jPZAjGQrtUwksrvR/t7hq8Ee
         bQkVWYcmaD25lmJwfTu5B52E9TM3WfLYPWT6t9ms2t748WcFM/9YUoNYqwcQEJ+7RScp
         +alCnzk1mzog2N3gZ3Z4rWGMlScytBqopzE4NTAc8G/S446gv912JTLap7NmoIo7zAlJ
         24q+qFz4xcC36CdxuZgXCfeYYEP3p1/8oFPVQqxN1CLq2ybM9pYBzp/YXHOqPZ1J66yK
         esxQ==
X-Gm-Message-State: AOJu0Yw1lvIi9fI6cgJ0QJpyyAk9nKuldDRmxTm+0hNe01UKgKfTt3QW
        kCUVe1Acmsko892vmwlIA1n/IN9jwS+IAOmvhiKaUA==
X-Google-Smtp-Source: AGHT+IG7dtNNGP1ku33ub7+LjOzGjTE/fFbQpbNgMJ2o1/7LKgwSis/m8AWYoCjq4YmlJ9tbh+mHzEnAH0AONcOeeAU=
X-Received: by 2002:a81:6cc8:0:b0:5b3:f5f8:c5bf with SMTP id
 h191-20020a816cc8000000b005b3f5f8c5bfmr11384244ywc.9.1699273010303; Mon, 06
 Nov 2023 04:16:50 -0800 (PST)
MIME-Version: 1.0
References: <20231106-pm8937-v1-0-ec51d9eeec53@riseup.net>
In-Reply-To: <20231106-pm8937-v1-0-ec51d9eeec53@riseup.net>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 6 Nov 2023 14:16:38 +0200
Message-ID: <CAA8EJpoSCVX=Pv1unN+oKzfT3RkwHkcEb5smEYufDP3TMBcDhQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] Add PM8937 PMIC support
To:     Dang Huynh <danct12@riseup.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 6 Nov 2023 at 14:11, Dang Huynh <danct12@riseup.net> wrote:
>
> PM8937 is a power management IC. It is used in various boards with
> MSM8917, MSM8937, MSM8940 and APQ variants.
>
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---
> Dang Huynh (8):
>       mfd: qcom-spmi-pmic: Add support for PM8937
>       dt-bindings: mfd: qcom-spmi-pmic: Document PM8937 PMIC
>       regulator: qcom_spmi: Add PM8937 SPMI regulator
>       dt-bindings: regulator: qcom,spmi-regulator: Document PM8937 PMIC
>       regulator: qcom_smd: Add PM8937 regulators
>       dt-bindings: regulator: qcom,smd-rpm-regulator: Document PM8937 IC
>       arm64: dts: qcom: Add PM8937 PMIC
>       soc: qcom: socinfo: Add PM8937 Power IC

It seems that some of the patches didn't get it to linux-arm-msm@.
Could you please check, what was wrong and resend your patchset?

>
>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |   1 +
>  .../bindings/regulator/qcom,smd-rpm-regulator.yaml |   4 +
>  .../bindings/regulator/qcom,spmi-regulator.yaml    |  19 ++
>  arch/arm64/boot/dts/qcom/pm8937.dtsi               | 202 +++++++++++++++++++++
>  drivers/mfd/qcom-spmi-pmic.c                       |   1 +
>  drivers/regulator/qcom_smd-regulator.c             |  34 ++++
>  drivers/regulator/qcom_spmi-regulator.c            |  34 ++++
>  drivers/soc/qcom/socinfo.c                         |   2 +-
>  include/soc/qcom/qcom-spmi-pmic.h                  |   1 +
>  9 files changed, 297 insertions(+), 1 deletion(-)
> ---
> base-commit: 12c9e8890929813dc852d9739f8d900ff51d9814
> change-id: 20231106-pm8937-000e423a75fb
>
> Best regards,
> --
> Dang Huynh <danct12@riseup.net>
>


-- 
With best wishes
Dmitry
