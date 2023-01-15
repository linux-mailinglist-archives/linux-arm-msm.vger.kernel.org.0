Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B134066B205
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jan 2023 16:27:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231241AbjAOP1m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Jan 2023 10:27:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbjAOP1l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Jan 2023 10:27:41 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22EA9C669
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jan 2023 07:27:40 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id x36so2975264ede.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jan 2023 07:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wvay1KMnU8DYPiePLiVifKAccwgVEIM+/adlsOPzNqI=;
        b=klWYCM+oI4v7JnjvTfMKu6wU8/K9RIrjxkX95j5VKYR693snUUoEAyPLN9K4EBLNIG
         VsN8LfczAX0oALEUrCW1PiI39fCTzosaxz8bPvy9SXcBxQdzf01MpZD9YKDKx/AFLX9O
         0KGaTkq9QSxgkX8M3moJFTaWKjxo1x9r4PTHLXKiGM2KggRr5hRUaQpLQ6vOFPJL/bHJ
         jy7lbbh7MFzpkM2SmbLXpy3gF5DcZakbcSM8MmXdAmHjOMEHFOTOpbTT59/O8z17dykN
         0PqzDpj289fxl6OwrjJFY0ONj7Q65UdwhLITz8dBF0HhiOLu44RSJlpOvGeZaICCuFZQ
         q2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wvay1KMnU8DYPiePLiVifKAccwgVEIM+/adlsOPzNqI=;
        b=nM+a4pBx9bO265KmL/jYRo2h5hL6bl2K5UROz4eNYGkX94REZlBtesQiTLMVI8Hbwg
         N7OVKqft8qmQS8pSGtBLaLQ7GAwMqMUuKxdOJyq9QOdzziyR758p4vCkCPJFVg0AYn63
         gnileEWU46BWm2WgiHcXr8TBzg6vF6XG1qMAn6ZJMU3m/EjZOquFuqXHlcbZspHTJvd7
         hoi25TAaMSqtIHFObhIkZ8RaiCno3GeBH14Vjaojs2Lg89PSy/mEofnktAZ0DrQDlGif
         Db9qd5krkf7ZsOT6cGn7BisWmMQtzJfgWf9JXq8TiQM2rAw+rTcr82H0Hxcf1WLROrej
         jpBA==
X-Gm-Message-State: AFqh2kpK2SlHNpKiX+Hj2knykX+0TDUxsovjCSEJJUG2vKn61/2r6pF4
        friiEFpbJGWS9Diz8kabQjAPGw==
X-Google-Smtp-Source: AMrXdXuShes6ieeovAUPUGzwWDrfHcWnxq9jar5fQGcbJ3UTUSuBf62935U8df1MFNXEGru1LcY5rw==
X-Received: by 2002:aa7:d752:0:b0:499:bcfc:f47b with SMTP id a18-20020aa7d752000000b00499bcfcf47bmr20937290eds.16.1673796458642;
        Sun, 15 Jan 2023 07:27:38 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h26-20020a0564020e9a00b0045ce419ecffsm10375850eda.58.2023.01.15.07.27.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jan 2023 07:27:38 -0800 (PST)
Message-ID: <aef753a5-e8b1-5b7b-1b9e-e92a84de15bd@linaro.org>
Date:   Sun, 15 Jan 2023 16:27:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] dt-bindings: qcom: geni-se: Fix '#address-cells' &
 '#size-cells' related dt-binding error
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20230113201038.267449-1-bhupesh.sharma@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230113201038.267449-1-bhupesh.sharma@linaro.org>
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

On 13/01/2023 21:10, Bhupesh Sharma wrote:
> Fix the following '#address-cells' & '#size-cells' related
> dt-binding error:
> 
>    $ make dtbs_check
> 
>    From schema: Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
>         arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: geniqup@4ac0000:
> 		#address-cells:0:0: 2 was expected
> 	From schema: Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml

Don't we want rather to unify the soc address range?

Best regards,
Krzysztof

