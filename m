Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58AED685A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2019 10:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729245AbfGOIjC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Jul 2019 04:39:02 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:58043 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729257AbfGOIjC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Jul 2019 04:39:02 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190715083859euoutp016621d4b7e4a77b605a05c18254396146~xh99sR__93010830108euoutp01N
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2019 08:38:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190715083859euoutp016621d4b7e4a77b605a05c18254396146~xh99sR__93010830108euoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1563179939;
        bh=KJ3DnEhLriuVeWg98K+79IN0DVUic0shWLHqhmyUMzM=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=hEYthpWLFYhVJjHE0S/wQaiOoD4M8zKN2j2dIMwkSkXNeCuluP2kkl6CGTdRFqVqP
         x6zJ2GPXCH6zdyK/CnbBlcCVMZY8vFoGZzWrMIFMFDFjlOwmaHwaHhDYBx+EfQhESz
         dqDFP2s1IlKrzfi9D89EjC0DgSfVqwK0sDhVwx7k=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190715083858eucas1p1061be8cc96299077ac936b1afb47196e~xh98_Pl4F2177321773eucas1p1q;
        Mon, 15 Jul 2019 08:38:58 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id C2.B4.04298.2AB3C2D5; Mon, 15
        Jul 2019 09:38:58 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190715083857eucas1p272d8e645daa15994fff794dbf7c26841~xh98SjSe82048420484eucas1p2k;
        Mon, 15 Jul 2019 08:38:57 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190715083857eusmtrp287a3b3c3f8be41c509cb66bd42b6d009~xh98Ee65X0327603276eusmtrp2e;
        Mon, 15 Jul 2019 08:38:57 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-50-5d2c3ba2c4c9
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id A4.97.04140.1AB3C2D5; Mon, 15
        Jul 2019 09:38:57 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190715083857eusmtip11a4e3e0060559b732ca13b129b64540c~xh97ppbQx2302623026eusmtip1f;
        Mon, 15 Jul 2019 08:38:57 +0000 (GMT)
Subject: Re: [PATCH 1/2] regmap: Add DSI bus support
To:     Mark Brown <broonie@kernel.org>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Laurent.pinchart@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, robdclark@gmail.com, bjorn.andersson@linaro.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <8b74afa7-65ed-c53d-3dc2-d758361f2d62@samsung.com>
Date:   Mon, 15 Jul 2019 10:38:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20190711145045.GI14859@sirena.co.uk>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTcRjG/e9cdhxNjtPwxSLzdKPsYtHlhEs0Ik4fkqgQKsRmHjTyUpta
        1ocuhGyK4QQzl6XOa2Ym001XyszSZaKYmVhWVq4LhprlZkK5No+C337v/3me9+WBP4XJugh/
        6nRSCq9MUiQwpAQ3dcz0bNKHbIwK1tzzYbN7OkVsl2UcZ/M+2UjWadJibL99gmQzKh0Yq9GW
        iVmtpVvMvnpUSLLfSv5gYRKuxVGMc2bdezF3W11AcIZqDcm9G2gmuUbHR4IbzrKKuN+GFYeo
        4xJ5LJ9wOo1Xbgk9KYmftGViZ5ukF778aCeuoGFJJvKkgN4OHRWjeCaSUDK6CkFPxjQpDFMI
        huqqCGH4jSCropdciORMl4kFoRJBweCH+fwYAu2LKuR2+bhcteWtmJt96VXwerplzoTRahH0
        X22YE0h6PfyrfzO3VkqHQm/OrbkwTq+BkVwt4ealdCTMFGvmPd7QWWDD3exJb4PG7PciN2N0
        MDzTFxICB0DjWCEmsB+8tRWJ3IeB/iyGkqxJl0C5hn1gqwGhjg+MWhvEAi8Hp7lIJPBlGK66
        jglZNQJjnRkThBB4an1JCBwO+ulSXNjpBYNj3sJdL8g15c+fkoI6Qya4A2G42zi/xQ/Ke+1k
        DmJ0i5rpFrXRLWqjW9SmGOHVyI9PVSXG8aqtSfz5zSpFoio1KW7zqeREA3J9sa5Z668mZO+L
        aUM0hZgl0rDYoCgZoUhTpSe2IaAwxle6x+56ksYq0i/yyuRoZWoCr2pDyyic8ZNe8vh4QkbH
        KVL4Mzx/llcuqCLK0/8K0rWvDdvtEdhsztZfM02tjqkOuhYhL+3YO+j/oMIwNRJzzPK4rO9m
        TeRA0LlLwJi/3/n5ZuhJr/1AtNWRpTji3PlQvi3D6LkutLW2vivgBhM9K9ZP7rg7Lres7Isb
        MB90GvN3HW6CEWPf3/sRyfKhkK/BjqPPGSU+EbY/jzOFOxlcFa/YugFTqhT/AblKCAleAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRmVeSWpSXmKPExsVy+t/xu7oLrXViDZZ0Klv0njvJZHF6/zsW
        i6kPn7BZ/N82kdniytf3bBZty78xW3ROXMJuMXH/WXaLy7vmsFk8X/iD2YHLY++3BSweO2fd
        ZfeY3TGT1WPTqk42jzvX9rB5bP/2gNXjfvdxJo/Pm+QCOKL0bIryS0tSFTLyi0tslaINLYz0
        DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mj4+6WIu2MFb8fT1UdYGxvtcXYycHBIC
        JhITvi9h72Lk4hASWMoo0XVnLSNEQlxi9/y3zBC2sMSfa11sEEWvGSVmXQbp4OQQBupet/QA
        WJGIgLLE1e97WUCKmAU6mCRerHvECNFxmkniQvtWVpAqNgFNib+bb7KB2LwCdhIXJswAW8ci
        oCrxeNJEoBoODlGBMImjJ/IgSgQlTs58wgJicwoYSWzvvcsEYjML6EnsuP6LFcKWl9j+dg4z
        hC0ucevJfKYJjEKzkLTPQtIyC0nLLCQtCxhZVjGKpJYW56bnFhvpFSfmFpfmpesl5+duYgTG
        7LZjP7fsYOx6F3yIUYCDUYmH1yFFO1aINbGsuDL3EKMEB7OSCK/tV6AQb0piZVVqUX58UWlO
        avEhRlOg3yYyS4km5wPTSV5JvKGpobmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4m
        Dk6pBsYy0xf2J6W28L69duFiw9zZN4s2XNnbXZe/5Tm3nq4Eu0ToEb6GY6/mJa37ITT7UF+P
        XX3n+WNFtUkrmHNkp1T4zWBv2BOtxK7u8s5x9abtd2tOaYjU741wVo2cOLmEl/F45cOHslq8
        TirfXokHTn054dj9E7w/v8fJsEbsUPjGd09MtnSa9BMlluKMREMt5qLiRAAFCI9Z7wIAAA==
