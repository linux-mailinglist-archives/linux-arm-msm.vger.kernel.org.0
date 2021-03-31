Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40C1E34FC27
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 11:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234491AbhCaJGV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 05:06:21 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:53731 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234492AbhCaJGL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 05:06:11 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210331090610euoutp02e256e661d39517bcb12e1077ff38c096~xYhHlmOEI3266632666euoutp02r
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 09:06:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210331090610euoutp02e256e661d39517bcb12e1077ff38c096~xYhHlmOEI3266632666euoutp02r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1617181570;
        bh=ffn6FNtzSxpCzKKziwCDBKV/FNlSkM5otmYsYdGu7Aw=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=o9rMcvVaaqFnmqC0sTEtJyVgTTW+lyTBH+3oQfE2Chn4lhJqorfx5HnUQ73jqAVxg
         6VVv6fwg+yt+QHdt39PLcgYR4XWbCe6ythTTR81QxJkri95m3RcxBQ0tSY3IKeAC0A
         unhtBu9F73HT6G0BgNgjKkosKuz14NbRgiH+Tbb4=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210331090609eucas1p299156a55a7e4f17448dd05bc570500fb~xYhHMBDVA1890118901eucas1p27;
        Wed, 31 Mar 2021 09:06:09 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 78.4A.09439.18B34606; Wed, 31
        Mar 2021 10:06:09 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210331090609eucas1p25db032276eebb17b2c3564af3ab76c42~xYhGtZvni0598705987eucas1p2u;
        Wed, 31 Mar 2021 09:06:09 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210331090609eusmtrp218be59a465ae840e350af8559cf8d4d6~xYhGsT_Ip0248902489eusmtrp2H;
        Wed, 31 Mar 2021 09:06:09 +0000 (GMT)
X-AuditID: cbfec7f5-c03ff700000024df-2f-60643b81fe35
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 8A.4D.08705.18B34606; Wed, 31
        Mar 2021 10:06:09 +0100 (BST)
Received: from localhost (unknown [106.210.131.79]) by eusmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20210331090600eusmtip258dc8af4e87fdcbe64c487a5dc3ecbc3~xYg_x6AKQ1519215192eusmtip2M;
        Wed, 31 Mar 2021 09:06:00 +0000 (GMT)
Message-ID: <b308b17c-37fa-220d-d76b-9274054597e7@samsung.com>
Date:   Wed, 31 Mar 2021 11:05:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0)
        Gecko/20100101 Thunderbird/88.0
Subject: Re: [PATCH v2 01/14] drm/bridge: Fix the stop condition of
 drm_bridge_chain_pre_enable()
