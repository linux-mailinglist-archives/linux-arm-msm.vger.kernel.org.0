Return-Path: <linux-arm-msm+bounces-29783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A40449629CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 16:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2659A1F21B9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 14:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFC5D18990D;
	Wed, 28 Aug 2024 14:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kN1NdiLx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9A516B386
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 14:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724854094; cv=none; b=sMmyL/VB+XQLHXc+CT6IlkKExuOuK9xKZDZw8400tkAwlqZxhUxmG3X02C+MEA5GX9bwyIKBzuxBGfprdRgMh0xW97tyVeSU6Kc8uh7M5DFG42EpDUa2q8HALw1nGj7of7kPBWl65lleb+5CG3W7mYLua7uhwQnGDwnCTLIN/a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724854094; c=relaxed/simple;
	bh=6i0DTl1y7zbuvBA51P56G8/7JFUWcfprfnnfq9ZDKXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PTVbfbXI4HqDzWxyL/hb0rx7nQXgwBXQ6vHFFraKvKf72gXMFU/cO10LULY3TTIVKTxA26vdozudYMDKMffgsisBl3sVQJ6IGfu1KaFeSYPqyWCTxlvhypUsSRcDEcteNP736e2cQOFJ01WwgWnx3GP8ODitBPDrtsgxPYCE4ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kN1NdiLx; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-715cdc7a153so526073b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 07:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724854093; x=1725458893; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5zUmIuVSMTrxDTnFMXgZkNU2N5FNce8+WlLOBteoNVY=;
        b=kN1NdiLxQuYP5shimXt7YOVeK6/wVVwYY/hpQWSN3h+A/4pa2fEB5Kv8AIlndf2Ad2
         flL+5V7sOgw+eHHaX6+pO7U/qtnOomHi23YfCbeqf2CJPG41jSuruHVYsDop0VIDzB4Q
         INucJaf66A8oUt4R0zaUsaYs0SCPs3Z/VnNn54cC3TRqRhWm80ufQUXhQo8GZTdUtadI
         wg32Ri/UglYutNMh9ajDlMyq+nfZEiojxFjLB4geqDY3schZwApqPos81C7oeDql6JGV
         U1qzf5VvItnVqwgLdcUM4wUZ3iidD1fbx1LORttAsM4R8FM2lf0PlWpzDN6qySB3vocq
         hQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724854093; x=1725458893;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5zUmIuVSMTrxDTnFMXgZkNU2N5FNce8+WlLOBteoNVY=;
        b=U/o/UTbefdrYOco5bRtMEcp+8fCPI5Vjs6f5kMzO/MjyirjmE5zrPMG12PoG1EiuzV
         o+c0RlLEE4GxcrsPOztIa4sjxUIGkCJaEEJehW8g7sgs4rWCOvoLMBUSqdD5EAqgzCR9
         ZaKBWKVDw7c78fU5ZfmjdKIEkmx/PFhrPlWXM7zfBgekhGIdw2ckthpi6OhP/cnsgFgH
         TAf8EZabuxmUbHrD4qkyQV/eGnG0B2zo1SwEFgY3/FRC40xp1biWHptE9zqqy+N8inwn
         XzSwOkCphrexGENULiOo09izKVlvAnp5samtgRjAH1dq0pPERe7rjo7J8/CLOLoynjbF
         peKw==
X-Forwarded-Encrypted: i=1; AJvYcCWFbrzbsjd2hfkxshSlFOuOAhbFl+lAixJQtyPcf3BngboOaMh2JPWGRqNu7QHZD3Kad9PRP6/c1GU80F3w@vger.kernel.org
X-Gm-Message-State: AOJu0YxLYPwjMPgVP49a8azcXpwLd4hSBp2Azrdv+qEIkGy70SU4s9v5
	mFQF0YVkFCjK1wUNmhE34mWfORy1KcWjy5pv8V+YDncCKinexMCUokIQpunvcw==
