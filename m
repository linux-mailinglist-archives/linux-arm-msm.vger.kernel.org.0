Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13F285543F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jun 2022 10:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230518AbiFVIKV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jun 2022 04:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351463AbiFVIKN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jun 2022 04:10:13 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 720D737AB0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 01:10:11 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id i10so18460054wrc.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 01:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=R4bw93UekXSuHSNQNFdF25jj0RvEbEo1Y6oF5ocRdUA=;
        b=y8KcT8rvsYu8HA14LSGX6EEHr0vF1AvJn3gOJM2PNGWVaNv+JrHT5dp0/8UBB81s0L
         hIZxJA+HfXeXAxxAonODbCzkA5b2ELnT2H5j5MqrniEKrRucdiUhiP4cCzrOfB7fUbTE
         fdLa3TcWvZ7Npq/jDcHWKionjAd9HHNZd/izAqKwvwVCEzyjEEIhYnOe7ibVuSXhV3Zu
         OBRlwUMsVYSHUUzG0oIVt/aO52FbNs1I06gZ60iU1cnEpA4ek2NwGUJKIAU0BSxmGVLj
         6iZEZQZ5oepqx3M2fAieIRigKER9FGocGEP5Lc4v2paguhy9yCdLqEViYWGuXLlKB7aQ
         05KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=R4bw93UekXSuHSNQNFdF25jj0RvEbEo1Y6oF5ocRdUA=;
        b=3D4G1xa67PiZz7DkcRvKUDjBM+QDrxlatVO2xKR4OCSsbMpz7csg7aFgIezZO+ij0a
         wr4pGYCYEN+ZKBGeCp9DBuy95kp5Tc4F7PHdvJ0QTM6GTWwop0WncUhDjKEoLG14lEST
         Sa+Qe/MwjWSSe64WT+TP++fZngNu2v9JeanMYnqyOQVH6G8a9gn+MAw4rWu64iopgvSw
         d43uLryBNk/uDKkCruKODouE+4GNnAyR+cjjueT4YtM1d9Y/STMs95QzUT5kMSEa+Paf
         6p/GNeaqfICEK60ftzcHSdyjBB4Zi9imExv92zyTtXf0c8tsZSd6FtCazqEKsL0EXiX5
         TDrw==
X-Gm-Message-State: AJIora+m4vDTc0O4aYmIAVukBmq8VUdSoOypn4gbkAdYddzZJgCoHu3M
        1P/TQBJV0GLfN69BPHmJcGHKGQ==
X-Google-Smtp-Source: AGRyM1voQW/E38nFU688OGDk6JDbvoKpvS+nN9DwGpbMQI2UNcJ9Leh1CU28PlIW7x/VWyEl9Jkyjw==
X-Received: by 2002:a5d:648e:0:b0:217:d2cb:d6b2 with SMTP id o14-20020a5d648e000000b00217d2cbd6b2mr1974096wri.433.1655885410015;
        Wed, 22 Jun 2022 01:10:10 -0700 (PDT)
Received: from [192.168.0.223] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id n17-20020a5d4c51000000b0021b962f4256sm4673759wrt.80.2022.06.22.01.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 01:10:09 -0700 (PDT)
Message-ID: <5251a825-0093-e54e-e652-1bf86edbe5fa@linaro.org>
Date:   Wed, 22 Jun 2022 10:10:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 01/12] dt-bindings: vendor-prefixes: add Shift GmbH
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>
References: <20220521164550.91115-1-krzysztof.kozlowski@linaro.org>
 <1334adaa-83f4-8682-7033-1549cfd8af49@linaro.org>
In-Reply-To: <1334adaa-83f4-8682-7033-1549cfd8af49@linaro.org>
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

On 08/06/2022 12:56, Krzysztof Kozlowski wrote:
> On 21/05/2022 18:45, Krzysztof Kozlowski wrote:
>> Add prefix for SHIFT GmbH, phone manufacturer
>> (https://www.shiftphones.com/en/).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Bjorn,
> 
> A lot of new boards and patches might conflict with these series, so can
> you pick it up early?

Okay... so I'll take it.

Best regards,
Krzysztof
