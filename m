Return-Path: <linux-arm-msm+bounces-3593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB79807836
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 19:56:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F5EE281D77
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 18:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C72F46558;
	Wed,  6 Dec 2023 18:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aUqTXspD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0AECD44
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 10:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701888993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lrcQ95ZMuKjHuke9HbkHyZcFozNRKymXYXIu9pIY1jA=;
	b=aUqTXspDzbqnNQa5i2R/Zk+wcTzB2rbIQ6Xn+Z1ZS966gHr2C9tw4C8owjwE/Lh4k/Qlel
	F6bJvMSmUzgCJla/Vq0Enme/qd540ULbCvJYpdxskZb8RDZls6UFg8oeCGDTKs0lDCQ80e
	0PMOElCkodc7VJyNeQbw2bz9FkPnZ1o=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-IGkO-6WWM4m6shBDJ3tBzQ-1; Wed, 06 Dec 2023 13:54:47 -0500
X-MC-Unique: IGkO-6WWM4m6shBDJ3tBzQ-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-67aa0c94343so22167486d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Dec 2023 10:54:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701888886; x=1702493686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrcQ95ZMuKjHuke9HbkHyZcFozNRKymXYXIu9pIY1jA=;
        b=GiphsOIXk8gdjEzCFRAONc43Ylc/g4+ay3ZushHOJqXif7VXft/VXhXsOai2qiXNy/
         QlGK1XUXVhSWrjKI+6MH4OaQMkqs/lzNNxoUb7m6jne20qNoNQ3CbVK2Df/zbjMTQ/RS
         vmH7SeCYHsYIoLuOvfUS98kMfA55QKh9ya93pK2qj+INjPlOqxL73CJDm092zlOPo2Kx
         INxgjUqBON3R97WqW+wTBxPuQ2dGrcYIjjxe91TJ9SJbFnLTmq1iZBKMeXQKXUN65SuE
         dlveV0wkm4Y1Y1SlbohkXgjeowHp3uqa6eV7wRfMGk500xTzqR+tzp5wIarfkLg+b5sv
         ohvw==
X-Gm-Message-State: AOJu0YwxCD3yjWWebhzTrclDZ2L9Tnc4fguxnxD/r6qkrfzu00U60QxM
	c8AOgU/eyud/q+gOKTVh/KevRZNEJscmryuGHrCbBflP2Wfz97xmDCfzywrbYir3+R3XijH6ZX/
	2JqQVWKPYzrvJoNOa9JRijH3MBOx7iL6YQw==
X-Received: by 2002:a0c:c310:0:b0:67a:bde:8898 with SMTP id f16-20020a0cc310000000b0067a0bde8898mr2144620qvi.5.1701888886173;
        Wed, 06 Dec 2023 10:54:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGD8g0owuNThJQurdEIVWL455BacG+Ujo4HaFTS7u/XHSiv+qtGjLbdu2sMVZi4/hyaNg5viw==
X-Received: by 2002:a0c:c310:0:b0:67a:bde:8898 with SMTP id f16-20020a0cc310000000b0067a0bde8898mr2144601qvi.5.1701888885946;
        Wed, 06 Dec 2023 10:54:45 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::47])
        by smtp.gmail.com with ESMTPSA id qd19-20020a05620a659300b0077d8a162babsm167867qkn.13.2023.12.06.10.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 10:54:45 -0800 (PST)
Date: Wed, 6 Dec 2023 12:54:43 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: martin.petersen@oracle.com, jejb@linux.ibm.com, andersson@kernel.org, 
	konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_cang@quicinc.com
Subject: Re: [PATCH 11/13] scsi: ufs: qcom: Remove unused ufs_qcom_hosts
 struct array
Message-ID: <sqdgnfedt5j3epypmsvb7lv6gvmjrymtuieji3yhqsfvniiodl@f3aj73mlshxy>
References: <20231201151417.65500-1-manivannan.sadhasivam@linaro.org>
 <20231201151417.65500-12-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201151417.65500-12-manivannan.sadhasivam@linaro.org>

On Fri, Dec 01, 2023 at 08:44:15PM +0530, Manivannan Sadhasivam wrote:
> ufs_qcom_hosts array is assigned, but not used anywhere. So let's remove
> it.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/ufs/host/ufs-qcom.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index a86f6620abc8..824c006be093 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -90,8 +90,6 @@ static const struct __ufs_qcom_bw_table {
>  	[MODE_MAX][0][0]		    = { 7643136,	307200 },
>  };
>  
> -static struct ufs_qcom_host *ufs_qcom_hosts[MAX_UFS_QCOM_HOSTS];
> -

I think we can get rid of MAX_UFS_QCOM_HOSTS as well with this change in
place?

>  static void ufs_qcom_get_default_testbus_cfg(struct ufs_qcom_host *host);
>  static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale_up);
>  
> @@ -1192,9 +1190,6 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>  
>  	ufs_qcom_setup_clocks(hba, true, POST_CHANGE);
>  
> -	if (hba->dev->id < MAX_UFS_QCOM_HOSTS)
> -		ufs_qcom_hosts[hba->dev->id] = host;
> -
>  	ufs_qcom_get_default_testbus_cfg(host);
>  	err = ufs_qcom_testbus_config(host);
>  	if (err)
> -- 
> 2.25.1
> 
> 


