Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9438034FF45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 13:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234995AbhCaLJL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 07:09:11 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:42211 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbhCaLIo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 07:08:44 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210331110843euoutp0265bfa828ae3611966956330673d81412~xaMHta6mr0402204022euoutp02G
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 11:08:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210331110843euoutp0265bfa828ae3611966956330673d81412~xaMHta6mr0402204022euoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1617188923;
        bh=j+UFKhaDTfw2uKkr/VQDaf1s66d3cV4S9KODX1UazYQ=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=PiVVIbjvluJBbF1JJNhQ9q6YeYiuRoZrXwgXjBuGLkDah0AI9ta3bEDAXjvzq4x0a
         sfZnRWkw9HzpEQAHYjJBr6t2urNuJobS7turJBkqSbmsDXwO6XcSu5HDtuxKZdOQMt
         /657S/ZDOX5Ww4WRKk7/zCpY0BL43dYTE0QEfkWk=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210331110842eucas1p2ce1bf4d00cf2397f86bce5bc521972af~xaMHNsH791935019350eucas1p2B;
        Wed, 31 Mar 2021 11:08:42 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 8A.B0.09444.A3854606; Wed, 31
        Mar 2021 12:08:42 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210331110842eucas1p1576a6beef2125a458efc4db8c56819d2~xaMGlczxA2294722947eucas1p1R;
        Wed, 31 Mar 2021 11:08:42 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210331110842eusmtrp2e24972c498edad3a5ba610be4a304d65~xaMGkSfha0192101921eusmtrp2X;
        Wed, 31 Mar 2021 11:08:42 +0000 (GMT)
X-AuditID: cbfec7f4-dd5ff700000024e4-05-6064583a52ef
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 60.A1.08705.93854606; Wed, 31
        Mar 2021 12:08:41 +0100 (BST)
Received: from localhost (unknown [106.210.131.79]) by eusmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20210331110840eusmtip1a267e66273b8c6acbe8b5397b1cb6cd7~xaMEydLoj1360613606eusmtip1G;
        Wed, 31 Mar 2021 11:08:39 +0000 (GMT)
Message-ID: <8887ded7-d1ab-844c-e3a3-f39f6ef6264a@samsung.com>
Date:   Wed, 31 Mar 2021 13:08:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0)
        Gecko/20100101 Thunderbird/88.0
