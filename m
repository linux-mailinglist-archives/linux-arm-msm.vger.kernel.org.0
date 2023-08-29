Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C295278CA57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Aug 2023 19:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbjH2RMJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Aug 2023 13:12:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237707AbjH2RMC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Aug 2023 13:12:02 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E151B7
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 10:11:58 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-99bcf2de59cso617461166b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 10:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693329117; x=1693933917;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ot7NCiA1P/g4QoRkOQO6VMoid0N82LUVt6BxtNZWwmA=;
        b=kFkjG26yLAe5K8ALk26O8/s7w9aSc4YyRn0bdowDdLZ4mYavz8iNAtLZOMKkmqIBPI
         WEofqJk1dD4kGs1UmigQ52RgSX1NftgJvQApLCgbLE0C8G64pbc+M7pG5KY/jbMfewyt
         vV0pANu/Xjyjd22oFF0rmlKcXj0/RaAkcTgMJTo+0aakxcK6uFCwG7EScD3iXv6DYIsA
         V6o0J1Ajre6v5lV+umzWIms90yxUpIy0gCS0T2Cj707ONHuDOPps+EKJZnDU4Y/rf8KW
         9Yt2WJ4ui8KIYEUzTEm6viwqveypq0oLZheEwYkl37Exl/4ivyBSRb5k8AX5nqhM306z
         TqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329117; x=1693933917;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ot7NCiA1P/g4QoRkOQO6VMoid0N82LUVt6BxtNZWwmA=;
        b=hu9tGTPMJCLoHyl+eZrikXAbYDutGmsC+ukXCw7Ok22yLt1pKT/EAa6ec3FuDYLZnb
         yK9ixBki0li2Kp15E695LrSeE7ykbThDt6lZita3MCcnyT0enUO+H1DItiSeORvIM4yu
         RXmUTuTJmD9kEw1yic+3Lp5a5IwmklfBktnyU8W08xwjfZ2whVrpT4V4SDeO/Z7EO1s9
         CTfnBigci3GwFnN2uwJAo5cfAJjm17O+Z6eXxITwfvCgKPdKt1agu5jNC+bV3VZw1KiD
         gTD/BGcvSj/nDpUcg7G4Kbl+KBR3ZZ0FO3dUOB5uadT4myRboan2SguODJc/FYQkSc4t
         s4ug==
X-Gm-Message-State: AOJu0Yzd3UjXGz+DOaiPGwge2PY6d4f2hQ6EzN5RsbLTv4my7qUXEBdE
        OmjswuX2UwoNmpsh8WHDWeKAqw==
X-Google-Smtp-Source: AGHT+IHgNSSHh3AWiFFc5SXQxm5XtnChf182toZPst6EvcFV/KfYJ713N6dciRt0nbyr9w+llzG0/A==
X-Received: by 2002:a17:907:2be0:b0:9a5:a247:5bbc with SMTP id gv32-20020a1709072be000b009a5a2475bbcmr5940898ejc.28.1693329116951;
        Tue, 29 Aug 2023 10:11:56 -0700 (PDT)
Received: from [192.168.86.24] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id i13-20020a170906a28d00b0098884f86e41sm6126999ejz.123.2023.08.29.10.11.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 10:11:56 -0700 (PDT)
Message-ID: <f63ce281-1434-f86f-3f4e-e1958a684bbd@linaro.org>
Date:   Tue, 29 Aug 2023 18:11:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 00/10] Hardware wrapped key support for qcom ice and
 ufs
Content-Language: en-US
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     Gaurav Kashyap <quic_gaurkash@quicinc.com>,
        linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-block@vger.kernel.org,
        linux-fscrypt@vger.kernel.org, omprsing@qti.qualcomm.com,
        quic_psodagud@quicinc.com, avmenon@quicinc.com,
        abel.vesa@linaro.org, quic_spuppala@quicinc.com
References: <20230719170423.220033-1-quic_gaurkash@quicinc.com>
 <f4b5512b-9922-1511-fc22-f14d25e2426a@linaro.org>
 <20230825210727.GA1366@sol.localdomain>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230825210727.GA1366@sol.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 25/08/2023 22:07, Eric Biggers wrote:
