Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEF2B7686F1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 19:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjG3R7x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Jul 2023 13:59:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbjG3R7w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Jul 2023 13:59:52 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79688109
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Jul 2023 10:59:51 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-522bc9556f5so1397312a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Jul 2023 10:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690739990; x=1691344790;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FSJqbfGxSZx2i5RNr9G8wPRqJiZZNE7sCK3iaL/cj9c=;
        b=UEQK+/H6QGddS09OZfyK5ujBTp3390temPIpEXmA4uvFc539be2qZnSMxdye34d4BW
         TtAmPbw+T2A0d2g9oOUxapzumGffqnnNJwRWxPK1nocjL+PvtraJZCETCSHjouJR2out
         /JB9304SQ2cLEPzGVYp4ePBxzq3ve5SuI8l1lKXU5wJNd6ePGT1hGVzxn0oY0VxAp2cz
         93eMdScLUeV7z6qPxvGLrIOoAic0LDfsd29Q2e6g7uLou1EAQftHnLQD21I3t1SHpxWf
         W12VAvcx2zwngZX6H+SviNX2AXRJtfDnh6fTCua5r1EiKVjNQl5YTLldZH3ZhzAeCYJv
         Y8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690739990; x=1691344790;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FSJqbfGxSZx2i5RNr9G8wPRqJiZZNE7sCK3iaL/cj9c=;
        b=WqCOkvnHcmetXcHDOlrAA5FdZ41S+ZChFzUaYLRkC1WSz/jmjlReKeCD2JYma3dzFM
         jILB95cSVnAbwlnLcN4N7qhbg6IY9aKl9NG/dc59ygqRx9Dc7V62pLYd/q9vkVWBnXib
         XIOtqUiHuIXPQbo4G+cxZnRDfzFLzZey26T6Cy4SbvnjdRLaQQ8UWWrOwx0E4NfjFYyV
         S3uip8ktgyBHz4G9D6Uukx+kN7DeVvLYdpGE1VnUKdMyXFhBbBioJ0Br+YOTjjl8eGZj
         wTIkN6pd0eLna5ZF4uzMr8lHilIqaur24xma+PW9G34hENrx7IJxAcUGCNUIW6dV49Ju
         3XMQ==
X-Gm-Message-State: ABy/qLbzc9Hja2UAZk5i0ewhw4IMOeShOk8PZTju3xbmg1dcQM7T53Y/
        8FfVXWKa+IB92rqnHJ0eNURLC1/D8olSjQvMPGk=
X-Google-Smtp-Source: APBJJlGuuhpUzQK9aJWzdzJjIAbCdUFoEoexku10QfUbate8to98hDRjqKN9sK0ziuh9fO+4uC13Cw==
X-Received: by 2002:aa7:c9c9:0:b0:522:bff2:dd20 with SMTP id i9-20020aa7c9c9000000b00522bff2dd20mr2072533edt.13.1690739989992;
        Sun, 30 Jul 2023 10:59:49 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id y23-20020aa7c257000000b005226f281bc5sm4352411edo.25.2023.07.30.10.59.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Jul 2023 10:59:49 -0700 (PDT)
Message-ID: <a0d10d92-f0e2-7299-96d6-c2575240830b@linaro.org>
Date:   Sun, 30 Jul 2023 19:59:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] arm64: dts: qcom: use defines for interrupts
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230730112024.120903-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230730112024.120903-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/07/2023 13:20, Krzysztof Kozlowski wrote:
> Replace hard-coded interrupt parts (GIC, flags) with standard defines
> for readability.  No changes in resulting DTBs.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8939.dtsi |  2 +-
>  arch/arm64/boot/dts/qcom/sdm630.dtsi  | 16 ++++++++--------
>  2 files changed, 9 insertions(+), 9 deletions(-)

This is incomplete. I found few more cases for arm64, so I will send a v2.

Best regards,
Krzysztof