Content-Language: en-GB
To:     Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     robdclark@chromium.org, dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        Steev Klimaszewski <steev@kali.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org
From:   Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <20210329195255.v2.1.If62a003f76a2bc4ccc6c53565becc05d2aad4430@changeid>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUxbVRj23Ht7ua2WHAqEE/CLzm1hiaAyzFGQzC92B8YQPxZlMbQpF0ZW
        YLbDwcgCoyuwKmPFRWlLMt1wq8CGg5YBwoD+sCsdFelg1aDVoePDDUQoBHRD2ttF/j15Pt7n
        fU8OQ0rWBNFMfuEhTlUoV0ppEdX53arr6WPJObJnBuw7cK3LQWBn/xyFndeHCDx8fpDGN3zz
        NB5bmSGx484YhU/om0Kwvn84BLt7GmlsO7kPj69Okti8agW4WpeCV29Wkdg+8QeBLXf0gl1h
        7LxHG8KaKn6g2K6fmwBrqjEI2HO9MwTbeNZDstdOjRLsxHgvzV5Z/lXAej+2E2zTZ2M0O1D7
        KcV2OMvYxfbHM0OzRCk5nDL/I06VkCoT7W8e333whKhkRucDFcDM6ICQQXAnWvL9JtABESOB
        ZoB+avlE4BckcAkgwy0ZLywCdGP9DP0g4a4eInjhAkAa7dfB+PRGvHUu4BLDVFR7aQT4MQW3
        IqetIciHIYfhd8qPI6EMNXsuEH4cDhWo8ux0oJqEUahyiR8aAe8D1KKfDNSRsIVEs39dCyRo
        GIfudfwYmCqE76K6lT6CTz+BNFYT6Q8gOCtEnVoLwS/+GvL2Xw3hcTiatVuC+FG03n0m6ClH
        XvPxYLgGIOs33SQvJKMJ19pGG7PREIfaehJ4+mU0OtQaoBEMRZ67YfwOoai+83OSp8WopkrC
        u2ORd9gaHBiFvhrx0aeA1LjpXYyb7jduusb4f+8XgGoGUVyxuiCPUycWcofj1fICdXFhXryi
        qKAdbHxP5327rwuYZxfibYBggA0ghpRGiMMH5DKJOEdeeoRTFWWripWc2gZiGEoaJe6xtmZL
        YJ78EHeA4w5yqgcqwQijK4g3+uJ819Mi6tOnRmIkb5eOZ6QlNrrf+XOqbMqy6+He+NjBdE3Z
        C1ZyvX771YujTPL5KfTqFmpBzb0n3q0yfj/X1va65rZ7yLjXnqA4/RxwLa4cycL3sn2a2LvH
        t81J3vdOZ6Rm1jdM7Du3nLsYXXUluT9J2HGgIVoT2Qd/6dZ6J7cvb/kwXVZSbpnfpk0cUF4e
        0X9bCcGxbuaRp0xjlxnsVijkVXg611MXucfxpu5o3ek20UmvihC/kjF4dCkzxVT9fPs/1rC0
        D0oNSctfVmT/m39R+WJX1vCttxbyLznK19r7mm7vrC7Ke4ne21MS47qZ+3fK1idF1OHHxLUG
        Q9Keh6SUer/82R2kSi3/D81VO4cNBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplleLIzCtJLcpLzFFi42I5/e/4Pd1G65QEg2MvWCx6z51ksji9/x2L
        xekzp5gszi47yGZx5et7Nour318yW5x8c5XFonPiEnaLifvPsltc3jWHzeJQX7TFtZ+PmS1W
        /NzKaNHeZWPx83obs8XxO0+ZLLa8mcjqIOjx/kYru8fshossHjvuLmH0mN0xk9Vj8Z6XTB5z
        Ft1g9jgx4RKTx51re9g8tn97wOpxv/s4k8eSaVfZPA70Tmbx2Hy62uPzJrkAvig9m6L80pJU
        hYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jFXX3As6uSpedn1l
        bGBcwdHFyMkhIWAicbn9FFMXIxeHkMBSRonzFxtZIRLiErvnv2WGsIUl/lzrYoMoesYocWnn
        BXaQBK+AnUTvuguMIDaLgKrE6UMz2CDighInZz5hAbFFBRIkzn6YxwRiCwskSzQtegG2gBlo
        QdOXlawgQ0UEGpgkLt1dDHYGs8BqZok9326DVQkJ3GaU6OngAbHZBDQl/m6+CbaBUyBUov/7
        XiaISWYSXVu7GCFseYnmrbOZJzAKzUJyyCwkC2chaZmFpGUBI8sqRpHU0uLc9NxiQ73ixNzi
        0rx0veT83E2MwHSx7djPzTsY5736qHeIkYmD8RCjBAezkgiv8IHEBCHelMTKqtSi/Pii0pzU
        4kOMpsDQmMgsJZqcD0xYeSXxhmYGpoYmZpYGppZmxkrivFvnrokXEkhPLEnNTk0tSC2C6WPi
        4JRqYFL9ptToG1lzMJPltIHLpKnCK46mTjb5/r9+10uVW2/1nmVMUNzKuWTqi0NnNZPWMipU
        HvzAo71OhGvfp4rDM55dyrCMbpY693im3zyjv58Kijzvi3SLHnjVnN5xSVGB/5zav6mNhyyW
        VphPPSmhuNjW78PEUz9r+C+cXeO8tzRqZ2Ex3+TSIIZZs9hcLaM5Xgtw/cs8+etrycGFM0Sn
        mPy9sr7g8UJBxbyGX4L2Ke65Ei5G0Vt87y2ZeD995v8L76wl7d4/zarhufBps7va1WfMez/9
        Pd99nc1vlhB3RrmTINOv9zFXtdS/ywY33EueFWu0uOzHexXTP2pyjEY7P21UknWVUgj3ZF40
        XT4nPkqJpTgj0VCLuag4EQDBcjMVoAMAAA==
X-CMS-MailID: 20210331090609eucas1p25db032276eebb17b2c3564af3ab76c42
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210330025413eucas1p1613dea9b53bcb06d93eb210c6dfd1254
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210330025413eucas1p1613dea9b53bcb06d93eb210c6dfd1254
References: <20210330025345.3980086-1-dianders@chromium.org>
        <CGME20210330025413eucas1p1613dea9b53bcb06d93eb210c6dfd1254@eucas1p1.samsung.com>
        <20210329195255.v2.1.If62a003f76a2bc4ccc6c53565becc05d2aad4430@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Douglas,

W dniu 30.03.2021 o 04:53, Douglas Anderson pisze:
> The drm_bridge_chain_pre_enable() is not the proper opposite of
> drm_bridge_chain_post_disable(). It continues along the chain to
> _before_ the starting bridge. Let's fix that.
>
> Fixes: 05193dc38197 ("drm/bridge: Make the bridge chain a double-linked list")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> (no changes since v1)
>
>   drivers/gpu/drm/drm_bridge.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 64f0effb52ac..044acd07c153 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -522,6 +522,9 @@ void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
>   	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
>   		if (iter->funcs->pre_enable)
>   			iter->funcs->pre_enable(iter);
> +
> +		if (iter == bridge)
> +			break;


Looking at the bridge chaining code always makes me sick :) but beside 
this the change looks correct, and follows 
drm_atomic_bridge_chain_pre_enable.

Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Regards
Andrzej

>   	}
>   }
>   EXPORT_SYMBOL(drm_bridge_chain_pre_enable);
