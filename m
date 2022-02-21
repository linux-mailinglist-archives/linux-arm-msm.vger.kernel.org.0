Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7573C4BE608
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Feb 2022 19:01:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358876AbiBUNVK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Feb 2022 08:21:10 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358875AbiBUNUi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Feb 2022 08:20:38 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C76531EEDB
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Feb 2022 05:20:15 -0800 (PST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A66793F1C8
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Feb 2022 13:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645449614;
        bh=khb30gE+RkFEqmWXwauRdw21yNeM7x8VXwtb7dTjxrk=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=t7KNvlr5/wlubIja/R1BCH3ZwjcG8zSQdxBU/37EH48lJvMdmiVNiGyOgf823LFJr
         b6SmvODIzTM0RoTRa9Ylb6zx8ZIYLqKohCHKg9gGr4uO3QGLLtjUis557bC7iAsmO3
         N7qqjNA+LGT5i0WTfSCVYoJ1uMDFKbYaKenviqqd4h/T2+4YqwemEiW0shqoGCbqz+
         8enAkM1yhLvId1ZHMLIGpRhLqKp3dGSyx28/NEmcuu1gwsAP6bgHY0GC6Mng5ODpQq
         mcuQf+7c5G1/KSszmdshERWaTpcQFLvp0sCRlMy+1SVAwWU2v8Xzu+rsL8Kulc8dcB
         lgWQY3/SqI03g==
Received: by mail-ej1-f72.google.com with SMTP id la22-20020a170907781600b006a7884de505so4649531ejc.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Feb 2022 05:20:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=khb30gE+RkFEqmWXwauRdw21yNeM7x8VXwtb7dTjxrk=;
        b=CK6FvvmUmXXgAHxwvmxrdD6134M9RwOU9H9bUINcOYVyKq1aM32x3Del0B1arMebl7
         bpv9aRRgavvyU7/9M3JdgKSJa4WG+i+A4emd7Jy50Q5yKVyAGgiwHh0twrB9haSjY5PG
         GtAt5Vqih7o6cNS8XGGC/F5UYIov8jnRI78IXIeApVcZQ4rrD61trPu4L4fYkDfwF2xs
         vS81qNwW1wJ9yIFxX+x/VMgmJwIONFG5xHo2t55wQccAI/1BI8412nt7UiNfxtO9l4L4
         vCkH72qWHOo3gwUBG56SemHBVit+d/soM3VV4aUSGPSMMOyRpZ2LE2tVYCSFYwa2BZEF
         JGWA==
X-Gm-Message-State: AOAM531p9fN722YmLjDeAdTM9+szdwalNU3ErG6iSOKi9e4dY6mNyGeX
        jszGU1H/IQXE4aZKnPv3r2ng8ZGIZXzUudlW6o7ugXUMrL4bSIsURNjrCNp+cOzSSGuppWHdAgh
        MvlqNzsU0HJ6DxYLVnbqwueUW+z+S+KJ3pOdg11aHXEA=
X-Received: by 2002:a50:aa87:0:b0:40f:28a0:d0d6 with SMTP id q7-20020a50aa87000000b0040f28a0d0d6mr21735610edc.368.1645449614307;
        Mon, 21 Feb 2022 05:20:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyn8wRl+WsEMmydGs9g9zLLhKIDtqHUJiepwJxzF0w7Uxxo57NBO0zLCpmBeBDH0NoWgBQ/Vw==
X-Received: by 2002:a50:aa87:0:b0:40f:28a0:d0d6 with SMTP id q7-20020a50aa87000000b0040f28a0d0d6mr21735589edc.368.1645449614162;
        Mon, 21 Feb 2022 05:20:14 -0800 (PST)
Received: from [192.168.0.122] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id 18sm5084626ejj.1.2022.02.21.05.20.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Feb 2022 05:20:13 -0800 (PST)
Message-ID: <19705501-2391-14a4-0eac-4b2b647a9735@canonical.com>
Date:   Mon, 21 Feb 2022 14:20:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 8/8] arm64: dts: ti: use 'freq-table' in UFS node
Content-Language: en-US
To:     Nishanth Menon <nm@ti.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Wei Xu <xuwei5@hisilicon.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Jan Kotas <jank@cadence.com>, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20220219184224.44339-1-krzysztof.kozlowski@canonical.com>
 <20220219184554.44887-1-krzysztof.kozlowski@canonical.com>
 <20220221131340.q3hjpjevqrfvhggv@specimen>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220221131340.q3hjpjevqrfvhggv@specimen>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/02/2022 14:13, Nishanth Menon wrote:
> On 19:45-20220219, Krzysztof Kozlowski wrote:
>> The 'freq-table-hz' property is deprecated by UFS bindings.
>> The uint32-array requires also element to be passed within one <> block.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> index 599861259a30..c3afef0321ae 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> @@ -1257,7 +1257,9 @@ ufs@4e84000 {
>>  			compatible = "cdns,ufshc-m31-16nm", "jedec,ufs-2.0";
>>  			reg = <0x0 0x4e84000 0x0 0x10000>;
>>  			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
>> -			freq-table-hz = <250000000 250000000>, <19200000 19200000>, <19200000 19200000>;
>> +			freq-table = <250000000 250000000
> 
> <min max> is much more readable and less error prone in case of a large
> set.

Pairs are easily visible if split per line, so readability is similar.
Not much is lost.

> 
>> +				      19200000 19200000
>> +				      19200000 19200000>;
> 
> are you sure the removal of the tuple adds value?

DT schema requires it, or rather: I do not know how to express uint32
tuples in DT schema. All my tries failed.


Best regards,
Krzysztof
