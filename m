Return-Path: <linux-arm-msm+bounces-44372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9868A05C41
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 14:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 381441889180
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 13:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51321FA8C0;
	Wed,  8 Jan 2025 13:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N7O5f7bH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A94E1F75A7
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 13:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736341242; cv=none; b=hU3jUTvVFjfLj+LKs3O+ineGookPMnIUosplCMaiMaRFmy7d5iATZjKBAdWWGf/aAMjus7G4buRIyzhj2YD12nPHZ4a9JKlf5wiJAZ1V6kzhctwvK9baU3ylNkn/l9BsHhuWaixO2vVEAG8IHW61DT7olM6VH8zlg47xHPab/yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736341242; c=relaxed/simple;
	bh=Wj28RozVCOy4C0tYb73R3985H60BjAclllBcLXn5gnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P7xoJic3BtVdd2JZKD2NxcR3q8dE7rDACqNMOCgYksgRWPdDFNEL9M0H7BGKTOd0puIkSt9bHHACMYkavA9PfPxunu6VdRb+LrLfiViDDvPFk8QKaWmB6mNdjUQBglyXpN+noFHzNMADNddlfllqv160mcqtRAkPSQhGMXOq66Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N7O5f7bH; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2162c0f6a39so14873875ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 05:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736341239; x=1736946039; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ArHdKKpjSTh/QEt1kD1NBblzUcPvKmhivs35nKXQPgw=;
        b=N7O5f7bHyPdFVs8KDl3y3XGVVlPw0IShoDRdhv/5s8YsD8cs1PckO2OOyeMNI9Gn7N
         wwvmPYVelxds3rPS2OBH/JqxlYrX6vfVgdgI4DGnxRx+FOMFikHF3b7Yv2ITTmn/zwCP
         2noeN59w9hss17ogUrQYoCikqY6NuWLsBxgeYS64DzNqkDm9B/ovSvcR2cn6HDibploh
         nGM6RA0gz24kvjbIDyfj6gCKbf/10WD4KFF8TIESxtZBYVUf4gXYx4WNjs+oRxPcTbFZ
         DZGTupniZnr5NsVwWz80xWJ1ktLwK1XhlvyfX+Yfe5RCCP6aQ1Ca1enepSgX3LYB9SpC
         zI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736341239; x=1736946039;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ArHdKKpjSTh/QEt1kD1NBblzUcPvKmhivs35nKXQPgw=;
        b=J3Iw3ov2VQZOoSm9zVvDZviXnD8mAGXJGEw4QqxvSAyeS4P/tueinuFAUHPAgIGIjg
         jzODLwDzCwYuLiJwo0qxo0SwHvAVYSDfsqRxc3k7lqwzlNWrEA4Abaz934/c+fF1AP21
         N35o9YCF+drmRnba1b1IG/TLn5L74oQtGUudLTtLx88rNzNmtXjjyQEqS1rNUU5VkxKS
         hqT59Uex6v2hfJR/Q1unzAIhKKSHzuqkZr0KDc4wfAc87qtVX3ap4B9Eb/ozMOS6vAkJ
         iF5Iq4KGHrkRV1/Fj0+arj+3p2cEaf7CWqYzC2iDTtd1H6tfW01WjS2253teVvRoLN/5
         b5Uw==
X-Forwarded-Encrypted: i=1; AJvYcCUkrP6a2FXRNlSSY1YcFNQrULPCbSEcfO+60feWWVCWcH0YzeYTZVUgZNxTD1j6ovosSQ1CfMzgg+Umk4vQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7/6zNNeLHk0VbzfuubejEDccjK+5aodSVks+4S3+82DQXrJzg
	LPmqOZFlsjMbeo13WAgFMBRa98cWtWSmuBn2nyKdrt1vEDqDY/phkHK8BPI9Lw==
X-Gm-Gg: ASbGncuzCF7bn0qypJyIfIDxUG1hBwr5Vpk3kHzfkqPPz2DKdzZlCozHBTRXyPYElPp
	EpdGFzyOHEcZ8/8ouD+oru9hNHuyPjZoQsrHYENThVrL/FfapM1C5MWFLXKJfL8C+UDj2uk/erY
	SVjrdR08kydGvsb/LqbckqWTB9PQ2jS+kP+3SEIWQMZJEQXk9xzYco1Ehb58pWDY00oElMjSWue
	zuRFC0ZlTl5iUbussoVDjAxSW6tg45MjNINzPyzNo1icXxGkrUTNhncdgZPhFj8WRDk
