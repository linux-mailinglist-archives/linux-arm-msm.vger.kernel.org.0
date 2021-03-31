Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 699A0350450
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 18:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232805AbhCaQRJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 12:17:09 -0400
Received: from mga02.intel.com ([134.134.136.20]:1382 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229486AbhCaQQm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 12:16:42 -0400
IronPort-SDR: F2BwOGNJZcjE/kf6f5Ue1MW6JD345ikMWLqh3uLC6bdke7b8skUI5yoYJSOjgp/DXEZdVYzrg9
 0sTfBRsJggdw==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="179167961"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="179167961"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2021 09:16:39 -0700
IronPort-SDR: DAvSyos5VyO37OsDz+/VSlVYccihCVT7a1aUvmf/rVTJ4ciLMoLHMmSqRGq4DR0yEueub8DzUC
 yx3dHLfwfdVg==
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="610569212"
Received: from erikberx-mobl4.amr.corp.intel.com (HELO [10.212.230.42]) ([10.212.230.42])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2021 09:16:36 -0700
Subject: Re: [PATCH V2] soundwire: qcom: use signed variable for error return
To:     Vinod Koul <vkoul@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20210331155520.2987823-1-vkoul@kernel.org>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4aafedf4-46f7-be2a-6422-e5611f8390f8@linux.intel.com>
Date:   Wed, 31 Mar 2021 11:16:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210331155520.2987823-1-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/31/21 10:55 AM, Vinod Koul wrote:
> We get warning of using a unsigned variable being compared to less than
> zero. The comparison is correct as it checks for errors from previous
> call to qcom_swrm_get_alert_slave_dev_num(), so we should use a signed
> variable here.
> 
> While at it, drop the superfluous initialization as well
> 
> drivers/soundwire/qcom.c: qcom_swrm_irq_handler() warn: impossible
> condition '(devnum < 0) => (0-255 < 0)'
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   drivers/soundwire/qcom.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index b08ecb9b418c..ec86c4e53fdb 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -428,7 +428,7 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
>   	struct qcom_swrm_ctrl *swrm = dev_id;
>   	u32 value, intr_sts, intr_sts_masked, slave_status;
>   	u32 i;
> -	u8 devnum = 0;
> +	int devnum;
>   	int ret = IRQ_HANDLED;
>   
>   	swrm->reg_read(swrm, SWRM_INTERRUPT_STATUS, &intr_sts);
> 
