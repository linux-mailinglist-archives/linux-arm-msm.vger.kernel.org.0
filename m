Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8690E645B51
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 14:49:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbiLGNtG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 08:49:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbiLGNs7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 08:48:59 -0500
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A72C5B5B4
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Dec 2022 05:48:55 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id r7so3501590qtx.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Dec 2022 05:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6alzpCND8T2LtSV6rP2BlM647xK/DjzMAVQYxHhXEtA=;
        b=YkNRT0qPeXhfBneMn1+wa3aIftmn/tuTbIYjc4qjX0llF/SUGZDyn//Hsr76uONJ8h
         zW1IKET89BNT+ypqE5KtvsAKRNmPu5lyUbFLxbM9ER6crY9erd8CaEGBxIC/P6GjASLW
         XfysyGlpwCkofV56WJVCFZwjnXYGqZOBHtdu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6alzpCND8T2LtSV6rP2BlM647xK/DjzMAVQYxHhXEtA=;
        b=lQ954A48bV2lhRT/X+JFfgsNAyEQ6fbJsQJoywTyH5EceDqxh4dFdZLkwmPZoZVB0G
         YQYIs+sB18DFLEywr0qJaD5BIyIYVgjz1WeucuDtUr2zxfsjl25pabn4ueEMk7bf+1PQ
         G0PKiw14wjmPRvIzPVLpdABRFJMyEN5F8D9I2sTYJfxgq4fXYnZbQZ/OFJw4yY4FmDsK
         A7udOjwe8/XLc7i9cH25QeU/UNpbWw/frKki+L8Yb/GillQS6lCX6kauTPgA+crkCvJH
         CS/QJiNbLsG571v/fQolWRdceWHeKIqGmo3FvIH8OVB6bwTTIMqd9bNPFG+0YZ55NLu4
         GM5g==
X-Gm-Message-State: ANoB5plp/FNBzy2yMqjMWYhCY6ObRdROZ+x/lFMBIz9RC9yP6l2eSH/X
        77gdyWHPRa258YVZPnxRUVJ4Pw==
X-Google-Smtp-Source: AA0mqf7UfXnLXcZbqYpblyrs1j8b93ACeZe9vzObJ91JoJO0mbZ1sTJjh8r0fLmKAtuH3mcEdmOvlA==
X-Received: by 2002:ac8:51c4:0:b0:3a6:8311:3255 with SMTP id d4-20020ac851c4000000b003a683113255mr32543198qtn.453.1670420934485;
        Wed, 07 Dec 2022 05:48:54 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id f10-20020a05622a114a00b003a68af60591sm13240387qty.70.2022.12.07.05.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 05:48:54 -0800 (PST)
Message-ID: <ed3ff080-cec6-724a-74c9-3c6224be03f8@ieee.org>
Date:   Wed, 7 Dec 2022 07:48:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 07/18] clk: qcom: smd-rpm: remove duplication between
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
References: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
 <20221207001503.93790-8-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@ieee.org>
In-Reply-To: <20221207001503.93790-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/6/22 6:14 PM, Dmitry Baryshkov wrote:
> Reuse sm6125's MMAXI clocks for sm6375.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/clk/qcom/clk-smd-rpm.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index add92ecd513d..024665438b62 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -1126,8 +1126,6 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6115 = {
>   };
>   
>   /* SM6375 */
> -DEFINE_CLK_SMD_RPM(sm6375, mmnrt_clk, mmnrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 0);
> -DEFINE_CLK_SMD_RPM(sm6375, mmrt_clk, mmrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 1);
>   DEFINE_CLK_SMD_RPM(qcm2290, hwkm_clk, hwkm_a_clk, QCOM_SMD_RPM_HWKM_CLK, 0);
>   DEFINE_CLK_SMD_RPM(qcm2290, pka_clk, pka_a_clk, QCOM_SMD_RPM_PKA_CLK, 0);
>   DEFINE_CLK_SMD_RPM_BRANCH(sm6375, bimc_freq_log, bimc_freq_log_a, QCOM_SMD_RPM_MISC_CLK, 4, 1);
> @@ -1146,10 +1144,10 @@ static struct clk_smd_rpm *sm6375_clks[] = {
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

