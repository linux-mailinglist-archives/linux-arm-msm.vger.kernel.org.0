Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02A7E23F014
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Aug 2020 17:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbgHGPh5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Aug 2020 11:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgHGPh5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Aug 2020 11:37:57 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70187C061756;
        Fri,  7 Aug 2020 08:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=aoR8uwufFyTySMZNtLnSP/q0m1Vbg/FSJL36aRUJIpQ=; b=DgRtHxVKtIrOCZzirxubTwm9Sc
        nv5Hcpi1bQ9LVupVJvStuDkaDfyMzvrLIIc+OpXO3nHqIpHdjy4vUyUpVdFOR98AWrexGET7dBlBW
        uJYziw3saF4sDmTAW622Elv8pnEbYLIWrqOOGnCyrL4bGv3EF9Q2MMmDJUlL0xCM6s4/d40MAu/+b
        XJfBZpJqmwFyg9G3/3wwD4Z/PUEAn1WJE2bLEDLpGEnQBlKvlbAjOiWAqHZhiItIsAnqpUDrZUITE
        Ss4Iauz8mjBB0c5J7Jm/YlWkxeaJ+WKWwILnuYJ5OjKRAE4tUjKvwJCMQ4E6c/vV25LZZwGSlFCRO
        GuQoK1tA==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k44RM-0000hz-BM; Fri, 07 Aug 2020 15:37:52 +0000
Subject: Re: [PATCH v9 2/5] drm/msm/dp: add displayPort driver support
To:     Tanmay Shah <tanmay@codeaurora.org>, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com
Cc:     linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
        seanpaul@chromium.org, daniel@ffwll.ch, airlied@linux.ie,
        aravindh@codeaurora.org, abhinavk@codeaurora.org,
        khsieh@codeaurora.org, Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Guenter Roeck <groeck@chromium.org>
References: <20200807071718.17937-1-tanmay@codeaurora.org>
 <20200807071718.17937-3-tanmay@codeaurora.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b0e8415f-53e6-575d-5774-5f4f7adca982@infradead.org>
Date:   Fri, 7 Aug 2020 08:37:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200807071718.17937-3-tanmay@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/7/20 12:17 AM, Tanmay Shah wrote:
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 6deaa7d01654..ea3c4d094d09 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -57,6 +57,14 @@ config DRM_MSM_HDMI_HDCP
>  	help
>  	  Choose this option to enable HDCP state machine
>  
> +config DRM_MSM_DP
> +	bool "Enable DP support in MSM DRM driver"

	bool "Enabled DisplayPort support in MSM DRM driver"

> +	depends on DRM_MSM
> +	help
> +	  Compile in support for DP driver in msm drm driver. DP external

	                                      MSM DRM

Also:
I can't find anywhere in drivers/gpu/drm/msm/ that explains what MSM means.
What does it mean?

> +	  display support is enabled through this config option. It can
> +	  be primary or secondary display on device.
> +
>  config DRM_MSM_DSI
>  	bool "Enable DSI support in MSM DRM driver"
>  	depends on DRM_MSM

thanks.
-- 
~Randy

