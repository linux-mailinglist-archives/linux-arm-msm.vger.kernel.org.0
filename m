Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34B226C50CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 17:32:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbjCVQcg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 12:32:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbjCVQcY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 12:32:24 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A639265C44
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 09:32:09 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id ew6so12377041edb.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 09:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679502728;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V+i6i0olRP38jt/sd5KbM3b2NTrDoLmJjG7X2O9x6AE=;
        b=hnBxt8ZvhRt67vRmkSRcuWkFQm0Bs4hZ9L16icEdFCpm6D3xwV9sGtrA+qBbNqLIYn
         Bg3N7/fOofWcYpAuWywDU7kMjeFq2xK/dBXWzq6nN50HKLFvqipcFR/O5GSM9kSn1f+i
         nTFqS+A5tSac37wtmCYXCdd7Q1OynZjoEygzsinp+yIRMdoQSP5NeQAYie3RLR+xtlmz
         FjASOGVBKCchvHOmEEMEkawK3d1+eJic2ygesLrA0SJMxcCHBndOfJuRl/sqAQ9RW2Cb
         AW+8VD8opKzp1OjWW0BqDDeZv/shxr8A/sSUw2qhUNPMQYWOQXa7VNEBVOQI351s7Qjw
         xOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679502728;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V+i6i0olRP38jt/sd5KbM3b2NTrDoLmJjG7X2O9x6AE=;
        b=x9rt3qZemgoYvJpp89Nnv94kzffNTNbNt7F/xtLdJgzR6xxTyPxjZBHL88WgtwegMH
         Bbt3lQT5Xnr/sgiOuoXOPNBT6BkjRVXO824mLlCwTUqL50+5odoWoqWwjcmeBRAK/TML
         kr/rHSgTAMrE/fV2y+Kl+WAAKAd8llxpDcQIcAKoRAka16VN6CgS+G/riF0DDKA0vdwY
         8LRKBrv7wnuoyNZYvR4FXuMkgA1W9GbbxQ7r6gnwzfscjNhUupYyb2bihoEVjxDn3geR
         4mk/SFP899yN/1UDLi+nerAZcAPW96KTAjZBvOjBvQTbdscJnn2nw1Yamh6GrLRX4niS
         PqDg==
X-Gm-Message-State: AO0yUKUa5WfmquifduL9s9KWNsP+CXp415X3IrE2x5x3gnZ/M3S6KUEj
        O4EQ1hBboKmrtsaa4Z9ev4lQlQ==
X-Google-Smtp-Source: AK7set8/kyHn3yaWx8aQ/JRJFCUYw7PEPwsszRJF7DuXmqkwnUHS2rwonarvwlHh++PzsO0WpZ1yjw==
X-Received: by 2002:aa7:dac8:0:b0:4fd:2007:d40b with SMTP id x8-20020aa7dac8000000b004fd2007d40bmr7484771eds.9.1679502727997;
        Wed, 22 Mar 2023 09:32:07 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5050:151b:e755:1c6? ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id i20-20020a508714000000b004fc649481basm8099908edb.58.2023.03.22.09.32.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 09:32:07 -0700 (PDT)
Message-ID: <2cb5fca2-56bc-c706-912b-2b8eaf7b3b94@linaro.org>
Date:   Wed, 22 Mar 2023 17:32:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/4] arm64: dts: qcom: move elish dts to common dtsi
Content-Language: en-US
To:     Jianhua Lu <lujianhua000@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230322150320.31787-1-lujianhua000@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230322150320.31787-1-lujianhua000@gmail.com>
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

On 22/03/2023 16:03, Jianhua Lu wrote:
> There are two panel variants of xiaomi-elish, BOE and CSOT panel.
> In order to support both panels, so move elish dts to common dtsi.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
>  ...m8250-xiaomi-elish.dts => sm8250-xiaomi-elish-common.dtsi} | 4 ----

This breaks the build.

Best regards,
Krzysztof

