Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 137CA568CB5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 17:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232789AbiGFP0j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 11:26:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232943AbiGFP0i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 11:26:38 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5721237E3
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 08:26:37 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id j23so2175787lji.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 08:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Xkg95pf2VgwRCEJJEItSiXpYFy7ka5sRDOHSa/kP1po=;
        b=mgrR+AEEAcw5j44BbEiLZ5yHDnNtDmv5N6qWIh4n5Mbxgr+3tcKJ3VoEsK00oycHEw
         DnzgC5MSJQsdW/kJ06vYz3JSSkfjmi7NLedB8PG7MXoe6fZRiequJYnaOZRI8C/Sywz0
         zttq9pBZqa393fcFB1SXhCqB8QXOXd4RaalZ9pj/jRow6w8gPmkA2//SMlmaQWZWYEAZ
         x2TWZPJzGm24uxKTvmWCR/TiWPcKG+R1DhQybNvCvZ5U13IxqAoMQDtH2PUQb2rI2PnL
         Jt3HcEIeBu/ujBsRnQOLuspaaRidDGWm77OmiF/JiwgHUpKDBLfsoveeGtSL8MQVQeyh
         8l4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Xkg95pf2VgwRCEJJEItSiXpYFy7ka5sRDOHSa/kP1po=;
        b=wEA2vugqVTK+UcnMGTYUmSe8r9YvQYfjsi0vFxgi7UPzHyqaMHzgxwYn4+cIyfIL8B
         8UjRfRfBQuhG6ytfqcwTKcdbVc/HB0JNDdTPkZ9/AdE2nuVf364uDRGagEMp4pfW2fd3
         RfpZmK3LUUxRTJ9Lff3QDp7WL9YiPJlalzVSZrt73ll0uzbAOIcSG8iPDYVwpPtVQS63
         /0zPL1qovCNOZDQtEz5MV7uarSyYdDvzaHhhjA8sjDpcHoCbLwEuw07Ip33V1R0IxrEm
         VQa+n1RmqVkdtwzQeUmknsr3qZcoTMrAUvQJDYzwxP7KG6jpGIyNTPvYrkF8H7QHFu2K
         ai8g==
X-Gm-Message-State: AJIora8fOH9JxFJ+uVYLppwXPxVTXWISWyC6tv8oYIt01dAl/qL5kLXr
        0N3+dyOea1GoPiB2Gfe3EI1Qt6oMeVoOfXTX
X-Google-Smtp-Source: AGRyM1vEohigYJQajv6ZrgS0HOTAQ6UvdgByviYEQIksiR7xKJKaCrbXgkJuVmHMZ4cb05SlvkF+Bg==
X-Received: by 2002:a05:651c:19ac:b0:25b:db26:55c3 with SMTP id bx44-20020a05651c19ac00b0025bdb2655c3mr24348102ljb.457.1657121196196;
        Wed, 06 Jul 2022 08:26:36 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id m16-20020ac24250000000b00478fe690207sm6318651lfl.286.2022.07.06.08.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 08:26:35 -0700 (PDT)
Message-ID: <54e97d07-eee1-a775-5c7a-c3ba270dbfa2@linaro.org>
Date:   Wed, 6 Jul 2022 17:26:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: Add schema for MSM8909 GCC
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Dominik Kobinski <dominikkobinski314@gmail.com>
References: <20220706134132.3623415-1-stephan.gerhold@kernkonzept.com>
 <20220706134132.3623415-2-stephan.gerhold@kernkonzept.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220706134132.3623415-2-stephan.gerhold@kernkonzept.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/07/2022 15:41, Stephan Gerhold wrote:
> The Global Clock Controller (GCC) in the MSM8909 SoC provides clocks,
> resets and power domains for the various hardware blocks in the SoC.
> Add a DT schema to describe it, similar to other Qualcomm SoCs.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
