Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F04F8321153
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Feb 2021 08:22:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbhBVHVq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Feb 2021 02:21:46 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36980 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbhBVHVk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Feb 2021 02:21:40 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210222072048euoutp02f4d57bd8a353e03a7a68773b71fd775c~mANkSI2Uk2546725467euoutp02f
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 07:20:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210222072048euoutp02f4d57bd8a353e03a7a68773b71fd775c~mANkSI2Uk2546725467euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1613978448;
        bh=UCnuqo5cfQ3YOcugfUkVi67fSmaj+kDkthEj6wfxsV8=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=CmCfAQza2TIPZuhlh39qH+TjBdsF4A0RJ8u+A8G4S24QJgX5tyGvp4cnka9zhbXnj
         8Jm+7w+/b5FKg0dRnbTRTp1FcqgZa2rJbPbzclJGgxV9Il5nClBdordcTOm/ke5zWh
         G2CZMwYUoWKqUOoq09LM6GxcJQpvbkVeUtQAGOV4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210222072041eucas1p2765b176e43a6439dd3d4ab44acf9ad28~mANdTZfKU0888108881eucas1p2r;
        Mon, 22 Feb 2021 07:20:41 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id E7.35.27958.94B53306; Mon, 22
        Feb 2021 07:20:41 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210222072040eucas1p1bb0bb4ba140d3b7029bfd89ab9efef6b~mANcwemau2085520855eucas1p1i;
        Mon, 22 Feb 2021 07:20:40 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210222072040eusmtrp29717831c4563ea6283c69cd29b952dea~mANcui1783111331113eusmtrp2V;
        Mon, 22 Feb 2021 07:20:40 +0000 (GMT)
X-AuditID: cbfec7f2-f15ff70000006d36-8c-60335b497436
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 72.26.21957.84B53306; Mon, 22
        Feb 2021 07:20:40 +0000 (GMT)
Received: from [106.210.131.79] (unknown [106.210.131.79]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210222072034eusmtip229bcae4bc753ef8210a398cd916a1959~mANXD9CkH1005310053eusmtip2V;
        Mon, 22 Feb 2021 07:20:34 +0000 (GMT)
Message-ID: <a804b8eb-3c79-4753-670c-cd5c2dfbc3a4@samsung.com>
Date:   Mon, 22 Feb 2021 08:20:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:86.0)
        Gecko/20100101 Thunderbird/86.0
Subject: Re: [PATCH] drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling
 features
