Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C04B2E7E91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Dec 2020 08:21:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgLaHVE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Dec 2020 02:21:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgLaHVE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Dec 2020 02:21:04 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A3BC061573
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Dec 2020 23:20:24 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id s15so9699875plr.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Dec 2020 23:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ISdbLG4nq24VintEJ5luLLUJ5326y7kRJNskzTXkHC8=;
        b=Of8U87fukqYMZ05XGU1dBCqkSYN2NQiH1NqCbw8SN/h5RdvkMmorMwl5rrmO9QSeV3
         xIJU2rlDsx4tm5JX6FPEzbIaogCFDdT4+ReW/LJ2GhYqAJDWnndk13WLb3ClhTejcpbr
         0dpE4EiRkTQcKd2WjICnVKD4p1C1WwvnG3R/cPKgKrldUL7jSPPoHX/ltuI1PwAuiqwT
         6lsvOzyNpqNNoD7WzNUHlwgHa1Uq6iup48DDlgFT6gMc0elQYzA9XapwK/6246SjBD0E
         2BCR1eup5dtCJmX9N/KUb/r8O4HWjsIxsqM0LDBLI+r8IJEtsCTYg1eYp5s/uCYDvuQJ
         W4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ISdbLG4nq24VintEJ5luLLUJ5326y7kRJNskzTXkHC8=;
        b=jMi3xbuwHjOGqGx+sO1pKCMpiXuxCaG5IcJgrtljRErxaUYtbfbhHT8p1Z/a2o/w/n
         D1YZoMb2yXEtfOJBOULBBySAHSc75FwM9gsDjUvVLcfTVhgDh+gydcEWUMqULyQJV9Aw
         +Ili0g/8uqgp4U+zqZTPgGbnHMPK9Ksr+tQM2JoAEDc5w1nwBVzIX80JCevTtqOkzniw
         sGyl8v7RDVnHMFqBvluRrYwIuTGcNZ2e3Ev/02llKeBU5Pe60nM/MEy/48Z3L/bP1Eqq
         geFb0KsUvkFtlzVCznWBsfDGR4zWa5qcckFqE+Pdw+JmZMnFDerYdYyqtNRddAXFqG7z
         B7Vw==
X-Gm-Message-State: AOAM5306cp60xryK7MkHfBdvTFv5fKVHW1kFVf2PtdpP587vxxWaAkGA
        tJW8aOHTioFg1wgDEaz9AKlA
X-Google-Smtp-Source: ABdhPJwdeCK3wMz8u3LpJD4W00xd4tc75nOhkc1+iouGLbqIjdGCUTqxw3HgHN3y2IyjwzMfabcV5A==
X-Received: by 2002:a17:90a:300c:: with SMTP id g12mr12297529pjb.4.1609399223600;
        Wed, 30 Dec 2020 23:20:23 -0800 (PST)
Received: from thinkpad ([2409:4072:6d1f:be3b:71a9:d2bf:a32d:897d])
        by smtp.gmail.com with ESMTPSA id d4sm9344217pjz.28.2020.12.30.23.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 23:20:23 -0800 (PST)
Date:   Thu, 31 Dec 2020 12:50:17 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org
Subject: Re: [PATCH v6 10/10] mhi: pci_generic: Add diag channels
Message-ID: <20201231072017.GD7345@thinkpad>
References: <1609231431-10048-1-git-send-email-loic.poulain@linaro.org>
 <1609231431-10048-11-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1609231431-10048-11-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 29, 2020 at 09:43:51AM +0100, Loic Poulain wrote:
> Add support for Diag over MHI. Qualcomm Diag is the qualcomm
> diagnostics interface that can be used to collect modem logs,
> events, traces, etc. It can be used by tools such QPST or QXDM.
> 
> This patch adds the DIAG channels and a dedicated event ring.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by Hemant Kumar <hemantk@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/pci_generic.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index d4ad9c5..0947596 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -142,22 +142,26 @@ struct mhi_pci_dev_info {
>  	}
>  
>  static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
> +	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 16, 1),
> +	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 16, 1),
>  	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 4, 0),
>  	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 4, 0),
>  	MHI_CHANNEL_CONFIG_UL(14, "QMI", 4, 0),
>  	MHI_CHANNEL_CONFIG_DL(15, "QMI", 4, 0),
>  	MHI_CHANNEL_CONFIG_UL(20, "IPCR", 8, 0),
>  	MHI_CHANNEL_CONFIG_DL(21, "IPCR", 8, 0),
> -	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 1),
> -	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 2),
> +	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
> +	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
>  };
>  
>  static const struct mhi_event_config modem_qcom_v1_mhi_events[] = {
>  	/* first ring is control+data ring */
>  	MHI_EVENT_CONFIG_CTRL(0),
> +	/* DIAG dedicated event ring */
> +	MHI_EVENT_CONFIG_DATA(1),
>  	/* Hardware channels request dedicated hardware event rings */
> -	MHI_EVENT_CONFIG_HW_DATA(1, 100),
> -	MHI_EVENT_CONFIG_HW_DATA(2, 101)
> +	MHI_EVENT_CONFIG_HW_DATA(2, 100),
> +	MHI_EVENT_CONFIG_HW_DATA(3, 101)
>  };
>  
>  static const struct mhi_controller_config modem_qcom_v1_mhiv_config = {
> -- 
> 2.7.4
> 
