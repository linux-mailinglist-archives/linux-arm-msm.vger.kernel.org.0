Return-Path: <linux-arm-msm+bounces-51672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E41ECA66A8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 07:35:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7011188E3C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 06:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 137591A5BBA;
	Tue, 18 Mar 2025 06:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vbFoi6uv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704BB19F47E
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 06:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742279715; cv=none; b=dnktb2p6i3HABfp7Rbo8aXPku7gUqVqOjHMF4ZGYoZs2xEYt3YSIHOllN0jSfKqIHKRsFNJalkN/J1sFeTx3tkJ95Cxm7CPUDb7jF56DJpaNNeOHnIMp34/FbaEJsP/x5W/FWmfhPJMr/VFUdVIMeNhhJ5CQVTGtMYjmtpz8+HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742279715; c=relaxed/simple;
	bh=PryEXhcXzXzoSLQ+jG9MOOOhQkkDY7IE0CkRSj18qSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=chk898RpBvdJr8iOyLf6xSc+v1EjNDRFQAeRMElbGWgbjwFXpHnp7/NvHccD/CTdmtHT6WMmkGPW5AQxLllZL2lws3z9IL07O/qLq+G02vTtB3KPnIxzSCx8BWJtBnKDI/0yvixPJ9RK6oxQ0RltmDvuDbhR3eftOBpLH/h7E64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vbFoi6uv; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-223fb0f619dso86443205ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 23:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742279713; x=1742884513; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U6F27MGkl6WcOKIJ4ECnYu/HOFV7Uz3She2p4aXiUWw=;
        b=vbFoi6uvanuqNU+e3irnqgpyWhyo4pngagj0m938yePxHWczYQAcJYYKxVxGFDdaBs
         7ca0mvYX17QhnMLNeWFEGsyp9zxoW8tbHIubjEIlJ5tcm2R53/KRZu8czaZcr0huLDWq
         nUwTe4kmrEk86cU2knNLzHHqW3cDLTv3VwLzmh2DS2To/zky61+/kQoy+wZOAEXk/cFF
         psM9p7ZywQypam7o3lAGIdx6RCzdtlqsGeWT1OiavYUe9pgxBKjHfpf9O6H20zHqYCnJ
         Bde7bTMSPM2WsWNpUw7DEqfT0efduEkOLp44Co6mOzcnjo5FtHI70uunFCWzCuG37KEA
         tljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742279713; x=1742884513;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U6F27MGkl6WcOKIJ4ECnYu/HOFV7Uz3She2p4aXiUWw=;
        b=qWzDAHva4Fk2SQxqIaKa2FVBOFWbn9CDG4y10/ve/1tUcMI4RacoJpNL0GKwUZ+LX+
         ve/c44+YO0rBWCz54kXnadoxUDWJHdLiK5CKYo+7rN83bnjPrIhPD2X25bUG+mvNIprl
         o2F3PM1ZW80E2gAES5nUK/n0Df/BnXyEcO3YAKyY7Yr2P6vW6Ck6AgxoluHqA/JJIxSW
         47XoI207zNBJrtELH0qL6Ht/C/4kVKXgDtIIjySVFGV4pv1BL2NDw2WmDeafguK4P0iU
         AMGNy2si51liPGXlgzrEC8uUdcNxHGgnFwduG4Kbt9DVEqLfa9mJCvkXUovBOBnMjmjn
         /7kA==
X-Forwarded-Encrypted: i=1; AJvYcCUqYY+XCfQWuwe4NAO+AiecwJQ+8FQO6wXARQ1XOoXH0xFJIX4y8Q9sXqCKF38/JiqoyNp4oFH9SaVxwZ5J@vger.kernel.org
X-Gm-Message-State: AOJu0YxuomLpsBtuYkrxIh7vgqBS6Gmor4D1vGjDiHd/58vSoh5uYVay
	DFmG+5UfaTNys+YBby++P/UOBIFCEv6oAg+a+fi3yvm75eWCdN/vyC8ATz1KNg==
