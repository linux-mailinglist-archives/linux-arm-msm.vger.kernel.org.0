Return-Path: <linux-arm-msm+bounces-107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D420F7E499C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 21:14:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83CEF280F8B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 20:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C4836B13;
	Tue,  7 Nov 2023 20:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="esMxNQ1/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300CF34CE7
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 20:14:29 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B5E312F
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 12:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699388067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UpwVUsKsWJB8ELVQCuxVLyRNagfKcI1oOQIR0b5JV9c=;
	b=esMxNQ1/qYWyisR5Qki/O3ecr+iE5bxKLmGn4dvDwdV+2CemkrU1mdJAl+sWMkMKJb7kXG
	Qad5yyexKZuGdTEEc2DqWIy38yCAyG2F39E1cXaYuM667/QAN6DTLP/XXXVo12OjjUzqwc
	XqHsHRzHhyTcjuaKDcnutHqhcBJSC7c=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-0s2LouB8OkSawym8uKFvBw-1; Tue, 07 Nov 2023 15:14:25 -0500
X-MC-Unique: 0s2LouB8OkSawym8uKFvBw-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-66fe14725aeso74708746d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Nov 2023 12:14:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699388064; x=1699992864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpwVUsKsWJB8ELVQCuxVLyRNagfKcI1oOQIR0b5JV9c=;
        b=LzTRZK9FQ+vRKBS5Musugmlnq+l+087jEwlvBImzYd5ZZm27YDkr6tGAusZkjkbWz3
         VCCTLHw6a1t2v8oJ0QHKAH8aRzV0/3cXR5PdXc0X1246Nqxewy8SIikpbePYfBnN9YFP
         3wzKf+1Ow4pTomNpTrgizCudb6pPNr9MVKDtY6y9sPVOFqGtf1w5twRpKe0U90930jN7
         oQYyNoaTzRXe5ihiDDE7rEDlX/PTvLbySI7mnr7/044LLADi/BNbM142/6jwU8MsZ1Pd
         YYV3FBGW1UEg0dKdcRx2qFxF2OfeMBwxJLzql0Rp9W2J6/2XsmgGyw3sOWt1QYmWLCtF
         fTiw==
X-Gm-Message-State: AOJu0Yz5ePayuIDr23rgkhHEHIOPF6LOzePSlAfV+KxJMwbsIbhaNgOb
	/f/3oxSDZNECCWLJM/6KTT+UTBlfV/H2Y+NXcAyO/VKf7McM9Ips0VbyhD8/Ht0Zwl4LfQtUGOI
	PwEe/B7R534Km6cayn/NEwcBwjQ==
X-Received: by 2002:a0c:cb88:0:b0:66d:5d31:999e with SMTP id p8-20020a0ccb88000000b0066d5d31999emr29908592qvk.43.1699388064498;
        Tue, 07 Nov 2023 12:14:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVYjdKwQ+pE8aJZPxVzo9sq0Gg+0h0LojH6Wg7xle1xVHG2mmu2Be0/uKehTX60Jrx8gapeQ==
X-Received: by 2002:a0c:cb88:0:b0:66d:5d31:999e with SMTP id p8-20020a0ccb88000000b0066d5d31999emr29908579qvk.43.1699388064237;
        Tue, 07 Nov 2023 12:14:24 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id p14-20020a0cc3ce000000b0065b1f90ff8csm247125qvi.40.2023.11.07.12.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 12:14:23 -0800 (PST)
Date: Tue, 7 Nov 2023 14:14:21 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Can Guo <cang@qti.qualcomm.com>
Cc: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org, 
	stanley.chu@mediatek.com, adrian.hunter@intel.com, beanhuo@micron.com, avri.altman@wdc.com, 
	junwoo80.lee@samsung.com, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, 
	"Bao D . Nguyen" <quic_nguyenb@quicinc.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	"James E.J. Bottomley" <jejb@linux.ibm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/7] scsi: ufs: ufs-qcom: Setup host power mode during
 init
