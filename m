Return-Path: <linux-arm-msm+bounces-8912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1558414C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 21:57:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B17D81C23864
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 20:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CCC4158D87;
	Mon, 29 Jan 2024 20:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DkW4ME8P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDBE15703E
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 20:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706561848; cv=none; b=rvoaTC6/5CNix/Jx7dQnvYs8Tx3Iso46fglEwA8JC1ZLTN1jFdcqaJCISQffdWYK38BzfpX6Jjg2rpDvWzkOA9g3p27EIwlSzUx5zDBNhg0CadPC4E3FA0v7UAlxSLfz6Box0a1mkkCotdSeKBGah+myfcH2zxSQi4uDX86sKy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706561848; c=relaxed/simple;
	bh=2b0Fm92BYrv7od4rmimCRIjuTkKWHJKFkRBuhDCF5M8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H5eykMWmYF6ZrW71culDJs2zEZ8DRxHUqUX7JFdKoxk1ZjyFOps63nRIsFnmp25bUxE97EB6xsoU9GOY0+59UTfAgz92Hs4Gm3KhEo9V/PkiuX827lNoECXN5DV2AzLQ6uSyh29Ehbvexi+zPIZrR8qgVyX9eWpGC1HaPPp45Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DkW4ME8P; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706561845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZpSdnNveS03uidkIaCRaoRGMyvrhYIOI4fp4SKhQKFg=;
	b=DkW4ME8Pnq/6g2VqyOjh2b/PcOj8TUY5PePkbWyTSvx+RoYU5F84jW8LNLSQhbB5kRpBvn
	DFUQWlR/wdlIKs6Y1XxxZeu0UeQATc/oPbnjucBmFbigtaUnERT0HxO85uwZ+M6uOk/qty
	7IQ+CqqhWH7Jc0pBBDbL8MJckDjGr1c=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-nakZlgmGPjqmsZb6zcft5A-1; Mon, 29 Jan 2024 15:57:23 -0500
X-MC-Unique: nakZlgmGPjqmsZb6zcft5A-1
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-4bdc1d595c0so624963e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 12:57:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706561843; x=1707166643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZpSdnNveS03uidkIaCRaoRGMyvrhYIOI4fp4SKhQKFg=;
        b=N4v/0Jr2t1wcsXu5o6FQDcNw2gQbIAoOZ/A9kupKCH4ntncBWPZedwHXtd214mUcmu
         ANCWg2GZKL9MTqTpCHB/oUrStv+H2R3sa58T2XAuV15WMmkmIRalf1N1BRSCJj/W703s
         2mDex7QK+iKeFxYqZZtk82O+sj19OadF33jozHWNkWhOqfzynBbk2m4V9ITDD8s5c4LA
         JUmGegfaTwQbhG9+5DihcoNRWseO5MH6XfdgMV86b0xODSm9I8gsSRinFg36K61iagDR
         NBFk5Iyog/FNBFm644bpbOsNCsFPNw/GuCHXE8vAAfaQ8mv0qqcakalWHRSjnHwOjP2d
         g+KA==
X-Gm-Message-State: AOJu0YyhbMwm+izn4wgouQMTlPj9uIR0tBJnY88ebiclB+knHjwb58ee
	QwMC4LfxwRMSUF//0lboyeBWaCTw3a5H96+wQ1r9TDfu51k1JugHlHjuL+jK4jXrS6W4M8hnsOO
	I4MpQqaS5dzeGWPsq8rH0FyI1oQ0Dkc9zp3kOLqUzTSq41WjXUUOTHt9EXgfcJMc=
X-Received: by 2002:a05:6122:3a19:b0:4bd:800d:72ec with SMTP id fp25-20020a0561223a1900b004bd800d72ecmr2631127vkb.19.1706561842936;
        Mon, 29 Jan 2024 12:57:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrcccUSIgYBufwZZNxLHJdlcGzpJI+aaJovr7DFK+X2Rmv+DVoHH+zCYCUjPVWi9ptYcSCvQ==
X-Received: by 2002:a05:6122:3a19:b0:4bd:800d:72ec with SMTP id fp25-20020a0561223a1900b004bd800d72ecmr2631106vkb.19.1706561842670;
        Mon, 29 Jan 2024 12:57:22 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::47])
        by smtp.gmail.com with ESMTPSA id qq2-20020a0562142c0200b0068c3f3752e5sm2671268qvb.116.2024.01.29.12.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 12:57:22 -0800 (PST)
Date: Mon, 29 Jan 2024 14:57:20 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
	Andy Gross <andy.gross@linaro.org>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] scsi: ufs: qcom: Clarify the comment of core_reset
 property
Message-ID: <hm2h3uniy75vkjlnk62k3y4bz44khrdwxlk47t3lndc6c3yd2x@sbwcuvrjar5n>
References: <20240129-ufs-core-reset-fix-v1-0-7ac628aa735f@linaro.org>
 <20240129-ufs-core-reset-fix-v1-2-7ac628aa735f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129-ufs-core-reset-fix-v1-2-7ac628aa735f@linaro.org>

On Mon, Jan 29, 2024 at 01:22:05PM +0530, Manivannan Sadhasivam wrote:
> core_reset is not an optional property for the platforms supported in
> upstream. Only for the non-upstreamed legacy platforms it is optional.
> But somehow a few of the upstreamed platforms do not pass this property
> by mistake.
> 
> So clarify the comment to make it clear that even though core_reset is
> required, it is kept as optional to support the DTs that do not pass this
> property.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/ufs/host/ufs-qcom.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 39eef470f8fa..32760506dfeb 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -1027,7 +1027,11 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>  	host->hba = hba;
>  	ufshcd_set_variant(hba, host);
>  
> -	/* Setup the optional reset control of HCI */
> +	/*
> +	 * Even though core_reset is required on all platforms, some DTs never
> +	 * passed this property. So we have to keep it optional for supporting
> +	 * them.
> +	 */

Any desire to print a warning if !host->core_reset? I'll defer to
Qualcomm to review since they can confirm the accuracy past Can's
comment, but this looks good to me for what its worth.

>  	host->core_reset = devm_reset_control_get_optional(hba->dev, "rst");
>  	if (IS_ERR(host->core_reset)) {
>  		err = dev_err_probe(dev, PTR_ERR(host->core_reset),
> 
> -- 
> 2.25.1
> 
> 


