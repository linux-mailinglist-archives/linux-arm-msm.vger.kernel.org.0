Return-Path: <linux-arm-msm+bounces-4037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 684C480AB8F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 19:03:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 990F31C208E9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 18:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE43F41C8A;
	Fri,  8 Dec 2023 18:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FYb3TKdZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AD991989
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 10:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702058600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZUwBvIRAvhG9B+SuHsds4P0doNbLcysnUY/gEIcgCUI=;
	b=FYb3TKdZwjjaxbyFLYcyPrHbcF36mgPXh1ts2b9EcZIl3bqXTNau8bK1tNxfiMflcg/acB
	hz3FBjdDXIGvds0QXTJ7ZJQ/W4rYCbWpPtRVEWDmHplUgOsLF32LHEhgmyW9bAFBHvyJ+D
	zYQFq+sNy2LTwvQgZjnAnV2FPaVc084=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-7JibIu6GO4myUojKsxWYeg-1; Fri, 08 Dec 2023 13:03:18 -0500
X-MC-Unique: 7JibIu6GO4myUojKsxWYeg-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-421b20c9893so25976811cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 10:03:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702058598; x=1702663398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZUwBvIRAvhG9B+SuHsds4P0doNbLcysnUY/gEIcgCUI=;
        b=pVEClKeO3+pnXyE9ihsXFpi2YROlgaODsHbLweGOKIt4ADpX4wEXnlueiSCpUQwOqt
         l0AwIPLUmm8MiMRnwZJYwDuY37Q0G883lSrywgRcXyk5RSRteDjknK0C/hxRU68nd8Vp
         7p/9h9a/uuz9eKUKazyzXYxhTHgcdZ4DXEK7uYsLUx9yi8DsyBF78U/7Lj0VidDHEkwV
         MWFXXSU01kbpvp9WyVBCrKYxmLqjHNDtmRrcjwuBtKqpWWL+fzRS638brDIT/cNmGSwc
         qCyBwL85Q2IqivDcQBm1f6Id67mnggUk6FZW9wf9sU/NV9F2fq0jw1lDniELbk8LaYaS
         MLFg==
X-Gm-Message-State: AOJu0Yw3d/vkJTkWvuVLYAFcekW4eFC0WxA1+WW2CmtK1FeVxb95+QoO
	7cpT4dOcqJjqa9hB1jC9xIG7aM8AHc9+/BQ9cXpY/eZL043ciBBHm/Z8SLVgxSk5Mckpfx9mhiJ
	pTCPsAEu3OWs6cdWob278f741Mg==
X-Received: by 2002:a05:622a:15ce:b0:425:4043:764e with SMTP id d14-20020a05622a15ce00b004254043764emr495014qty.118.1702058598161;
        Fri, 08 Dec 2023 10:03:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzfhsAS69ChnjICSx4RU6A3rBLFhJWviTjp9kOqookZu1U2Q0y6hQzmQ7TI/PJppMBb58O4A==
X-Received: by 2002:a05:622a:15ce:b0:425:4043:764e with SMTP id d14-20020a05622a15ce00b004254043764emr495000qty.118.1702058597888;
        Fri, 08 Dec 2023 10:03:17 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::47])
        by smtp.gmail.com with ESMTPSA id m18-20020ac86892000000b00419801b1094sm971536qtq.13.2023.12.08.10.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 10:03:17 -0800 (PST)
Date: Fri, 8 Dec 2023 12:03:15 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: martin.petersen@oracle.com, jejb@linux.ibm.com, andersson@kernel.org, 
	konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_cang@quicinc.com, quic_nitirawa@quicinc.com
Subject: Re: [PATCH v2 17/17] scsi: ufs: qcom: Remove unused definitions
Message-ID: <pocqtwanoyircdkrdipealburqnzmqvmgqklsii5plj4r6n6lh@htaxbhagxd2d>
References: <20231208065902.11006-1-manivannan.sadhasivam@linaro.org>
 <20231208065902.11006-18-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208065902.11006-18-manivannan.sadhasivam@linaro.org>

On Fri, Dec 08, 2023 at 12:29:02PM +0530, Manivannan Sadhasivam wrote:
> Remove unused definitions.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  drivers/ufs/host/ufs-qcom.h | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
> index 2ce63a1c7f2f..cdceeb795e70 100644
> --- a/drivers/ufs/host/ufs-qcom.h
> +++ b/drivers/ufs/host/ufs-qcom.h
> @@ -10,22 +10,16 @@
>  #include <soc/qcom/ice.h>
>  #include <ufs/ufshcd.h>
>  
> -#define MAX_U32                 (~(u32)0)
>  #define MPHY_TX_FSM_STATE       0x41
>  #define TX_FSM_HIBERN8          0x1
>  #define HBRN8_POLL_TOUT_MS      100
>  #define DEFAULT_CLK_RATE_HZ     1000000
> -#define BUS_VECTOR_NAME_LEN     32
>  #define MAX_SUPP_MAC		64
>  
>  #define UFS_HW_VER_MAJOR_MASK	GENMASK(31, 28)
>  #define UFS_HW_VER_MINOR_MASK	GENMASK(27, 16)
>  #define UFS_HW_VER_STEP_MASK	GENMASK(15, 0)
>  
> -/* vendor specific pre-defined parameters */
> -#define SLOW 1
> -#define FAST 2
> -
>  #define UFS_QCOM_LIMIT_HS_RATE		PA_HS_MODE_B
>  
>  /* QCOM UFS host controller vendor specific registers */
> -- 
> 2.25.1
> 


