Return-Path: <linux-arm-msm+bounces-44010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A56B5A02764
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 15:02:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04328188586B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 14:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6A21DDC10;
	Mon,  6 Jan 2025 14:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iEyyMgTm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8421DE2AE
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 14:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736172144; cv=none; b=IRjgP+Upl4/QpD2UtOuzZtwlwiapLqNjTk8sFFKQ2iBwOORjbfj5NSF0xnKxgpRE797JVrSwCOftE6Gg2c/JpJ1fngDtCwzQYhO4nZYV2WG06eMy67OsL8r71tkFSXsMEr2JCwqmB7FotugyuTyS/oKs1TP4qfMEBAt4UBk4F2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736172144; c=relaxed/simple;
	bh=VMo3ggj1ddD7OUQRH2+1w40TizwJaWzLcGZfagrTIMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SPI7ybjjI/2KF8EFWCzIDv3WIzSZrju1SUFp92NzLhDGjw78mig+Vr9U1/KpMCXQeCwciEOlA+Nekn3sgmPVT6kr2bcKr+rTiRAfBYZqycdeA4FPmkFRkTadYtWvs6d4f4klU7a6+UejpcLoFLadcz5C5eLzU2zUuP0tjTxme1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iEyyMgTm; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2f13acbe29bso18421168a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 06:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736172140; x=1736776940; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qG0bvDDwOBsV3PJ24owNyZw7RnduShODhEkUZTayH30=;
        b=iEyyMgTmG0+MarjCb71rpM2Fa8gpUJBlH3cBRLSGy/235mF+yVn9JVxfSYikPzbsQ+
         kd+lM7TImds0FUTAv/904fmtkWtakS6HtbbiWpe1ZuyvMuLnD0GetOytp16MfF3Ef0Oh
         3Qg9Jaz4+F3CBg3sHtz6UxsR/MtsecJviVVDN3L0FiUnm7+STMD17Rald2TSFZLDdXbW
         dGrDTzYGcaIOcmPeJPTj3MLWqef0X7dX50dPIS/7GcMb7UUcqjQYaItFrk9LuR1ExS83
         4GIS1+ZgXZQbsGL6kI7XRm6vVU+JUfD26jowfsaRnsg6qeBOH7G5pt3Is4kJPOvhO3Rt
         jdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736172140; x=1736776940;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qG0bvDDwOBsV3PJ24owNyZw7RnduShODhEkUZTayH30=;
        b=f6y71lXPtLmgeyAYYalzQD6fMkP9HnRCCP8WWAuHXHpgA6bPsMplrKeaDuJz1aoML2
         Odx9oR8/vA6qoOxjrtgy+XztsSC1Odi6kPquTG47ikNIbdOyAGD/qCbM0RyZLHaaQrgL
         L7n/feWUvradUySZnRTbgIq8g2BQ6O+DlKTM9X98zWQ2ALN+kFkz/pt+Ywkh6988Jb9n
         O5pm7keL2uoyOU6s3f3itafjwQ3C6ATmetD1G1BEPkwPJAWBrHn0tX/sjJwrINpGqYOU
         D/okihVFrgcoBMsulCazoAM8wzBPE+ns2KXEyFp0UMMxWNGzwumfoO1fphdI6lM4f1nt
         OZMg==
X-Forwarded-Encrypted: i=1; AJvYcCVyK9y1PT4gOOa26tI1lHTVhoGSVEO4e3LX6Q9YX3C8QHGX3yhQqafzZ9OmoNXNEQ9Q+POR2H6MdT27m8Pe@vger.kernel.org
X-Gm-Message-State: AOJu0YzazniQRyxPpEbLYsqs0qEcEqZkZ3v8vxUB1z1yNZFyDDoOfHaw
	PP2t6HLA1VV2sig/UlBEy+YS6KIJPwL+W0nAAgvkXODBafxAuZyhGqMSTMlmgw==
X-Gm-Gg: ASbGncsAbIFAEWQSYOndq3H2aNsUrLLLD5OJVDfEqTV1xuX5efisO6xx23OUZB+kY9W
	rcy6V6d9mfO49G/FXabqGMvifoVsDe8wtAtB7AKY3DB3+luCJDMpF8AKFNz2J9710UDRatRiQWv
	qZMzL5JsUQ7J9xL0q+XD6zIWlov6GQxRFKcy7nYsBzegAeksiMh4uz5mqa4e48d6OYO7mqyIe7O
	ws/3cqcuIyhZse2jALZLzEtSZ5s+E0TUFQKKRKE9ltyjQzYs0wtNge4oi0rIX/0o2c=
