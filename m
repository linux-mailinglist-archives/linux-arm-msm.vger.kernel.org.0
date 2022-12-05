Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F8AE642E2B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 18:04:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231923AbiLEREl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 12:04:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231149AbiLEREi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 12:04:38 -0500
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D75D318B14
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 09:04:37 -0800 (PST)
Received: by mail-qt1-x82e.google.com with SMTP id cg5so11837001qtb.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 09:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nh9KwaSUxyUVvW9NXvR+G5RIVUSK0RWSQlbrImVIjYw=;
        b=AHurxprRVpLFLHPRz9sBJyWavtPu9/Y4AfzqOuS3Heq9Tw+gQqCNsHhdLBlgUSvIes
         iXxRvKSAzCqVDau4FOh9/2+gfLXfHIIg7q/90GjLRb3qPK0GLHgtZS+jhchxsCp/W+H+
         mfNB7ExCEBEdS8gJtUDJ+GThE9EAq4qkuUMqAIpCCw06xVHW5TuslqR+Gjctr9p61qWK
         +/n7ns52EayCU0uK3tZPbQAGHNwp1BOf/89WMh+OJJXZraQWF30LsUSIJdXskQK9Rhb9
         0NcuvvcoJABcnSo8PDlgLLDVzlnX24J3M7c2gTxDpenIxcFTuhxOcJYbNtijrX5xWN8I
         nl1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nh9KwaSUxyUVvW9NXvR+G5RIVUSK0RWSQlbrImVIjYw=;
        b=OjiVNnMdCV6HlCLR5iTE+P2hgH1kXe20V9HOw9EEsQ9zfzGZYlGTwdmMz6VTFEp4Do
         qqi50IOeaiGvTDSlPDU+8eyclLF3/iFb2YtJDpl2xZ0P/+fz9Sb6SCeikgHND0xCFzC3
         cEnwEZiys1X2IICvye/Hjm9E/EG0T/Ygelh5zqswCaUeLBiDPKKoBMayRFcxcoByZH4R
         U/+RJz4OLJhqePntvhQv7qLRU4qtX8QT1l6uBQHNacRKSpbvYsT0z4PScBp52XkQRXZS
         uvu7vB2PmJEx/ObZCSgrNgdd0/mc8dg+0InE7MC97FHxr543xTXBi6wi3/1vpTjn+liS
         A+uQ==
X-Gm-Message-State: ANoB5pnyhXY8Yq5dOwDB6fE0fJOl2/mLRo0ebLAYG5qcnPviQvxjA1S+
        8YqcIvGvaWID0wQoU1ZCzFf08P2/g8ZgUBHk
X-Google-Smtp-Source: AA0mqf5cxqN11DjzDiWTK0ulqxQ7rgLxnqNrRukxRvWBg7aSQuZdIfeB+Jc9EfSbFTIwu8Ti6PYjmA==
X-Received: by 2002:ac8:454e:0:b0:3a5:10c2:9eed with SMTP id z14-20020ac8454e000000b003a510c29eedmr63584452qtn.562.1670259876866;
        Mon, 05 Dec 2022 09:04:36 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id cf16-20020a05622a401000b003996aa171b9sm9765824qtb.97.2022.12.05.09.04.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 09:04:36 -0800 (PST)
Message-ID: <2b443583-3d7a-184f-3331-bdd1c9d27a03@linaro.org>
Date:   Mon, 5 Dec 2022 11:04:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 05/16] clk: qcom: smd-rpm: use msm8998_ln_bb_clk2 for
 qcm2290 SoC
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
 <20221203175808.859067-6-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20221203175808.859067-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/3/22 11:57 AM, Dmitry Baryshkov wrote:
> The qcm2290's ln_bb_clk2 is identical to the freshly added msm8998's
> ln_bb_clk2 one. Use the latter and drop the SoC-specific version.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/clk/qcom/clk-smd-rpm.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 42d55bf35a33..6af0753454ea 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -1167,7 +1167,6 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6375 = {
>   };
>   
>   /* QCM2290 */
> -DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, ln_bb_clk2, ln_bb_clk2_a, 0x2, 19200000);
>   DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, rf_clk3, rf_clk3_a, 6, 38400000);
>   
>   DEFINE_CLK_SMD_RPM(qcm2290, cpuss_gnoc_clk, cpuss_gnoc_a_clk,
> @@ -1184,8 +1183,8 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
>   	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
>   	[RPM_SMD_QDSS_CLK] = &sm6125_qdss_clk,
>   	[RPM_SMD_QDSS_A_CLK] = &sm6125_qdss_a_clk,
> -	[RPM_SMD_LN_BB_CLK2] = &qcm2290_ln_bb_clk2,
> -	[RPM_SMD_LN_BB_CLK2_A] = &qcm2290_ln_bb_clk2_a,
> +	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
> +	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
>   	[RPM_SMD_RF_CLK3] = &qcm2290_rf_clk3,
>   	[RPM_SMD_RF_CLK3_A] = &qcm2290_rf_clk3_a,
>   	[RPM_SMD_CNOC_CLK] = &sm6125_cnoc_clk,

