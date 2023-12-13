Return-Path: <linux-arm-msm+bounces-4546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9191811AAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 18:17:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB5531C21108
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 17:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918133AC26;
	Wed, 13 Dec 2023 17:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SHHFgJxa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38DC1D0
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 09:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702487844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=frOrOI5WAQiyU9228XLtrpRqeqKgVIZTf5EBEg5217c=;
	b=SHHFgJxaxKhAOP0mtcFF0J44rChU7BymT6io2wPm9fDrf/XG6k9YvzWBhMr8q9Vbh1d7dQ
	Uh6Zpeo3Xij2XuY47X9uthW17NVBSh1BxhQ81Wnbdvs7tOS41hZJwCUxGcW9ajpkNTM9Xd
	3yhaa9aRVY1dQAiHrObQJaxH9msEfaU=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-RBps1JIKMDSWt1UPSQ8ipA-1; Wed, 13 Dec 2023 12:17:22 -0500
X-MC-Unique: RBps1JIKMDSWt1UPSQ8ipA-1
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3b9f55676a1so7908945b6e.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 09:17:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702487841; x=1703092641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frOrOI5WAQiyU9228XLtrpRqeqKgVIZTf5EBEg5217c=;
        b=s+I9JExXT6YPGRexGoey3/Fg+aWlvhVkcC9DnPNuhp/tKXQ3NjOgAtSKc6lKHpaQ7d
         nEjpw+ijlsFrtcmN/+jFrA/75MdwflmZ9VpynA6L0Wb0XLYlqVhJLtJk/DRmVS7KYX0U
         FvFY0zqiEWyTva/HBeN9VvEIZI1tCvfaz4eolfM12KE2Wa0ZmQpvqJ5OSF8n0F3xgoVq
         7joI61fFc2149q1oB4nrpBxSp/KVTFnypBcLe1A6vuLSgFZSvrBQnfK2OFYAWkDJx5Lh
         jhJbRYYPJ6C6TWqS1+lYbmXNVDSTxAQFyeyIzgUK21o/CnuNtnGoI4T0PizHzTw0VEXG
         AItw==
X-Gm-Message-State: AOJu0Yy2li+A1JiPcEQI0wvafyybNUFyhWu3heKx2XcHn8IE9dEa1DXR
	qz/J+PSJ+OK2X5OQ0kOfX6hNjdROXWHs8nLols7vdU+RoruMY1k/w7qPMoRhvEbZVdUJ6jwPZnm
	JDBjCp+F8CVlxupv9IJFGt3iJ2A==
X-Received: by 2002:a05:6359:4598:b0:170:6ba9:9dac with SMTP id no24-20020a056359459800b001706ba99dacmr12053186rwb.61.1702487841653;
        Wed, 13 Dec 2023 09:17:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFADA7jsklnaZq66yXeVA6CYLawBi0nKvUeaKPssY3KL03nLX9krv923Z/0+HWBTZbiVQpBtg==
X-Received: by 2002:a05:6359:4598:b0:170:6ba9:9dac with SMTP id no24-20020a056359459800b001706ba99dacmr12053164rwb.61.1702487841313;
        Wed, 13 Dec 2023 09:17:21 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id dy7-20020ad44e87000000b0067aa05449cesm5217475qvb.3.2023.12.13.09.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 09:17:20 -0800 (PST)
Date: Wed, 13 Dec 2023 11:17:18 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Chanwoo Lee <cw9316.lee@samsung.com>
Cc: mani@kernel.org, agross@kernel.org, andersson@kernel.org, 
	konrad.dybcio@linaro.org, jejb@linux.ibm.com, martin.petersen@oracle.com, 
	p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, grant.jung@samsung.com, jt77.jang@samsung.com, 
	dh0421.hwang@samsung.com, sh043.lee@samsung.com
Subject: Re: [PATCH] scsi: ufs: qcom: Re-fix for error handling
Message-ID: <m5wjp3yb3qpheyzgipekeagycboifqdpw54nquzqsftufap3yc@kxjwi4y63adj>
References: <CGME20231213022525epcas1p219483a7572a12394c5852cd53a367da4@epcas1p2.samsung.com>
 <20231213022500.9011-1-cw9316.lee@samsung.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213022500.9011-1-cw9316.lee@samsung.com>

On Wed, Dec 13, 2023 at 11:25:00AM +0900, Chanwoo Lee wrote:
> From: ChanWoo Lee <cw9316.lee@samsung.com>
> 
> I modified the code to handle errors.
> 
> The error handling code has been changed from the patch below.
> -'commit 031312dbc695 ("scsi: ufs: ufs-qcom: Remove unnecessary goto statements")'
> 
> What I have confirmed are three cases.
> 1) ufs_qcom_host_reset -> 'reset_control_deassert' error -> return 0;
> 2) ufs_qcom_clk_scale_notify -> 'ufs_qcom_clk_scale_up_/down_pre_change' error -> return 0;
> 3) ufs_qcom_init_lane_clks -> 'ufs_qcom_host_clk_get(tx_lane1_sync_clk)' error -> return 0;
> 
> It is unknown whether the above commit was intended to change error handling.
> However, if it is not an intended fix, a patch may be needed.

I think you're right, these were not intentionally changed. There's a
patch series in flight right now that cleans up some of this driver and
inadvertently tackles some of the problems below.

> 
> Signed-off-by: ChanWoo Lee <cw9316.lee@samsung.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 96cb8b5b4e66..8a93d93ab08f 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -313,6 +313,8 @@ static int ufs_qcom_init_lane_clks(struct ufs_qcom_host *host)
>  
>  		err = ufs_qcom_host_clk_get(dev, "tx_lane1_sync_clk",
>  			&host->tx_l1_sync_clk, true);
> +		if (err)
> +			return err;

This patch cleans this up: https://lore.kernel.org/linux-arm-msm/20231208065902.11006-2-manivannan.sadhasivam@linaro.org/

>  	}
>  
>  	return 0;
> @@ -404,9 +406,11 @@ static int ufs_qcom_host_reset(struct ufs_hba *hba)
>  	usleep_range(200, 210);
>  
>  	ret = reset_control_deassert(host->core_reset);
> -	if (ret)
> +	if (ret) {
>  		dev_err(hba->dev, "%s: core_reset deassert failed, err = %d\n",
>  				 __func__, ret);
> +		return ret;
> +	}

This patch cleans this up: https://lore.kernel.org/linux-arm-msm/20231208065902.11006-8-manivannan.sadhasivam@linaro.org/#t

>  
>  	usleep_range(1000, 1100);
>  
> @@ -415,7 +419,7 @@ static int ufs_qcom_host_reset(struct ufs_hba *hba)
>  		hba->is_irq_enabled = true;
>  	}
>  
> -	return 0;
> +	return ret;

If I'm reading right returning ret is pointless here with your change
above (it already returns ret, and it is no longer updated right so the
only possible value here is 0?

>  }
>  
>  static u32 ufs_qcom_get_hs_gear(struct ufs_hba *hba)
> @@ -1535,7 +1539,7 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba,
>  		ufshcd_uic_hibern8_exit(hba);
>  	}
>  
> -	return 0;
> +	return err;
>  }

I think you could move this one up into the PRE_CHANGE block and leave
return 0 here? I believe this is the only case not yet covered by the
patch series I linked. Good catch!

>  
>  static void ufs_qcom_enable_test_bus(struct ufs_qcom_host *host)
> -- 
> 2.29.0
> 
> 


