Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3B132612E8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 16:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729876AbgIHOpm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 10:45:42 -0400
Received: from mga18.intel.com ([134.134.136.126]:30643 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728957AbgIHO0J (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 10:26:09 -0400
IronPort-SDR: DpD3qJR5vUlAYbi2fTQa+qKATfX/Hf4EXhkc0xyWXxuo4ht4w5jT6PJtiTV7Recj+oDV5gAkh+
 YAFs9NumAfTg==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="145840843"
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; 
   d="scan'208";a="145840843"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2020 06:56:27 -0700
IronPort-SDR: teJpYva7dmhExSNbTzHV8zh5qZlK7Qb63IZhY9bLtbpHc7vOZpnf08GckvTTKZVmfydKGskSeF
 gr5iJMG6ycMQ==
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; 
   d="scan'208";a="448793214"
Received: from mgarber-mobl1.amr.corp.intel.com (HELO [10.212.179.134]) ([10.212.179.134])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2020 06:56:26 -0700
Subject: Re: [PATCH v2 3/4] soundwire: qcom: add support for mmio soundwire
 master devices
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc:     "moderated list:SOUNDWIRE SUBSYSTEM" <alsa-devel@alsa-project.org>,
        open list <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20200905173905.16541-1-jonathan@marek.ca>
 <20200905173905.16541-4-jonathan@marek.ca>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ad39f109-bfc9-332e-adc2-355499db1ab7@linux.intel.com>
Date:   Tue, 8 Sep 2020 08:56:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905173905.16541-4-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org




> @@ -764,8 +786,11 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   		if (!ctrl->regmap)
>   			return -EINVAL;
>   	} else {
> -		/* Only WCD based SoundWire controller is supported */
> -		return -ENOTSUPP;
> +		ctrl->reg_read = qcom_swrm_cpu_reg_read;
> +		ctrl->reg_write = qcom_swrm_cpu_reg_write;
> +		ctrl->mmio = devm_platform_ioremap_resource(pdev, 0);
> +		if (IS_ERR(ctrl->mmio))
> +			return PTR_ERR(ctrl->mmio);

Shouldn't this be conditional on SLIMBUS being enabled, as done in your 
patch2?

>   	}
>   
>   	ctrl->irq = of_irq_get(dev->of_node, 0);
> 
