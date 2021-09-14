Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA2F40A750
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 09:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240703AbhINH0I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 03:26:08 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:59372
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240685AbhINH0H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 03:26:07 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 242D44017B
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 07:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631604290;
        bh=4983Sfp485zuGKC0ImKtxBapf0kX8m2fzxgiCI1l5VQ=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=qqJtCJWSIUAevVqEQZ58Cq9CII7YjkGPxVYlCb9V71knxS97HNwa5fYNTfgAY/uMx
         luL1R/YKa5193vZvst83kT7eHU6NU627mmNNTiAoVOSTEytHurot9P8uOmKsNKWaNT
         +9xQpvK01ai2tKDHphdxoOwgU8QIEYSsfK1rIwR15B93+NVOqD9+/nTCDsghZ95BCC
         8UeetpiCi3LGUpDRcjH9v+BGfjWas43qK1bENbOZ4bT3hkxMARSi4W0ZgWi02f3sXw
         6bR86KZ8oH867y64hN9OCeGcrhM4IcQPE10H0xlPBoFWWuRpHzDkU/WtwIaE7rh+i3
         dN3jQB4H4r7Hw==
Received: by mail-wr1-f72.google.com with SMTP id g1-20020a5d64e1000000b0015e0b21ef04so1689850wri.17
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 00:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4983Sfp485zuGKC0ImKtxBapf0kX8m2fzxgiCI1l5VQ=;
        b=lhQ+iYdDKzlVsEIrtnvEeeer+IGlKwjC2aDuD+l5RfgupHVtMCXGe7sdaHK+Ma8w+f
         rLrZfpB3fhqhBXo9XwbeZCYM+TIXi0B4woyKKSZgntjhfatgxOlyNkr/CW2BajzsXyfW
         aLQRBrNr12v9ttnb80pio8RBEu6AQMUWfGlxmzEMHWaHMidLkIcz7jIiXBogH10ISOkI
         PMA1Z1+U73Jlds3BD/2+2XH15EGn/414NDrS/6X93YzOkUJm/v6chZ3NmDdLDEts0lUB
         kMlh7bb/ILGKqakQibCnowfTrg60A6rtJjThLoiPDoVciWAeFJHpfuN5jolWndmy3Rrs
         0NcA==
X-Gm-Message-State: AOAM533Dt/dVbyxmIfoG3liZQb3UKT1NeooJdgqKbW0UY9QP9OpBLBpo
        mzDeQwbh0kwQTXrmmp8jjfosdOgjXV/FKGzL5GSH6T9r/KOcRnVi/KrLN/cmoquNG+NWP4NVrNK
        cSu9wz3Bm38GfF+1Fzb05p3UBtw3ROts6iUmt7gBvk5w=
X-Received: by 2002:a5d:6a8f:: with SMTP id s15mr12285070wru.15.1631604289822;
        Tue, 14 Sep 2021 00:24:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+Mz4fzrDvBl6O4ft7ymJcQ1n96FBpgww76aw4z7k8DvFWFMiqtByGcTnNnCjUrA24F2YULw==
X-Received: by 2002:a5d:6a8f:: with SMTP id s15mr12285059wru.15.1631604289673;
        Tue, 14 Sep 2021 00:24:49 -0700 (PDT)
Received: from [192.168.3.211] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id m3sm12473012wrg.45.2021.09.14.00.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Sep 2021 00:24:49 -0700 (PDT)
Subject: Re: [PATCH 6/8] dt-bindings: vendor-prefixes: add LG Electronics
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, bartosz.dudziak@snejp.pl,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Max Merchel <Max.Merchel@tq-group.com>,
        Hao Fang <fanghao11@huawei.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210911232707.259615-1-luca@z3ntu.xyz>
 <20210911232707.259615-7-luca@z3ntu.xyz>
 <9942f964-442e-e782-3926-6d7d1123418a@canonical.com>
 <5220943.AHGTne7y6d@g550jk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <4f415ca1-6527-5667-01f2-9676f565d670@canonical.com>
Date:   Tue, 14 Sep 2021 09:24:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5220943.AHGTne7y6d@g550jk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/09/2021 21:14, Luca Weiss wrote:
> Hi Krzysztof,
> 
> On Montag, 13. September 2021 10:49:43 CEST Krzysztof Kozlowski wrote:
>> On 12/09/2021 01:27, Luca Weiss wrote:
>>> LG Electronics is a part of the LG Corporation and produces, amongst
>>> other things, consumer electronics such as phones and smartwatches.
>>
>> Hi,
>>
>> Thanks for the patches.
>>
>> I think "lge" it's the same prefix as "lg". There is no sense in having
>> multiple vendor prefixes just because company splits inside business
>> units or subsidiaries. The same as with other conglomerates, e.g.
>> Samsung - if we wanted to be specific, there will be 4-5 Samsung
>> vendors... Not mentioning that company organisation is not always
>> disclosed and can change.
>>
> 
> I was mostly following qcom-msm8974-lge-nexus5-hammerhead as it's the other LG 
> device tree I am aware of so I've picked lge instead of lg. Also worth noting 
> that Google uses "LGE" in the Android device tree[1] or in the model name in 
> the LG G Watch R kernel sources ("LGE APQ 8026v2 LENOK rev-1.0")

[1] Does not point to kernel tree. Downstream user could be a good
argument to switch to lge, but then I would expect correcting other "lg"
devices which are in fact made by LGE.

> 
> I don't have a strong opinion either way so I'm fine with either.
> 
> If we decide to go with "lg" do we want to change the Nexus 5 devicetree 
> (hammerhead) also, that one has the lge name in at least compatible and 
> filename (I don't know how much of a breaking change that would be considered 
> as).

We would have to add a new one and mark the old compatible as deprecated.

> 
>> We already have lg for several components, also made by LG Electronics.
>> What about these?
>>
>> There is only one device with "lge", added back in 2016 without adding
>> vendor prefix. I would propose to fix that one, instead of keeping
>> duplicated "lg".
>>
>> Best regards,
>> Krzysztof
> 
> Regards
> Luca
> 
> [1] https://android.googlesource.com/device/lge/hammerhead/
> 
> 
> 


Best regards,
Krzysztof
