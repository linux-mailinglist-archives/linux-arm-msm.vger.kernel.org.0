Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CCDB23F001
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Aug 2020 17:27:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbgHGP1q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Aug 2020 11:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgHGP1p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Aug 2020 11:27:45 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2724FC061756;
        Fri,  7 Aug 2020 08:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=A6reZ+I6qgExQ6tk0eR0RqsI3FRby5QZjmXbBTCsRpE=; b=jhJYAsDBx5mQARq8HFgz3mMQYG
        O06mJ2jVj1/Hooz3lLXQr3jSnaOu4YRK8d/7qmpzc6NX7AVBLznUBuD5XdkIqUcgtR8mBMm44blh2
        RukKKZhq9Amh33DyJNVkpsm/cQmbBmKwh8Hq1i3RycjB76fmHb3ivkvVRvixoVY0TiTCrhVx09P3T
        3z8MLOn55T6FNEdAp8y15TyGg9s+0UWSq46F/aoeJbALEsNQEOFVYnmrDNJ/lZerK8GNlwnInbPvN
        OeNlt7yMznGN8++j5wm1rj5Dqqe+H/1UF5RhDKH9ldPAAnnUKCtlUR0yyfbmc1bFN7ZFnR02WbYch
        VWm/pMEw==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k44HT-0000Cp-6H; Fri, 07 Aug 2020 15:27:39 +0000
Subject: Re: [PATCH v9 3/5] drm/msm/dp: add support for DP PLL driver
To:     Tanmay Shah <tanmay@codeaurora.org>, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com
Cc:     linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
        seanpaul@chromium.org, daniel@ffwll.ch, airlied@linux.ie,
        aravindh@codeaurora.org, abhinavk@codeaurora.org,
        khsieh@codeaurora.org, Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>
References: <20200807071718.17937-1-tanmay@codeaurora.org>
 <20200807071718.17937-4-tanmay@codeaurora.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3b0d0e49-5fe8-e217-4ddc-1ff08e65ab48@infradead.org>
Date:   Fri, 7 Aug 2020 08:27:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200807071718.17937-4-tanmay@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/7/20 12:17 AM, Tanmay Shah wrote:
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index ea3c4d094d09..cc1392b29022 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -60,6 +60,7 @@ config DRM_MSM_HDMI_HDCP
>  config DRM_MSM_DP
>  	bool "Enable DP support in MSM DRM driver"
>  	depends on DRM_MSM
> +	default y
>  	help
>  	  Compile in support for DP driver in msm drm driver. DP external
>  	  display support is enabled through this config option. It can

Hi,

You need a very strong justification to make an optional part of a driver
to be "default y".

so why?

thanks.
-- 
~Randy