Content-Language: en-GB
To:     Nicolas Boichat <drinkcat@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        linux-samsung-soc@vger.kernel.org,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Paul <sean@poorly.run>, Xin Ji <xji@analogixsemi.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        lkml <linux-kernel@vger.kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        freedreno@lists.freedesktop.org
From:   Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <CANMq1KALq+C2GD2uRohKpwvkDC05-fHyo=_WoHwnsKNjgcSfEQ@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTVxzHOffe3pZuhUvBcIIzBrLhI1t9YPDErSBxhuseipvZMshCq960
        RKimhenMCARwg44ijwWkBZwLZV1FV8tjtI7iwK3U8ZRCYFpxzk1k5TFaRBzKWloz/vv8Ht/f
        7/c9ORycbyEjOGmyTEYuE6dHkVyi9ZfFvtf2pcSIttoruEjVZ8PQNyoVgezzMyS6aNcR6E/l
        FIlqHvQCNLzwEEc25zCBJu4MEqi/38BGvXlONioqq2cj4x8jLFTW0ctGQ+YaEg3lDwJ0rt+C
        obyCGNRZkoL+siWgBnsTC82pf8eRbrEFIEfFdU9TxUMSLZrrCNTsLGOhK/M0qnM8xnevo2vb
        zTg9M3qGTWtyBwl6qESF0W2OekCb1A5PrrCaRRv1RSTdXXoTo2+P/EjSPzy6y6LHv7RidFN9
        Dm01/8am6yuHSbqkWQ+SQpO5bxxl0tM+YeRb4kRc6eJCHXbi8tZThq8GQC6ojlaCQA6kdsDy
        wmLcy3xKB+DsaLIScD3sBvDxrIXtC1wAFqhvsZ8rlA+MLF/hWwDv6FSEL5gBcLqrxdPF4fCo
        OFitlXsFBPUKnDEOkl7mUSHQVn2f8PIaSgQNRU2Yl0OpA/BC+cTKApwKh3nu71heDqOOwPyz
        13DvfJxycWB+1/SKgKQ2wadNYytDA6mDsHiy0i9eD/NbNCsCSPVyocXlZPnOfhPaB+75ORRO
        Wpv9dl6Cy6bzmI9z4LiuwC8uBLDFYMJ9hdfh7b4npNcZ7tn8vXmLL50AtZqJlTSkguDoVIjv
        hiBY3lqF+9I8WPg539cdCcd7W/wDw6F2YJ4sBVHqVc+iXmVfvcqN+v+9XwNCD8KZLEWGhFFs
        kzEnBQpxhiJLJhEcOZ5hBJ4v/usz61wbqJ38R9AJMA7oBJCDR4XxSMd2EZ93VPzpaUZ+PFWe
        lc4oOsFaDhEVztNrGlP5lEScyRxjmBOM/HkV4wRG5GKRMXw3dNULF/TuxnlVd0CPXL973+zV
        EFlV8JoPaxKTzlyPz67Tvhpr2DuSXXk2MUzXxBz+IGggdv3s1UT3Lnf8Yaxq7bWSn/aw+i6H
        nTNVjBZrW40Rm7P3a7TNtaykhhuWrjhKFPDiwer56LcM2gTnR2M5b3cdijb+fbpDyde8N+Xa
        1CYXuNWXphWpwrs98N7Jgqfx9vPMz4EBkkOD0Z1fSF/4N3xJ2pHcsLPnys6x7UNTz54El166
        8LHDIFg+ttcpTNv4vt52yhoseTfy5qPa7rkDG9qdOeti31l++b56Wpi51Lhj7mKFVL0MlvZs
        uLHRZPiM3TaZcksId+3PKG2vbFBFEQqpeNtmXK4Q/weC/CESUQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIKsWRmVeSWpSXmKPExsVy+t/xe7oe0cYJBr2bZS16z51ksljU28ti
        ceXrezaL1VdWsFg87XrLZjHn+VlGi6vfXzJbnHxzlcXixb2LLBbnz29gtzjb9IbdonPiEnaL
        TY+vsVpM3H+W3eLyrjlsFpebLzJazDi/j8miqcXY4lBftMWzk44Wy65sZrX4NOshs8WKn1sZ
        Le5OPgJUNPklm8XPXfNYLLa8mchqsfGrh8W8uz+YHWQ95u7dxezx/kYru8fshossHpf7epk8
        dtxdwuixc9ZdoFjHTFaPTas62TxOTLjE5HHn2h42j+3fHrB63O8+zuSxeUm9x/Fdt9g9lky7
        yubRt2UVY4BwlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllq
        kb5dgl7Gz+/zmArWGVRsmHKBsYFxploXIyeHhICJRNfzTaxdjFwcQgJLGSWavncxQiTEJXbP
        f8sMYQtL/LnWxQZR9JZRov1RD1MXIwcHr4CdxMylRSA1LAKqEu83XWQDsXkFBCVOznzCAmKL
        CiRITO5/DRYXFvCVuPZgDZjNDDS/6ctKVhBbRCBZ4vypmUwg85kF/nJIfFt6F+wIIYE5TBJP
        74EVsQloSvzdfBOsmVMgUKLn1TR2iEFmEl1bIY5mFpCXaN46m3kCo9AsJHfMQrJvFpKWWUha
        FjCyrGIUSS0tzk3PLTbUK07MLS7NS9dLzs/dxAhMW9uO/dy8g3Heq496hxiZOBgPMUpwMCuJ
        8LLdNUoQ4k1JrKxKLcqPLyrNSS0+xGgKDIyJzFKiyfnAxJlXEm9oZmBqaGJmaWBqaWasJM67
        de6aeCGB9MSS1OzU1ILUIpg+Jg5OqQYmyyuyOrcYxbvvKyh3FUiExybITNlSW3dK8cgJ10eH
        +pXKFG587Mn9xbAnb6+Rsu5Vs96P2w5dffBT0fb4uzfxdV+bT+3zDHsY7tdbtYJv/YVvvHPD
        v0tJbk1esGtp94z4i8tPhzhM+Pt5h2L6+eZcvXt9wo1b9XTqP23m8t+9p8lfa5fZ5fDoZFm3
        z3Mygx/dStD8wGYQ0Xbdd1JaZPJ3X8WsGwrqv20Djnls7WnZFHDph/z+C+/PvQlLMum/cKXv
        j0SjoN2306keolYrreX0SxJ/tWsHPFi1kffTAdbakvRzfTVJRyN/nRAX6H8eZb96i9sF2bcv
        Hy/Uer52+54Nvm3vWuO+T6vRtqj58ZlViaU4I9FQi7moOBEA0rROW+QDAAA=
