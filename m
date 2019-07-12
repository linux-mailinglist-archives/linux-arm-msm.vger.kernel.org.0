Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D86F366F69
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2019 15:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbfGLNBs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Jul 2019 09:01:48 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:53130 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727027AbfGLNBs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Jul 2019 09:01:48 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190712130145euoutp01e051a26a7ac52e03c36d2be4b57ca97c~wqnird5rH0138401384euoutp01d
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jul 2019 13:01:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190712130145euoutp01e051a26a7ac52e03c36d2be4b57ca97c~wqnird5rH0138401384euoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1562936505;
        bh=0Ph+jlbDFqlic9RlOSrcIKz2JKpU+ek5a4NYj/6z2ys=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=miJbyZskVcrhDa7qC19aY2wpoji1Zut2W5q0JrcBpNRHyldTkyYHYqWH9PLjiAjJc
         fhhA4rx7RGbhWG3f3fEPnbAQGNFzaAU4AssBelYNr9Qw7bOxdG7URf2/yw8T+ZcrhZ
         mkqCCs+nj2vOIPdxz25AvYSDKvXqT0XdwFqOl8zA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190712130145eucas1p23e4e0971a626de5b7a229d1c81566fb2~wqniAROjQ3006530065eucas1p2O;
        Fri, 12 Jul 2019 13:01:45 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 82.33.04325.8B4882D5; Fri, 12
        Jul 2019 14:01:44 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190712130144eucas1p18e10379bdec5a07d218f775495cd3db1~wqnhHqbG30135501355eucas1p1D;
        Fri, 12 Jul 2019 13:01:44 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190712130144eusmtrp1748cf5233b9a72a42c4c4e27528dbdc5~wqng5kBYx1905319053eusmtrp1o;
        Fri, 12 Jul 2019 13:01:44 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-fc-5d2884b8ca55
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 21.A4.04140.7B4882D5; Fri, 12
        Jul 2019 14:01:43 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190712130143eusmtip254e80d709661cfbfe69a4e165de522ff~wqngdl3Db0500405004eusmtip2d;
        Fri, 12 Jul 2019 13:01:43 +0000 (GMT)
Subject: Re: [PATCH 1/2] regmap: Add DSI bus support
To:     Rob Clark <robdclark@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <10b1313f-7a60-df04-a9e3-76649b74f2f0@samsung.com>
Date:   Fri, 12 Jul 2019 15:01:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGtGjKRA3A8v6pgaXLgpeiLZuz6HuDSFRjKrNp4iQNVZtA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFKsWRmVeSWpSXmKPExsWy7djP87o7WjRiDebeNrfoPXeSyeL0/ncs
        FlMfPmGz+L9tIrPFla/v2Szaln9jtuicuITdYuL+s+wWl3fNYbN4vvAHswOXx95vC1g8ds66
        y+4xu2Mmq8emVZ1sHneu7WHz2P7tAavH/e7jTB6fN8kFcERx2aSk5mSWpRbp2yVwZXx/dJ+l
        YKFExax/rSwNjGeFuhg5OSQETCSuXLnO3sXIxSEksIJR4u+XdVDOF0aJm783QDmfGSVWTrnN
        AtPy8P06FojEckaJz5uuskE4bxklfs6bwwhSJQxUtW7pAWYQW0RAWWLV1v1gHcwCU5gldl+9
        AlbEJqAp8XfzTTYQm1fATqK/aQtYnEVAVWL21YPsILaoQJjEzwWdUDWCEidnPgE7g1MgUGLh
        7WtgcWYBeYntb+cwQ9jiEreezGcCWSYhcI9d4ureNiaIu10k7v9+xQ5hC0u8Or4FypaROD25
        B+q3eon7K1qYIZo7GCW2btjJDJGwljh8/CJrFyMH0AZNifW79CHCjhKLvi9mAQlLCPBJ3Hgr
        CHEDn8SkbdOZIcK8Eh1t0MBWlLh/divUQHGJpRe+sk1gVJqF5LNZSL6ZheSbWQh7FzCyrGIU
        Ty0tzk1PLTbOSy3XK07MLS7NS9dLzs/dxAhMYaf/Hf+6g3Hfn6RDjAIcjEo8vDcs1WOFWBPL
        iitzDzFKcDArifCu+g8U4k1JrKxKLcqPLyrNSS0+xCjNwaIkzlvN8CBaSCA9sSQ1OzW1ILUI
        JsvEwSnVwKiqkVr8/0XocR+elcc1bHo29RxYvuqx2Y2Ab7JXrnrvirI1lXhwX9Pb10FXL1ju
        Rn94/7TjUqv7G2y+Mj+I63rqoMh3vJw1xXfLna3BS364rz768N6FvUVrSw6fSDvsZGSTeO43
        Z/2SpberhBI/mbLbf/pRkh2j5y79ZOM03p/vv+S6hfQ5eiqxFGckGmoxFxUnAgA3HWjfXQMA
        AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRmVeSWpSXmKPExsVy+t/xe7rbWzRiDTre21j0njvJZHF6/zsW
        i6kPn7BZ/N82kdniytf3bBZty78xW3ROXMJuMXH/WXaLy7vmsFk8X/iD2YHLY++3BSweO2fd
        ZfeY3TGT1WPTqk42jzvX9rB5bP/2gNXjfvdxJo/Pm+QCOKL0bIryS0tSFTLyi0tslaINLYz0
        DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mr4/us9SsFCiYta/VpYGxrNCXYycHBIC
        JhIP369j6WLk4hASWMoo8frkHSaIhLjE7vlvmSFsYYk/17rYIIpeM0o0TdjNApIQBupet/QA
        WJGIgLLEqq37wSYxC0xhlpj56iwzRMcrJom3sx+xglSxCWhK/N18kw3E5hWwk+hv2sIIYrMI
        qErMvnqQvYuRg0NUIEzi6Ik8iBJBiZMzn4At4xQIlFh4+xpYK7OAusSfeZeYIWx5ie1v50DZ
        4hK3nsxnmsAoNAtJ+ywkLbOQtMxC0rKAkWUVo0hqaXFuem6xkV5xYm5xaV66XnJ+7iZGYMxu
        O/Zzyw7GrnfBhxgFOBiVeHhvWKrHCrEmlhVX5h5ilOBgVhLhXfUfKMSbklhZlVqUH19UmpNa
        fIjRFOi3icxSosn5wHSSVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mD
        U6qB8SYjz/U+Z5E/WjFcktxKD5eeXbPg4KtJecLpC9RDd2/n9I+/5F/ouzCg1/dVuc3iwAnz
        5cRFldauXSH9o+SoJfNjm81dyaw9i7Y2y9Zfs2ZaGKn1MMQnVf6VzfrdEel9U8UrfzREbtzB
        9I+9OIlVavfSOdbrXr4zjD5086V4vMK3O5xcxpv+KLEUZyQaajEXFScCANMElHPvAgAA