X-CMS-MailID: 20190715083857eucas1p272d8e645daa15994fff794dbf7c26841
X-Msg-Generator: CA
X-RootMTR: 20190706010615epcas2p343102f858a7fadaf6785f7ece105f1a7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190706010615epcas2p343102f858a7fadaf6785f7ece105f1a7
References: <20190703214326.41269-1-jeffrey.l.hugo@gmail.com>
        <20190703214512.41319-1-jeffrey.l.hugo@gmail.com>
        <CGME20190706010615epcas2p343102f858a7fadaf6785f7ece105f1a7@epcas2p3.samsung.com>
        <20190706010604.GG20625@sirena.org.uk>
        <64ca3a74-374f-d4f3-bee6-a607cc5c0fc5@samsung.com>
        <20190711145045.GI14859@sirena.co.uk>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11.07.2019 16:50, Mark Brown wrote:
> On Thu, Jul 11, 2019 at 03:11:56PM +0200, Andrzej Hajda wrote:
>
>> 1. DSI protocol defines actually more than 30 types of transactions[1],
>> but this patchset implements only few of them (dsi generic write/read
>> family). Is it possible to implement multiple types of transactions in
>> regmap?
> You can, there's a couple of different ways depending on how
> exactly things are done.
>
>> 3. DSI devices are no MFDs so regmap abstraction has no big value added
>> (correct me, if there are other significant benefits).
> There's a few extra bits even if you're not using the marshalling
> code to get things onto the bus - the main ones are the register
> cache support (which people often use for simpler suspend/resume
> support) and the debug and trace facilities (things like
> tracepoints and debugfs for dumping the register map).

I do not see cache usable in bridge drivers, I guess default config will
be caching disabled, as it is already in the driver from this patchset.

So beside marshaling, we are left only with debug facilities, not a big
gain :)

Moreover as it was already written DSI is mainly used to transport
COMMANDS to the device, with variable number of arguments - it does not
resembles registry map at all.

On the other side there is some subset of DSI devices which exposes
register memory using MIPI DSI Generic Write/Read packets, for example:
ti-sn65dsi86, tc358764. They fit better to regmap framework. Hard to say
how common is this pattern. Maybe we can try with it? If yes it would be
good to put clear remark that regmap/dsi is for such devices, to avoid
possible confusion.


Regards

Andrzej