> Hi Srinivas,
> 
> On Fri, Aug 25, 2023 at 11:19:41AM +0100, Srinivas Kandagatla wrote:
>>
>> On 19/07/2023 18:04, Gaurav Kashyap wrote:
>>> These patches add support to Qualcomm ICE (Inline Crypto Enginr) for hardware
>>> wrapped keys using Qualcomm Hardware Key Manager (HWKM) and are made on top
>>> of a rebased version  Eric Bigger's set of changes to support wrapped keys in
>>> fscrypt and block below:
>>> https://git.kernel.org/pub/scm/fs/fscrypt/linux.git/log/?h=wrapped-keys-v7
>>> (The rebased patches are not uploaded here)
>>>
>>> Ref v1 here:
>>> https://lore.kernel.org/linux-scsi/20211206225725.77512-1-quic_gaurkash@quicinc.com/
>>>
>>> Explanation and use of hardware-wrapped-keys can be found here:
>>> Documentation/block/inline-encryption.rst
>>>
>>> This patch is organized as follows:
>>>
>>> Patch 1 - Prepares ICE and storage layers (UFS and EMMC) to pass around wrapped keys.
>>> Patch 2 - Adds a new SCM api to support deriving software secret when wrapped keys are used
>>> Patch 3-4 - Adds support for wrapped keys in the ICE driver. This includes adding HWKM support
>>> Patch 5-6 - Adds support for wrapped keys in UFS
>>> Patch 7-10 - Supports generate, prepare and import functionality in ICE and UFS
>>>
>>> NOTE: MMC will have similar changes to UFS and will be uploaded in a different patchset
>>>         Patch 3, 4, 8, 10 will have MMC equivalents.
>>>
>>> Testing:
>>> Test platform: SM8550 MTP
>>> Engineering trustzone image is required to test this feature only
>>> for SM8550. For SM8650 onwards, all trustzone changes to support this
>>> will be part of the released images.
>>
>> AFAIU, Prior to these proposed changes in scm, HWKM was done with help of
>> TA(Trusted Application) for generate, import, unwrap ... functionality.
>>
>> 1. What is the reason for moving this from TA to new smc calls?
>>
>> Is this because of missing smckinvoke support in upstream?
>>
>> How scalable is this approach? Are we going to add new sec sys calls to
>> every interface to TA?
>>
>> 2. How are the older SoCs going to deal with this, given that you are
>> changing drivers that are common across these?
>>
>> Have you tested these patches on any older platforms?
>>
>> What happens if someone want to add support to wrapped keys to this
>> platforms in upstream, How is that going to be handled?
>>
>> As I understand with this, we will endup with two possible solutions over
>> time in upstream.
> 
> It's true that Qualcomm based Android devices already use HW-wrapped keys on
> SoCs earlier than SM8650.  The problem is that the key generation, import, and
> conversion were added to Android's KeyMint HAL, as a quick way to get the
> feature out the door when it was needed (so to speak).  Unfortunately this

There is an attempt in 2021 todo exactly same thing I guess,

https://patchwork.kernel.org/project/linux-fscrypt/cover/20211206225725.77512-1-quic_gaurkash@quicinc.com/

If this was the right thing to do they why is the TZ firmware on SoCs 
after 2021 not having support for this ?

> coupled this feature unnecessarily to the Android KeyMint and the corresponding
> (closed source) userspace HAL provided by Qualcomm, which it's not actually

So how does Andriod kernel upgrades work after applying this patchset on 
platforms like SM8550 or SM8450 or SM8250..or any old platforms.

> related to.  I'd guess that Qualcomm's closed source userspace HAL makes SMC
> calls into Qualcomm's KeyMint TA, but I have no insight into those details.
> 
If we have an smcinvoke tee driver we can talk to to this TA.

> The new SMC calls eliminate the dependency on the Android-specific KeyMint.

I can see that.

Am not against adding this new interface, but is this new interface 
leaving a gap for older platforms?


Is there any other technical reason for moving out from TA based to a 
smc calls?

And are we doing a quick solution here to fix something


> They're also being documented by Qualcomm.  So, as this patchset does, they can
> be used by Linux in the implementation of new ioctls which provide a vendor
> independent interface to HW-wrapped key generation, import, and conversion.
> 
> I think the new approach is the only one that is viable outside the Android
> context.  As such, I don't think anyone has any plan to upstream support for
> HW-wrapped keys for older Qualcomm SoCs that lack the new interface.

AFAIU, There are other downstream Qualcomm LE platforms that use wrapped 
key support with the older interface.
What happens to them whey then upgrade the kernel?

Does TA interface still continue to work with the changes that went into 
common drivers (ufs/sd)?

--srini

> 
> - Eric
