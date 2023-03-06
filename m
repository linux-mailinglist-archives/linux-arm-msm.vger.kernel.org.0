Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43A306AB67E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 07:45:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbjCFGo6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 01:44:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbjCFGo5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 01:44:57 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB8EF1D904
        for <linux-arm-msm@vger.kernel.org>; Sun,  5 Mar 2023 22:44:56 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id s11so34110280edy.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Mar 2023 22:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678085095;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dMF3qYFpWej/FyKNPLY0+koqyEC7MkdJXfAnR3PUqBM=;
        b=yDQ0V/retK2/OT2cnxkirFYW+kmb+0DcM6DeTUTXA/gZLN4HYDMb57PYamLXS+oUVW
         gkJ0Kk5O+cM/fPfCk4brfntVOH8RScrPBdesJqFqqobBpBQCQl84zes5WM7WR9WtcuSo
         +iOyq9DS3loHc8LMWBKaUYXi029V63SI9K2q3yD6yviJ4/fcG2T8Fz6B83uCyfIfv3UE
         95sgyQaMKJVwrVwUiwtM3mNF3FUqS4489HWjVSlvkfP8eRWS59e07m+HTlRffYDSinf7
         QpUgDOfTzicTgQqgthER6SjTbmJNeADMFI29D1j1Teph/mUigteHVflEZPGyhL54uIGR
         VgmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678085095;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dMF3qYFpWej/FyKNPLY0+koqyEC7MkdJXfAnR3PUqBM=;
        b=ZpyeKKTeZxJZu/JgiwsvDZCVBmHww/UB83+uXOfTmeDitjmDqEvHCKeeWZHQ66tMFZ
         TvXe901YvTdWPyMiMzpUVufupiX7CKzjj1wqEZCoKFrzqpzf1l1QHkLzo11EjlKGCeQG
         a+CjM5Sy+RARciMFbTTElhZeWLjNtXsFz52AqjCfk9OqKTi0694GaI2dRctpa3fQcbvo
         TOxPcTrNcVHvMYK8J2ezP7XABqHoozEjPrAR9nt+CfLJeeePLLHrj/tW53blxQapEffF
         SpsOG6umIRu1g0E4fXboZzkJ6gTnVNkamKh3I4L5ZapXdZqJ1M62Ac2ggp4KQld81+Ys
         5HDw==
X-Gm-Message-State: AO0yUKU+zrE8v7XJUNEuK48/O+naEEtxeLKf4MkVcQaCuyYcUYfr4Y2e
        C8eBJABodqKk31oVFaUNHkO6sA==
X-Google-Smtp-Source: AK7set9fh9CkZuxA+Twy4e6vWET8r0+L+L66LBjRgtvBLtV1N7u15tnsPqWdvH+y9TchEgnZYAgSOQ==
X-Received: by 2002:a17:906:6ad1:b0:8eb:27de:240e with SMTP id q17-20020a1709066ad100b008eb27de240emr9765811ejs.13.1678085095244;
        Sun, 05 Mar 2023 22:44:55 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:d85d:5a4b:9830:fcfe? ([2a02:810d:15c0:828:d85d:5a4b:9830:fcfe])
        by smtp.gmail.com with ESMTPSA id l26-20020a170906231a00b008b69aa62efcsm4124112eja.62.2023.03.05.22.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Mar 2023 22:44:54 -0800 (PST)
Message-ID: <e68a1fb0-4116-2a4f-e48f-c2630d93fcba@linaro.org>
Date:   Mon, 6 Mar 2023 07:44:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: msm: Add LLCC for SM7150
Content-Language: en-US
To:     Danila Tikhonov <danila@jiaxyga.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        abel.vesa@linaro.org, rishabhb@codeaurora.org,
        saiprakash.ranjan@codeaurora.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230305202627.402386-1-danila@jiaxyga.com>
 <20230305202627.402386-2-danila@jiaxyga.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230305202627.402386-2-danila@jiaxyga.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/03/2023 21:26, Danila Tikhonov wrote:
> Add LLCC compatible for SM7150 SoC.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>        - qcom,sm8350-llcc

Best regards,
Krzysztof

