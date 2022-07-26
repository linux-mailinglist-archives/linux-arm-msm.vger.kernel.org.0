Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6AB5817DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 18:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239239AbiGZQtb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 12:49:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbiGZQta (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 12:49:30 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41EC525E9E
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 09:49:30 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id w29so10840188qtv.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 09:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J9iOlh1Dhii5Np3jfo2VE9Dru0dmajNQ28sg/cH8d3Q=;
        b=y/VwiAHumvZrakGNzgS9ebJw0OfCeDs2vd6VmclbZb82HhBlk7cTYcK9A2gsheRaHh
         RgG7+NzXfq2RxxN85RFjghATZw+WBokGw3s863mC9Fk17sRCQqli6u79R5+2NsLgTxU1
         gK47ohGIEYXvTvo4f/Ops1bTKczq3juIzNfm+0mrIyBzQISGm1h2Dy+0OhCelURVaR8y
         kc5/m/zaplwVt6kaYy6PMgeBapt4txKpnVy94BHpl4AtRzJypUWbibpDlaFwTOD+1d4N
         mkvNJbtUiGuTckjCdOPQV2Ss9zKZ9JFLJLA0cO9gJNfknBfy+7Y4WUJoFf7Faohut3gE
         xJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J9iOlh1Dhii5Np3jfo2VE9Dru0dmajNQ28sg/cH8d3Q=;
        b=Qx47a106YV4B6/INj2P2t8y+kfoL2+16DCIWf5yb++mEP0jCDKzTFJuOSao6Opt8nq
         3yNERMaQlCR36dcJsnEqH6QZOI8AQjoNXweRTdOgPKQTeMY2lAPeahwgVScCd/rWAix5
         Sdu3WkGtVVTp4TH4x18G+ej8bqnF54kIO6dEPT9LEEk6OZxiJdAbwsyD/sVWzN0CgpRC
         r6pH0qTa+w4O4TzmKqoqsgRqd9HkcQVTfl3sqO7hSliMhmmBDaUIwIRI0C5IdnjXUvTC
         WaP9YWnUZ3JKZORL9u1wGfvA+zMwJ5VF3NHczKWSz255VFaOUVVM2sVodVJXZnn034zL
         X7Kw==
X-Gm-Message-State: AJIora/x898CqPNvWkOThWoz+tUx11wHKAGWmXbd+Y80xypasYSXuQQt
        E1ZlXAu2nef6G/63NY0uCSS5FEzu8wyfBVcGAdpSoA==
X-Google-Smtp-Source: AGRyM1v0qYiTrpjv6ir6sK69g+RCh1LkBveQoemsa1UTsb7ZbgWbO6CEs2u/LMIzICfVssnf3jSTbLQNGG3EHG5IvM0=
X-Received: by 2002:ac8:5942:0:b0:31f:39f6:aba7 with SMTP id
 2-20020ac85942000000b0031f39f6aba7mr7099948qtz.295.1658854169379; Tue, 26 Jul
 2022 09:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220726150609.140472-1-krzysztof.kozlowski@linaro.org> <20220726150609.140472-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220726150609.140472-2-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 26 Jul 2022 19:49:18 +0300
Message-ID: <CAA8EJppMNUV0eEF7BV6=7RgQK_XUEsqcLpmf_zu0XjSRLTLQ6w@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] ARM: qcom_defconfig: enable more Qualcomm drivers
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 26 Jul 2022 at 18:06, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Enable Qualcomm drivers:
> 1. socinfo driver to provide some basic information about the
>    SoC being used.
> 2. Remote filesystem memory driver (used in MSM8974).
> 3. RPM Power domain (used in MSM8226).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/configs/qcom_defconfig | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
> index 5cd935ee148a..f02448187eac 100644
> --- a/arch/arm/configs/qcom_defconfig
> +++ b/arch/arm/configs/qcom_defconfig
> @@ -247,12 +247,15 @@ CONFIG_QCOM_COMMAND_DB=y
>  CONFIG_QCOM_GSBI=y
>  CONFIG_QCOM_OCMEM=y
>  CONFIG_QCOM_PM=y
> +CONFIG_QCOM_RMTFS_MEM=y
> +CONFIG_QCOM_RPMPD=y
>  CONFIG_QCOM_SMEM=y
>  CONFIG_QCOM_SMD_RPM=y
>  CONFIG_QCOM_SMP2P=y
>  CONFIG_QCOM_SMSM=y
>  CONFIG_QCOM_RPMH=y
>  CONFIG_QCOM_RPMHPD=y
> +CONFIG_QCOM_SOCINFO=y

please add:
CONFIG_QCOM_STATS=y

>  CONFIG_QCOM_WCNSS_CTRL=y
>  CONFIG_EXTCON_QCOM_SPMI_MISC=y
>  CONFIG_IIO=y
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
