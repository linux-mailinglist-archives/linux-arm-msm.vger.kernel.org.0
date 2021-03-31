Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E09EC34FD85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 11:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234121AbhCaJzZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 05:55:25 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:38690 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234666AbhCaJzJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 05:55:09 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210331095508euoutp02b1037ae0095cf3e02fc7f15903a9ecef~xZL4F9Lqb2100321003euoutp02V
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 09:55:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210331095508euoutp02b1037ae0095cf3e02fc7f15903a9ecef~xZL4F9Lqb2100321003euoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1617184508;
        bh=kJuwa3yGELX4v8vUPJiYygWAt+yoiG3MTD8i/c8nRIY=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=tveD+JR2UKWYt2ZEw+2C0Ww9FfPzCOQHnsCvVYQw7b/jVrJUL7LwXZjFdxFvT9yzB
         KiSi2zhZTNy85jK1pR0nX1/ls9MxqzxEQiFKUV+GRGE/eoQh0B7Ka4yDjk+xHFFmAR
         PZ4xfwJJwlkBpZ18ID6WDYOwgbaQE+5CRsEWK6os=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210331095508eucas1p217b96e8432712e6196f580be0455ce83~xZL3rfE3a3241532415eucas1p2U;
        Wed, 31 Mar 2021 09:55:08 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 75.1F.09452.BF644606; Wed, 31
        Mar 2021 10:55:07 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210331095507eucas1p13cd1a7bdef3a28839471191e2c999954~xZL3Ebe-F2289722897eucas1p1C;
        Wed, 31 Mar 2021 09:55:07 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210331095507eusmtrp2604d7e88f12e0ba631f92bb69d2d9447~xZL3DiLxs2740027400eusmtrp2J;
        Wed, 31 Mar 2021 09:55:07 +0000 (GMT)
X-AuditID: cbfec7f2-ab7ff700000024ec-26-606446fb004a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id DC.E6.08696.BF644606; Wed, 31
        Mar 2021 10:55:07 +0100 (BST)
Received: from localhost (unknown [106.210.131.79]) by eusmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20210331095500eusmtip2dfe5c31afea6bffb67a30d6c50eea4e1~xZLwtR_MJ0784407844eusmtip2m;
        Wed, 31 Mar 2021 09:55:00 +0000 (GMT)
Message-ID: <e1caa468-0998-cddb-938a-06785c381ba0@samsung.com>
Date:   Wed, 31 Mar 2021 11:54:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0)
        Gecko/20100101 Thunderbird/88.0
