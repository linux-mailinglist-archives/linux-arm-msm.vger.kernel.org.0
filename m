Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6C6E5A5F74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 11:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231411AbiH3Jag (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Aug 2022 05:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231434AbiH3Jad (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Aug 2022 05:30:33 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D0F15F20B
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 02:30:29 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id m2so10924414lfp.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 02:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=7vyYZz9KgFNVi0JvWBzSGayrcz6ixg7MEp1UEYlRptU=;
        b=WaP/NHshvX6sNiRPPVuzIhwJZTulhNUEpAapYrefGstvj4/cZkFXxJhDVzktI28ZpI
         i13FUs6UZxue3hmF/BV7BD3jM0wwIIGE7upNTxSC/Ox2B8JC0mYapGDwQ4wIntCI7ez5
         r1DcSYENqx6DYD4O9UqOhO7YaJ05HbV5pROeEZVTRNEBoa8NgnuTEwgF42VrKnuoXBqr
         zkY3vDTGgRpoZIOturtJmRcXexP/zqfWiUxN3dL6lJpBRO/UT4JlpFjaGSswCgC2z+co
         NVy/GbTQNPGSMf8ESEhDPyOlT7sK/RBLFmjkATy+tUwBe16aVWdKQRQrXk2Avwk5zhQy
         N0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=7vyYZz9KgFNVi0JvWBzSGayrcz6ixg7MEp1UEYlRptU=;
        b=41jKOH9OUGkd57qr7mkYaKDeuDXyw9vall+qKuau0t3N9gzdTP7dmbCBumCwsX3Fca
         42felzx6v9V/R/5Pe7NDUAba6aB0n0hRtyvIXbC9oKzjIqFIB3aUcBjDJIV9GtARrZ/m
         x+OkENlFvthFNPnb4nQ8eKM8JqPOotwBfx2vFHSImLQ2QiRY9Eur6hqKWobebiDCYV6w
         cnv4pdczT4KWoUiVFePFBsPPt1ea3H0bN/EgHuM2XS/XU8DaPw9ce8YJYX7EvtTRpo+M
         vKIhcRaBawTPV0mJeA+EL2TKIo3wCEX1csZziV4x6Y+029ofgW3nAtgWoSi/u0n28G3z
         BkTw==
X-Gm-Message-State: ACgBeo33eNQIQI6Env/yO3+CBsj/OOwDDlCiVTVSH8BzUGZ3TgYkvpRn
        0+AVR+LmJZ14EZ1cHr6n2F0/2BHE/9kzNMLSTyM=
X-Google-Smtp-Source: AA6agR4MJMvkWWr8MBhEZ8xVFUYxKK0ZPWsAy0YaBRPQ7YBUtTJXE1tDr4axCvoe0Qh+3CfytsxMjQ==
X-Received: by 2002:a05:6512:281a:b0:494:813e:53fa with SMTP id cf26-20020a056512281a00b00494813e53famr255193lfb.305.1661851827598;
        Tue, 30 Aug 2022 02:30:27 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id s4-20020ac25fe4000000b0048aef1abb06sm1554987lfg.69.2022.08.30.02.30.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 02:30:27 -0700 (PDT)
Message-ID: <bbff0ffe-d555-ab10-7a0b-d4369dac14e1@linaro.org>
Date:   Tue, 30 Aug 2022 12:30:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v7 3/3] arm64: dts: qcom: msm8992-xiaomi-libra: split
 qcom,msm-id into tuples
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220830065744.161163-1-krzysztof.kozlowski@linaro.org>
 <20220830065744.161163-4-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220830065744.161163-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/08/2022 09:57, Krzysztof Kozlowski wrote:
> The qcom,msm-id is an uint32 matrix, so a list of tuples.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This patch can be ignored. I missed that v6 was applied (there were no
changes between v6 and v7 here).

Best regards,
Krzysztof
