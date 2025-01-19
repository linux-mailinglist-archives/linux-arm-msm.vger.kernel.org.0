Return-Path: <linux-arm-msm+bounces-45488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD2DA160B5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 08:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6834B7A2C83
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 07:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF545170A1B;
	Sun, 19 Jan 2025 07:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fl7MOd5j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9533F143888;
	Sun, 19 Jan 2025 07:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737271333; cv=none; b=kbP2FvEkOs/22c/49/vdItpd2GIxMFhexVGcaIwvoZS+JcIGuvCdUSNjzBounnsN+S92oAlaNy0hUwCjrYDsYS3fk380CAfrxWPXn3+tLVvuwxzrYMqNBO8icIVzKsY/z8/iKwlDbYspkLqqYSehYKgfCUB+JgcdszvBmMpi3Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737271333; c=relaxed/simple;
	bh=6pYOfD6v1g8uXxUKDP/fNNAt8mYrvBdcxD1SNnOO9Os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VVyHDA4Q9AvsSweRWVXWKMAznhbzyjpBWnKgvUqJBsY5l7lTJQn3LUSEo6pwrFMXSG/fYApmeInjoaKC1NuVj8vs1PdpFqXBMDtFFFdqPd6xYYpw9kxHgHJJDCA7BaEkAKG5HR6LuqE3mEFQ9AHiIkQGQeYaZ1CN+xE2to4RNGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fl7MOd5j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A87C4CED6;
	Sun, 19 Jan 2025 07:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737271333;
	bh=6pYOfD6v1g8uXxUKDP/fNNAt8mYrvBdcxD1SNnOO9Os=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fl7MOd5jPReu8n7aV1WIs5fJIy/QzsR2JhkUZLisjR58Js0ktAxB0r4gsEtBtEMkg
	 HFSxvJ53/c5gr/df3wSxFmwqIQ+BqsabFZP/w2qfwPbOTqMooLWZkrs7sIOrtuCQ6F
	 TdLM8sDaOYpZT1ro1lN50nxvylt8nr55A/pLe7weCKh/0CkRbA2e775hBtKbJ4bOSf
	 mftwz/O/jjXoDkE5Rm6LYrODcg3j6pJFG1lgBCNZp8pe+NOB9x2UM8JKeU+N3YYOcZ
	 hq1OoDMRtOe57/Rh+DhH0es8v8sdMoNuWNViKiy6rjoapdvYxIpnr7JcXlzSZuATZg
	 WtLMFHrecxanQ==
Date: Sun, 19 Jan 2025 12:52:04 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ziqi Chen <quic_ziqichen@quicinc.com>
Cc: quic_cang@quicinc.com, bvanassche@acm.org, beanhuo@micron.com,
	avri.altman@wdc.com, junwoo80.lee@samsung.com,
	martin.petersen@oracle.com, quic_nguyenb@quicinc.com,
	quic_nitirawa@quicinc.com, quic_rampraka@quicinc.com,
	linux-scsi@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." <linux-arm-msm@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/8] scsi: ufs: qcom: Pass target_freq to clk scale pre
 and post change
Message-ID: <20250119072204.6arlcagxzdgawb4n@thinkpad>
References: <20250116091150.1167739-1-quic_ziqichen@quicinc.com>
 <20250116091150.1167739-3-quic_ziqichen@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250116091150.1167739-3-quic_ziqichen@quicinc.com>

On Thu, Jan 16, 2025 at 05:11:43PM +0800, Ziqi Chen wrote:
> From: Can Guo <quic_cang@quicinc.com>
> 
> If OPP V2 is used, devfreq clock scaling may scale clock amongst more than
> two freqs.

Same comment as previous patch.

> In the case of scaling up, the devfreq may decide to scale the
> clock to an intermidiate freq base on load, but the clock scale up pre
> change operation uses settings for the max clock freq unconditionally. Fix
> it by passing the target_freq to clock scale up pre change so that the
> correct settings for the target_freq can be used.
> 
> In the case of scaling down, the clock scale down post change operation
> is doing fine, because it reads the actual clock rate to tell freq, but to
> keep symmetry with clock scale up pre change operation, just use the
> target_freq instead of reading clock rate.
> 
> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index b6eef975dc46..1e8a23eb8c13 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -97,7 +97,7 @@ static const struct __ufs_qcom_bw_table {
>  };
>  
>  static void ufs_qcom_get_default_testbus_cfg(struct ufs_qcom_host *host);
> -static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale_up);
> +static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, unsigned long freq);
>  
>  static struct ufs_qcom_host *rcdev_to_ufs_host(struct reset_controller_dev *rcd)
>  {
> @@ -524,7 +524,7 @@ static int ufs_qcom_link_startup_notify(struct ufs_hba *hba,
>  			return -EINVAL;
>  		}
>  
> -		err = ufs_qcom_set_core_clk_ctrl(hba, true);
> +		err = ufs_qcom_set_core_clk_ctrl(hba, ULONG_MAX);
>  		if (err)
>  			dev_err(hba->dev, "cfg core clk ctrl failed\n");
>  		/*
> @@ -1231,7 +1231,7 @@ static int ufs_qcom_set_clk_40ns_cycles(struct ufs_hba *hba,
>  	return ufshcd_dme_set(hba, UIC_ARG_MIB(PA_VS_CORE_CLK_40NS_CYCLES), reg);
>  }
>  
> -static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale_up)
> +static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, unsigned long freq)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>  	struct list_head *head = &hba->clk_list_head;
> @@ -1245,10 +1245,11 @@ static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale_up)
>  		    !strcmp(clki->name, "core_clk_unipro")) {
>  			if (!clki->max_freq)
>  				cycles_in_1us = 150; /* default for backwards compatibility */
> -			else if (is_scale_up)
> +			else if (freq == ULONG_MAX)
>  				cycles_in_1us = ceil(clki->max_freq, (1000 * 1000));
>  			else
> -				cycles_in_1us = ceil(clk_get_rate(clki->clk), (1000 * 1000));
> +				cycles_in_1us = ceil(freq, (1000 * 1000));

Consider switching to HZ_PER_MHZ in a separate patch later.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

