Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30E4632CCDF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 07:33:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235217AbhCDGdE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 01:33:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235205AbhCDGch (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 01:32:37 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29CF0C061756
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Mar 2021 22:31:57 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id 18so3354285pfo.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Mar 2021 22:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZPkjLrse5nZxQb/JqEA22o9l0TlbC0XRCdLU57O44Aw=;
        b=yoe6xIf+7cWHyVtDPqxHr7L8/Gc+KA8RaCc5OnF8PijBvALiBskYnlrMhHouSThNoT
         9rtNQOuv0zfw2FDX+uS9G47jFN0f5sHiD0TbhOBs6fnetI/SCwRu0lI0u6D30IcDBHS5
         d2B7czUZ6zOY/TnlNQy3ONspHoqHcWs8oVEGbcsptHoIGlr1Qo6VuKj3T4XqUA9GELWV
         wAgZyZyjjDphJh+NRtUgOTB/j8BBvDqQKs19js9S0Qq5p4vpKFfCUydL7Uwh2MIHubTE
         ODwPJaHN4uKdpvmEe8c4GBEmkKscPSpQqyyfnqJyHohUitJXDZtmVXq1TN6sbHOMuhr7
         LVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZPkjLrse5nZxQb/JqEA22o9l0TlbC0XRCdLU57O44Aw=;
        b=XUASqlcOunaMpjXjo+uXSQIQlqayvn8ev3FInxqnAJEL/yvbOUzSxr7Wv6KUOty+km
         8zsgoj8YV4jtBWc1elgRnC4W+gcwwxpcJyMaT2MKAwOcJoBUbF8AM+o937zAO7orresG
         WmKrddQDNIGiV3ZdY4Ccmsc7dDPjqhsv9xGfYRCQDHjRi4jG4JvpR8fVT4Zu/vHZmWAO
         3WTz3ArPaOpyD2DTlPiPr1hZ1wLQloF7BsMUMOssK2AfsqV5rfJY4BeK/pXfeFIrnyaI
         QU9woUyjQK2thMfJxh5Ae/rH98gHg8dvkha07UR5IFNjtaXJEgU6SkfB9MULR9Z1qE/1
         pYbg==
X-Gm-Message-State: AOAM531K28XU7SNWaK4tQnMwR4iKtKv0lQzhoRk/zwLnN2I0BbiK9MtV
        84xFYtB3rkp64onJaXbzLHP9
X-Google-Smtp-Source: ABdhPJyqGZQHHSqaBjpoS07HWRuqLNlEP5R8xkPUWck9gLQqkFRP6cX9KCTLwtcB01Mmq8UfZa48mg==
X-Received: by 2002:a63:e84f:: with SMTP id a15mr2388408pgk.249.1614839516521;
        Wed, 03 Mar 2021 22:31:56 -0800 (PST)
Received: from thinkpad ([2409:4072:80b:705f:ce40:2a5f:bf1e:b205])
        by smtp.gmail.com with ESMTPSA id y9sm8890058pgc.9.2021.03.03.22.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 22:31:55 -0800 (PST)
Date:   Thu, 4 Mar 2021 12:01:49 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/6] mhi: pci_generic: Parametrable element count for
 events
Message-ID: <20210304063149.GA3363@thinkpad>
References: <1614615911-18794-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614615911-18794-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 01, 2021 at 05:25:06PM +0100, Loic Poulain wrote:
> Not all hardwares need to use the same number of event ring elements.
> This change makes this parametrable.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/pci_generic.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 8187fcf..c58bf96 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -71,9 +71,9 @@ struct mhi_pci_dev_info {
>  		.doorbell_mode_switch = false,		\
>  	}
>  
> -#define MHI_EVENT_CONFIG_CTRL(ev_ring)		\
> +#define MHI_EVENT_CONFIG_CTRL(ev_ring, el_count) \
>  	{					\
> -		.num_elements = 64,		\
> +		.num_elements = el_count,	\
>  		.irq_moderation_ms = 0,		\
>  		.irq = (ev_ring) + 1,		\
>  		.priority = 1,			\
> @@ -114,9 +114,9 @@ struct mhi_pci_dev_info {
>  		.doorbell_mode_switch = true,		\
>  	}
>  
> -#define MHI_EVENT_CONFIG_DATA(ev_ring)		\
> +#define MHI_EVENT_CONFIG_DATA(ev_ring, el_count) \
>  	{					\
> -		.num_elements = 128,		\
> +		.num_elements = el_count,	\
>  		.irq_moderation_ms = 5,		\
>  		.irq = (ev_ring) + 1,		\
>  		.priority = 1,			\
> @@ -127,9 +127,9 @@ struct mhi_pci_dev_info {
>  		.offload_channel = false,	\
>  	}
>  
> -#define MHI_EVENT_CONFIG_HW_DATA(ev_ring, ch_num) \
> +#define MHI_EVENT_CONFIG_HW_DATA(ev_ring, el_count, ch_num) \
>  	{					\
> -		.num_elements = 2048,		\
> +		.num_elements = el_count,	\
>  		.irq_moderation_ms = 1,		\
>  		.irq = (ev_ring) + 1,		\
>  		.priority = 1,			\
> @@ -156,12 +156,12 @@ static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
>  
>  static struct mhi_event_config modem_qcom_v1_mhi_events[] = {
>  	/* first ring is control+data ring */
> -	MHI_EVENT_CONFIG_CTRL(0),
> +	MHI_EVENT_CONFIG_CTRL(0, 64),
>  	/* DIAG dedicated event ring */
> -	MHI_EVENT_CONFIG_DATA(1),
> +	MHI_EVENT_CONFIG_DATA(1, 128),
>  	/* Hardware channels request dedicated hardware event rings */
> -	MHI_EVENT_CONFIG_HW_DATA(2, 100),
> -	MHI_EVENT_CONFIG_HW_DATA(3, 101)
> +	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> +	MHI_EVENT_CONFIG_HW_DATA(3, 2048, 101)
>  };
>  
>  static struct mhi_controller_config modem_qcom_v1_mhiv_config = {
> -- 
> 2.7.4
> 
