Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84939657B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2019 15:11:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728596AbfGKNL5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jul 2019 09:11:57 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:34864 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728552AbfGKNL4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jul 2019 09:11:56 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190711131155euoutp02f01f8f580c6c47420ac0db59f4aa73d5~wXHH2AJny0289302893euoutp025
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2019 13:11:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190711131155euoutp02f01f8f580c6c47420ac0db59f4aa73d5~wXHH2AJny0289302893euoutp025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1562850715;
        bh=A+nnjQatvmXOarwKNwWj8FEyKdvOWMGUijR8qmV+HFI=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=LwqsOLoORbuJ84tBJs2VYFuNVS2a5pvGvqPo3CNN9l1h184spaJVDblTy3uXlzZUG
         whAekOqRXyOkIqW6GgVHnbDYoA3lV2c37jdglNYKePEpPAOIoL0OWbpMtLK2GLqKfc
         mxpLQnhIx8ZmXx6i/6uDJZcROyovPgcqVq2/Zv3Y=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190711131154eucas1p1de5161ddfd5eec47f8c1ae424fd27364~wXHHPz5M22081420814eucas1p1z;
        Thu, 11 Jul 2019 13:11:54 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 4C.D2.04325.A95372D5; Thu, 11
        Jul 2019 14:11:54 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190711131153eucas1p17e1221ea0392ba004fd531a3350ebdf9~wXHGjdp6I2079720797eucas1p1f;
        Thu, 11 Jul 2019 13:11:53 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190711131153eusmtrp130912cf28dbd4314cb6fb6f5a0d7ef2e~wXHGVMr5c0407904079eusmtrp17;
        Thu, 11 Jul 2019 13:11:53 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-87-5d27359a9ac2
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id BE.BE.04146.995372D5; Thu, 11
        Jul 2019 14:11:53 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190711131153eusmtip29d95ddab3c7a0ff71d021ba29ffaee5f~wXHF0--tu0112201122eusmtip2O;
        Thu, 11 Jul 2019 13:11:53 +0000 (GMT)
Subject: Re: [PATCH 1/2] regmap: Add DSI bus support
To:     Mark Brown <broonie@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Laurent.pinchart@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, robdclark@gmail.com, bjorn.andersson@linaro.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <64ca3a74-374f-d4f3-bee6-a607cc5c0fc5@samsung.com>
Date:   Thu, 11 Jul 2019 15:11:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20190706010604.GG20625@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFKsWRmVeSWpSXmKPExsWy7djP87qzTNVjDdZfEbHoPXeSyeL0/ncs
        FlMfPmGz+L9tIrPFla/v2Szaln9jtuicuITdYuL+s+wWl3fNYbN4vvAHswOXx95vC1g8ds66
        y+4xu2Mmq8emVZ1sHneu7WHz2P7tAavH/e7jTB6fN8kFcERx2aSk5mSWpRbp2yVwZWx+sImx
        4LBgxacb7xkbGD/wdjFyckgImEjM3T6RsYuRi0NIYAWjxJxLR1ggnC+MEpumr2CHcD4zShx8
        cw8owwHW8nSdN0R8OaPEs2OvWSGct4wSj5ZOYAKZKwxUtG7pAWYQW0TAR6Jh+n42EJtZ4C6j
        xO5N/CA2m4CmxN/NN8HivAJ2EktvLWQFsVkEVCWuL5sFZosKhEn8XNAJVSMocXLmExYQm1PA
        WKL73Vl2iJkGEkcWzWGFsOUltr+dwwxhi0vcejKfCeQ4CYF77BIn989hhHjaRaJn1WcWCFtY
        4tXxLewQtozE6ck9UPF6ifsrWpghmjsYJbZu2MkMkbCWOHz8IiuE7Six6PtiaLDwSdx4Kwix
        mE9i0rbpzBBhXomONiGIakWJ+2e3Qk0Rl1h64SvbBEalWUhem4XknVlI3pmF5J0FjCyrGMVT
        S4tz01OLjfNSy/WKE3OLS/PS9ZLzczcxAlPY6X/Hv+5g3Pcn6RCjAAejEg8vx1vVWCHWxLLi
        ytxDjBIczEoivPvclWOFeFMSK6tSi/Lji0pzUosPMUpzsCiJ81YzPIgWEkhPLEnNTk0tSC2C
        yTJxcEo1MOp8PWf4KOaCZFL47KPXL5xsqp78n4FBNawn5NrRHe1fJybP8NntdTbn8l1Rm79i
        B0TjVl380GhY/fOflb/ofYlfBRX7tPifO6/8ynKhRK6gSNp3ipjy7oW8Um/2iG/yL/Pff/7j
        YudnVqeqJ73v2DI5hfuNpM5apaWKpV2R8/bsP+4seSR31UolluKMREMt5qLiRAAExmsjXQMA
        AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNIsWRmVeSWpSXmKPExsVy+t/xe7ozTdVjDd78l7foPXeSyeL0/ncs
        FlMfPmGz+L9tIrPFla/v2Szaln9jtuicuITdYuL+s+wWl3fNYbN4vvAHswOXx95vC1g8ds66
        y+4xu2Mmq8emVZ1sHneu7WHz2P7tAavH/e7jTB6fN8kFcETp2RTll5akKmTkF5fYKkUbWhjp
        GVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZWx+sImx4LBgxacb7xkbGD/wdjFycEgI
        mEg8XefdxcjFISSwlFHiwPSXrF2MnEBxcYnd898yQ9jCEn+udbFBFL1mlHhy/A1YQhioed3S
        A2C2iICPRMP0/WBFzAJ3GSW2HnvHDtHxjlHi3Zx/YFVsApoSfzffZAOxeQXsJJbeWgi2jkVA
        VeL6slmsICeJCoRJHD2RB1EiKHFy5hMWEJtTwFii+91ZdhCbWUBPYsf1X6wQtrzE9rdzmCFs
        cYlbT+YzTWAUmoWkfRaSlllIWmYhaVnAyLKKUSS1tDg3PbfYUK84Mbe4NC9dLzk/dxMjMGK3
        Hfu5eQfjpY3BhxgFOBiVeHh/3FONFWJNLCuuzD3EKMHBrCTCu89dOVaINyWxsiq1KD++qDQn
        tfgQoynQbxOZpUST84HJJK8k3tDU0NzC0tDc2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoRTB8T
        B6dUA6PH9tb+B2dFJhpsypITefplxvWLm5VEThcy8FUmcLp2Jga8erTwetThFOOYTnO9RVu4
        FTxT/j4oaN24Vumq6dplpw8d7XvBbXFdxz2Jrd++55P2h+W+FY/eZE22flsqx1YSzNbDI7lW
        o+PGracCusIckg+1dY4HnLc6vnJ/go7/4hJLMZX9n5RYijMSDbWYi4oTAUQO67zuAgAA
