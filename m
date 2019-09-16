Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB97B3A4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2019 14:26:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732659AbfIPMZ7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Sep 2019 08:25:59 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:36310 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732656AbfIPMZ7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Sep 2019 08:25:59 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190916122557euoutp0107e2002fbe42aaa30b0b8117557ff826~E6tHLRBNX0041100411euoutp01s
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Sep 2019 12:25:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190916122557euoutp0107e2002fbe42aaa30b0b8117557ff826~E6tHLRBNX0041100411euoutp01s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1568636757;
        bh=pd4LFeq8Hf58x/uaWkVtzZwd7F67Yro/hz+c01DyRcI=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=T2TOmDnahUthPHi9YcaYdbBQel9Sc0qqCn1FJ+pZu4rTZMqSyyO73UFBP8z+Wm//4
         RIxz3xcgBppvptdP4JIfeM1nJFj0x/oPaRzUsAbsRKdUaJVN8OmYJNNbMHT3RF2mvf
         My6mjNkBFXCIH56CGALBRLlVeWCVxYlssw7DSHdY=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190916122555eucas1p1b403dcd9a69c421eec08dea14a4aabf7~E6tGKH_RG0799707997eucas1p1N;
        Mon, 16 Sep 2019 12:25:55 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 35.93.04469.35F7F7D5; Mon, 16
        Sep 2019 13:25:55 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190916122555eucas1p100b7f2c9c7c63a585a8b96aafb931c01~E6tFWzA1e0775607756eucas1p1P;
        Mon, 16 Sep 2019 12:25:55 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190916122554eusmtrp29217d31fe51b7619dabfd1be6c2cf541~E6tFIeilQ1085610856eusmtrp2y;
        Mon, 16 Sep 2019 12:25:54 +0000 (GMT)
X-AuditID: cbfec7f2-569ff70000001175-c7-5d7f7f536494
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 47.D6.04166.25F7F7D5; Mon, 16
        Sep 2019 13:25:54 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190916122553eusmtip281778247ca06eec9d1ec906ab34edca4~E6tETXae41817718177eusmtip2D;
        Mon, 16 Sep 2019 12:25:53 +0000 (GMT)
Subject: Re: [PATCH 05/11] drm/bridge: analogix-anx78xx: correct value of
 TX_P0
To:     Brian Masney <masneyb@onstation.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org,
        narmstrong@baylibre.com, robdclark@gmail.com, sean@poorly.run,
        airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com,
        jonas@kwiboo.se, jernej.skrabec@siol.net, linus.walleij@linaro.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <d729f4cd-1d00-fc8b-1688-78c9f325eeac@samsung.com>
