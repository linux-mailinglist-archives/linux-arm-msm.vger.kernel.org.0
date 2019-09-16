Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C827B39E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2019 14:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731570AbfIPMCL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Sep 2019 08:02:11 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:55606 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731527AbfIPMCK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Sep 2019 08:02:10 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190916120208euoutp01c1bc7cebcf3aa476851e062f8434856c~E6YUg7VkN1599715997euoutp01W
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Sep 2019 12:02:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190916120208euoutp01c1bc7cebcf3aa476851e062f8434856c~E6YUg7VkN1599715997euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1568635328;
        bh=65UEnVxKP+D2QkDRxOOBUdJYe96zkmylUP4t9e8ZLEU=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Sppddedgafqa79qG3LMDZV/ve3HBrPnHaUWH3qJrOgizynTZYGmvPBvhUBKpELBkT
         yWi+NMiEetQOQbXeiHrw2Y/Beehqmncl6mtSF96o4rFblnv0oR7iXgRI1f13A8e5wQ
         d8NyXj5j/0JtMh9/no+0keQkkbfalMjZ12klaSgU=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190916120207eucas1p2417bf77dc4584a6536dabfd2bfd8961b~E6YTg6mkk0283702837eucas1p2N;
        Mon, 16 Sep 2019 12:02:07 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id F9.8D.04309.EB97F7D5; Mon, 16
        Sep 2019 13:02:06 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190916120206eucas1p25ac70e0190fdc206b2e92591975b600c~E6YSul0wJ1276912769eucas1p2P;
        Mon, 16 Sep 2019 12:02:06 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190916120206eusmtrp224e9a01be52972f60c3a882630c355eb~E6YSgJa2W3011030110eusmtrp2q;
        Mon, 16 Sep 2019 12:02:06 +0000 (GMT)
X-AuditID: cbfec7f4-ae1ff700000010d5-56-5d7f79be971a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id A7.93.04166.DB97F7D5; Mon, 16
        Sep 2019 13:02:06 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190916120205eusmtip1f2cee14a919a4e50c9f029deeb1c139a~E6YRsijjh0319203192eusmtip1g;
        Mon, 16 Sep 2019 12:02:05 +0000 (GMT)
Subject: Re: [PATCH 00/11] ARM: dts: qcom: msm8974: add support for external
 display
To:     Brian Masney <masneyb@onstation.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org,
        narmstrong@baylibre.com, robdclark@gmail.com, sean@poorly.run,
        airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@siol.net, linus.walleij@linaro.org,
        enric.balletbo@collabora.com, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <53f18b9f-ad23-563c-dc18-be71f3ec2c49@samsung.com>
