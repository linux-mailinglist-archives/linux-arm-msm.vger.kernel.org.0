Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2963A60973E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 01:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbiJWXYf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 Oct 2022 19:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbiJWXYd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 Oct 2022 19:24:33 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5663E34
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Oct 2022 16:24:26 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id o2so5239543qkk.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Oct 2022 16:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ahbto9hiV9DffAtJRguQMo7E8rSARJFBBr4lwTw/uw8=;
        b=CHfvOfKpo/gdYMTeeZ5mNmTlLTt0rMRfln8s/3Td1zRge+JB3liabgSkwoB2GhKW1W
         nqAsww9KCqXgMh2ZZUxrrwEu0yCmbDRaTztovxnbL6KL60haIO+Y12UM7Uorzijg2ZpG
         C0TjAUpVj7TOURzv4XLp/dOoQjhBxoUP/No798zq61Vevf1B0ggx6Vw0ATq2VbI/delR
         ePVX+TqbBBuTZb1Z2q7wyYEQqIj3CSttO4Afmekvp96YhtsHys5UXGkdExJwv6D+SPy4
         8g6Y4pqDAO8ZTGvoEwjRz4RkDK9Ec2zAGtW6t3km8D3qSdrFt8jhBzVFuHLsuqetLICo
         bxFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ahbto9hiV9DffAtJRguQMo7E8rSARJFBBr4lwTw/uw8=;
        b=VjkVYpEqzZ1Bbwvk25nbmY4L4onBiBNdqfF89I9BntNzOl8XD2+v0Ao2inayQnovoS
         /A8ZgbqTIYbfl2M6tBX8Hh8WJgY0JFpQMyj1GY1Dq/pL3oS2365Mbk6p47IAjQVYvri1
         pq74s3kOVIkeCY5ufzN2GMLsYeZ/QkL81U3WPopDkBXM6cHlMGQXEVtuacumltOHaJhS
         qHYGlhPP6RSOp4YtYA1KkwWs+ugOPCATE06urWEbX2vB7NgUsGHt1GpUp/22wCDW6JoM
         Djt/7O+NAce2iIxWH2Pn1x2EyFSFSSMkovJP7zdjbmLQs2mMdiAZ7bf3x/DKx+nkt3aT
         REKw==
X-Gm-Message-State: ACrzQf2nbXjKlSTjJg5xt3MiUrCobbjRBvB80WK7bMfP3guamqfDObtH
        F9toiciRN8plEvBQZ9VHG0OKf9SThizsmg==
X-Google-Smtp-Source: AMsMyM73i80zxzKyyDyppmLCguJnb6z08mtxOFwC8dcSTb8UT/1wJloo52SIwFfG44502LmnyPP5Qw==
X-Received: by 2002:a05:620a:430b:b0:6d2:5b2:a70e with SMTP id u11-20020a05620a430b00b006d205b2a70emr21577599qko.26.1666567465433;
        Sun, 23 Oct 2022 16:24:25 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id bq8-20020a05622a1c0800b00394fce5fa64sm11876283qtb.9.2022.10.23.16.24.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Oct 2022 16:24:24 -0700 (PDT)
Message-ID: <507744ea-1c45-03a3-e8cb-13a87bda89d8@linaro.org>
Date:   Sun, 23 Oct 2022 19:24:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 2/4] arm64: boot: dts: msm8996: add blsp1_i2c6 node
Content-Language: en-US
To:     Harry Austen <hpausten@protonmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20221023204505.115141-1-hpausten@protonmail.com>
 <20221023204505.115141-3-hpausten@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221023204505.115141-3-hpausten@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/10/2022 16:45, Harry Austen wrote:
> Add support for the sixth I2C interface on the MSM8996 SoC.
> 
> Signed-off-by: Harry Austen <hpausten@protonmail.com>
> ---
> v1 -> v2: use hyphens and add "-state" pinctrl node name suffix
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

