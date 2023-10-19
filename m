Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E40A57CFC21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Oct 2023 16:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345906AbjJSOKR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Oct 2023 10:10:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345723AbjJSOKQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Oct 2023 10:10:16 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB3B130
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Oct 2023 07:10:13 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-59e88a28b98so7343337b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Oct 2023 07:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697724613; x=1698329413; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5wSys4rsbeW6TJksuzBXo91tDTJzxZoqvYBGXuczrwg=;
        b=yPt6+hyn0q8nRh+xJGcVVTd6aBELI925YFc4Hf7saH4IKPLVQO0j8whP6+fM9MGr5Y
         cF0sKckARWxNs6zAB9lHr0MX+N9cnuirub19j7P8mfSrqAoQhrgaPQpzdGFQT4GBhSIv
         Cpx+hP11MQRChRJhNywc2ufMs4f0N9OV862GbTOMzcuKInGUIMJy3GoISH3kdJiXN8/H
         ZnIYq+efp8nqF/j0cLhcilYBZslhCQnFn/YUGMbisQ2VuKq0BVeC10U2McOZXvvF/CTg
         qPldp3+qrQczWdenq+/hz1sEdM/eFFeJe/gyFUspYGiuvXzi8baps++qJof0YLrw9oTU
         cUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697724613; x=1698329413;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5wSys4rsbeW6TJksuzBXo91tDTJzxZoqvYBGXuczrwg=;
        b=r2tOcG5u6chATTld8z8cUqPB+AcWvaUYhQm5WcQv2gMy9jQUb7p7/0dCxlevj0eXgv
         o/yOLu+fw975DQTJlh7quTDD6ioT5v8GmcI++/IkOESzR+tfvCiM3nvJ0Ncn0gdQs9Ep
         soSTICq09z8LdsuXO7fSZhI9kymcUwtZSDZs3qmx7sEMFvaWbWudznbH6wHpQDVr0BkZ
         uZBl2qv/sKOYt9+UqMDsjyrL3E08MWT6c/BV3PJYS1mltUdmlpEOCL1IcvmcVsDv40+/
         fuh1eeJDGyRnb3BRjAeLtzs182oN0cuUqB7lJfGGktwswPgE8ou/HuGvv/6Mi7LF5M3O
         O5Rg==
X-Gm-Message-State: AOJu0YyemFXhfj8/ILQXf7AKGeku3sCuwaO5nuMUZPdF9aIpDYKlIfmQ
        xLjM7d2FarBRaGJ2a6oQdxSfmiluzxO2/wCwejQAuQ==
X-Google-Smtp-Source: AGHT+IEwlHRy2zOcM/DBgHA9BJNVulUDdOwJQE0MV7FcIHalKrDfpv+nVUZHKKrRg9DXCMmv+RzV1EjO/cCl4dw43LI=
X-Received: by 2002:a81:5251:0:b0:5a7:ba3e:d1d1 with SMTP id
 g78-20020a815251000000b005a7ba3ed1d1mr1315335ywb.25.1697724612881; Thu, 19
 Oct 2023 07:10:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1697694811.git.quic_varada@quicinc.com> <7369c6d5186d2b9b5f62a210878e9f864b57e11a.1697694811.git.quic_varada@quicinc.com>
In-Reply-To: <7369c6d5186d2b9b5f62a210878e9f864b57e11a.1697694811.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 19 Oct 2023 17:10:01 +0300
Message-ID: <CAA8EJprFcs471e6Jd6RZxBL4+cFdrvn2oOdsm+oN09A81iYoFA@mail.gmail.com>
Subject: Re: [PATCH v4 8/9] cpufreq: qti: Introduce cpufreq for ipq95xx
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, ilia.lin@kernel.org,
        sivaprak@codeaurora.org, quic_kathirav@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, Praveenkumar I <ipkumar@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 19 Oct 2023 at 11:43, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> IPQ95xx SoCs have different OPPs available for the CPU based on
> the SoC variant. This can be determined from an eFuse register
> present in the silicon.
>
> Added support for ipq95xx on nvmem driver which helps to
> determine OPPs at runtime based on the eFuse register which
> has the CPU frequency limits. opp-supported-hw dt binding
> can be used to indicate the available OPPs for each limit.
>
> Signed-off-by: Praveenkumar I <ipkumar@codeaurora.org>
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v2:     Simplify bin selection by tweaking the order in dts
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  drivers/cpufreq/qcom-cpufreq-nvmem.c | 8 ++++++++
>  2 files changed, 9 insertions(+)
>
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index f43e5cd..4f794ba 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -183,6 +183,7 @@ static const struct of_device_id blocklist[] __initconst = {
>         { .compatible = "qcom,ipq5332", },
>         { .compatible = "qcom,ipq8064", },
>         { .compatible = "qcom,ipq8074", },
> +       { .compatible = "qcom,ipq9574", },
>         { .compatible = "qcom,apq8064", },
>         { .compatible = "qcom,msm8974", },
>         { .compatible = "qcom,msm8960", },
> diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> index 0014909..d44be4e 100644
> --- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> @@ -166,6 +166,13 @@ static int qcom_cpufreq_kryo_name_version(struct device *cpu_dev,
>         case QCOM_ID_IPQ5300:
>                 drv->versions = 1 << (unsigned int)(*speedbin);
>                 break;
> +       case QCOM_ID_IPQ9514:
> +       case QCOM_ID_IPQ9550:
> +       case QCOM_ID_IPQ9554:
> +       case QCOM_ID_IPQ9570:
> +       case QCOM_ID_IPQ9574:

Can we please merge this to the previous set of cases (and maybe to
apq8096)? I don't see a great benefit in repeating `1 << (unsigned
int)(*speedbin)` several times.

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> +               drv->versions = 1 << (unsigned int)(*speedbin);
> +               break;
>         default:
>                 BUG();
>                 break;
> @@ -417,6 +424,7 @@ static const struct of_device_id qcom_cpufreq_match_list[] __initconst = {
>         { .compatible = "qcom,ipq8064", .data = &match_data_krait },
>         { .compatible = "qcom,ipq8074", .data = &match_data_ipq8074 },
>         { .compatible = "qcom,apq8064", .data = &match_data_krait },
> +       { .compatible = "qcom,ipq9574", .data = &match_data_kryo },
>         { .compatible = "qcom,msm8974", .data = &match_data_krait },
>         { .compatible = "qcom,msm8960", .data = &match_data_krait },
>         {},
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
