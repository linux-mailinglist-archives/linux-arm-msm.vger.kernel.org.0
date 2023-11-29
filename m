Return-Path: <linux-arm-msm+bounces-2579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A75297FE01B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 20:04:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1218AB20B3A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 19:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96C6374C8;
	Wed, 29 Nov 2023 19:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AKiTmEk7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92E7910C3
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 11:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701284678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UGclDzu+lySOVYdka+aJpRVC+wxtGJIKs0Loae/8ctc=;
	b=AKiTmEk7wwXo4dAQ8TlYFkrtOEjDsYEaeCBSNeHaIJDtf08hr1/ftkHsog+zcj459qSet2
	SYL5s3Y7DIWSIeoxYU31kKjfaxv1WGAkc+9jShhA+VT9zR9ZviLI58AmIdpL5AK9W48oF6
	CI3kiUCQTp/EvIxdTa34ckGMh00XnRE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-Op1zUCQrM-2WdOGvKH_JOA-1; Wed, 29 Nov 2023 14:04:37 -0500
X-MC-Unique: Op1zUCQrM-2WdOGvKH_JOA-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-67a16ff92abso1026306d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 11:04:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701284677; x=1701889477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UGclDzu+lySOVYdka+aJpRVC+wxtGJIKs0Loae/8ctc=;
        b=rJlU2LzY46oooi7YqDK8xKZM2SV0DElrPLTP25HOiej4ta2fB1COu+3PP5xU5CYYcs
         vnQYvIeCTktp5RmSbb6/gEF4tVIkyFSsQStyN8r2Z6BMTQgVqmjCb9CGY5VKWLRWvESg
         GCw9rg785hBqpGHZiFpXtyaDBWPAYzb7y7ktxyBqaEuKcRkmSv8EWbKsm4YFLBt9vsZt
         rkgL6EEX5i1ReT9Oq3AVr+70de11MN9xMnaHTS8qHsvh72nwZKgD8sjhlj+Mx16hFXr3
         iQgaBT7QImblI5cPd7yPXzwvLniMvZXOSny/61ebT/px2SaFw6NSTlfyU+XC66vDDdz/
         /pRw==
X-Gm-Message-State: AOJu0Yzz/0MuP7jT278js3DZ4pPZb4offBIp7KmRxhrgz4wa2FnITH6W
	qKfDr8AbRDZqOc4CnQiQ3EBZdr/DLUPhG90JENiaIPII0C9cJU9TqysURsmCFyBFMnvmLQMvmcl
	mSNWxJxBTqkgIPtjdzDqddocdew==
X-Received: by 2002:ad4:4147:0:b0:67a:2426:260f with SMTP id z7-20020ad44147000000b0067a2426260fmr16663860qvp.53.1701284677149;
        Wed, 29 Nov 2023 11:04:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFcPEphFasCF8dyMXcL4RBEb7gdvleqAlpNVolRU27wf08hfohgOjfKvnY/3TDGHXGuJIb9w==
X-Received: by 2002:ad4:4147:0:b0:67a:2426:260f with SMTP id z7-20020ad44147000000b0067a2426260fmr16663825qvp.53.1701284676783;
        Wed, 29 Nov 2023 11:04:36 -0800 (PST)
Received: from localhost (pool-71-184-142-128.bstnma.fios.verizon.net. [71.184.142.128])
        by smtp.gmail.com with ESMTPSA id gg12-20020a056214252c00b0067a4059068esm3354845qvb.124.2023.11.29.11.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 11:04:36 -0800 (PST)
Date: Wed, 29 Nov 2023 14:04:35 -0500
From: Eric Chanudet <echanude@redhat.com>
To: Can Guo <quic_cang@quicinc.com>
Cc: bvanassche@acm.org, mani@kernel.org, adrian.hunter@intel.com, 
	cmd4@qualcomm.com, beanhuo@micron.com, avri.altman@wdc.com, 
	junwoo80.lee@samsung.com, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, "Bao D. Nguyen" <quic_nguyenb@quicinc.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 10/10] scsi: ufs: ufs-qcom: Add support for UFS device
 version detection
