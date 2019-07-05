Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA14960351
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2019 11:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727212AbfGEJpH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Jul 2019 05:45:07 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:33762 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727401AbfGEJpH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Jul 2019 05:45:07 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190705094505euoutp021bb5757cc337a9646500ae16e495deca~uea0XnruG2664726647euoutp02p
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jul 2019 09:45:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190705094505euoutp021bb5757cc337a9646500ae16e495deca~uea0XnruG2664726647euoutp02p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1562319905;
        bh=/YVEsi66lwSu49bAR68WZXj+/SwnNGXKt6i6wK82uC4=;
        h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
        b=UWTmyRWzjp6s4EtXnq7uS2j8SCKun9gu8B9V0Jfo2PAUOYim2QdN1IIl4o2AI7s8H
         Rh9lLJ/EJFHvRiruZ3TY93wVnawVIIJ9yLGTnB2aYDx/I6ccROj9Mt8NcOsLpefCXZ
         kHm2DwKWKJP+WWidpaQH9Fm1C8TGD+gQf+pyFZcA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190705094503eucas1p11a6774d62daff12e73144934008fdb9e~ueay9Vr1R2639526395eucas1p1v;
        Fri,  5 Jul 2019 09:45:03 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 3B.D3.04325.F1C1F1D5; Fri,  5
        Jul 2019 10:45:03 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190705094502eucas1p18b0fc7460ad84d6cc55f64d416bc91c9~ueayMWPah0076400764eucas1p11;
        Fri,  5 Jul 2019 09:45:02 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190705094502eusmtrp2459a396d075eba54453395d48519ea68~ueax92Cjk1904119041eusmtrp2_;
        Fri,  5 Jul 2019 09:45:02 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-e4-5d1f1c1fa1e0
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 06.84.04146.E1C1F1D5; Fri,  5
        Jul 2019 10:45:02 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190705094501eusmtip231c460c06efaa00064f19d611405d35a~ueaw1lyA81553915539eusmtip2c;
        Fri,  5 Jul 2019 09:45:01 +0000 (GMT)
