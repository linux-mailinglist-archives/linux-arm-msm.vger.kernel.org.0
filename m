Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9B0C5F2F3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2019 08:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbfGDGj7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jul 2019 02:39:59 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:57189 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbfGDGj6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jul 2019 02:39:58 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190704063956euoutp01e57ecff019f2f3e7ead28e1d240b3fbd~uIP4gDP-r2570625706euoutp01Y
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jul 2019 06:39:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190704063956euoutp01e57ecff019f2f3e7ead28e1d240b3fbd~uIP4gDP-r2570625706euoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1562222396;
        bh=tCmZGBbqZk6h1eHVaAyvfSCvV1cESgxX9cwdBi3u2Ns=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=sY1uF4Qm4KEqSVk5OBDHR4FL0B/TVTKbdN9IpDUmD4BY67fP7uMpugc7M6/iz/mPM
         Fqr3KHQBUlwG4gWsJ6r3hkHiFQA+RdFQMhnVTy85MTlPDgtoE9P9IaodAAXfi/ywPZ
         kZUL7aKHQXkQobB9YvXeSv2ig/Y1V27FAp8l+uzw=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190704063955eucas1p2fd225618c6259899b330722b5d345da7~uIP35ap5X2304523045eucas1p2U;
        Thu,  4 Jul 2019 06:39:55 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 12.F5.04298.B3F9D1D5; Thu,  4
        Jul 2019 07:39:55 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190704063955eucas1p2313041808cf25371e144d6c6e5c7d40a~uIP3Dt62m1201312013eucas1p2w;
        Thu,  4 Jul 2019 06:39:55 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190704063954eusmtrp1a331c969901581b49a88260b6e4bffd7~uIP21mqGh1175011750eusmtrp1c;
        Thu,  4 Jul 2019 06:39:54 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-86-5d1d9f3b928f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 91.C2.04140.A3F9D1D5; Thu,  4
        Jul 2019 07:39:54 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190704063954eusmtip16beb14b0b4b73cb7bccd1431ba179a9f~uIP2YiMXf2030420304eusmtip1Z;
        Thu,  4 Jul 2019 06:39:54 +0000 (GMT)
