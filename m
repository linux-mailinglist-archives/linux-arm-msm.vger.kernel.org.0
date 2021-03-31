Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F7DD34FD87
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 11:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234831AbhCaJz6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 05:55:58 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:37258 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234825AbhCaJzl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 05:55:41 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210331095539euoutp0186baae5f998c59c881bfcec2a5779f46~xZMVacLSZ0331903319euoutp01B
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 09:55:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210331095539euoutp0186baae5f998c59c881bfcec2a5779f46~xZMVacLSZ0331903319euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1617184540;
        bh=gMJiOGrhF20BZsQobIHMer5qNyPyBLX7IwREEKYEdSE=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=D0mEM8Suo2myVpBQNoK/SFmgpg5dXLmlcNPdSOSbTUtN9XN+HejF+iSR0fZ9FJ/cD
         bHH5oie3CH1RB1kpMtobheqjBhE1kWbmMzbgGiLUzBjzhZH9O0/rt1eX5mDHapFM+l
         7DU4Woxj30fHBw4nq9oyPNbZU3R0TCHshnYiU/qU=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210331095539eucas1p26de1039b3796b58b6c3a2bfae6c25e52~xZMVIXH341615516155eucas1p2A;
        Wed, 31 Mar 2021 09:55:39 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 63.C3.09439.B1744606; Wed, 31
        Mar 2021 10:55:39 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210331095539eucas1p298f10946de0d7fdfc7234d8694179327~xZMUmeuDU2419424194eucas1p2v;
        Wed, 31 Mar 2021 09:55:39 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210331095539eusmtrp16a7b7f506baf9522098fb70bca5bb285~xZMUlgkjD1808918089eusmtrp1h;
        Wed, 31 Mar 2021 09:55:39 +0000 (GMT)
X-AuditID: cbfec7f5-c1bff700000024df-d3-6064471be993
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 6B.07.08696.A1744606; Wed, 31
        Mar 2021 10:55:38 +0100 (BST)
Received: from localhost (unknown [106.210.131.79]) by eusmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20210331095535eusmtip135b3ced999d488f1f23ad7ed22a68cb2~xZMRsUTmf0245102451eusmtip1z;
        Wed, 31 Mar 2021 09:55:35 +0000 (GMT)
Message-ID: <c88a04f2-5968-dd3f-562d-ddf67cb983db@samsung.com>
Date:   Wed, 31 Mar 2021 11:55:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0)
        Gecko/20100101 Thunderbird/88.0