Subject: Re: [PATCH v2 11/14] drm/bridge: ti-sn65dsi86: Power things
 properly for reading the EDID
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
In-Reply-To: <20210329195255.v2.11.Ied721dc895156046ac523baa55a71da241cd09c7@changeid>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFKsWRmVeSWpSXmKPExsWy7djPc7pWESkJBte/aVv0njvJZHF6/zsW
        i7PLDrJZXPn6ns3i6veXzBYn31xlseicuITdYuL+s+wWl3fNYbM41Bdtce3nY2aLT7MeMlus
        +LmV0aK9y8bi5/U2Zovjd54yOQh4vL/Ryu4xu+Eii8fsjpmsHov3vGTymLPoBrPHiQmXmDzu
        XNvD5rH92wNWj/vdx5k8lky7yuZxoHcyi8fnTXIBPFFcNimpOZllqUX6dglcGbd+nmEuOKZR
        MWn2dPYGxs3yXYwcHBICJhI//4R1MXJxCAmsYJRYcugucxcjJ5DzhVHi/+lAiMRnRolPu/ex
        gyRAGp68XcACkVjOKLH//zs2COcFo0TDyS9sIGN5Bewkti+UBTFZBFQllj7IB+nlFRCUODnz
        CQuILSqQILHqxnImEFtYIEXi9aaTYIuZBcQlmr6sZAUZKSLwj1Fi9cTHTCAOs8BnJolPUw6B
        dbAJaEr83XyTDcTmFAiTOL75JCNEt7xE89bZzCANEgKXOCV6dnyFOttF4t6pZ8wQtrDEq+Nb
        oOIyEv93zmeCsOsl7q9ogWruYJTYumEnVIO1xJ1zv8A+YwbavH6XPkTYUWLam2WMkHDkk7jx
        VhDiBj6JSdumM0OEeSU62oQgqhUl7p/dCjVQXGLpha9sExiVZiGFyywk/89C8s0shL0LGFlW
        MYqnlhbnpqcWG+WllusVJ+YWl+al6yXn525iBCbH0/+Of9nBuPzVR71DjEwcjIcYJTiYlUR4
        hQ8kJgjxpiRWVqUW5ccXleakFh9ilOZgURLnTdqyJl5IID2xJDU7NbUgtQgmy8TBKdXAZPlW
        oGlG3LorNTL5C14lXL9Zt705UM/qePnpZ3aM98/xHX4ZX6fTePm5/UsFIbmMOxt1PARfMjdl
        GkTuvCDx4qmAfVRdaCQLs3nS3LQzCw3unum6/7pCeNNrwXvnAmsKF27c3uN4z8xHcp1oxanz
        S453t1YcO7SPT0E8jPtM7z/B+x3vu/bIHt5cWrR45bdt298anE0Izfz9Jf4ho+zrDKFN+nb6
        1hdPra0LbyyL/vi3cJvG835l/uZN/2ZkX/A0eaNxtanTJsXfc1r84SOG50zfB3gp7c39bL1a
        pNc/nplvwWvugwvNA37rfzM+Iasvulqczehox0652h2e+8WEXvTdm6r8xE7e3rJ+C98FJZbi
        jERDLeai4kQAKzEsm/0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHIsWRmVeSWpSXmKPExsVy+t/xu7pWESkJBp90LXrPnWSyOL3/HYvF
        2WUH2SyufH3PZnH1+0tmi5NvrrJYdE5cwm4xcf9ZdovLu+awWRzqi7a49vMxs8WnWQ+ZLVb8
        3Mpo0d5lY/HzehuzxfE7T5kcBDze32hl95jdcJHFY3bHTFaPxXteMnnMWXSD2ePEhEtMHneu
        7WHz2P7tAavH/e7jTB5Lpl1l8zjQO5nF4/MmuQCeKD2bovzSklSFjPziElulaEMLIz1DSws9
        IxNLPUNj81grI1MlfTublNSczLLUIn27BL2MWz/PMBcc06iYNHs6ewPjZvkuRk4OCQETiSdv
        F7B0MXJxCAksZZT48P0VC0RCXGL3/LfMELawxJ9rXWwQRc8YJebf2cHaxcjBwStgJ7F9oSyI
        ySKgKrH0QT5IOa+AoMTJmU/AxogKJEic/TCPCcQWFkiRaPy4khHEZgYa3/RlJSvISBGBBiaJ
        S3cXM4E4zAJfmSRaXi1lh1h2h1Hi7OoFYO1sApoSfzffZAOxOQXCJI5vPgk1ykyia2sXlC0v
        0bx1NvMERqFZSC6ZhWTjLCQts5C0LGBkWcUoklpanJueW2yoV5yYW1yal66XnJ+7iRGYELYd
        +7l5B+O8Vx/1DjEycTAeYpTgYFYS4RU+kJggxJuSWFmVWpQfX1Sak1p8iNEUGBoTmaVEk/OB
        KSmvJN7QzMDU0MTM0sDU0sxYSZx369w18UIC6YklqdmpqQWpRTB9TBycUg1Ms0tjYtikrp6K
        0C2Pk8iLsYw+c7Az+4HjW77aylm6wQKznTpszkzK7RJZm/M0cnIVz9JNijZeGvdsr90rEX2T
        8zQnsatgbcPTzuM9Bev5+f1alk1aXVX9L6x234En1dNt3n+fUagc+bP0TUr8iaCZ9hb7pxSd
        ft7XIhAQr1okrvCjeWup/aaw9tlvpk490caYW7iQIc172l79yLDTYrOqRaUDBB+6Llij4Kxx
        6MHz4OWsM3kD5kqFh/c/qvVjvBbgl7Bm70cTe+kMC6Pu34evN4eGfms6t5Q3MjWxQfDvzVZZ
        PcEW/i/HrvT0P+UKnaz1QbVc93/VAp3uvYc/Orb4/VlTsUFno/jFi6sEOZRYijMSDbWYi4oT
        AStYB3CRAwAA
X-CMS-MailID: 20210331110842eucas1p1576a6beef2125a458efc4db8c56819d2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210330025435eucas1p12b96966451ee0691f6d5d99b64ac2c8b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210330025435eucas1p12b96966451ee0691f6d5d99b64ac2c8b
References: <20210330025345.3980086-1-dianders@chromium.org>
        <CGME20210330025435eucas1p12b96966451ee0691f6d5d99b64ac2c8b@eucas1p1.samsung.com>
        <20210329195255.v2.11.Ied721dc895156046ac523baa55a71da241cd09c7@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


