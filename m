Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 067F33140BB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 21:44:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbhBHUn6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 15:43:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232827AbhBHUmu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 15:42:50 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33C68C06178C;
        Mon,  8 Feb 2021 12:42:09 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id s5so20556158edw.8;
        Mon, 08 Feb 2021 12:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:date:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DJnyZ/1Cnxk+D3nM2fOPzoXqYQ/251s/xnKgRXcQRhw=;
        b=EvLcEAcYrivTK761OkY+cfAheK/A9qrd6wJvIIrvfMZ3nbg5WQhKECLlwXZYXfe5mF
         1MdPqa318RS4fxvnCKevs0qEKz8+kSzoZrBF/iCbmSAyVGxBrlUsZ+jFRm7fZKbyFCbH
         yl8fcX3W1Mp9b7rZEE/gpzG7G69ju1el46x6BiM+7koHGSwzuLWUXTSKbZS8z6j7rzBi
         fifg7JqyWoL3M1FNqcicVmQEfDxCvkcjsqc52XQh6em3OvSKTxoTBTzGnARmMjFqO1zs
         UpH+WZ2Ph4Y9rLZXJWAty/tgj0qHKywy3KbKVjAWNXNvrAfK3rUzvdDk+ciMXX5tgBon
         hejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DJnyZ/1Cnxk+D3nM2fOPzoXqYQ/251s/xnKgRXcQRhw=;
        b=EbZrtuItVIIALMzuSEvF2QNKm1Sa8jiqm6YGNGoHC9EcXSOcc3L0RldCzzf1w6O1z9
         N3qglXZ7l+MNJm65An60Bt46gfkfc9oiTgVmwOaeerwSsLpnuw5u66aF/lrDWmjAcDfn
         CRJlU82CsjWqnm/Frx3CpecTG1fk4mIALaQqXHks05TbhfTK5l5wEesbaFM7VsfEbBsv
         3TPqiLUlrlHxjs8AC2u8FpL3TYyvfBn+GBfcIUqo4mb0mCK+XRFYA6NvmkuPxhh2wOKs
         vgkeDyJEOlM+LuTHbVAScqVPIz+us4y2LrH8XiOEt3WnuZet8+IHMMk3o0JXkgCgbMHg
         0lbQ==
X-Gm-Message-State: AOAM533LZMHhrdV7Y7b7RET85U1hkLDDcgfnO9NGmCcsZh+F+OiyFfED
        By4b/Y51en9omZkNX3zvE10=
X-Google-Smtp-Source: ABdhPJx19QKwaSCRAgeFG8WQLCwKXMZqbqwibtJ0hqpiLh/h1sn40jK/LxOeSxRKJXb8vy0ReWsEAg==
X-Received: by 2002:a05:6402:30a3:: with SMTP id df3mr7839430edb.237.1612816927877;
        Mon, 08 Feb 2021 12:42:07 -0800 (PST)
Received: from ubuntu-laptop (ip5f5bee1b.dynamic.kabel-deutschland.de. [95.91.238.27])
        by smtp.googlemail.com with ESMTPSA id a7sm9334645eje.96.2021.02.08.12.42.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Feb 2021 12:42:07 -0800 (PST)
Message-ID: <4cea12c5c2a1c42ab6c1b96b82489cc59da39517.camel@gmail.com>
Subject: Re: [PATCH] scsi: ufs: create a hook for unipro dme control
From:   Bean Huo <huobean@gmail.com>
To:     Leo Liou <leoliou@google.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, alim.akhtar@samsung.com,
        avri.altman@wdc.com, jejb@linux.ibm.com,
        martin.petersen@oracle.com, stanley.chu@mediatek.com,
        cang@codeaurora.org, asutoshd@codeaurora.org, beanhuo@micron.com,
        jaegeuk@kernel.org, adrian.hunter@intel.com, satyat@google.com,
        essuuj@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Mon, 08 Feb 2021 21:42:05 +0100
