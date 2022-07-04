Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE48C56554F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 14:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233625AbiGDMaX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 08:30:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233286AbiGDMaX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 08:30:23 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB11221B8
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 05:30:21 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id y16so15500118lfb.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jul 2022 05:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=5HcDBPX0scu2G4MlvUpBQditR9fNyyXzx8A6/q60hMM=;
        b=fzV+urkGYM13Sqh/6JazNt+7UUPIMeTZHCm2bSgOJFpQRqoxnw9v4+Vltu6myQ0elp
         eOh5+u23mSTvN3QsojoIMvr8wa/7ND6qBm3xOUb4j5DCx0wJ71LSDkcRcV+pVDBUbRFb
         BP4c/y744IuMM6uhTvUVfuvYtOo336Fq27WgeZ/XXyst1qMFRpEK83hXf1DYamvP3xkQ
         mcx72aG2iEHBmSuKwdDx1okVu6JhkGHxxo+cG5nnR5kx9EaYHzBgr/5JswI71vBW4X0K
         HUyanuLMk+nIBN5yq54PevyWi586Qnr2SWZlQB3u8ZYWPfweuWC4PMwonEDF6EeWAhYH
         zxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5HcDBPX0scu2G4MlvUpBQditR9fNyyXzx8A6/q60hMM=;
        b=a8Q32AuGKOk8+b61/pBr+6trTQma/dCbx6M8E1wb9ARL8lsdzeyXVxKuOuumUhUQJR
         TmXNz9tRVCJ3gwuvatfGYDzF5xWsF1guHgMX85R7SwSn9foGOFzbJJiQLBvACR68XQYm
         jrR0/wlVrz0povAT3jx6d6VHsmNe2eQM0ocRrLB3H1ZPk9IKvK6qO406rSkvb16oC/8i
         XVYSjqEE5HxGjZMtBkXev2kWW05CLBJKlFvjBsA7p2zf172iuRKq67eEu9Rn3ESpxfoP
         7lBLAc30eRWvLIM4dbzTxqhxSJ9cIyv6PAXUPxm4sp4wOiqjoe9j4zHp+9kiISMllg1A
         Bc/Q==
X-Gm-Message-State: AJIora8Bj7xffe2qDvRPcza+f5pocCh6kYQbvziWpwsJ98gx1dW6d4tR
        5dK65zbs+i+AjEp/XWtWgA2kqA==
X-Google-Smtp-Source: AGRyM1uxAnbOlEd9lW0gbt51jXkgLzYhi5PI2KtBNrEMvTwdXxVLiGEO7VbSXDOSiBJ1cVhLeFfNeA==
X-Received: by 2002:a05:6512:b14:b0:482:a9b1:ea3 with SMTP id w20-20020a0565120b1400b00482a9b10ea3mr5784944lfu.353.1656937820138;
        Mon, 04 Jul 2022 05:30:20 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id z8-20020ac25de8000000b0047ac01fc644sm5116298lfq.44.2022.07.04.05.30.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 05:30:19 -0700 (PDT)
Message-ID: <1dbf8ddd-eae9-2985-f85b-e7380acc492f@linaro.org>
Date:   Mon, 4 Jul 2022 14:30:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] arm64: dts: ipq8074: move ARMv8 timer out of SoC node
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220704113318.623102-1-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220704113318.623102-1-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On 04/07/2022 13:33, Robert Marko wrote:
> The ARM timer is usually considered not part of SoC node, just like
> other ARM designed blocks (PMU, PSCI).  This fixes dtbs_check warning:
> 
> arch/arm64/boot/dts/qcom/ipq8072-ax9000.dtb: soc: timer: {'compatible': ['arm,armv8-timer'], 'interrupts': [[1, 2, 3848], [1, 3, 3848], [1, 4, 3848], [1, 1, 3848]]} should not be valid under {'type': 'object'}
> 	From schema: dtschema/schemas/simple-bus.yaml
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
