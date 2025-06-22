Return-Path: <linux-arm-msm+bounces-61976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2AFAE3087
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Jun 2025 17:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8F883AFDAB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Jun 2025 15:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5521DE4C2;
	Sun, 22 Jun 2025 15:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eU4/VKb1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB2726ACC;
	Sun, 22 Jun 2025 15:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750605914; cv=none; b=mDHOisREqNNczt/rYWOcD/ola6LjJztiDj1P6pP1lqKXJY72JfsIgjxVe4c74U3IyLjLRFSuzouOeVrYyNGwSUDv2GS4i3SYdtiiLjBEWLimobqnqW06t1gff7U6CK4ZRDifhSpmK9gBqiGp6t3PEMrgP19snhpiJJHP7Ps404E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750605914; c=relaxed/simple;
	bh=YkCHZBSup9ldUKDhsvw2cVBrQyezSXfKBz00wY7hhYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZ5iK9vCYWLLv4pk3QhWDLbCrs9svbE1SDFnghUmJJvry94Csi/HkY+PFztjzmCPP/Q/95AffDTR17gPrNyi81UPbs/OS+jGIm6vvJOx81HHVnwmRXkDCTu4ZPzXr7Ev5s4ELUewJhUU9Iiph6cdu9K1Th2v8nXYxgQQZBGC3G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eU4/VKb1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F49CC4CEE3;
	Sun, 22 Jun 2025 15:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750605914;
	bh=YkCHZBSup9ldUKDhsvw2cVBrQyezSXfKBz00wY7hhYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eU4/VKb1SmJlqX9iPApVYalwy3jrAnCaJBtWgdTb8Ha4ZvKe1ZOJc4HJMKo1AppBz
	 cZXuMpf6WBEeELl2dCh9p6nIkY11YPgcTPTn+K+OB0OSioBFJq5k05KBch43Q9v/QX
	 TK9y+QagSwTqqwt5DBuVEyQs2Ghg3d5J9Is1lAo0OddDXP8A2a8KxKMcNV7oDlCeoo
	 SdTFVE5m+JEg3NSSiPrbqBReiOBxY7xg+uexLaTW7S6wor8UEigOsEtQ3MFq9tOrUi
	 9qcGh6D0oPMAFG5G38L7uz25UOJq/Nvr95FaRZ4XDTL/jKmq8h+3R6e+cLlrqAEEa0
	 xpjUhf1smyUQg==
Date: Sun, 22 Jun 2025 20:55:12 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, 
	bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org, 
	konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com, quic_cang@quicinc.com, 
	vkoul@kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Aishwarya <aishwarya.tcv@arm.com>, Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Subject: Re: [PATCH V1] scsi: ufs: qcom : Fix NULL pointer dereference in
 ufs_qcom_setup_clocks
Message-ID: <dtz6mm5xq6kfo477fjezkrjnp5k5oijg6dhqziokglq6d5mazt@c2brkuhcveqc>
References: <20250622104531.19567-1-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250622104531.19567-1-quic_nitirawa@quicinc.com>

On Sun, Jun 22, 2025 at 04:15:31PM +0530, Nitin Rawat wrote:
> Fix a NULL pointer dereference in ufs_qcom_setup_clocks due to an
> uninitialized 'host' variable. The variable 'phy' is now assigned
> after confirming 'host' is not NULL.
> 
> Call Stack:
> 
> [    6.448070] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000000
> [    6.448449] ufs_qcom_setup_clocks+0x28/0x148 ufs_qcom (P)
> [    6.448466] ufshcd_setup_clocks (drivers/ufs/core/ufshcd-priv.h:142)
> [    6.448477] ufshcd_init (drivers/ufs/core/ufshcd.c:9468)
> [    6.448485] ufshcd_pltfrm_init (drivers/ufs/host/ufshcd-pltfrm.c:504)
> [    6.448495] ufs_qcom_probe+0x28/0x68 ufs_qcom
> [    6.448508] platform_probe (drivers/base/platform.c:1404)
> [    6.448519] really_probe (drivers/base/dd.c:579 drivers/base/dd.c:657)
> [    6.448526] __driver_probe_device (drivers/base/dd.c:799)
> [    6.448532] driver_probe_device (drivers/base/dd.c:829)
> [    6.448539] __driver_attach (drivers/base/dd.c:1216)
> [    6.448545] bus_for_each_dev (drivers/base/bus.c:370)
> [    6.448556] driver_attach (drivers/base/dd.c:1234)
> [    6.448567] bus_add_driver (drivers/base/bus.c:678)
> [    6.448577] driver_register (drivers/base/driver.c:249)
> [    6.448584] __platform_driver_register (drivers/base/platform.c:868)
> [    6.448592] ufs_qcom_pltform_init+0x28/0xff8 ufs_qcom
> [    6.448605] do_one_initcall (init/main.c:1274)
> [    6.448615] do_init_module (kernel/module/main.c:3041)
> [    6.448626] load_module (kernel/module/main.c:3511)
> [    6.448635] init_module_from_file (kernel/module/main.c:3704)
> [    6.448644] __arm64_sys_finit_module (kernel/module/main.c:3715.
> 

It is recommended to remove the timestamps from the call stack.

> Fixes: 77d2fa54a945 ("scsi: ufs: qcom : Refactor phy_power_on/off calls")
> 

Remove empty line.

> Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Reported-by: Aishwarya <aishwarya.tcv@arm.com>
> Closes: https://lore.kernel.org/lkml/20250620214408.11028-1-aishwarya.tcv@arm.com/
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Closes: https://lore.kernel.org/linux-scsi/CA+G9fYuFQ2dBvYm1iB6rbwT=4b1c8e4NJ3yxqFPGZGUKH3GmMA@mail.gmail.com/T/#t
> Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  drivers/ufs/host/ufs-qcom.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index ba4b2880279c..318dca7fe3d7 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -1124,7 +1124,7 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>  				 enum ufs_notify_change_status status)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> -	struct phy *phy = host->generic_phy;
> +	struct phy *phy;
>  	int err;
> 
>  	/*
> @@ -1135,6 +1135,8 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>  	if (!host)
>  		return 0;
> 
> +	phy = host->generic_phy;
> +
>  	switch (status) {
>  	case PRE_CHANGE:
>  		if (on) {
> --
> 2.48.1
> 

-- 
மணிவண்ணன் சதாசிவம்