Date:   Mon, 16 Sep 2019 14:02:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916090150.GA349@onstation.org>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUzMcRzHfe/32M3Zr6vWR57W0VbMQ9bmu4VlHva1GTbzMNY4+i1Rh/sp
        wpRxVB66ilnX5dQ6hTNE5VpPruZqKSU90spkRWKT0ES6fpn+e33e7/fn+/l8ti9Pqa2sDx+h
        OyrqddpIDaukC58Nv1hYFhsXuuRHbxCuf/eLxpfraxS4tvwzjUcLUyhsqapn8KuhLyy2vXYg
        bO6tQ7j5xwcK13xqpnFiSg6Hr47kKnD+uxYGp5TXcbip2Mxia2ujAidn9DPYcWUX7s36SWFD
        aRWHO9OqUIgXsd2wIfKlzcCRJ505iJR+v0kTu6mTIxkJ6QzJv5PIkmrjSwV501LCkqLv3Qzp
        uuhUkEc5ccTa5kGcxR0cqbicRpPB/NmbhZ3K5WFiZESMqF+8co9yf+ZQGXW4QnX8rHN1PHql
        TEJuPAhBYM+0oCSk5NVCHoKBhuesXHxDcGawlJGLQQTGht+Kfy3mxmecbOQiMKT3K+RiAEGR
        pYlypTyEbdDT9JRzsafgD0NZzeMhSkihIbnCSLsMVgiA34/aWRerhJVge581rtOCHwz22RkX
        ewk74Gt3JSNn3KEmvWc84yYEgvlpGnIxJcyBogEzJbM3dPRYxoeB0M3D8MXSib3XQM3tMk5m
        D/jofDzBM2HUbpnIxEFX3jlKbk5AUPDATslGMFQ6G8e24McmBMD94sWyvAoMw6nIJYMwDdoG
        3OUdpkFq4XVKllWQcF4tp32hq65g4kFvsDYMsUakMU26zDTpGtOka0z/595E9B3kLUZLUeGi
        tFQnHlskaaOkaF34on2HovLR2Oet/eP89gQVj+x1IIFHmqmqeMPpUDWjjZFioxwIeErjqdqe
        cDJUrQrTxp4Q9Yd266MjRcmBZvC0xlt1ckr3LrUQrj0qHhTFw6L+n6vg3Xzi0boVBXtDgkaN
        1RuWvbnw4G2RmHGwKjD7zCff1nWGTWHZTelvn6deqmwvvLF1Jgk5su+aV0jAa73/evZue+jG
        5JJYH9/pBxb0JdlOr4jpt4bNyvPU7SzI5ao99Q0m4pz68JZJsp6aF/PT6JXdei0xuG/ko19v
        BC6vLblnta313zI32Kihpf3awPmUXtL+BYA7zTu4AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRiA+XbO2aY5+JyKX4IZi8yEpsfrp5lYEZ3qT1hkpGZHO6jkNtmZ
        kkkpiKSW5dB+OJeXdAWmhFpeunhZloloqWneVuaFslKJ8FKppVuB/5735Xk++OAVE9J6ykkc
        r9RwaiWbIBNak11rHaY9zSlpkZ753QD3TP4mcW5PpwB3tcyR+E+9lsAl7T0UfrswL8RVo0aA
        9Z/WvYGlGQJ3fhsgcba2QoQLVu4JcO3kIIW1Ld0i3P9YL8SGd70CfLPoK4WNN8Lxp7JlAmc+
        axdhU347CHFgqoqrADM/lCliGk0VgHm2WEoyTTqTiCnKKqSY2spsIfMqr0/AjA0+FTINi+MU
        8+Fah4Cpq0hjDEN2TMfjERHTmptPMj9qtx2HZ+RBalWShtsep+I1+2ThNPaS0wFY7uUTIKe9
        /SMDvXxlHsFB57mE+GRO7RF8Th53e6GZSGyVXMzoOJgO3lrnACsxgj5I3/tStMFSaACovnyv
        Ze+InpTMEha2QyuDOUKL8xWgzMaIDbaDp9BUf5u5tYduaKFsQJADrMUE1JLofvoD8yCFXwAy
        PcyiNiwh3I1W64bNL0lgMKqaLiM3mIQ70Y/PTWbHAZ5Gzxt1wOLYos7CKbNjBWmkb8s37wm4
        C60U9xEWdkENs/p/7IhGpkoEeUCq25TrNiW6TYluU1IKyEpgzyXxilgFT8t5VsEnKWPlMSpF
        LVi/mfqXP+saQV/NCSOAYiCzkaRnXomUUmwyn6IwAiQmZPaSsKzUSKnkPJtyiVOrotRJCRxv
        BL7rn9MSTg4xqvULVGqiaF/aHwfQ/t7+3n5Y5ijJgm0RUhjLargLHJfIqf93ArGVUzqI3VoK
        R5ecx6//ehVz6JTHmPB9PN/ieXjX/vGPqaHV5Y9W2Cb9Dv0EF+IelVHtUiidnXjdHfjdL9dO
        dyU4yKA5+znHWe8YvWVtCQ2POClP9h05cKeOuuy2/+6xGYNrze5bDjYF83MXukNto+2VNV6u
        q1enQ1O2Z493hcUMLb85yr6QkXwcS7sTap79C0qOT2xJAwAA
X-CMS-MailID: 20190916120206eucas1p25ac70e0190fdc206b2e92591975b600c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190815004916epcas3p4d8a62e215eff5e227721d3449e6bfbd3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190815004916epcas3p4d8a62e215eff5e227721d3449e6bfbd3
References: <CGME20190815004916epcas3p4d8a62e215eff5e227721d3449e6bfbd3@epcas3p4.samsung.com>
        <20190815004854.19860-1-masneyb@onstation.org>
        <2da29e80-73fb-8620-532e-0b5f54b00841@samsung.com>
        <20190916090150.GA349@onstation.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16.09.2019 11:01, Brian Masney wrote:
> Hi Andrzej,
>
> On Mon, Sep 16, 2019 at 10:13:58AM +0200, Andrzej Hajda wrote:
>> Hi Brian,
>>
>> On 15.08.2019 02:48, Brian Masney wrote:
>>> This patch series begins to add support for the external display over
>>> HDMI that is supported on msm8974 SoCs. I'm testing this series on the
>>> Nexus 5, and I'm able to communicate with the HDMI bridge via the
>>> analogix-anx78xx driver, however the external display is not working
>>> yet.
>>>
>>> When I plug in the HDMI cable, the monitor detects that a device is
>>> hooked up, but nothing is shown on the external monitor. The hot plug
>>> detect GPIO (hpd-gpios) on the analogix-anx78xx bridge and MSM HDMI
>>> drivers do not change state when the slimport adapter or HDMI cable is
>>> plugged in or removed. I wonder if a regulator is not enabled somewhere?
>>> I have a comment in patch 10 regarding 'hpd-gdsc-supply' that may
>>> potentially be an issue.
>>>
>>> I'm still digging in on this, however I'd appreciate any feedback if
>>> anyone has time. Most of these patches are ready now, so I marked the
>>> ones that aren't ready with 'PATCH RFC'.
>>>
>>> I'm using an Analogix Semiconductor SP6001 SlimPort Micro-USB to 4K HDMI
>>> Adapter to connect my phone to an external display via a standard HDMI
>>> cable. This works just fine with the downstream MSM kernel using
>>> Android.
>>
>> This patchset risks to be forgotten. To avoid it, at least partially, I
>> can merge patches 1-5, is it OK for you?
> That would be great if you could do that.


I have queued 1-4 to drm-misc-next. 5th patch requires some discussion.


Regards

Andrzej


>
> Thanks,
>
> Brian
>
>

