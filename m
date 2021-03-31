Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8DC34FD80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 11:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbhCaJyV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 05:54:21 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35620 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234375AbhCaJx4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 05:53:56 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210331095355euoutp01635d10b7cf429a4d4e3be5837b010e04~xZKzrR3In3181031810euoutp01u
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 09:53:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210331095355euoutp01635d10b7cf429a4d4e3be5837b010e04~xZKzrR3In3181031810euoutp01u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1617184435;
        bh=eszsJ0h4CNavy2UxKzMZ8WNSLiPUDOmMpeexsv9ZMHE=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=gSnZf5D3EVmvmDYeL5utntTrc9mGgheLb50lQeD4UvWsOawqWP0emOfAYPfPZzz9d
         4kt336VUKvnRww945Mw1dsUNQfy7DLSyUpsf6LFDcMjB+GdbgDPi7j/Mu8b2/HNBYi
         awSLPIBxyt2rZWLo7eqZhE/nMwh8y4XR2Uo2fgVI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210331095354eucas1p20124a60da79b81e41d5572b14a5b852a~xZKzSPH571283812838eucas1p2H;
        Wed, 31 Mar 2021 09:53:54 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id FC.33.09444.2B644606; Wed, 31
        Mar 2021 10:53:54 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210331095354eucas1p222219f83a7cc1b91a00f6b9e7cc602aa~xZKys-4nX2504025040eucas1p2c;
        Wed, 31 Mar 2021 09:53:54 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210331095353eusmtrp200f664897b5c3bde135a945c07681397~xZKysIN4a2673926739eusmtrp24;
        Wed, 31 Mar 2021 09:53:53 +0000 (GMT)
X-AuditID: cbfec7f4-dd5ff700000024e4-05-606446b264bb
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 09.85.08705.1B644606; Wed, 31
        Mar 2021 10:53:53 +0100 (BST)
Received: from localhost (unknown [106.210.131.79]) by eusmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20210331095349eusmtip1d13da7d1e179d51e0e8d6b1a6b0ad284~xZKuaG5Jj0539505395eusmtip1T;
        Wed, 31 Mar 2021 09:53:49 +0000 (GMT)
Message-ID: <00fc2110-d30a-d8f2-b22b-a5c73b54127d@samsung.com>
Date:   Wed, 31 Mar 2021 11:53:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0)
        Gecko/20100101 Thunderbird/88.0
