Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8350C5BF813
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 09:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbiIUHp5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Sep 2022 03:45:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230380AbiIUHpq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Sep 2022 03:45:46 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0D425466A
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 00:45:41 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id h130-20020a1c2188000000b003b4cadadce7so7199973wmh.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 00:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=5cpInqoG3x+IAk5vorvPbH/PElE/ouCLNe7ZAtx1pPs=;
        b=WIxmlFmNBvT0rtC00lXHWR4E1Qht2lnwWz63fli9dFHQMBBxmbfOgXJ5jSSYsATKh3
         t4AVRc9t2EF+7lo/qBX1jRQ1wj5RtE1+JNVxCYpdEZY/HsnqpQGSE7ngHSsvErRZl5Yh
         WQKMtcsxZq20K9ua3SgwpMeVC8Tx1qR1Hr2Zun4HJY0b+6y3rldm3RvdyOg2Z5eYwNuM
         TH5sxueYp0ZeR7Z7uNXVD6c9prEI+fE6uMeaJxsjZ/ulw2D/DIx9B4rtja/aFmDeQ+fX
         pfjdsSB2VltwsL2SsqUAdKI5Cai4TYWBmqNhtOmG4krTotpgeUhiKsOWCIpAT4rWeaKu
         3pgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=5cpInqoG3x+IAk5vorvPbH/PElE/ouCLNe7ZAtx1pPs=;
        b=dIZWPyaJi1czL1GiW2xjzICYoJ8JZgWK5Oo2owVhrmkY552xXknXCrPix6Pwyc4dnD
         QFwIEi/Vc37hY0BO9mWGiQlpDFORp1dAml4QigDP0n3nLhflXnuCY09Ek/NNvRMCQpgV
         2pkveKGQBE+QNU1iwZ3vmzC18/+O/bq987zh5ImeVAuJbAkePjiOQtqWj1blQKCYcZZa
         h67DESmwKp5ocfeZOgJIuCV1b1mXQ4C2dFo88sYfo/lqZj1HUcy9dPcX85TV0RA+htCw
         uJq88q+EVY+YwtASSELd3m0SYfCC6DMliK4HVbNLfhzmnvnAxC22gZGuX+4lQlBbUzV8
         6q6g==
X-Gm-Message-State: ACrzQf1j4fptsEukfvZSA062W64xn3LcbG8Cid9AXlpBdFRbsoLpYGgc
        5XVybqVwKnmj0362QzAwX5sz/A==
X-Google-Smtp-Source: AMsMyM630evwRJcz6k6l/8uu/aGwXtGyrag96h2lYQUq1WKPa0FtwZK3eowGYWP/ZmQdw5RagYg9fQ==
X-Received: by 2002:a05:600c:3205:b0:3b3:3813:ae3f with SMTP id r5-20020a05600c320500b003b33813ae3fmr5074315wmp.158.1663746340271;
        Wed, 21 Sep 2022 00:45:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8ce3:ff4e:ae9b:55f3? ([2a01:e0a:982:cbb0:8ce3:ff4e:ae9b:55f3])
        by smtp.gmail.com with ESMTPSA id q63-20020a1c4342000000b003b4bd18a23bsm1948055wma.12.2022.09.21.00.45.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 00:45:39 -0700 (PDT)
Message-ID: <06841d1f-840f-bc6a-0c20-21a31fdf89cb@linaro.org>
Date:   Wed, 21 Sep 2022 09:45:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] clk: qcom: lpass: Fix lpass audiocc probe
Content-Language: en-US
To:     Satya Priya <quic_c_skakit@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mka@chromium.org, Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_tdas@quicinc.com,
        linux-clk@vger.kernel.org
References: <1663673683-7018-1-git-send-email-quic_c_skakit@quicinc.com>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro
In-Reply-To: <1663673683-7018-1-git-send-email-quic_c_skakit@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/09/2022 13:34, Satya Priya wrote:
> Change the qcom_cc_probe_by_index() call to qcom_cc_really_probe()
> to avoid remapping of memory region for index 0, which is already
> being done through qcom_cc_map().
> 
> Fixes: 7c6a6641c2 ("clk: qcom: lpass: Add support for resets & external mclk for SC7280")
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> ---
>   drivers/clk/qcom/lpassaudiocc-sc7280.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
> index 5d4bc56..063e036 100644
> --- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
> +++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
> @@ -785,7 +785,7 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
>   	regmap_write(regmap, 0x4, 0x3b);
>   	regmap_write(regmap, 0x8, 0xff05);
>   
> -	ret = qcom_cc_probe_by_index(pdev, 0, &lpass_audio_cc_sc7280_desc);
> +	ret = qcom_cc_really_probe(pdev, &lpass_audio_cc_sc7280_desc, regmap);
>   	if (ret) {
>   		dev_err(&pdev->dev, "Failed to register LPASS AUDIO CC clocks\n");
>   		pm_runtime_disable(&pdev->dev);

Reviewed-by: Neil Armstrong <neil.armstrong@baylibre.com>
