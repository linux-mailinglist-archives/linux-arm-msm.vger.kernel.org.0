Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1C9462BC9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 12:53:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232924AbiKPLx3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 06:53:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232966AbiKPLxG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 06:53:06 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67EBEEAA
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:43:29 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id j16so29012756lfe.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z5yJHa+wAEe8GnC+hyt4JSEECXNNqxHwNCKclA9M7H4=;
        b=NZPZ2yt+mCKAMMhWLsVd7LnxWK3CWyxw8hc+QTsDd/iD/evl6V6WmMsPPLwHfLOlW3
         ktCK97Koq4e18JLQBXXV2T46QTNF1OsjBiJbEFYTNy2kbyMzQgsHRn9dZtPWDtb1t6CX
         AzOPFfR5V9U9oAi3v9tCMAsXAbVCZidhSQIzyOUbMrlKFGd4bpWGwgg6ThO/BVGB7Em0
         fQikqvcQptTcsGZHS/v6fLzvOM8F8RPuLKPQ057cJbl9u5P1fEthXOu+5P5mkTLWCGki
         If9t+x41gzTaCuDv8nt+hShajuGtbSddPmS9XOWaB+fuuWw35y5rgT9cW03h5n7R3TcZ
         +ZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5yJHa+wAEe8GnC+hyt4JSEECXNNqxHwNCKclA9M7H4=;
        b=gW7heuk8tZG2S8t6lsduhYS58U/dZGNde7VgpmAndOPtD4acDJRlP6VjboBdB63IP7
         HjEsMoP24RApperRyA28nw7oHXPcBVcWpC378iEyiCvA4puuiwrn1Efv4ojnBXrnt1OO
         FY9YjvBDrIJhYXXWc1gneXU23fIaOSU0Am4ZBBDXWRXVK6zep2bV061ppsGSqE6qV212
         U1kW0FQpWs2bESxiLmRXhcm2OAPcG4JfKnTQk8ePhoXGxtUUy599bEB/AYlYUDLShUB+
         lQ305xG9hUGRw3nZEbo01JG8ULgLu9cKlGaXYaLt0cJf4eTk3sLDqqSd/FUWF+TQt4aw
         6dQw==
X-Gm-Message-State: ANoB5pnHBAuGkk2lKlNQUOHgrNQtw5B7rhNvU816dpy2OsMQ5BxRCHy2
        t3OR07S1ns4fGOfQsvtSAxxpJg==
X-Google-Smtp-Source: AA0mqf6iLi6Mve12+MVviZ747v8WvzMemffWyM1PvXX9qD4lpKGp4sLpnRmtU7e4Rxuvlg/gzuu7HQ==
X-Received: by 2002:a05:6512:308:b0:4aa:8cd:5495 with SMTP id t8-20020a056512030800b004aa08cd5495mr6589357lfp.254.1668599008194;
        Wed, 16 Nov 2022 03:43:28 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id j9-20020a056512344900b004b1907d85e9sm2559638lfr.161.2022.11.16.03.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 03:43:27 -0800 (PST)
Message-ID: <adc327c7-9e99-4f2d-9641-2981b380ee47@linaro.org>
Date:   Wed, 16 Nov 2022 12:43:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dt-bindings: soc: qcom: aoss: Add compatible for SM8550
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20221116113128.2655441-1-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221116113128.2655441-1-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/11/2022 12:31, Abel Vesa wrote:
> Document the compatible for SM8550.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Why this is not part of other SoC patches? I just received many single
patches for this SM8550 topic. All these should be set of few series,
not 10 or more...

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