X-Google-Smtp-Source: AGHT+IEzKpMdYLbC5yp6u5C+8MfqOqVWWhcO4hQ6BfaG30+WOj6SupeNYMvZNnYglrQooMN3vbMUYg==
X-Received: by 2002:a05:6a00:35c9:b0:728:15fd:dabb with SMTP id d2e1a72fcca58-72d2171f5f8mr4815569b3a.8.1736341238992;
        Wed, 08 Jan 2025 05:00:38 -0800 (PST)
Received: from thinkpad ([117.213.97.234])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad6cc885sm35361737b3a.0.2025.01.08.05.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 05:00:38 -0800 (PST)
Date: Wed, 8 Jan 2025 18:30:32 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Cc: James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
	andersson@kernel.org, bvanassche@acm.org, ebiggers@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>,
	Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: Re: [PATCH V9] scsi: ufs: qcom: Enable UFS Shared ICE Feature
Message-ID: <20250108130032.37lz3ee6gcmfc36j@thinkpad>
References: <20250107135624.7628-1-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250107135624.7628-1-quic_rdwivedi@quicinc.com>

On Tue, Jan 07, 2025 at 07:26:24PM +0530, Ram Kumar Dwivedi wrote:
> By default, the UFS controller allocates a fixed number of RX
> and TX engines statically. Consequently, when UFS reads are in
> progress, the TX ICE engines remain idle, and vice versa.
> This leads to inefficient utilization of RX and TX engines.
> 
> To address this limitation, enable the UFS shared ICE feature for
> Qualcomm UFS V5.0 and above. This feature utilizes a pool of crypto
> cores for both TX streams (UFS Write – Encryption) and RX streams
> (UFS Read – Decryption). With this approach, crypto cores are
> dynamically allocated to either the RX or TX stream as needed.
> 
> Co-developed-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
> Signed-off-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
> Co-developed-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> ---
> Changes from v8:
> 1. Addressed Manivannan's comment to call ufs_qcom_config_ice_allocator()
>    from ufs_qcom_ice_enable().

No I did not. More below.

