Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C389261320
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 17:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729422AbgIHPAq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 11:00:46 -0400
Received: from mga06.intel.com ([134.134.136.31]:15911 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729663AbgIHOYv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 10:24:51 -0400
IronPort-SDR: Kog8Twc+2HjYMVg/wd15CUBhnamZunO4tL4nKH0jMqOTAbrDzRDlSLmGXMzDHxNUkknb30a9Wl
 NsOE/hDiL1Ww==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="219689060"
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; 
   d="scan'208";a="219689060"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2020 06:53:09 -0700
IronPort-SDR: 956F71r7a6JZ1C6XielGjK+RnLRhRq38MyfSOcKlJJVVT4ETYmGMjazSwhbmwHtOSf1Aot0c6n
 MO8OQtJNIYww==
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; 
   d="scan'208";a="448792089"
Received: from mgarber-mobl1.amr.corp.intel.com (HELO [10.212.179.134]) ([10.212.179.134])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2020 06:53:07 -0700
Subject: Re: [PATCH v2 2/4] soundwire: qcom: avoid dependency on
 CONFIG_SLIMBUS
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc:     Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "moderated list:SOUNDWIRE SUBSYSTEM" <alsa-devel@alsa-project.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200905173905.16541-1-jonathan@marek.ca>
 <20200905173905.16541-3-jonathan@marek.ca>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <69955702-c61c-a961-72fd-2f8a6b3ab978@linux.intel.com>
Date:   Tue, 8 Sep 2020 08:53:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905173905.16541-3-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/5/20 12:39 PM, Jonathan Marek wrote:
> The driver may be used without slimbus, so don't depend on slimbus.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   drivers/soundwire/Kconfig | 2 +-
>   drivers/soundwire/qcom.c  | 4 ++++
>   2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
> index fa2b4ab92ed9..f83d02c9c60a 100644
> --- a/drivers/soundwire/Kconfig
> +++ b/drivers/soundwire/Kconfig
> @@ -33,7 +33,7 @@ config SOUNDWIRE_INTEL
>   
>   config SOUNDWIRE_QCOM
>   	tristate "Qualcomm SoundWire Master driver"
> -	depends on SLIMBUS
> +	imply SLIMBUS
>   	depends on SND_SOC
>   	help
>   	  SoundWire Qualcomm Master driver.
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index d1e33ef1afac..6401ad451eee 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -753,7 +753,11 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   	if (!ctrl)
>   		return -ENOMEM;
>   
> +#if IS_ENABLED(CONFIG_SLIBMUS)

typo: SLIMBUS.

>   	if (dev->parent->bus == &slimbus_bus) {
> +#else
> +	if (false) {
> +#endif
>   		ctrl->reg_read = qcom_swrm_ahb_reg_read;
>   		ctrl->reg_write = qcom_swrm_ahb_reg_write;
>   		ctrl->regmap = dev_get_regmap(dev->parent, NULL);
> 
