Return-Path: <linux-arm-msm+bounces-3588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BF68077AF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 19:41:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 857A51F21366
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 18:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF8A6ABBD;
	Wed,  6 Dec 2023 18:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XXbyO/HR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8669A84
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 10:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701888094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2YDjLMepeuXQAOfLexw9wJ/G5xIz4DXfzdIVQzgockk=;
	b=XXbyO/HRGOrvpMrUuMZWXVBpXSXt6OrZAQF1J+Nfxf6hhXFda8i4xxnPnXIDJbgTAwpCFp
	vH7lSJ4FIDHP+3LCx0Bb0zdRkNRx9obsRljjSvmXHrlawotQAL6DY4F46toU4B6n+mr29D
	CK8KIoXJijf2lO/AfhtaEYBC9qpnuyM=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-0cRnLOpxNd-XcW3fQWk2CQ-1; Wed, 06 Dec 2023 13:41:31 -0500
X-MC-Unique: 0cRnLOpxNd-XcW3fQWk2CQ-1
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-1faa81282d1so463285fac.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Dec 2023 10:41:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701888091; x=1702492891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YDjLMepeuXQAOfLexw9wJ/G5xIz4DXfzdIVQzgockk=;
        b=OEzbBxI2unJlV7ymL7bM8cFDl+qP2a/oaJLvR0Szfu//3NhPzGkHOXjzo7b4q+RRuX
         cRLmkvGP3MC7AZFLvr1O30+gqQmpolZSr0QlasPPUb6eVjHOAgIFGcHwDNMyQf2xaPJe
         K/RURlmH9HPjpXg4OJYSyRpz8HdRAq8EFrs376mPPWE9tp38zm4TOfwXWhM/LRD/Cczx
         xjVMMjpiLibWiZu8pf2sokOrpmri1n6ICbih6zzgqeL00sF7i+3RE09VqTLCak57tIyH
         NtWPwiXYKaZtBmAq/BVIM5S0GbTfm7Am+iXvGj0lf6NymNsWh5vNJJtN0Dp1WhjxI7Pa
         u0mQ==
X-Gm-Message-State: AOJu0Yy+WtJxlTaGcNMBA7MWq/T0VoeS71oeM3FrgIqtiq4ga0NSDMU9
	3/DkxzMTqOkc1rEcflAK6QVmr8qGSscxDBOnq6U5Yeh+TEBwZumZJbmZ/H7lAhLOT+h4aLGGY/d
	6/yjFyYiFQy0xCO+Z8mJkCo7ybg==
X-Received: by 2002:a05:6871:3402:b0:1fb:d89:48c3 with SMTP id nh2-20020a056871340200b001fb0d8948c3mr1475755oac.27.1701888091167;
        Wed, 06 Dec 2023 10:41:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEh12IvLMDJGznFqN4fzVBxPyYWXOTCG2Cau5TEzfYtnO6TcRlyHWdIYXkx8j3uxxYSu2oFjg==
X-Received: by 2002:a05:6871:3402:b0:1fb:d89:48c3 with SMTP id nh2-20020a056871340200b001fb0d8948c3mr1475741oac.27.1701888090916;
        Wed, 06 Dec 2023 10:41:30 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::47])
        by smtp.gmail.com with ESMTPSA id r6-20020a056870e8c600b001fadabf6626sm91503oan.23.2023.12.06.10.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 10:41:30 -0800 (PST)
Date: Wed, 6 Dec 2023 12:41:28 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: martin.petersen@oracle.com, jejb@linux.ibm.com, andersson@kernel.org, 
	konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_cang@quicinc.com
Subject: Re: [PATCH 07/13] scsi: ufs: qcom: Fail ufs_qcom_power_up_sequence()
 when core_reset fails
Message-ID: <iecwyzsamuwhatodicsfptf3dgl5nglrdqyennmhagpjz7yrtr@r72gejcvhi6w>
References: <20231201151417.65500-1-manivannan.sadhasivam@linaro.org>
 <20231201151417.65500-8-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201151417.65500-8-manivannan.sadhasivam@linaro.org>

On Fri, Dec 01, 2023 at 08:44:11PM +0530, Manivannan Sadhasivam wrote:
> Even though core_reset is optional, a failure during assert/deassert should
> be considered fatal, if core_reset is available. So fail
> ufs_qcom_power_up_sequence() if an error happens during reset and also get
> rid of the redundant warning as the ufs_qcom_host_reset() function itself
> prints error messages.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 604273a22afd..4948dd732aae 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -359,8 +359,7 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>  	/* Reset UFS Host Controller and PHY */
>  	ret = ufs_qcom_host_reset(hba);

I noticed that ufs_qcom_host_reset() doesn't return an error if
reset_control_deassert() fails. Can you address this in the next spin of
the series (I don't think its in the following patches that I glanced
through).

Thanks,
Andrew

>  	if (ret)
> -		dev_warn(hba->dev, "%s: host reset returned %d\n",
> -				  __func__, ret);
> +		return ret;
>  
>  	/* phy initialization - calibrate the phy */
>  	ret = phy_init(phy);
> -- 
> 2.25.1
> 
> 