Subject: Re: [PATCH 3/3] drm/msm/dsi: make sure we have panel or bridge
 earlier
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Sibi Sankar <sibis@codeaurora.org>,
        freedreno@lists.freedesktop.org,
        Chandan Uddaraju <chandanu@codeaurora.org>
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <8a88e865-68a1-37e2-93a1-efd50a778c47@samsung.com>
Date:   Thu, 4 Jul 2019 08:39:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190630131445.25712-4-robdclark@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHe3fOtuNqcpyaD2pKo0i7aFYfThiSIXaoL/VBqMR05UFFp7aj
        lhW0TMW7qUS4JipRakFempoLmpdymmjeMG9z1kyjEFOzElPbdpT89nue5/9c/i8vgUk6+M5E
        VGwCo4iVxUgFIryhfbnnkG/prpDD9W0e1PKnFIzK7enkUcNlYzg1uDQnoNQz3Ygq0HULqQGt
        WkANLZswaqb8D0YZit4iaqh8jn9yO/1I2YfTA3m5PLpJZRDSjb8m+bQxW8+j9dpRIb1Y53ZO
        eEl0IpyJiUpiFN5+YaLI57Xp/Pi0fTfe9y5hStTsnoVsCCCPgfbzOMpCIkJCViLQZb7gc8FP
        BIV/CzEuWETQbKjFNlu+r2fyLSwhKxDkZNOcaBZBf59JYCnYk+eh5t6cVeRABkBH/4p1LEa2
        8aBKM4gsBQHpCasvR6wNYtIPPhR34hbGyT2Qnd9vzTuSF2BAo0Wcxg46i6esGhvyOLzTmIQW
        xkh3aJxVYxw7wehUKY+7dFQIBZMuHAdA+4+2DQf28E2vEXLsCl1FOTjHd8BYmWq1DGQGgvqa
        po0GX2jT95kdEOYFnlCt9ebS/pC2ZnkVwsy2MDxrx51gC4UNDzfSYshIl3Dq3WDsrt8Y6ARP
        epcE95FUtcWYaosZ1RYzqv97yxD+DDkxiaw8gmF9YpnrXqxMzibGRnhdjZPXIfP/6lrTL7xC
        S/1XWhFJIOkO8aTGNUTClyWxyfJWBAQmdRD/XjGnxOGy5JuMIi5UkRjDsK3IhcClTuJb2yaD
        JWSELIGJZph4RrFZ5RE2zkqUXudxBEWj2wEy3cRZZaiq66uHy6mw+QXP9Y9C9bXVx3kTjkdP
        zx/UVV22jcx9vTYe71aSshcVmFZ2GioCyJ5M+Re5OqGkKiM5sLrlgSQwtVg64ZUwXbT+NKgl
        uNpwd52erXRcNfq7jAjqHLMrDYYoDXugPmis+kz+6pvIi6JpKc5Gynz2YwpW9g8mqQ+CWwMA
        AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRmVeSWpSXmKPExsVy+t/xu7pW82VjDc636lv8fNjEbNF77iST
        xY0Ft1ksrnx9z2Yx5/lZRouJ+8+yW1zeNYfN4trPx8wWzxf+YLa4O/kIo8W1he9ZHbg9Zjdc
        ZPG43NfL5LFz1l12j+3fHrB63O8+zuRxfNctdo/Pm+QC2KP0bIryS0tSFTLyi0tslaINLYz0
        DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0MlZvbGMtaFWvOHXhK3MD4wH5LkZODgkB
        E4nX/ztZuxi5OIQEljJKHOxrZ4NIiEvsnv+WGcIWlvhzrYsNoug1o8S9F4eYQBLCAoESG5rf
        s4LYIgIuEicu/QabxCxwmEmi+9QEdoiO3YwSTQe/gXWwCWhK/N18E2wFr4CdxPmZJ1lAbBYB
        FYnu/ktgcVGBCIm+ttlQNYISJ2c+AavhFLCUOLrlMTuIzSygLvFn3iVmCFteYvvbOVC2uMSt
        J/OZJjAKzULSPgtJyywkLbOQtCxgZFnFKJJaWpybnltspFecmFtcmpeul5yfu4kRGLXbjv3c
        soOx613wIUYBDkYlHt4HW2RihVgTy4orcw8xSnAwK4nwfv8NFOJNSaysSi3Kjy8qzUktPsRo
        CvTcRGYp0eR8YELJK4k3NDU0t7A0NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TBKdXA
        WPX31juNFbW334jJLnu3lvfSNy2bVdKF4twvt7CF6t3/IOy2Xqmw3FogOyz9cPOPZ8W/Vqxc
        NCvt84ULjQ1frdmN+Ct0rZL4fb6uNv6QteMza1KH0ZOFm4+skHaf0THHevEm3ahpE7p6XdVj
        l4Z1TLryk/Vq/Smut+8n3bcIUrdw6dNWSdkvrsRSnJFoqMVcVJwIAHdZmjfwAgAA
X-CMS-MailID: 20190704063955eucas1p2313041808cf25371e144d6c6e5c7d40a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190630131612epcas1p22f241f3e6edc3976f7abedcb74f86e3a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190630131612epcas1p22f241f3e6edc3976f7abedcb74f86e3a
References: <20190630131445.25712-1-robdclark@gmail.com>
        <CGME20190630131612epcas1p22f241f3e6edc3976f7abedcb74f86e3a@epcas1p2.samsung.com>
        <20190630131445.25712-4-robdclark@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30.06.2019 15:14, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>
> If we are going to -EPROBE_DEFER due to panel/bridge not probed yet, we
> want to do it before we start touching hardware.


As the evidence shows, if the driver create bus (mipi-dsi), then it
should not defer probing due to lack of sink (panel/bridge), because the
sink will not appear without the bus.

Instead of defer probing you can defer component binding, or if you like
challenges you can implement dynamic sink binding :)


Regards

Andrzej




