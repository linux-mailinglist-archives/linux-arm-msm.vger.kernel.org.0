Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CEC05B0477
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 14:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbiIGM6V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Sep 2022 08:58:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbiIGM6T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Sep 2022 08:58:19 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E62DC70E5B
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Sep 2022 05:58:18 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id k10so7687519lfm.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Sep 2022 05:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=yWMwK/YsoC/Ujey0/EKocG05ePnUGPUxEX8WLFL7Uds=;
        b=KZCsHBrWJ3YmYiJQ1BUPP9NK7OMdYStue+E2INfut62TPoIibye4R0l3ZvKQhSIDld
         MWLUaPbwJXzq4pVDeKZ/WYGEkSM465kIhivwG8DkC3obDK655wN2wJZShzxFjS0U7oVR
         EoXWUrGQ38VoAhkt+mSQiK46QuA38esExqk4OJMCIbbqZDZ8xr4TpC/dGzDJM1FAlZh7
         NbGvNHgltMiT7schNRP6nY/DZB95+r3MRCSh9Uu5XhL2+aHbYjRzYEn3HdMs/0CW+Eec
         KEoCK7kO5SGlL/Xd43UeUERxSIoRbFru7m+KqnpQNhn6DJs2Jz6bTTKaT8FriP3nEqvK
         ZMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=yWMwK/YsoC/Ujey0/EKocG05ePnUGPUxEX8WLFL7Uds=;
        b=k+Qx/DF7x4dIo0bLXJRPpnjCKqC9AXioGG+KyNEs32ZKdpcz4sLOlVeJfUXqbEmbQD
         b1OTt66BPreiH7FcCEOTNt7Si7EmZ0AicqHmMFa0EQdALmZ2/kgYGQRbhTZwElRNwYmb
         jbQVQxUYu7v6WnG625qU2P49CRnamUjF6Mw38tBsiXBjO34HbrzPiG8Wsnk19PSiBNis
         i4MBQN02SJZ8vfTuuuv32fKrZVnLE8iquRWSJO3nq9gbNk5VpW3USrTnvydOsTyax9QX
         2ZinW6/wkuqNQVJdxpFV3bPgngUopqTkR2IfxlHlh5ZAwZfQiX/oRkg9RDFYRCgXJpX9
         1nOQ==
X-Gm-Message-State: ACgBeo2zUekHLSNjyb8QceDRQ3aiQUFXXNW5PWaqfEV3Hcnh2g3fGMxq
        +GiCtUQv2p6aVLlFZvQrWBO5Yg==
X-Google-Smtp-Source: AA6agR7JUn1szfsFs0FgS8DCpbxd3nIwU0OnTVR7apMd7af0/BSynwu/vgky3e7MAXBF9jz+jkyx3w==
X-Received: by 2002:a19:e342:0:b0:494:7859:ad7a with SMTP id c2-20020a19e342000000b004947859ad7amr1019488lfk.347.1662555497325;
        Wed, 07 Sep 2022 05:58:17 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 5-20020a2eb945000000b00267232d0652sm2631252ljs.46.2022.09.07.05.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Sep 2022 05:58:16 -0700 (PDT)
Message-ID: <0c319709-5211-28c0-365a-984eb8e51b82@linaro.org>
Date:   Wed, 7 Sep 2022 14:58:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] arm64: dts: qcom: fix syscon node names
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220905091602.20364-1-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220905091602.20364-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/09/2022 11:16, Johan Hovold wrote:
> Some recent changes that added new syscon nodes used misspelled node names.
> 
> Fixes: 86d7c9460e2c arm64: dts: qcom: sm8150: split TCSR halt regs out of mutex
> Fixes: 0da603387225 arm64: dts: qcom: sdm630: split TCSR halt regs out of mutex
> Fixes: 8a8531e69b2d arm64: dts: qcom: sdm845: split TCSR halt regs out of mutex
> Fixes: d9a2214d6ba5 arm64: dts: qcom: sc7280: split TCSR halt regs out of mutex
> Fixes: ce1ac53c7faa arm64: dts: qcom: sc7180: split TCSR halt regs out of mutex
> Fixes: fc10cfa38580 arm64: dts: qcom: msm8998: split TCSR halt regs out of mutex
> Fixes: 100ce2205924 arm64: dts: qcom: msm8996: split TCSR halt regs out of mutex
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Argh. Thanks for fixing!

Best regards,
Krzysztof