X-Google-Smtp-Source: AGHT+IHSBNCosOUJ4UP07jnycwgnAwwiOp55OzQxxQNujnZSA4wzt+zHe/mbquDbKqudh7XMBpjfDQ==
X-Received: by 2002:a05:6a00:23d2:b0:706:aa39:d5c1 with SMTP id d2e1a72fcca58-715d10fdc97mr3135046b3a.8.1724854092494;
        Wed, 28 Aug 2024 07:08:12 -0700 (PDT)
Received: from thinkpad ([120.56.198.191])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7143425527esm10147003b3a.57.2024.08.28.07.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 07:08:12 -0700 (PDT)
Date: Wed, 28 Aug 2024 19:38:05 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Manish Pandey <quic_mapa@quicinc.com>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_nitirawa@quicinc.com,
	quic_bhaskarv@quicinc.com, quic_narepall@quicinc.com,
	quic_rampraka@quicinc.com, quic_cang@quicinc.com,
	quic_nguyenb@quicinc.com
Subject: Re: [PATCH V2] scsi: ufs: ufs-qcom: add fixup_dev_quirks vops
Message-ID: <20240828140805.zhvand7q3wbdmfrt@thinkpad>
References: <20240828134032.10663-1-quic_mapa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240828134032.10663-1-quic_mapa@quicinc.com>

On Wed, Aug 28, 2024 at 07:10:32PM +0530, Manish Pandey wrote:
> Add fixup_dev_quirk vops in QCOM UFS platforms and provide an initial
> vendor-specific device quirk table to add UFS device specific quirks
> which are enabled only for specified UFS devices.
> 

Why the quirks are enabled only for Qcom platforms? If these are required by the
UFS device, then they should be added to ufs_fixups[] in ufshcd.c.

> Micron and Skhynix UFS device needs DELAY_BEFORE_LPM quirk to have a
> delay before VCC is powered off.
> 

Micron fix is already part of ufs_fixups[].

> Toshiba UFS devices require delay after VCC power rail is turned-off
> in QCOM platforms. Hence add Toshiba vendor ID and DELAY_AFTER_LPM
> quirk for Toshiba UFS devices in QCOM platforms.
> 

This sounds like the issue is specific to Qcom platforms only.

> Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
> ---

Where is the changelog?

- Mani

>  drivers/ufs/host/ufs-qcom.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 810e637047d0..9dbfbe643e5e 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -834,6 +834,25 @@ static int ufs_qcom_apply_dev_quirks(struct ufs_hba *hba)
>  	return err;
>  }
>  
> +/* UFS device-specific quirks */
> +static struct ufs_dev_quirk ufs_qcom_dev_fixups[] = {
> +	{ .wmanufacturerid = UFS_VENDOR_MICRON,
> +	  .model = UFS_ANY_MODEL,
> +	  .quirk = UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM },
> +	{ .wmanufacturerid = UFS_VENDOR_SKHYNIX,
> +	  .model = UFS_ANY_MODEL,
> +	  .quirk = UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM },
> +	{ .wmanufacturerid = UFS_VENDOR_TOSHIBA,
> +	  .model = UFS_ANY_MODEL,
> +	  .quirk = UFS_DEVICE_QUIRK_DELAY_AFTER_LPM },
> +	{}
> +};
> +
> +static void ufs_qcom_fixup_dev_quirks(struct ufs_hba *hba)
> +{
> +	ufshcd_fixup_dev_quirks(hba, ufs_qcom_dev_fixups);
> +}
> +
>  static u32 ufs_qcom_get_ufs_hci_version(struct ufs_hba *hba)
>  {
>  	return ufshci_version(2, 0);
> @@ -1798,6 +1817,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
>  	.link_startup_notify    = ufs_qcom_link_startup_notify,
>  	.pwr_change_notify	= ufs_qcom_pwr_change_notify,
>  	.apply_dev_quirks	= ufs_qcom_apply_dev_quirks,
> +	.fixup_dev_quirks       = ufs_qcom_fixup_dev_quirks,
>  	.suspend		= ufs_qcom_suspend,
>  	.resume			= ufs_qcom_resume,
>  	.dbg_register_dump	= ufs_qcom_dump_dbg_regs,
> -- 
> 2.17.1
> 

-- 
மணிவண்ணன் சதாசிவம்

