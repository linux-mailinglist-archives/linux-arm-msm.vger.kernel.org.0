Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63832642E22
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 18:04:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231756AbiLEREP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 12:04:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231649AbiLEREO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 12:04:14 -0500
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A2E1164AD
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 09:04:13 -0800 (PST)
Received: by mail-qt1-x82b.google.com with SMTP id y15so11851256qtv.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 09:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dg1xVh4Yg1L/k9vHsFFKZgYg91qTS9E3CTp05X8jmk0=;
        b=TJd0d9HabudjwWyvoLesW1BVBcITB9Q9zUWft0b3HcJtxPAnamy0K89l8uXLvB5pAc
         p7EtnqT2jYWr6t4Xk8lNZ+pU1ToZiJjU0Bo20UnbWgtROMa6BO/IHvySdlercKeUlXJg
         Wzojx1XXz6ok7gsZ/sa+VL0rxmCLhcnydOczjeQV0I0ZTt/iszOEZr1i6lpWvtZNB4ab
         a1b99Ri/rO4U0QSCEjxEHBqHqCBWQumfllPPCYDyAkuk7e+sflw+wqXoR/bOTOvzUoGh
         X6QMteK56trhN71CVbMrN3RB7bkGcHIF9neFnDBFAjZ4/OOlMFGhw3jWdNDu09f2c9Tl
         iWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dg1xVh4Yg1L/k9vHsFFKZgYg91qTS9E3CTp05X8jmk0=;
        b=X3L+vVjVk3IWxcXAauLgSTjU248C6dxGeGr4Lp4OixRoaPfD7zRZDlJLLLU8n/m3Hb
         BHBL5S/30L+ypb/yoLnKQZnCxxGK9F8v/Kt1z7BavbkDaw5k4RpRj6X8EftZvFMhAvA6
         KYHQsWi+hFwOcEy1X3+6//0i1fXf4TeuhDwOhXJyyVw+6pxIAzxK77Gmtcv/L2dt1JJn
         wqZSDGT+bdbfdZdiQECq8Enc6SoySB+Dvv9xgvWjtzyjCDz+mpYrPISEJKy3BrJ0yIBP
         7AXbnIipCLfGZ0tAjB6SnaIfeTwOUNLu3hELXiIdmjq+yOPR6BDbRISNsWS1PVT2F85d
         Qu8g==
X-Gm-Message-State: ANoB5pnJ9FqS4lLiceOmGY3/JpfBPyOy6xGhF84BS8BY51kaGbfLnuSK
        NXccLh0xcmKKqwfwUYe2NWE1uQ==
X-Google-Smtp-Source: AA0mqf4od8V3YTPvAvVMDByG40K1n3O0nac4Uc4oVdZ4v7LIdWVkwj4jQCHoN/cUTSTfOoMbcmQG4w==
X-Received: by 2002:a05:622a:258d:b0:3a6:5758:e24 with SMTP id cj13-20020a05622a258d00b003a657580e24mr57466319qtb.261.1670259852310;
        Mon, 05 Dec 2022 09:04:12 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id u25-20020a37ab19000000b006eeca296c00sm12322192qke.104.2022.12.05.09.04.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 09:04:03 -0800 (PST)
Message-ID: <cbc7894e-7de2-5c6f-5a52-739eaceeaa49@linaro.org>
Date:   Mon, 5 Dec 2022 11:04:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 01/16] clk: qcom: smd-rpm: remove duplication between
 sm6375 and sm6125 clocks
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
 <20221203175808.859067-2-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20221203175808.859067-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/3/22 11:57 AM, Dmitry Baryshkov wrote:
> Reuse sm6125's MMAXI clocks for sm6375. Also drop QCOM_SMD_RPM_MMXI_CLK,
> which is equal to QCOM_SMD_RPM_MMAXI_CLK.
> 
> Fixes: 644c42295592 ("clk: qcom: smd: Add SM6375 clocks")

