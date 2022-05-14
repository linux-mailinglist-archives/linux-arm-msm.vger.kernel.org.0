Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8975526F7B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 09:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231776AbiENFGI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 01:06:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231769AbiENFF4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 01:05:56 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BB87F41
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 22:05:51 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-ee1e7362caso12921721fac.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 22:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=X/IAgav4s9J/eHMYgeYeDUOX7BruZpeeDkv9wTzgnWY=;
        b=M+uGt8zf3J9fvCZPki4VDQjO6k9RWF3TwzCJRZ6+pV6g+35xfeih5qRCucqItHYPs8
         zougwwQRL7sVf3h8t8ZDSs8xtH5HxaP/km8HpN+fbk+xgOwWOJFpgTdZK4VhKDpWY2R/
         ctcgmcFlPVqmahsyZlDFQW8L7yO1N/8HoK4umZw/7LxTF9JzS8ps6YhLfImaSDoSFRia
         X6elXH8asqFGSE0kbdJTxe2rUptET18s22Cz8anvGjPQK3npB6wZuLCdHwE4U6TG8fo7
         3YJf4h/lcttSV3z/UFbeuLC4zxMuMpWfflC+7um8RCFp956evzBFGVvQOETo5b3oxKYv
         RI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=X/IAgav4s9J/eHMYgeYeDUOX7BruZpeeDkv9wTzgnWY=;
        b=gZB7vnNWdYmK2xHVeAnfTD8mjn/DX8p64fyYn6nJN46g21a7dHoGwtz3tguThC/6go
         Pzb8J3T3fXF8Ag4XaPogocICEgoo1tCmwgEIC6WxJXYNZBCMLDwJmQl8VRwbFp1HxN5c
         /q7C2HIlwaPQ9ajNw++lnh9pX6rJeX9yndSu/FqZUkPqDpWbSZoXb2Iq8bja1u55rGDy
         uDDCrbwz8MzPt7rtIPF+nYqrz8h3G/5OSjFh7S9t/MI2HgrAo7oEnlmWwd52276xO2VP
         2FZEY0WC7QOnLxf38U+kyOOS6OeKxec9nzvW6ClRDtKIRKwvq/dZ4Oug2AhGn13pwo9u
         5rLA==
X-Gm-Message-State: AOAM533LPkfh1HPl2zkKtjEEwXnbxWjCHs23ylLb/HQ9pmrezmClEZz6
        QnHbk5ON1qxxtU+k9W9fdSzrPw==
X-Google-Smtp-Source: ABdhPJy70FSboA/M7j4vD92dz5/lEptNURnyMkDTAyA1IhHQZoa5U8vy7hqJG1EE8gw+gexfUrUTGA==
X-Received: by 2002:a05:6870:a2cd:b0:ed:754:a2c6 with SMTP id w13-20020a056870a2cd00b000ed0754a2c6mr9067488oak.270.1652504750057;
        Fri, 13 May 2022 22:05:50 -0700 (PDT)
Received: from [192.168.11.16] (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id r25-20020a4a7019000000b0035eb4e5a6c8sm2006483ooc.30.2022.05.13.22.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 22:05:49 -0700 (PDT)
Message-ID: <3d856d44-a2d6-b5b8-ec78-ce19a3686986@kali.org>
Date:   Sat, 14 May 2022 00:05:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH] ath10k: do not enforce interrupt trigger type
Content-Language: en-US
To:     Kalle Valo <kvalo@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Govind Singh <govinds@codeaurora.org>,
        ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
References: <20220513151516.357549-1-krzysztof.kozlowski@linaro.org>
 <87zgjl4e8t.fsf@kernel.org>
From:   Steev Klimaszewski <steev@kali.org>
In-Reply-To: <87zgjl4e8t.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 5/13/22 10:57 AM, Kalle Valo wrote:
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:
>
>> Interrupt line can be configured on different hardware in different way,
>> even inverted.  Therefore driver should not enforce specific trigger
>> type - edge rising - but instead rely on Devicetree to configure it.
>>
>> All Qualcomm DTSI with WCN3990 define the interrupt type as level high,
>> so the mismatch between DTSI and driver causes rebind issues:
>>
>>    $ echo 18800000.wifi > /sys/bus/platform/drivers/ath10k_snoc/unbind
>>    $ echo 18800000.wifi > /sys/bus/platform/drivers/ath10k_snoc/bind
>>    [   44.763114] irq: type mismatch, failed to map hwirq-446 for interrupt-controller@17a00000!
>>    [   44.763130] ath10k_snoc 18800000.wifi: error -ENXIO: IRQ index 0 not found
>>    [   44.763140] ath10k_snoc 18800000.wifi: failed to initialize resource: -6
> So you tested on WCN3990? On what firmware version? I can add the
> Tested-on tag if you provide that.
>
Hello Krzystof, Kalle,

I have seen this issue as well on a Lenovo Flex 5G, which has a WCN3990:

wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi crc32 
b3d4b790
htt-ver 3.86 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1

With this patch applied, I no longer see the error message in the commit 
message, when I unbind/bind when wifi stops working.

Tested-by: Steev Klimaszewski <steev@kali.org>

-- Steev

