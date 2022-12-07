Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDA26645B49
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 14:48:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbiLGNss (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 08:48:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbiLGNsn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 08:48:43 -0500
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DAC454B08
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Dec 2022 05:48:41 -0800 (PST)
Received: by mail-qt1-x82b.google.com with SMTP id g7so4815660qts.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Dec 2022 05:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NzBRyLD561qmIWotQyudFLrHJSeS7EIDsYiZPKC19uo=;
        b=WlSEyPfgKxdZBKvH4LdeVsPz/hb3gsRN/OMZqG0zhp4g8yF3iglcAtoy2a3EbTKNLy
         ZbvPDlzof7NIen0zkkN7jXv1Q277VE1/Du/05SXux7yeUw7+Hg8PwU/Nv3cwqxuxwirU
         3O4dbnFOc9mymRR7soxSdi03Pl8EAsQiLf5wxNO3GIoW1Cc/fyGe+4VajrT4hcLObijJ
         i+7ry39SnWszBmZzcI7loDep9jTinFi+i/yC32AoWM8YevlkWRpNshLAnJ5i0aEDNj2Q
         dmoqQzqJV4+NBWuWF402tErim3XF1qQcvPBztzzZMTsZuafqILQ6UWECVY7pFjvhVTuq
         M3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NzBRyLD561qmIWotQyudFLrHJSeS7EIDsYiZPKC19uo=;
        b=00BD94EwmEz3ycSPObfG6+2gRm1Svwt4MCabkDmze7kiQluYtZwfKKS+LohDn1WMVx
         LR7VqxIt6Q7V69ZUKJkzMFPwxoHvEh6lHXbYtqIlAKOCf+z522tkWjcpAodkC6LOCPU4
         c3rdMruHF3LXVXz6PPZcLyP3BWf15blnK07JFNW6QbCWeHGNr53d7VCGj7y1pVW8q7tJ
         ftvzyMm58Sc+0yXi4ROl/idNBYtvjQ+cpWN+y61r81O0SCKrIb3qcfcuMAmv8KCjWXpV
         5XrzWsASnUPzLOvxxl2628VWaAPg2YC5Wntn8FB+h/vhYmX8VegwjpEP56gZyybTn9Lu
         4zcA==
X-Gm-Message-State: ANoB5pk96KTMU8LPnAqs1mny+EQrIGSwEWi1Kg8A17pZKFytYxQ+CVCW
        s88LO7FnVV3nYLLnks0acgY2gTkL/4cfgO/1
X-Google-Smtp-Source: AA0mqf6mGTngoW7IJNDdsF95b0xhcq7Ra7LVGdp5ULxgy1AnwEyOXzOxZN/aOiKC5lHw59s8MEDIeg==
X-Received: by 2002:ac8:70cf:0:b0:3a5:9e69:b8ac with SMTP id g15-20020ac870cf000000b003a59e69b8acmr68955183qtp.459.1670420920518;
        Wed, 07 Dec 2022 05:48:40 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id y6-20020a05620a44c600b006fa7b5ea2d1sm17472330qkp.125.2022.12.07.05.48.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 05:48:39 -0800 (PST)
Message-ID: <793fc25f-a5bf-8200-f468-22a6dad7e094@linaro.org>
Date:   Wed, 7 Dec 2022 07:48:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 01/18] clk: qcom: smd-rpm: remove duplication between
 MMXI and MMAXI defines
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
 <20221207001503.93790-2-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20221207001503.93790-2-dmitry.baryshkov@linaro.org>
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

On 12/6/22 6:14 PM, Dmitry Baryshkov wrote:
> The commit 644c42295592 ("clk: qcom: smd: Add SM6375 clocks") added a
> duplicate of the existing define QCOM_SMD_RPM_MMAXI_CLK, drop it now.

Looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

> 
> Fixes: 644c42295592 ("clk: qcom: smd: Add SM6375 clocks")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/clk-smd-rpm.c   | 4 ++--
>   include/linux/soc/qcom/smd-rpm.h | 1 -
>   2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index fea505876855..4947d5eab591 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -1120,8 +1120,8 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6115 = {
>   };
>   
>   /* SM6375 */
> -DEFINE_CLK_SMD_RPM(sm6375, mmnrt_clk, mmnrt_a_clk, QCOM_SMD_RPM_MMXI_CLK, 0);
> -DEFINE_CLK_SMD_RPM(sm6375, mmrt_clk, mmrt_a_clk, QCOM_SMD_RPM_MMXI_CLK, 1);
> +DEFINE_CLK_SMD_RPM(sm6375, mmnrt_clk, mmnrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 0);
> +DEFINE_CLK_SMD_RPM(sm6375, mmrt_clk, mmrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 1);
>   DEFINE_CLK_SMD_RPM(qcm2290, hwkm_clk, hwkm_a_clk, QCOM_SMD_RPM_HWKM_CLK, 0);
>   DEFINE_CLK_SMD_RPM(qcm2290, pka_clk, pka_a_clk, QCOM_SMD_RPM_PKA_CLK, 0);
>   DEFINE_CLK_SMD_RPM_BRANCH(sm6375, bimc_freq_log, bimc_freq_log_a, QCOM_SMD_RPM_MISC_CLK, 4, 1);
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

