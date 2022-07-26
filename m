Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 323AB5817E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 18:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239536AbiGZQuc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 12:50:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239571AbiGZQu1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 12:50:27 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 737F8DFAF
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 09:50:26 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id b25so11379269qka.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 09:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v6fiai2ORHDoLkU5K/wKNboPXnBtSs2sVSBQu5udtH8=;
        b=JPyoipo6NZTWhNuXxhLQ0EXt6HxAt1ds0CIWfVDqHwDRcn+e/UfrrfWXJbvS9Lc+yY
         VidF1metGQ/i6zjSPVqKjNZhZxgGgKXzP5Z2EpD8wk/b1HorIPAgUEMcCEgcDJ93alvA
         zqQ2eXCHqGNzSxMvBomtWnxoPSC/cuxfCRENxzZWhcsXAAofAu2ydC6H7FohpWv0YkYC
         6Nrz2+1lidtj/QIZGg6bl/HdFre6fUBZMwPavDAtk8zHLwqDII9e+Zp4m/86I+Huzm81
         oN9ohQHgesozuArCe1M4jxBb5SZQwXzVWDsfhZbtUQu8NAiTtbOpiuLZ+yQuCqu2cLYR
         7thQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v6fiai2ORHDoLkU5K/wKNboPXnBtSs2sVSBQu5udtH8=;
        b=Z4hT2qJAQPsbMCJ9r2XmsKUFY5af0OUCvo72MoK+ld40YIxPOMLhdhfUeV4Q0Tdgbw
         19x1oARMT9RlMRBadcqfceqtD2JpYMJys/XbasoSWp15FxBJGJL/zq05l7kJRqsqdtGX
         M0zj20qSyhKzB01JkO+7b03AmgOpwWQW6oTVHUjyNWLuWYqADJSdxlPnuF8NtdPagPme
         UQayEOICOthsvYTzld4i0XfpJVdlVpnQFHfae2CzNWXrxWwgUGhBoil4v0AuKc9lDGHz
         oBocj78XLLgZGwwQckQKdEQDXC5gBQ/ing21BEHNHoQ/OWO/Edpp3525uQlqSZSxfjGY
         9rPg==
X-Gm-Message-State: AJIora+lVVlcrnciTKD4CeUBtYOapeTv0eZ2h6VKcpHK9kJmTiUGp4rb
        TcKqR5y3ERhbQBr85AnDoZqLYWPHeEwmz11pRpkXCg==
X-Google-Smtp-Source: AGRyM1sPGhged8wnB7ITz8Klbuw/69Ep09Q9EbwGdlJB0Jh6TOafX6w6YyPUS9Mo5rg4Qj5vV+Caks4TTcSsWe/USmo=
X-Received: by 2002:ae9:e906:0:b0:6b5:f0ec:ed92 with SMTP id
 x6-20020ae9e906000000b006b5f0eced92mr13650819qkf.59.1658854225579; Tue, 26
 Jul 2022 09:50:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220726150609.140472-1-krzysztof.kozlowski@linaro.org> <20220726150609.140472-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220726150609.140472-4-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 26 Jul 2022 19:50:14 +0300
Message-ID: <CAA8EJpoR0-OnxfEtWyhEiukT7yBe9rDjY00aTtiwXUNDWdqXGA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] arm64: defconfig: enable more Qualcomm drivers
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
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 26 Jul 2022 at 18:06, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Enable Qualcomm drivers:
> 1. Last Level Cache Controller (many platforms supported).
> 2. On Chip Memory - OCMEM (used in MSM8992 and MSM8994)
> 3. Subsystem Power Manager - SPM (used in MSM8916 and SDM660).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  arch/arm64/configs/defconfig | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 29d86eb839b7..eb9d48fedc0f 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1112,6 +1112,8 @@ CONFIG_QCOM_AOSS_QMP=y
>  CONFIG_QCOM_COMMAND_DB=y
>  CONFIG_QCOM_CPR=y
>  CONFIG_QCOM_GENI_SE=y
> +CONFIG_QCOM_LLCC=m
> +CONFIG_QCOM_OCMEM=m
>  CONFIG_QCOM_RMTFS_MEM=m
>  CONFIG_QCOM_RPMH=y
>  CONFIG_QCOM_RPMHPD=y
> @@ -1121,6 +1123,7 @@ CONFIG_QCOM_SMD_RPM=y
>  CONFIG_QCOM_SMP2P=y
>  CONFIG_QCOM_SMSM=y
>  CONFIG_QCOM_SOCINFO=m
> +CONFIG_QCOM_SPM=m
>  CONFIG_QCOM_STATS=m
>  CONFIG_QCOM_WCNSS_CTRL=m
>  CONFIG_QCOM_APR=m
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