X-Google-Smtp-Source: AGHT+IHC33n8izqrUjtJsk8lgn0he0cCkgpOh/Ks6aA/VLHOuADW50fITJ0NAORR4sr2IwEk/FB4xA==
X-Received: by 2002:a05:6a00:7428:b0:725:4a1b:38ec with SMTP id d2e1a72fcca58-72aa9a10440mr85109379b3a.3.1736172139979;
        Mon, 06 Jan 2025 06:02:19 -0800 (PST)
Received: from thinkpad ([120.60.61.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8f90b9sm31338595b3a.131.2025.01.06.06.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:02:19 -0800 (PST)
Date: Mon, 6 Jan 2025 19:32:03 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Cc: James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
	andersson@kernel.org, bvanassche@acm.org, ebiggers@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>,
	Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: Re: [PATCH V8] scsi: ufs: qcom: Enable UFS Shared ICE Feature
Message-ID: <20250106140203.2euwwch4hnjtfbzl@thinkpad>
References: <20241224154725.8127-1-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241224154725.8127-1-quic_rdwivedi@quicinc.com>

On Tue, Dec 24, 2024 at 09:17:25PM +0530, Ram Kumar Dwivedi wrote:
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
>  drivers/ufs/host/ufs-qcom.c | 38 ++++++++++++++++++++++++++++++++++
>  drivers/ufs/host/ufs-qcom.h | 41 ++++++++++++++++++++++++++++++++++++-
>  2 files changed, 78 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 68040b2ab5f8..ffc67b5d5c3e 100644
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
> @@ -105,6 +106,26 @@ static struct ufs_qcom_host *rcdev_to_ufs_host(struct reset_controller_dev *rcd)
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
> @@ -196,6 +217,11 @@ static inline int ufs_qcom_ice_suspend(struct ufs_qcom_host *host)
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
> @@ -435,6 +461,8 @@ static int ufs_qcom_hce_enable_notify(struct ufs_hba *hba,
>  		err = ufs_qcom_enable_lane_clks(host);
>  		break;
>  	case POST_CHANGE:
> +		ufs_qcom_config_ice_allocator(host);
> +

Any reason why this is not paired with ufs_qcom_ice_enable() below?

>  		/* check if UFS PHY moved from DISABLED to HIBERN8 */
>  		err = ufs_qcom_check_hibern8(hba);
>  		ufs_qcom_enable_hw_clk_gating(hba);
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
> index b9de170983c9..92e2278b6a54 100644
> --- a/drivers/ufs/host/ufs-qcom.h
> +++ b/drivers/ufs/host/ufs-qcom.h
> @@ -196,7 +196,8 @@ struct ufs_qcom_host {
>  #ifdef CONFIG_SCSI_UFS_CRYPTO
>  	struct qcom_ice *ice;
>  #endif
> -
> +	#define UFS_QCOM_CAP_ICE_CONFIG BIT(0)

Do not place definition inside struct.

> +	u32 caps;
>  	void __iomem *dev_ref_clk_ctrl_mmio;
>  	bool is_dev_ref_clk_enabled;
>  	struct ufs_hw_version hw_ver;
> @@ -226,6 +227,44 @@ ufs_qcom_get_debug_reg_offset(struct ufs_qcom_host *host, u32 reg)
>  	return UFS_CNTLR_3_x_x_VEN_REGS_OFFSET(reg);
>  };
>  
> +#ifdef CONFIG_SCSI_UFS_CRYPTO

This guard is strictly not needed.

> +
> +/* ICE configuration to share AES engines among TX stream and RX stream */
> +#define ICE_ALLOCATOR_TYPE 2
> +#define REG_UFS_MEM_ICE_CONFIG 0x260C
> +#define REG_UFS_MEM_ICE_NUM_CORE  0x2664

These register definitions should go inside the enum at the top of this file.

Also move other ICE definitions above REG_UFS_CFG2_CGC_EN_ALL to align with
other register definitions.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

