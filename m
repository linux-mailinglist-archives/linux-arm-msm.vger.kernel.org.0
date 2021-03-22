Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B387343E95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Mar 2021 11:57:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbhCVK5B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Mar 2021 06:57:01 -0400
Received: from ns.iliad.fr ([212.27.33.1]:36080 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230443AbhCVK4p (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Mar 2021 06:56:45 -0400
X-Greylist: delayed 554 seconds by postgrey-1.27 at vger.kernel.org; Mon, 22 Mar 2021 06:56:44 EDT
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 00E542105A;
        Mon, 22 Mar 2021 11:47:30 +0100 (CET)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id D7A002105F;
        Mon, 22 Mar 2021 11:47:29 +0100 (CET)
Subject: Re: [PATCH v11 5/9] drivers: thermal: tsens: Fix bug in sensor enable
 for msm8960
To:     Ansuel Smith <ansuelsmth@gmail.com>,
        Thara Gopinath <thara.gopinath@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210319005228.1250-1-ansuelsmth@gmail.com>
 <20210319005228.1250-6-ansuelsmth@gmail.com>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <a9ddd588-234c-36ac-e2b9-0fab294c3944@free.fr>
Date:   Mon, 22 Mar 2021 11:47:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210319005228.1250-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Mon Mar 22 11:47:30 2021 +0100 (CET)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/03/2021 01:52, Ansuel Smith wrote:

> Device based on tsens VER_0 contains a hardware bug that results in some
> problem with sensor enablement. Sensor id 6-11 can't be enabled
> selectively and all of them must be enabled in one step.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  drivers/thermal/qcom/tsens-8960.c | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thermal/qcom/tsens-8960.c b/drivers/thermal/qcom/tsens-8960.c
> index 86585f439985..bdc64d4188bf 100644
> --- a/drivers/thermal/qcom/tsens-8960.c
> +++ b/drivers/thermal/qcom/tsens-8960.c
> @@ -27,9 +27,9 @@
>  #define EN			BIT(0)
>  #define SW_RST			BIT(1)
>  #define SENSOR0_EN		BIT(3)
> +#define MEASURE_PERIOD		BIT(18)
>  #define SLP_CLK_ENA		BIT(26)
>  #define SLP_CLK_ENA_8660	BIT(24)
> -#define MEASURE_PERIOD		1
>  #define SENSOR0_SHIFT		3
>  
>  /* INT_STATUS_ADDR bitmasks */
> @@ -126,17 +126,35 @@ static int resume_8960(struct tsens_priv *priv)
>  static int enable_8960(struct tsens_priv *priv, int id)
>  {
>  	int ret;
> -	u32 reg, mask;
> +	u32 reg, mask = BIT(id);
>  
>  	ret = regmap_read(priv->tm_map, CNTL_ADDR, &reg);
>  	if (ret)
>  		return ret;
>  
> -	mask = BIT(id + SENSOR0_SHIFT);
> +	/* HARDWARE BUG:
> +	 * On platform with more than 6 sensors, all the remaining
> +	 * sensors needs to be enabled all togheder or underfined

s/On platform/On platforms
s/sensors needs/sensors need
s/togheder/together
s/underfined/undefined

Suggested fix up:

On platforms with more than 6 sensors, all remaining sensors
must be enabled together, otherwise undefined results are expected.

Regards.