X-CMS-MailID: 20190711131153eucas1p17e1221ea0392ba004fd531a3350ebdf9
X-Msg-Generator: CA
X-RootMTR: 20190706010615epcas2p343102f858a7fadaf6785f7ece105f1a7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190706010615epcas2p343102f858a7fadaf6785f7ece105f1a7
References: <20190703214326.41269-1-jeffrey.l.hugo@gmail.com>
        <20190703214512.41319-1-jeffrey.l.hugo@gmail.com>
        <CGME20190706010615epcas2p343102f858a7fadaf6785f7ece105f1a7@epcas2p3.samsung.com>
        <20190706010604.GG20625@sirena.org.uk>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06.07.2019 03:06, Mark Brown wrote:
> On Wed, Jul 03, 2019 at 02:45:12PM -0700, Jeffrey Hugo wrote:
>> Add basic support with a simple implementation that utilizes the generic
>> read/write commands to allow device registers to be configured.
> This looks good to me but I really don't know anything about DSI,
> I'd appreciate some review from other people who do.  I take it
> there's some spec thing in DSI that says registers and bytes must
> both be 8 bit?


I am little bit confused about regmap usage here. On the one hand it
nicely fits to this specific driver, probably because it already uses
regmap_i2c.

On the other it will be unusable for almost all current DSI drivers and
probably for most new drivers. Why?

1. DSI protocol defines actually more than 30 types of transactions[1],
but this patchset implements only few of them (dsi generic write/read
family). Is it possible to implement multiple types of transactions in
regmap?

2. There is already some set of helpers which uses dsi bus, rewriting it
on regmap is possible or driver could use of regmap and direct access
together, the question is if it is really necessary.

3. DSI devices are no MFDs so regmap abstraction has no big value added
(correct me, if there are other significant benefits).


[1]:
https://elixir.bootlin.com/linux/latest/source/include/video/mipi_display.h#L15


Regards

Andrzej


>
> A couple of minor comments, no need to resend just for these:
>
>> +       payload[0] = (char)reg;
>> +       payload[1] = (char)val;
> Do you need the casts?
>
>> +	ret = mipi_dsi_generic_write(dsi, payload, 2);
>> +	return ret < 0 ? ret : 0;
> Please just write an if statement, it helps with legibility.
>
>> +struct regmap *__regmap_init_dsi(struct mipi_dsi_device *dsi,
>> +				 const struct regmap_config *config,
>> +				 struct lock_class_key *lock_key,
>> +				 const char *lock_name)
>> +{
>> +	return __regmap_init(&dsi->dev, &dsi_bus, &dsi->dev, config,
>> +			     lock_key, lock_name);
>> +}
>> +EXPORT_SYMBOL_GPL(__regmap_init_dsi);
> Perhaps validate that the config is OK (mainly the register/value
> sizes)?  Though I'm not sure it's worth it so perhaps not - up to
> you.


