Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBE8DB37B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2019 12:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730197AbfIPKCP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Sep 2019 06:02:15 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38115 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730283AbfIPKCP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Sep 2019 06:02:15 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190916100213euoutp01c515f2c3e0e963c073d15bfc4a01d663~E4vn5DBpn2095120951euoutp01d
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Sep 2019 10:02:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190916100213euoutp01c515f2c3e0e963c073d15bfc4a01d663~E4vn5DBpn2095120951euoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1568628133;
        bh=2OVF5c5pYBq2SkS4w+n6GCe9wGg9kPVzYiKP+MDm7UU=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=LUxel2soKgf2QMWpSXvnfHYSNIOq/OaORBW2CjYWhg5TwQIuSlMneEVDrQk3mq6Fg
         L1KKH1w47LGAgEsyOEhjdd6iSam3d++zdTJtdklS2lTTv4GptuzWB8zfw858tfnVVs
         e94yKfhei6igjND+O5KUQLexdKM721X2O5E1h9Ks=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190916100212eucas1p2dc1a33fd059e6f4ffe93c0c91cbc343f~E4vm1DCUj3032330323eucas1p2y;
        Mon, 16 Sep 2019 10:02:12 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id AD.1C.04309.4AD5F7D5; Mon, 16
        Sep 2019 11:02:12 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190916100211eucas1p1df7bc2b986fbd1752d2ebf0c135842a8~E4vmEzuf80653906539eucas1p1z;
        Mon, 16 Sep 2019 10:02:11 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190916100211eusmtrp2ebafb7c27b57cfea68615df68b3c2dcf~E4vl2eCCw2596625966eusmtrp2M;
        Mon, 16 Sep 2019 10:02:11 +0000 (GMT)
X-AuditID: cbfec7f4-ae1ff700000010d5-26-5d7f5da468b9
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 48.D2.04166.3AD5F7D5; Mon, 16
        Sep 2019 11:02:11 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190916100210eusmtip24d1c0bc3e1ad46f33aa5e6bcc7f95b75~E4vlDtGyY3147031470eusmtip2R;
        Mon, 16 Sep 2019 10:02:10 +0000 (GMT)
Subject: Re: [PATCH 05/11] drm/bridge: analogix-anx78xx: correct value of
 TX_P0
To:     Brian Masney <masneyb@onstation.org>, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, agross@kernel.org, narmstrong@baylibre.com,
        robdclark@gmail.com, sean@poorly.run
Cc:     airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@siol.net, linus.walleij@linaro.org,
        enric.balletbo@collabora.com, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <dc10dd84-72e2-553e-669b-271b77b4a21a@samsung.com>