Message-ID: <rgn6deseihby3wuwqll5qkephtzthcpxvoel6fpf6baxwjabjb@3fnuzl7bhako>
References: <1701246516-11626-1-git-send-email-quic_cang@quicinc.com>
 <1701246516-11626-11-git-send-email-quic_cang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1701246516-11626-11-git-send-email-quic_cang@quicinc.com>

On Wed, Nov 29, 2023 at 12:28:35AM -0800, Can Guo wrote:
> From: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
> 
> A spare register in UFS host controller is used to indicate the UFS device
> version. The spare register is populated by bootloader for now, but in
> future it will be populated by HW automatically during link startup with
> its best efforts in any boot stages prior to Linux.
> 
> During host driver init, read the spare register, if it is not populated
> with a UFS device version, go ahead with the dual init mechanism. If a UFS
> device version is in there, use the UFS device version together with host
> controller's HW version to decide the proper PHY gear which should be used
> to configure the UFS PHY without going through the second init.
> 
> Signed-off-by: Bao D. Nguyen <quic_nguyenb@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 23 ++++++++++++++++++-----
>  drivers/ufs/host/ufs-qcom.h |  2 ++
>  2 files changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 9c0ebbc..e94dea2 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -1068,15 +1068,28 @@ static void ufs_qcom_advertise_quirks(struct ufs_hba *hba)
>  static void ufs_qcom_set_phy_gear(struct ufs_qcom_host *host)
>  {
>  	struct ufs_host_params *host_params = &host->host_params;
> +	u32 val, dev_major = 0;
>  
>  	host->phy_gear = host_params->hs_tx_gear;
>  
> -	/*
> -	 * Power up the PHY using the minimum supported gear (UFS_HS_G2).
> -	 * Switching to max gear will be performed during reinit if supported.
> -	 */
> -	if (host->hw_ver.major < 0x4)
> +	if (host->hw_ver.major < 0x4) {
> +		/*
> +		 * Power up the PHY using the minimum supported gear (UFS_HS_G2).
> +		 * Switching to max gear will be performed during reinit if supported.
> +		 */
>  		host->phy_gear = UFS_HS_G2;
> +	} else {
> +		val = ufshcd_readl(host->hba, REG_UFS_DEBUG_SPARE_CFG);
> +		dev_major = FIELD_GET(GENMASK(7, 4), val);
> +
> +		/* UFS device version populated, no need to do init twice */

This change documents the content of the register as "UFS device
version", both inline in the code and in the commit description. Earlier
in this series[1], Mani mentioned it was the gear info:
> > [...]populating a spare register in the bootloader with the max gear
> > info that the bootloader has already found[...]

Is it the gear number as in HS-G4? Or the version as in UFS controller
revision 3.1?

[1] https://lore.kernel.org/all/20231018124741.GA47321@thinkpad/

> +		if (dev_major != 0)
> +			host->hba->quirks &= ~UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH;
> +
> +		/* For UFS 3.1 and older, apply HS-G4 PHY gear to save power */
> +		if (dev_major < 0x4 && dev_major > 0)
> +			host->phy_gear = UFS_HS_G4;
> +	}
>  }
>  
>  static void ufs_qcom_set_host_params(struct ufs_hba *hba)
> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
> index 11419eb..d12fc5a 100644
> --- a/drivers/ufs/host/ufs-qcom.h
> +++ b/drivers/ufs/host/ufs-qcom.h
> @@ -54,6 +54,8 @@ enum {
>  	UFS_AH8_CFG				= 0xFC,
>  
>  	REG_UFS_CFG3				= 0x271C,
> +
> +	REG_UFS_DEBUG_SPARE_CFG			= 0x284C,
>  };
>  
>  /* QCOM UFS host controller vendor specific debug registers */
> -- 
> 2.7.4
> 
> 

-- 
Eric Chanudet