X-CMS-MailID: 20210222072040eucas1p1bb0bb4ba140d3b7029bfd89ab9efef6b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210222053139eucas1p2661f94e218ae4c553e031ffa2e7b0cb3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210222053139eucas1p2661f94e218ae4c553e031ffa2e7b0cb3
References: <20210211113309.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
        <YDKvm1QmdJtJbaN6@pendragon.ideasonboard.com>
        <CGME20210222053139eucas1p2661f94e218ae4c553e031ffa2e7b0cb3@eucas1p2.samsung.com>
        <CANMq1KALq+C2GD2uRohKpwvkDC05-fHyo=_WoHwnsKNjgcSfEQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Nicolas,

W dniu 22.02.2021 o 06:31, Nicolas Boichat pisze:
> On Mon, Feb 22, 2021 at 3:08 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>> Hi Nicolas,
>>
>> Thank you for the patch.
>>
>> On Thu, Feb 11, 2021 at 11:33:55AM +0800, Nicolas Boichat wrote:
>>> Many of the DSI flags have names opposite to their actual effects,
>>> e.g. MIPI_DSI_MODE_EOT_PACKET means that EoT packets will actually
>>> be disabled. Fix this by including _NO_ in the flag names, e.g.
>>> MIPI_DSI_MODE_NO_EOT_PACKET.
>>>
>>> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
>> This looks good to me, it increases readability.
>>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> Please however see the end of the mail for a comment.


Reviewed-by: Andrzej Hajda <andrzej.hajda@samsung.com>

And comment at the end.