In-Reply-To: <20210208125628.2758665-1-leoliou@google.com>
References: <20210208125628.2758665-1-leoliou@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 2021-02-08 at 20:56 +0800, Leo Liou wrote:
> Based on ufshci spec, it defines that "Offset C0h to FFh" belong
> to vendor specific. If cpu vendor doesn't support these commands, it
> makes the dme errors:
> 
> ufs: dme-set: attr-id 0xd041 val 0x1fff failed 0 retries
> ufs: dme-set: attr-id 0xd042 val 0xffff failed 0 retries
> ufs: dme-set: attr-id 0xd043 val 0x7fff failed 0 retries
> 

Hi Leo
"Offset C0h to FFh" registers belong to the UFSHCI, but the attribtes
you moved belong to "DME Attributes for DME_SET-based High Level Power
Mode Control" defined in Unipro and doesen't say they are vendor-
defined attributes. How these two are associated?


Kind regards,
Bean

> Create a hook for unipro vendor-specific commands.
> 
> Signed-off-by: Leo Liou <leoliou@google.com>
> ---
>  drivers/scsi/ufs/ufs-qcom.c | 11 +++++++++++
>  drivers/scsi/ufs/ufs-qcom.h |  5 +++++
>  drivers/scsi/ufs/ufshcd.c   |  7 +------
>  drivers/scsi/ufs/ufshcd.h   |  8 ++++++++
>  drivers/scsi/ufs/unipro.h   |  4 ----
>  5 files changed, 25 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-
> qcom.c
> index 2206b1e4b774..f2a925587029 100644
> --- a/drivers/scsi/ufs/ufs-qcom.c
> +++ b/drivers/scsi/ufs/ufs-qcom.c
> @@ -759,6 +759,16 @@ static int ufs_qcom_pwr_change_notify(struct
> ufs_hba *hba,
>  	return ret;
>  }
>  
> +static void ufs_qcom_unipro_dme_set(struct ufs_hba *hba)
> +{
> +	ufshcd_dme_set(hba,
> UIC_ARG_MIB(DME_LocalFC0ProtectionTimeOutVal),
> +		       DL_FC0ProtectionTimeOutVal_Default);
> +	ufshcd_dme_set(hba, UIC_ARG_MIB(DME_LocalTC0ReplayTimeOutVal),
> +		       DL_TC0ReplayTimeOutVal_Default);
> +	ufshcd_dme_set(hba, UIC_ARG_MIB(DME_LocalAFC0ReqTimeOutVal),
> +		       DL_AFC0ReqTimeOutVal_Default);
> +}
> +
>  static int ufs_qcom_quirk_host_pa_saveconfigtime(struct ufs_hba
> *hba)
>  {
>  	int err;
> @@ -1469,6 +1479,7 @@ static const struct ufs_hba_variant_ops
> ufs_hba_qcom_vops = {
>  	.hce_enable_notify      = ufs_qcom_hce_enable_notify,
>  	.link_startup_notify    = ufs_qcom_link_startup_notify,
>  	.pwr_change_notify	= ufs_qcom_pwr_change_notify,
> +	.unipro_dme_set		= ufs_qcom_unipro_dme_set,
>  	.apply_dev_quirks	= ufs_qcom_apply_dev_quirks,
>  	.suspend		= ufs_qcom_suspend,
>  	.resume			= ufs_qcom_resume,
> diff --git a/drivers/scsi/ufs/ufs-qcom.h b/drivers/scsi/ufs/ufs-
> qcom.h
> index 8208e3a3ef59..83db97caaa1b 100644
> --- a/drivers/scsi/ufs/ufs-qcom.h
> +++ b/drivers/scsi/ufs/ufs-qcom.h
> @@ -124,6 +124,11 @@ enum {
>  /* QUniPro Vendor specific attributes */
>  #define PA_VS_CONFIG_REG1	0x9000
>  #define DME_VS_CORE_CLK_CTRL	0xD002
> +
> +#define DME_LocalFC0ProtectionTimeOutVal	0xD041
> +#define DME_LocalTC0ReplayTimeOutVal		0xD042
> +#define DME_LocalAFC0ReqTimeOutVal		0xD043
> +
>  /* bit and mask definitions for DME_VS_CORE_CLK_CTRL attribute */
>  #define DME_VS_CORE_CLK_CTRL_CORE_CLK_DIV_EN_BIT		BIT(8)
>  #define DME_VS_CORE_CLK_CTRL_MAX_CORE_CLK_1US_CYCLES_MASK	0xFF
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index fb32d122f2e3..8ba2ce8c5d0c 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -4231,12 +4231,7 @@ static int ufshcd_change_power_mode(struct
> ufs_hba *hba,
>  	ufshcd_dme_set(hba, UIC_ARG_MIB(PA_PWRMODEUSERDATA5),
>  			DL_AFC1ReqTimeOutVal_Default);
>  
> -	ufshcd_dme_set(hba,
> UIC_ARG_MIB(DME_LocalFC0ProtectionTimeOutVal),
> -			DL_FC0ProtectionTimeOutVal_Default);
> -	ufshcd_dme_set(hba, UIC_ARG_MIB(DME_LocalTC0ReplayTimeOutVal),
> -			DL_TC0ReplayTimeOutVal_Default);
> -	ufshcd_dme_set(hba, UIC_ARG_MIB(DME_LocalAFC0ReqTimeOutVal),
> -			DL_AFC0ReqTimeOutVal_Default);
> +	ufshcd_vops_unipro_dme_set(hba);
>  
>  	ret = ufshcd_uic_change_pwr_mode(hba, pwr_mode->pwr_rx << 4
>  			| pwr_mode->pwr_tx);
> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> index aa9ea3552323..b8c90bee7503 100644
> --- a/drivers/scsi/ufs/ufshcd.h
> +++ b/drivers/scsi/ufs/ufshcd.h
> @@ -311,6 +311,7 @@ struct ufs_pwr_mode_info {
>   * @pwr_change_notify: called before and after a power mode change
>   *			is carried out to allow vendor spesific
> capabilities
>   *			to be set.
> + * @unipro_dme_set: called when vendor speicific control is needed
>   * @setup_xfer_req: called before any transfer request is issued
>   *                  to set some things
>   * @setup_task_mgmt: called before any task management request is
> issued
> @@ -342,6 +343,7 @@ struct ufs_hba_variant_ops {
>  					enum ufs_notify_change_status
> status,
>  					struct ufs_pa_layer_attr *,
>  					struct ufs_pa_layer_attr *);
> +	void    (*unipro_dme_set)(struct ufs_hba *hba);
>  	void	(*setup_xfer_req)(struct ufs_hba *, int, bool);
>  	void	(*setup_task_mgmt)(struct ufs_hba *, int, u8);
>  	void    (*hibern8_notify)(struct ufs_hba *, enum uic_cmd_dme,
> @@ -1161,6 +1163,12 @@ static inline int
> ufshcd_vops_pwr_change_notify(struct ufs_hba *hba,
>  	return -ENOTSUPP;
>  }
>  
> +static inline void ufshcd_vops_unipro_dme_set(struct ufs_hba *hba)
> +{
> +	if (hba->vops && hba->vops->unipro_dme_set)
> +		return hba->vops->unipro_dme_set(hba);
> +}
> +
>  static inline void ufshcd_vops_setup_xfer_req(struct ufs_hba *hba,
> int tag,
>  					bool is_scsi_cmd)
>  {
> diff --git a/drivers/scsi/ufs/unipro.h b/drivers/scsi/ufs/unipro.h
> index 8e9e486a4f7b..224162e5afd8 100644
> --- a/drivers/scsi/ufs/unipro.h
> +++ b/drivers/scsi/ufs/unipro.h
> @@ -192,10 +192,6 @@
>  #define DL_TC1ReplayTimeOutVal_Default		65535
>  #define DL_AFC1ReqTimeOutVal_Default		32767
>  
> -#define DME_LocalFC0ProtectionTimeOutVal	0xD041
> -#define DME_LocalTC0ReplayTimeOutVal		0xD042
> -#define DME_LocalAFC0ReqTimeOutVal		0xD043
> -
>  /* PA power modes */
>  enum {
>  	FAST_MODE	= 1,

