Return-Path: <linux-arm-msm+bounces-60355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7150ACF4EE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 19:05:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 540143AEBD6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 17:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60871274FEB;
	Thu,  5 Jun 2025 17:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="URpV1ayP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB8327703C
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 17:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749143100; cv=none; b=mhTyGvSmQ81j24O/7dsPUZgo5jQfgksw48C5HXoVf/EHs85uOrkjawOWIXOxtpFef2xhpt0X+Wz2NZyVYVlbI4VG6tr80pJLDOo7mXJQxBQFi6zjUGAkfJE8xR6JCNGNJvEG0gxypyIZc2aDXm3SfHl5m1wK6ZtJAkUO94xRkaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749143100; c=relaxed/simple;
	bh=+ztx+saxdpo8WjLXWjfvlFkWk9/y7B6T3vhKNHZol2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SswNaKtoe2TiaUacFiBIDpZYUvYrBmS/kRWRCv6Dzly7nG+IzY0ZcMpaxQRg1bNxKkvDOBRns5iaYZ8STpvzpG24vLH3Zg4yp1d0pu7ygm+DxmUHWN6z7eD0TnbThe/s3H/+Eg8kHBlmkZnEtNW+ZaqqtFHbzTdfwv/MtknsZXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=URpV1ayP; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-747e41d5469so1441289b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 10:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749143098; x=1749747898; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SbbUkUUtWYP7VuElEDtlyDh5ofC9gH6hUBqQUj6UZLM=;
        b=URpV1ayPErWQO4AF2LZ/LMXXoUF5JhO0+TwoJmfzp4hbzHfTxjB1QUFgVk4TYWbLzd
         P2G3OViWygb88QfAXSN87owVHrJ+BVMpIAvK4yESvRlgCs7a1Wgdcx8jKSwhhC8uTy2O
         wK/XM4ZhQ4tXsja+RAhGMgtAAUpLhMj9oQz4fBomath34Q4s+Cc9V23KRthVblm6WBql
         AqEG+hkTCJU0nXmBqGiJw2XT2MjbuLCnC1bOiACpptqHbQMk07n1ZaK1u4GEoscNlodH
         gyzqCNnmaL7MilahS0SUwSDhLWSAXDyhQ75Aa106kHDr/MjRp2vTYCl4XW4i1u9wM5tC
         527Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749143098; x=1749747898;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SbbUkUUtWYP7VuElEDtlyDh5ofC9gH6hUBqQUj6UZLM=;
        b=D6ITLDor7B5FCMbYgK4KwTkEx4nQlsXgP9Q3GzvMnNgm1L1xLSWWLiwsDA5UIlf8a+
         +ZsfiHhthKQxwvixZ4x3cS5i5y/r6O8aZNnt6IfUxlL8smFSTvmXR0c4OD1dOTkCRWjS
         798CzMH7k7Wu4ilzs3vQWNG7LBUcDeFfARLwCcBjrl+xiAN5sI3EVRITirU84w26TWep
         Ac22y/vuU8G/Y643EympT6JvhBV+O+Y7wuOBuulp4v7A9sBwSjTYDsG6E8LKOfsCdMbP
         sGPiH2IL5WUos5RIbVAkfYw6a4yykdZd6Dg89/UNUe3JXlwr+0Cpne4Nu+Borv2vqKtk
         RSpg==
X-Forwarded-Encrypted: i=1; AJvYcCVqz+YddPgyl5Thkz3g3EJLMpvF7aRT/+X4AeMl4Z67kwbMgKHHEAcvq4leRyowadQG3h8qtoxr1foHo/2u@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjx2iQKRz8LIO6ReGD4YchUAbQcgFPXMCEaNv91va79zzjDpqo
	2/ek6BmObHdJ9dNnkAAAMPUc/dMTyeCqv1g8Zms+9OFfWT6BTxtX2EtHIeVzAqHkyA==
