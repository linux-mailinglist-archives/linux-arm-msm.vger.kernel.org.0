Return-Path: <linux-arm-msm+bounces-100478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hcYmDNH1xmkGQwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 22:25:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8384E34BA5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 22:25:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10300302DF49
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175123939B4;
	Fri, 27 Mar 2026 21:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="Q6j12W8I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892D7393DE8;
	Fri, 27 Mar 2026 21:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774646536; cv=none; b=UwpxEC1uPERG0nBKRquK1BenBlasxo+owFrMgV7NEKB+suqwE0r7Gq7JcvHu3H5BehCpzx/f/SesViPOIjt1vWqlb80cNlBoFiclgdrdmHS5EPzE5aWf895RcbhAiKUMPRUIn3lHoK1gBB0O+BgWVM+cBMWiPG/KQE/vp86j+6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774646536; c=relaxed/simple;
	bh=o/Xk/AwAMP9s4wn42NlouDuJUITJooiA4VU7seIz40E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AK8hg84KvPhmRGZeK12zkR1weDJecMgtZ8/SJxsBlw6SoCkNfc1ZUXbCPPEeJHZYqVer79s27Z1ij3ck9nIrGuVyMbxW+Nm7Fqht+7z4hM+q3CUc7hiYWWQcGte6aJjFUw8kCa0USdXWTEVxFiYEqjyaZMj7YrQif5lgKXCd1lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=Q6j12W8I; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4fjD9x6kNMzlh2rT;
	Fri, 27 Mar 2026 21:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1774646529; x=1777238530; bh=FgI+qgVXtu28VJrLnYzYaY+l
	vHeWTskt8jVG5pYApZE=; b=Q6j12W8IYQk4wVc7bMQX2c387W5gfKKQhcEKS7XI
	iUmxHOYb8wushXCQlHc0q7FmhaVOM0AlHt6lR0vRktpN4zE+b1b0a208sIFb6C09
	dUs57sgxK0kZ/QDirpi+VEmZonMu3ckmswbwvLTj+l8ij8uJblXejnMhME15O0+Y
	l9otfdZOTOQdMU/XamWEtakjniUNWpbrKbMKgyV+MxytnnYfrAPnaOWAXAhSYHmo
	jUBp3uukPCcb3XEVkRpRskRN4OTOdLev9eeoanBdTAVnxQ5q9IQHQEN09O5oTUnh
	oih4RvZsKQqZbZuQnzYNIK7bzE2Li+XnIpzWkxLv6y9OwA==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id AP1kfpMYS-Ch; Fri, 27 Mar 2026 21:22:09 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4fjD9q3Pxdzlgtd1;
	Fri, 27 Mar 2026 21:22:06 +0000 (UTC)
Message-ID: <97050b9c-7174-4402-a1ee-66269f8d8b6a@acm.org>
Date: Fri, 27 Mar 2026 14:22:06 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] ufs: ufs-qcom: Enable Auto Hibern8 clock request
 support
To: palash.kambar@oss.qualcomm.com, mani@kernel.org,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, shawn.lin@rock-chips.com,
 nitin.rawat@oss.qualcomm.com
References: <20260327090346.656324-1-palash.kambar@oss.qualcomm.com>
 <20260327090346.656324-3-palash.kambar@oss.qualcomm.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260327090346.656324-3-palash.kambar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[acm.org,reject];
	R_DKIM_ALLOW(-0.20)[acm.org:s=mr01];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[acm.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100478-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bvanassche@acm.org,linux-arm-msm@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,acm.org:dkim,acm.org:mid]
X-Rspamd-Queue-Id: 8384E34BA5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 2:03 AM, palash.kambar@oss.qualcomm.com wrote:
> On platforms that support Auto Hibern8 (AH8), the UFS controller can
> autonomously de-assert clk_req signals to the GCC when entering the
> Hibern8 state. This allows GCC to gate unused clocks, improving
> power efficiency.

What is the "GCC"? Please expand acronyms that are neither defined in
the UFSHCI standard nor in the UFS standard.

> +static void ufs_qcom_link_startup_post_change(struct ufs_hba *hba)
> +{
> +	if (ufshcd_is_auto_hibern8_supported(hba)) {
> +		ufshcd_rmwl(hba, UFS_HW_CLK_CTRL_EN, UFS_HW_CLK_CTRL_EN,
> +			    UFS_AH8_CFG);
> +	}
> +}

 From the Linux kernel coding style "Do not unnecessarily use braces 
where a single statement will do." Please follow that rule.

Thanks,

Bart.