X-Gm-Gg: ASbGncvC7+BxXhH+ic8M+fxlpskJtqzH3nk1A1Hb6/SgzF5+9qDLRLWXMyAzYYOfTAa
	vQ8CPUiSX3+sQ0AWaR6Qml3M2D6V+181b+idi139TKKmpo+94PGcaMc4pD1s0rAOozi7iH99fy3
	hG5y7ygGO2rt/PHLkIVwyDiED74HVkfducMrWCTby86il0fH75KO3uTa0aIk6ywDWdeNl9MUJXT
	wYaUxG1zZWVRFCFYrlyw3Q0WUzPXjKM/tPsXXhY/sM8TlcH1u3d61Yzawoh29ohSRzqiV+hi555
	ZQHSBfrUDsx9jyJVzrsaNp4f9kU9TV850Pl1XXjt6ZUj5WjGLtnO4abt
X-Google-Smtp-Source: AGHT+IHCqFm9csE2qkE4bmWGh9NkZBAUBiZ2j02yr8s8ij2xHhs7et8fWqAp4EPwKF4QP8r/SzWwdQ==
X-Received: by 2002:a05:6a21:918c:b0:1f5:6a1a:329b with SMTP id adf61e73a8af0-1f5c12cd543mr23504218637.32.1742279712736;
        Mon, 17 Mar 2025 23:35:12 -0700 (PDT)
Received: from thinkpad ([120.56.195.170])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737113d71fbsm8711029b3a.0.2025.03.17.23.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 23:35:12 -0700 (PDT)
Date: Tue, 18 Mar 2025 12:05:08 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Manish Pandey <quic_mapa@quicinc.com>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_nitirawa@quicinc.com,
	quic_cang@quicinc.com, quic_nguyenb@quicinc.com
Subject: Re: [PATCH V3 1/3] scsi: ufs-qcom: Add support for dumping HW and SW
 hibern8 count
Message-ID: <20250318063508.4iz4olthqq2rhjce@thinkpad>
References: <20250313051635.22073-1-quic_mapa@quicinc.com>
 <20250313051635.22073-2-quic_mapa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313051635.22073-2-quic_mapa@quicinc.com>

On Thu, Mar 13, 2025 at 10:46:33AM +0530, Manish Pandey wrote:
> This patch adds functionality to dump both hardware and software

No 'patch' in description. Once the patch is merged, it will become as 'commit'.

Also, please use imperative mood to describe the change. I don't know why this
is not followed since I believe, I've given this comment before also (if you
didn't read the process documentation).

> hibern8 enter counts. This enhancement will aid in monitoring and
> debugging hibern8 state transitions by providing detailed count
> information.
> 
> Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 9 +++++++++
>  drivers/ufs/host/ufs-qcom.h | 9 +++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 1b37449fbffc..f5181773c0e5 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -1573,6 +1573,15 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
>  
>  	host = ufshcd_get_variant(hba);
>  
> +	dev_err(hba->dev, "HW_H8_ENTER_CNT=%d\n", ufshcd_readl(hba, REG_UFS_HW_H8_ENTER_CNT));
> +	dev_err(hba->dev, "HW_H8_EXIT_CNT=%d\n", ufshcd_readl(hba, REG_UFS_HW_H8_EXIT_CNT));
> +
> +	dev_err(hba->dev, "SW_H8_ENTER_CNT=%d\n", ufshcd_readl(hba, REG_UFS_SW_H8_ENTER_CNT));
> +	dev_err(hba->dev, "SW_H8_EXIT_CNT=%d\n", ufshcd_readl(hba, REG_UFS_SW_H8_EXIT_CNT));
> +
> +	dev_err(hba->dev, "SW_AFTER_HW_H8_ENTER_CNT=%d\n",
> +			ufshcd_readl(hba, REG_UFS_SW_AFTER_HW_H8_ENTER_CNT));
> +
>  	ufshcd_dump_regs(hba, REG_UFS_SYS1CLK_1US, 16 * 4,
>  			 "HCI Vendor Specific Registers ");
>  
> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
> index d0e6ec9128e7..a41db017009f 100644
> --- a/drivers/ufs/host/ufs-qcom.h
> +++ b/drivers/ufs/host/ufs-qcom.h
> @@ -75,6 +75,15 @@ enum {
>  	UFS_UFS_DBG_RD_EDTL_RAM			= 0x1900,
>  };
>  
> +/* Vendor-specific Hibern8 count registers for the QCOM UFS host controller. */

Get rid of 'for the QCOM UFS host controller'.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

