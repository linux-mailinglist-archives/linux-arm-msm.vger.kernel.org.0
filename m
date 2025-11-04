Return-Path: <linux-arm-msm+bounces-80176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A39C2EDB8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 02:44:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66695188427A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 01:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E6B2080C8;
	Tue,  4 Nov 2025 01:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PGucJtVY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3E320298C;
	Tue,  4 Nov 2025 01:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762220257; cv=none; b=kqzMVFsT8QPwNyT5iYQlSc6M2eeDKr5FRBiYtch+j+W9Olz+d97xroSGc8zMOLvqdau6exA0qEw8DLSLQZJQbfoIc27e7P21g0deHy8ob8jR7zV/HUOvzlp9DaOT5QInWgfEVo+qSjdbRdT5P8UZUwKHt4IBaVMSz6prRMc2YBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762220257; c=relaxed/simple;
	bh=OWIXlyAFbcAS5vVCWf3qdc5NXhyWrM2dBdDvEB1KwC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5OP314aLxEsc1IEtsKkKF1yQFeHXecgC99ixgpZeKuPRwcPVcOcYMWhCRIjauzGUd5UgBuZ+2mGIJTSpfQPbHFwRJE8Oe+4mED43yabUEwadWVwS+nCK+vLmbFTutHHRFZI7+s5tCjbEzBWld594X7T0e+aA10Kr+cyGTb/8Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PGucJtVY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81AF5C4CEE7;
	Tue,  4 Nov 2025 01:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762220257;
	bh=OWIXlyAFbcAS5vVCWf3qdc5NXhyWrM2dBdDvEB1KwC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PGucJtVYtW9xNg9XCfHCLOtgBzpcVrd8s/p3u2a8UVj4dkOO/JxCT/5AhEZN2gMO+
	 3jorV97iSbdbPCaMRY4XkYHSdmG+5c5pPFew9TlVqUtmLvKY7maklHczFHlIn0ll9j
	 AiDYan1UpEGd49ZiEFweOSH5cDX8APGJVHkngi/oIVjfyTsaJu3wB7joNzKnrFq0QQ
	 63I459Rh/E+oPsKRC8uB6m6YGKBHyXrTeBdsqp+wCeytSgFCujEgpeggGNVGfoTp60
	 5Z+X6z2Zj0WHM2G3YazoGiKTF27s90Meqryb+EW9sH2GrwTRBqRI8BdSa58GhvaB4f
	 XGdEAIT5ifgpw==
Date: Mon, 3 Nov 2025 19:41:09 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Cc: chris.lew@oss.qualcomm.com, konradybcio@kernel.org, 
	jingyi.wang@oss.qualcomm.com, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH V2 1/2] soc: qcom: smp2p: Add irqchip state support
Message-ID: <5xhvxnqkvuy6lthzpyk64pm6v3zovcftfb3a2jep3oulrtohpd@o6whhdwevi5h>
References: <20251103152929.2434911-1-deepak.singh@oss.qualcomm.com>
 <20251103152929.2434911-2-deepak.singh@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103152929.2434911-2-deepak.singh@oss.qualcomm.com>

On Mon, Nov 03, 2025 at 08:59:28PM +0530, Deepak Kumar Singh wrote:
> From: Chris Lew <chris.lew@oss.qualcomm.com>
> 
> A remoteproc booted during earlier boot stages such as UEFI or the
> bootloader, may need to be attached to without restarting the remoteproc
> hardware. To do this the remoteproc will need to check the ready and
> handover states in smp2p without an interrupt notification.
> 

The structure of the commit message is really good. But we don't _need_
any of this in order to attach to a remoteproc without restarting it.

We _need_ this stuff to determine if a remoteproc was started by the
bootloader, and to determine if it has crashed.

> Add support for the .irq_get_irqchip_state callback so remoteproc can
> read the current state of the fatal, ready and handover bits.
> 
> Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/smp2p.c | 61 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
> index cb515c2340c1..39628df36745 100644
> --- a/drivers/soc/qcom/smp2p.c
> +++ b/drivers/soc/qcom/smp2p.c
> @@ -48,6 +48,9 @@
>  #define SMP2P_MAGIC 0x504d5324
>  #define SMP2P_ALL_FEATURES	SMP2P_FEATURE_SSR_ACK
>  
> +#define ONE 1
> +#define TWO 2