>>
>>> ---
>>> I considered adding _DISABLE_ instead, but that'd make the
>>> flag names a big too long.
>>>
>>> Generated with:
>>> flag=MIPI_DSI_MODE_VIDEO_HFP; git grep $flag | cut -f1 -d':' | \
>>>    xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HFP/" {}
>>> flag=MIPI_DSI_MODE_VIDEO_HBP; git grep $flag | cut -f1 -d':' | \
>>>    xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HBP/" {}
>>> flag=MIPI_DSI_MODE_VIDEO_HSA; git grep $flag | cut -f1 -d':' | \
>>>    xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HSA/" {}
>>> flag=MIPI_DSI_MODE_EOT_PACKET; git grep $flag | cut -f1 -d':' | \
>>>    xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_NO_EOT_PACKET/" {}
>>> (then minor format changes)
>> Ever tried coccinelle ? :-)
> Fun project for next time ,-)
>
>>>   drivers/gpu/drm/bridge/adv7511/adv7533.c             | 2 +-
>>>   drivers/gpu/drm/bridge/analogix/anx7625.c            | 2 +-
>>>   drivers/gpu/drm/bridge/cdns-dsi.c                    | 4 ++--
>>>   drivers/gpu/drm/bridge/tc358768.c                    | 2 +-
>>>   drivers/gpu/drm/exynos/exynos_drm_dsi.c              | 8 ++++----
>>>   drivers/gpu/drm/mcde/mcde_dsi.c                      | 2 +-
>>>   drivers/gpu/drm/mediatek/mtk_dsi.c                   | 2 +-
>>>   drivers/gpu/drm/msm/dsi/dsi_host.c                   | 8 ++++----
>>>   drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c | 2 +-
>>>   drivers/gpu/drm/panel/panel-dsi-cm.c                 | 2 +-
>>>   drivers/gpu/drm/panel/panel-elida-kd35t133.c         | 2 +-
>>>   drivers/gpu/drm/panel/panel-khadas-ts050.c           | 2 +-
>>>   drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c   | 2 +-
>>>   drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c   | 2 +-
>>>   drivers/gpu/drm/panel/panel-novatek-nt35510.c        | 2 +-
>>>   drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c   | 2 +-
>>>   drivers/gpu/drm/panel/panel-samsung-s6d16d0.c        | 2 +-
>>>   drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c     | 2 +-
>>>   drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c    | 2 +-
>>>   drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c        | 4 ++--
>>>   drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c      | 2 +-
>>>   drivers/gpu/drm/panel/panel-simple.c                 | 2 +-
>>>   drivers/gpu/drm/panel/panel-sony-acx424akp.c         | 2 +-
>>>   drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c     | 2 +-
>>>   include/drm/drm_mipi_dsi.h                           | 8 ++++----
>>>   25 files changed, 36 insertions(+), 36 deletions(-)
>>>
>>> []
>>> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
>>> index 360e6377e84b..ba91cf22af51 100644
>>> --- a/include/drm/drm_mipi_dsi.h
>>> +++ b/include/drm/drm_mipi_dsi.h
>>> @@ -119,15 +119,15 @@ struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(struct device_node *node);
>>>   /* enable hsync-end packets in vsync-pulse and v-porch area */
>>>   #define MIPI_DSI_MODE_VIDEO_HSE              BIT(4)
>> We're mixing bits that enable a feature and bits that disable a feature.
>> Are these bits defined in the DSI spec, or internal to DRM ? In the
>> latter case, would it make sense to standardize on one "polarity" ? That
>> would be a more intrusive change in drivers though.
> Yes, that'd require auditing every single code path and reverse the
> logic as needed. I'm not volunteering for that ,-P (hopefully the
> current change is still an improvement).
>
> Hopefully real DSI experts can comment (Andrzej?), I think the default
> are sensible settings?

Hehe, "real DSI expert" :), ok I've read spec few times :)

If I remember correctly the spec did not prioritizes these modes, specs 
are publicly available if somebody want to check it feel free.

These values were taken from defaults for Exynos DSI, as nobody at the 
time has better idea.

We could try to optimize it by looking for example in different dsi 
hosts defaults, or maybe dsi devices, but I am not sure if it is worth time.

This solution is good for me.


Regards

Andrzej


>
>
>>>   /* disable hfront-porch area */
>>> -#define MIPI_DSI_MODE_VIDEO_HFP              BIT(5)
>>> +#define MIPI_DSI_MODE_VIDEO_NO_HFP   BIT(5)
>>>   /* disable hback-porch area */
>>> -#define MIPI_DSI_MODE_VIDEO_HBP              BIT(6)
>>> +#define MIPI_DSI_MODE_VIDEO_NO_HBP   BIT(6)
>>>   /* disable hsync-active area */
>>> -#define MIPI_DSI_MODE_VIDEO_HSA              BIT(7)
>>> +#define MIPI_DSI_MODE_VIDEO_NO_HSA   BIT(7)
>>>   /* flush display FIFO on vsync pulse */
>>>   #define MIPI_DSI_MODE_VSYNC_FLUSH    BIT(8)
>>>   /* disable EoT packets in HS mode */
>>> -#define MIPI_DSI_MODE_EOT_PACKET     BIT(9)
>>> +#define MIPI_DSI_MODE_NO_EOT_PACKET  BIT(9)
>>>   /* device supports non-continuous clock behavior (DSI spec 5.6.1) */
>>>   #define MIPI_DSI_CLOCK_NON_CONTINUOUS        BIT(10)
>>>   /* transmit data in low power */
>> --
>> Regards,
>>
>> Laurent Pinchart
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://protect2.fireeye.com/v1/url?k=e6f0d6d2-b96befef-e6f15d9d-0cc47a31309a-f4be6a0935319c2d&q=1&e=5e175166-1972-4f28-a483-e9a65c07e25f&u=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel
>