From:   Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v3 01/22] drm: Include ddc adapter pointer in struct
 drm_connector
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        dri-devel@lists.freedesktop.org
Cc:     kernel@collabora.com, Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Airlie <airlied@redhat.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org
Message-ID: <ef458f71-d061-4a8f-c53c-aa325b577d42@samsung.com>
Date:   Fri, 5 Jul 2019 11:44:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <9e65f3c0-941d-d04c-5745-6b3a2965b990@suse.de>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0xTVxz29D56aaw7FE1/cQTiVRMfEWUzeOITzZLd/bclZhqVSZUbNPJw
        LbgpJjhxBhg4KBGldFgUlFQzsC1oIUBSxVodVER8MLF1KBsEfLbKVGC9XMz47zvfd77f7/tO
        Dkdp/mBnc7vTMkR9mi6FZ1V0w7V/vUuiI6MTlnWe+oQUdngUpLvHoiClD5sYUl37k5Kc7XtE
        k2Ff6DjeUEyRqoCXIXeCz1li/rsdEaOviCb2jgKGWI87aeL11ilJXnGVktj67jKkuLVdSboa
        zSzpyulE5JV/nCInvS0KkhcwsaTyZT1N/AOtiPQ+uk6T0Us2mvSWXEXkH4eWnCwZYIljqJiJ
        jxJ+vj3KChUXsoTLvVVIaH5joYXy3DJGsFnzWOHSGz8jVHi+EXy/uBWCvSpb+HV0meBu7FEK
        z1u6WeGYw4oE+80s4bUt6mu8RbU6SUzZvU/UL12bqNrV0vTVXrv2x46/WqlDaEiTj8I4wMvB
        0vyCykcqToNrEJjt1UpJ0OAAgqePI2ThNYL+nAD70RE4egHJwjkELvdpWnYMIwgE1kiYxQth
        1P5gwhCBN0Peu1uUhGfibLg4MjyxjsKVHHisDyYENV4LxsLzIcxxNJ4HzYNxEj0r5L1xtYKW
        r4SDp+zJBA7Dq8B5rImRMIWjIae+nJKxFnqenFJI8wGfC4MXdaVKOfUXMFRXOtkgAgbdjkk+
        EsadkkHC2eCrOULJ5lwE9XVOShZWwRV3JyOFo0LNahuXyvR6qB0sRBINeAbcHw6XM8wAY8MJ
        SqbVkHt08qXngK+9fnKgFqpvBdkixJumNDNNaWOa0sb0/14Loq1IK2YaUpNFw+dp4g8xBl2q
        ITMtOWZneqoNhf74zTF38DJq+bDDhTCH+OnqRDYqQcPo9hn2p7oQcBQ/U/32fWSCRp2k239A
        1Kdv12emiAYX+pSjea06a5p/qwYn6zLEPaK4V9R/VBVc2OxDaMU6+/qR7m+T7LpyfpMRlpRg
        7Gr+/l3infzzYxsOamuu82PP+lYc/11VZjYvfpjkPEN/ubl/QdeWaVzP6rlGbXBN0WdtI+qs
        RcYU38LYlXNHLIr0+MeHN/bTv92L47fFv/0uLrYyY0PMAtWf/oKNwfkDmHOoottueMLvFeS+
        H2hbztOGXbrYRZTeoPsPyhHfod8DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEKsWRmVeSWpSXmKPExsVy+t/xe7pyMvKxBicuS1n0njvJZHH11gIm
        i2l3drNaLF3fyG6x7PE9Fou394Hc/9smMlss+XKe1eLK1/dsFnOen2W0mHR/AovF5nM9rBar
        pu5ksTh/fgO7RefEJewWmx5fY7WYuP8su8XlXXPYLC43X2S0+PTgP7PFjPP7mCw6v8xis1j4
        cSuLxYOX+xkt7t47wWLxd/smFou7k48wWrzYIm4xY/JLNostbyayOsh5tF76y+Yxb021x467
        Sxg99n5bwOIxu2Mmq8emVZ1sHtu/PWD1mHcy0ON+93Emj81L6j36/xp4HN91i93j/b6rbB59
        W1Yxemw+Xe3xeZNcgECUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1K
        ak5mWWqRvl2CXsa+3Z4Fm8Urzj3az9zA+Eaoi5GTQ0LAROJL2xrGLkYuDiGBpYwSe97eZoVI
        iEvsnv+WGcIWlvhzrYsNoug1o8S/t91sIAk2AU2Jv5tvgtnCAhESnb8uMIMUiQg0MkocXrGc
        CcRhFljKIbH2/XsWiPZNzBIPdn1iAWnhFbCTmNS7GqiFg4NFQEVi7yszkLAo0KRJ13ZClQhK
        nJz5BMzmFLCW2Nm3G+w8ZgF1iT/zLjFD2PISzVtnQ9niEreezGeawCg0C0n7LCQts5C0zELS
        soCRZRWjSGppcW56brGhXnFibnFpXrpecn7uJkZg+tp27OfmHYyXNgYfYhTgYFTi4U1gk4sV
        Yk0sK67MPcQowcGsJML7/bdMrBBvSmJlVWpRfnxRaU5q8SFGU6DfJjJLiSbnA1NrXkm8oamh
        uYWlobmxubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGxkZzE35zr6nO7g1rfa1aygL3
        +UnM95w8/U3Pu5x5syOOz5/dwNF+KK380V+PQxUh67++XlNbkfs36tv3BdtDRG/fj3rpIeo7
        vyFT9WvwOcGfAvvmTuCaOcsq9PdtHT7fcPO3jL3eP3Tn523/c1A06/9SnqSF5v8Kfc+e/X7T
        dPKu1AUqfGLnvimxFGckGmoxFxUnAgB/3OWEdQMAAA==
