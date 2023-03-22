Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34FDD6C52EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 18:44:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbjCVRoW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 13:44:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230408AbjCVRoK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 13:44:10 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 002B76423E
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 10:43:40 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id cn12so30527277edb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 10:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679507016;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bz0GFwOBw4FSvdCteGZo11Dbw1t8O4+71KL8pO8s3Fw=;
        b=OHOI8Z/2mnCkG1BpVa4vIPM872lkUsqnVFmvtNoXvprqmK453DF3RoKxCCkBTFmeLG
         lLGk+LcT+GomsR5UIY53XrwQwOolIPtrnVFv7t9YVjzlxnRG4kY/TNHLD/wPpSfaokiY
         Orxpz9nzQc3haBs0ggypW+juXJ663D0kdfN2LmYI6H2FUxycUsiN+663lEdkAxYQ519N
         0k0z4yPhkn2rbgzYAfUEpeIgfYjMYVHdjf3ia/niqQLKHepo3AGDUfRCd+NWfgGanzy1
         Vx7xyC68Azr7wFQqeAhCQhZJncHO5CsPpuS/bcYpWqyKyRJk8b3kPZyAaRaqxZgojD4j
         ipXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679507016;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bz0GFwOBw4FSvdCteGZo11Dbw1t8O4+71KL8pO8s3Fw=;
        b=CLBmMVZ+UnBETtfxcNbM+LcruIr21XfW1m7l/bsFJOhFN81WIDCA+R9IfMfuny5Y1B
         qzu2/tpG7B+ymUFOOXHG1vi+VAZkyTMHaEebPWj86ceauKfo24sAP8uRLXvhoEqm15L5
         zpS0dFDHwhfX2iI6PWsuDEjVG4grk7fJjlhXS5n2R+d2Uk+IvngfJkGVnEPU3MuGU/PG
         ughzEBnXSFSbBx+5a7x/XEszMIQQwpLCFbdaR/ZMTxTKcBp/moQ/2gpvnHiyJZfl/v2j
         Mg6EIIDNMhWRtWQuqJmbXzGlXjzyka1cWdzXNmQ6R2PGz4JaUy7KIL2Lys8INiWbodAm
         H31Q==
X-Gm-Message-State: AO0yUKU9qCX9+EOrCpNTyBOdA5D1HVm32pC14jEK1e9v+WkWsoKtYctZ
        UubuChRlR5aF2xpxs7orLnO2mw==
X-Google-Smtp-Source: AK7set+nkmtoqjYEzZaku0D/7qQI5HO9as0edhrib1GD9nZDSZ9uxRhZ1jH+E0y8NuK4755/15GYjw==
X-Received: by 2002:a17:907:7050:b0:932:b7ce:27b4 with SMTP id ws16-20020a170907705000b00932b7ce27b4mr7503749ejb.27.1679507016059;
        Wed, 22 Mar 2023 10:43:36 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5050:151b:e755:1c6? ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id bu6-20020a170906a14600b00933c52c2a0esm4959743ejb.173.2023.03.22.10.43.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 10:43:35 -0700 (PDT)
Message-ID: <af57ecdb-5f06-9a5c-30d2-0bfd71c798cd@linaro.org>
Date:   Wed, 22 Mar 2023 18:43:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: mailbox: Drop unneeded quotes
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20230322173449.3970718-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230322173449.3970718-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/03/2023 18:34, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

