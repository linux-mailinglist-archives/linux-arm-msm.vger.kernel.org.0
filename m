Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 546C934FD97
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 11:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234825AbhCaJ6m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 05:58:42 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:41142 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234890AbhCaJ6I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 05:58:08 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210331095806euoutp021e2bc8cdab7e6b56eefb43d12b9406d7~xZOeE3jhh2103321033euoutp02J
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 09:58:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210331095806euoutp021e2bc8cdab7e6b56eefb43d12b9406d7~xZOeE3jhh2103321033euoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1617184686;
        bh=SJ8K9FtjJ7RXwx5dC7P6rkLLhFNehLE0d47oQ1bMEEU=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=l3g5K6wDRZLE59OQTWswhLxt2V2jNRF2Bu9W6pmb6XwX1VhnFfQYRc/2A7MrKDfGl
         gs5CxLh/1brRIud4QU4O9AUoFX+5jPYA529APfOzgtIk8WL4GGResqkfQwauMJgDEP
         BkWPthMzi5WTk4YK5C76r2nUaJbRy++kQ8/OCCi0=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210331095806eucas1p27d08b0e29b83f6702629697cbb4e8c48~xZOdyu7uB2620526205eucas1p2O;
        Wed, 31 Mar 2021 09:58:06 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id DC.F3.09444.EA744606; Wed, 31
        Mar 2021 10:58:06 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210331095805eucas1p13f223cf8e3f6edb9a3df0a807952542e~xZOdZL0j10433504335eucas1p1f;
        Wed, 31 Mar 2021 09:58:05 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210331095805eusmtrp13480f17caf3d30d8e66396394d2742b4~xZOdYStoz1997919979eusmtrp1E;
        Wed, 31 Mar 2021 09:58:05 +0000 (GMT)
X-AuditID: cbfec7f4-dd5ff700000024e4-5c-606447ae5f8a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 51.87.08696.DA744606; Wed, 31
        Mar 2021 10:58:05 +0100 (BST)
Received: from localhost (unknown [106.210.131.79]) by eusmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20210331095803eusmtip2643b0a2d8460058c9644fdf0ac9fe8eb~xZOax5KAY1195211952eusmtip22;
        Wed, 31 Mar 2021 09:58:02 +0000 (GMT)
Message-ID: <ee62dae9-b1bd-71ea-31e6-95ce5a528f34@samsung.com>
Date:   Wed, 31 Mar 2021 11:58:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0)
        Gecko/20100101 Thunderbird/88.0
