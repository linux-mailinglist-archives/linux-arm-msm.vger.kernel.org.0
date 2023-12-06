Return-Path: <linux-arm-msm+bounces-3590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A968077CF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 19:44:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0354C2821B0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 18:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9422482C8;
	Wed,  6 Dec 2023 18:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R+NpMIUd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0194611F
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 10:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701888240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rdbwGcL3xfTd0SQ2ofmFtSrkLP5S7WJXgHm5WJg2yPQ=;
	b=R+NpMIUdX1in1C0hao3B8OaeARQW9VIkIkSfS5w/3MnlJWtvAAPTsTUh67imP4Dsvdgnua
	Ks9QaLeeyuHoQQsZNsU8SzqJ3Qig6Fk6O0hSetamjehRnRwimHHPhilfDFN2NLSNuSrVli
	RuczUGAu0UwJJF9KdmP5+bTY2I/AV9c=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331--EnN9NSwNryfYqZU9sxejw-1; Wed, 06 Dec 2023 13:43:34 -0500
X-MC-Unique: -EnN9NSwNryfYqZU9sxejw-1
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-58a21120248so98879eaf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Dec 2023 10:43:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701888214; x=1702493014;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdbwGcL3xfTd0SQ2ofmFtSrkLP5S7WJXgHm5WJg2yPQ=;
        b=Ok4aPyUXDA424NuWvf/3maFaUkrkGOzQnzW1Ync9z1zsTdtYsh32u88M/4FLGWd9eS
         4og1zIXuqaCUg6qclJUFJq8G0O+1GaerJkpy+Ui+2rSUcEO7JeiMHDRF0DdEtVAGuLY1
         bA/38pZ17cjZKGK6Gc9ivP5lqyzqGjH9S1ZujHhLFpvH91QaR5jka6Q/PifY6cgxNhmr
         H2Woq3v69y20qN1b3l7/md+KnOHAs/+aupheGnpbKvPm36hqf8dlsZ6xP6wAu3LeuXIl
         BaEW5TqLHmyNGN/l81DmchFLw+DHhzuO+8yULtp9rMS6s720M9lFkvmW6u/rCcWRsxBx
         QX0w==
X-Gm-Message-State: AOJu0YzHkDDf/Ueb3AhOA8a+9smnfUPg9WjtuomvtLRHxxjA2WMcAE//
	5gnuOytJ8ZINdvTNaOMM7lHICqxImlGhK0EilDRwbcs2v+l2tIRmqkveVpEhXkV+IGIRby6Dg1f
	tFGeFwnIZKA6guQsNKU10p8dC1Q==
X-Received: by 2002:a05:6358:91a6:b0:16d:aead:f74f with SMTP id j38-20020a05635891a600b0016daeadf74fmr894781rwa.13.1701888214071;
        Wed, 06 Dec 2023 10:43:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZve0jDN+whXG9Fyrygjtk5nDhHS4D1oiR1nOY5YrJFkYaAmPCNcVIlXYPMaf+xGLMIHTxNQ==
X-Received: by 2002:a05:6358:91a6:b0:16d:aead:f74f with SMTP id j38-20020a05635891a600b0016daeadf74fmr894768rwa.13.1701888213764;
        Wed, 06 Dec 2023 10:43:33 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::47])
        by smtp.gmail.com with ESMTPSA id bz6-20020ad44c06000000b0067a2a621fadsm183188qvb.53.2023.12.06.10.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 10:43:33 -0800 (PST)
Date: Wed, 6 Dec 2023 12:43:31 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: martin.petersen@oracle.com, jejb@linux.ibm.com, andersson@kernel.org, 
	konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_cang@quicinc.com
Subject: Re: [PATCH 08/13] scsi: ufs: qcom: Check the return value of
 ufs_qcom_power_up_sequence()
Message-ID: <7ch3mroun3pnaxpej4orlukotdrrnzdkuts6rzjruk4hghtira@x7txcjve56wb>
References: <20231201151417.65500-1-manivannan.sadhasivam@linaro.org>
 <20231201151417.65500-9-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201151417.65500-9-manivannan.sadhasivam@linaro.org>

On Fri, Dec 01, 2023 at 08:44:12PM +0530, Manivannan Sadhasivam wrote:
> If ufs_qcom_power_up_sequence() fails, then it makes no sense to enable
> the lane clocks and continue ufshcd_hba_enable(). So let's check the return
> value of ufs_qcom_power_up_sequence().
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  drivers/ufs/host/ufs-qcom.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 4948dd732aae..e4dd3777a4d4 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -415,7 +415,10 @@ static int ufs_qcom_hce_enable_notify(struct ufs_hba *hba,
>  
>  	switch (status) {
>  	case PRE_CHANGE:
> -		ufs_qcom_power_up_sequence(hba);
> +		err = ufs_qcom_power_up_sequence(hba);
> +		if (err)
> +			return err;
> +
>  		/*
>  		 * The PHY PLL output is the source of tx/rx lane symbol
>  		 * clocks, hence, enable the lane clocks only after PHY
> -- 
> 2.25.1
> 
> 