Was there an actual bug in the above commit?  I only ask because
the "Fixes" thing to me implies that this patch is a bug fix to
be back-ported, and I don't think that's the case here.

Perhaps the MMXI/MMAXI duplication could be considered a bug,
but if that's the case please fix that separately (first), and
then reuse the same clock for both SoCs second.

Otherwise this looks good to me.

Reviewed-by: Alex Elder <elder@linaro.org>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/clk-smd-rpm.c   | 10 ++++------
>   include/linux/soc/qcom/smd-rpm.h |  1 -
>   2 files changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index fea505876855..077875cf0d80 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -1120,8 +1120,6 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6115 = {
>   };
>   
>   /* SM6375 */
> -DEFINE_CLK_SMD_RPM(sm6375, mmnrt_clk, mmnrt_a_clk, QCOM_SMD_RPM_MMXI_CLK, 0);
> -DEFINE_CLK_SMD_RPM(sm6375, mmrt_clk, mmrt_a_clk, QCOM_SMD_RPM_MMXI_CLK, 1);
>   DEFINE_CLK_SMD_RPM(qcm2290, hwkm_clk, hwkm_a_clk, QCOM_SMD_RPM_HWKM_CLK, 0);
>   DEFINE_CLK_SMD_RPM(qcm2290, pka_clk, pka_a_clk, QCOM_SMD_RPM_PKA_CLK, 0);
>   DEFINE_CLK_SMD_RPM_BRANCH(sm6375, bimc_freq_log, bimc_freq_log_a, QCOM_SMD_RPM_MISC_CLK, 4, 1);
> @@ -1140,10 +1138,10 @@ static struct clk_smd_rpm *sm6375_clks[] = {
>   	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
>   	[RPM_SMD_QUP_CLK] = &sm6125_qup_clk,
>   	[RPM_SMD_QUP_A_CLK] = &sm6125_qup_a_clk,
> -	[RPM_SMD_MMRT_CLK] = &sm6375_mmrt_clk,
> -	[RPM_SMD_MMRT_A_CLK] = &sm6375_mmrt_a_clk,
> -	[RPM_SMD_MMNRT_CLK] = &sm6375_mmnrt_clk,
> -	[RPM_SMD_MMNRT_A_CLK] = &sm6375_mmnrt_a_clk,
> +	[RPM_SMD_MMRT_CLK] = &sm6125_mmrt_clk,
> +	[RPM_SMD_MMRT_A_CLK] = &sm6125_mmrt_a_clk,
> +	[RPM_SMD_MMNRT_CLK] = &sm6125_mmnrt_clk,
> +	[RPM_SMD_MMNRT_A_CLK] = &sm6125_mmnrt_a_clk,
>   	[RPM_SMD_SNOC_PERIPH_CLK] = &sm6125_snoc_periph_clk,
>   	[RPM_SMD_SNOC_PERIPH_A_CLK] = &sm6125_snoc_periph_a_clk,
>   	[RPM_SMD_SNOC_LPASS_CLK] = &sm6125_snoc_lpass_clk,
> diff --git a/include/linux/soc/qcom/smd-rpm.h b/include/linux/soc/qcom/smd-rpm.h
> index 3ab8c07f71c0..82c9d489833a 100644
> --- a/include/linux/soc/qcom/smd-rpm.h
> +++ b/include/linux/soc/qcom/smd-rpm.h
> @@ -41,7 +41,6 @@ struct qcom_smd_rpm;
>   #define QCOM_SMD_RPM_HWKM_CLK	0x6d6b7768
>   #define QCOM_SMD_RPM_PKA_CLK	0x616b70
>   #define QCOM_SMD_RPM_MCFG_CLK	0x6766636d
> -#define QCOM_SMD_RPM_MMXI_CLK	0x69786d6d
>   
>   int qcom_rpm_smd_write(struct qcom_smd_rpm *rpm,
>   		       int state,

