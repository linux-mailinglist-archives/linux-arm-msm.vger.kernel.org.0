Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C4717DA712
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Oct 2023 15:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbjJ1NGm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Oct 2023 09:06:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbjJ1NGl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Oct 2023 09:06:41 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 627CCE3
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Oct 2023 06:06:38 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c5071165d5so5131381fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Oct 2023 06:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698498396; x=1699103196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nEJnk1mY1BYpzs+s+eajZKkTegA51coEw5OM/X1PGos=;
        b=BIFtZzJ+pF0nEBZWK/sXQdVbx0VShfU4k3OswHflU+vcd8zbvSAuVS+M5M1TOUIHUA
         AZ+/nCwEgGQewfWoks/mo8Ju42QES9oHcBLXgNo0EflBM+B3MBb/w0HOUxckoWDbhtvJ
         K2tnJmQt45yuubQFoQNlyI2zlhVu8iD+fmk19w3E5gTCeTPbwM6UOkgLlEa4/Pn7LfDM
         fh4RfY6m2X2lW9AsEKgekCQzFliPT2uP3IKmNbZffryRpZ5/rc7L8mthceMHdA2P7eia
         chntQO+I6T/6uY/adXwOQsxVPcuZuj2uBwiZQjYP/jgFQdxyCRRezPiRumWM5Gw3qVOp
         oFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698498396; x=1699103196;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nEJnk1mY1BYpzs+s+eajZKkTegA51coEw5OM/X1PGos=;
        b=fuubTWHVPGVgRYcFJwy/t182Sxtw7nzBu9JoLNeGbeUXRAvC/j0K2jFa/1V9d++o4e
         NUG4MxNA770D+gEPI6ElxCBCRqAuJnkTLckr36P6kqP6NYBeNYMkWu1dICvIAkOG1SI8
         yaIVd5sbD3nXHo9XNc4ZduSuBFknO2b+DZhnnE54TS/a3JthjfHXNi2ZIk8J3wpQVRPX
         6nFbXSwYWZYCxHV69dN9EYqDOJlDlLa7g+16dy9EOb1h4aIWD12NSwGP5KlrJB7HAUgR
         0+kLOzMnKa1O0FdcLnm+kdqxV/WKeFoU91+fTf8+M43ZvxA+AziIdSmI32marV2H87N1
         bCJQ==
X-Gm-Message-State: AOJu0YzxUp/DrZm/j7pXpXLozTEuZZ5Gaiolg7YoMCaZ1Iq64k7VjHep
        Aq882qnaTmJ9g71Gk+t99/bGxg==
X-Google-Smtp-Source: AGHT+IGguaRgN4UqqIPRwe20wpwSRSo/M+SCxM/3uc39zLsAzkNVAY4Tr7oBmpFypqAlyqKOlyRklw==
X-Received: by 2002:a2e:bc81:0:b0:2bf:f32a:1f68 with SMTP id h1-20020a2ebc81000000b002bff32a1f68mr4550182ljf.19.1698498396559;
        Sat, 28 Oct 2023 06:06:36 -0700 (PDT)
Received: from [192.168.130.123] (178235177183.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.183])
        by smtp.gmail.com with ESMTPSA id z21-20020a2e8415000000b002b6ce8b0dd6sm618828ljg.75.2023.10.28.06.06.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Oct 2023 06:06:36 -0700 (PDT)
Message-ID: <2f8672a3-1ce4-4f8c-a472-3a1ad09e9214@linaro.org>
Date:   Sat, 28 Oct 2023 15:06:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-msm8939: Fix mclk0 & mclk1 for 24 MHz
Content-Language: en-US
To:     Vincent Knecht <vincent.knecht@mailoo.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Stephan Gerhold <stephan@gerhold.net>
References: <20231028120756.316574-1-vincent.knecht@mailoo.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231028120756.316574-1-vincent.knecht@mailoo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28.10.2023 14:07, Vincent Knecht wrote:
> Fix mclk0 & mclk1 parent map to use correct GPLL6 configuration and
> freq_tbl to use GPLL6 instead of GPLL0 so that they tick at 24 MHz.
> 
> Fixes: 1664014e4679 ("clk: qcom: gcc-msm8939: Add MSM8939 Generic Clock Controller")
> Suggested-by: Stephan Gerhold <stephan@gerhold.net>
Reported-by?


> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