X-CMS-MailID: 20190712130144eucas1p18e10379bdec5a07d218f775495cd3db1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190706010615epcas2p343102f858a7fadaf6785f7ece105f1a7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190706010615epcas2p343102f858a7fadaf6785f7ece105f1a7
References: <20190703214326.41269-1-jeffrey.l.hugo@gmail.com>
        <20190703214512.41319-1-jeffrey.l.hugo@gmail.com>
        <CGME20190706010615epcas2p343102f858a7fadaf6785f7ece105f1a7@epcas2p3.samsung.com>
        <20190706010604.GG20625@sirena.org.uk>
        <64ca3a74-374f-d4f3-bee6-a607cc5c0fc5@samsung.com>
        <CAF6AEGtGjKRA3A8v6pgaXLgpeiLZuz6HuDSFRjKrNp4iQNVZtA@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11.07.2019 15:56, Rob Clark wrote:
> On Thu, Jul 11, 2019 at 6:11 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
>> On 06.07.2019 03:06, Mark Brown wrote:
>>> On Wed, Jul 03, 2019 at 02:45:12PM -0700, Jeffrey Hugo wrote:
>>>> Add basic support with a simple implementation that utilizes the generic
>>>> read/write commands to allow device registers to be configured.
>>> This looks good to me but I really don't know anything about DSI,
>>> I'd appreciate some review from other people who do.  I take it
>>> there's some spec thing in DSI that says registers and bytes must
>>> both be 8 bit?
>>
>> I am little bit confused about regmap usage here. On the one hand it
>> nicely fits to this specific driver, probably because it already uses
>> regmap_i2c.
>>
>> On the other it will be unusable for almost all current DSI drivers and
>> probably for most new drivers. Why?
>>
>> 1. DSI protocol defines actually more than 30 types of transactions[1],
>> but this patchset implements only few of them (dsi generic write/read
>> family). Is it possible to implement multiple types of transactions in
>> regmap?
>>
>> 2. There is already some set of helpers which uses dsi bus, rewriting it
>> on regmap is possible or driver could use of regmap and direct access
>> together, the question is if it is really necessary.
>>
>> 3. DSI devices are no MFDs so regmap abstraction has no big value added
>> (correct me, if there are other significant benefits).
>>
> I assume it is not *just* this one bridge that can be programmed over
> either i2c or dsi, depending on how things are wired up on the board.
> It certainly would be nice for regmap to support this case, so we
> don't have to write two different bridge drivers for the same bridge.
> I wouldn't expect a panel that is only programmed via dsi to use this.


On the other side supporting DSI and I2C in one driver is simply matter
of writing proper accesors.


Regards

Andrzej


>
> BR,
> -R
>
>> [1]:
>> https://elixir.bootlin.com/linux/latest/source/include/video/mipi_display.h#L15
>>
>>
>> Regards
>>
>> Andrzej
>>
>>
>>> A couple of minor comments, no need to resend just for these:
>>>
>>>> +       payload[0] = (char)reg;
>>>> +       payload[1] = (char)val;
>>> Do you need the casts?
>>>
>>>> +    ret = mipi_dsi_generic_write(dsi, payload, 2);
>>>> +    return ret < 0 ? ret : 0;
>>> Please just write an if statement, it helps with legibility.
>>>
>>>> +struct regmap *__regmap_init_dsi(struct mipi_dsi_device *dsi,
>>>> +                             const struct regmap_config *config,
>>>> +                             struct lock_class_key *lock_key,
>>>> +                             const char *lock_name)
>>>> +{
>>>> +    return __regmap_init(&dsi->dev, &dsi_bus, &dsi->dev, config,
>>>> +                         lock_key, lock_name);
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(__regmap_init_dsi);
>>> Perhaps validate that the config is OK (mainly the register/value
>>> sizes)?  Though I'm not sure it's worth it so perhaps not - up to
>>> you.
>>

