Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43B6920F1D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 11:41:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731984AbgF3Jl3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jun 2020 05:41:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729193AbgF3Jl2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jun 2020 05:41:28 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 249F0C061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2020 02:41:28 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id g18so19461579wrm.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2020 02:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HImoHtcoL4GWSNXzPGsXdbqW6yQ/LP8fFCnP3VQZ5jY=;
        b=RBLge8a/9XASGeqxyNGRHLbk/tuveX/aOKniAa55uV6EMqqQl+oF0FP7/CiM4Tf3P9
         Thizkd+hwsLeXAa85pVUlsw5o+GVmdfLd7BuB6F/PDINFaw3VRk4jPER8cFeBr4sLl6u
         rHwzn3do8U1SGb34KgrwauVHCaSd+jPfCSHTe9AOFkOWwzBLTVOm2c2h0rYd4g+yB++H
         Hm1XD+XL/Cf/UJ/yPCECBOncbvq0cyiusYgAeCpVq8SfjIQZB93aphKnKSk2mVhLYgzb
         SCwgqbSCELfHmZEdHfZMoooygJYgFQBdMnKyRqd7dZTxZHZPTeee4tfIfPaWWFXDvnY7
         xLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HImoHtcoL4GWSNXzPGsXdbqW6yQ/LP8fFCnP3VQZ5jY=;
        b=fXhxmO2cwcKDtKfVIbviUFnvCmPhxxigF+W1AYk8EZVExrDMQ5Vef9dtUiTAh4KJl4
         YYIDt8g+sGKO/XCAcCNTR2lrD39DzfJeFLb8x3NpCaPSXQlzTpMPXLkSi7OuN0WoWJqs
         u9RIlR4JoDWb702LKCvSw38IPeGNsbCG4x0lcWTLNKZn3/SnMRceeR+Kn/8kc9obXb/2
         BvZuEhCcJWprFLIOKRspTm8FT/N/jZW7kBuSchn2+u8jrNwh8WtGG4I+OFJe2p3kRw+5
         xyHDa5eHYgMFG0evkVtmCBJQsgRulPBA7HFlMTPQ6GGEMQjZzQNLST5ENGwtaBQt8yjR
         ratg==
X-Gm-Message-State: AOAM5312rbEwwv/hNp3gDYU6/f/2fF+2aiaUuOs8bxsjSbCS1cwqtIgO
        Cs25OSnRwfqmcA4H3TCy8LvVF1dycfQ=
X-Google-Smtp-Source: ABdhPJxN/hQFvc7MuzircJi+Z7WcGSHc0dca3CxnIn7B6gW09c9nT7nJNPgCIaHl1cmUQrR27Dzxwg==
X-Received: by 2002:adf:ed47:: with SMTP id u7mr22580391wro.201.1593510086446;
        Tue, 30 Jun 2020 02:41:26 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id n14sm3167838wro.81.2020.06.30.02.41.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jun 2020 02:41:25 -0700 (PDT)
Subject: Re: [PATCH] nvmem: qfprom: increase id to support multiple devices
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
References: <20200629133204.23279-1-shawn.guo@linaro.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <04022e2b-e028-b942-811d-a9c8ac836fcc@linaro.org>
Date:   Tue, 30 Jun 2020 10:41:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200629133204.23279-1-shawn.guo@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Shawn,
Thankyou for the patch!


