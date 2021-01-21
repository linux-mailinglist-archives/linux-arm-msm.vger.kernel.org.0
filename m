Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EBB12FE929
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 12:48:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730453AbhAULqu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 06:46:50 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:49356 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730569AbhAULqi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 06:46:38 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210121114549euoutp011ac41655ca9c217f12d0b96c47659f0c~cPL0P27TR2046220462euoutp01K
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 11:45:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210121114549euoutp011ac41655ca9c217f12d0b96c47659f0c~cPL0P27TR2046220462euoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1611229549;
        bh=rzdza/FjHCO9NZrgNZRIOCiNRiWQZdZ4U2G3OP6BfvI=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=QBnbV9WNoJCD7TRtxNe0RKXrR0CAtXw2ZOjzpJH/74hPVqMwxLC6MHfLLYaZZR8oH
         SSGKo64K0VrXBVllkcCObfy64X/yqKqJVPvTzu9cAy03llgxDV7/jGNbyKiWdwEouH
         FoCsdAiP2U9ZOjzcdslvNFot+z99ut6HQONNSOZ0=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210121114549eucas1p288891be8d1439ed02ae1941b4929222c~cPLz49IrN2935329353eucas1p2Z;
        Thu, 21 Jan 2021 11:45:49 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 17.6E.27958.C6969006; Thu, 21
        Jan 2021 11:45:48 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210121114548eucas1p1961d8b27a69fc8f98abf4bedf6b01776~cPLzagvKq2889228892eucas1p1X;
        Thu, 21 Jan 2021 11:45:48 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210121114548eusmtrp2a3c3c249d25a3516d1bd7e1868a906d0~cPLzZtchl1162711627eusmtrp2f;
        Thu, 21 Jan 2021 11:45:48 +0000 (GMT)
X-AuditID: cbfec7f2-efdff70000006d36-b8-6009696c7c59
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 44.C1.16282.C6969006; Thu, 21
        Jan 2021 11:45:48 +0000 (GMT)
