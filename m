Return-Path: <linux-arm-msm+bounces-8136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A7783AB39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 14:56:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9FC06B27DDC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 13:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BCD77A719;
	Wed, 24 Jan 2024 13:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hTlBOQJl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897CD77F37
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 13:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706104528; cv=none; b=Cao6CnWXweqmbCLdyQbWQ/hXtXVrD1dhH1wbvKJTfy6/ktOFILrRwxDx85BtQPOeb83A2B3KTcrNuq29FCRd8EAzlWLnTR/FSHVWuvlwGMXx//mFMCkDQcHjfFbVXsFa+5xUnZOki5n81gDoMgisApm0NpnjvNN+xBaxlB9XBrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706104528; c=relaxed/simple;
	bh=uO6XYeao3+ERbDLbaGJYNsqD7iMh0uqxQitnp3GG0EI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMqH7KwzGGuweNNx/PQzNTdgWH8om0/pq9z8umMsiWTRFYLdsPxa1Z0lxE7E7nW0QvnC73RKlPHLYvbgA3MwZYEvxEB/P/Wnp3AQBViXEnv2A/SxanxEx+gtvkXmJgUwE86xJMpxFh+UHfGrrFUfPgz9veytF3topR/nmaDdoME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hTlBOQJl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706104525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X2HNODfBS+JrHafscRLbwZLG2NmbTl5ZUi1igtTA3Vk=;
	b=hTlBOQJlF0s+8CYx2Wj3K5T0/sFRhFRjeiJC9dUmGBYs5tXuJJGENMNv6GLPrmphCSLV4D
	1jCuF+q3RwPOV7mMAIMOPvymAwt7Xdt/vRGMchIJXfWNivIv64belzJID6nRoj1Tjc0xD/
	jgxKyBkVoZX59WbQ2OAc8T2vbNg1Ono=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-312-9kSwqu67NTCIN4UJg0XHhg-1; Wed, 24 Jan 2024 08:55:22 -0500
X-MC-Unique: 9kSwqu67NTCIN4UJg0XHhg-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7831ed4bb2aso1015544385a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 05:55:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706104521; x=1706709321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2HNODfBS+JrHafscRLbwZLG2NmbTl5ZUi1igtTA3Vk=;
        b=fIDAgKmgl3ODbDbiN4vgFxhmly6QGG9R5TthKSypgUVif0VPUT/Sh9ct7Nmh2ep0WU
         iuTV6p04pKaRjUiT2GpKyyoKFPekWg60a/RmOsovv83FMOjNJe0ekMudlfZpyCoFThhM
         evRROIQRNjFE/mBc0U2TxMUQpkz0Eb71V6V/LVHvvFl6BROfHjfxYSVqrJzMVhi2g0q5
         Kk0M4mGhkcNJ0fOG7Af5Xeb5aw6YkBCueiAsNHzZBIAisN206QmAa0bDHYNH80TRlksZ
         BI5w9bDdLiTw/4pnMkCVjnCVaORs3x7XzUCvlQ4AnCu7R32/JK6BOEyACt/vz17flld9
         rf5A==
X-Gm-Message-State: AOJu0YyQHV79gGPaCmlHdgz/cqj/9Htv1I00bejzO3IHysx6Fut49BHj
	wSlXHNP2qPkFt2U6gby9jsNht+ItkU5jqzUORNJQMxiZXcRZtyBVfv2/Q0yg5sUjH0IutclgZKi
	l1wF2ogIqazUueLD87gTUPIoGKcf7kciosySJpGzSCA+rNi706fXFUY5oNzNue0k=
X-Received: by 2002:a05:620a:610a:b0:783:8071:2473 with SMTP id oq10-20020a05620a610a00b0078380712473mr8341385qkn.61.1706104521678;
        Wed, 24 Jan 2024 05:55:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTtQXSI1MSoTfgWJ8tVH7siOJkHn3LOGpV6BWnWln+S7PK+ANFnpN3awurbecqz9jTWq6izA==
X-Received: by 2002:a05:620a:610a:b0:783:8071:2473 with SMTP id oq10-20020a05620a610a00b0078380712473mr8341369qkn.61.1706104521402;
        Wed, 24 Jan 2024 05:55:21 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id m26-20020ae9e01a000000b0078392eacfd4sm3940574qkk.80.2024.01.24.05.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 05:55:20 -0800 (PST)
Date: Wed, 24 Jan 2024 07:55:18 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Eric Chanudet <echanude@redhat.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	"James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] scsi: ufs: qcom: avoid re-init quirk when gears match
Message-ID: <mzfbayn2yz2egmtv2lankxn3h7p4pglaqxallczzmcevkvnp5b@jplxt7yu6xae>
References: <20240123192854.1724905-4-echanude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240123192854.1724905-4-echanude@redhat.com>

On Tue, Jan 23, 2024 at 02:28:57PM -0500, Eric Chanudet wrote:
> On sa8775p-ride, probing the hba will go through the
> UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH path although the power info
> are same during the second init.
> 
> The REINIT quirk only applies starting with controller v4. For these,
> ufs_qcom_get_hs_gear() reads the highest supported gear when setting the
> host_params. After the negotiation, if the host and device are on the
> same gear, it is the highest gear supported between the two. Skip REINIT
> to save some time.
> 
> Signed-off-by: Eric Chanudet <echanude@redhat.com>

On the sa8775p-ride I have I see similar results to what you mention!
Thanks.

Tested-by: Andrew Halaney <ahalaney@redhat.com> # sa8775p-ride

> ---
> 
> v1 -> v2:
> * drop test against host->hw_ver.major >= 4 and amend description as a
>   result (Andrew/Mani)
> * add comment, test device gear against host->phy_gear and reset
>   host->phy_gear only if necessary (Mani)
> * Link to v1: https://lore.kernel.org/linux-arm-msm/20240119185537.3091366-11-echanude@redhat.com/
> 
> trace_event=ufs:ufshcd_init reports the time spent in ufshcd_probe_hba
> where the re-init quirk is performed:
> Currently:
> 0.355879: ufshcd_init: 1d84000.ufs: took 103377 usecs, dev_state: UFS_ACTIVE_PWR_MODE, link_state: UIC_LINK_ACTIVE_STATE, err 0
> With this patch:
> 0.297676: ufshcd_init: 1d84000.ufs: took 43553 usecs, dev_state: UFS_ACTIVE_PWR_MODE, link_state: UIC_LINK_ACTIVE_STATE, err 0
> 
>  drivers/ufs/host/ufs-qcom.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 39eef470f8fa..f7dba7236c6e 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -738,8 +738,17 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
>  		 * the second init can program the optimal PHY settings. This allows one to start
>  		 * the first init with either the minimum or the maximum support gear.
>  		 */
> -		if (hba->ufshcd_state == UFSHCD_STATE_RESET)
> -			host->phy_gear = dev_req_params->gear_tx;
> +		if (hba->ufshcd_state == UFSHCD_STATE_RESET) {
> +			/*
> +			 * Skip REINIT if the negotiated gear matches with the
> +			 * initial phy_gear. Otherwise, update the phy_gear to
> +			 * program the optimal gear setting during REINIT.
> +			 */
> +			if (host->phy_gear == dev_req_params->gear_tx)
> +				hba->quirks &= ~UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH;
> +			else
> +				host->phy_gear = dev_req_params->gear_tx;
> +		}
>  
>  		/* enable the device ref clock before changing to HS mode */
>  		if (!ufshcd_is_hs_mode(&hba->pwr_info) &&
> -- 
> 2.43.0
> 
> 


