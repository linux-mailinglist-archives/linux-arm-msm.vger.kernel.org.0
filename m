Return-Path: <linux-arm-msm+bounces-3586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35596807753
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 19:12:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE11DB20DEF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 18:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B04A6E2DE;
	Wed,  6 Dec 2023 18:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EbrvIlDl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9C45122
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 10:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701886321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8GLvrKoKXfs9q6sXMVVNDve2BGCY9TgxYq7d8xwgVO8=;
	b=EbrvIlDlsnoY2bzwYzruNbMsihq4Zj2RNU3cSGfLKWugDNTbOGDKgkyzu3wdWS0d1+2FP2
	9rPkRKx5hvEFE3tK1OFs2N7DRAZJbJjMscT4jaSUI34oeddgNcsZZgmRU4WmfcjtsYveWr
	gxu6oRb3/zCJ3lGOgmhXibP/SSb/ljo=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-o5d1huPtMR6t5vwv87K11A-1; Wed, 06 Dec 2023 13:11:11 -0500
X-MC-Unique: o5d1huPtMR6t5vwv87K11A-1
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6d87f0b71aeso80386a34.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Dec 2023 10:11:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701886270; x=1702491070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8GLvrKoKXfs9q6sXMVVNDve2BGCY9TgxYq7d8xwgVO8=;
        b=nIzdMaMN2kRHuZxGiRVwF1ZKuJTzS4tYZTj+PhnyQ1AVqvGNDFeL+XJMAdn4w4yYUH
         n4Waw8z8ZeHZFZqPFcWPHTy0ns+zNkci00ekanOytisnr9RFu0XZv4fJz/ebPSUTJwIR
         Hs0uSYfvpxQUdwcQ/DKc8eF4zYuarkuohfbu42PO7mS8CRm+7PNxQjL/BZrgsOBwLeqX
         4qyx7gkeLjoRUhZDu0c3rrfEse2hD1PnYc6b4Va4NFThvcGEoiBBTSRd4TDeLtWDEL0r
         GU7bwwEBjUyDsPgG05W3DKPkYIShW78+mQGcKtOt2HDqbjvL11LaJghxuP2rhUGU55WZ
         7vpA==
X-Gm-Message-State: AOJu0Yyqxgb4185FFNBOfeCp6424MiF5QxgJ3vmdp1qvHKSc/G6fIVVM
	8Og08nL7DrtH8piPT50vkH3Nt+ZUxp6dsMNe5dAZQKxNFhyxadLDxZphtJPiEhfIEmtgWXqAhrq
	4BzdMTDSR7zRyobWQVmP+ntoYmQ==
X-Received: by 2002:a05:6808:a98:b0:3b8:b063:9b4f with SMTP id q24-20020a0568080a9800b003b8b0639b4fmr1237613oij.65.1701886270651;
        Wed, 06 Dec 2023 10:11:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrWCDztRBTCTdptmOIMb3QLVRY8x4frkDSfMXpFws1PJaXtsjQQA314rFK/H2U63UzkloaQw==
X-Received: by 2002:a05:6808:a98:b0:3b8:b063:9b4f with SMTP id q24-20020a0568080a9800b003b8b0639b4fmr1237600oij.65.1701886270419;
        Wed, 06 Dec 2023 10:11:10 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::47])
        by smtp.gmail.com with ESMTPSA id p21-20020ac84095000000b004255a974865sm141189qtl.18.2023.12.06.10.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 10:11:10 -0800 (PST)
Date: Wed, 6 Dec 2023 12:11:08 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: martin.petersen@oracle.com, jejb@linux.ibm.com, andersson@kernel.org, 
	konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_cang@quicinc.com
Subject: Re: [PATCH 03/13] scsi: ufs: qcom: Fix the return value when
 platform_get_resource_byname() fails
Message-ID: <zxubx2deqdjkxg774d2mbqo66t7hlapg2vlvrraqawoemlywof@c7rs3mnzjppd>
References: <20231201151417.65500-1-manivannan.sadhasivam@linaro.org>
 <20231201151417.65500-4-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201151417.65500-4-manivannan.sadhasivam@linaro.org>

On Fri, Dec 01, 2023 at 08:44:07PM +0530, Manivannan Sadhasivam wrote:
> The return value should be -ENODEV indicating that the resource is not
> provided in DT, not -ENOMEM. Fix it!
> 
> Fixes: c263b4ef737e ("scsi: ufs: core: mcq: Configure resource regions")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  drivers/ufs/host/ufs-qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 852179e456f2..778df0a9c65e 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -1701,7 +1701,7 @@ static int ufs_qcom_mcq_config_resource(struct ufs_hba *hba)
>  		if (!res->resource) {
>  			dev_info(hba->dev, "Resource %s not provided\n", res->name);
>  			if (i == RES_UFS)
> -				return -ENOMEM;
> +				return -ENODEV;
>  			continue;
>  		} else if (i == RES_UFS) {
>  			res_mem = res->resource;
> -- 
> 2.25.1
> 
> 