Subject: Re: [PATCH v2 06/14] drm/bridge: ti-sn65dsi86: Move
 drm_panel_unprepare() to post_disable()
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
In-Reply-To: <20210329195255.v2.6.Ia75c9ffe2a2582393a8532d244da86f18b4c9b21@changeid>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNKsWRmVeSWpSXmKPExsWy7djP87q/3VISDDo+W1r0njvJZHF6/zsW
        i7PLDrJZXPn6ns3i6veXzBYn31xlseicuITdYuL+s+wWl3fNYbM41Bdtce3nY2aLT7MeMlus
        +LmV0aK9y8bi5/U2Zovjd54yOQh4vL/Ryu4xu+Eii8fsjpmsHov3vGTymLPoBrPHiQmXmDzu
        XNvD5rH92wNWj/vdx5k8lky7yuZxoHcyi8fnTXIBPFFcNimpOZllqUX6dglcGZOmdDMXnOCu
        eLX4LVsD4znOLkZODgkBE4nFR68wdTFycQgJrGCU6L7zmBEkISTwhVHi2IpMCPszo8Sq3aYw
        DYueN7BDNCxnlFj4ezJUwwtGib5vvCA2r4CdxKK9j1lBbBYBVYm9f86yQsQFJU7OfMICYosK
        JEisurGcCcQWFkiT+DUPooZZQFyi6ctKVpAFIgL/GCVWT3wMdh6zwGcmiU9TDoF1sAloSvzd
        fJMNxOYUCJV42fWPCaJbXqJ562xmkAYJgWucEsf6vzFB3O0i0fn9LRuELSzx6vgWdghbRuL/
        zvlQNfUS91e0QDV3MEps3bCTGSJhLXHn3C+gZg6gDZoS63fpQ4QdJabue8IEEpYQ4JO48VYQ
        4gY+iUnbpjNDhHklOtqEIKoVJe6f3Qo1UFxi6YWvbBMYlWYhhcssJP/PQvLNLIS9CxhZVjGK
        p5YW56anFhvmpZbrFSfmFpfmpesl5+duYgSmx9P/jn/awTj31Ue9Q4xMHIyHGCU4mJVEeIUP
        JCYI8aYkVlalFuXHF5XmpBYfYpTmYFES5101e028kEB6YklqdmpqQWoRTJaJg1OqgUlTTkCU
        9ZvF1p8vHU/9PDGp0nXyJtH261a73xzadU357HRHn9OXZUKb79tWpPeX69yfPiVNuvargu+f
        P+HqL5yiVL/lN+Q9jGAzefmTab7QARGumcd+2E2pWX+zpCRl7YY3t69ruUYeu16yyOSm9jo3
        wRcxWU3bLOr+Su04tttulv2Bbd35aW7JDE+eBW9XPPkgp7V75hTe6Vt8rfa8SVzxsFvCzuzI
        xcbHuUGLckVlImSO7X5w483iQz5ZTBNf/llporzw1mI5n01R2z0qvVf/5tZ4Z3isOmN1uPCq
        RG/eD/+1jwS8nfBqxf0pse2WxStP/Zi2XvmOZP7fvQfSFt+e2fRX84vfk09vOre9vb10uxJL
        cUaioRZzUXEiAMItCXH+AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkleLIzCtJLcpLzFFi42I5/e/4Pd3fbikJBq/nCVv0njvJZHF6/zsW
        i7PLDrJZXPn6ns3i6veXzBYn31xlseicuITdYuL+s+wWl3fNYbM41Bdtce3nY2aLT7MeMlus
        +LmV0aK9y8bi5/U2Zovjd54yOQh4vL/Ryu4xu+Eii8fsjpmsHov3vGTymLPoBrPHiQmXmDzu
        XNvD5rH92wNWj/vdx5k8lky7yuZxoHcyi8fnTXIBPFF6NkX5pSWpChn5xSW2StGGFkZ6hpYW
        ekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GZOmdDMXnOCueLX4LVsD4znOLkZODgkBE4lF
        zxvYuxi5OIQEljJKLPw7hxUiIS6xe/5bZghbWOLPtS42iKJnjBIP985iA0nwCthJLNr7GKyB
        RUBVYu+fs6wQcUGJkzOfsIDYogIJEmc/zGMCsYUF0iR+zYOoYQZa0PRlJSvIUBGBBiaJS3cX
        M4E4zAJfmSRaXi2Fuuk2o8TM6zfA7mAT0JT4u/km2GpOgVCJl13/mCBGmUl0be1ihLDlJZq3
        zmaewCg0C8kls5BsnIWkZRaSlgWMLKsYRVJLi3PTc4uN9IoTc4tL89L1kvNzNzEC08K2Yz+3
        7GBc+eqj3iFGJg7GQ4wSHMxKIrzCBxIThHhTEiurUovy44tKc1KLDzGaAoNjIrOUaHI+MDHl
        lcQbmhmYGpqYWRqYWpoZK4nzmhxZEy8kkJ5YkpqdmlqQWgTTx8TBKdXA1J1duXZa+Bs+SYXD
        /JPXNBQ8FePbb7in7BvXhibLW+K7lRqtoyZNKYmOl4jblqaffaHPkH+X9OGrJ8X4mG6ciY9b
        YX7PdcHSB1MCRLekBky4uyD1ca205ZLLq8Kcv4nXJt9Ku+im0hJy4lOMwd/djo/atm6S73sw
        cWpGr/H5F6ennfr6ameow9vAoPOTRF9+n7JpUtvDqvN+8odW3rYS8D6dIbmz/KiPlQ2TT8PF
        SUYPVET2Srd8cK1d4B+o/eb/ueXbVsWv85wRN6/Stu3w5H2ihbWJzMLz9wvOnHYhgytKY5n6
        +uajHzm/+a58GqMSt0o2b/XN678uiWyf2hcp/UPxIPOP2zz7dl0/9YH3apYSS3FGoqEWc1Fx
        IgAQUTRtlAMAAA==
X-CMS-MailID: 20210331095507eucas1p13cd1a7bdef3a28839471191e2c999954
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210330025440eucas1p2a49739a015ffc6877fd639011c75ce1e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210330025440eucas1p2a49739a015ffc6877fd639011c75ce1e
References: <20210330025345.3980086-1-dianders@chromium.org>
        <CGME20210330025440eucas1p2a49739a015ffc6877fd639011c75ce1e@eucas1p2.samsung.com>
        <20210329195255.v2.6.Ia75c9ffe2a2582393a8532d244da86f18b4c9b21@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


W dniu 30.03.2021 o 04:53, Douglas Anderson pisze:
> We prepared the panel in pre_enable() so we should unprepare it in
> post_disable() to match.
>
> This becomes important once we start using pre_enable() and
> post_disable() to make sure things are powered on (and then off again)
> when reading the EDID.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Regards
Andrzej
> ---
>
> (no changes since v1)
>
>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index e8e523b3a16b..50a52af8e39f 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -460,8 +460,6 @@ static void ti_sn_bridge_disable(struct drm_bridge *bridge)
>   	regmap_write(pdata->regmap, SN_ML_TX_MODE_REG, 0);
>   	/* disable DP PLL */
>   	regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 0);
> -
> -	drm_panel_unprepare(pdata->panel);
>   }
>   
>   static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn_bridge *pdata)
> @@ -877,6 +875,8 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
>   {
>   	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
>   
> +	drm_panel_unprepare(pdata->panel);
> +
>   	clk_disable_unprepare(pdata->refclk);
>   
>   	pm_runtime_put_sync(pdata->dev);
