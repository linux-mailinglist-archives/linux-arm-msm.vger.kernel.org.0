Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 788982DB040
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Dec 2020 16:42:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730202AbgLOPkx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Dec 2020 10:40:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726844AbgLOPkv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Dec 2020 10:40:51 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 375C2C0617B0;
        Tue, 15 Dec 2020 07:40:11 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id j1so11236717pld.3;
        Tue, 15 Dec 2020 07:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CUUB0IoWATxzada4ikDi7RLq5JzMboA0EYEjnfSTamo=;
        b=QPGOCcKZlmf1rjtVYZP9Smv6yPTlv0/rbiED5VUUf0XswRlwwB9NsinuplahUu1L8N
         qDuQuWRfYJqaaam6KW45R53YuVIBOSNZF4M7gygz7R66yiDen/DMlNVqEz415ya5BwsI
         z890OkTuLV9DQ05pNJP1X3mwAD5GyYFK7043xSZxIaj9rrS11oIKn6FNhuRPBFPQcc9T
         AhHn3alnDhvjIOKoWb7Gd3t1XqPe9GeHnh3i3nB5jYYAfoJbMvkn9zpl4AndJXsfV/VO
         fZqxH4VaTXiSplYYcPxM6p+8fJppYTyhMJ/1no1m/yrnODUBj3Mp0QVj+xVHadqlsZp+
         6cPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CUUB0IoWATxzada4ikDi7RLq5JzMboA0EYEjnfSTamo=;
        b=d063JZw/Qr6RrLH05g2iFK5zq+Icdft1uHsZFvjy6Ls4m4lMdlXHj87iOATBAX0oG2
         oTcyA+8CiU3Hu5tF58OzFfn7CZ+s3wjc3uTtjwvOaYVZa9VkkUWkE9W6euBGGfVmokSl
         PGf2tgtjH/h657EOZ11wXEhPkeb++L0vDlTVBzVEcyl9OiJpDjXrvqlR8dbvptQZHskH
         Icq8YxRQTtaOn4vXktv0ojdM0vE8rbobqM2s2nGOV9nqWYOPGxx+UCUYZOfNFyZsOx/5
         pZdpiyWDgjFInnspE7qcRrs7bMrbl8tQbaBQ5EE/9ZRJzru938EMjKqEEpV1rRqNwHn1
         93MA==
X-Gm-Message-State: AOAM530DxDb+cp/vvIQaL4tlQrkp6plwXZoQz7mRx6vKqItv96HMIpQR
        ZeigtOQ2LOilTw7um2jSIA8=
X-Google-Smtp-Source: ABdhPJzUgI0Cw5WRKLDrmzpd9lu/NDlzdUtIzzf+z0qjPuLoipMGmeqs6rslg7SawOncNujA6+kdHQ==
X-Received: by 2002:a17:90a:dc18:: with SMTP id i24mr30737250pjv.118.1608046810646;
        Tue, 15 Dec 2020 07:40:10 -0800 (PST)
Received: from [10.230.29.166] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id w2sm25321830pfb.104.2020.12.15.07.40.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Dec 2020 07:40:09 -0800 (PST)
Subject: Re: [PATCH v2 1/2] arm64: dts: broadcom: clear the warnings caused by
 empty dma-ranges
To:     Arnd Bergmann <arnd@kernel.org>, Ray Jui <ray.jui@broadcom.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Scott Branden <sbranden@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Bharat Gooty <bharat.gooty@broadcom.com>
References: <20201016090833.1892-1-thunder.leizhen@huawei.com>
 <20201016090833.1892-2-thunder.leizhen@huawei.com>
 <20201128045328.2411772-1-f.fainelli@gmail.com>
 <CAK8P3a1_5RgcPz+bgo1bbUBk8NTJd=1-Y5-=CsQYkFgLfTE3_A@mail.gmail.com>
 <9c6c6b7e-8c39-8c49-5c87-9b560c027841@broadcom.com>
 <CAK8P3a2XYk8D80XARrpUSBHk1yye3KHXOdaQge4HNSZZOC=xKw@mail.gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <cd36cdd4-8cec-b688-9d65-3170e2943bf8@gmail.com>
Date:   Tue, 15 Dec 2020 07:40:07 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2XYk8D80XARrpUSBHk1yye3KHXOdaQge4HNSZZOC=xKw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12/14/2020 11:46 AM, Arnd Bergmann wrote:
> On Mon, Dec 14, 2020 at 8:09 PM Ray Jui <ray.jui@broadcom.com> wrote:
>> On 11/28/2020 1:58 AM, Arnd Bergmann wrote:
>>> On Sat, Nov 28, 2020 at 5:53 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>>>>
>>>> On Fri, 16 Oct 2020 17:08:32 +0800, Zhen Lei <thunder.leizhen@huawei.com> wrote:
>>>>> The scripts/dtc/checks.c requires that the node have empty "dma-ranges"
>>>>> property must have the same "#address-cells" and "#size-cells" values as
>>>>> the parent node. Otherwise, the following warnings is reported:
>>>>>
>>>>> arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning \
>>>>> (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but \
>>>>> its #address-cells (1) differs from / (2)
>>>>> arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning \
>>>>> (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but \
>>>>> its #size-cells (1) differs from / (2)
>>>>>
>>>>> Arnd Bergmann figured out why it's necessary:
>>>>> Also note that the #address-cells=<1> means that any device under
>>>>> this bus is assumed to only support 32-bit addressing, and DMA will
>>>>> have to go through a slow swiotlb in the absence of an IOMMU.
>>>>>
>>>>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>>>>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>>>>> ---
>>>>
>>>> Applied to devicetree-arm64/next, thanks!
>>>
>>> The notification may have gone missing, but I had merged it into v5.10-fixes
>>> already, and as of today, it's in mainline, so you can drop it from your
>>> next branch, or just leave it in if you want to avoid taking things out of
>>> your tree.
>>
>> It looks like this patch might have caused a regression on Stingray USB.
>> Bharat, could you please confirm?
> 
> Well, this is what I had asked about originally, I assumed that
> Florian had asked someone with access to the datasheet.

It looks like we had some bad communication here, the notification email
indicating that you had applied the patch did not make it through, and I
failed to make you aware that I was waiting for some testing from Scott
and Ray.
-- 
Florian