Subject: Re: [PATCH v2 07/14] drm/bridge: ti-sn65dsi86: Get rid of the
 useless detect() function
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
In-Reply-To: <20210329195255.v2.7.I826adf4faeb7f39f560b387f6b380e639c6986c8@changeid>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJKsWRmVeSWpSXmKPExsWy7djP87rS7ikJButeKVj0njvJZHF6/zsW
        i7PLDrJZXPn6ns3i6veXzBYn31xlseicuITdYuL+s+wWl3fNYbM41Bdtce3nY2aLT7MeMlus
        +LmV0aK9y8bi5/U2Zovjd54yOQh4vL/Ryu4xu+Eii8fsjpmsHov3vGTymLPoBrPHiQmXmDzu
        XNvD5rH92wNWj/vdx5k8lky7yuZxoHcyi8fnTXIBPFFcNimpOZllqUX6dglcGUsvf2Qp2MpT
        MaH1H3MD4yauLkZODgkBE4nl39+wdzFycQgJrGCUeL6xkRHC+cIosev4MVYI5zOjxOfb/9lg
        Wtr2nmQGsYUEljNKnL3MBFH0glFi7ftdQEUcHLwCdhJ7H7qBmCwCqhIPTnCAlPMKCEqcnPmE
        BcQWFUiQWHVjORNIibBAksTN3cIgYWYBcYmmLyvB1ooI/GOUWD3xMdh4ZoHPTBKfphxiAqli
        E9CU+Lv5Jtg9nAKhEmsfL2OD6JaXaN46mxnizlucEkve80PYLhKrlh9lhbCFJV4d38IOYctI
        nJ7cwwJh10vcX9HCDLJMQqCDUWLrhp1Qg6wl7pz7BfYXM9Di9bv0IcKOEjcvTWUECUsI8Enc
        eCsIcQKfxKRt05khwrwSHW1CENWKEvfPboUaKC6x9MJXtgmMSrOQQmUWkvdnIXlmFsLeBYws
        qxjFU0uLc9NTi43zUsv1ihNzi0vz0vWS83M3MQJT4+l/x7/uYFzx6qPeIUYmDsZDjBIczEoi
        vMIHEhOEeFMSK6tSi/Lji0pzUosPMUpzsCiJ8+7auiZeSCA9sSQ1OzW1ILUIJsvEwSnVwKQ0
        aULG/SW1emuWZU2ctVpsXuJSq70L7vy5KSaddu5yWbdvKvOdTZVPSmdM38qy9lFBa01pduM+
        q+0cZ9bbTbG8bH1v/gvvaQ8id2k+PP278MQnlVveyi8LzaZv5Zm3/kj5k3W2Vz6x3m6Zecpr
        g2XZX/m5G5fsNpJ+v2BZeniRDYvw+rSzUXnHHaZaea0WD+t2kDkmuuu0h5CKzunLRyq67Fk2
        SztWOTh9uxSmdftbkMoCBY8fdmcc3PzOmAieXZrROfkhj82v/fOSw6acZyld1ZgxrbD8df+i
        v+8NxTjFLma/Pixw6sTchvX7WQ7+vVzH6vZqT37BhisXhV6ln9xYsG3hhWtnE/a2tc2Vn7Hy
        jBJLcUaioRZzUXEiAFy1i638AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHIsWRmVeSWpSXmKPExsVy+t/xu7pS7ikJBtsOWlv0njvJZHF6/zsW
        i7PLDrJZXPn6ns3i6veXzBYn31xlseicuITdYuL+s+wWl3fNYbM41Bdtce3nY2aLT7MeMlus
        +LmV0aK9y8bi5/U2Zovjd54yOQh4vL/Ryu4xu+Eii8fsjpmsHov3vGTymLPoBrPHiQmXmDzu
        XNvD5rH92wNWj/vdx5k8lky7yuZxoHcyi8fnTXIBPFF6NkX5pSWpChn5xSW2StGGFkZ6hpYW
        ekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GUsvf2Qp2MpTMaH1H3MD4yauLkZODgkBE4m2
        vSeZuxi5OIQEljJK3FhwkBUiIS6xe/5bZghbWOLPtS42iKJnjBIzexaydDFycPAK2EnsfegG
        YrIIqEo8OMEBUs4rIChxcuYTFhBbVCBB4uyHeUwgtrBAksTOB+2MIDYz0PimLytZQUaKCDQw
        SVy6u5gJxGEW+Mok0fJqKTtIlZDAbUaJyd9rQWw2AU2Jv5tvsoHYnAKhEmsfL2ODmGQm0bW1
        C2qqvETz1tnMExiFZiE5ZBaShbOQtMxC0rKAkWUVo0hqaXFuem6xkV5xYm5xaV66XnJ+7iZG
        YELYduznlh2MK1991DvEyMTBeIhRgoNZSYRX+EBighBvSmJlVWpRfnxRaU5q8SFGU2BgTGSW
        Ek3OB6akvJJ4QzMDU0MTM0sDU0szYyVxXpMja+KFBNITS1KzU1MLUotg+pg4OKUamFINha07
        DU6UT/594BHzcj+Gl0m1mzbrNRj8ZVNb9HWrWsB6GcsJ5ufLVjkz1U1kMFr9qLVWf/8ztxXe
        rLI7/fwdn1wRtv1TKBX+jGtx1QbGF7xXj7WuU5oqox+84PPso5/P35G2K/gZvVs+/OqqGRHs
        /TOmv/uYZFrUvylUbprrnTOaPy98cDtXcmP6P6UZIalXi7ZYhP35P5dZIJd5H5uxcm3mtGPH
        NWtnK1/Q+C1wvtjxgS/3ja7Dd8uezN2wIa9YmCEtM41JOKWp0ZWfJ0GjoO2qSW5OMtvP4vRk
        wQ1rXT7ynPt49da3mA31raefMggWREwR/n7ZJCPXLK5tdrnIjcKiB8s9tj2vOO+xUomlOCPR
        UIu5qDgRAGNyjryRAwAA
X-CMS-MailID: 20210331095539eucas1p298f10946de0d7fdfc7234d8694179327
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210330025424eucas1p2f0a5f19db47a75c27d65f07cb4bfcd4d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210330025424eucas1p2f0a5f19db47a75c27d65f07cb4bfcd4d
References: <20210330025345.3980086-1-dianders@chromium.org>
        <CGME20210330025424eucas1p2f0a5f19db47a75c27d65f07cb4bfcd4d@eucas1p2.samsung.com>
        <20210329195255.v2.7.I826adf4faeb7f39f560b387f6b380e639c6986c8@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


W dniu 30.03.2021 o 04:53, Douglas Anderson pisze:
> If we just leave the detect() function as NULL then the upper layers
> assume we're always connected. There's no reason for a stub.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Regards
Andrzej
> ---
>
> (no changes since v1)
>
>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 12 ------------
>   1 file changed, 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 50a52af8e39f..a0a00dd1187c 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -306,20 +306,8 @@ static struct drm_connector_helper_funcs ti_sn_bridge_connector_helper_funcs = {
>   	.mode_valid = ti_sn_bridge_connector_mode_valid,
>   };
>   
> -static enum drm_connector_status
> -ti_sn_bridge_connector_detect(struct drm_connector *connector, bool force)
> -{
> -	/**
> -	 * TODO: Currently if drm_panel is present, then always
> -	 * return the status as connected. Need to add support to detect
> -	 * device state for hot pluggable scenarios.
> -	 */
> -	return connector_status_connected;
> -}
> -
>   static const struct drm_connector_funcs ti_sn_bridge_connector_funcs = {
>   	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.detect = ti_sn_bridge_connector_detect,
>   	.destroy = drm_connector_cleanup,
>   	.reset = drm_atomic_helper_connector_reset,
>   	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