Message-ID: <pami4442fspxmmyg32jjn2iyzozkyeblcuzwpmkql7wfa3xvq5@ftblajt7hsgo>
References: <1699332374-9324-1-git-send-email-cang@qti.qualcomm.com>
 <1699332374-9324-3-git-send-email-cang@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1699332374-9324-3-git-send-email-cang@qti.qualcomm.com>

On Mon, Nov 06, 2023 at 08:46:08PM -0800, Can Guo wrote:
> From: Can Guo <quic_cang@quicinc.com>
> 
> Setup host power mode and its limitations during UFS host driver init to
> avoid repetitive work during every power mode change.
> 
> Co-developed-by: Bao D. Nguyen <quic_nguyenb@quicinc.com>
> Signed-off-by: Bao D. Nguyen <quic_nguyenb@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 22 ++++++++++++++--------
>  drivers/ufs/host/ufs-qcom.h |  1 +
>  2 files changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index aee66a3..cc0eb37 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -898,7 +898,7 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
>  				struct ufs_pa_layer_attr *dev_req_params)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> -	struct ufs_host_params host_params;
> +	struct ufs_host_params *host_params = &host->host_params;
>  	int ret = 0;
>  
>  	if (!dev_req_params) {
> @@ -908,13 +908,7 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
>  
>  	switch (status) {
>  	case PRE_CHANGE:
> -		ufshcd_init_host_param(&host_params);
> -		host_params.hs_rate = UFS_QCOM_LIMIT_HS_RATE;

You drop the setting of hs_rate in your new function. It seems setting that's
also overkill since UFS_QCOM_LIMIT_HS_RATE == PA_HS_MODE_B. hs_rate is
already set to that in ufshcd_init_host_param(), so removing it makes
sense.

Can you remove it prior in its own patch, and remove the now unused
UFS_QCOM_LIMIT_HS_RATE as well from ufs-qcom.h?

With that in place this seems like a good improvement:

Acked-by: Andrew Halaney <ahalaney@redhat.com>

> -
> -		/* This driver only supports symmetic gear setting i.e., hs_tx_gear == hs_rx_gear */
> -		host_params.hs_tx_gear = host_params.hs_rx_gear = ufs_qcom_get_hs_gear(hba);
> -
> -		ret = ufshcd_negotiate_pwr_param(&host_params, dev_max_params, dev_req_params);
> +		ret = ufshcd_negotiate_pwr_param(host_params, dev_max_params, dev_req_params);
>  		if (ret) {
>  			dev_err(hba->dev, "%s: failed to determine capabilities\n",
>  					__func__);
> @@ -1049,6 +1043,17 @@ static void ufs_qcom_advertise_quirks(struct ufs_hba *hba)
>  		hba->quirks |= UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH;
>  }
>  
> +static void ufs_qcom_set_host_params(struct ufs_hba *hba)
> +{
> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +	struct ufs_host_params *host_params = &host->host_params;
> +
> +	ufshcd_init_host_param(host_params);
> +
> +	/* This driver only supports symmetic gear setting i.e., hs_tx_gear == hs_rx_gear */
> +	host_params->hs_tx_gear = host_params->hs_rx_gear = ufs_qcom_get_hs_gear(hba);
> +}
> +
>  static void ufs_qcom_set_caps(struct ufs_hba *hba)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> @@ -1273,6 +1278,7 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>  
>  	ufs_qcom_set_caps(hba);
>  	ufs_qcom_advertise_quirks(hba);
> +	ufs_qcom_set_host_params(hba);
>  
>  	err = ufs_qcom_ice_init(host);
>  	if (err)
> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
> index 9950a00..ab94c54 100644
> --- a/drivers/ufs/host/ufs-qcom.h
> +++ b/drivers/ufs/host/ufs-qcom.h
> @@ -240,6 +240,7 @@ struct ufs_qcom_host {
>  
>  	struct gpio_desc *device_reset;
>  
> +	struct ufs_host_params host_params;
>  	u32 phy_gear;
>  
>  	bool esi_enabled;
> -- 
> 2.7.4
> 
> 