W dniu 30.03.2021 o 04:53, Douglas Anderson pisze:
> eDP panels won't provide their EDID unless they're powered on. Let's
> chain a power-on before we read the EDID. This roughly matches what
> was done in 'parade-ps8640.c'.
>
> NOTE: The old code attempted to call pm_runtime_get_sync() before
> reading the EDID. While that was enough to power the bridge chip on,
> it wasn't enough to talk to the panel for two reasons:
> 1. Since we never ran the bridge chip's pre-enable then we never set
>     the bit to ignore HPD. This meant the bridge chip didn't even _try_
>     to go out on the bus and communicate with the panel.
> 2. Even if we fixed things to ignore HPD, the EDID still wouldn't read
>     if the panel wasn't on.
>
> One thing that's a bit odd here is taking advantage of the EDID that
> the core might have cached for us. See the patch ("drm/edid: Use the
> cached EDID in drm_get_edid() if eDP"). We manage to get at the cache
> by:
> - Instantly failing aux transfers if we're not powered.
> - If the first read of the EDID fails we try again after powering.
>
> Fixes: 58074b08c04a ("drm/bridge: ti-sn65dsi86: Read EDID blob over DDC")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Depending on what people think of the other patches in this series,
> some of this could change.
> - If everyone loves the "runtime PM" in the panel driver then we
>    could, in theory, put the pre-enable chaining straight in the "aux
>    transfer" function.
> - If everyone hates the EDID cache moving to the core then we can
>    avoid some of the awkward flow of things and keep the EDID cache in
>    the sn65dsi86 driver.


I wonder if this shouldn't be solved in the core - ie caller of 
get_modes callback should be responsible for powering up the pipeline, 
otherwise we need to repeat this stuff in every bridge/panel driver.

Any thoughts?


Regards

Andrzej


>
> (no changes since v1)
>
>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 39 +++++++++++++++++++++++++--
>   1 file changed, 37 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index c0398daaa4a6..673c9f1c2d8e 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -128,6 +128,7 @@
>    * @dp_lanes:     Count of dp_lanes we're using.
>    * @ln_assign:    Value to program to the LN_ASSIGN register.
>    * @ln_polrs:     Value for the 4-bit LN_POLRS field of SN_ENH_FRAME_REG.
> + * @pre_enabled:  If true then pre_enable() has run.
>    *
>    * @gchip:        If we expose our GPIOs, this is used.
>    * @gchip_output: A cache of whether we've set GPIOs to output.  This
> @@ -155,6 +156,7 @@ struct ti_sn_bridge {
>   	int				dp_lanes;
>   	u8				ln_assign;
>   	u8				ln_polrs;
> +	bool				pre_enabled;
>   
>   #if defined(CONFIG_OF_GPIO)
>   	struct gpio_chip		gchip;
> @@ -268,11 +270,33 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
>   {
>   	struct ti_sn_bridge *pdata = connector_to_ti_sn_bridge(connector);
>   	struct edid *edid;
> +	bool was_enabled;
>   	int num = 0;
>   
> -	pm_runtime_get_sync(pdata->dev);
> +	/*
> +	 * Try to get the EDID first without anything special. There are
> +	 * three things that could happen with this call.
> +	 * a) It might just return from its cache.
> +	 * b) It might try to initiate an AUX transfer which might work.
> +	 * c) It might try to initiate an AUX transfer which might fail because
> +	 *    we're not powered up.
> +	 *
> +	 * If we get a failure we'll assume case c) and try again. NOTE: we
> +	 * don't want to power up every time because that's slow and we don't
> +	 * have visibility into whether the data has already been cached.
> +	 */
>   	edid = drm_get_edid(connector, &pdata->aux.ddc);
> -	pm_runtime_put(pdata->dev);
> +	if (!edid) {
> +		was_enabled = pdata->pre_enabled;
> +
> +		if (!was_enabled)
> +			drm_bridge_chain_pre_enable(&pdata->bridge);
> +
> +		edid = drm_get_edid(connector, &pdata->aux.ddc);
> +
> +		if (!was_enabled)
> +			drm_bridge_chain_post_disable(&pdata->bridge);
> +	}
>   
>   	if (edid) {
>   		if (drm_edid_is_valid(edid))
> @@ -852,12 +876,16 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
>   			   HPD_DISABLE);
>   
>   	drm_panel_prepare(pdata->panel);
> +
> +	pdata->pre_enabled = true;
>   }
>   
>   static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
>   {
>   	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
>   
> +	pdata->pre_enabled = false;
> +
>   	drm_panel_unprepare(pdata->panel);
>   
>   	clk_disable_unprepare(pdata->refclk);
> @@ -891,6 +919,13 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
>   	int ret;
>   	u8 addr_len[SN_AUX_LENGTH_REG + 1 - SN_AUX_ADDR_19_16_REG];
>   
> +	/*
> +	 * Things just won't work if the panel isn't powered. Return failure
> +	 * right away.
> +	 */
> +	if (!pdata->pre_enabled)
> +		return -EIO;
> +
>   	if (len > SN_AUX_MAX_PAYLOAD_BYTES)
>   		return -EINVAL;
>   
