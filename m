Return-Path: <linux-arm-msm+bounces-4033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB5880AB0D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 18:46:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2DFC5B20A38
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 17:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AFEB3B2BB;
	Fri,  8 Dec 2023 17:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eW396pJb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93195D54
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 09:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702057575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eK8WutytSz3F60Rl2nxPhK1kwwDpKHRRkbGPCAgiMXQ=;
	b=eW396pJb0QzEBA7QieC8dp7ixoqFeAIcoP2dlElcvdW/vQj6NJ9CwT3up55LMHjBR9UcEH
	Ujc0KdcR6A7Gdlo89d7VgVGdh6mYIiURAQIO55CSZhsd5+A/+32URp2iAl7dUhwOznjkm5
	WzTcPWcH7XB1tRWCTg4YPM05+VWVk1c=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-UjXtrDZvOkKCAp5HRvEWEQ-1; Fri, 08 Dec 2023 12:46:14 -0500
X-MC-Unique: UjXtrDZvOkKCAp5HRvEWEQ-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-77f55466facso88980585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 09:46:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702057574; x=1702662374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eK8WutytSz3F60Rl2nxPhK1kwwDpKHRRkbGPCAgiMXQ=;
        b=X1A+FF8VsmWmfR4E4p+ITyVFU96SZwTpeOtYFREtThcZLv/oqALlLyvh2mfIRlYpr5
         qCkj9ffo00oPVlE0/JE/ZyB05SulnJaEnXcVRQfVWE051T0msrY49lxf20CLcPx9ngoc
         sqLCeiM0o+rvnw9cK/lEJ/ZVVd21cD7I/Fx/YN6U5vxpUyk6IS1UKg1RsRo3qTMMca5y
         c1cwnZtteeNj4SLcGrh3SIiwLdKwniFADx+xHiM7FddF8Tvb6gPKg5j7iKNb00hMo+yn
         S5SgtxCGQNEOG5ojG7S6DVlWQUBwpB07clQL1z9uLBxHLxb26ag8f0QW0QHEtBkVbRGh
         FFOQ==
X-Gm-Message-State: AOJu0YwtaMrarqfwhOSgX2fqRl/VMCQLD39vLZ2WHRU3kZS0LfzVSnG5
	CgzYstBTIAEhM+T/I3jxFq22oExk333lAwCxV/GzcVYPHcg06isQHMjdoGLSej/GsBDG68uNhLS
	CmznlBlIRouSn2RYdI3sdT10TYw==
X-Received: by 2002:a05:620a:24d6:b0:77f:56f7:8a8a with SMTP id m22-20020a05620a24d600b0077f56f78a8amr1178695qkn.20.1702057573959;
        Fri, 08 Dec 2023 09:46:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKpXkgN5JW84WjaqfJ/Jad2WtjBPYW0HrpnzHhaUBDSgtALPzLuH10yyRlapWlhpBegIs/HQ==
X-Received: by 2002:a05:620a:24d6:b0:77f:56f7:8a8a with SMTP id m22-20020a05620a24d600b0077f56f78a8amr1178678qkn.20.1702057573706;
        Fri, 08 Dec 2023 09:46:13 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::47])
        by smtp.gmail.com with ESMTPSA id i19-20020a056214031300b0067aa164861dsm967730qvu.35.2023.12.08.09.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 09:46:13 -0800 (PST)
Date: Fri, 8 Dec 2023 11:46:11 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: martin.petersen@oracle.com, jejb@linux.ibm.com, andersson@kernel.org, 
	konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_cang@quicinc.com, quic_nitirawa@quicinc.com
Subject: Re: [PATCH v2 14/17] scsi: ufs: qcom: Simplify
 ufs_qcom_{assert/deassert}_reset
Message-ID: <uz6ely7fzsejqnrelmqtqt4lofjvcfxxywro6ae2lfbrfnqtpl@rnyneul7eazo>
References: <20231208065902.11006-1-manivannan.sadhasivam@linaro.org>
 <20231208065902.11006-15-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208065902.11006-15-manivannan.sadhasivam@linaro.org>

On Fri, Dec 08, 2023 at 12:28:59PM +0530, Manivannan Sadhasivam wrote:
> In both the functions, UFS_PHY_SOFT_RESET contains the mask of the reset
> bit. So this can be passed directly as the value to be written for
> asserting the reset. For deasserting, 0 can be passed.
> 
> This gets rid of the FIELD_PREP() inside these functions and also
> UFS_PHY_RESET_{ENABLE/DISABLE} definitions.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  drivers/ufs/host/ufs-qcom.h | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
> index 53db424a0bcb..a109d3359db4 100644
> --- a/drivers/ufs/host/ufs-qcom.h
> +++ b/drivers/ufs/host/ufs-qcom.h
> @@ -92,9 +92,6 @@ enum {
>  #define TEST_BUS_SEL		GENMASK(22, 19)
>  #define UFS_REG_TEST_BUS_EN	BIT(30)
>  
> -#define UFS_PHY_RESET_ENABLE	1
> -#define UFS_PHY_RESET_DISABLE	0
> -
>  /* bit definitions for REG_UFS_CFG2 register */
>  #define UAWM_HW_CGC_EN		BIT(0)
>  #define UARM_HW_CGC_EN		BIT(1)
> @@ -157,8 +154,7 @@ ufs_qcom_get_controller_revision(struct ufs_hba *hba,
>  
>  static inline void ufs_qcom_assert_reset(struct ufs_hba *hba)
>  {
> -	ufshcd_rmwl(hba, UFS_PHY_SOFT_RESET, FIELD_PREP(UFS_PHY_SOFT_RESET, UFS_PHY_RESET_ENABLE),
> -		    REG_UFS_CFG1);
> +	ufshcd_rmwl(hba, UFS_PHY_SOFT_RESET, UFS_PHY_SOFT_RESET, REG_UFS_CFG1);
>  
>  	/*
>  	 * Make sure assertion of ufs phy reset is written to
> @@ -169,8 +165,7 @@ static inline void ufs_qcom_assert_reset(struct ufs_hba *hba)
>  
>  static inline void ufs_qcom_deassert_reset(struct ufs_hba *hba)
>  {
> -	ufshcd_rmwl(hba, UFS_PHY_SOFT_RESET, FIELD_PREP(UFS_PHY_SOFT_RESET, UFS_PHY_RESET_DISABLE),
> -		    REG_UFS_CFG1);
> +	ufshcd_rmwl(hba, UFS_PHY_SOFT_RESET, 0, REG_UFS_CFG1);
>  
>  	/*
>  	 * Make sure de-assertion of ufs phy reset is written to
> -- 
> 2.25.1
> 