On 29/06/2020 14:32, Shawn Guo wrote:
> There could be multiple qfprom devices on some SoCs.  For example, on
> MSM8939, qfprom@58000 holds efuse bits for Core Power Reduction (CPR),
> and qfprom@5c000 holds bits for TSENS.  Registering multiple nvmem
> devices with the same id results in the following failure on the second
> device.
> 
> [    1.682731] sysfs: cannot create duplicate filename '/bus/nvmem/devices/qfprom0'
> [    1.685889] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.19.107-00567-g11c887ce2838-dirty #334
> [    1.693191] Hardware name: Square, Inc. T2 Devkit (DT)
> [    1.701610] Call trace:
> [    1.706673]  dump_backtrace+0x0/0x158
> [    1.708987]  show_stack+0x14/0x20
> [    1.712810]  dump_stack+0x98/0xbc
> [    1.716114]  sysfs_warn_dup+0x60/0x78
> [    1.719401]  sysfs_do_create_link_sd.isra.0+0xdc/0xe8
> [    1.723047]  sysfs_create_link+0x20/0x40
> [    1.728088]  bus_add_device+0x68/0x130
> [    1.732083]  device_add+0x3f8/0x628
> [    1.735639]  nvmem_register.part.4+0x150/0x348
> [    1.739018]  devm_nvmem_register+0x4c/0xa8
> [    1.743532]  qfprom_probe+0x94/0xb8
> [    1.747615]  platform_drv_probe+0x50/0xa0
> [    1.750998]  really_probe+0x1b8/0x298
> [    1.755164]  driver_probe_device+0x58/0x100
> [    1.758810]  __driver_attach+0xe0/0xe8
> [    1.762802]  bus_for_each_dev+0x74/0xc8
> [    1.766622]  driver_attach+0x20/0x28
> [    1.770354]  bus_add_driver+0x1ac/0x218
> [    1.774175]  driver_register+0x60/0x110
> [    1.777734]  __platform_driver_register+0x40/0x48
> [    1.781570]  qfprom_driver_init+0x18/0x20
> [    1.786416]  do_one_initcall+0x5c/0x178
> [    1.790418]  kernel_init_freeable+0x198/0x244
> [    1.794062]  kernel_init+0x10/0x108
> [    1.798567]  ret_from_fork+0x10/0x18
> [    1.802084] qcom,qfprom: probe of 5c000.qfprom failed with error -17
> 


> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>   drivers/nvmem/qfprom.c | 2 ++
>   1 file changed, 2 insertions(+)

TBH, this functionality need to go into core driver which already has 
IDR to allocated ID's for nvmem providers.

Can you try this patch:

---------------------------->cut<---------------------------------diff 
--git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 927eb5f6003f..aa87bd6415ab 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -629,12 +629,18 @@ struct nvmem_device *nvmem_register(const struct 
nvmem_config *config)
         if (!config->no_of_node)
                 nvmem->dev.of_node = config->dev->of_node;

-       if (config->id == -1 && config->name) {
+       switch (config->id) {
+       case NVMEM_DEVID_NONE:
                 dev_set_name(&nvmem->dev, "%s", config->name);
-       } else {
+               break;
+       case NVMEM_DEVID_AUTO:
+               dev_set_name(&nvmem->dev, "%s%d", config->name, nvmem->id);
+               break;
+       default:
                 dev_set_name(&nvmem->dev, "%s%d",
                              config->name ? : "nvmem",
                              config->name ? config->id : nvmem->id);
+               break;
         }

         nvmem->read_only = device_property_present(config->dev, 
"read-only") ||
diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
index 8a91717600be..8b425f8d847d 100644
--- a/drivers/nvmem/qfprom.c
+++ b/drivers/nvmem/qfprom.c
@@ -31,6 +31,7 @@ static struct nvmem_config econfig = {
         .name = "qfprom",
         .stride = 1,
         .word_size = 1,
+       .id = NVMEM_DEVID_AUTO,
         .reg_read = qfprom_reg_read,
  };

diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index 6d6f8e5d24c9..06409a6c40bc 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -27,6 +27,9 @@ enum nvmem_type {
         NVMEM_TYPE_BATTERY_BACKED,
  };

+#define NVMEM_DEVID_NONE       (-1)
+#define NVMEM_DEVID_AUTO       (-2)
+
  /**
   * struct nvmem_config - NVMEM device configuration
   *
---------------------------->cut<---------------------------------

Thanks,
srini
> 
> diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
> index 8a91717600be..ceb837e861d8 100644
> --- a/drivers/nvmem/qfprom.c
> +++ b/drivers/nvmem/qfprom.c
> @@ -40,6 +40,7 @@ static int qfprom_probe(struct platform_device *pdev)
>   	struct resource *res;
>   	struct nvmem_device *nvmem;
>   	struct qfprom_priv *priv;
> +	static int id;
>   
>   	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>   	if (!priv)
> @@ -52,6 +53,7 @@ static int qfprom_probe(struct platform_device *pdev)
>   
>   	econfig.size = resource_size(res);
>   	econfig.dev = dev;
> +	econfig.id = id++;
>   	econfig.priv = priv;
>   
>   	nvmem = devm_nvmem_register(dev, &econfig);
> 
