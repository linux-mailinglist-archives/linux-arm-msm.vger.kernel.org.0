Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A44A8664626
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 17:33:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238860AbjAJQcv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 11:32:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238922AbjAJQci (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 11:32:38 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D57BF84BFF
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 08:32:35 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id j7so7378488wrn.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 08:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QuzbVCChpPx+rGaPIq8dHHS4EuNxVBGmVWr4Va3xo74=;
        b=s7U+y5Oz7tIRvD972353bs+//bJkzJOJy8dEyT3V0seHT8faP05kCBKRkOOfLC/3Q2
         khsrE/uvDOaL1cxhP4Nb2OEMNygi9QroDRkVeDbsKSn2hnXlvbMGwHOXBAzsVy38sJAO
         QsAGB3T1fS8mjPzdfooRgf27bCITsXgW76dgMzTfZFOtq51YQjQfDdtbDd6XPBkNF2Dw
         jGdXYRHZZmLVEM8FDcb+JhA2YzqNwfKbpGDpn8AYXltNZ/VtadTafumdA3uJX4vaxsiy
         rrsTTMwfuQ/KFMX+32Za1yeKAJzX58yzI1ntgUO0uGrW1oDuN3PABfoGVoxSef+fdZBQ
         nGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QuzbVCChpPx+rGaPIq8dHHS4EuNxVBGmVWr4Va3xo74=;
        b=un1WvoIx7XGCxOxuNKehlYd0f4luvS0xcjG+rK68QnYjUsRfiDBBOlJsGYcf2HXjNI
         zB/Pa6H73ADmNiGzOd2skYGitWXGJpuXDhIX3NOXSTvc7VxJhwakaH6WTHUe1pCMb14E
         EgxJ6vcSZo/AIA8fxA9g2/r900wZ1YDEN00S4GkFqzYuAnraEk28LrDFXZus90GcVZ9c
         1pDMWKHkSVPh0arslKsUXYjUwN8aVHE5aDopHP8BaIenUYYPQxSjlt8Z44DEcV8mU/cN
         7HUPHPG11LxEP8G6V7PkJAVXMZyUPSOYbgrbefjBdbV3HzA8kjirjfQVkjwnUs96Jy/a
         LDuw==
X-Gm-Message-State: AFqh2kpNADOJFfkan3OYRSNg6oDM+SaHxQxp6c6kV2HG2/gJy9lRIn3b
        BtFX9tXhQmw3sm/MUYGisFxuHA==
X-Google-Smtp-Source: AMrXdXtSCGNwFYMKfMVzHWvbvChN4XjFuVYEwrUFK0U4mbHjX4GIFKntuwa8PQWIutEaY8g9EcHY3Q==
X-Received: by 2002:a05:6000:910:b0:242:733b:af28 with SMTP id bz16-20020a056000091000b00242733baf28mr58796163wrb.5.1673368354494;
        Tue, 10 Jan 2023 08:32:34 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d6686000000b002bb3229a03csm10562820wru.34.2023.01.10.08.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 08:32:33 -0800 (PST)
Message-ID: <9849e94a-abd6-37f2-8c49-e923bb554dee@linaro.org>
Date:   Tue, 10 Jan 2023 17:32:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: add zhihe
Content-Language: en-US
To:     Yang Xiwen <forbidden405@foxmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Jaime Breva <jbreva@nayarsystems.com>,
        Nikita Travkin <nikita@trvn.ru>,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230110155014.31664-1-forbidden405@foxmail.com>
 <tencent_89603CF732FEF0B9A2E88CF0E45A62F42D07@qq.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <tencent_89603CF732FEF0B9A2E88CF0E45A62F42D07@qq.com>
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

On 10/01/2023 16:50, Yang Xiwen wrote:
> zhihe is a placeholder for various 4G USB dongles made by unknown
> manufactures with similar design. It is widely used in China to refer to
> these dongles.

No, it's not descriptive enough. If you bring support for specific
device, this device is already known to you.

Best regards,
Krzysztof

