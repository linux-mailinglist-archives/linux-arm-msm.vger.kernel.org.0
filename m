Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98A0C2DA63E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Dec 2020 03:31:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727051AbgLOCZ4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Dec 2020 21:25:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727670AbgLOCZb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Dec 2020 21:25:31 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D1BCC06179C
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 18:24:51 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id x22so15480624wmc.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 18:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OE9Bb/mebGq5IQ0pCbTX8QkKgB3rp/03lLTqI0xRKXs=;
        b=aRJ8lCanJ+XgPi264EPRH8ikBySk1KRXkEP+4pqT257TrDqvg0P0BLjyx8UI1KOa6H
         arfSX+iKDTpsyBHWViuh9chb79KswbRPtTNr2Cf7qtDkPnEXp9wZow00eemuTIGZbRvm
         ss5IHW0OQEO5ZJhRjVamy0bgWebWVzkM1KJrrKiF7hfFaKvrpDgHKkQmt9SBd5/GkV08
         0lPO6DNlOPMQlI1z1OBN9MtXumSiFLYeTPdf2wN/otpQk5OT2EJjq/BOFBHWiVUEGbzW
         vJKYfRvq3LMoR6oG2sm480rHk6aYiXZPoKs/eqz/kQNy8vBYpAuSDhiiOry87KQT0TEq
         BZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OE9Bb/mebGq5IQ0pCbTX8QkKgB3rp/03lLTqI0xRKXs=;
        b=F5jCALVj7X2AqLG+E8ZW+wLe1u8S7eVKFWNJtrXr+rEgPTVeXiVDyTIJ+Lr8SpCHLL
         K4AE3vAUqlod1JyDjp44L9vk8fBn4O/Tu4GDrUH8JHFaV7CRj+UUm+m2g7iFBn6QdU1H
         FYmUDIOVTkwUCnkiCvCUBXEAPpEMmG4Ga0Vd1zme8A/prNhj3i5QEn75D2u9lipr+a8v
         YgOh8Sl0PLp5S8EG2OB35zMeUipd5eM8dsTezfY+OET/Pca2hnGbnW5fJiF90ruZNMRs
         Vz0a5pz6eeikRNDlOODZkjVA8hRCTrwt5yyVUNY8mhXnXlnWXh09OJdD+usi2TvGkO3b
         EO8g==
X-Gm-Message-State: AOAM533AIdM8JWESGZcSBxYyZqBJqdYK7m1bebjMNUOf7l0VbHtfceh7
        QvnNowcrabp9WSe9e40PyNuO2gXblnBZRpQ+
X-Google-Smtp-Source: ABdhPJzxESi1Dzn7QiARQDqrwlrdGaBjrqFs3Y+/9wqhxrhVtvYm/i7hQVccloHVnB4CnbG3xA9FvQ==
X-Received: by 2002:a05:600c:274d:: with SMTP id 13mr30751217wmw.77.1607999089909;
        Mon, 14 Dec 2020 18:24:49 -0800 (PST)
Received: from [192.168.0.3] (hst-208-199.medicom.bg. [84.238.208.199])
        by smtp.googlemail.com with ESMTPSA id 89sm36734823wre.51.2020.12.14.18.24.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Dec 2020 18:24:49 -0800 (PST)
Subject: Re: [PATCH v4] venus: core: add support to dump FW region
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1607951031-12980-1-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <3afbf03a-50ec-9b00-d11b-574ce9c05bb3@linaro.org>
Date:   Tue, 15 Dec 2020 04:24:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1607951031-12980-1-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12/14/20 3:03 PM, Dikshita Agarwal wrote:
> Add support to dump video FW region during FW crash
> using devcoredump helpers.
> 
> Major changes since v1:
> - update the name of function (Stephen)
> - store start address and size in resource structure during
>   probe and reuse while dumping (Stephen, Stanimir)

The changes should go to ...

> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---

... here

>  drivers/media/platform/qcom/venus/core.c     | 31 ++++++++++++++++++++++++++++
>  drivers/media/platform/qcom/venus/core.h     |  2 ++
>  drivers/media/platform/qcom/venus/firmware.c |  3 +++
>  3 files changed, 36 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index bdd293f..2ddbd36 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -7,8 +7,10 @@
>  #include <linux/interconnect.h>
>  #include <linux/ioctl.h>
>  #include <linux/delay.h>
> +#include <linux/devcoredump.h>
>  #include <linux/list.h>
>  #include <linux/module.h>
> +#include <linux/of_address.h>

drop this leftover.

>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> @@ -22,6 +24,33 @@
>  #include "firmware.h"
>  #include "pm_helpers.h"
>  
> +static void venus_coredump(struct venus_core *core)
> +{
> +	struct device *dev;
> +	phys_addr_t mem_phys;
> +	size_t mem_size;
> +	void *mem_va;
> +	void *data;
> +
> +	dev = core->dev;
> +	mem_phys = core->fw.mem_phys;
> +	mem_size = core->fw.mem_size;
> +
> +	mem_va = memremap(mem_phys, mem_size, MEMREMAP_WC);
> +	if (!mem_va)
> +		return;
> +
> +	data = vmalloc(mem_size);
> +	if (!data) {
> +		memunmap(mem_va);
> +		return;
> +	}
> +
> +	memcpy(data, mem_va, mem_size);
> +	memunmap(mem_va);
> +	dev_coredumpv(dev, data, mem_size, GFP_KERNEL);
> +}
> +
>  static void venus_event_notify(struct venus_core *core, u32 event)
>  {
>  	struct venus_inst *inst;
> @@ -67,6 +96,8 @@ static void venus_sys_error_handler(struct work_struct *work)
>  
>  	venus_shutdown(core);
>  
> +	venus_coredump(core);
> +
>  	pm_runtime_put_sync(core->dev);
>  
>  	while (core->pmdomains[0] && pm_runtime_active(core->pmdomains[0]))
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 3a477fc..b37de95 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -178,6 +178,8 @@ struct venus_core {
>  		struct device *dev;
>  		struct iommu_domain *iommu_domain;
>  		size_t mapped_mem_size;
> +		phys_addr_t mem_phys;
> +		size_t mem_size;
>  	} fw;
>  	struct mutex lock;
>  	struct list_head instances;
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index d03e2dd..89defc2 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -201,6 +201,9 @@ int venus_boot(struct venus_core *core)
>  		return -EINVAL;
>  	}
>  
> +	core->fw.mem_size = mem_size;
> +	core->fw.mem_phys = mem_phys;
> +
>  	if (core->use_tz)
>  		ret = qcom_scm_pas_auth_and_reset(VENUS_PAS_ID);
>  	else
> 

With those fixes:

Reviewed-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

-- 
regards,
Stan
