Return-Path: <linux-arm-msm+bounces-58897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB0AABF58F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 15:08:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32A857B554F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 13:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27DBB270546;
	Wed, 21 May 2025 13:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ACsfUy/d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58422686A0
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 13:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832903; cv=none; b=MAu8MmC8dTr1xzs9Xe4EMVjEuB3ETwt6LsbQcaNfA1dyIoYwrEHElMtMGUgT9dHz6tiSct4PB1k7Q5NUtGfR/EW1qwEWrRCi3clCSbPXP3P7MSGgI5ZBGH1u/2av7xdKXrJq7npocLYgtwPgyFig7QpLSyI4wuLNlYL7Vp5J4Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832903; c=relaxed/simple;
	bh=y667xlRjshHTCdOcA4582uYlKjS+bp6OLEVTjHaUkzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ep/+cHRz6x2Rn4s/Tt0MMtHJD0lUczikOkZ96NyUprjfHpFFYYa4Db3uqiSSVd4V4T/+m8mpSznU5A/rJb01piqaxMVIU/S1O3AaheV9v9uIMnTqTYiEVyNed9Ksuq5cjJbt3qTJCw0SXX6pXALmaOMcverht60m8Z6vUb3pAgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ACsfUy/d; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-742c5f3456fso3011714b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 06:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747832900; x=1748437700; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xt5u1NW+UKPTvEFieJrj+mDAWfwc6t4eZFA83UFoe+Y=;
        b=ACsfUy/dVIhtCIa4i4sgWdTlmemyn4/Gh3xS2F+MJJEcEvsfT45SeINJE1Bvn7uXSK
         iXfDX17syhq6H+KIlwADx2kTL6Tymjb5aZfJI5VRCiNwyurLb9mSJCQg7kCPVN+iJaNO
         AMqXjmtXcwk6HSUBUzQaIIVtP2DQLW0be22TX0j7G9vOyQT6l9XKlKLcIY7U0fDEswB1
         kJVtJLYEZZ4veeWtzF96a4GMU/5Fdy6C15rEkK9xLwq9jhK27jlAMOY/d+gbdAYuvHgQ
         D0NRVViMFNX0x35suKzKtTsS6A+xZ+oC9PFdglTKTAvpTfRIxzZM8VCIj88ClTzyGwbu
         Kn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747832900; x=1748437700;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xt5u1NW+UKPTvEFieJrj+mDAWfwc6t4eZFA83UFoe+Y=;
        b=XZibDDHNp80pxWN8sruUzWWmHWD/tMxTRpUnCcloJ+GxWAgNSAjUKYRboNoKud1Pz3
         mY9tKxNPq9bGOI6al+wSttDg1QhqGV1yrPggEXsYztB5u/KOJ8dyHOz+wFqnoQ84GIY4
         cJ30+Ez71W+OPFfEbRY0A82MJXR166l7z1eWSTzr53lZLxBrKtiwPsltxWJxJ2IsP4JP
         h6txLo66r7SE8IyxrA2gsIpTHMFv9C5wvEVSiNIeie872V0XnwOkY8hQ0oHw1b5E7BJG
         b69iQPduwG+JFmCfwx0i7RS+8BhTWKVeMomdQtlRAy5msekDh/pVpbHKvvYRlAZJikrb
         2RIA==
X-Forwarded-Encrypted: i=1; AJvYcCXxb2u6/w0RPIsCi63EGR4slBqtgjdIyqgMtEsXusPsYYBUJ938KflRF3WryEgN/vHe9gMUCrQKU/UVXM6L@vger.kernel.org
X-Gm-Message-State: AOJu0YwCQ8+alFyzseVbng5kaBvu+9cR+KAq6ZlHWhkkMgOKr/kAqVE6
	c4WdmZ4RNK7n/M1afWcP0Bbj7cs3s41MjDGE6t9WC9OK25o6+hXh4SocyQyEpdN7qw==
X-Gm-Gg: ASbGncuI/4ibfvul02RRwBIL5k6fELQWFcztM0ETKFOKBdb/Ry7Vc/BfPAsuhtiH0RJ
	fKPHCmptLfaEuPgLs33Oum+hgMON4TLIrc/qC/j9A3Kzn6VfyA+YhUCv3d6em5Bnrn0QCrQIhwz
	CRfk8EGmPqoZaSW7T7M1pwA3H3lAfD1ZQXImx4nn8H5uMolgEPUF5prndzfRJg/E82YD9pCw6lo
	DXiQnODc6BNONf36fW1a57I7cE6MTX6AsqcUZTc4gG3zBJPVXpZg+a8KLr/e+T2dmpJOfoiyXAL
	mjEXKu1GjmjyYIaUSwans5XvdMwjdUin9Sb6X2SjmS8wkWeAkCQYCSdM9Tq+
X-Google-Smtp-Source: AGHT+IHascvxCoFVkA31LZBdvW7jzau3iUVkHksoNUV8TEsEK7Xh8qeVnLYOu02jnBVSWphaqJ0viA==
X-Received: by 2002:aa7:888e:0:b0:742:a02e:dd8d with SMTP id d2e1a72fcca58-742a98b4a84mr28669364b3a.20.1747832899901;
        Wed, 21 May 2025 06:08:19 -0700 (PDT)
Received: from thinkpad ([120.60.52.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970d5c4sm9842432b3a.65.2025.05.21.06.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 06:08:19 -0700 (PDT)
Date: Wed, 21 May 2025 14:08:06 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, bvanassche@acm.org, 
	andersson@kernel.org, neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com, quic_cang@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org
Subject: Re: [PATCH V5 01/11] scsi: ufs: qcom: add a new phy calibrate API
 call
Message-ID: <jnftkie5c5hi6nqhliktxqbj7gykj53lvm5gibt3fjdcq7dber@bh4fxrp3fezu>
References: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
 <20250515162722.6933-2-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250515162722.6933-2-quic_nitirawa@quicinc.com>

On Thu, May 15, 2025 at 09:57:12PM +0530, Nitin Rawat wrote:
> Introduce a new phy calibrate API call in the UFS Qualcomm driver to
> separate phy calibration from phy power-on. This change is a precursor
> to the next patchset in this series, which requires these two operations

'next patchset in the series' wouldn't make sense once this patch gets merged.
They all become commits. So you should mention 'successive commits'.

> to be distinct.
> 
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/ufs/host/ufs-qcom.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 37887ec68412..23b4fc84dc8c 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -531,6 +531,12 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>  		goto out_disable_phy;
>  	}
>  
> +	ret = phy_calibrate(phy);
> +	if (ret) {
> +		dev_err(hba->dev, "Failed to calibrate PHY: %d\n", ret);
> +		goto out_disable_phy;
> +	}
> +
>  	ufs_qcom_select_unipro_mode(host);
>  
>  	return 0;
> -- 
> 2.48.1
> 

-- 
மணிவண்ணன் சதாசிவம்

