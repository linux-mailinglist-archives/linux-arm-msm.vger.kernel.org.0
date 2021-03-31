Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5578734FC36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 11:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234375AbhCaJJd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 05:09:33 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:55053 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234231AbhCaJJ1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 05:09:27 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210331090925euoutp0194965e2b023be6c7ecd82407567b825b~xYj94HITY1869018690euoutp01D
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 09:09:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210331090925euoutp0194965e2b023be6c7ecd82407567b825b~xYj94HITY1869018690euoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1617181765;
        bh=6dZgJ7+u2oNHcSEqdGB5HmhKWoHD6aPUWlKb9K/uY5U=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=pzv6QGI01PT8D5FTnWIMORywVGNptAx/h/Ew3EGoAU8OiPDylsJF6QU9uQoAmCgwZ
         CN5jb1XnhTvc/NCMvyMSLuDfEtJVh35Fe/Qu8GwNZG0cPNwFQSQow4vuDk1ZH5KGXK
         ExN2KMIq3DoCpYhFA8yXVZBtAYwJgCZ5g6dDiUn0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210331090925eucas1p2bda3e34916b7508729c2a9e4803c9240~xYj9VWhyZ0330803308eucas1p2x;
        Wed, 31 Mar 2021 09:09:25 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id AB.EA.09439.54C34606; Wed, 31
        Mar 2021 10:09:25 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210331090924eucas1p2dc32b8a29be69272125bb0c16d64f865~xYj8zCGQ80378603786eucas1p2k;
        Wed, 31 Mar 2021 09:09:24 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210331090924eusmtrp13f37a641a4fb089b626a5d0483cc7891~xYj8yEwgP2592125921eusmtrp1S;
        Wed, 31 Mar 2021 09:09:24 +0000 (GMT)
X-AuditID: cbfec7f5-c03ff700000024df-e8-60643c457ae8
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id C8.ED.08705.44C34606; Wed, 31
        Mar 2021 10:09:24 +0100 (BST)
Received: from localhost (unknown [106.210.131.79]) by eusmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20210331090921eusmtip11f3d876c79f7500ba5e10fdb94d4188f~xYj55otVO1707417074eusmtip1P;
        Wed, 31 Mar 2021 09:09:21 +0000 (GMT)
Message-ID: <083f59ab-b67e-f574-12e7-5ef42f443e4e@samsung.com>
Date:   Wed, 31 Mar 2021 11:09:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0)
        Gecko/20100101 Thunderbird/88.0
