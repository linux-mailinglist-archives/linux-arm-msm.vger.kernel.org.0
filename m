Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4788534FD70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 11:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234701AbhCaJvH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 05:51:07 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:33228 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234629AbhCaJul (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 05:50:41 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210331095039euoutp01f58366ceebc66fe429762da74b394eb0~xZH9mAOQ82432324323euoutp01k
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 09:50:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210331095039euoutp01f58366ceebc66fe429762da74b394eb0~xZH9mAOQ82432324323euoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1617184239;
        bh=n4ijVkW2p2CbAjNlaISf5YB9Unqy0tGgSS/tBxUJTwA=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=bzm8gFrsVVfkINNQPIwJUp0A3JOgzL3UJlUJcAkRarXPkt+zy7vnw1U1UwFWtGz1z
         7dLAbYVVg4cZ9HFlFsDWhGyFCW8JhgXb/5+PQnuXKjW32FrF3wVXCZe4plB7DlUwgC
         rdtEic7E6LiNW1SmLyD/yq0J3nUuJj6gQlt9iMwI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210331095039eucas1p289ed193f5a81de10a1de804bcf72937f~xZH9Oec1s0532205322eucas1p25;
        Wed, 31 Mar 2021 09:50:39 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 12.4E.09452.EE544606; Wed, 31
        Mar 2021 10:50:38 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210331095038eucas1p156a73f3dd0f205a44856e27b9682ab2b~xZH8kx2oX2614426144eucas1p1t;
        Wed, 31 Mar 2021 09:50:38 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210331095038eusmtrp2e5306a4a5d0799cb7f4007cd8b3c6992~xZH8j5_v92531125311eusmtrp2Y;
        Wed, 31 Mar 2021 09:50:38 +0000 (GMT)
X-AuditID: cbfec7f2-a9fff700000024ec-8f-606445ee41ae
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id F8.F4.08705.EE544606; Wed, 31
        Mar 2021 10:50:38 +0100 (BST)
Received: from localhost (unknown [106.210.131.79]) by eusmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20210331095036eusmtip25338a8acbe16b9a4ffd03c449074ce49~xZH6yaBqN0921909219eusmtip2G;
        Wed, 31 Mar 2021 09:50:36 +0000 (GMT)
Message-ID: <4c70cdb6-7fab-dc53-121e-f355da1ea14f@samsung.com>
Date:   Wed, 31 Mar 2021 11:50:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0)
        Gecko/20100101 Thunderbird/88.0