> 2. Addressed Manivannan's comment to place UFS_QCOM_CAP_ICE_CONFIG
>    definition outside of the ufs_qcom_host struct.
> 3. Addressed Manivannan's comment to align ICE definitions with
>    other definitions.
> 
> Changes from v7:
> 1. Addressed Eric's comment to perform ice configuration only if
>    UFSHCD_CAP_CRYPTO is enabled.
>  
> Changes from v6: 
> 1. Addressed Eric's comment to replace is_ice_config_supported() helper
>    function with a conditional check for UFS_QCOM_CAP_ICE_CONFIG.
> 
> Changes from v5: 
> 1. Addressed Bart's comment to declare the "val" variable with
>    the "static" keyword.
> 
> Changes from v4:
> 1. Addressed Bart's comment to use get_unaligned_le32() instead of
>    bit shifting and to declare val with the const keyword.
> 
> Changes from v3:
> 1. Addressed Bart's comment to change the data type of "config" to u32
>    and "val" to uint8_t.
> 
> Changes from v2:
> 1. Refactored the code to have a single algorithm in the code and
> enabled by default.
> 2. Revised the commit message to incorporate the refactored change.
> 3. Qcom host capabilities are now enabled in a separate function.
> 
> Changes from v1:
> 1. Addressed Rob's and Krzysztof's comment to fix dt binding compilation
>    issue.
> 2. Addressed Rob's comment to enable the nodes in example.
> 3. Addressed Eric's comment to rephrase patch commit description.
>    Used terminology as ICE allocator instead of ICE algorithm.
> 4. Addressed Christophe's comment to align the comment as per kernel doc.
> ---
>  drivers/ufs/host/ufs-qcom.c | 38 +++++++++++++++++++++++++++++++++
>  drivers/ufs/host/ufs-qcom.h | 42 ++++++++++++++++++++++++++++++++++++-
>  2 files changed, 79 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 68040b2ab5f8..f4b9fb0740b4 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -15,6 +15,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/reset-controller.h>
>  #include <linux/time.h>
> +#include <linux/unaligned.h>
>  
>  #include <soc/qcom/ice.h>
>  
> @@ -105,11 +106,33 @@ static struct ufs_qcom_host *rcdev_to_ufs_host(struct reset_controller_dev *rcd)
>  }
>  
>  #ifdef CONFIG_SCSI_UFS_CRYPTO
> +/**
> + * ufs_qcom_config_ice_allocator() - ICE core allocator configuration
> + *
> + * @host: pointer to qcom specific variant structure.
> + */
> +static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
> +{
> +	struct ufs_hba *hba = host->hba;
> +	static const uint8_t val[4] = { NUM_RX_R1W0, NUM_TX_R0W1, NUM_RX_R1W1, NUM_TX_R1W1 };
> +	u32 config;
> +
> +	if (!(host->caps & UFS_QCOM_CAP_ICE_CONFIG) ||
> +			!(host->hba->caps & UFSHCD_CAP_CRYPTO))
> +		return;
> +
> +	config = get_unaligned_le32(val);
> +
> +	ufshcd_writel(hba, ICE_ALLOCATOR_TYPE, REG_UFS_MEM_ICE_CONFIG);
> +	ufshcd_writel(hba, config, REG_UFS_MEM_ICE_NUM_CORE);
> +}
>  
>  static inline void ufs_qcom_ice_enable(struct ufs_qcom_host *host)
>  {
>  	if (host->hba->caps & UFSHCD_CAP_CRYPTO)
>  		qcom_ice_enable(host->ice);
> +
> +	ufs_qcom_config_ice_allocator(host);

I did not ask you to move ufs_qcom_config_ice_allocator() inside
ufs_qcom_ice_enable(). Rather do below in ufs_qcom_hce_enable_notify():

	ufs_qcom_config_ice_allocator(host);
	ufs_qcom_ice_enable(host);

>  }
>  
>  static int ufs_qcom_ice_init(struct ufs_qcom_host *host)
> @@ -196,6 +219,11 @@ static inline int ufs_qcom_ice_suspend(struct ufs_qcom_host *host)
>  {
>  	return 0;
>  }
> +
> +static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
> +{
> +}
> +
>  #endif
>  
>  static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
> @@ -932,6 +960,14 @@ static void ufs_qcom_set_host_params(struct ufs_hba *hba)
>  	host_params->hs_tx_gear = host_params->hs_rx_gear = ufs_qcom_get_hs_gear(hba);
>  }
>  
> +static void ufs_qcom_set_host_caps(struct ufs_hba *hba)
> +{
> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +
> +	if (host->hw_ver.major >= 0x5)
> +		host->caps |= UFS_QCOM_CAP_ICE_CONFIG;
> +}
> +
>  static void ufs_qcom_set_caps(struct ufs_hba *hba)
>  {
>  	hba->caps |= UFSHCD_CAP_CLK_GATING | UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
> @@ -940,6 +976,8 @@ static void ufs_qcom_set_caps(struct ufs_hba *hba)
>  	hba->caps |= UFSHCD_CAP_WB_EN;
>  	hba->caps |= UFSHCD_CAP_AGGR_POWER_COLLAPSE;
>  	hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
> +
> +	ufs_qcom_set_host_caps(hba);
>  }
>  
>  /**
> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
> index b9de170983c9..de41028ecee0 100644
> --- a/drivers/ufs/host/ufs-qcom.h
> +++ b/drivers/ufs/host/ufs-qcom.h
> @@ -135,6 +135,46 @@ enum {
>  #define UNIPRO_CORE_CLK_FREQ_201_5_MHZ         202
>  #define UNIPRO_CORE_CLK_FREQ_403_MHZ           403
>  
> +

Extra newline

> +#ifdef CONFIG_SCSI_UFS_CRYPTO

As I said in previous iteration, you do not need the guard for definitions.

> +
> +/* ICE configuration to share AES engines among TX stream and RX stream */
> +#define UFS_QCOM_CAP_ICE_CONFIG BIT(0)

This is a bit definition. So define this as like other bit definitions in this
header.

> +#define ICE_ALLOCATOR_TYPE 2
> +#define REG_UFS_MEM_ICE_CONFIG 0x260C
> +#define REG_UFS_MEM_ICE_NUM_CORE  0x2664

I asked you to move these two register definitions to register enum but still
not addressed.

> +
> +/*
> + * Number of cores allocated for RX stream when Read data block received and
> + * Write data block is not in progress
> + */
> +#define NUM_RX_R1W0 28
> +
> +/*
> + * Number of cores allocated for TX stream when Device asked to send write
> + * data block and Read data block is not in progress
> + */
> +#define NUM_TX_R0W1 28
> +
> +/*
> + * Number of cores allocated for RX stream when Read data block received and
> + * Write data block is in progress
> + * OR
> + * Device asked to send write data block and Read data block is in progress
> + */
> +#define NUM_RX_R1W1 15
> +
> +/*
> + * Number of cores allocated for TX stream (UFS write) when Read data block
> + * received and Write data block is in progress
> + * OR
> + * Device asked to send write data block and Read data block is in progress
> + */
> +#define NUM_TX_R1W1 13
> +
> +#endif /* UFS_CRYPTO */
> +

Extra newline.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