Date:   Mon, 16 Sep 2019 12:02:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190815004854.19860-6-masneyb@onstation.org>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SWUxTURT09q0QSy5F7VFca/zQxBVNrkuM28eLuyZGoxIt+gIooGkB0UZL
        VJSCaOsSYyECWiJBQK1SWVywNFaCbQRlqyJVSNw1oriERXk8jPzNPTPnzkxyeEplY0fx0XHx
        oi5OG6NhA2nHw9/eqbZwY/gMRwdFvG1dNMnwVitIzf3PNPnjsFAk2+VlyLPOLywpfO5EJOuN
        B5H6n+8oUv2xniYmi40jZ7uvKIi9rYEhlvsejjwtz2JJXmOtgpzK/MAQ58kt5E3uL4qk3HVx
        pOWMCy0aLhReLETCl6YUTihtsSHh7o8cWiiztnBCZuoFRrAXmFjhkblOIbxouMMKt3/4GaE1
        3a0QbtqMQl5TiOAu93FCZcYZWvhmH7sWbw5csFOMiU4UddMXbg+MMvvzqb3FQUkVPjubjE4M
        TUMBPODZYMm8RKehQF6F8xH48m8wEqHC3xG0FCTKxDcEXYcLqX8bpnM2JBNXEOTeq1DIj08I
        jlTV0ZIqBK+Dx1YvK+FhuBiBq3e5JKJwOgWVjgxOIlg8GXpuNveLlHghPEjrQRKm8SRoO1bZ
        bzccb4IOfxUja4Kh+kJ7nwHPB+D5YO0ySmMKj4MjJZmUjNXga8/uDwS4nQfT5d+sHHsZWMwu
        TsYh8N59awCPhj9l0oKEjdCaf5SSl1MRlFwvG+g8H6rctYxkTPWFvlY+XR4vBnNNbX8ewEHQ
        9ClYzhAEpx3nKXmshNRjKlk9AVo9JQMfqiHvSSdrRhrroGLWQW2sg9pY//vmILoAqcUEfWyk
        qJ8VJ+6bptfG6hPiIqft2BNrR323W9Pr/l6KyrsjnAjzSDNUmZxyKFzFaBP1+2OdCHhKM0y5
        MdUQrlLu1O4/IOr2bNMlxIh6JwrlaY1aaRji36LCkdp4cbco7hV1/1gFHzAqGYXs8EdvN4z0
        3Ciaw51rfh6/fnV3p2HNKuZj/biXtmZr5+sPs0obRo/MKchtLbmUfdt/raxRNSPi67zxSVE9
        5Ph5U4curOvi3DxnXYWBj5i90rfr1GPNiIMBS949nJPyYmJSWBG5GtodippKN6Q3N6qDV/ne
        9savGPNqX9h1T/XSRuNWDa2P0s6cQun02r9kKhuntwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+d3XruLiNp3+MNMahBS1mo/8aSZGD+5fVkgY1bKhNx05V7tT
        stdGstKp5bAIZzUrJTETmmQ+MnVZatNJVssszZhoYU+ih6mVcwX+9znnez4cDhwaFzWSgbQy
        U8tpMhUZEsqbsP/uHF51Ta6TrzFWM8jhmiJQkaMbQ/bWjwT6U2/CkaXDQaKn3z5RqOalDaCL
        470APfvxDkfd758RKN9UIUDnpq9jyOpyksjU2itAT5ouUqjy+WMMnS2bIJHtzG40fuUnjgwt
        HQI0VNIB4sVszeUawH4aMAjYhqEKwLZ8LyfYRvOQgC3LKyVZa3U+xXYV92PsK+ddir3zfYRk
        Xxd0YmxdhY6tHPBlO5sGBWxbUQnBfrUGb2N2SWM16iwttyRdzWvXS3bLUJhUFo2kYRHRUll4
        lDwmLFKyOi42lctQZnOa1XH7pOnFI1X4wdoFh5sHrZQeFPoYgRcNmQiYf74CGIE3LWIqAbzh
        PI15ggDYbPmAe9gXTjuNlGdoAsD8xjukO/BltsMes2Mu8GNqARz+cmauwJkCHBY4rgo8SiuA
        LucM4VYoZjmcqXtBuVnIxMF24wxwM8Esg65TbXP7xMxOeL/BDDwzC2F36eisS9NezDpontK5
        2zgTCqcv9+MeDoG5t8v+cQAcHLVgxUBknmeb5ynmeYp5nlIOiGrgx2XxqjQVL5PyChWflZkm
        TVGrrGD2beofTtY1gP5biTbA0EDiI9QbTshFpCKbz1HZAKRxiZ8wKe+oXCRMVeQc4TTqZE1W
        BsfbQOTsbSY8UJyinn3CTG2yLFIWhaJlUeFR4WuRJECYx7TvETFpCi13gOMOcpr/HkZ7BeqB
        2NBy6NtkpI7ca7UnjWmt6/wXrby+s7TRUrJVF/TWVJRhv7dhpTKmbUvCWGihz6+uNUdW+Pdt
        VMdcWLx8h6D4ps/Sk/trHmwiLPoq2MaHhtBYsDj1856EWuWu+ONBzQ099Xnjtyy2N5eOb25x
        VeXGtnfGBD6yD23SKxOPDTb1GSIkBJ+ukK3ANbziLwnmEihMAwAA
X-CMS-MailID: 20190916100211eucas1p1df7bc2b986fbd1752d2ebf0c135842a8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190815004918epcas3p135042bc52c7e3c8b1aca7624d121af97
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190815004918epcas3p135042bc52c7e3c8b1aca7624d121af97
References: <20190815004854.19860-1-masneyb@onstation.org>
        <CGME20190815004918epcas3p135042bc52c7e3c8b1aca7624d121af97@epcas3p1.samsung.com>
        <20190815004854.19860-6-masneyb@onstation.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15.08.2019 02:48, Brian Masney wrote:
> When attempting to configure this driver on a Nexus 5 phone (msm8974),
> setting up the dummy i2c bus for TX_P0 would fail due to an -EBUSY
> error. The downstream MSM kernel sources [1] shows that the proper value
> for TX_P0 is 0x78, not 0x70, so correct the value to allow device
> probing to succeed.
>
> [1] https://github.com/AICP/kernel_lge_hammerhead/blob/n7.1/drivers/video/slimport/slimport_tx_reg.h
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
>  drivers/gpu/drm/bridge/analogix-anx78xx.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix-anx78xx.h b/drivers/gpu/drm/bridge/analogix-anx78xx.h
> index 25e063bcecbc..bc511fc605c9 100644
> --- a/drivers/gpu/drm/bridge/analogix-anx78xx.h
> +++ b/drivers/gpu/drm/bridge/analogix-anx78xx.h
> @@ -6,7 +6,7 @@
>  #ifndef __ANX78xx_H
>  #define __ANX78xx_H
>  
> -#define TX_P0				0x70
> +#define TX_P0				0x78


This bothers me little. There are no upstream users, grepping android
sources suggests that both values can be used [1][2]  (grep for "#define
TX_P0"), moreover there is code suggesting both values can be valid [3].

Could you verify datasheet which i2c slave addresses are valid for this
chip, if both I guess this patch should be reworked.


[1]:
https://android.googlesource.com/kernel/msm/+/android-msm-flo-3.4-jb-mr2/drivers/misc/slimport_anx7808/slimport_tx_reg.h

[2]:
https://github.com/AndroidGX/SimpleGX-MM-6.0_H815_20d/blob/master/drivers/video/slimport/anx7812/slimport7812_tx_reg.h

[3]:
https://github.com/commaai/android_kernel_leeco_msm8996/blob/master/drivers/video/msm/mdss/dp/slimport_custom_declare.h#L73


Regards

Andrzej


>  #define TX_P1				0x7a
>  #define TX_P2				0x72
>  


