Return-Path: <linux-arm-msm+bounces-3589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DC38077C2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 19:43:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB7ADB20E2D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 18:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1935B41864;
	Wed,  6 Dec 2023 18:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bI+FAkbj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85666D44
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 10:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701888194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KvnpSQri5arb6xwcBFDZQI0HnLnuARbU/naBERSZQac=;
	b=bI+FAkbjAb/U9zU91MQoyl7Q4BFni0hGqc/QUYP9cL5jXm22PNcXhchYaKY0wG5SVuFYsP
	UPrBbZZZPz8itqdi8jq1YUfu/h2Jqf8uDc48bhuWCs8Rg4Y1zVN1jHQtrzUBlGM4gNxjKU
	fTLb5Cqbx1eAJ56mSQg5190LZ829iGs=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-KsuTErsZNRCTnY_R4PUC4w-1; Wed, 06 Dec 2023 13:41:52 -0500
X-MC-Unique: KsuTErsZNRCTnY_R4PUC4w-1
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-58d53348a03so47070eaf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Dec 2023 10:41:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701887804; x=1702492604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KvnpSQri5arb6xwcBFDZQI0HnLnuARbU/naBERSZQac=;
        b=r60eNwmulKcfjlb/0zHOczEccvLCycW3GNfDtHflPgqNyT2l9S9XvwqVElhXxEWf9G
         MTftx8I0LL1yLVZpK4+OqflwPWy+P50PBvzbO5ZmOh6RmZjTWWwRS/UhlLGIvILHRocY
         aHLG6aO+47pZqaHurXPCkpOu9d7MDlVEmoc05lep/jTrmaxDjYgxJClO36qpfrFPACzn
         tzQNbYjijN+GXvu9Tfme+eET2j/CPpXlq+j6WbY2tC1rnLS2gmTp2cMMnESASAJNmGLD
         XtGp3yJjeouhl0+ZdNc3w6eWxsdLvp7OogAXuJOG5EcChf1+kLo6POugcvLMdQxl3ACH
         WSgw==
X-Gm-Message-State: AOJu0YzhNNWp1GW+kBEFkQLFtB/wXOU7OLv/WeTzbjVmy95Cz1Quwxea
	UlYzHg1SJz9TYjt4rhhR3FZkqE6AXd9RXodWhaw8h4q77ZA3LI9ZQvvKKNA74UK0hujCLBQnjUy
	C7+SJCjQ6zPZ+dGcduxSg/3NSHtrAHR6Vsg==
X-Received: by 2002:a05:6358:7206:b0:16d:fe33:4c63 with SMTP id h6-20020a056358720600b0016dfe334c63mr1635757rwa.24.1701887804315;
        Wed, 06 Dec 2023 10:36:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVXVpDI2N4zq6TmLP+46EyCJXTztwSBXqvdJFhrfnSKXRuRptwKjhGCPJ0XHZcWj52RCTA0Q==
X-Received: by 2002:a05:6358:7206:b0:16d:fe33:4c63 with SMTP id h6-20020a056358720600b0016dfe334c63mr1635747rwa.24.1701887803917;
        Wed, 06 Dec 2023 10:36:43 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::47])
        by smtp.gmail.com with ESMTPSA id g7-20020ac84807000000b004258264d166sm149989qtq.60.2023.12.06.10.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 10:36:43 -0800 (PST)
Date: Wed, 6 Dec 2023 12:36:41 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: martin.petersen@oracle.com, jejb@linux.ibm.com, andersson@kernel.org, 
	konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_cang@quicinc.com
Subject: Re: [PATCH 05/13] scsi: ufs: qcom: Remove the warning message when
 core_reset is not available
Message-ID: <ru2zdpls5tx2wjt3oknqndikuc4we7d3haeawzrdyl7cbsycti@clx55b27nzvn>
References: <20231201151417.65500-1-manivannan.sadhasivam@linaro.org>
 <20231201151417.65500-6-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201151417.65500-6-manivannan.sadhasivam@linaro.org>

On Fri, Dec 01, 2023 at 08:44:09PM +0530, Manivannan Sadhasivam wrote:
> core_reset is optional, so there is no need to warn the user if it is not
> available (that too not while doing host reset each time).

What's the bit in the parenthesis mean here? I'm having a hard time
following. Otherwise, this looks good to me.

> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/ufs/host/ufs-qcom.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index dc93b1c5ca74..d474de0739e4 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -296,10 +296,8 @@ static int ufs_qcom_host_reset(struct ufs_hba *hba)
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>  	bool reenable_intr;
>  
> -	if (!host->core_reset) {
> -		dev_warn(hba->dev, "%s: reset control not set\n", __func__);
> +	if (!host->core_reset)
>  		return 0;
> -	}
>  
>  	reenable_intr = hba->is_irq_enabled;
>  	disable_irq(hba->irq);
> -- 
> 2.25.1
> 
> 


