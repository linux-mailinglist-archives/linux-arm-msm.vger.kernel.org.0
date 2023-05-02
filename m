Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1616F3F34
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 10:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233856AbjEBIgl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 04:36:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233845AbjEBIg3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 04:36:29 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74EC34EE3
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 01:36:24 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-2f7db354092so2060971f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 01:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683016582; x=1685608582;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SitD8eS7SmwIqmQF/UDh1viisJCwTcmFhILidSZ/5UM=;
        b=jC9GXy14GFLw2EtOc+bLiNCEQlBG2U8TLFM5J8u2Gvop1IqBdHVEuGN3rTi9izDKe7
         AwjhVA97/IBg0HP85XVpLtTxAD0KsOpv+iayfCt+XMn133N3MM3wlFrww4e9X63BjLZ2
         AfXRb1UiWMiygegKSXi1qvM/nQrMZVw50/8PKINn3mo5IAq7PJC/UnHsjrWaJqsYZfZ3
         yHJNdjciKFADeKHCV5xWyMLlhl8VwJhbWytwbCg35gDAM0tbx3escGTTM8I6cgbRcdDU
         gS23ijkDDwgVvQOsbVqUKmCeDJHMpwG2mGWXjPhMPzaW0ZVc+9iAETySkpRK8O1S6iDF
         AHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683016582; x=1685608582;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SitD8eS7SmwIqmQF/UDh1viisJCwTcmFhILidSZ/5UM=;
        b=ZiROw+XalxJSH39NNTxJg8xq3ESV8HVfTt8s33T4DZkH0KXRTH+irHLP/L8/x4Kov9
         SBonsih3vEC/S0NKjuTWyGaW/7hRWO4FnA6h5d8wLO4vrjdx3jKnM8dYtgGtgZYl0alh
         6j7qB6rrPAYwhloxQvf0gpdvOuBYTdGVLym2B/lraC9xfatTCkRv+pUhzJJg1s4eVSHS
         a3i1B5OKOsS2g2jb7JisUQWbmY+NUh9A69GKhLx+aRI27VmrETeDLK0GfHAzKHrmN4Y3
         Gct3zhpffLou2pcdKkKcr3fdmk7/kTUN/VDXHeDIKyjQJj0ofQT8th7VDAP7FpsDdArv
         2P9A==
X-Gm-Message-State: AC+VfDwb8CX8oBRrC5qpopi2uN7CB6Lq2Aeey1mqAWZawYBISruhoMJE
        BAV4HWhJzibOjgzt6iiSnL91VQ==
X-Google-Smtp-Source: ACHHUZ4+OfnVp1VWDA4+QwNGqWGHC+k/y9gMsuGjEaECxeOvtPJQuB666EEs5Kx0ayTvZnPoMoJR5A==
X-Received: by 2002:a5d:4e08:0:b0:2fe:2775:6067 with SMTP id p8-20020a5d4e08000000b002fe27756067mr11509118wrt.28.1683016582562;
        Tue, 02 May 2023 01:36:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e265:b513:556a:4149? ([2a01:e0a:982:cbb0:e265:b513:556a:4149])
        by smtp.gmail.com with ESMTPSA id r17-20020adfdc91000000b002ff2c39d072sm30282065wrj.104.2023.05.02.01.36.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 01:36:22 -0700 (PDT)
Message-ID: <7d724ebb-23cb-426b-e3a5-1f3e57c56d61@linaro.org>
Date:   Tue, 2 May 2023 10:36:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 06/10] clk: qcom: gcc-mdm9615: use proper parent for
 pll0_vote clock
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
 <20230501203401.41393-7-dmitry.baryshkov@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230501203401.41393-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/05/2023 22:33, Dmitry Baryshkov wrote:
> The pll0_vote clock definitely should have pll0 as a parent (instead of
> pll8).
> 
> Fixes: 7792a8d6713c ("clk: mdm9615: Add support for MDM9615 Clock Controllers")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/gcc-mdm9615.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-mdm9615.c b/drivers/clk/qcom/gcc-mdm9615.c
> index fb5c1244fb97..2f921891008d 100644
> --- a/drivers/clk/qcom/gcc-mdm9615.c
> +++ b/drivers/clk/qcom/gcc-mdm9615.c
> @@ -58,7 +58,7 @@ static struct clk_regmap pll0_vote = {
>   	.enable_mask = BIT(0),
>   	.hw.init = &(struct clk_init_data){
>   		.name = "pll0_vote",
> -		.parent_names = (const char *[]){ "pll8" },
> +		.parent_names = (const char *[]){ "pll0" },
>   		.num_parents = 1,
>   		.ops = &clk_pll_vote_ops,
>   	},

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
