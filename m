Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13C6E50858C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Apr 2022 12:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355107AbiDTKNh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Apr 2022 06:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377555AbiDTKNg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Apr 2022 06:13:36 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BFA83EF1A
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Apr 2022 03:10:49 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id ks6so2534614ejb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Apr 2022 03:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=NVECxtwyr+h1MCzkZhNc0V0Cz9+ZhnaasNyst9C8ZrY=;
        b=MN2gzMGJbfIWL3HcVvyf8OL0YZ1ZE0IOGBYdKnWdIEXiuo3QEkxE0lvd8Bn97fWQ1K
         Hp0FFp95hB9zfGKutSKYr72FwofXYFa3RLYI06AgF7va5TnDFkA1Wbp0/SjHZMGlKyC8
         9MfxaNunD6yWIIB2KecSmJRCBvoDOR7aKSQVeULVCmTeHtNztDK4YZ4f9U6uteSVs8Ir
         6HQR9MKcmIH3fcRBWiC6X2V+6xSg6yBF8Fgmy6ICi+keJQnRUU8V09BKH7+XDMVVVVEH
         pG0RNIc++eHvl1H4f9VCsNTTmhfEcfc9yEVd8g2od0tW5NVAtOq+OYvjoFptFgS9cR1T
         HC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NVECxtwyr+h1MCzkZhNc0V0Cz9+ZhnaasNyst9C8ZrY=;
        b=2eKkYsQqrH98ucb+LbfpsI/8iW8IQhUs22PgU366oGpH7nhMN0tvJwq2tC0dX1aRKd
         6eXfySxp3ZNejZTQIAT7I/FfWI9FF4D0bgokA8nWd/FCJgaWVbtCsIstaGMaFWwuE7wU
         mADeI7VCBSMEG+ZSwU5PutCIvBhHf1D/lH2Zv/Jw/CUsZnvNT0ZZfb3uijAXJNlb4sJE
         RFk2DnUj3A3+0BUXHiuFLv59o09A9X3Ry0tdBbnYsdATaXEIt83u5cDRAF448meU1LY6
         gL0PdpCUPGugRm2pzKV6WK2osDchUzazjG4SuPonNlaoXg96swKjjvEqzS9d69vL3aEc
         RDMA==
X-Gm-Message-State: AOAM5313VDKg9ASslBIe/NdkBlNxSQ/OD+b5LEo1bFZyoTaR1UAJhR7p
        EUU8wV+4tInwHHT1be1juBseGw==
X-Google-Smtp-Source: ABdhPJxUTEttfbKbq5it5c3tqzbrnVjgzvgC20SsQW9PegqGDazwYB1SE9hr9psS+ynCoMCC6RU6cA==
X-Received: by 2002:a17:907:6d23:b0:6d9:ac9d:222 with SMTP id sa35-20020a1709076d2300b006d9ac9d0222mr17809454ejc.595.1650449448186;
        Wed, 20 Apr 2022 03:10:48 -0700 (PDT)
Received: from [192.168.0.224] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id da11-20020a056402176b00b00422f5d9762fsm7259384edb.67.2022.04.20.03.10.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Apr 2022 03:10:47 -0700 (PDT)
Message-ID: <3e854b22-cd52-1ff5-78f5-c2b89093dff9@linaro.org>
Date:   Wed, 20 Apr 2022 12:10:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 2/4] arm64: dts: Add msm8939 SoC
Content-Language: en-US
To:     Jun Nie <jun.nie@linaro.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org, benl@squareup.com, jwillcox@squareup.com,
        jgates@squareup.com, mchen@squareup.com, zac@squareup.com,
        Leo Yan <leo.yan@linaro.org>
References: <20220419010903.3109514-1-bryan.odonoghue@linaro.org>
 <20220419010903.3109514-3-bryan.odonoghue@linaro.org>
 <737d44a9-56ba-846e-24ad-36b2da52d2d7@linaro.org>
 <CABymUCOAKvZXZKYtvunjn=K9mpZmAd4x3WTXH571k5BsBH6CEA@mail.gmail.com>
 <0cb490f4-3df8-7fc8-277f-070e0133f5db@linaro.org>
 <CABymUCN_N_yKuuF0zdwZ_jfd-UsfSt-HY5O4PjZ_sNmYGQ2UJw@mail.gmail.com>
 <CABymUCMxOTxmKP07A4HMz4iMyJHhwsh5PE9hskazGck_eRFt9A@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CABymUCMxOTxmKP07A4HMz4iMyJHhwsh5PE9hskazGck_eRFt9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/04/2022 12:00, Jun Nie wrote:
> Maybe it should like this?
> 
> cpr_efuse_init_voltage1: efuse {

"efuse" is good. To make it clear - we talk here only about node names.

Best regards,
Krzysztof
