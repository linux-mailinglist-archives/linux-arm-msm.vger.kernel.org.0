Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5B261585FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2020 00:10:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727477AbgBJXKT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 18:10:19 -0500
Received: from mail-yw1-f67.google.com ([209.85.161.67]:42837 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727594AbgBJXKR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 18:10:17 -0500
Received: by mail-yw1-f67.google.com with SMTP id b81so4278953ywe.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2020 15:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dUn+S5bfz69KvB7Ib7gFT3Sk6KxzOv6iNMB5UKdmRMk=;
        b=yNZ0J/P7369KAfIlV6R6ds/6iwPN/8X8VmolxAfu0hONq3IVIsurOdLay9RBTa+mxL
         g+8pnVEZX9R1dQzzV/HhZmAizgTlSV05OjmDg6sRsC5bxkYjbcVhM+tDdC7ccPsoRhRY
         zUnnyJ0XRKexn2FlLC/Y2sbs2OL9YT9ytaGK406rWJADrwFIt3uZScEUFkibX6Mn1IYz
         cwYvFrUwdjD1vm8PHwkNXk3cX+7I6Lll1Vu1BH1JtHfPHfuwPjGbhPqphzIlCn5s5d8B
         AhQ3w1mpRRs7RDCPSnSr67tH+96JTrkV4UF3lIhxE9U/j60yuLniKlTKXeBBfzmlccgV
         inrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dUn+S5bfz69KvB7Ib7gFT3Sk6KxzOv6iNMB5UKdmRMk=;
        b=WaOygPMQZQ6TcGpRBvPJutJyMeI9NfPwsjoqgJPb4jGTkzwSqieEZwOk/CHVjJKzV4
         5fyNGqbGIoL4/ArlaXK8AunCrGWnJZfSCb2QbEEDH7nKoagkjfwZwJHD+XDtRZtNNXo9
         tQNj85WP8y5PxoSgAb21p8cpCOnSFozcwwbWqE7t63qUEMAi64oMaBaWml8K6vLo+HQ2
         yzWWx5hvgZomcZBh5b+VX3arj2DhN16np1V26HHJRNJ4XwHOrrwd9BiU3xlbTJFNaONt
         VQTEjAjt/MsKMDOLM7bTE5/1bAQiRiT3XlZjVHTSu92GOgTetzyt4iafYzq0oZgHw+0q
         akFg==
X-Gm-Message-State: APjAAAUFD2pfqoopVL4i1O4xZsXMalxQaqDB109+9+5eyjZ1lVGSSQk0
        DpRSMxedPhGv3pCVuYMbjx8DN9M0HO4=
X-Google-Smtp-Source: APXvYqwRHpOy2f1R2zAo0+JOLEL+ZSeXGy/pTDb/RvfYlVd27Qg17ZlSGIDOD2EfxSC+1tNTbOELWA==
X-Received: by 2002:a81:30a:: with SMTP id 10mr3073811ywd.162.1581376214953;
        Mon, 10 Feb 2020 15:10:14 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id m16sm960340ywa.90.2020.02.10.15.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 15:10:14 -0800 (PST)
Date:   Mon, 10 Feb 2020 16:10:12 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>
Subject: Re: [PATCH v3 2/2] remoteproc: qcom_q6v5_mss: Validate each segment
 during loading
Message-ID: <20200210231012.GB20652@xps15>
References: <20200204062641.393949-1-bjorn.andersson@linaro.org>
 <20200204062641.393949-3-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200204062641.393949-3-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 03, 2020 at 10:26:41PM -0800, Bjorn Andersson wrote:
> The code used to sync with the MBA after each segment loaded and this is
> still what's done downstream. So reduce the delta towards downstream by
> switching to a model where the content is iteratively validated.
> 
> Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> Tested-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> Tested-by: Luca Weiss <luca@z3ntu.xyz>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Enough people have looked at this and I won't add my two-bits other then
checkpatch is complaining about lines over 80 characters.  In this case they are
easy to fix and have no side effects.

Mathieu

> ---
> 
> Changes since v2:
> - Picked up Luca's t-b
> 
>  drivers/remoteproc/qcom_q6v5_mss.c | 76 ++++++++++++++++++++----------
>  1 file changed, 51 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 25c03a26bf88..5eb154f221a4 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -360,23 +360,29 @@ static void q6v5_pds_disable(struct q6v5 *qproc, struct device **pds,
>  }
>  
>  static int q6v5_xfer_mem_ownership(struct q6v5 *qproc, int *current_perm,
> -				   bool remote_owner, phys_addr_t addr,
> +				   bool local, bool remote, phys_addr_t addr,
>  				   size_t size)
>  {
> -	struct qcom_scm_vmperm next;
> +	struct qcom_scm_vmperm next[2];
> +	int perms = 0;
>  
>  	if (!qproc->need_mem_protection)
>  		return 0;
> -	if (remote_owner && *current_perm == BIT(QCOM_SCM_VMID_MSS_MSA))
> -		return 0;
> -	if (!remote_owner && *current_perm == BIT(QCOM_SCM_VMID_HLOS))
> -		return 0;
>  
> -	next.vmid = remote_owner ? QCOM_SCM_VMID_MSS_MSA : QCOM_SCM_VMID_HLOS;
> -	next.perm = remote_owner ? QCOM_SCM_PERM_RW : QCOM_SCM_PERM_RWX;
> +	if (local) {
> +		next[perms].vmid = QCOM_SCM_VMID_HLOS;
> +		next[perms].perm = QCOM_SCM_PERM_RWX;
> +		perms++;
> +	}
> +
> +	if (remote) {
> +		next[perms].vmid = QCOM_SCM_VMID_MSS_MSA;
> +		next[perms].perm = QCOM_SCM_PERM_RW;
> +		perms++;
> +	}
>  
>  	return qcom_scm_assign_mem(addr, ALIGN(size, SZ_4K),
> -				   current_perm, &next, 1);
> +				   current_perm, next, perms);
>  }
>  
>  static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
> @@ -693,7 +699,7 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
>  
>  	/* Hypervisor mapping to access metadata by modem */
>  	mdata_perm = BIT(QCOM_SCM_VMID_HLOS);
> -	ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, true, phys, size);
> +	ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, false, true, phys, size);
>  	if (ret) {
>  		dev_err(qproc->dev,
>  			"assigning Q6 access to metadata failed: %d\n", ret);
> @@ -711,7 +717,7 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
>  		dev_err(qproc->dev, "MPSS header authentication failed: %d\n", ret);
>  
>  	/* Metadata authentication done, remove modem access */
> -	xferop_ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, false, phys, size);
> +	xferop_ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, true, false, phys, size);
>  	if (xferop_ret)
>  		dev_warn(qproc->dev,
>  			 "mdt buffer not reclaimed system may become unstable\n");
> @@ -798,7 +804,7 @@ static int q6v5_mba_load(struct q6v5 *qproc)
>  	}
>  
>  	/* Assign MBA image access in DDR to q6 */
> -	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, true,
> +	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, false, true,
>  				      qproc->mba_phys, qproc->mba_size);
>  	if (ret) {
>  		dev_err(qproc->dev,
> @@ -832,8 +838,8 @@ static int q6v5_mba_load(struct q6v5 *qproc)
>  	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
>  
>  reclaim_mba:
> -	xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, false,
> -						qproc->mba_phys,
> +	xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, true,
> +						false, qproc->mba_phys,
>  						qproc->mba_size);
>  	if (xfermemop_ret) {
>  		dev_err(qproc->dev,
> @@ -900,7 +906,7 @@ static void q6v5_mba_reclaim(struct q6v5 *qproc)
>  	/* In case of failure or coredump scenario where reclaiming MBA memory
>  	 * could not happen reclaim it here.
>  	 */
> -	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, false,
> +	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, true, false,
>  				      qproc->mba_phys,
>  				      qproc->mba_size);
>  	WARN_ON(ret);
> @@ -927,6 +933,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  	phys_addr_t boot_addr;
>  	phys_addr_t min_addr = PHYS_ADDR_MAX;
>  	phys_addr_t max_addr = 0;
> +	u32 code_length;
>  	bool relocate = false;
>  	char *fw_name;
>  	size_t fw_name_len;
> @@ -977,9 +984,19 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  	}
>  
>  	/* Try to reset ownership back to Linux */
> -	q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, false,
> +	q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, true, false,
>  				qproc->mpss_phys, qproc->mpss_size);
>  
> +	/* Share ownership between Linux and MSS, during segment loading */
> +	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, true, true,
> +				      qproc->mpss_phys, qproc->mpss_size);
> +	if (ret) {
> +		dev_err(qproc->dev,
> +			"assigning Q6 access to mpss memory failed: %d\n", ret);
> +		ret = -EAGAIN;
> +		goto release_firmware;
> +	}
> +
>  	mpss_reloc = relocate ? min_addr : qproc->mpss_phys;
>  	qproc->mpss_reloc = mpss_reloc;
>  	/* Load firmware segments */
> @@ -1028,10 +1045,24 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  			       phdr->p_memsz - phdr->p_filesz);
>  		}
>  		size += phdr->p_memsz;
> +
> +		code_length = readl(qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
> +		if (!code_length) {
> +			boot_addr = relocate ? qproc->mpss_phys : min_addr;
> +			writel(boot_addr, qproc->rmb_base + RMB_PMI_CODE_START_REG);
> +			writel(RMB_CMD_LOAD_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
> +		}
> +		writel(size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
> +
> +		ret = readl(qproc->rmb_base + RMB_MBA_STATUS_REG);
> +		if (ret < 0) {
> +			dev_err(qproc->dev, "MPSS authentication failed: %d\n", ret);
> +			goto release_firmware;
> +		}
>  	}
>  
>  	/* Transfer ownership of modem ddr region to q6 */
> -	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, true,
> +	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, false, true,
>  				      qproc->mpss_phys, qproc->mpss_size);
>  	if (ret) {
>  		dev_err(qproc->dev,
> @@ -1040,11 +1071,6 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  		goto release_firmware;
>  	}
>  
> -	boot_addr = relocate ? qproc->mpss_phys : min_addr;
> -	writel(boot_addr, qproc->rmb_base + RMB_PMI_CODE_START_REG);
> -	writel(RMB_CMD_LOAD_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
> -	writel(size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
> -
>  	ret = q6v5_rmb_mba_wait(qproc, RMB_MBA_AUTH_COMPLETE, 10000);
>  	if (ret == -ETIMEDOUT)
>  		dev_err(qproc->dev, "MPSS authentication timed out\n");
> @@ -1074,7 +1100,7 @@ static void qcom_q6v5_dump_segment(struct rproc *rproc,
>  		if (!ret) {
>  			/* Try to reset ownership back to Linux */
>  			ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm,
> -						      false,
> +						      true, false,
>  						      qproc->mpss_phys,
>  						      qproc->mpss_size);
>  		}
> @@ -1116,8 +1142,8 @@ static int q6v5_start(struct rproc *rproc)
>  		goto reclaim_mpss;
>  	}
>  
> -	xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, false,
> -						qproc->mba_phys,
> +	xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, true,
> +						false, qproc->mba_phys,
>  						qproc->mba_size);
>  	if (xfermemop_ret)
>  		dev_err(qproc->dev,
> -- 
> 2.23.0
> 
