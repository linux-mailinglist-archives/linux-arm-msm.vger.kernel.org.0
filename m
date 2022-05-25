Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7517533D27
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 May 2022 15:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231933AbiEYND2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 May 2022 09:03:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233948AbiEYNDY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 May 2022 09:03:24 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B11FA5A92
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 06:03:22 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id p189so12446318wmp.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 06:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=SNO1m8U5Xj7Rbu3Wzqk6A1RHIHLARUnczB7VjexblOo=;
        b=WgUMz38IMdM3gHf+Kw9OI9iMxdfzp4N+gZ4iB9mT/DEaxKgJ6ERdPjEokKSnfFaQVp
         CEiN6D3OD278urpEMb9+i1Ecy9zdBPuPGcFWWfQYf1/eF7NUSI8999lAlgNTg1uvQpew
         IFjY7eOfMoZqzX9GAZBGpAaU9NzyDMFP58KRokMaNL5qWsnTq0NP6fluXmmDoI/eTSjb
         /3KHoCcNJdhIzs/Dgn0ZPPszMF0Smen7B0TVA2RtLSXizmFJ8Dk8tqent5Q0+/oGmNas
         2mOoX0fSXVx9+ztAxyFT1HpRUVFz4dnDRCI4xOlUuDxDcLQ4r3jkdPgxxIdi4q9tIOT1
         DrUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=SNO1m8U5Xj7Rbu3Wzqk6A1RHIHLARUnczB7VjexblOo=;
        b=mEo+SmYf2fbjYP7tZrCl4kSIYr/6h5EGgRNvsCbSA7fxWLezDAHN+ue23InDzIIzHJ
         KOXTS0utjgvmZTYNDbPfJAjkiONtEg62S+NVlC2CxmzBaMkvFjro32nWMykAZqVWTO76
         /CGw23qExcvHvX/GZsBOvaO2MCIsce7MRn1+IldZkUV/lNlyb5I4rE2sWOkk0itLAmD2
         SdfViBzscta6U3JE0uHBNcgBpf5CmBTBTy4FBUyNcRmfqH2hxEOE5JI5ZfNV03xHtZAL
         6PPcZG6b5/bzwPg2bvXfoeValOxecbVg/Ab92ZLeAcobXmT+m5rRiwCHreHIqlium84L
         4phg==
X-Gm-Message-State: AOAM531cRfV/qxQqX+3wJaFv5Q//woLfMgxtBsPKa18y0iWyThcDu649
        ONzICXQ1wvHgoHeXfyC74eBzG4C2flwUlLX5
X-Google-Smtp-Source: ABdhPJwXdCU0C5UhVtvR05q8q98D3UaG/PLio57u/H9iF2J5nXz1TeNIsQKAjN3zJgqdvfYfTSPKnA==
X-Received: by 2002:a05:600c:3ba4:b0:397:49b8:262 with SMTP id n36-20020a05600c3ba400b0039749b80262mr8104872wms.77.1653483801030;
        Wed, 25 May 2022 06:03:21 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n11-20020a5d598b000000b0020c61af5e1fsm2307098wri.51.2022.05.25.06.03.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 May 2022 06:03:20 -0700 (PDT)
Message-ID: <a59678f4-96ac-7edb-cfba-364aae396959@linaro.org>
Date:   Wed, 25 May 2022 14:03:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 0/4] clk: qcom: msm8939: DDR and system_mm clock fixes
Content-Language: en-US
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220504163835.40130-1-bryan.odonoghue@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20220504163835.40130-1-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/05/2022 17:38, Bryan O'Donoghue wrote:
> There a few omissions/bugs I found recently which are worth fixing up.
> The BIMC_DDR_CLK_SRC command RCGR points to a value off in the wilderness
> and should be fixed.
> 
> More interestingly a number of Multi-media peripherals are defined as
> pointing at the system NOC for their clocks, instead of at the System NOC
> MM.
> 
> This turns out to be not much of a problem so far because we currently
> aren't trying to set any of these clocks and the MM_SNOC clocks are derived
> from the same source as regular SNOC clocks, except they can vote for
> higher rates.
> 
> Bryan O'Donoghue (4):
>    clk: qcom: Add missing SYSTEM_MM_NOC_BFDCD_CLK_SRC
>    clk: qcom: add gcc-msm8939: Fix bimc_ddr_clk_src rcgr base address
>    clk: qcom: add gcc-msm8939: Add missing system_mm_noc_bfdcd_clk_src
>    clk: qcom: add gcc-msm8939: Point MM peripherals to system_mm_noc
>      clock
> 
>   drivers/clk/qcom/gcc-msm8939.c               | 31 ++++++++++++++------
>   include/dt-bindings/clock/qcom,gcc-msm8939.h |  1 +
>   2 files changed, 23 insertions(+), 9 deletions(-)
> 
ping !
