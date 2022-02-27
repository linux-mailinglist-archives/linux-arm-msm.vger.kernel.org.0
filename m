Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F08D4C5A77
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Feb 2022 11:24:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbiB0KYy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Feb 2022 05:24:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbiB0KYx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Feb 2022 05:24:53 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4918B1E3CF
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Feb 2022 02:24:17 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 06B093FCAA
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Feb 2022 10:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645957456;
        bh=gFalKRe8JlGPelOo/R9VR3IL4dqyePAFZHwDnlwRlEk=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=VkrIilcmGSywaYul+MfgVPHfCS+eszwAVdvvYAKa3YMuxGDkm+5rkDL7eT77QotuT
         7yCf1uyw80BhArcYevCNWVvKaq0jtivxq2dHhFH3I7wNVpoPTnG5TmZepgSk1bndYs
         h3i+GkU0zDI9M4HXwz/NNZ8aiWMpF1PmIEAOlevbCSFu+a7R6Ve0uYcqbDPf+HdKWr
         GaEj/XH7eUHFlLc1JONf+78EwEDbXNAXNXpnbogG1bfA9L55vHVbx0UE0BphzA2jYs
         gZNgtEmnMLg4wDp0TKPVUlkhVFxQIjTaCI4n/mLUdNKgHArp51fay6E8HnlvT10/DD
         R8FAx96aeKj6g==
Received: by mail-ed1-f69.google.com with SMTP id bq19-20020a056402215300b0040f276105a4so4068954edb.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Feb 2022 02:24:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gFalKRe8JlGPelOo/R9VR3IL4dqyePAFZHwDnlwRlEk=;
        b=5QDcbugTK7ldWgu9Ju9rd9PRl7tUt82er2bOV0sve+vkK1LhChMz8J78qnhXGJkS7Y
         FrgFEfBUom5f28cnPCUQZGA0wC4dlSvZbAFZKOWCvLgqHSrYhke+pktGC2xDptE1x2QK
         oOrcCFUJwuusMR0AoyEjh9/Ym97IDmgGjxjxPkPQPstXLP1iuHNdFtF1sS4BDxSJ8hju
         z2o8t110tKJChNxGmfdrF9ZognQFxU6NB8sYrhx7WN4W+R4kkEoPSm9FVFrY5g5o2ChW
         6D0Ksl/suYJYbKuwmGQ710Hpfu/akRAtWUrkzxGs2OXQfCf+Dl3KJ3GkwL5Qf04Vhh8w
         SWbA==
X-Gm-Message-State: AOAM532T/uUuqDsuSMWGDbS6yG3rj6kXbyotFvykmnar7HA/KirgGUJx
        5kLxaYQ+ZLuJV3Em4MlLhERD+FkQkQHLpVQrlUtw7zvSuSG9776P+XJeuyHZ81IEErJheLvl4W9
        9kc6wUbU2MOsq6fYmWyo25KqxFGCbY76x1A0tH6cl0Q8=
X-Received: by 2002:a17:906:d968:b0:6d0:fc05:bdc3 with SMTP id rp8-20020a170906d96800b006d0fc05bdc3mr11342164ejb.719.1645957455521;
        Sun, 27 Feb 2022 02:24:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwl3Y8M/TgNxwE3/0YwpdpPk65xBu71Ro8HLF5s9NgyHBBUg649P8bP26tAeg/OT/XsQvSm8w==
X-Received: by 2002:a17:906:d968:b0:6d0:fc05:bdc3 with SMTP id rp8-20020a170906d96800b006d0fc05bdc3mr11342141ejb.719.1645957455350;
        Sun, 27 Feb 2022 02:24:15 -0800 (PST)
Received: from [192.168.0.133] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id el9-20020a170907284900b006cf8e3c83e3sm3243768ejc.168.2022.02.27.02.24.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Feb 2022 02:24:14 -0800 (PST)
Message-ID: <8ba5fb1b-2b5f-e625-0dbe-2acc3b6656e7@canonical.com>
Date:   Sun, 27 Feb 2022 11:24:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 01/15] dt-bindings: ufs: add common platform bindings
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Yaniv Gardi <ygardi@codeaurora.org>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
 <20220222145854.358646-2-krzysztof.kozlowski@canonical.com>
 <YhktWpoJekR2Lj0D@robh.at.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <YhktWpoJekR2Lj0D@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/02/2022 20:26, Rob Herring wrote:
> On Tue, Feb 22, 2022 at 03:58:40PM +0100, Krzysztof Kozlowski wrote:
>> Add bindings for common parts (platform) of Universal Flash Storage
>> (UFS) Host Controllers in dtschema format.
>>
>> The 'freq-table-hz' is not correct in dtschema, because '-hz' suffix
>> defines uint32 type, not an array.  Therefore deprecate 'freq-table-hz'
>> and use 'freq-table' instead.
> 
> -hz is an array type. We can extend it to matrix if needed.
> 
> I do think this property is a bit questionable. Do we really need a 
> minimum in DT and if not, wouldn't assigned-clocks-rate work? Or an OPP 
> table.
> 

I think the proper solution is OPP table, see also comments from Bjorn:
https://lore.kernel.org/all/YhUodbzxx4wbr+gy@ripper/

I would rather refrain from converting it to OPP tables, because I won't
be able to test any changes in the driver.


Best regards,
Krzysztof