Subject: Re: [PATCH v2 08/14] drm/bridge: ti-sn65dsi86: Remove extra call:
 drm_connector_update_edid_property()
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
In-Reply-To: <20210329195255.v2.8.Ic14a7ab8035df89e19a25ad4fbf2004f9673f167@changeid>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNKsWRmVeSWpSXmKPExsWy7djP87rr3FMSDDa/ErXoPXeSyeL0/ncs
        FmeXHWSzuPL1PZvF1e8vmS1OvrnKYtE5cQm7xcT9Z9ktLu+aw2ZxqC/a4trPx8wWn2Y9ZLZY
        8XMro0V7l43Fz+ttzBbH7zxlchDweH+jld1jdsNFFo/ZHTNZPRbvecnkMWfRDWaPExMuMXnc
        ubaHzWP7twesHve7jzN5LJl2lc3jQO9kFo/Pm+QCeKK4bFJSczLLUov07RK4Ms6fmMpWsI2n
        onfdKrYGxl6uLkZODgkBE4kjx6exdTFycQgJrGCU2PdzAjuE84VRYknHZ6jMZ0aJjl33gRwO
        sJYXD4Qh4ssZJQ4dnMgE4bxglPgw4zk7yFxeATuJx3PPs4DYLAKqEk86TzFCxAUlTs58AhYX
        FUiQWHVjOROILSxQKPH2zGqwGmYBcYmmLytZQYaKCPxjlFg98THYBmaBz0wSn6YcAutgE9CU
        +Lv5JthJnAKhEhO/1kE0y0s0b53NDFIvIXCNU+LyivNsEJ+6SJyZuZURwhaWeHV8CzuELSNx
        enIPC4RdL3F/RQtUcwejxNYNO5khEtYSd879AlvGDLR4/S59SFA4Ssx5bgBh8knceCsIcQKf
        xKRt05khwrwSHW1CEDMUJe6f3Qo1T1xi6YWvbBMYlWYhhcosJN/PQvLMLIS1CxhZVjGKp5YW
        56anFhvlpZbrFSfmFpfmpesl5+duYgSmx9P/jn/Zwbj81Ue9Q4xMHIyHGCU4mJVEeIUPJCYI
        8aYkVlalFuXHF5XmpBYfYpTmYFES503asiZeSCA9sSQ1OzW1ILUIJsvEwSnVwJTnEbSP741y
        6K7P01VfvObJLBLrL3/7+vGraQoBPHZvXrBMlVKck832ZFnHj8z4Bl/uxjM//B/2eC1SUr7w
        /SsX2/GMXUyXHQ2/qJ60NyyetanimMhSjfNmhW3uYkn8MWZrl4bFJr74E9f3g+FBy29Hi0mb
        9T+ti1jmvW532VsDt3Xfpq1icMo89ODZ6wym3Cmbomp/3ald/Vg782HpIxe31dLfXc+veyxZ
        Uq1QeO/67KMTHv6Q+G5lPNmYi+lFlJmZ8tqUvISUM8/vHjwizj/76qNfwcw15icS3Vu5S20S
        Ii8cjFGe98WQpT2t32EZC4Py+hc/tthejju0yPXx7uXzukyCQ26b/VJ/cG1bfqoSS3FGoqEW
        c1FxIgBuZtGP/gMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHIsWRmVeSWpSXmKPExsVy+t/xe7pr3VMSDLomWlr0njvJZHF6/zsW
        i7PLDrJZXPn6ns3i6veXzBYn31xlseicuITdYuL+s+wWl3fNYbM41Bdtce3nY2aLT7MeMlus
        +LmV0aK9y8bi5/U2Zovjd54yOQh4vL/Ryu4xu+Eii8fsjpmsHov3vGTymLPoBrPHiQmXmDzu
        XNvD5rH92wNWj/vdx5k8lky7yuZxoHcyi8fnTXIBPFF6NkX5pSWpChn5xSW2StGGFkZ6hpYW
        ekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GedPTGUr2MZT0btuFVsDYy9XFyMHh4SAicSL
        B8JdjFwcQgJLGSVWnd3P0sXICRQXl9g9/y0zhC0s8edaFxtE0TNGiYaGD+wgCV4BO4nHc8+D
        NbAIqEo86TzFCBEXlDg58wlYXFQgQeLsh3lMILawQKHE2zOrwWqYgRY0fVnJCjJURKCBSeLS
        3cVMIA6zwFcmiZZXS8E2CAncZpTofZIPYrMJaEr83XyTDeRsToFQiYlf6yAGmUl0be2CGiov
        0bx1NvMERqFZSO6YhWTfLCQts5C0LGBkWcUoklpanJueW2ykV5yYW1yal66XnJ+7iRGYELYd
        +7llB+PKVx/1DjEycTAeYpTgYFYS4RU+kJggxJuSWFmVWpQfX1Sak1p8iNEUGBgTmaVEk/OB
        KSmvJN7QzMDU0MTM0sDU0sxYSZzX5MiaeCGB9MSS1OzU1ILUIpg+Jg5OqQamee/zZu9f+WPG
        ROblKidDWe6URM6YvEn2kdcav7UFf7Sdp35VmhMz/RHL9evPohkz+F/2GAR/Tz/6U6LONjn7
        0brSmdvvrHbt1I/M4ElytD2czDRhVdpxnpk/ZgBD7f+5X1LeN3ZuqzOcZzFpezan6ur1B/7E
        +Yh3KnPJtB1d7CbD0JkY5Pdxm4352oN7nsR/zwq5++Jt8662T/achUunTwhjz130YIvXcsll
        L92vNvmxTBNSf9kf1NuYLJWV5n7maPJHhh/eTI59EadYbWbOizqRK85o4NGVaV5WIB5cnTCh
        RO37txen+B5mfrnEXVa9984rDgMp2TU7hLsrUiP1LmlaefyV2rze3eEn+zIlluKMREMt5qLi
        RADz3W/SkQMAAA==
X-CMS-MailID: 20210331095805eucas1p13f223cf8e3f6edb9a3df0a807952542e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210330025430eucas1p1a1405009766f65466cb0a2dd6f08ec3e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210330025430eucas1p1a1405009766f65466cb0a2dd6f08ec3e
References: <20210330025345.3980086-1-dianders@chromium.org>
        <CGME20210330025430eucas1p1a1405009766f65466cb0a2dd6f08ec3e@eucas1p1.samsung.com>
        <20210329195255.v2.8.Ic14a7ab8035df89e19a25ad4fbf2004f9673f167@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


W dniu 30.03.2021 o 04:53, Douglas Anderson pisze:
> As of commit 5186421cbfe2 ("drm: Introduce epoch counter to
> drm_connector") the drm_get_edid() function calls
> drm_connector_update_edid_property() for us. There's no reason for us
> to call it again.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Regards
Andrzej
> ---
>
> (no changes since v1)
>
>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index a0a00dd1187c..9577ebd58c4c 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -270,7 +270,7 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
>   {
>   	struct ti_sn_bridge *pdata = connector_to_ti_sn_bridge(connector);
>   	struct edid *edid = pdata->edid;
> -	int num, ret;
> +	int num;
>   
>   	if (!edid) {
>   		pm_runtime_get_sync(pdata->dev);
> @@ -279,12 +279,9 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
>   	}
>   
>   	if (edid && drm_edid_is_valid(edid)) {
> -		ret = drm_connector_update_edid_property(connector, edid);
> -		if (!ret) {
> -			num = drm_add_edid_modes(connector, edid);
> -			if (num)
> -				return num;
> -		}
> +		num = drm_add_edid_modes(connector, edid);
> +		if (num)
> +			return num;
>   	}
>   
>   	return drm_panel_get_modes(pdata->panel, connector);