Subject: Re: [PATCH v2 02/14] drm/bridge: ti-sn65dsi86: Simplify refclk
 handling
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
In-Reply-To: <20210329195255.v2.2.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLKsWRmVeSWpSXmKPExsWy7djPc7quNikJBt/28Fn0njvJZHF6/zsW
        i7PLDrJZXPn6ns3i6veXzBYn31xlseicuITdYuL+s+wWl3fNYbM41Bdtce3nY2aLT7MeMlus
        +LmV0aK9y8bi5/U2Zovjd54yOQh4vL/Ryu4xu+Eii8fsjpmsHov3vGTymLPoBrPHiQmXmDzu
        XNvD5rH92wNWj/vdx5k8lky7yuZxoHcyi8fnTXIBPFFcNimpOZllqUX6dglcGT/m9jMV7OGt
        WHz6L3MD42zuLkZODgkBE4ltizcxdjFycQgJrGCUeHqtjQ3C+cIosb6llRXC+cwosbFvNRtM
        S/OMd1BVyxklFtxazAThvGCUmHN1F1gVr4CdxJ/vS5i7GDk4WARUJe4eKYAIC0qcnPmEBcQW
        FUiQWHVjOROILSwQJDHxzBVWEJtZQFyi6ctKsM0iAv8YJVZPfAy2gFngM5PEpymHwDrYBDQl
        /m6+CbaMUyBU4vqtJSwQ3fISzVtnM4M0SAjc4pT4/uE3K8TdLhIXJ15ghrCFJV4d38IOYctI
        nJ7cwwJh10vcX9EC1dzBKLF1w06oBmuJO+d+sYG8wwy0ef0ufYiwo0T7hTZWkLCEAJ/EjbeC
        EDfwSUzaNp0ZIswr0dEmBFGtKHH/7FaogeISSy98ZZvAqDQLKVxmIfl/FpJvZiHsXcDIsopR
        PLW0ODc9tdg4L7Vcrzgxt7g0L10vOT93EyMwRZ7+d/zrDsYVrz7qHWJk4mA8xCjBwawkwit8
        IDFBiDclsbIqtSg/vqg0J7X4EKM0B4uSOO+urWvihQTSE0tSs1NTC1KLYLJMHJxSDUxlIXFl
        Kbrz41jmtkyfHL+UkVEh9OmnumsNuo2bNv9ruxNREjH5w5v5UR1OZf4eBa8TXNI/Tn+kt/jg
        HQkfXtF50sWz/yxq+F7560OoK6/Gu+ldV6wib65Yv11nVqF6prrWBXedJUXPbhX6Vc19nb3/
        zgJ5l27Gc01zNlwQ+za1Zz3ro/OBMx/+kJ3sq3JRQ/F7o/XWwu6q1F72Aun9N1xvMDX2XTzr
        zlvTVnnK8nFbEodmRvzHZ49u+13f5LbYY67PovhfTsfOrpTuP/V5hu1h15Nz69duULVf8F+3
        JzYwgPUqW9kfocVSm+RyIrze/iviZ2IQsdkrZhntlNazvlFH3nBD4gGznxPcJWq3/1ZiKc5I
        NNRiLipOBADwpogEAAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPIsWRmVeSWpSXmKPExsVy+t/xu7ouNikJBvuOalr0njvJZHF6/zsW
        i7PLDrJZXPn6ns3i6veXzBYn31xlseicuITdYuL+s+wWl3fNYbM41Bdtce3nY2aLT7MeMlus
        +LmV0aK9y8bi5/U2Zovjd54yOQh4vL/Ryu4xu+Eii8fsjpmsHov3vGTymLPoBrPHiQmXmDzu
        XNvD5rH92wNWj/vdx5k8lky7yuZxoHcyi8fnTXIBPFF6NkX5pSWpChn5xSW2StGGFkZ6hpYW
        ekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GT/m9jMV7OGtWHz6L3MD42zuLkZODgkBE4nm
        Ge/Yuhi5OIQEljJKXLm2ix0iIS6xe/5bZghbWOLPtS6oomeMEtPaX7CBJHgF7CT+fF8CVMTB
        wSKgKnH3SAFEWFDi5MwnLCC2qECCxNkP85hAbGGBIImJZ66wgtjMQPObvqxkBZkpItDAJHHp
        7mImEIdZ4CuTRMurpWBXCAncZpTY3K4EYrMJaEr83XwTbDGnQKjE9VtLWCAmmUl0be1ihLDl
        JZq3zmaewCg0C8khs5AsnIWkZRaSlgWMLKsYRVJLi3PTc4sN9YoTc4tL89L1kvNzNzECU8K2
        Yz8372Cc9+qj3iFGJg7GQ4wSHMxKIrzCBxIThHhTEiurUovy44tKc1KLDzGaAgNjIrOUaHI+
        MCnllcQbmhmYGpqYWRqYWpoZK4nzbp27Jl5IID2xJDU7NbUgtQimj4mDU6qBKW4/0+WHZTdv
        z58tOfnek51vlv2esfV54ryzqXe6e+5seTA1/Cnn4U07fKvkt+i/2spiea0+aNnBL2nb1k+V
        1f6RuClWw8tmoiKXY4eGx8Em6fzm5vtPXt0vcc/pV7uyp/zu4sj5f3ntr64OfJF9bf6M5+K/
        zHflHHskInGN72yKjvGCdr3bF2zD1jBMm/3Mz3zqvD2LGMs3qi3WFZ3w/+bfJxdfp+znMhC8
        mt0g8nFm/2fN+Iifqxbx9FTkrfl4NyHxmVOK7JFeN6tE7SkXJoZ8/fjoh497U0/PrPVZzzv8
        Tay/rT36dYPg8ZyLzyclt1xfXzFZ/c+Fb/cPrfBMaph18NI33aMmMwrMqve2OT3aq8RSnJFo
        qMVcVJwIAMtR7l2SAwAA
X-CMS-MailID: 20210331090924eucas1p2dc32b8a29be69272125bb0c16d64f865
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210330025415eucas1p1352aa392523853fe5207481597f3c32e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210330025415eucas1p1352aa392523853fe5207481597f3c32e
References: <20210330025345.3980086-1-dianders@chromium.org>
        <CGME20210330025415eucas1p1352aa392523853fe5207481597f3c32e@eucas1p1.samsung.com>
        <20210329195255.v2.2.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


W dniu 30.03.2021 o 04:53, Douglas Anderson pisze:
> The clock framework makes it simple to deal with an optional clock.
> You can call clk_get_optional() and if the clock isn't specified it'll
> just return NULL without complaint. It's valid to pass NULL to
> enable/disable/prepare/unprepare. Let's make use of this to simplify
> things a tiny bit.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Regards
Andrzej
> ---
>
> Changes in v2:
> - Removed 2nd paragraph in commit message.
>
>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 88df4dd0f39d..96fe8f2c0ea9 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1275,14 +1275,9 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
>   		return ret;
>   	}
>   
> -	pdata->refclk = devm_clk_get(pdata->dev, "refclk");
> -	if (IS_ERR(pdata->refclk)) {
> -		ret = PTR_ERR(pdata->refclk);
> -		if (ret == -EPROBE_DEFER)
> -			return ret;
> -		DRM_DEBUG_KMS("refclk not found\n");
> -		pdata->refclk = NULL;
> -	}
> +	pdata->refclk = devm_clk_get_optional(pdata->dev, "refclk");
> +	if (IS_ERR(pdata->refclk))
> +		return PTR_ERR(pdata->refclk);
>   
>   	ret = ti_sn_bridge_parse_dsi_host(pdata);
>   	if (ret)
