Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5499D34FDD7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 12:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbhCaKM4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 06:12:56 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:53242 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229869AbhCaKMk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 06:12:40 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210331101238euoutp02a4b511bfd41b2610471c6e20824b0fe5~xZbKNURkI0646906469euoutp02J
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 10:12:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210331101238euoutp02a4b511bfd41b2610471c6e20824b0fe5~xZbKNURkI0646906469euoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1617185558;
        bh=IuD+yxbAFDnUrs1IElAd4pJHc//IKV7VHIBWdBNLg1A=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=N9jpzoGNeql5KyEj+t2QnpGC2aWUke8ulhOEy4IOr4sj8HAyvrrW2of+7iNzqKupe
         hx1ik9gjHifGe+k03l2jgQlHzwQrBcKDG+H9JS0R+FRRWo0l/HHuVM43uk/OOoaN5m
         q4keX8fqtUHIKTqYohk8xsRT13iCC57Wszm/aARg=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210331101238eucas1p2057f863548fde34dbf2ba7bf546fafa9~xZbJyUt8m0678706787eucas1p2Y;
        Wed, 31 Mar 2021 10:12:38 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 27.F6.09444.61B44606; Wed, 31
        Mar 2021 11:12:38 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210331101237eucas1p1ae152c11cd6959fa949a181a84a0a2b1~xZbJDxxPn3077430774eucas1p1O;
        Wed, 31 Mar 2021 10:12:37 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210331101237eusmtrp1ee2a22286b721365132450f8d4bf6c73~xZbJC2_rQ2878428784eusmtrp13;
        Wed, 31 Mar 2021 10:12:37 +0000 (GMT)
X-AuditID: cbfec7f4-dbdff700000024e4-4d-60644b163bfc
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 33.4A.08696.51B44606; Wed, 31
        Mar 2021 11:12:37 +0100 (BST)
Received: from localhost (unknown [106.210.131.79]) by eusmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20210331101232eusmtip1bb0d13edb05953affdffa10885f15017~xZbEq2HeB1360313603eusmtip1K;
        Wed, 31 Mar 2021 10:12:32 +0000 (GMT)
Message-ID: <26d73f36-e150-57ec-d957-4b7bda6b366e@samsung.com>
Date:   Wed, 31 Mar 2021 12:12:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0)
        Gecko/20100101 Thunderbird/88.0
Subject: Re: [PATCH v2 10/14] drm/bridge: ti-sn65dsi86: Stop caching the
 EDID ourselves
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
In-Reply-To: <20210329195255.v2.10.Ida6151df6bfc71df77afee1d72bb7eb0a443f327@changeid>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHKsWRmVeSWpSXmKPExsWy7djPc7pi3ikJBmdvcVj0njvJZHF6/zsW
        i7PLDrJZXPn6ns3i6veXzBYn31xlseicuITdYuL+s+wWl3fNYbM41Bdtce3nY2aLT7MeMlus
        +LmV0aK9y8bi5/U2Zovjd54yOQh4vL/Ryu4xu+Eii8fsjpmsHov3vGTymLPoBrPHiQmXmDzu
        XNvD5rH92wNWj/vdx5k8lky7yuZxoHcyi8fnTXIBPFFcNimpOZllqUX6dglcGRN6j7IXXBCu
        mNGzgrGBcRN/FyMnh4SAiURHxz7mLkYuDiGBFYwSU1qfsEM4XxglPh3dwAThfGaUuD2jlQWm
        pWHuYaiq5YwS81duYoRwXjBKzNraywxSxStgJ3G5pxesg0VAVeLkjDusEHFBiZMzn4DFRQUS
        JFbdWM4EYgsLREqsO/cCrIZZQFyi6ctKVpChIgL/GCVWT3wMdgezwGcmiU9TDoF1sAloSvzd
        fJMNxOYUCJPYsegDM0S3vETz1tlgL0kIXOKUWLDoNzPE4S4SO5ZNh3pCWOLV8S3sELaMxOnJ
        PVDxeon7K1qgmjsYJbZu2AnVbC1x59wvoG0cQBs0Jdbv0ocIO0q8aekEC0sI8EnceCsIcQOf
        xKRt05khwrwSHW1CENWKEvfPboUaKC6x9MJXtgmMSrOQwmUWkv9nIflmFsLeBYwsqxjFU0uL
        c9NTi43yUsv1ihNzi0vz0vWS83M3MQKT5Ol/x7/sYFz+6qPeIUYmDsZDjBIczEoivMIHEhOE
        eFMSK6tSi/Lji0pzUosPMUpzsCiJ8yZtWRMvJJCeWJKanZpakFoEk2Xi4JRqYJpwguvRpv+f
        GkJWxXed1//54iVPBN8MvaWtq2WS+AQur4nZlBNS3tF2PNaAxfph7sJrersDRByf8NzcMaHP
        JftGMhdT3sW/u5wuL5/3I/4yp9xfNSfrRnVN4Y0/LYKWH4xPmmoX9eaAuFP+lW3CvnVWYibL
        J52xWj7d85NznHp1wPRSF6G0ntRprlH2YnGHX7dNMm4OvClReCu3dsvMb7opqhsPaqQ/yuVa
        a/Aub8X8f44J19wffjJUrzTbWGszZVU1x47b9mxn1KfNKZZZPn1ejqs609O+PF/bRPVg5ntL
        Eksua09zmByQl98ktP+RTl6cp7qvZf41lz9bfNncQqJboz5f2PvEbePyruwWJZbijERDLeai
        4kQAeqgr6QEEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgleLIzCtJLcpLzFFi42I5/e/4XV1R75QEg2c7JCx6z51ksji9/x2L
        xdllB9ksrnx9z2Zx9ftLZouTb66yWHROXMJuMXH/WXaLy7vmsFkc6ou2uPbzMbPFp1kPmS1W
        /NzKaNHeZWPx83obs8XxO0+ZHAQ83t9oZfeY3XCRxWN2x0xWj8V7XjJ5zFl0g9njxIRLTB53
        ru1h89j+7QGrx/3u40weS6ZdZfM40DuZxePzJrkAnig9m6L80pJUhYz84hJbpWhDCyM9Q0sL
        PSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jAm9R9kLLghXzOhZwdjAuIm/i5GTQ0LARKJh
        7mH2LkYuDiGBpYwSV7e0sEEkxCV2z3/LDGELS/y51gUWFxJ4xiix5moUiM0rYCdxuaeXBcRm
        EVCVODnjDitEXFDi5MwnYHFRgQSJsx/mMYHYwgKREv3zroHFmYHmN31ZyQqyWESggUni0t3F
        TCAOs8BXJomWV0uhTrrDKHFq/xSw1WwCmhJ/N98EszkFwiR2LPrADDHKTKJraxcjhC0v0bx1
        NvMERqFZSC6ZhWTjLCQts5C0LGBkWcUoklpanJueW2ykV5yYW1yal66XnJ+7iRGYFLYd+7ll
        B+PKVx/1DjEycTAeYpTgYFYS4RU+kJggxJuSWFmVWpQfX1Sak1p8iNEUGBwTmaVEk/OBaSmv
        JN7QzMDU0MTM0sDU0sxYSZzX5MiaeCGB9MSS1OzU1ILUIpg+Jg5OqQYmq5DkrmrP2XWnZPvb
        DuqlreGe8J3nrPnchxf9wjt7/ntHNNjbrmO/u/DxpZqPWg9ElvE4iF1ZaGieO7n6eUzYgwPt
        bcH5+0XSHy+/1MP07c8Wo0PM77gjz1Y5RbxsEj7VHXswf8rSC5M3byjfej5HLKQsfuWhr+Hc
        HOf4+X8Kr02YpXYmsSpO9PMBzulsMsXRS5geFD9Wcl13pWH1zHntzAabojxPpXLd2/Pl/Q/P
        aTq6VzXP87+tiTk7rU+/M+lmTYbF2neGEfVGCf5xidVz/Ri2rZ1wauvRa2znvjBf9r6w60GU
        6tSAZZsap9m2b/9uzjVH50kwj9syIameAyvvrNnfFq++hkWlwWj7zXORSizFGYmGWsxFxYkA
        m6aZjZMDAAA=
