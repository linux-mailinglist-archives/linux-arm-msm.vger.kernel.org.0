Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E224247640
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Jun 2019 19:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbfFPRyM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Jun 2019 13:54:12 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44629 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbfFPRyL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Jun 2019 13:54:11 -0400
Received: by mail-pl1-f193.google.com with SMTP id t7so3109349plr.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Jun 2019 10:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wy1KsC4Y/RgWZPFrZ2Hd5UaYP8LamPj+HBAbNFeIOjY=;
        b=Cm5565RTIsJjcThQqKiwjeRQK2Yep+3F219oHN8NgIJ+HrhgDxyhq66mwveoPBD556
         1EvtqpebGZgsymTVo//lKbGF7QO2eEgwZ1DB/LTIu7NXjo1C/zki36YskHKGsoQrtxx9
         ZtACaEonUoI5UHj4gjJ2ERxPmDYZ+r5L5+s/mfqetdJBn1Ov8uw12N3GzWkpm8TncNbf
         +iSMr2MAnrhy/BQ+X81ReJRUSJo2V9z8EWQm4i6VbnCdZNv5Lr0wWU01fY8EhFLZDkZn
         8DO6HgZnl5MDmPYcBpJq7/U1vgps6CK3YR260mcOVes++FviXEzOTplE82J4tfVZ13LD
         uJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wy1KsC4Y/RgWZPFrZ2Hd5UaYP8LamPj+HBAbNFeIOjY=;
        b=AUh4ES637zpNJYKbISMZucQpWe9egAsAK9SY8d/jD1IlkMwpA17rEjAaYVOWv+AxQy
         8D2aP5SyP/Q71/yPSMw4DhmQ5VZqci3Imyhelb+FbJaaswW55oCI9dNE3qYTujbStQwW
         CA3QoOHs4Bqz7ismN4LP9NcucodHSTNLtoLnzuTgAbGpgUWLCkDWzZrVrNLKOhST5VRB
         ssgUWiVBHhI69jIwuNFXtmBxDoCXQyq37Ohd1uXjDO1sknzQxpgmnsm/L6aFN4hrKDXH
         td6fjIlzLSQgTXuKOsDSiRQ/ihqXuBR3rupYtr4oUiRInNVDvT4vpVyeQndaxJhoi2eT
         VCUw==
X-Gm-Message-State: APjAAAWDdSKN0LCW65gWTVja0T+dzCtLuK5tvsT2bKN6TcqWw6AmgKbm
        1NzcDgsNxjhhBScYLSWHBPNgBQ==
X-Google-Smtp-Source: APXvYqwc7dLKgyqwnNaB+k5ZzpCqLYIMS9wGS0zEyU4IMRufrbh0yK6BfrKsA/IqrSs0nKzrXK3ISA==
X-Received: by 2002:a17:902:a412:: with SMTP id p18mr36511043plq.105.1560707650483;
        Sun, 16 Jun 2019 10:54:10 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f88sm15832701pjg.5.2019.06.16.10.54.09
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 16 Jun 2019 10:54:10 -0700 (PDT)
Date:   Sun, 16 Jun 2019 10:54:57 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     agross@kernel.org, david.brown@linaro.org, robdclark@gmail.com,
        sean@poorly.run, robh+dt@kernel.org, airlied@linux.ie,
        daniel@ffwll.ch, mark.rutland@arm.com, jonathan@marek.ca,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 4/6] firmware: qcom: scm: add OCMEM lock/unlock interface
Message-ID: <20190616175457.GR22737@tuxbook-pro>
References: <20190616132930.6942-1-masneyb@onstation.org>
 <20190616132930.6942-5-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190616132930.6942-5-masneyb@onstation.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 16 Jun 06:29 PDT 2019, Brian Masney wrote:

> From: Rob Clark <robdclark@gmail.com>
> 
> Add support for the OCMEM lock/unlock interface that is needed by the
> On Chip MEMory (OCMEM) that is present on some Snapdragon devices.
> 
> Signed-off-by: Rob Clark <robdclark@gmail.com>
> [masneyb@onstation.org: ported to latest kernel; minor reformatting.]
> Signed-off-by: Brian Masney <masneyb@onstation.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
> Rob's last version of this patch:
> https://patchwork.kernel.org/patch/7340711/
> 
>  drivers/firmware/qcom_scm-32.c | 35 +++++++++++++++++++++++++++++
>  drivers/firmware/qcom_scm-64.c | 12 ++++++++++
>  drivers/firmware/qcom_scm.c    | 40 ++++++++++++++++++++++++++++++++++
>  drivers/firmware/qcom_scm.h    |  9 ++++++++
>  include/linux/qcom_scm.h       | 15 +++++++++++++
>  5 files changed, 111 insertions(+)
> 
> diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
> index 089b47124933..0100c82b9c00 100644
> --- a/drivers/firmware/qcom_scm-32.c
> +++ b/drivers/firmware/qcom_scm-32.c
> @@ -463,6 +463,41 @@ int __qcom_scm_restore_sec_config(struct device *dev, u32 sec_id,
>  	return 0;
>  }
>  
> +int __qcom_scm_ocmem_lock(struct device *dev, u32 id, u32 offset, u32 size,
> +			  u32 mode)
> +{
> +	struct ocmem_tz_lock {
> +		__le32 id;
> +		__le32 offset;
> +		__le32 size;
> +		__le32 mode;
> +	} request;
> +
> +	request.id = cpu_to_le32(id);
> +	request.offset = cpu_to_le32(offset);
> +	request.size = cpu_to_le32(size);
> +	request.mode = cpu_to_le32(mode);
> +
> +	return qcom_scm_call(dev, QCOM_SCM_OCMEM_SVC, QCOM_SCM_OCMEM_LOCK_CMD,
> +			     &request, sizeof(request), NULL, 0);
> +}
> +
> +int __qcom_scm_ocmem_unlock(struct device *dev, u32 id, u32 offset, u32 size)
> +{
> +	struct ocmem_tz_unlock {
> +		__le32 id;
> +		__le32 offset;
> +		__le32 size;
> +	} request;
> +
> +	request.id = cpu_to_le32(id);
> +	request.offset = cpu_to_le32(offset);
> +	request.size = cpu_to_le32(size);
> +
> +	return qcom_scm_call(dev, QCOM_SCM_OCMEM_SVC, QCOM_SCM_OCMEM_UNLOCK_CMD,
> +			     &request, sizeof(request), NULL, 0);
> +}
> +
>  void __qcom_scm_init(void)
>  {
>  }
> diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
> index b6b78da7f9c9..2674d6d3cdde 100644
> --- a/drivers/firmware/qcom_scm-64.c
> +++ b/drivers/firmware/qcom_scm-64.c
> @@ -247,6 +247,18 @@ int __qcom_scm_restore_sec_config(struct device *dev, u32 sec_id,
>  	return -ENOTSUPP;
>  }
>  
> +int __qcom_scm_ocmem_lock(struct device *dev, uint32_t id, uint32_t offset,
> +			  uint32_t size, uint32_t mode)
> +{
> +	return -ENOTSUPP;
> +}
> +
> +int __qcom_scm_ocmem_unlock(struct device *dev, uint32_t id, uint32_t offset,
> +			    uint32_t size)
> +{
> +	return -ENOTSUPP;
> +}
> +
>  void __qcom_scm_init(void)
>  {
>  	u64 cmd;
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index 5495ef994c5d..85afb54defd4 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -193,6 +193,46 @@ int qcom_scm_restore_sec_config(struct device *dev,
>  }
>  EXPORT_SYMBOL(qcom_scm_restore_sec_config);
>  
> +/**
> + * qcom_scm_ocmem_lock_available() - is OCMEM lock/unlock interface available
> + */
> +bool qcom_scm_ocmem_lock_available(void)
> +{
> +	return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_OCMEM_SVC,
> +					    QCOM_SCM_OCMEM_LOCK_CMD);
> +}
> +EXPORT_SYMBOL(qcom_scm_ocmem_lock_available);
> +
> +/**
> + * qcom_scm_ocmem_lock() - call OCMEM lock interface to assign an OCMEM
> + * region to the specified initiator
> + *
> + * @id:     tz initiator id
> + * @offset: OCMEM offset
> + * @size:   OCMEM size
> + * @mode:   access mode (WIDE/NARROW)
> + */
> +int qcom_scm_ocmem_lock(enum qcom_scm_ocmem_client id, u32 offset, u32 size,
> +			u32 mode)
> +{
> +	return __qcom_scm_ocmem_lock(__scm->dev, id, offset, size, mode);
> +}
> +EXPORT_SYMBOL(qcom_scm_ocmem_lock);
> +
> +/**
> + * qcom_scm_ocmem_unlock() - call OCMEM unlock interface to release an OCMEM
> + * region from the specified initiator
> + *
> + * @id:     tz initiator id
> + * @offset: OCMEM offset
> + * @size:   OCMEM size
> + */
> +int qcom_scm_ocmem_unlock(enum qcom_scm_ocmem_client id, u32 offset, u32 size)
> +{
> +	return __qcom_scm_ocmem_unlock(__scm->dev, id, offset, size);
> +}
> +EXPORT_SYMBOL(qcom_scm_ocmem_unlock);
> +
>  /**
>   * qcom_scm_pas_supported() - Check if the peripheral authentication service is
>   *			      available for the given peripherial
> diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
> index bccc7d10c5c2..387e3c4e33c5 100644
> --- a/drivers/firmware/qcom_scm.h
> +++ b/drivers/firmware/qcom_scm.h
> @@ -48,6 +48,15 @@ extern void __qcom_scm_init(void);
>  extern int __qcom_scm_restore_sec_config(struct device *dev, u32 sec_id,
>  					 u32 ctx_bank_num);
>  
> +#define QCOM_SCM_OCMEM_SVC			0xf
> +#define QCOM_SCM_OCMEM_LOCK_CMD		0x1
> +#define QCOM_SCM_OCMEM_UNLOCK_CMD		0x2
> +
> +extern int __qcom_scm_ocmem_lock(struct device *dev, u32 id, u32 offset,
> +				 u32 size, u32 mode);
> +extern int __qcom_scm_ocmem_unlock(struct device *dev, u32 id, u32 offset,
> +				   u32 size);
> +
>  #define QCOM_SCM_SVC_PIL		0x2
>  #define QCOM_SCM_PAS_INIT_IMAGE_CMD	0x1
>  #define QCOM_SCM_PAS_MEM_SETUP_CMD	0x2
> diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
> index b5c0afaca955..977c01aa524a 100644
> --- a/include/linux/qcom_scm.h
> +++ b/include/linux/qcom_scm.h
> @@ -34,6 +34,16 @@ enum qcom_scm_sec_dev_id {
>  	QCOM_SCM_ICE_DEV_ID	= 20,
>  };
>  
> +enum qcom_scm_ocmem_client {
> +	QCOM_SCM_OCMEM_UNUSED_ID = 0x0,
> +	QCOM_SCM_OCMEM_GRAPHICS_ID,
> +	QCOM_SCM_OCMEM_VIDEO_ID,
> +	QCOM_SCM_OCMEM_LP_AUDIO_ID,
> +	QCOM_SCM_OCMEM_SENSORS_ID,
> +	QCOM_SCM_OCMEM_OTHER_OS_ID,
> +	QCOM_SCM_OCMEM_DEBUG_ID,
> +};
> +
>  #define QCOM_SCM_VMID_HLOS       0x3
>  #define QCOM_SCM_VMID_MSS_MSA    0xF
>  #define QCOM_SCM_VMID_WLAN       0x18
> @@ -54,6 +64,11 @@ extern int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt,
>  extern bool qcom_scm_restore_sec_config_available(void);
>  extern int qcom_scm_restore_sec_config(struct device *dev,
>  				       enum qcom_scm_sec_dev_id sec_id);
> +extern bool qcom_scm_ocmem_lock_available(void);
> +extern int qcom_scm_ocmem_lock(enum qcom_scm_ocmem_client id, u32 offset,
> +			       u32 size, u32 mode);
> +extern int qcom_scm_ocmem_unlock(enum qcom_scm_ocmem_client id, u32 offset,
> +				 u32 size);
>  extern bool qcom_scm_pas_supported(u32 peripheral);
>  extern int qcom_scm_pas_init_image(u32 peripheral, const void *metadata,
>  				   size_t size);
> -- 
> 2.20.1
> 
