Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC1F788771
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Aug 2023 14:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243718AbjHYMb3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Aug 2023 08:31:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244895AbjHYMbU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Aug 2023 08:31:20 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5A732719
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 05:30:49 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-52683b68c2fso1337085a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 05:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692966635; x=1693571435;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RGJySe5oV5RvT65+50/oiO7t28jIHypCcuPr0UQ4mVk=;
        b=k/Z9BLU7irljc9SAQdIelUeKfRH/uOdl8aETiOxsEWAbA5T24oJU07WmsnVswDTL7z
         nList5SAGKekwMimaimJ0ME1YjWpYagnwtqfzzqpRSYRph6Rh9GXSpjpnZ9NHDf8+xBK
         UkZc0BZU+1cMPWBJXbHQ3TYVcYKYmGkCdvs/1rmUSOknGl0XZ9Oh9fpXLAZDa/AJo9Uz
         n2wyiH3fEuepD1UmsBREDkRfLO1p87PLi3gJUPIsGvTfYnYu8wuc5i8mwmlb3ePkHtvB
         4pRAX8UvcqipeEtzsOTPKqhQSlE5RBpJuRN9OQz+EekNqhZR/oTU50WbyIjMrtih/9jC
         atBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692966635; x=1693571435;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RGJySe5oV5RvT65+50/oiO7t28jIHypCcuPr0UQ4mVk=;
        b=EwXvTVEeVx9ixg8pukBNdg2LIwld9jQUpMBMpbpMv1XY3Zeo6gwzU3K1CQGh7Paeqy
         YxUu8UxhhI7Lh2dl8enIY5zSaxv1qTcTift/JJWZT1hilns0vTYFe1V2fBR5jk0DLUtQ
         bjf808RpjlGxlerJBzhL12cMgzB4xdzAmDfJmlgxM3w0HMaVPV33zKZqwLcjC+l46Kub
         PSiIRXxK+vYtl/jk2buReS09dA9MTgY4+rFsXMfyHnH+pLZU8YjAHRpEoOcjQ0/C7uou
         FmJfsqxrO7lL9hPM3P26boT3QcP7rPBd8LlL1tKSzniCoB8Ri1TzJLB8tNgGDpTw6e5p
         viqQ==
X-Gm-Message-State: AOJu0YwvwHkT4YXu9CCm+vE8IXndFjlVZachfR1Rao7WVYlh16XKcePn
        1ic8s9Ifa/bsqeEUNdlbPUfnkA==
X-Google-Smtp-Source: AGHT+IFV8ktlaz42ycnW/eurNZSB0myL1XwQezOptOEffZJu52cScVPqfwDGT9wSU8UMOUd/x9czUA==
X-Received: by 2002:aa7:c2cd:0:b0:526:9626:e37d with SMTP id m13-20020aa7c2cd000000b005269626e37dmr13254744edp.37.1692966635044;
        Fri, 25 Aug 2023 05:30:35 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id p8-20020aa7d308000000b005288f0e547esm967693edq.55.2023.08.25.05.30.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 05:30:34 -0700 (PDT)
Message-ID: <29a968e9-9c6f-034d-35fe-71c42b5d7cbb@linaro.org>
Date:   Fri, 25 Aug 2023 14:30:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH V2 4/7] dt-bindings: clock: Add ipq9574 NSSCC clock and
 reset definitions
Content-Language: en-US
To:     Devi Priya <quic_devipriy@quicinc.com>, andersson@kernel.org,
        agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        richardcochran@gmail.com, arnd@arndb.de, geert+renesas@glider.be,
        nfraprado@collabora.com, rafal@milecki.pl, peng.fan@nxp.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Cc:     quic_saahtoma@quicinc.com
References: <20230825091234.32713-1-quic_devipriy@quicinc.com>
 <20230825091234.32713-5-quic_devipriy@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230825091234.32713-5-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/08/2023 11:12, Devi Priya wrote:
> Add NSSCC clock and reset definitions for ipq9574.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---
>  Changes in V2:
> 	- Referenced gcc.yaml and dropped the duplicate properties from
> 	  the binding
> 	- Updated Uniphy clock names
> 	- Added nssnoc clocks and clock-names


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Rob's bot report is a result of patch #2 failing to apply.

Best regards,
Krzysztof

