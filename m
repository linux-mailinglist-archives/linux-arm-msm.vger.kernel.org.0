Return-Path: <linux-arm-msm+bounces-3585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EC4807751
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 19:09:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D75A1B20D99
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 18:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 746166E2DA;
	Wed,  6 Dec 2023 18:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U5VOsH6O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DEC1D4B
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 10:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701886169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JuqiBkPwlY2HXqxQqL3cC1VexkgQjNgO5uHmyoXbHn4=;
	b=U5VOsH6O3LkkTuxfHmXLRzY+OvelecbYqra1HFdVjMaqn/oKcMyU0cgWmuCa1Om2cmoAzI
	SUzxcBmr32uIo64nAL18vsck4B17NN3YatruhzocRrhDJorA89jyFQkkZMDX3zLgXbDjbi
	PzTSH0D259s8mbLtLLyn8Lmu9vYxUxM=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-I2fboLgBP-G910d2CrcJng-1; Wed, 06 Dec 2023 13:08:45 -0500
X-MC-Unique: I2fboLgBP-G910d2CrcJng-1
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-58794776af4so18131eaf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Dec 2023 10:08:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701886122; x=1702490922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuqiBkPwlY2HXqxQqL3cC1VexkgQjNgO5uHmyoXbHn4=;
        b=TphOfLsUjTdAFw0+udEifkZSUY5Q5eZbfMe8mErHhgesUckJUW4wLLHAPXQAVWa5ba
         2hXGaZBfEwnN8gy/7lMLhtGYKlk30eF6lOnSTVxsLHk5zyGJbCIM4cnAHnCJIIqcOmZM
         03vvh+2XJGYR0zuK2nW0wUz0GrbrcIfpcEv1rm9HRoVgpLGgJRZhIv8m/PqKwitO+Vnr
         1oQHx0xvfIox7QbbggoXhkpeV45o/joLBoZRVhHnBJ41NxmWa7MInBAWJSuN3C/MoTsv
         e2ibRgB6vJQN4QknsGjlpSXzlSdUFXOUEdr0mp0nw5/NkJalIm1ikEyFUOlbKKLmemhj
         5ddQ==
X-Gm-Message-State: AOJu0Yy1V4133JyPqH9Kr8FYHxwORycilhF09QttxlxjXUrZf/rcOfnd
	pzGbU++HlEvWVp9xSnPwrYfm2ZvYKmoD/+BlbOT4KCEHDpZQJYDQJ1C5eobdkc2vLoSdPPDsYFD
	9MtRdYzmvlbULBHg8mEhB1SlfiQ==
X-Received: by 2002:a05:6358:7504:b0:170:61c5:f2fa with SMTP id k4-20020a056358750400b0017061c5f2famr2084889rwg.38.1701886122014;
        Wed, 06 Dec 2023 10:08:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGamHCenfAZjFP5rNg+1b4/YYFi/5d47GeOh3mst5VBZPXsGpbtxdzeGEy3IORSvuG0nzWYNQ==
X-Received: by 2002:a05:6358:7504:b0:170:61c5:f2fa with SMTP id k4-20020a056358750400b0017061c5f2famr2084860rwg.38.1701886121566;
        Wed, 06 Dec 2023 10:08:41 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::47])
        by smtp.gmail.com with ESMTPSA id qz22-20020a05620a8c1600b0077d71d46887sm129645qkn.112.2023.12.06.10.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 10:08:41 -0800 (PST)
Date: Wed, 6 Dec 2023 12:08:38 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: martin.petersen@oracle.com, jejb@linux.ibm.com, andersson@kernel.org, 
	konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_cang@quicinc.com
Subject: Re: [PATCH 01/13] scsi: ufs: qcom: Use clk_bulk APIs for managing
 lane clocks
Message-ID: <d4sk5x5fh2vwkyxxis47ujv5opwkr57yuaymfq7zacofk6byb6@77f6izcb3juo>
References: <20231201151417.65500-1-manivannan.sadhasivam@linaro.org>
 <20231201151417.65500-2-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201151417.65500-2-manivannan.sadhasivam@linaro.org>