X-CMS-MailID: 20210331101237eucas1p1ae152c11cd6959fa949a181a84a0a2b1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210330025443eucas1p1e53f4fb8623c3dc2ae8ce514e3009bc5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210330025443eucas1p1e53f4fb8623c3dc2ae8ce514e3009bc5
References: <20210330025345.3980086-1-dianders@chromium.org>
        <CGME20210330025443eucas1p1e53f4fb8623c3dc2ae8ce514e3009bc5@eucas1p1.samsung.com>
        <20210329195255.v2.10.Ida6151df6bfc71df77afee1d72bb7eb0a443f327@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


W dniu 30.03.2021 o 04:53, Douglas Anderson pisze:
> Now that we have the patch ("drm/edid: Use the cached EDID in
> drm_get_edid() if eDP") we no longer need to maintain our own
> cache. Drop this code.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Regards
Andrzej
> ---
>
> (no changes since v1)
>
>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 22 +++++++++-------------
>   1 file changed, 9 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 9577ebd58c4c..c0398daaa4a6 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -121,7 +121,6 @@
>    * @debugfs:      Used for managing our debugfs.
>    * @host_node:    Remote DSI node.
>    * @dsi:          Our MIPI DSI source.
> - * @edid:         Detected EDID of eDP panel.
>    * @refclk:       Our reference clock.
>    * @panel:        Our panel.
>    * @enable_gpio:  The GPIO we toggle to enable the bridge.
> @@ -147,7 +146,6 @@ struct ti_sn_bridge {
>   	struct drm_bridge		bridge;
>   	struct drm_connector		connector;
>   	struct dentry			*debugfs;
> -	struct edid			*edid;
>   	struct device_node		*host_node;
>   	struct mipi_dsi_device		*dsi;
>   	struct clk			*refclk;
> @@ -269,17 +267,17 @@ connector_to_ti_sn_bridge(struct drm_connector *connector)
>   static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
>   {
>   	struct ti_sn_bridge *pdata = connector_to_ti_sn_bridge(connector);
> -	struct edid *edid = pdata->edid;
> -	int num;
> +	struct edid *edid;
> +	int num = 0;
>   
> -	if (!edid) {
> -		pm_runtime_get_sync(pdata->dev);
> -		edid = pdata->edid = drm_get_edid(connector, &pdata->aux.ddc);
> -		pm_runtime_put(pdata->dev);
> -	}
> +	pm_runtime_get_sync(pdata->dev);
> +	edid = drm_get_edid(connector, &pdata->aux.ddc);
> +	pm_runtime_put(pdata->dev);
>   
> -	if (edid && drm_edid_is_valid(edid)) {
> -		num = drm_add_edid_modes(connector, edid);
> +	if (edid) {
> +		if (drm_edid_is_valid(edid))
> +			num = drm_add_edid_modes(connector, edid);
> +		kfree(edid);
>   		if (num)
>   			return num;
>   	}
> @@ -1308,8 +1306,6 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
>   	if (!pdata)
>   		return -EINVAL;
>   
> -	kfree(pdata->edid);
> -
>   	ti_sn_debugfs_remove(pdata);
>   
>   	drm_bridge_remove(&pdata->bridge);
