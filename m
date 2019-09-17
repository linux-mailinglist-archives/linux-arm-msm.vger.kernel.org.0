Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06980B4847
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2019 09:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbfIQH27 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Sep 2019 03:28:59 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:41772 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732762AbfIQH25 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Sep 2019 03:28:57 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190917072854euoutp020e26f60fe7c9ef5df8052ff593c3f508~FKTDPa-0C1658816588euoutp02N
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2019 07:28:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190917072854euoutp020e26f60fe7c9ef5df8052ff593c3f508~FKTDPa-0C1658816588euoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1568705334;
        bh=QezmaJ9hcOGstagnwCUhReu3Niczm5FH8zPmTJiYE9c=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=fKLIEs8Gmx7hhErUMx1Gqak8zCvN3K9nVHT+DJzzDf065rC/zsRZazWMYXOE9B9pp
         M6QaspGPjAnj4PPIAFgDbvAgrwxX3yI9Mv2d8wFVn154TDnksKjKspRJ/fOCP9fF0w
         jihntaZX9j8qsttQsEP8NloAOQ75oVI5eYzkRepo=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190917072853eucas1p2d6396e914d979d35b45f7dbdef5557e9~FKTCTdLcH2324823248eucas1p2S;
        Tue, 17 Sep 2019 07:28:53 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id CA.CE.04469.53B808D5; Tue, 17
        Sep 2019 08:28:53 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190917072852eucas1p20e5a9c06f747c4ce755f2baede1dada5~FKTBeFKMY0371003710eucas1p2q;
        Tue, 17 Sep 2019 07:28:52 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190917072852eusmtrp15554c0aa853594e8bf1f76ab7b72481f~FKTBPSqE62506625066eusmtrp1C;
        Tue, 17 Sep 2019 07:28:52 +0000 (GMT)