On Fri, Dec 01, 2023 at 08:44:05PM +0530, Manivannan Sadhasivam wrote:
> Lane clock handling can be simplified by using the clk_bulk APIs. So let's
> make use of them. This also get's rid of the clock validation in the driver
> as kernel should just rely on the firmware (DT/ACPI) to provide the clocks
> required for proper functioning.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  drivers/ufs/host/ufs-qcom.c | 94 ++-----------------------------------
>  drivers/ufs/host/ufs-qcom.h |  6 +--
>  2 files changed, 7 insertions(+), 93 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 96cb8b5b4e66..cbb6a696cd97 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -194,52 +194,12 @@ static inline int ufs_qcom_ice_suspend(struct ufs_qcom_host *host)
>  }
>  #endif
>  
> -static int ufs_qcom_host_clk_get(struct device *dev,
> -		const char *name, struct clk **clk_out, bool optional)
> -{
> -	struct clk *clk;
> -	int err = 0;
> -
> -	clk = devm_clk_get(dev, name);
> -	if (!IS_ERR(clk)) {
> -		*clk_out = clk;
> -		return 0;
> -	}
> -
> -	err = PTR_ERR(clk);
> -
> -	if (optional && err == -ENOENT) {
> -		*clk_out = NULL;
> -		return 0;
> -	}
> -
> -	if (err != -EPROBE_DEFER)
> -		dev_err(dev, "failed to get %s err %d\n", name, err);
> -
> -	return err;
> -}
> -
> -static int ufs_qcom_host_clk_enable(struct device *dev,
> -		const char *name, struct clk *clk)
> -{
> -	int err = 0;
> -
> -	err = clk_prepare_enable(clk);
> -	if (err)
> -		dev_err(dev, "%s: %s enable failed %d\n", __func__, name, err);
> -
> -	return err;
> -}
> -
>  static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
>  {
>  	if (!host->is_lane_clks_enabled)
>  		return;
>  
> -	clk_disable_unprepare(host->tx_l1_sync_clk);
> -	clk_disable_unprepare(host->tx_l0_sync_clk);
> -	clk_disable_unprepare(host->rx_l1_sync_clk);
> -	clk_disable_unprepare(host->rx_l0_sync_clk);
> +	clk_bulk_disable_unprepare(host->num_clks, host->clks);
>  
>  	host->is_lane_clks_enabled = false;
>  }
> @@ -247,43 +207,14 @@ static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
>  static int ufs_qcom_enable_lane_clks(struct ufs_qcom_host *host)
>  {
>  	int err;
> -	struct device *dev = host->hba->dev;
> -
> -	if (host->is_lane_clks_enabled)
> -		return 0;
>  
> -	err = ufs_qcom_host_clk_enable(dev, "rx_lane0_sync_clk",
> -		host->rx_l0_sync_clk);
> +	err = clk_bulk_prepare_enable(host->num_clks, host->clks);
>  	if (err)
>  		return err;
>  
> -	err = ufs_qcom_host_clk_enable(dev, "tx_lane0_sync_clk",
> -		host->tx_l0_sync_clk);
> -	if (err)
> -		goto disable_rx_l0;
> -
> -	err = ufs_qcom_host_clk_enable(dev, "rx_lane1_sync_clk",
> -			host->rx_l1_sync_clk);
> -	if (err)
> -		goto disable_tx_l0;
> -
> -	err = ufs_qcom_host_clk_enable(dev, "tx_lane1_sync_clk",
> -			host->tx_l1_sync_clk);
> -	if (err)
> -		goto disable_rx_l1;
> -
>  	host->is_lane_clks_enabled = true;
>  
>  	return 0;
> -
> -disable_rx_l1:
> -	clk_disable_unprepare(host->rx_l1_sync_clk);
> -disable_tx_l0:
> -	clk_disable_unprepare(host->tx_l0_sync_clk);
> -disable_rx_l0:
> -	clk_disable_unprepare(host->rx_l0_sync_clk);
> -
> -	return err;
>  }
>  
>  static int ufs_qcom_init_lane_clks(struct ufs_qcom_host *host)
> @@ -294,26 +225,11 @@ static int ufs_qcom_init_lane_clks(struct ufs_qcom_host *host)
>  	if (has_acpi_companion(dev))
>  		return 0;
>  
> -	err = ufs_qcom_host_clk_get(dev, "rx_lane0_sync_clk",
> -					&host->rx_l0_sync_clk, false);
> -	if (err)
> -		return err;
> -
> -	err = ufs_qcom_host_clk_get(dev, "tx_lane0_sync_clk",
> -					&host->tx_l0_sync_clk, false);
> -	if (err)
> +	err = devm_clk_bulk_get_all(dev, &host->clks);
> +	if (err <= 0)
>  		return err;
>  
> -	/* In case of single lane per direction, don't read lane1 clocks */
> -	if (host->hba->lanes_per_direction > 1) {
> -		err = ufs_qcom_host_clk_get(dev, "rx_lane1_sync_clk",
> -			&host->rx_l1_sync_clk, false);
> -		if (err)
> -			return err;
> -
> -		err = ufs_qcom_host_clk_get(dev, "tx_lane1_sync_clk",
> -			&host->tx_l1_sync_clk, true);
> -	}
> +	host->num_clks = err;
>  
>  	return 0;
>  }
> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
> index 9950a0089475..e2df4c528a2a 100644
> --- a/drivers/ufs/host/ufs-qcom.h
> +++ b/drivers/ufs/host/ufs-qcom.h
> @@ -213,10 +213,8 @@ struct ufs_qcom_host {
>  	struct phy *generic_phy;
>  	struct ufs_hba *hba;
>  	struct ufs_pa_layer_attr dev_req_params;
> -	struct clk *rx_l0_sync_clk;
> -	struct clk *tx_l0_sync_clk;
> -	struct clk *rx_l1_sync_clk;
> -	struct clk *tx_l1_sync_clk;
> +	struct clk_bulk_data *clks;
> +	u32 num_clks;
>  	bool is_lane_clks_enabled;
>  
>  	struct icc_path *icc_ddr;
> -- 
> 2.25.1
> 
> 


