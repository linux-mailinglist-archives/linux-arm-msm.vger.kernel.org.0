Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 762DD6E5A84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Apr 2023 09:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbjDRHdG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Apr 2023 03:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbjDRHdF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Apr 2023 03:33:05 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AE7E49DB
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Apr 2023 00:33:03 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id fw30so17947347ejc.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Apr 2023 00:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681803181; x=1684395181;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lKgWNkOJgKXo7RHkqoeh9yErcCaH+MLb1gLiZAERQuA=;
        b=OJprU5HxHTyBMt+ck7rplzQJAXpMZXqy/c34wblz1wvA+2c6NEHCsFuE7k9DQUS5uK
         PEDZu+9Du9YzsgTDQxiEbNwKmEBmVNAVEFCIGO8YKmEALsFRQS+WRqch+lCrsZTxNiId
         xXgFAcnq/K8dX20VvyXHsErhx4Brd0NQ+hrbSF0y0IZIS2xQqN12meNdmXsipeTLwzgr
         NBHhQG5oJ8pMq7t+9vn3axHYnoE/nfP6/SJmLozCATurzChoHlM2ZsQhwR8wYagPGgi/
         KKCSRLos27MvYGQ3g2Q8ihzQHnRQJ/1cGcpptSDFhkizuYHRy7KsQtL1rSB68+vS7fIV
         snOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681803181; x=1684395181;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lKgWNkOJgKXo7RHkqoeh9yErcCaH+MLb1gLiZAERQuA=;
        b=LHcvujSphbX6oFgxaWFhY5HQFpz48BqopyYy/aqTJSguTUNvyR8uOY0rXdfWUckPbk
         rl0D7Xbj2Qxp89A7df6rCtjinFQgCr3/MDs5NFEe86aGdSPCcr1zUT2lwvQ1JHQNgWFH
         uBbA8KtoXrTEpskycUdWwdCyBgwiwWoVOVWmo3EhMrac7I4KuU84Zn7GDa3zE6PfCnW+
         6VY8gJ+tgQacbHaoN3OMtch9nHTfCN6UtfbSLsJt5IszSjfgOzlB29op+TWDQuUK9ZUY
         tVrzSsQAKJs4ApTqfJTw1SQZ4r6aCzQK8Utp3ZuMQ/O7ZQOqogApITe/RLjQelu3VS4T
         R18A==
X-Gm-Message-State: AAQBX9dhmVLJ9oha0ImKCkrNpag/Mw3lzmwoE+Ws8A823OWa4ZBlo68c
        4LDaFcIyDAFdHKKv+zV/hY/uVQ==
X-Google-Smtp-Source: AKy350ZMPgsxFyc+nasSzANQfDhKCRfDuJqDIKTG7Y6L51+m2E9GB+q8bneIFyvzgduPcSx+jmsQGQ==
X-Received: by 2002:a17:907:98d9:b0:94e:e039:98cc with SMTP id kd25-20020a17090798d900b0094ee03998ccmr8951881ejc.42.1681803181483;
        Tue, 18 Apr 2023 00:33:01 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a276:7d35:5226:1c77? ([2a02:810d:15c0:828:a276:7d35:5226:1c77])
        by smtp.gmail.com with ESMTPSA id r12-20020a170906c28c00b0094f2f0c9ed9sm4270044ejz.167.2023.04.18.00.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 00:33:00 -0700 (PDT)
Message-ID: <c111addc-db54-d1bf-855c-77c82a91a1f7@linaro.org>
Date:   Tue, 18 Apr 2023 09:32:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 2/5] arm64: dts: qcom: sa8775p: add the pcie smmu node
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230417125844.400782-1-brgl@bgdev.pl>
 <20230417125844.400782-3-brgl@bgdev.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230417125844.400782-3-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/04/2023 14:58, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add the PCIe SMMU node for sa8775p platforms.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

