Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94FE97B4FCB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Oct 2023 12:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236454AbjJBKAL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Oct 2023 06:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236439AbjJBJ76 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Oct 2023 05:59:58 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A79FE1BD
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Oct 2023 02:59:54 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c124adf469so256397961fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Oct 2023 02:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696240792; x=1696845592; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gncSwMFcnYXO7+yoToF5ZtSRBM43wttJi1puoOarBO8=;
        b=PttmKga6TolJPvDy0ubLRZSyRqdEMzisAvJSNECvgZPvoIO2E0ny9Z/3/aErH0lWd9
         0oywHwqEXW4TnupH9uCN/gDZJxJt6z1bPWxef/FNInN7pcOS3R9nXMb3y1a+VjSKLBon
         Kyhh/2QNyipkTfOuLznl/GhY2vzlkYuFJceYqmx5uQYlORC/hXtiLqt8mzvVQl6ofe9w
         Gv2NYUndhKQu/fJltp6vYcGasnDvldI2UCqcTalk5GtZxeBRayEDJMRDfTNYqgn8qWHw
         ZiSQXIjoAM7slZLg2Bk0Yq+NOs7fuMK9pyjKA4pFTfMYiMi2Rcs7pC/gdlo7sh+xbgwW
         s6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696240792; x=1696845592;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gncSwMFcnYXO7+yoToF5ZtSRBM43wttJi1puoOarBO8=;
        b=E2JUDyX2+HSDcK3aaNHtjfKdeBMtBF1DPc/EfNv+Z6Ap8dssR2VQnWZ5Jf9EkrpLBM
         VEQFXLhdcGqYvTlwCGMISYO+NV4uvz2Mc3QPfTQIwO59ej6HAIs56UwcB17kSYiy4SlJ
         Svasq4Pu0b/3Psua/2O5nc4Wvkso8F/yGsnwrA88nX5yQBO32q9wxNzZAqvDwTHbFpZh
         R9lOfwrAqMjyH1wlbzzXpvsvZEr+8D+NDgs9v/MJnmHkhAk3UlPmdpqSZdCmmR6rUhpo
         oEHLWCBSCmNaqIy3wrL7y84cKGxVCPgU3DSYaDK3DnaB9AawfLifigGMnxHIwcsOZS8u
         ya1g==
X-Gm-Message-State: AOJu0Ywij/MkzmX1WeYVK+RrKv3ralgAdxMs84YZQNs0j4CVAeGWnkQ6
        s+TfPhRDvWVyFD1jzTZ/COzN7Q==
X-Google-Smtp-Source: AGHT+IFz07CTiTCLL4SudGLfq1adSM4kx0/HChfGtNHaieGodNY70bP9DLTgXQIlbFpVa3dWg4MuFw==
X-Received: by 2002:a2e:9cd5:0:b0:2c0:afd:e7ed with SMTP id g21-20020a2e9cd5000000b002c00afde7edmr9715892ljj.10.1696240792512;
        Mon, 02 Oct 2023 02:59:52 -0700 (PDT)
Received: from [172.30.204.164] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id k25-20020a2e2419000000b002b9f1214394sm5226754ljk.13.2023.10.02.02.59.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 02:59:52 -0700 (PDT)
Message-ID: <a1dda0c5-e394-a66a-327f-77f534590134@linaro.org>
Date:   Mon, 2 Oct 2023 11:59:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 09/13] arm64: dts: qcom: msm8916-longcheer-l8150: Add
 sound and modem
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Nikita Travkin <nikita@trvn.ru>
References: <20230926-msm8916-modem-v1-0-398eec74bac9@gerhold.net>
 <20230926-msm8916-modem-v1-9-398eec74bac9@gerhold.net>
 <14262938-4150-429f-a730-df1b2fadd9ff@linaro.org>
 <ZRhT2PRwAoB39J_0@gerhold.net>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZRhT2PRwAoB39J_0@gerhold.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/30/23 18:59, Stephan Gerhold wrote:
> On Tue, Sep 26, 2023 at 08:59:52PM +0200, Konrad Dybcio wrote:
>> On 26.09.2023 18:51, Stephan Gerhold wrote:
>>> From: Nikita Travkin <nikita@trvn.ru>
>>>
>>> Enable sound and modem for the Longcheer L8150 (e.g. Wileyfox Swift).
>> e.g. -> i.e., or is that thing sold under many labels?
>>
> 
> Yes, "e.g." is indeed correct here. AFAIK the MSM8916-based Android One
> devices (aka "google-seed") are also based on the Longcheer L8150. They
> are available under names like "Cherry Mobile One G1", "i-mobile IQ II",
> and "General Mobile 4G". They are also covered by this device tree.
Oh wow.. That's surely fun

Konrad