X-AuditID: cbfec7f2-569ff70000001175-50-5d808b35753f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id C9.9F.04117.43B808D5; Tue, 17
        Sep 2019 08:28:52 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190917072851eusmtip2c086910acabb8262b34313f864868953~FKTAFe5ib1669916699eusmtip2H;
        Tue, 17 Sep 2019 07:28:51 +0000 (GMT)
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
Message-ID: <356d645a-1c88-8f34-5acb-0803cf2712d2@samsung.com>
Date:   Tue, 17 Sep 2019 09:28:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916120228.GA3045@onstation.org>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0yTVxj29Lv0o7HkWDC8wwW1iRpJLLJsyXE2hiUzOfvnLVFpFKp+AyNU
        1g/wNgLqZCjCuHhrgdFtJZIKoiBYOgUtZJV0dINNqQppF1yMUzGhgpsXHO2HkX/PeZ73fd7n
        SY7AaOx8vLDblCuaTcYsLa9iO375z7fik9KibSstUwnEN/qKJWW+PgXxdo+x5G1HJUPqe30c
        +XPiGU+a7rsRqX3Yj8jtF48Y0vfkNkuOV9qV5NTr8wrSOnqHI5Xd/Uryh6uWJw1DAwryXc1j
        jrjLDeThD/8y5Nj1XiUZqe5FKfNp0/dNiD7zH1NS54gd0euTNpZ2WkeUtKbEwtFWx3Ge3qoY
        VNDhO9d4enUyyNFAqUdB2+yFtMEfQz2ue0p6o6yapaHWhHU4VaXfJWbtzhfNSWvSVZnXgk18
        zuDS/WO2x8oi9O2iEyhKAPwxtPxUxp9AKkGDGxGUPnqB5MdzBDaLbUYJIRjvmlC+W2mcPMPJ
        wnkEo2+H2LCgwU8R+IO5YRyD18OvVh8fxrHYCKNdTyK2DC5mofLHqogTj5fDm7a7kSE1XgPN
        Q6EIz+IlUO1wREzn4y0wHuzh5Jl50Gd5MM0LQhT+CAJHIzSDF8LR9hpGxnFw70G9InwL8LAA
        VYG/GTn15zDVdZGXcQz847ky0+ZD8FafZGVcCIHGbxh5uQRB+6XOmeXV0OMZ4MKHmenQLa4k
        mf4MKrwDkTyAo8H/dJ6cIRqqOs4yMq2GkmKNPL0YAv3tM4Zx0PD7BF+BtNZZxayz2lhntbG+
        v2tDrAPFiXlSdoYoJZvEfTrJmC3lmTJ0O/dmt6Lpv+ud8ow70cTgDjfCAtLOVfvbCrdpOGO+
        dCDbjUBgtLHqdQXTlHqX8cBB0bw3zZyXJUputEBgtXHqQ3OCBg3OMOaKe0QxRzS/UxVCVHwR
        +mqJruzlRtXNl2kJR3LqCjbpVt1P1kfR7TsdFzI1Id8y+9bE+A21O+z1zhvRwgXI19d1biZ0
        /GSdfe0pfXnP4BdeZ8urr6Xh9AxPSlLiuZ8NqzxLXZcvrlwwadCl/GYqPXRaf3jxUGpacZoz
        frXLMrZB1fxp41+akMVwK1T+wZcFWlbKNCYnMmbJ+D9vF6rjtwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHeXcuO1qD06b5Il3GwO7Ntql7VyZ9fL9ERR+KTGzYQS23xc6M
        jELDTHN0GUbOTXKCy5AVNdN0adayvKWgpallFlkWppLiMjJrlwK//fg//x88DzwMIX5ARTOZ
        ehNn1GuzZHQ42bXY9m5rnDkvZVvjc4h6Pv4i0aWeDgHqapki0Z96C4EqWnso9GpumkauN16A
        yse7Aer/8ZVAHd/6SXTRUiVE1xaqBcj9cYBClpZuIXrpKaeR83WvAF2xT1DIezkZjVfOE6ig
        uVWIRkpawa5I7LrhAnh6sECIG0aqAG72OUjcaBsRYntRGYXdNRdp3H61T4DfDjTR+IHvPYVH
        zW0CXFuVi52DEtzmGRbix5dKSDzrXrOXPSRPNBqyTZw0w8CbdsqSFUgpV2iQXBmnkStU6pTt
        ynhZbFLiUS4r8yRnjE06Is9oeu+iT/StOzXlmBDmgUJpMQhjIBsHb/muUwEWs04A57+AUB4F
        H1ZMEiGWwIWBYroYhPs7EwAOt7mDAwm7D76w9dABjmC1sOvXzWCJYC+QsPFOMxUy7hKwf+4e
        GWjR7Eb4u3YoaIjYJHj79awwwCQbA0tqaoKdSPYgfNpgA6HOCthRNubPGSaMVcLR/OCmBLse
        LtzoI0K8FubX2f9xFBweqxBcBWLbEtu2RLEtUWxLFAcga0AEl83r0nW8Us5rdXy2Pl2eZtC5
        gf9p6p//vN8Aiqf2ewHLANly0WBtboqY0p7kc3ReABlCFiHae9YfiY5qc05zRkOqMTuL470g
        3n+bhYiOTDP4X1BvSlXEK9RIo1Cr1KoEJIsSFbFPDovZdK2JO85xJzjjf0/AhEXngZw4Zrqj
        QArFDdLPnpXJE2R3r/30sdihe98rzUMrHedXW4tiFup2DyxGt3jXVGONw1J1d8ebxPvWx+ZC
        U25juNo5s5PaY31Wt6zz3BV95maFqjP8UfmZD59G21dt0kxK5ySlcyr45/JYpH7LjNWzof3Y
        nZnBHUW+wgOluYuuBJWM5DO0ik2Ekdf+BRkdBOpKAwAA
X-CMS-MailID: 20190917072852eucas1p20e5a9c06f747c4ce755f2baede1dada5
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


With given feedback from other users and lack of datasheets for chips
(except anx7814) we can try this approach.


Regards

Andrzej


>
> Brian
>
>