Subject: Re: [PATCH v2 04/14] drm/bridge: ti-sn65dsi86: Reorder remove()
Content-Language: en-GB
To:     Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     robdclark@chromium.org, dri-devel@lists.freedesktop.org,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        Steev Klimaszewski <steev@kali.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Robert Foss <robert.foss@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org
From:   Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <20210329195255.v2.4.Ifcf1deaa372eba7eeb4f8eb516c5d15b77a657a9@changeid>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUwTZxzH99xzvbsSC0dx4RHfYsfULVrmZpabEpgZZJctSxRfkmGivckN
        HbSwtuA0vrDhENupIAZCi2AUCnZuoFAo2o1ycyuMUVAGVm2sUhcGEVCKmjLHZjmW8d/n9/09
        399bHgrKRyUx1B6NntdquEwFEYY3/xLsWT2WnKZ64/Toeua4uxNjutrGcKbb0k4wvz8ZJ5j+
        Z8OQ6XzYjzPHiqtJpritm2T6rlQQjHBiOzMQ9ENmwnQfMnVBG2COGuKZ4M0CyLi8f2Dv0uy4
        52uSNeddx1lzYbmEPe8YxtiKcx7IdhTdwFjvgINgW57ek7A+owtjq0v7CdZ5vARnA5eXbJyX
        GhafxmfuyeW1cQmqsN3CAxeR3RbxxVTAS+SB6nkGIKUQvRa5/VbcAMIoOV0HUEPJJCYGkwB5
        3E2zQQCgpyfKgAFQMxaL+4Co1wJU6eyAYvAnQHeMJ8lQXRmdgIyDjTDEOP0q6uu6C0U9EnWW
        P8BD/DKtQlZPLRbiKJpFBpsgCTGko9FXkxckoaLz6WmAvi32z4wB6QCGJk4LMw6Cfg393XiL
        CLGU3ooqbfmk6F6K8m3mmZEQfVuKrg76obhqErJZL+IiR6ERVxMp8iL0T2sVJvJh5Ks7Mmsu
        BMjW0DprXo+87ikidAD4onP9lThR3oCe+aoI8S7hyDMaKc4Qjk41l0FRlqHCArn4ehnyddtm
        C0ajmt4nRBFQmObcxTRnf9OcbUz/9z0LcCuI5nN06nRet0bD71XqOLUuR5Ou3JWlvgxe/Miu
        adeEHZwZeawUAEYBASAKKubLopycSi5L4/bt57VZO7U5mbxOAAspXBEts5ov7pTT6Zyez+D5
        bF77XxajpDF5mJzb8tGCtYszfr72w8fKXvsrsVHDMRHKgrtLN5S/pT6UvPrST1cvfJ9QBVeQ
        i5XPT5Lm2rfP+D4cyrqtInu26/sqHD360pSN4yt2bKMnfjs28s2gsshyZ1Pjqpq+fZ9kTD9K
        eScVFhpf2vppZKJ98H3HskC9IpB/qdY/5EmKmLoXk20NJIH2dYlxkzX6+nAtqvi8zBGMbR5L
        Wbn8eYOio+gvYQE9FH9+ubN1VVMu2PZmguZWO2c3Lxmg/EON6u/eO/fQYi3ZW+lsSbwmWHZ8
        GVua25D846ZeLjJ1JSWBWz47mnW//NfEs7uAvUa6/8jBwAePFJuNN242Fwx7q0s3X2+jW0gF
        rtvNrXkdanXcv6BfVrMABAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPIsWRmVeSWpSXmKPExsVy+t/xe7rvXFMSDP7sE7LoPXeSyeL0/ncs
        FmeXHWSzuPL1PZvF1e8vmS1OvrnKYtE5cQm7xcT9Z9ktLu+aw2ZxqC/a4trPx8wWn2Y9ZLZY
        8XMro0V7l43Fz+ttzBbH7zxlchDweH+jld1jdsNFFo/ZHTNZPRbvecnkMWfRDWaPExMuMXnc
        ubaHzWP7twesHve7jzN5LJl2lc3jQO9kFo/Pm+QCeKL0bIryS0tSFTLyi0tslaINLYz0DC0t
        9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mg49Oc5WsJ+/4tfnO2wNjEt4uhg5OCQETCSW
        navpYuTiEBJYyigxd+pyxi5GTqC4uMTu+W+ZIWxhiT/XuthAbCGBZ4wSi+cHgti8AnYS3Y82
        g9WwCKhKXD59jxkiLihxcuYTFhBbVCBB4uyHeUwgtrCAh0TX1kOsIDYz0PymLytZQRaLCDQw
        SVy6u5gJxGEW+Mok0fJqKTvESbcZJeYf+wbWwiagKfF3802wMzgFQiXmbW1mhxhlBjS2ixHC
        lpdo3jqbeQKj0Cwkl8xCsnEWkpZZSFoWMLKsYhRJLS3OTc8tNtQrTswtLs1L10vOz93ECEwJ
        24793LyDcd6rj3qHGJk4GA8xSnAwK4nwCh9ITBDiTUmsrEotyo8vKs1JLT7EaAoMjonMUqLJ
        +cCklFcSb2hmYGpoYmZpYGppZqwkzrt17pp4IYH0xJLU7NTUgtQimD4mDk6pBqblB45ezXb8
        LtO5eDLH1hoVbdM8j0yLBe+FVcp9Fv35d0blqMSUXstrzxb6C68r3aG3KEbP/PG21qq7O+Ot
        DjwSzpac7XHxpxPDjO9G2+ME+9nWPZy4527gzKmly3Xubru9qCX8X8LPhbWp3lsXJzmdsb39
        cV27/ZojfrNnLeuZ4Fm/32KNh4ZwRWjt7Ba+xtytBWZT9V9nrP5p9LomT70yQVSgdOqxroQJ
        6m+mPGrIOf/23a9d55NjTudt+CyRtNTX+4+w9xt7uWf7lNL4OZXWu23VYxX6ppK36cw7XR0/
        lrerv3xgCxTWDHph/Prfg328x+ROZE1lS8qI/nG7Lmxn/TTmKeYy0zcbBEw+fsxaiaU4I9FQ
        i7moOBEAMaA6JpIDAAA=
X-CMS-MailID: 20210331095038eucas1p156a73f3dd0f205a44856e27b9682ab2b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210330025419eucas1p2982892803a5d05226dbe6781bff61233
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210330025419eucas1p2982892803a5d05226dbe6781bff61233
References: <20210330025345.3980086-1-dianders@chromium.org>
        <CGME20210330025419eucas1p2982892803a5d05226dbe6781bff61233@eucas1p2.samsung.com>
        <20210329195255.v2.4.Ifcf1deaa372eba7eeb4f8eb516c5d15b77a657a9@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


W dniu 30.03.2021 o 04:53, Douglas Anderson pisze:
> Let's make the remove() function strictly the reverse of the probe()
> function so it's easier to reason about.
>
> NOTES:
> - The MIPI calls probably belong in detach() but will be moved in a
>    separate patch.


The mipi is incorrectly handled already - mipi devices are searched 
after bridge registration - it should be reverse, there is comment in 
the driver that it is due to some dsi hosts, maybe it would be better to 
fix it there instead of conserve this bad design.


> - The cached EDID freeing isn't actually part of probe but needs to be
>    in remove to avoid orphaning memory until better handling of the
>    EDID happens.
> This patch was created by code inspection and should move us closer to
> a proper remove.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> (no changes since v1)
>
>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 76f43af6735d..c006678c9921 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1315,20 +1315,21 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
>   	if (!pdata)
>   		return -EINVAL;
>   
> -	kfree(pdata->edid);
> -	ti_sn_debugfs_remove(pdata);
> -
> -	of_node_put(pdata->host_node);
> -
> -	pm_runtime_disable(pdata->dev);
> -
>   	if (pdata->dsi) {
>   		mipi_dsi_detach(pdata->dsi);
>   		mipi_dsi_device_unregister(pdata->dsi);
>   	}
>   
> +	kfree(pdata->edid);
> +
> +	ti_sn_debugfs_remove(pdata);
> +
>   	drm_bridge_remove(&pdata->bridge);
>   
> +	pm_runtime_disable(pdata->dev);
> +
> +	of_node_put(pdata->host_node);
> +


Looks good.

Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Regards
Andrzej


>   	return 0;
>   }
>   	