>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.h         |  2 +-
>  drivers/gpu/drm/msm/dsi/dsi_host.c    | 30 +++++++++++++--------------
>  drivers/gpu/drm/msm/dsi/dsi_manager.c |  9 +++-----
>  3 files changed, 19 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> index 53bb124e8259..e15e7534ccd9 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -171,7 +171,7 @@ int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
>  struct drm_panel *msm_dsi_host_get_panel(struct mipi_dsi_host *host);
>  unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host);
>  struct drm_bridge *msm_dsi_host_get_bridge(struct mipi_dsi_host *host);
> -int msm_dsi_host_register(struct mipi_dsi_host *host, bool check_defer);
> +int msm_dsi_host_register(struct mipi_dsi_host *host);
>  void msm_dsi_host_unregister(struct mipi_dsi_host *host);
>  int msm_dsi_host_set_src_pll(struct mipi_dsi_host *host,
>  			struct msm_dsi_pll *src_pll);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 1ae2f5522979..8e5b0ba9431e 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1824,6 +1824,20 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>  		goto fail;
>  	}
>  
> +	/*
> +	 * Make sure we have panel or bridge early, before we start
> +	 * touching the hw.  If bootloader enabled the display, we
> +	 * want to be sure to keep it running until the bridge/panel
> +	 * is probed and we are all ready to go.  Otherwise we'll
> +	 * kill the display and then -EPROBE_DEFER
> +	 */
> +	if (IS_ERR(of_drm_find_panel(msm_host->device_node)) &&
> +			!of_drm_find_bridge(msm_host->device_node)) {
> +		pr_err("%s: no panel or bridge yet\n", __func__);
> +		return -EPROBE_DEFER;
> +	}
> +
> +
>  	msm_host->ctrl_base = msm_ioremap(pdev, "dsi_ctrl", "DSI CTRL");
>  	if (IS_ERR(msm_host->ctrl_base)) {
>  		pr_err("%s: unable to map Dsi ctrl base\n", __func__);
> @@ -1941,7 +1955,7 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
>  	return 0;
>  }
>  
> -int msm_dsi_host_register(struct mipi_dsi_host *host, bool check_defer)
> +int msm_dsi_host_register(struct mipi_dsi_host *host)
>  {
>  	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>  	int ret;
> @@ -1955,20 +1969,6 @@ int msm_dsi_host_register(struct mipi_dsi_host *host, bool check_defer)
>  			return ret;
>  
>  		msm_host->registered = true;
> -
> -		/* If the panel driver has not been probed after host register,
> -		 * we should defer the host's probe.
> -		 * It makes sure panel is connected when fbcon detects
> -		 * connector status and gets the proper display mode to
> -		 * create framebuffer.
> -		 * Don't try to defer if there is nothing connected to the dsi
> -		 * output
> -		 */
> -		if (check_defer && msm_host->device_node) {
> -			if (IS_ERR(of_drm_find_panel(msm_host->device_node)))
> -				if (!of_drm_find_bridge(msm_host->device_node))
> -					return -EPROBE_DEFER;
> -		}
>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index ff39ce6150ad..cd3450dc3481 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -82,7 +82,7 @@ static int dsi_mgr_setup_components(int id)
>  	int ret;
>  
>  	if (!IS_DUAL_DSI()) {
> -		ret = msm_dsi_host_register(msm_dsi->host, true);
> +		ret = msm_dsi_host_register(msm_dsi->host);
>  		if (ret)
>  			return ret;
>  
> @@ -101,14 +101,11 @@ static int dsi_mgr_setup_components(int id)
>  		/* Register slave host first, so that slave DSI device
>  		 * has a chance to probe, and do not block the master
>  		 * DSI device's probe.
> -		 * Also, do not check defer for the slave host,
> -		 * because only master DSI device adds the panel to global
> -		 * panel list. The panel's device is the master DSI device.
>  		 */
> -		ret = msm_dsi_host_register(slave_link_dsi->host, false);
> +		ret = msm_dsi_host_register(slave_link_dsi->host);
>  		if (ret)
>  			return ret;
> -		ret = msm_dsi_host_register(master_link_dsi->host, true);
> +		ret = msm_dsi_host_register(master_link_dsi->host);
>  		if (ret)
>  			return ret;
>  


