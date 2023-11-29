Return-Path: <linux-arm-msm+bounces-2582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8822D7FE150
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 21:48:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0F441C20BFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 20:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B26B60EEE;
	Wed, 29 Nov 2023 20:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DkkebFhd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6389D69
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 12:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701290891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IgK9SVKODvB48bATs/GY8yc91KWuPlynI97GGsWOuZo=;
	b=DkkebFhdHgzw1IhtizdPzuJjw4dBzpG/kcmDiEAdi4WYYTg/R7DZYxt6uqMlD8QHvOTdZR
	CHR0/jioLWiHZDtUhj6Y1Yxmx7spi4GSxwuvBV3x6vcRYyL3oBE683erjnZPQTBf6W/40F
	JKK7bQ1yzrbRPZrSA64fWFfJR0YfQk4=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-DW3nZ0lQOYe1FaX1SUQobA-1; Wed, 29 Nov 2023 15:48:10 -0500
X-MC-Unique: DW3nZ0lQOYe1FaX1SUQobA-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-5ca61d84dc3so4036557b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 12:48:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701290889; x=1701895689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgK9SVKODvB48bATs/GY8yc91KWuPlynI97GGsWOuZo=;
        b=Dhqslf9//kQnD4LxCwOSlKmkhXmm+gxSIO6TU9MUPD9IlGlMCV86Pb5KTx4JaInm/k
         NnWy77zRJWM89uyGB2TSKcV62jWHBUXx0c/ZAvbTOqC/XEIQpvSyHc10SwPdIu30GNhE
         FldL9zye9Fm0f30WH5Io+mzXOZzQ+IVaqTEVsbm/DT7BBoSRBWjmK1ZG0iIbyL5B3XIK
         QEZZiu1QDWXDhpP6+43+cFqsw7ob0y50d9RizGmEuEx6xq8LBt64V5tGRSzy/1CMfHU5
         98JOYTzFDIdCeFaxg2z0Bo2ns6kIUoYfToG0XXRKvGyIT8Z0DsMOSzCyY09v+AeMBUNm
         OE8g==
X-Gm-Message-State: AOJu0Ywp63P6a9yl5r1pV0IMdyXEUIoPBY/ugp+ASLkzwOMbc7EvNwj0
	CyChekTMv+poVlVmSNlPYuD83NyARICum9TGFPx+AkTibCOwr6kLxcEqVHlMHTh1iygGZWRACu5
	4MhXXE9HcnbZmyvdE+tYjMdo0OQ==
X-Received: by 2002:a05:690c:3145:b0:5d0:bd82:a87d with SMTP id fc5-20020a05690c314500b005d0bd82a87dmr9985288ywb.9.1701290889549;
        Wed, 29 Nov 2023 12:48:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnJ3Gqey62Zd2lyl5c2NqI9b6c5SGjVB3aYgy6NvYWJzN7gTHxO7Ubp0FYkzvfEQ+0pZ4bFg==
X-Received: by 2002:a05:690c:3145:b0:5d0:bd82:a87d with SMTP id fc5-20020a05690c314500b005d0bd82a87dmr9985278ywb.9.1701290889271;
        Wed, 29 Nov 2023 12:48:09 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id kc9-20020a056214410900b0067a15610d3csm5588607qvb.72.2023.11.29.12.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 12:48:08 -0800 (PST)
Date: Wed, 29 Nov 2023 14:48:06 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Can Guo <quic_cang@quicinc.com>
Cc: bvanassche@acm.org, mani@kernel.org, adrian.hunter@intel.com, 
	cmd4@qualcomm.com, beanhuo@micron.com, avri.altman@wdc.com, 
	junwoo80.lee@samsung.com, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	"James E.J. Bottomley" <jejb@linux.ibm.com>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 02/10] scsi: ufs: ufs-qcom: No need to set hs_rate
 after ufshcd_init_host_param()
Message-ID: <y26a4ciloi6bcmil2hfmsezjeaomjm56ukzdlbm5fxlwpj3rr5@3rs7b5mkehpx>
References: <1701246516-11626-1-git-send-email-quic_cang@quicinc.com>
 <1701246516-11626-3-git-send-email-quic_cang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1701246516-11626-3-git-send-email-quic_cang@quicinc.com>

On Wed, Nov 29, 2023 at 12:28:27AM -0800, Can Guo wrote:
> In ufs_qcom_pwr_change_notify(), host_params.hs_rate has been set to
> PA_HS_MODE_B by ufshcd_init_host_param(), hence remove the duplicated line
> of work. Meanwhile, removed the macro UFS_QCOM_LIMIT_HS_RATE as it is only
> used here.
> 
> Reviewed-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  drivers/ufs/host/ufs-qcom.c | 1 -
>  drivers/ufs/host/ufs-qcom.h | 2 --
>  2 files changed, 3 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 197c5a5..c21ff2c 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -909,7 +909,6 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
>  	switch (status) {
>  	case PRE_CHANGE:
>  		ufshcd_init_host_params(&host_params);
> -		host_params.hs_rate = UFS_QCOM_LIMIT_HS_RATE;
>  
>  		/* This driver only supports symmetic gear setting i.e., hs_tx_gear == hs_rx_gear */
>  		host_params.hs_tx_gear = host_params.hs_rx_gear = ufs_qcom_get_hs_gear(hba);
> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
> index 9950a00..82cd143 100644
> --- a/drivers/ufs/host/ufs-qcom.h
> +++ b/drivers/ufs/host/ufs-qcom.h
> @@ -27,8 +27,6 @@
>  #define SLOW 1
>  #define FAST 2
>  
> -#define UFS_QCOM_LIMIT_HS_RATE		PA_HS_MODE_B
> -
>  /* QCOM UFS host controller vendor specific registers */
>  enum {
>  	REG_UFS_SYS1CLK_1US                 = 0xC0,
> -- 
> 2.7.4
> 
> 