Date:   Mon, 16 Sep 2019 14:25:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916120228.GA3045@onstation.org>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRTut/tUWtxN04NJ0SAio9QM+kUPCvrjBv2hVNADq1vdluWW7Gbv
        nJXWMrTZ2y0tS5nKophpOlJrSstso/Uws2QLpXf2tHea2y3yv++c833nOx8cllCfp2PYNP1m
        0aAX0jV0OFl747t30kKjMTXhq3089nb/JHG+t1WB25p6STxQW0jgMy1eCt/ve0dj+2MXwqef
        exB+8PUlgVvfPCDxwcIyBh/7ZVNgR3c7hQubPAy+5zxN4/KHPgU+bH1NYVfBcvy89BuBcxta
        GNx1tAXNGcnbS+yIf9eRy/B1XWWIb/hyluTrLV0MbzUVUbyj6iDN3zTfVfBP2q/S/JUvAYr3
        H3Ir+OoyI1/eEcG7nZ0Mfy3/KMl/coxO5paFz1wrpqdtEQ3xs1eFr6+22+iMCxO22Y4VM9mo
        RpOHwljgpsKzwHEmiNVcBYJDPfPzUPgg/owg+1YpKRefENhO5FH/FFZHCZIHNgTvrWW0XLxF
        sLf3R4gVwaXAbYuXDuJIToDuxjchBcHtJ6Hw3JGQIc1NgN/Vj0IkJTcbDjjNITHJjYOGtuIQ
        HsktgY+BZkrmqKC1qGfwJpYN46aAf1+oTXBjYF+NlZBxNHT2nFEEvYALsFBQ+pQI8oGbB3mV
        s+QEEfDKfZmRcSwM1Af5QWwEf0UOIWtNCGou1RPyYAY0u31UcA8xePNFZ7zcngvmNh8prx8B
        HW9V8gkj4Ejtyb+uSjDtV8vsseD31PxdGA3ld/poM9JYhuSyDAljGRLG8t/3LCKrULSYKem0
        opSoF7dOlgSdlKnXTl6zSedAg6/b1u/+WIf67q52IY5FmuHK7NysVDUlbJG261wIWEITqUze
        bUxVK9cK23eIhk0rDZnpouRCo1hSE63cOSywXM1phc3iRlHMEA3/pgo2LCYbqdQ7vH3C0vxR
        Rb0rLvdfq2pOemluqa9OOEVHNZK5A4v0ppR1CbaLCZEHYozD2p1RGZ6xSa7G1/7jYlblLt/E
        F/eTdu+pTI7SLjF4xcSNOaYuV4pwc4G2WPLVfZje9AS/UJmy4hsW57R6ptWlXY+d8/hUf6cr
        dn6P6lVcwYbfP3UaUlovJMYRBkn4A6FlcQK2AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sf0yMcRzH931+3XPN6XGV+8qGnTWyeXJX6Zvphg2PYcL8WGl5lmdF3V27
        52p+TEVCWZT84yn9oNMkTXerrmjlpNyukiiJxLKh/BoqJj+qY+u/1/Z+vf74bB8aV9pJX3q/
        wSyYDHyCmvIgXL9bXyzdlpoatcxSwqKOwZ8Eyu5wYsjV+JFAf2pycVTU3EGixyOfKFTxzAFQ
        wZt2gLrH3uHI+b6bQJm5pTJ0YbwMQ9bBHhLlNrbL0KP6AgpZnjzE0Ln8YRI5zkaiNyXfcZTR
        0CxD/XnNYJUPV1FYAbhPvRkyzt5fCriG0WKCq5P6ZVz+6YskZy3PpLj7OV0Y97znNsXVjr4k
        uYEzrRhnK03lLL1eXGt9n4xrys4juK/WeeFMBLvSZEwyCwvijKI5TB2pQVpWE4pYbVAoqwkM
        iVqhDVYH6FbuExL2JwumAN1eNs5WUUYl3vA/WHbhkiwNVKuzgJyGTBDMtxaCLOBBKxkLgJcz
        h3D3oIK3ij78Yy843pNFuaVhAI9/LMMmBy9mK2yTOqhJ9mZ46Pp5dUrCmZMErKtsIN3FTRx2
        j1QRkxbF+MNftqdThYLRwVP1OeQkE4wfbHBdmmIfZje8a5eA25kFnRdfT7Q0LWe0cCB9SsGZ
        RXC8sAt383yYXp3/j1Ww73URlgOU0rRampZI0xJpWlIMiHLgLSSJ+li9qGFFXi8mGWLZGKPe
        Cia+pqblh80Ouqq2OwBDA/UMRVpGSpSS5JPFQ3oHgDSu9laEH02NUir28YcOCyZjtCkpQRAd
        IHjitlzc1yfGOPGDBnO0JlgTgkI1IYEhgcuRWqU4zdzZo2RiebMQLwiJgul/h9Fy3zTgufna
        jrH2yuqIY9ROc+PcLRsMHtfPh9Oe8xds6o75su6UIX5XdvTcxctLZvr0dGqji2e/WP3AhS17
        q+NH158bGWgfbdPJ4x+eOGLPs6UHduosCz3jmmrXql45zZ6Sk51DyTePkfdK04Kl4gMpfnXf
        Oq9s5NdEbmj5XFU51KoKYzzUhBjHa5bgJpH/C4U8smxLAwAA
X-CMS-MailID: 20190916122555eucas1p100b7f2c9c7c63a585a8b96aafb931c01
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190815004918epcas3p135042bc52c7e3c8b1aca7624d121af97
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190815004918epcas3p135042bc52c7e3c8b1aca7624d121af97
References: <20190815004854.19860-1-masneyb@onstation.org>
        <CGME20190815004918epcas3p135042bc52c7e3c8b1aca7624d121af97@epcas3p1.samsung.com>
        <20190815004854.19860-6-masneyb@onstation.org>
        <dc10dd84-72e2-553e-669b-271b77b4a21a@samsung.com>
        <20190916103614.GA1644@onstation.org>
        <20190916104907.GB4734@pendragon.ideasonboard.com>
        <3ec4f0bc-f3c5-aebf-8213-bc4f80915902@collabora.com>
        <20190916120228.GA3045@onstation.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16.09.2019 14:02, Brian Masney wrote:
> On Mon, Sep 16, 2019 at 01:32:58PM +0200, Enric Balletbo i Serra wrote:
>> Hi,
>>
>> On 16/9/19 12:49, Laurent Pinchart wrote:
>>> Hi Brian,
>>>
>>> On Mon, Sep 16, 2019 at 06:36:14AM -0400, Brian Masney wrote:
>>>> On Mon, Sep 16, 2019 at 12:02:09PM +0200, Andrzej Hajda wrote:
>>>>> On 15.08.2019 02:48, Brian Masney wrote:
>>>>>> When attempting to configure this driver on a Nexus 5 phone (msm8974),
>>>>>> setting up the dummy i2c bus for TX_P0 would fail due to an -EBUSY
>>>>>> error. The downstream MSM kernel sources [1] shows that the proper value
>>>>>> for TX_P0 is 0x78, not 0x70, so correct the value to allow device
>>>>>> probing to succeed.
>>>>>>
>>>>>> [1] https://github.com/AICP/kernel_lge_hammerhead/blob/n7.1/drivers/video/slimport/slimport_tx_reg.h
>>>>>>
>>>>>> Signed-off-by: Brian Masney <masneyb@onstation.org>
>>>>>> ---
>>>>>>  drivers/gpu/drm/bridge/analogix-anx78xx.h | 2 +-
>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/bridge/analogix-anx78xx.h b/drivers/gpu/drm/bridge/analogix-anx78xx.h
>>>>>> index 25e063bcecbc..bc511fc605c9 100644
>>>>>> --- a/drivers/gpu/drm/bridge/analogix-anx78xx.h
>>>>>> +++ b/drivers/gpu/drm/bridge/analogix-anx78xx.h
>>>>>> @@ -6,7 +6,7 @@
>>>>>>  #ifndef __ANX78xx_H
>>>>>>  #define __ANX78xx_H
>>>>>>  
>>>>>> -#define TX_P0				0x70
>>>>>> +#define TX_P0				0x78
>>>>>
>>>>> This bothers me little. There are no upstream users, grepping android
>>>>> sources suggests that both values can be used [1][2]  (grep for "#define
>>>>> TX_P0"), moreover there is code suggesting both values can be valid [3].
>>>>>
>>>>> Could you verify datasheet which i2c slave addresses are valid for this
>>>>> chip, if both I guess this patch should be reworked.
>>>>>
>>>>>
>>>>> [1]:
>>>>> https://android.googlesource.com/kernel/msm/+/android-msm-flo-3.4-jb-mr2/drivers/misc/slimport_anx7808/slimport_tx_reg.h
>>>>>
>>>>> [2]:
>>>>> https://github.com/AndroidGX/SimpleGX-MM-6.0_H815_20d/blob/master/drivers/video/slimport/anx7812/slimport7812_tx_reg.h
>>>>>
>>>>> [3]:
>>>>> https://github.com/commaai/android_kernel_leeco_msm8996/blob/master/drivers/video/msm/mdss/dp/slimport_custom_declare.h#L73
>>>> This address is 0x78 on my Nexus 5. Given [3] above it looks like we
>>>> need to support both addresses. What do you think about moving these
>>>> addresses into device tree?
>>> Assuming that the device supports different addresses (I can't validate
>>> that as I don't have access to the datasheet), and different addresses
>>> need to be used on different systems, then the address to be used needs
>>> to be provided by the firmware (DT in this case). Two options are
>>> possible, either specifying the address explicitly in the device's DT
>>> node, or specifying free addresses (in the form of a white list or black
>>> list) and allocating an address from that pool. The latter has been
>>> discussed in a BoF at the Linux Plumbers Conference last week,
>>> https://linuxplumbersconf.org/event/4/contributions/542/.
>>>
>>>> The downstream and upstream kernel sources divide these addresses by two
>>>> to get the i2c address. Here's the code in upstream:
>>>>
>>>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/bridge/analogix-anx78xx.c#L1353
>>>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/bridge/analogix-anx78xx.c#L41
>>>>
>>>> I'm not sure why the actual i2c address isn't used in this code.
>> The ANX7802/12/14/16 has a slave I2C bus that provides the interface to access
>> or control the chip from the AP. The I2C slave addresses used to control the
>> ANX7802/12/14/16 are 70h, 72h, 7Ah, 7Eh and 80h. Every address allows you to
>> access to different registers of the chip and AFAICS is not configurable.
>>
>> I don't think these addresses should be configured via DT but for the driver itself.
>>
>> My wild guess is that the ANX7808 has different addresses, but I don't have the
>> datasheet of this version.
> I'm able to communicate with the 7808 on my Nexus 5 using the 0x78
> address. Given that the addresses appear to be fixed per model, maybe it
> makes sense to drop the address #defines and add the addresses to the
> data pointer in the driver's of_match_table like so:
>
> static const struct of_device_id anx78xx_match_table[] = {
>         { .compatible = "analogix,anx7808", .data = PTR_TO_7808_ADDRS },
>         { .compatible = "analogix,anx7812", .data = PTR_TO_781X_ADDRS },
>         { .compatible = "analogix,anx7814", .data = PTR_TO_781X_ADDRS },
>         { .compatible = "analogix,anx7818", .data = PTR_TO_781X_ADDRS },
>         { /* sentinel */ },
> };
>
> Brian
>
>

I have spotted following comment on chromium's ML[1]:

> The locations are hard coded in the register spec.  Furthermore, each
> one can be changed independently--for example the Android driver puts
> 0x38 at 0x3c but leaves the rest alone.

It is not entirely clear, but IMO it suggests these addresses are
hardware configurable.


[1]:
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/44601/2/drivers/auxdisplay/slimport.c#331


Regards

Andrzej

