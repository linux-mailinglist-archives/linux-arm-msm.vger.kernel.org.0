Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 262776FB560
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 18:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234235AbjEHQks (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 12:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234139AbjEHQkn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 12:40:43 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25C3B7289
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 09:40:25 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f14f266b72so3054034e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 09:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683564016; x=1686156016;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aUxn30nI2JC2NtHSud7ubjIIo2ZFwZw2vxazxJv+hlE=;
        b=A2H6+EZETU19uZp9uxVwu4SLkeNRyo0WdTduVSE/23Ny5M9vHuZs88iS3TfkWjq/Kx
         hLjp1IsETrANWQxedB2rfqB91hzKz4iy0TPDwJVUKyMlabSFfq6tegZC4hlH/1YZEvxx
         fZ+k5zOCLujASQLnt1AoVOPj73CVRGdZ6MkS5FvlZg17+DITlJnJhd89drvazuYV8pTP
         V3Mkqur6AYVFFJAw/O7SZD3oykGJUbzQ8u0+qIgPntINVazYreG9ZPCAHgsdUU1US0PC
         lGKKMZKK0QdZEFNp3hU+iQL/gLdNpNCUo1edloWE2we+tC2YlabQgTFpnEESV15Y0+pF
         eivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683564016; x=1686156016;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aUxn30nI2JC2NtHSud7ubjIIo2ZFwZw2vxazxJv+hlE=;
        b=F1i1cTx3kZSH49eWT+4XN5U2huPrPH7QRrSHwtnHoS/NyS2osyQhyMmSZ+x7kNWrZA
         XwMBNFUcSriWU60kOcb+70+TQiWKPfn2P4r0vRxrcSEOWRKzzJ+NEKGSbEnNnjlqsp+1
         aVEqVMulrCpxwt3OjvlgEJwbt3WsP+0dyrBnkCWZdejEQiecDk2jgxyT+DsxcRf6Sk5m
         MtckzOjpECN6qQ2xUZH3xuNFkI330CAPcu8J8w7OOn7atFgdXwGeDK0Hcv32y1/BtCB3
         bkomf4TRCyiw+2dTTISyNlW2HS6E+7a0PwDiJPus1Zk1Ikd5qztgAsR9CIrayNkv2sRs
         QOWQ==
X-Gm-Message-State: AC+VfDxhiZBnrG2uq7D/wVktb+V3m4VUcG7njfCXH6nRoDysnL3BDZc5
        NVJv6RtglavqXPjr/vBVX3F5Ow==
X-Google-Smtp-Source: ACHHUZ6u7+V88g+UMiDYJc3ekgTOxbHHa+oqE7nsNuFqFyqBCSf8uLTqkAINz7xlB87R6Q38suZyeg==
X-Received: by 2002:ac2:52b0:0:b0:4ec:8b57:b018 with SMTP id r16-20020ac252b0000000b004ec8b57b018mr2670653lfm.33.1683564016101;
        Mon, 08 May 2023 09:40:16 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id y11-20020ac255ab000000b004efeb7776d3sm37000lfg.278.2023.05.08.09.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 09:40:15 -0700 (PDT)
Message-ID: <bd57675e-fe80-b5ea-cd21-46bc98e45c3e@linaro.org>
Date:   Mon, 8 May 2023 18:40:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] clk: qcom: gcc: ipq5332: Use floor ops for SDCC clocks
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>, andersson@kernel.org,
        agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230508163145.9678-1-quic_kathirav@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230508163145.9678-1-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8.05.2023 18:31, Kathiravan T wrote:
> SDCC clocks must be rounded down to avoid overclocking the controller.
> 
> Fixes: 3d89d52970fd ("clk: qcom: add Global Clock controller (GCC) driver for IPQ5332 SoC")
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/gcc-ipq5332.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq5332.c b/drivers/clk/qcom/gcc-ipq5332.c
> index bdb4a0a11d07..1ad23aa8aa5a 100644
> --- a/drivers/clk/qcom/gcc-ipq5332.c
> +++ b/drivers/clk/qcom/gcc-ipq5332.c
> @@ -963,7 +963,7 @@ static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
>  		.name = "gcc_sdcc1_apps_clk_src",
>  		.parent_data = gcc_parent_data_9,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_9),
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_floor_ops,
>  	},
>  };
>  