X-Gm-Gg: ASbGncvu3zblOgElKb8CAfJ3Va0zfDZri4VsPwLizHRzY/T6CbrZAB5Yx2T3pbWRwkE
	ZvnhHs+9gR24ND61ch1BzRl8yesdfIizqYJGuzDChDRcklVwHg1BYEGehIAN0NEksGkwBrRNlh4
	AKKqtVh9y1KyF6exhtht2eNbXB9Sv862DIyFwXfTYIKJCoyfRHvO/gagrPjFf8F9yRfaIAhcHGC
	29CH7SLAPzx5b9HVoRhQIeHWuM6HRFpkhEzPFMcN/ZfT6qgnZi5oQnN+tc3KNiH1LYgOGdlKly+
	AqRSmb8rzEBKm9LI5ehl/t7cGj5yOH+9FqQntZ3vWzoByn6ykLTtCiTUbHh4
X-Google-Smtp-Source: AGHT+IGUk6E7tZs4jvxQ/2qMmPkdZRrWLxZE7gyBNwvHo8bKeonXU/fKOmrVEc9T6w5FAgWfrpOsnw==
X-Received: by 2002:a05:6a00:2e24:b0:740:aa33:c6f8 with SMTP id d2e1a72fcca58-74827e73bb6mr648718b3a.7.1749143097742;
        Thu, 05 Jun 2025 10:04:57 -0700 (PDT)
Received: from thinkpad ([120.60.50.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afed4bafsm13054775b3a.79.2025.06.05.10.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:04:57 -0700 (PDT)
Date: Thu, 5 Jun 2025 22:34:50 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: jeff.hugo@oss.qualcomm.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, quic_bqiang@quicinc.com, 
	can.guo@oss.qualcomm.com, Mayank Rana <mayank.rana@oss.qualcomm.com>
Subject: Re: [PATCH v2] mhi: host: Add standard elf image download
 functionality
Message-ID: <sdhop6vyvt4y63tbbtorqfd5xa4ckbiwxdad5g6zzwlljqvd6q@eoaqmairdeey>
References: <20250603-standard_elf_image_load_support-v2-1-cce97644e99e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250603-standard_elf_image_load_support-v2-1-cce97644e99e@oss.qualcomm.com>

On Tue, Jun 03, 2025 at 02:05:44AM -0700, Qiang Yu wrote:
> From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> 
> Currently, the FBC image is a non-standard ELF file that contains a single
> ELF header, followed by segments for SBL, RDDM, and AMSS. Some devices are
> unable to process this non-standard ELF format and therefore require
> special handling during image loading.
> 

What are those "some devices"? Why are they not able to process this format
which is used across the rest of the Qcom devices?

> Add standard_elf_image flag to determine whether the device can process
> the non-standard ELF format. If this flag is set, a standard ELF image
> must be loaded, meaning the first 512 KB of the FBC image should be
> skipped when loading the AMSS image over the BHIe interface.

Please explain what is present in the first 512KiB and why skipping that is
required.

> Note that
> this flag does not affect the SBL image download process.
> 
> Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
> Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
> Changes in v2:
> - V1 patch is paused because of no user. WLAN team plan to add support for
>   new WLAN chip that requires this patch, so send v2.
> - Change author and SOB with new mail address.
> - Reword commit message.
> - Place standard_elf_image flag after wake_set in struct mhi_controller
> - Link to v1: https://lore.kernel.org/mhi/1689907189-21844-1-git-send-email-quic_qianyu@quicinc.com/
> ---
>  drivers/bus/mhi/host/boot.c | 7 +++++++
>  include/linux/mhi.h         | 4 ++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index efa3b6dddf4d2f937535243bd8e8ed32109150a4..f1686a8e0681d49f778838820b44f4c845ddbd1f 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -584,6 +584,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	 * device transitioning into MHI READY state
>  	 */
>  	if (fw_load_type == MHI_FW_LOAD_FBC) {
> +		dev_dbg(dev, "standard_elf_image:%s\n",
> +			(mhi_cntrl->standard_elf_image ? "True" : "False"));

This print is just a noise even for debug.

> +		if (mhi_cntrl->standard_elf_image) {
> +			fw_data += mhi_cntrl->sbl_size;
> +			fw_sz -= mhi_cntrl->sbl_size;

Is it possible to detect the image type during runtime instead of using a flag?
Also, the flag is currently unused. So it should come along an user.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

