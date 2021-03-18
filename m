Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21D893403E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Mar 2021 11:52:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbhCRKwQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Mar 2021 06:52:16 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:40015 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbhCRKvx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Mar 2021 06:51:53 -0400
Received: from [192.168.1.155] ([77.4.36.33]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MzTCy-1laEHD1h4q-00vRzM; Thu, 18 Mar 2021 11:51:47 +0100
Subject: Re: [RFC PATCH v2 0/7] Extend regulator notification support
To:     matti.vaittinen@fi.rohmeurope.com
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-arm-msm@vger.kernel.org
References: <cover.1615367099.git.matti.vaittinen@fi.rohmeurope.com>
 <763406f888de18df462fc5533230345ac3d8a4e5.camel@fi.rohmeurope.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <3c0c6e6c-3604-0e47-aa1a-8b49dca346e7@metux.net>
Date:   Thu, 18 Mar 2021 11:51:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <763406f888de18df462fc5533230345ac3d8a4e5.camel@fi.rohmeurope.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Kr9ax7YOtJgK7gSxlCy7TGn+auYoYK0jf4vmp7uWzHvJv4aL0CV
 R2ZjOgy8h2smSN158xIpk957sNZDZHLCH34mksH88lP+mB9uk7lIUlbv1NdRpfIpPj9Ttui
 LNhkoY9Iz/OxVqMgzirdpiNS24muUZE9SbU2CzJ/CS6fuuEGX05nf3KHbCkfu3UcwyfCU9M
 EYQn4i2/sG24Qk8wsHOdA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xHFIuY+9hkk=:UdKyfgIubm1l41kKZzHAVd
 60U7Gg8mmBqNgrGidq+CSjWe8cLoef3+ru31Fn8qCd7XFKIP58BEpZOX5nQMNWBY9DJxcjIXu
 YZA8jtJ/1PTP62FDr0UwAT5OU0mROFouXiHx1bXiLbvVGavrB0DsZNZJVfVEt5KXN6K85qM83
 09GQz+KmIIi7OB1WsRktG2BGuJbWQ29Df4dpsewAKRQzum8FdSYt08GCWHyg/3+ONdO9WuAVo
 pqUZQZ3N7+1umB/YCt9J08goW1XT6cJky3FhE9OgvruE++svXertBrvQlQDL1WfqWvsNXnZA3
 dbvd2SZyqt3y4Gx8whvvp90r+YL7Dw8EN4uvtwG/r7ZfWIcwHvx6ZNSktbmeBDIEfMHotaGJZ
 f4FXR+hBRHCV4fiFDRkm1Ww+DitcA5EjDVNHE4MqPd0CHDKG9zx8C8T/VVqI4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11.03.21 06:32, Matti Vaittinen wrote:

> ...This is what happens when you suddenly pause work for over a week
> because it starts to rain in the kitchen >.<;

Uups :(

I once had raining in the living room. (fortunately, just a rented
appartment, so let the owner do everything). At first I tried to catch
up the water ... until the ceiling lining came down and turned my
living room into a large shower room. Panic turned into insanity,
and I was just singing in the rain ... :o

Best wishes for your repair.


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
