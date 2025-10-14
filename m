Return-Path: <linux-arm-msm+bounces-77238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 75125BDA942
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 18:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 246504E1CE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 16:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462C02FAC0E;
	Tue, 14 Oct 2025 16:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="1Hut6Jt7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 004.mia.mailroute.net (004.mia.mailroute.net [199.89.3.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5276524338F;
	Tue, 14 Oct 2025 16:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760458247; cv=none; b=rS2pW3mUg3K5j3LlnqZuL6XkXQPyrnlOofY8OfRsXCEElSATEdE1ABQjY+gkna4wO7OvtLAlmXrxsWg3VZJZquC8IGBzFzEQUi1ksr3ii3itBIHBRQBO8mKkysil3ZsFPlvoVixp2Vg2IUbGbdDyy98Cql0aQP5HfsXVOcotRGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760458247; c=relaxed/simple;
	bh=H/s5+ANG6P7dbnAbRrl7NGS2jbhYC27S0c+hYRzhYH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Em0aqgJVNnnEU+GCzQf0txvRyXRCScKHd+IZ+m25E1lCZFmCIIz/Pkrit/A6cbwTA2jgm+ISU3r07fZ3vyTY3OvqA6xPdG+kSiVwUF7l1B9ean61DQa60f4TLc/vx30rba+C5wZXwWAdosYRF49LK3DpJ6z4ofcmyLBd7d1GgIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=1Hut6Jt7; arc=none smtp.client-ip=199.89.3.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4cmK2D1WNbzm0yt2;
	Tue, 14 Oct 2025 16:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1760458239; x=1763050240; bh=Ps7mj9LCeV6vgaN7TCVO+fAJ
	E22Xnqinq7TSVO/rcI4=; b=1Hut6Jt73U0qSAdyNP3tZFH84mOzxmAoDsHbnGHs
	2f3LDKq46jLoijWDfYHYPaZc8bBp4u7B+cjlURsfcv3JVlej97i6w1ENiRXuh1v8
	crIGiOA61hms+UVjwT+xZq0arwUM3jeXpgxEpK9ud8orAvo79ledWj8GwlP3dbZA
	A9nGn9qVbLr9NulSLLFc0YkzyqjaIX/N4P/SIjyXv4y1aWzMk6GTkpsZ+ZI7oNjz
	MWPKHycX3K4k8BCM3V3yC39lWR1Bm5JmH8NokPP46wnEgDCoZb5Cuq9kBeDDjmH6
	frkx4FyfHo1v7OL9yB0c1aKXFjkd1BawoZ5jHNF2svo46Q==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id rpFy6Ce4o2Be; Tue, 14 Oct 2025 16:10:39 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4cmK1r4ltyzm0yTq;
	Tue, 14 Oct 2025 16:10:23 +0000 (UTC)
Message-ID: <d027689e-9c45-4584-ac35-411b74b551a9@acm.org>
Date: Tue, 14 Oct 2025 09:10:22 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 1/2] ufs: core:Add vendor-specific callbacks and update
 setup_xfer_req interface
To: palash.kambar@oss.qualcomm.com, mani@kernel.org, alim.akhtar@samsung.com,
 avri.altman@wdc.com, peter.griffin@linaro.org, krzk@kernel.org,
 peter.wang@mediatek.com, beanhuo@micron.com, quic_nguyenb@quicinc.com,
 adrian.hunter@intel.com, ebiggers@kernel.org, neil.armstrong@linaro.org,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
 quic_nitirawa@quicinc.com
References: <20251014060406.1420475-1-palash.kambar@oss.qualcomm.com>
 <20251014060406.1420475-2-palash.kambar@oss.qualcomm.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20251014060406.1420475-2-palash.kambar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/25 11:04 PM, palash.kambar@oss.qualcomm.com wrote:
> On QCOM UFSHC V6 in MCQ mode, a race condition exists where simultaneous
> data and hibernate commands can cause data commands to be dropped when
> the Auto-Hibernate Idle Timer (AHIT) is near expiration.
> 
> To mitigate this, AHIT is disabled before updating the SQ tail pointer,
> and re-enabled only when no active commands remain. This prevents
> conflicting command sequences from reaching the UniPro layer during
> critical timing windows.
> 
> To support this:
> - Introduce a new vendor operation `compl_command` to allow vendors to
>    handle command completion in a customized manner.
> - Update the argument list for the existing `setup_xfer_req` vendor
>    operation to align with the updated UFS core interface.
> - Modify the Exynos-specific `setup_xfer_req` implementation to match
>    the new interface and support the AHIT handling logic.

Yikes. Please disable AHIT entirely or disable/enable AHIT from inside
the runtime power management callbacks rather than inventing a new
mechanism for tracking whether any commands are outstanding.

> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 568a449e7331..fd771d6c315e 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -2383,11 +2383,11 @@ void ufshcd_send_command(struct ufs_hba *hba, unsigned int task_tag,
>   		memcpy(dest, src, utrd_size);
>   		ufshcd_inc_sq_tail(hwq);
>   		spin_unlock(&hwq->sq_lock);
> +		hba->vops->setup_xfer_req(hba, lrbp);

What will happen if hba->vops->setup_xfer_req == NULL? Will the above
code trigger a kernel crash?

> @@ -5637,6 +5637,7 @@ void ufshcd_compl_one_cqe(struct ufs_hba *hba, int task_tag,
>   	}
>   	cmd = lrbp->cmd;
>   	if (cmd) {
> +		hba->vops->compl_command(hba, lrbp);
>   		if (unlikely(ufshcd_should_inform_monitor(hba, lrbp)))
>   			ufshcd_update_monitor(hba, lrbp);
>   		ufshcd_add_command_trace(hba, task_tag, UFS_CMD_COMP);

Yikes. New unconditional indirect function calls in the hot path are not
acceptable because these have a negative performance impact.

> @@ -5645,6 +5646,7 @@ void ufshcd_compl_one_cqe(struct ufs_hba *hba, int task_tag,
>   		/* Do not touch lrbp after scsi done */
>   		scsi_done(cmd);
>   	} else {
> +		hba->vops->compl_command(hba, lrbp);
>   		if (cqe) {
>   			ocs = le32_to_cpu(cqe->status) & MASK_OCS;
>   			lrbp->utr_descriptor_ptr->header.ocs = ocs;

Same comment here.

> diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
> index 70d195179eba..d87276f45e01 100644
> --- a/drivers/ufs/host/ufs-exynos.c
> +++ b/drivers/ufs/host/ufs-exynos.c
> @@ -910,11 +910,15 @@ static int exynos_ufs_post_pwr_mode(struct ufs_hba *hba,
>   }
>   
>   static void exynos_ufs_specify_nexus_t_xfer_req(struct ufs_hba *hba,
> -						int tag, bool is_scsi_cmd)
> +						struct ufshcd_lrb *lrbp)
>   {
>   	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
>   	u32 type;
> +	int tag;
> +	bool is_scsi_cmd;
>   
> +	tag = lrbp->task_tag;
> +	is_scsi_cmd = !!lrbp->cmd;
>   	type =  hci_readl(ufs, HCI_UTRL_NEXUS_TYPE);
>   
>   	if (is_scsi_cmd)

I'm about to remove lrbp->cmd so please don't introduce any new users of
this structure member.

Bart.

