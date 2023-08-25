Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31BA0788742
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Aug 2023 14:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244744AbjHYM2T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Aug 2023 08:28:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244875AbjHYM2J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Aug 2023 08:28:09 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52EDA212C
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 05:27:39 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-99cdb0fd093so106953966b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 05:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692966446; x=1693571246;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kgg8xYYNbTRWm2vHCDK29l6ySHitjcMCfQI0Oddi7oI=;
        b=HfdAca9j9pB+nZjikDZ0FD86hRCH2x5TC5MzoNnELAJkLw0v1USpA/OuAlwKs8q0oe
         8HnwRJ3eNvM/oDuSuI7lfilT7fISgkMFq7WqxV02EzgRTWoQKd15sCzxJ3H+S/4qhOZ4
         iYTUy2+VAMTMNVJDtHWIVBrWp/FiFAJA20ENFQKpl5LgqMc5IUNlycfv/RvFRBMG6boO
         ueHrS6EVFpDS10v0OS+38YqeiFOMScebD8UpfVC1thsR0AICOA+46MRpxTgv62/z5/JP
         ivfUkGcRAJ+D27ZJkTsISxNPeK83+1Je4oOlMHqBjAj2oiypMr3b/9idvm7vPNjamVqd
         YNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692966446; x=1693571246;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kgg8xYYNbTRWm2vHCDK29l6ySHitjcMCfQI0Oddi7oI=;
        b=gnLVRXbcqHLy6/rpzozBNZ5SvxMFNHDqe+bhX7g7uB1xPQBo3AuzLQ5DkBc3bk8bgH
         6nUezFtlzNscTAPW2mpWZ9VCul/6eGi8LdPbtNuX8nVoSlkZIMtQ8D3jyR7O7zS5dfu7
         FabYt6m0fUo5sl3yy7L95dqvSTtNN6SzEeo1/IFW04nGM+AfacDRj5/yKalMWkSRCPUu
         ToM5Xgul1Ci66R0KDILuYD4Qj0xMFE5Ijs23KLIOJgH1AoIpvwhdi5wugIsDVgtGGKQi
         N8QmRoUWnObrN3XOorb9wenN8A4BXv/X3P1OZqGZoVZVx5ISX4oPWrnxLQa0szDkYI0t
         XSYA==
X-Gm-Message-State: AOJu0YyjEb1Dt/hYRWHawBnqhQaLshQ7Xp9UcjXAAL9lN67LsP//xORt
        TtvBn8FynD3x06vYGmBWfssgIQ==
X-Google-Smtp-Source: AGHT+IEBhLxNhwm/z9ts7EodBvz+Wx6JrqO5CcAIwHoE6WQzs47PoJ31rqFNN1xa0EWK0bJCJYVJrA==
X-Received: by 2002:a17:907:78c8:b0:9a1:e994:3440 with SMTP id kv8-20020a17090778c800b009a1e9943440mr5571428ejc.4.1692966446080;
        Fri, 25 Aug 2023 05:27:26 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id y16-20020a1709064b1000b009929ab17be0sm916586eju.162.2023.08.25.05.27.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 05:27:25 -0700 (PDT)
Message-ID: <8c792bd3-35ee-cd65-d483-777890f37a9b@linaro.org>
Date:   Fri, 25 Aug 2023 14:27:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH V2 2/7] dt-bindings: clock: gcc-ipq9574: Add definition
 for GPLL0_OUT_AUX
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
 <20230825091234.32713-3-quic_devipriy@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230825091234.32713-3-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/08/2023 11:12, Devi Priya wrote:
> Add the definition for GPLL0_OUT_AUX clock.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---
>  include/dt-bindings/clock/qcom,ipq9574-gcc.h | 1 +


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

