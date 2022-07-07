Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DF0956A9E3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 19:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235575AbiGGRmN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 13:42:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236546AbiGGRmH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 13:42:07 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2B005A46E
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 10:42:06 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id k14so23791119qtm.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 10:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vv9i38kg+fZeAJ7hqAo2VB2KqkjfsYGrDA3FFmrUc/U=;
        b=nGJKwqkdu04XUH4SZYsLNK9X56CGdKbgIGS66CcXLzJa5h1VDaa6NBNR6EEL0tYrEx
         CEbsVouP6BNnKZNyoA9LlFvDGAeAf7hQaVOLKH85tGpxmnyEd3bgjFSBmyMrv193R4id
         ZO3ld6KEedmqKL+K2xHzeM9tJL6tQ6PPoE2HaIUZphRZgaZMTvW9AGiS5e2EVvwd3HG5
         yPXQxfJ8yXj5HpceIOpjSOZxZwMbFGRPbh2/mCAmyviOTmEFcEge2CkyJCLzBEURvtcl
         QKD0teWYqvM7l0xjkKXXU4aiXMe/bnEGmjvSzZcqQQ/Te7K1W89gKAqpXH4x5qjBv+GN
         37Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vv9i38kg+fZeAJ7hqAo2VB2KqkjfsYGrDA3FFmrUc/U=;
        b=bD+AkS1lskk8LHNgAMrqfK2KsN/9sdZB2Zz9ZNZPY+EaT7uLnKfY6k2kEjij2XVmrO
         rvKb9eBEf64AjQcfxHbgpcvalc5SgHH8WtK5ZZqlHaoj5ZAXq8Xo1EcBfs2AlyQPB8uq
         qj9ppH0BoS2TNRkDnlVZ56mzVDXbNNhRCiVL/OzovCRjox4oaRMG+dcP/S0wN+JTyzB+
         2ZpzzdC3xfgF1mIQAOP3mqLgwnW5Tr38kg3BQArjpd0N9m0ofdoiSxhcDjC82BXPfA1m
         cmrSIHCoLx3uepWnniMLq1W23cBGphtXybYasXWR2NVTGnsn1MCnni3VsfaowDxwNRcq
         My7g==
X-Gm-Message-State: AJIora8DD0ihV7/x7ZZ+GPPdlq2zRdCXZbcd4gtTOjR02ZvUQl7Po6xy
        nUm4tY/pPk/eMRWlTf211Mh11iM4PmIgc011pMG2Tw==
X-Google-Smtp-Source: AGRyM1vi2PU2UFHA1bbJtZ+VIokdk51mrbiey/LFa2NNo25BKlWAnYxx7qnjESNphQN4G90Y+Jk5ZsZ75wSx1ZwA5SQ=
X-Received: by 2002:ac8:5c96:0:b0:31a:c19a:7da1 with SMTP id
 r22-20020ac85c96000000b0031ac19a7da1mr39039363qta.62.1657215725748; Thu, 07
 Jul 2022 10:42:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220707161014.3178798-1-bjorn.andersson@linaro.org>
In-Reply-To: <20220707161014.3178798-1-bjorn.andersson@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 7 Jul 2022 20:41:49 +0300
Message-ID: <CAA8EJpoZ4WKALrvtCtfHNTJ5FDBk-Qy=Mr4TNr8qfcc8=hSMjQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm SC8280XP providers
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Vinod Koul <vkoul@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        manivannan.sadhasivam@linaro.org
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

On Thu, 7 Jul 2022 at 19:07, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> The Qualcomm SC8280XP need the global clock controller, interconnect
> provider and TLMM pinctrl in order to boot. Enable these as builtin, as
> they are needed in order to provide e.g. UART.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index d2615b37d857..8e44f6a2172c 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -541,6 +541,7 @@ CONFIG_PINCTRL_QDF2XXX=y
>  CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
>  CONFIG_PINCTRL_SC7180=y
>  CONFIG_PINCTRL_SC7280=y
> +CONFIG_PINCTRL_SC8280XP=y
>  CONFIG_PINCTRL_SDM845=y
>  CONFIG_PINCTRL_SM8150=y
>  CONFIG_PINCTRL_SM8250=y
> @@ -1056,6 +1057,7 @@ CONFIG_MSM_GCC_8998=y
>  CONFIG_QCS_GCC_404=y
>  CONFIG_SC_GCC_7180=y
>  CONFIG_SC_GCC_7280=y
> +CONFIG_SC_GCC_8280XP=y
>  CONFIG_SDM_CAMCC_845=m
>  CONFIG_SDM_GPUCC_845=y
>  CONFIG_SDM_VIDEOCC_845=y
> @@ -1266,6 +1268,7 @@ CONFIG_INTERCONNECT_QCOM_OSM_L3=m
>  CONFIG_INTERCONNECT_QCOM_QCS404=m
>  CONFIG_INTERCONNECT_QCOM_SC7180=m
>  CONFIG_INTERCONNECT_QCOM_SC7280=y
> +CONFIG_INTERCONNECT_QCOM_SC8280XP=y

= m? I see other SoCs build interconnect drivers as modules (well,
except sdm845).

>  CONFIG_INTERCONNECT_QCOM_SDM845=y
>  CONFIG_INTERCONNECT_QCOM_SM8150=m
>  CONFIG_INTERCONNECT_QCOM_SM8250=m
> --
> 2.35.1
>


-- 
With best wishes
Dmitry