Subject: Re: [PATCH v2 05/14] drm/bridge: ti-sn65dsi86: Move MIPI detach() /
 unregister() to detach()
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
In-Reply-To: <20210329195255.v2.5.I1a9275ffbde1d33ad7a3af819f5fbc0941b7ee02@changeid>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHKsWRmVeSWpSXmKPExsWy7djPc7qb3FISDObfUbLoPXeSyeL0/ncs
        FmeXHWSzuPL1PZvF1e8vmS1OvrnKYtE5cQm7xcT9Z9ktLu+aw2ZxqC/a4trPx8wWn2Y9ZLZY
        8XMro0V7l43Fz+ttzBbH7zxlchDweH+jld1jdsNFFo/ZHTNZPRbvecnkMWfRDWaPExMuMXnc
        ubaHzWP7twesHve7jzN5LJl2lc3jQO9kFo/Pm+QCeKK4bFJSczLLUov07RK4Mt7sO8FS0M5b
        sXHGa+YGxitcXYycHBICJhLr995n7GLk4hASWMEosWP5IlYI5wujRPuy3VCZz4wSE44tYIdp
        OXHsH1TVckaJludf2CCcF4wSc+a1s4FU8QrYSdx+upkFxGYRUJU4v+EVE0RcUOLkzCdgcVGB
        BIlVN5aDxYUF0iXWTX/ICmIzC4hLNH1ZCbZBROAfo8TqiY+ZQBxmgc9MEp+mHALrYBPQlPi7
        +SbYNk6BUIm2lnWMEN3yEs1bZzODNEgIXOKUeHD3FNThLhINHe0sELawxKvjW6DiMhL/d85n
        grDrJe6vaIFq7mCU2LphJzNEwlrizrlfQNs4gDZoSqzfpQ8RdpR4evcHI0hYQoBP4sZbQYgb
        +CQmbZvODBHmlehoE4KoVpS4f3Yr1EBxiaUXvrJNYFSahRQus5D8PwvJN7MQ9i5gZFnFKJ5a
        WpybnlpslJdarlecmFtcmpeul5yfu4kRmCRP/zv+ZQfj8lcf9Q4xMnEwHmKU4GBWEuEVPpCY
        IMSbklhZlVqUH19UmpNafIhRmoNFSZw3acuaeCGB9MSS1OzU1ILUIpgsEwenVAOT+mfbjt+F
        bX8vmmUumjy76Jxovv+iI1xN02VmFu8+sX6Dy72QaoMO2Q1zpf50i904vf1Mi6CJqbX456NP
        dByWmUxL3/Gje7+W7DUe+9DE7tOhy+w/HmWb1MIR0JD0cpu+uuqUfdtrxCOLQ/bZBeZ5TjqU
        u/pqeGzBYSaPUxyfxTbWP9MR+d0S9yu2vd18S9CRTraut4bPd7y0+KFfK7b7SqtyooP1YuO9
        3gG/gx8bV5+flxnSFfCNT+0TV8euMy5Lt1yxO+HOtGLypJkzmmTKNhgU3/E5mcblu4ot6WDw
        E9Zr/CEbYqwTF3y0+O6+7Y2PV/GBIzvc3+hPne1c/ujc1WRD65p3CZK/on8l9+1QYinOSDTU
        Yi4qTgQAcGPurAEEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkleLIzCtJLcpLzFFi42I5/e/4Xd2NbikJBodemFn0njvJZHF6/zsW
        i7PLDrJZXPn6ns3i6veXzBYn31xlseicuITdYuL+s+wWl3fNYbM41Bdtce3nY2aLT7MeMlus
        +LmV0aK9y8bi5/U2Zovjd54yOQh4vL/Ryu4xu+Eii8fsjpmsHov3vGTymLPoBrPHiQmXmDzu
        XNvD5rH92wNWj/vdx5k8lky7yuZxoHcyi8fnTXIBPFF6NkX5pSWpChn5xSW2StGGFkZ6hpYW
        ekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GW/2nWApaOet2DjjNXMD4xWuLkZODgkBE4kT
        x/6xdjFycQgJLGWUaJg/kRUiIS6xe/5bZghbWOLPtS42iKJnjBJf5x5iAUnwCthJ3H66Gcxm
        EVCVOL/hFRNEXFDi5MwnYHFRgQSJsx/mgcWFBdIl1k1/CLaAGWhB05eVYJtFBBqYJC7dXcwE
        4jALfGWSaHm1lB1i3W1Gib3nboPdwSagKfF38002EJtTIFSirWUdI8QoM4murV1QtrxE89bZ
        zBMYhWYhuWQWko2zkLTMQtKygJFlFaNIamlxbnpusaFecWJucWleul5yfu4mRmBa2Hbs5+Yd
        jPNefdQ7xMjEwXiIUYKDWUmEV/hAYoIQb0piZVVqUX58UWlOavEhRlNgcExklhJNzgcmpryS
        eEMzA1NDEzNLA1NLM2Mlcd6tc9fECwmkJ5akZqemFqQWwfQxcXBKNTAtK11/t0T7+Rn+R/Xm
        PR/X/oq3D5HZH3qBg2VHl7K22eF+/SDne7bp2bWFT+aucf5ccWTb66xQHwOBzLdCS7Nc4yMZ
        Dy8S8OdfevR226208lSG+tUXvvG/vHpqzvG180Q6J/bphCVeYH46XzzD3dBBc+FCZzZu68y/
        n9ij51/JzZi/MS102YfDBu/WzkxdffbDEV6erKk/qtf+Xa95xsqw61LZpCc3vMsYHkR+2vDy
        xTxV3bWiMX/3NGWf8PpwSeX579OpQjsflr2sdC+T2BN0NIg769yGA/651398m+v4qNbdLI9f
        /c05R9E+NTuDG1e/njgXZxFkVcX0MGLvtJSr5X3X/Wat/utmnfDijV66EktxRqKhFnNRcSIA
        x019PpQDAAA=
X-CMS-MailID: 20210331095354eucas1p222219f83a7cc1b91a00f6b9e7cc602aa
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210330025417eucas1p29eca41bbcfc2550902cee87fd44b98e4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210330025417eucas1p29eca41bbcfc2550902cee87fd44b98e4
References: <20210330025345.3980086-1-dianders@chromium.org>
        <CGME20210330025417eucas1p29eca41bbcfc2550902cee87fd44b98e4@eucas1p2.samsung.com>
        <20210329195255.v2.5.I1a9275ffbde1d33ad7a3af819f5fbc0941b7ee02@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


W dniu 30.03.2021 o 04:53, Douglas Anderson pisze:
> The register() / attach() for MIPI happen in the bridge's
> attach(). That means that the inverse belongs in the bridge's
> detach().


As I commented in previous patch, it would be better to fix mipi/bridge 
registration order in host and this driver.

Have you considered this?


Regards

Andrzej

>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> (no changes since v1)
>
>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index c006678c9921..e8e523b3a16b 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -437,7 +437,15 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>   
>   static void ti_sn_bridge_detach(struct drm_bridge *bridge)
>   {
> -	drm_dp_aux_unregister(&bridge_to_ti_sn_bridge(bridge)->aux);
> +	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> +
> +
> +	if (pdata->dsi) {
> +		mipi_dsi_detach(pdata->dsi);
> +		mipi_dsi_device_unregister(pdata->dsi);
> +	}
> +
> +	drm_dp_aux_unregister(&pdata->aux);
>   }
>   
>   static void ti_sn_bridge_disable(struct drm_bridge *bridge)
> @@ -1315,11 +1323,6 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
>   	if (!pdata)
>   		return -EINVAL;
>   
> -	if (pdata->dsi) {
> -		mipi_dsi_detach(pdata->dsi);
> -		mipi_dsi_device_unregister(pdata->dsi);
> -	}
> -
>   	kfree(pdata->edid);
>   
>   	ti_sn_debugfs_remove(pdata);
