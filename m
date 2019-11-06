Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18007F1B6A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 17:38:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732193AbfKFQiV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 11:38:21 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40376 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727746AbfKFQiV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 11:38:21 -0500
Received: by mail-pg1-f194.google.com with SMTP id 15so17497326pgt.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Nov 2019 08:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:to:cc:user-agent:date;
        bh=vixhL9deqefE5oopP6BfzCyRk2tgLWnqZMgLkmD3lTo=;
        b=XH9LTRspkfNjaasAMtOzBr55zH/FRPUWjhw+WLwURBkz7uW7FrygrNmEmig3N8wf4S
         kaZuJqlDDWJrFSTgjt3rsWmlOO+GE3nuFP7KggnXom7hGcsujoB4iSmg2rHM6cGNFqJI
         2rOHvn557K8KcfeKUDnmkw66hYrtM1k+9WX1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:to:cc
         :user-agent:date;
        bh=vixhL9deqefE5oopP6BfzCyRk2tgLWnqZMgLkmD3lTo=;
        b=sZXHBT3JKVFvP521ATmyfFy6AtZLEeUjEuDm48B2g0b7YS3Jc5WlKPQQi0ThvBDUcx
         zEuyrJR/oDnoFyU6fWxeyCHAOFvysha3zsdNYIUZlsYJXsj2iZpzqfKLrahLuL3WSs02
         rK32oDFvwC1/fXDpzDfB/uxaS4lTcSuZLx33cUFX5AcyZlVS0quFHXjunIb5UTJSKqeQ
         VNH2xLflIaoKeKppIRo6Oi3sJdxgQjPJ5nFIMZpjxQ1aC5fHfXdVEA2ZpKNCgvXNDRV5
         qYMudBtzMuT9YNdvtfa0Gwuqt92IQ1YPtKQxCE3pJ0ewjVfTceVB+V0T3b1IeQ73ejub
         g/gg==
X-Gm-Message-State: APjAAAVmKLe3eZcSn45pWhv/1zjraUsGcAJoqkliZyj/fGTmO+jIX9fm
        k4ikU2/VdXmcYeQn8feXf4XoKA==
X-Google-Smtp-Source: APXvYqyaXPHoDuKFTssWM38U0rfI6iOm+3n/rJwChfcWnknMH41AGnK0V5cIdIJl7GeEFATCyZxg3g==
X-Received: by 2002:a17:90a:7142:: with SMTP id g2mr5059471pjs.36.1573058300477;
        Wed, 06 Nov 2019 08:38:20 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id x9sm3685058pje.27.2019.11.06.08.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 08:38:19 -0800 (PST)
Message-ID: <5dc2f6fb.1c69fb81.195ac.9fff@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1572931309-16250-1-git-send-email-kgunda@codeaurora.org>
References: <1572931309-16250-1-git-send-email-kgunda@codeaurora.org>
Subject: Re: [PATCH V2] mfd: qcom-spmi-pmic: Add support for pm6150 and pm6150l
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Mark Rutland <mark.rutland@arm.com>,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        lee.jones@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org
Cc:     rnayak@codeaurora.org, Kiran Gunda <kgunda@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Wed, 06 Nov 2019 08:38:18 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kiran Gunda (2019-11-04 21:21:49)
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt b/D=
ocumentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> index 1437062..b5fc64e 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> @@ -32,6 +32,8 @@ Required properties:
>                     "qcom,pm8998",
>                     "qcom,pmi8998",
>                     "qcom,pm8005",
> +                  "qcom,pm6150",
> +                  "qcom,pm6150l",

This seems to match the compatible list in the driver. Can you convert
this binding to YAML and then sort this compatible string list
alpha-numberically? Two patches, one to convert to YAML and sort and
another patch to add these new compatible strings.

>                     or generalized "qcom,spmi-pmic".
>  - reg:             Specifies the SPMI USID slave address for this device.
>                     For more information see:
> diff --git a/drivers/mfd/qcom-spmi-pmic.c b/drivers/mfd/qcom-spmi-pmic.c
> index e8fe705..74b7980 100644
> --- a/drivers/mfd/qcom-spmi-pmic.c
> +++ b/drivers/mfd/qcom-spmi-pmic.c
> @@ -34,6 +34,8 @@
>  #define PM8998_SUBTYPE         0x14
>  #define PMI8998_SUBTYPE                0x15
>  #define PM8005_SUBTYPE         0x18
> +#define PM6150_SUBTYPE         0x28
> +#define PM6150L_SUBTYPE                0x27

This list looks to be sorted based on id number, so just swap the two
here.

> =20
>  static const struct of_device_id pmic_spmi_id_table[] =3D {
>         { .compatible =3D "qcom,spmi-pmic", .data =3D (void *)COMMON_SUBT=
YPE },
> @@ -53,6 +55,8 @@
>         { .compatible =3D "qcom,pm8998",    .data =3D (void *)PM8998_SUBT=
YPE },
>         { .compatible =3D "qcom,pmi8998",   .data =3D (void *)PMI8998_SUB=
TYPE },
>         { .compatible =3D "qcom,pm8005",    .data =3D (void *)PM8005_SUBT=
YPE },
> +       { .compatible =3D "qcom,pm6150",    .data =3D (void *)PM6150_SUBT=
YPE },
> +       { .compatible =3D "qcom,pm6150l",   .data =3D (void *)PM6150L_SUB=
TYPE },

This is also sorted based on .data value, so swap the two here too.

>         { }
