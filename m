Return-Path: <linux-arm-msm+bounces-90272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NwJA53HcmnMpQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 01:58:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A074E6EDF3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 01:58:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDD11300D336
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 00:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270E7352C49;
	Fri, 23 Jan 2026 00:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="pIgklcBZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FD630DD21;
	Fri, 23 Jan 2026 00:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769129872; cv=none; b=FEboBG3tUJVP4vDEQ2TihNeGsWXqu5yr1CD6bTMw3V2INTX7iywX8EI2IZhC7fUAefT6gzM1CV7pjeRaXNvfDtIqnXPGBjO+KBZvN7OoRiDgN91RAbfFHk9Syv+g9pvv+SiLILNGvLBHt7bSIvSoRCBQ/TmWY7EArD0AxzMrk6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769129872; c=relaxed/simple;
	bh=ni5M67U09i0CrIBvR35xQTH78BCukEBhyc4/YiGRdFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QWmT7UgFBrCIPyIU4NBNMa3A2tfZaieZ1TJMHvJ/Zj8ep808haF1q348eeMt7L44k3gvtmD0tWfm/x5SwbjktZ1EGoSD2KlZzeivMMrcqCSEK02eswVz6JHDS1cB+B5oSFtyh1ZvrgMa8APUO6uPGlfY4LSmZhVoAosAB5L2HDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=pIgklcBZ; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4dxzzy6BKnzlfddy;
	Fri, 23 Jan 2026 00:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1769129853; x=1771721854; bh=vnt1wZikQFT6kvXEg7oTKpeS
	a/IuHzRqjZFvzpVS8aw=; b=pIgklcBZkYqZGbD44XR9sCWI0MxTKK4r9phXjzad
	bbGIUp7jlaqsU6qbx9kLhRdKTM43lJ/7u1dLXgMOHNVrhQQjUEpOeisFpGH6MH0P
	H1SWrWbkd+tk4XdqcHkX0OKAWub8mLhN8iUJKapMNiQs8A/a4bdEOf0Q4RhubYAD
	PsNf3h4CJsbkTQllpoci7btTgA6x+XA9QE7Pq8yCK15hdGecA0Dz4CxuMPPQ4ozZ
	HK2OmD/rXZOIg3OKbw9muSHftCIGr1RHdZ2bza16hCn79N3Zug3eRdaiYx7EqJzw
	IuHybE31dP0sfToLsQwaaJYj/wt8wxtOo6AqaaojaAwOjg==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id jMYEciD8RjsC; Fri, 23 Jan 2026 00:57:33 +0000 (UTC)
Received: from [192.168.50.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4dxzzv2GBBzlfddf;
	Fri, 23 Jan 2026 00:57:30 +0000 (UTC)
Message-ID: <4097a1d7-5594-44e2-b2f0-1d1877981928@acm.org>
Date: Thu, 22 Jan 2026 16:57:28 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 1/3] ufs: ufs-qcom: Add UFS ESI CPU affinity support
To: Nitin Rawat <nitin.rawat@oss.qualcomm.com>, mani@kernel.org,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org
References: <20260122141331.239354-1-nitin.rawat@oss.qualcomm.com>
 <20260122141331.239354-2-nitin.rawat@oss.qualcomm.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260122141331.239354-2-nitin.rawat@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[acm.org,reject];
	R_DKIM_ALLOW(-0.20)[acm.org:s=mr01];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[acm.org:+];
	TAGGED_FROM(0.00)[bounces-90272-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bvanassche@acm.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A074E6EDF3
X-Rspamd-Action: no action

On 1/22/26 6:13 AM, Nitin Rawat wrote:
> +static void ufs_qcom_set_esi_affinity(struct ufs_hba *hba)
> +{
> +	struct msi_desc *desc;
> +	int ret, i = 0, nr_irqs = 0;
> +	const cpumask_t *mask;
> +	int cpu;
> +
> +	__msi_lock_descs(hba->dev);
> +	/* Count the number of MSI descriptors */
> +	msi_for_each_desc(desc, hba->dev, MSI_DESC_ALL) {
> +		nr_irqs++;
> +	}
> +	__msi_unlock_descs(hba->dev);
> +
> +	if (nr_irqs == 0)
> +		return;
> +
> +	__msi_lock_descs(hba->dev);
> +	/* Set affinity hints for each interrupt in round-robin fashion */
> +	msi_for_each_desc(desc, hba->dev, MSI_DESC_ALL) {
> +		if (i >= nr_irqs)
> +			break;
> +
> +		/* Distribute interrupts across online CPUs in round-robin */
> +		cpu = cpumask_nth(i % num_online_cpus(), cpu_online_mask);
> +		mask = get_cpu_mask(cpu);
> +		if (!cpumask_subset(mask, cpu_online_mask)) {
> +			dev_err(hba->dev, "Invalid CPU %d in map, using online CPUs\n",
> +				cpu);
> +			mask = cpu_online_mask;
> +		}
> +
> +		ret = irq_set_affinity_hint(desc->irq, mask);
> +		if (ret < 0)
> +			dev_err(hba->dev, "Failed to set affinity hint to CPU %d for ESI IRQ %d, err = %d\n",
> +				cpu, desc->irq, ret);
> +
> +		i++;
> +	}
> +	__msi_unlock_descs(hba->dev);
> +}

Why an entirely new function for setting interrupt affinity? Why isn't
irq_create_affinity_masks() good enough? Are you aware that
devm_platform_get_irqs_affinity() calls irq_create_affinity_masks()?

Thanks,

Bart.