Received: from [106.210.131.79] (unknown [106.210.131.79]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210121114547eusmtip25abd96eabb7297c9a224339c833de453~cPLyt4cF32573325733eusmtip2C;
        Thu, 21 Jan 2021 11:45:47 +0000 (GMT)
Subject: Re: [PATCH v3 3/3] drm/bridge/lontium-lt9611uxc: move HPD
 notification out of IRQ handler
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc:     Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        David Airlie <airlied@linux.ie>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <c2015bbd-0f75-69b7-6d7c-f87a68ae1e70@samsung.com>
Date:   Thu, 21 Jan 2021 12:45:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0)
        Gecko/20100101 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <20210117002355.435860-4-dmitry.baryshkov@linaro.org>
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAKsWRmVeSWpSXmKPExsWy7djP87o5mZwJBit+mVn0njvJZHF6/zsW
        i4nnf7JZXPn6ns3i6veXzBYn31xlseicuITdYuL+s+wWd1s6WS0O9UVbrPi5ldFi550TzA48
        Hu9vtLJ7zO6YyeqxaVUnm8eJCZeYPO5c28Pmsf3bA1aP+93HmTyWTLvK5nGgdzKLx+dNcgFc
        UVw2Kak5mWWpRfp2CVwZi1p+MBXsVq2403+FqYGxWa6LkZNDQsBEYkrbWfYuRi4OIYEVjBLn
        Zv1ihnC+MEpM+/UXKvOZUeLg43vsMC37fvcyQSSWM0rs3X4Lquo9o8SqC3cZQaqEBVIkTv7/
        D2aLCJRI9D1tZQUpYhZoYJb40ryUGSTBJqAp8XfzTTYQm1fATmLSrodgDSwCqhItF7aygtii
        AgkSe9+dY4GoEZQ4OfMJmM0p4CSx9PtjsJOYBeQlmrfOZoawxSWavqwEWyYhsJxT4vPkfcwQ
        d7tI3Gw+xAphC0u8Or4F6h8Zif875zNB2PUS91e0MEM0dzBKbN2wE6rZWuLOuV9Al3IAbdCU
        WL9LHyLsKLHl3GlWkLCEAJ/EjbeCEDfwSUzaNp0ZIswr0dEmBFGtKHH/7FaogeISSy98ZZvA
        qDQLyWezkHwzC8k3sxD2LmBkWcUonlpanJueWmyYl1quV5yYW1yal66XnJ+7iRGY6E7/O/5p
        B+PcVx/1DjEycTAeYpTgYFYS4X1kyZEgxJuSWFmVWpQfX1Sak1p8iFGag0VJnHfV7DXxQgLp
        iSWp2ampBalFMFkmDk6pBiab0Mf7Jwu1braPPMSX1ZZ83UKNhbesunQLg0Jr5cFde+SnukWv
        u8s7yf/VnYdzuq9M0Lv37ADXX68LK8sc7hQopB2Ln3nN9lnK3PzjfLfY41jbNpnen5bJeP7j
        0VsF1Ydz5fK7ZddsP7D4gMWn9R87eh0ylL6pW6cdc3p0a55A5qRDpn3N5bFPRY5wyjKqpRm/
        SX7/quqXd/5+tWsP5Tu4Hs5OOB/88cLGJW59E1rihPjO7TF/51yb+HiXXXB503b2KxNXzDu3
        6/gbTYfb/9x+NR0p5upQC9mw8vy75ilfL73239xnVd4u8vhSqMS3qWcypzbkVG69qsJ5L/7Z
        8+qTCju7JkZMuzbnzK3Y60t+K7EUZyQaajEXFScCALMjQ8TjAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRmVeSWpSXmKPExsVy+t/xe7o5mZwJBn+Oi1r0njvJZHF6/zsW
        i4nnf7JZXPn6ns3i6veXzBYn31xlseicuITdYuL+s+wWd1s6WS0O9UVbrPi5ldFi550TzA48
        Hu9vtLJ7zO6YyeqxaVUnm8eJCZeYPO5c28Pmsf3bA1aP+93HmTyWTLvK5nGgdzKLx+dNcgFc
        UXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZi1p+
        MBXsVq2403+FqYGxWa6LkZNDQsBEYt/vXqYuRi4OIYGljEDOB3aIhLjE7vlvmSFsYYk/17rY
        IIreMkrc+9wLViQskCJx8v9/RhBbRKBEYtKPVnaQImaBJmaJD0dvMYEkhATOMkpcemUDYrMJ
        aEr83XyTDcTmFbCTmLTrIVgzi4CqRMuFrawgtqhAgsT2/SuZIGoEJU7OfMICYnMKOEks/f4Y
        bDGzgJlE19YuRghbXqJ562xmCFtcounLStYJjEKzkLTPQtIyC0nLLCQtCxhZVjGKpJYW56bn
        FhvpFSfmFpfmpesl5+duYgRG9rZjP7fsYFz56qPeIUYmDsZDjBIczEoivI8sORKEeFMSK6tS
        i/Lji0pzUosPMZoC/TORWUo0OR+YWvJK4g3NDEwNTcwsDUwtzYyVxHlNjqyJFxJITyxJzU5N
        LUgtgulj4uCUamDib2o951+7b0LfwWDtaN004cMG/E5nDmv/4YzdLbjOruvWz2vmHFI/WC58
        MP67+lnyz3VBb7SiT8hn/BFVDrr3zn3XvBVnGc+uq9h1XLhWyXRmr9+e/zbWvZyS4gdq7s7/
        vLf+7d4jRR8O/d/3xS/zaadfwKrn818qHp5+d5rGff6HKlXqd/lnrGteubNl4s4Dr+M/uiiu
        np17wWxxRoO8UVLX+rW5NzcnuK0/VqktvZLtTlCfVWbCu8vXlsoqyIh3q544HV0nenxf/PeK
        ypimDUq9fJGGGSfWPGz49jNJrDFO9ZU/e+MrI/vUk5M0Ei9al/Wa1hWoBdz4WFR0btfCp0I3
        bv1YcOvZxENvp95rV2Ipzkg01GIuKk4EAOmzSld1AwAA
X-CMS-MailID: 20210121114548eucas1p1961d8b27a69fc8f98abf4bedf6b01776
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210118082540eucas1p2d774058f3c0b89819edc5e1fb61b7ce2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210118082540eucas1p2d774058f3c0b89819edc5e1fb61b7ce2
References: <20210117002355.435860-1-dmitry.baryshkov@linaro.org>
        <CGME20210118082540eucas1p2d774058f3c0b89819edc5e1fb61b7ce2@eucas1p2.samsung.com>
        <20210117002355.435860-4-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