You forgot "#define PLEASE_DONT true"...

Sorry if I wasn't expressing myself clearly enough, we're using defines
of magic values to make the code easier to read, follow, and understand.

Giving trivial integer version numbers a "human readable" name doesn't
meet this criteria. Use 1 and 2 in the code.

> +
>  /**
>   * struct smp2p_smem_item - in memory communication structure
>   * @magic:		magic number
> @@ -222,6 +225,42 @@ static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
>  	}
>  }
>  
> +static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
> +{
> +	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
> +	unsigned int pid = smp2p->remote_pid;
> +	char buf[SMP2P_MAX_ENTRY_NAME];
> +	struct smp2p_smem_item *in;
> +	struct smp2p_entry *entry;
> +	size_t size;
> +	int i;
> +
> +	in = qcom_smem_get(pid, smem_id, &size);
> +	if (IS_ERR(in))
> +		return;
> +
> +	smp2p->in = in;
> +
> +	/* Check if version is initialized and set to v2.

Newline after the /* in multi-line comments please.

> +	 * Early enumeration of inbound entries is required only
> +	 * for early boot processors which have smp2p version 2.

"required only for early boot processors which have smp2p version 2",
does "version 2" imply "early boot processor"?

Does "required" imply that we could do this for other subsystems as
well, but we choose not do do so? This comment should be sufficient for
me not to feel the urge of removing the condition 3 months from now.


Also, isn't it the case that for all non-early-boot subsystems, they
haven't been running yet, so qcom_smem_get() above will fail?


Please start over, and rewrite this comment from the angle of describing
how this fits into the handling of early boot systems.

> +	 */
> +	if (in->version != TWO)
> +		return;
> +
> +	for (i = smp2p->valid_entries; i < in->valid_entries; i++) {
> +		list_for_each_entry(entry, &smp2p->inbound, node) {
> +			memcpy(buf, in->entries[i].name, sizeof(buf));
> +			if (!strcmp(buf, entry->name)) {
> +				entry->value = &in->entries[i].value;
> +				entry->last_value = readl(entry->value);
> +				break;
> +			}
> +		}
> +	}
> +	smp2p->valid_entries = i;

Why don't we just call qcom_smp2p_notify_in() instead of all this?

> +}
> +
>  static void qcom_smp2p_notify_in(struct qcom_smp2p *smp2p)
>  {
>  	struct smp2p_smem_item *in;
> @@ -368,12 +407,31 @@ static void smp2p_irq_print_chip(struct irq_data *irqd, struct seq_file *p)
>  	seq_printf(p, "%8s", dev_name(entry->smp2p->dev));
>  }
>  
> +static int smp2p_irq_get_irqchip_state(struct irq_data *irqd, enum irqchip_irq_state which,
> +				       bool *state)
> +{
> +	struct smp2p_entry *entry = irq_data_get_irq_chip_data(irqd);
> +	u32 val;
> +
> +	if (which != IRQCHIP_STATE_LINE_LEVEL)
> +		return -EINVAL;
> +
> +	if (!entry->value)
> +		return -ENODEV;
> +
> +	val = readl(entry->value);
> +	*state = !!(val & BIT(irqd_to_hwirq(irqd)));
> +
> +	return 0;
> +}
> +
>  static struct irq_chip smp2p_irq_chip = {
>  	.name           = "smp2p",
>  	.irq_mask       = smp2p_mask_irq,
>  	.irq_unmask     = smp2p_unmask_irq,
>  	.irq_set_type	= smp2p_set_irq_type,
>  	.irq_print_chip = smp2p_irq_print_chip,
> +	.irq_get_irqchip_state = smp2p_irq_get_irqchip_state,

This part looks good.

Regards,
Bjorn

>  };
>  
>  static int smp2p_irq_map(struct irq_domain *d,
> @@ -618,6 +676,9 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	/* Check inbound entries in the case of early boot processor */
> +	qcom_smp2p_start_in(smp2p);
> +
>  	/* Kick the outgoing edge after allocating entries */
>  	qcom_smp2p_kick(smp2p);
>  
> -- 
> 2.34.1
> 