X-CMS-MailID: 20190705094502eucas1p18b0fc7460ad84d6cc55f64d416bc91c9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190701144119epcas1p211ec60b63f3c6ae02392e2ae67f1a4ba
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190701144119epcas1p211ec60b63f3c6ae02392e2ae67f1a4ba
References: <3fb19371-db7d-f9dc-31a7-1ccd126f6784@collabora.com>
        <cover.1561735433.git.andrzej.p@collabora.com>
        <d6381c020ea1c848a7044d830bdb0ec9663d1619.1561735433.git.andrzej.p@collabora.com>
        <9b03d145-ec50-927c-55a8-dff1cd51d655@suse.de>
        <cf1984e4-50af-302d-ef67-9ad530118c29@collabora.com>
        <CGME20190701144119epcas1p211ec60b63f3c6ae02392e2ae67f1a4ba@epcas1p2.samsung.com>
        <9e65f3c0-941d-d04c-5745-6b3a2965b990@suse.de>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01.07.2019 16:41, Thomas Zimmermann wrote:
> Hi
>
> Am 01.07.19 um 15:27 schrieb Andrzej Pietrasiewicz:
>> Hi Thomas,
>>
>> Thank you for your comments. Please see inline.
>>
>> W dniu 30.06.2019 o 10:12, Thomas Zimmermann pisze:
>>> Hi
>>>
>>> I like the idea, but would prefer a more structured approach.
>>>
>>> Setting connector->ddc before calling drm_sysfs_connector_add() seems
>>> error prone. The dependency is not really clear from the code or
>>> interfaces.
>>>
>>> The other thing is that drivers I mostly work on, ast and mgag200, have
>>> code like this:
>>>
>>>    struct ast_i2c_chan {
>>>     struct i2c_adapter adapter;
>>>     struct drm_device *dev;
>>>     struct i2c_algo_bit_data bit;
>>>    };
>>>
>>>    struct ast_connector {
>>>     struct drm_connector base;
>>>     struct ast_i2c_chan *i2c;
>>>    };
>>>
>>> It already encodes the connection between connector and ddc adapter.
>>>
>>> I suggest to introduce struct drm_i2c_adapter
>>>
>>>    struct drm_i2c_adapter {
>>>     struct i2c_adapter base;
>>>     struct drm_connector *connector;
>>>    };
>>>
>>> and convert drivers over to it. Ast would look like this:
>>>
>>>    struct ast_i2c_chan {
>>>     struct drm_i2c_adapter adapter;
>>>     struct i2c_algo_bit_data bit;
>>>    };
>>>
>> There are few flavors of these drivers. In some of them
>> the i2c_adapter for ddc is allocated and initialized by
>> the driver, which must provide a place in memory to hold
>> the adapter. ast is an example of this approach.
>>
>> But there are others, such as for example exynos_hdmi.c.
>> It gets its ddc adapter with of_find_i2c_adapter_by_node()
>> and merely stores a pointer to it, while not managing the
>> memory needed to hold the i2c_adapter.
> I see.
>
>> Do you have any idea how to accommodate these various
>> flavors of drivers in the scheme you propose?
> Something like
>
>   struct drm_i2c_adapter {
> 	struct i2c_adapter *adapter;
> 	struct drm_connector *connector;
>   };
>
> with adapter either being allocated dynamically or acquired via
> of_find_i2c_adapter_by_node(); with separate init and finish functions
> for each variant. But it looks like over-abstraction to me. Without
> prototyping the idea, I cannot say if it's worth the effort.
>
> For something more simple, maybe just have a function to attach an i2c
> adapter to a connector:
>
>   drm_connector_attach_i2c_adapter(connector, i2c_adapter)
>
> which sets the connector's ddc pointer and creates the sysfs entry if
> the connector's entry is already present.


I am not sure if such function is really necessary. Assigning ddc field
before connector registration seems to be much simpler and quite
standard - many fields are initialized this way.


Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

 --
Regards
Andrzej



> Best regards
> Thomas
>
>> Andrzej
>>
>>