W dniu 17.01.2021 o 01:23, Dmitry Baryshkov pisze:
> drm hotplug handling code (drm_client_dev_hotplug()) can wait on mutex,
> thus delaying further lt9611uxc IRQ events processing.  It was observed
> occasionally during bootups, when drm_client_modeset_probe() was waiting
> for EDID ready event, which was delayed because IRQ handler was stuck
> trying to deliver hotplug event.
> Move hotplug notifications from IRQ handler to separate work to be able
> to process IRQ events without delays.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: 0cbbd5b1a012 ("drm: bridge: add support for lontium LT9611UXC bridge")
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 30 +++++++++++++++++-----
>   1 file changed, 24 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index b708700e182d..209e39923914 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -14,6 +14,7 @@
>   #include <linux/regmap.h>
>   #include <linux/regulator/consumer.h>
>   #include <linux/wait.h>
> +#include <linux/workqueue.h>
>   
>   #include <sound/hdmi-codec.h>
>   
> @@ -36,6 +37,7 @@ struct lt9611uxc {
>   	struct mutex ocm_lock;
>   
>   	struct wait_queue_head wq;
> +	struct work_struct work;
>   
>   	struct device_node *dsi0_node;
>   	struct device_node *dsi1_node;
> @@ -52,6 +54,7 @@ struct lt9611uxc {
>   
>   	bool hpd_supported;
>   	bool edid_read;
> +	bool hdmi_connected;
>   	uint8_t fw_version;
>   };
>   
> @@ -151,15 +154,26 @@ static irqreturn_t lt9611uxc_irq_thread_handler(int irq, void *dev_id)
>   	}
>   
>   	if (irq_status & BIT(1)) {
> -		if (lt9611uxc->connector.dev)
> -			drm_kms_helper_hotplug_event(lt9611uxc->connector.dev);
> -		else
> -			drm_bridge_hpd_notify(&lt9611uxc->bridge, !!(hpd_status & BIT(1)));
> +		lt9611uxc->hdmi_connected = !!(hpd_status & BIT(1));

No need for !!, int->bool implicit conversion will do the thing.

> +		schedule_work(&lt9611uxc->work);
>   	}
>   
>   	return IRQ_HANDLED;
>   }
>   
> +static void lt9611uxc_hpd_work(struct work_struct *work)
> +{
> +	struct lt9611uxc *lt9611uxc = container_of(work, struct lt9611uxc, work);
> +
> +	if (lt9611uxc->connector.dev)
> +		drm_kms_helper_hotplug_event(lt9611uxc->connector.dev);
> +	else
> +		drm_bridge_hpd_notify(&lt9611uxc->bridge,
> +				      lt9611uxc->hdmi_connected ?
> +				      connector_status_connected :
> +				      connector_status_disconnected);


I am little bit worried about accessing lt9611uxc->hdmi_connected - it 
is set in different thread, and there is no explicit sync code between 
them. I guess it is possible to loss proper HPD signal, especially if 
the HPD line is unstable (is there signal debouncing?).


> +}
> +
>   static void lt9611uxc_reset(struct lt9611uxc *lt9611uxc)
>   {
>   	gpiod_set_value_cansleep(lt9611uxc->reset_gpio, 1);
> @@ -447,7 +461,7 @@ static enum drm_connector_status lt9611uxc_bridge_detect(struct drm_bridge *brid
>   	struct lt9611uxc *lt9611uxc = bridge_to_lt9611uxc(bridge);
>   	unsigned int reg_val = 0;
>   	int ret;
> -	int connected = 1;
> +	bool connected = true;
>   
>   	if (lt9611uxc->hpd_supported) {
>   		lt9611uxc_lock(lt9611uxc);
> @@ -457,8 +471,9 @@ static enum drm_connector_status lt9611uxc_bridge_detect(struct drm_bridge *brid
>   		if (ret)
>   			dev_err(lt9611uxc->dev, "failed to read hpd status: %d\n", ret);
>   		else
> -			connected  = reg_val & BIT(1);
> +			connected  = !!(reg_val & BIT(1));


Again no no need for !!.

I saw in v2 there was R-B tags added by Bjorn to other two patches, 
please do not forgot them next time.


Regards

Andrzej


>   	}
> +	lt9611uxc->hdmi_connected = connected;
>   
>   	return connected ?  connector_status_connected :
>   				connector_status_disconnected;
> @@ -931,6 +946,8 @@ static int lt9611uxc_probe(struct i2c_client *client,
>   	lt9611uxc->fw_version = ret;
>   
>   	init_waitqueue_head(&lt9611uxc->wq);
> +	INIT_WORK(&lt9611uxc->work, lt9611uxc_hpd_work);
> +
>   	ret = devm_request_threaded_irq(dev, client->irq, NULL,
>   					lt9611uxc_irq_thread_handler,
>   					IRQF_ONESHOT, "lt9611uxc", lt9611uxc);
> @@ -967,6 +984,7 @@ static int lt9611uxc_remove(struct i2c_client *client)
>   	struct lt9611uxc *lt9611uxc = i2c_get_clientdata(client);
>   
>   	disable_irq(client->irq);
> +	flush_scheduled_work();
>   	lt9611uxc_audio_exit(lt9611uxc);
>   	drm_bridge_remove(&lt9611uxc->bridge);
>   
