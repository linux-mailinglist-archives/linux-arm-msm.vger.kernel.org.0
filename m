Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65B8C18D532
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2020 18:01:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbgCTRB2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Mar 2020 13:01:28 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43929 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727323AbgCTRB2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Mar 2020 13:01:28 -0400
Received: by mail-wr1-f66.google.com with SMTP id b2so8364010wrj.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2020 10:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WAc5lm/otiSMYlhAZkwpRkCEm3vOHc+J4qVldOzMYLg=;
        b=PbPE1WyvLko7zML64W4Fy/tWupg+WQH1wKpA3pUay8H3XFuNYdU3nzhD3CPGihnTx7
         ih+cLHp3N5pEAkHECPGmtZBMzrPaN+y9XHQMkiI7iqEujqP5t7x+2Lt7a1XeJ9QHHLNK
         nk+1jOvU7HCwNzazBbQWRyev4rktZQY6ByMAnqaVVSxXAQ0Zi9mOB3MGaNTow49biVkr
         QDmYbFifK5dkrj3HJ6IRqWKpagtMdGr+QqaZl4sZ7+GtG1hNKyCA9NFmiheF4FBlQb9E
         QJNRHCnlPaej/Y9dapBmKFx6r1AeoUEpVqzdyDEaA6bQBF5ja+41O6bsou1YZFv39a1s
         +Mgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WAc5lm/otiSMYlhAZkwpRkCEm3vOHc+J4qVldOzMYLg=;
        b=Kdf9EcPsDAFbpYcgF7Jo5pDHb4jH9ujLD4WwXPMOieAgCG4Plr07RABADvsYcZjRNb
         Ng7z1b7rWI0/JpA9lvnVaHncy0/0ZQeza2o9TfjEEQUtYkumcirR/+iHGThdmdLFCG6e
         iXroQQfRHLERO+p2s28JyS0NLGlv2TFOMQQTgg5HkqrLq1yLH8+l0QzlZcWSVimu+wah
         7G+4S66Rz5OonXx8U4j/nJ+aQp8OSErAQufo0VqFm7RhCgEavDbAKGjN8TNxKzdvf4eV
         jmlUUSzb+hh9Vdo35O34zB2XwDtMIFYAB95ewiXOScC3a/BHdM5yPxo2sq/9Hn3zItPG
         B9xQ==
X-Gm-Message-State: ANhLgQ1m2aKhjkktBPU0HiQjvgomtLpNZDVykmvxG1FnH2o9nZ85Zuzs
        OyRd+yvAx1CONG/l9Wm66QMBM+MrTC4=
X-Google-Smtp-Source: ADFU+vv37Lo2CSsXWa5Kztok67Rtq3einqxjkNtW+ODswAo0H7LtIjSk0BpXPmvoHxMYmOyW+uTN6A==
X-Received: by 2002:a5d:694e:: with SMTP id r14mr11999902wrw.312.1584723683784;
        Fri, 20 Mar 2020 10:01:23 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id c124sm8695442wma.10.2020.03.20.10.01.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Mar 2020 10:01:23 -0700 (PDT)
Subject: Re: [PATCH 5/5] soundwire: qcom: add sdw_master_device support
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        alsa-devel@alsa-project.org
Cc:     linux-kernel@vger.kernel.org, tiwai@suse.de, broonie@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, jank@cadence.com,
        slawomir.blauciak@intel.com,
        Bard liao <yung-chuan.liao@linux.intel.com>,
        Rander Wang <rander.wang@linux.intel.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Hui Wang <hui.wang@canonical.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>
References: <20200320162947.17663-1-pierre-louis.bossart@linux.intel.com>
 <20200320162947.17663-6-pierre-louis.bossart@linux.intel.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <81e2101e-d7ce-d023-5c35-ac6b55ea7166@linaro.org>
Date:   Fri, 20 Mar 2020 17:01:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200320162947.17663-6-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20/03/2020 16:29, Pierre-Louis Bossart wrote:
> Add new device as a child of the platform device, following the
> following hierarchy:
> 
> platform_device
>      sdw_master_device
>          sdw_slave0

Why can't we just remove the platform device layer here and add 
sdw_master_device directly?

What is it stopping doing that?

--srini


> 	...
> 	sdw_slaveN
> 
> For the Qualcomm implementation no sdw_master_driver is registered so
> the dais have to be registered using the platform_device and likely
> all power management is handled at the platform device level.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>   drivers/soundwire/qcom.c | 29 +++++++++++++++++++++++++----
>   1 file changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 77783ae4b71d..86b46415e50b 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -89,6 +89,7 @@ struct qcom_swrm_port_config {
>   struct qcom_swrm_ctrl {
>   	struct sdw_bus bus;
>   	struct device *dev;
> +	struct sdw_master_device *md;
>   	struct regmap *regmap;
>   	struct completion *comp;
>   	struct work_struct slave_work;
> @@ -775,14 +776,31 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   	mutex_init(&ctrl->port_lock);
>   	INIT_WORK(&ctrl->slave_work, qcom_swrm_slave_wq);
>   
> -	ctrl->bus.dev = dev;
> +	/*
> +	 * add sdw_master_device.
> +	 * For the Qualcomm implementation there is no driver.
> +	 */
> +	ctrl->md = sdw_master_device_add(NULL,	/* no driver name */
> +					 dev,	/* platform device is parent */
> +					 dev->fwnode,
> +					 0,	/* only one link supported */
> +					 NULL);	/* no context */
> +	if (IS_ERR(ctrl->md)) {
> +		dev_err(dev, "Could not create sdw_master_device\n");
> +		ret = PTR_ERR(ctrl->md);
> +		goto err_clk;
> +	}
> +
> +	/* the bus uses the sdw_master_device, not the platform device */
> +	ctrl->bus.dev = &ctrl->md->dev;
> +
>   	ctrl->bus.ops = &qcom_swrm_ops;
>   	ctrl->bus.port_ops = &qcom_swrm_port_ops;
>   	ctrl->bus.compute_params = &qcom_swrm_compute_params;
>   
>   	ret = qcom_swrm_get_port_config(ctrl);
>   	if (ret)
> -		goto err_clk;
> +		goto err_md;
>   
>   	params = &ctrl->bus.params;
>   	params->max_dr_freq = DEFAULT_CLK_FREQ;
> @@ -809,14 +827,14 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   					"soundwire", ctrl);
>   	if (ret) {
>   		dev_err(dev, "Failed to request soundwire irq\n");
> -		goto err_clk;
> +		goto err_md;
>   	}
>   
>   	ret = sdw_add_bus_master(&ctrl->bus);
>   	if (ret) {
>   		dev_err(dev, "Failed to register Soundwire controller (%d)\n",
>   			ret);
> -		goto err_clk;
> +		goto err_md;
>   	}
>   
>   	qcom_swrm_init(ctrl);
> @@ -832,6 +850,8 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   
>   err_master_add:
>   	sdw_delete_bus_master(&ctrl->bus);
> +err_md:
> +	device_unregister(&ctrl->md->dev);
>   err_clk:
>   	clk_disable_unprepare(ctrl->hclk);
>   err_init:
> @@ -843,6 +863,7 @@ static int qcom_swrm_remove(struct platform_device *pdev)
>   	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(&pdev->dev);
>   
>   	sdw_delete_bus_master(&ctrl->bus);
> +	device_unregister(&ctrl->md->dev);
>   	clk_disable_unprepare(ctrl->hclk);
>   
>   	return 0;
> 
