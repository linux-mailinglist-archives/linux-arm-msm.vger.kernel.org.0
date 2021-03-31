Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06D5A350285
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 16:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236153AbhCaOmI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 10:42:08 -0400
Received: from mga01.intel.com ([192.55.52.88]:6502 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235758AbhCaOla (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 10:41:30 -0400
IronPort-SDR: Fv13a6bIFG3LRY5xUYoeoeFq3FaLHJrIaHdvrBFa8S4YpIYYDCX7whjYL0niY8J279/bq/OQIv
 Nl80ZXoyUyeA==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="212259213"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="212259213"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2021 07:41:26 -0700
IronPort-SDR: vkzzsBYmQzWnxqIFwGewwH9SSQ55VgOas4ODz/oxJGoOE9M2SSm5/UdqrUfAr/5aPV/ogqjQBr
 lorrFe695/ig==
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="610536384"
Received: from erikberx-mobl4.amr.corp.intel.com (HELO [10.212.230.42]) ([10.212.230.42])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2021 07:41:25 -0700
Subject: Re: [PATCH] soundwire: qcom: use signed variable for error return
To:     Vinod Koul <vkoul@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20210331072111.2945945-1-vkoul@kernel.org>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9cdef4e9-a38a-6c77-1b23-739f85384b12@linux.intel.com>
Date:   Wed, 31 Mar 2021 09:41:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210331072111.2945945-1-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/31/21 2:21 AM, Vinod Koul wrote:
> We get warning for using a unsigned variable being compared to less than
> zero. The comparison is correct as it checks for errors from previous
> call to qcom_swrm_get_alert_slave_dev_num(), so we should use a signed
> variable instead.
> 
> drivers/soundwire/qcom.c: qcom_swrm_irq_handler() warn: impossible
> condition '(devnum < 0) => (0-255 < 0)'
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   drivers/soundwire/qcom.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index b08ecb9b418c..55ed133c6704 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -428,7 +428,7 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
>   	struct qcom_swrm_ctrl *swrm = dev_id;
>   	u32 value, intr_sts, intr_sts_masked, slave_status;
>   	u32 i;
> -	u8 devnum = 0;
> +	s8 devnum = 0;

it's not great to store negative error codes with s8. That works in this 
specific case because the function only returns -EINVAL.

We actually have zero occurrences of s8 in the drivers/soundwire/ code.

>   	int ret = IRQ_HANDLED;
>   
>   	swrm->reg_read(swrm, SWRM_INTERRUPT_STATUS, &intr_sts);
> 
