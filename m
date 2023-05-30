Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA7E3716178
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 15:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbjE3NUL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 09:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232716AbjE3NUF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 09:20:05 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E2ADEA
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 06:20:01 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-96f9cfa7eddso789982666b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 06:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685452800; x=1688044800;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZtdQMBowYm585Zs6pfgqzqfvh1FN6JnmrWJTtQvCM60=;
        b=ERD0iEIjO1D9B3IphjhYjTp60AoE9cvj3bshMUhzxvHO8eA0SGmXuiP/OUnlcORqhU
         rR56aes2miuxoBR+Q5HFBoy3yrs6N7HB6Pi1LtxfcwF85pVk/YdOG+KmK02NjeTfzPj+
         5e3qFg+SmT3VpUO5bRNCzKkImdVs98pHG407RKMd8NkrvworFJ1yN0wc6LzP6yCnGj/Y
         ac8jdAvPDl5wVfeSJOO3GSZASg4SuQs5usyVOqy8s+KK3TF8+8QHSd9EsKNBHcMEBwjv
         4wfPRz0tObvghkDlUOQhGfpo1Z4zifGGUdkhQDa7ASX3J42gKsmmSQI7WiXaPWA5s5TT
         H3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685452800; x=1688044800;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtdQMBowYm585Zs6pfgqzqfvh1FN6JnmrWJTtQvCM60=;
        b=VMZ0VB6Vr4ZNuRHzj3YbbX/qucqodGiqEUPARQoPWXDaEFHaB9tS01wjlHJZ8oL9Wo
         q7uRbOis54jfOIKKxYCdgi2euOeySLWKkCYE5p+zUU2Jj93dBEoJCyoNGBcz5SbGg5M1
         jmJiDeHK0CzNIwWsMoKrYto1KvaKM4nDdILwHyV91mUh9267gBKQMbyp8+e4Zl03IUEb
         F8DWQ4IfsoDjfr+P82N3NQE1LZI+b+ffiDtGSnRw1wFVRk2H0FgLM9nWt9u8rpbPOzms
         a/vqEMnRiarLR9LkNClHKElWkXcEo4zBK4CBPbE1JaehgVmUMK0skn5+E/eFlFldU/PW
         lnmw==
X-Gm-Message-State: AC+VfDwd6uOuFqrZpaWGy4PmV/oiJhuVXlxQyi2GSewfzXsnbQ7FQ9TP
        TsNqE2Lwq7ebz9VZDfYQ3UPoGQ==
X-Google-Smtp-Source: ACHHUZ4bovaQYTnMKj4zfyO8sYWd9MdrERUhOb70V+wtH6un/B77uGDs1PpadB+mwEs5SsMcVpZyrw==
X-Received: by 2002:a17:907:6e0d:b0:94e:afa6:299f with SMTP id sd13-20020a1709076e0d00b0094eafa6299fmr2422396ejc.22.1685452800052;
        Tue, 30 May 2023 06:20:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id bt22-20020a170906b15600b0096f603dc8ddsm7408681ejb.142.2023.05.30.06.19.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 06:19:59 -0700 (PDT)
Message-ID: <c926e7f8-946e-5fe7-023f-46a319fabdcc@linaro.org>
Date:   Tue, 30 May 2023 15:19:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/5] ARM: Add qcom,usb-hs-phy-msm8960 to
 qcom,usb-hs-phy.yaml
Content-Language: en-US
To:     Rudraksha Gupta <guptarud@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     david@ixit.cz, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230524230459.120681-1-guptarud@gmail.com>
 <20230524230459.120681-3-guptarud@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230524230459.120681-3-guptarud@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/05/2023 01:04, Rudraksha Gupta wrote:
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching.

Missing commit msg.

Best regards,
Krzysztof

