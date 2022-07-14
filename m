Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2C4C5748EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 11:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238283AbiGNJ3F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 05:29:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238038AbiGNJ2t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 05:28:49 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAE061175
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:28:46 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id t1so1818538lft.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=qLoqEanmHmcOVGRPRRT+aRCQvQ8+n03ZqH5LbbY6VbQ=;
        b=MfaebuyV5vYu410V6OGgUu+pkpTyIAIoQgwqR/osYj9jXc5FjthQ5403nRIKo3lz1e
         X4jqlvRUNsnm4yjrijpaqjcPHcdUKkQ5f31kenhpjwRRC6d24WnItCmVOP4/neSXdzdf
         WNPxb0gXKNNTKnNBkDvrVL75XMeuMEn2M1d72R3K62Bu3JVPPyOvwt5xMDJ+twlpW2+g
         tkQ22/ErloE48NPDosl/YAZ743/xFeTaeJ6bZO8f5gKAcm8kEiBI/mrmegGMj/c8NL9X
         umn6uBCkex8XawnIhlgAwZyQ+VMbZ142e/p7Kgpq2CpLeroCngkKkBECen6feKfGQ2Rc
         Xpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qLoqEanmHmcOVGRPRRT+aRCQvQ8+n03ZqH5LbbY6VbQ=;
        b=WyEbWyaXhceuw+ejr/YkNq/4pCBJmjCFRgKJz/QhtYuNmGGuI7pbc09dgfB4243ZYq
         vkVPJbQyQg+06KNRCh6DXLDQ9ii62zmuY6y5wLwulBVMFaPGsmaZWSnmAqkiMv+DFCpJ
         BRRmngoZgHzEElIQjId32id59LAIH2kOAkIZUF3o5uiwRnFfg0TJzK+imT53N/5kqW6K
         QrcMYbyWKmkTUNU2rHTHat2re+AEHey2Za12d8AiFyEMK6LvrNbFu08BKE4f0kvJjqBo
         D4nq9baUetDUMNHVKPNn9pXyJJ1u/zmDMH9MuOMz+eBqWbgondYdXmFJNCOitVBfYlp5
         zKmw==
X-Gm-Message-State: AJIora+sb8eVkU6Kl8OcX1lxPbh94Kw4Q4RWHhcd1McAUUctkeV5IuHI
        BFMJ7Zu+IenpdB7CbapyYZcYIg==
X-Google-Smtp-Source: AGRyM1ue0q5+XuXiTzfYSUiX449xIjFdhkSs2tKAL4E+660PlYeAIswdiWE96dhZt93N9/mQvs0IjA==
X-Received: by 2002:a05:6512:31cf:b0:489:da0d:df52 with SMTP id j15-20020a05651231cf00b00489da0ddf52mr4646024lfe.221.1657790925082;
        Thu, 14 Jul 2022 02:28:45 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id y13-20020a19640d000000b00489ed49d243sm255490lfb.260.2022.07.14.02.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 02:28:44 -0700 (PDT)
Message-ID: <cc5245a7-f1d8-c465-4dce-fd21aca27000@linaro.org>
Date:   Thu, 14 Jul 2022 11:28:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 25/30] phy: qcom-qmp-pcie: drop pipe clock lane suffix
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220707134725.3512-1-johan+linaro@kernel.org>
 <20220707134725.3512-26-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220707134725.3512-26-johan+linaro@kernel.org>
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

On 07/07/2022 15:47, Johan Hovold wrote:
> The pipe clock is defined in the "lane" node so there's no need to keep
> adding a redundant lane-number suffix to the clock name.
> 
> Update driver to support the new binding where the pipe clock name has
> been deprecated by instead requesting the clock by index.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
