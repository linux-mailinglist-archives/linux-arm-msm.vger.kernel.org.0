Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1078552493
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 21:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242530AbiFTTav (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 15:30:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239371AbiFTTau (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 15:30:50 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D78FE1C11B
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 12:30:49 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id t25so18800952lfg.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 12:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4FVWZ5RD6j0T2Oz4CkZsx11e2rZOpIesuz+EhC8MdRg=;
        b=MbUCCRU5DEOoziE4wlo9CXBSmyaZwaccLPzrC3aZa6M4LNES8QI+iVGPE7n9kWn1xr
         FlInSDeXNkWMJR7TYkuFA9bGny04rz853TIMRJL0vjAEBysKvO2qOO777nLwYYlk0Ged
         jugVJAJDoawma6KdVboL/15ypjCA1wzr4Xn9og9Da+DmcnJZyiV4tHNSkgP4/RqDUxo0
         Suri7F2c6BCq6t5gsvz5OlTsVQPVQ5re0ZZC30g+xMb8sFdWoupX+PxvN5YjGS1CGdu4
         6yqb+YdJsZQ6cudDnXMAIcknM7f6BiYFyzhadXb0gE/groQ5lW9lhcuSrGnlQn/MyZk0
         agbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4FVWZ5RD6j0T2Oz4CkZsx11e2rZOpIesuz+EhC8MdRg=;
        b=3+XsWECukZ1B6S5aNID4F7ly+2sU9itd/hTwfuzQOBmB0+NmulZpmGwp6Q56F+yqH+
         WMfxDu5ainb74ymuPhFWzmQttzPMVRF15fnjcjvX3CM2L1VY713R76WmweYZPBfuDpt/
         zk2E4WUDI1F999N23oUWpzEPjQCx4FjQOH2U7y6TJkS/+lvyt+jbSNGAoqpTu4qTIbXr
         EbiVGQs2PJmTMRwWd/zH1th4LILxEVACC8kbLfpLp7Dw7a34vlqEX8R04xuG/1HWSbPk
         ui0/1SjHzWCtC5k0eWaom3RkhLe+FZZCBdhGg9K2SCiKafrL9I7o+LOwx9LfnBrijwBL
         C7BQ==
X-Gm-Message-State: AJIora88wlV62gAxZLbh+VpDh9R6jtPqG6Z2rPSTe/FK7xZFFQVFjRQ1
        tW5seUI28qvndkfU/9JI8NvbqQ==
X-Google-Smtp-Source: AGRyM1uXYt5CRb9/0qaQTYLRAE5TNEoyPlRb7jf3bFWn+UD6F49KM7ZcWPEBO77nwZg6/8tmqZdWJA==
X-Received: by 2002:ac2:51a5:0:b0:47f:79a1:5c02 with SMTP id f5-20020ac251a5000000b0047f79a15c02mr1094804lfk.575.1655753448163;
        Mon, 20 Jun 2022 12:30:48 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e2-20020ac25ca2000000b0047255d21100sm1872617lfq.47.2022.06.20.12.30.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 12:30:47 -0700 (PDT)
Message-ID: <fa5c77c3-517c-32da-5d8b-ecfb9c898b92@linaro.org>
Date:   Mon, 20 Jun 2022 22:30:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 2/2] spmi: pmic-arb: Add support for PMIC v7
Content-Language: en-GB
To:     Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        David Collins <quic_collinsd@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Collins <collinsd@codeaurora.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        David Dai <daidavid1@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220201134108.2677578-1-vkoul@kernel.org>
 <20220201134108.2677578-3-vkoul@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220201134108.2677578-3-vkoul@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/02/2022 16:41, Vinod Koul wrote:
> From: David Collins <collinsd@codeaurora.org>
> 
> PMIC v7 has different offset values and seqeunces, so add support for
> this new version of PMIC
> 
> Signed-off-by: David Collins <collinsd@codeaurora.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # SM8450 HDK

> ---
>   drivers/spmi/spmi-pmic-arb.c | 233 ++++++++++++++++++++++++++++++++---
>   1 file changed, 214 insertions(+), 19 deletions(-)


-- 
With best wishes
Dmitry
