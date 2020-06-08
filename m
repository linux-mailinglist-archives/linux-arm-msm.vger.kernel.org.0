Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59B3B1F218F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2020 23:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726723AbgFHVpM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jun 2020 17:45:12 -0400
Received: from mga18.intel.com ([134.134.136.126]:58551 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726612AbgFHVpL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jun 2020 17:45:11 -0400
IronPort-SDR: Kjr0fvbO4wMKbHsCuV3IbVzWbLK5n9NTj1WIwuUe/mcu7sQ52tWzmndKwyxRNB6Y4LJPw65GtV
 NC9fg5NAU5wQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2020 14:45:11 -0700
IronPort-SDR: DU8R5tImE9vZHiPtIilv5iHBhl5CA8wcR6ayCC7WH33b+u2Avrt89QbWBRmW4gjEd5SLowwSa9
 wtm8NtaPcy7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,489,1583222400"; 
   d="scan'208";a="446893866"
Received: from skarmaka-mobl2.amr.corp.intel.com (HELO [10.254.104.56]) ([10.254.104.56])
  by orsmga005.jf.intel.com with ESMTP; 08 Jun 2020 14:45:10 -0700
Subject: Re: [PATCH 4/5] soundwire: qcom: avoid dependency on CONFIG_SLIMBUS
To:     Jonathan Marek <jonathan@marek.ca>, alsa-devel@alsa-project.org
Cc:     Vinod Koul <vkoul@kernel.org>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>
References: <20200608204347.19685-1-jonathan@marek.ca>
 <20200608204347.19685-5-jonathan@marek.ca>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <33017798-9546-12dc-b857-493f56c3d557@linux.intel.com>
Date:   Mon, 8 Jun 2020 16:20:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608204347.19685-5-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/8/20 3:43 PM, Jonathan Marek wrote:
> The driver may be used without slimbus, so don't depend on slimbus.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   drivers/soundwire/Kconfig | 1 -
>   drivers/soundwire/qcom.c  | 5 +++++
>   2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
> index fa2b4ab92ed9..d121cf739090 100644
> --- a/drivers/soundwire/Kconfig
> +++ b/drivers/soundwire/Kconfig
> @@ -33,7 +33,6 @@ config SOUNDWIRE_INTEL
>   
>   config SOUNDWIRE_QCOM
>   	tristate "Qualcomm SoundWire Master driver"
> -	depends on SLIMBUS
>   	depends on SND_SOC
>   	help
>   	  SoundWire Qualcomm Master driver.
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 14334442615f..ac81c64768ea 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -769,13 +769,18 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   	if (!ctrl)
>   		return -ENOMEM;
>   
> +#ifdef CONFIG_SLIMBUS
>   	if (dev->parent->bus == &slimbus_bus) {
> +#else
> +	if (false) {
> +#endif


maybe:

if (IS_ENABLED(CONFIG_SLIMBUS) &&
     dev->parent->bus == &slimbus_bus)


>   		ctrl->reg_read = qcom_swrm_ahb_reg_read;
>   		ctrl->reg_write = qcom_swrm_ahb_reg_write;
>   		ctrl->regmap = dev_get_regmap(dev->parent, NULL);
>   		if (!ctrl->regmap)
>   			return -EINVAL;
>   	} else {
> +
>   		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>   
>   		ctrl->reg_read = qcom_swrm_cpu_reg_read;
> 
