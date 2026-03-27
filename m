Return-Path: <linux-arm-msm+bounces-100477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBr2Jx71xmnaQgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 22:22:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAC134BA3B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 22:22:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34CAD303AAB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9077F37754B;
	Fri, 27 Mar 2026 21:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="byTITuvh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D290382F19;
	Fri, 27 Mar 2026 21:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774646285; cv=none; b=MVa1As9zn/5yS3p9N1Tp5GuWpTAqlsxyJxS2s3soAuRv978NVN8WZin4dggN7wph3Hh9DnlUn3UuNAIdrIbTG0F/NwDz/DI4joQebJtqLLfHwOPxXKwMMixTaw3J/TdM3bimJvK3RNU3zXiJla1C6KuLOXTATjZzmQdFtL2+4XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774646285; c=relaxed/simple;
	bh=Rvq5FCV5OXpU5d/JztYFIeIHyGQvbPLbXwOkyHt5Ohw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EKlNhIkXOSXVVKYG7wT6Uciysap4roqx/bt+rcylfVH45qOvDJxJ88MZClJmuL+DcNkCFAP+Ouixnke6XbAiikFMgzlm9wsj9owd1TVxqKHfPHvOilHWWdypJkfCu3QID0ZJGnrpMA5qNmGRXAh9EWTQp2wUo2kxBpUZrdH3p5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=byTITuvh; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4fjD576gMwzlffts;
	Fri, 27 Mar 2026 21:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1774646278; x=1777238279; bh=m9P0OQCjr2NyH36u6Wmm96MO
	XUuzVAw5wbrcOWKFSWw=; b=byTITuvh8ATpj/tORWxNPX6pdrS1dTk1xoiB30H3
	NSArFCZPX4Y+Y9Pq20dwB10ZuYRZqQFz1R7uZxEA+tMPIJT2qhu7xCm4DGnyJ3e0
	zWSomww7AeVAtnXb1KPRbDCthacM0nvzvCJFM3sCPh2cqc6blyUn3+8s8l2Izqt/
	X7Adgkh4N+LuR7c3Kcw7Mf4UrnXCW6T85oYBaOOIDC/n2m4l05tqnU05Z/UX1UWJ
	OPGdk68QK3OljK7Hde/iim5ovlO00ZBlYe33mdtiH9jqmY5MN763hLdkF1/st8dA
	wFHr7oF0Ytp6dS1MwlOZiXwy2KKQKHc+BToYIuv/AFDDow==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id neRxyoQgXoCA; Fri, 27 Mar 2026 21:17:58 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4fjD4z6DzvzlfvqD;
	Fri, 27 Mar 2026 21:17:55 +0000 (UTC)
Message-ID: <c8ae2a1e-e42a-4591-839d-e22f93ab6b17@acm.org>
Date: Fri, 27 Mar 2026 14:17:54 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] ufs: core: Configure only active lanes during link
To: palash.kambar@oss.qualcomm.com, mani@kernel.org,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, shawn.lin@rock-chips.com,
 nitin.rawat@oss.qualcomm.com
References: <20260327090346.656324-1-palash.kambar@oss.qualcomm.com>
 <20260327090346.656324-2-palash.kambar@oss.qualcomm.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260327090346.656324-2-palash.kambar@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-100477-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[acm.org:dkim,acm.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 0AAC134BA3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 2:03 AM, palash.kambar@oss.qualcomm.com wrote:
> +static int ufshcd_validate_link_params(struct ufs_hba *hba)
> +{
> +	int ret = 0;
> +	int val = 0;

Both initializers are superfluous. Please remove at least the
initializer for "ret" since the first statement in this function assigns
a value to "ret".

> +	ret = ufshcd_dme_get(hba,
> +			     UIC_ARG_MIB(PA_CONNECTEDTXDATALANES), &val);

The formatting of the above statement does not follow the Linux kernel
coding style. Please format it as follows:

	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_CONNECTEDTXDATALANES),
			     &val);

A possible alternative to formatting code manually is to run something
like "git clang-format HEAD^" from the command line.

> +	val = 0;

This assignment is superfluous, isn't it?

> +	ret = ufshcd_dme_get(hba,
> +			     UIC_ARG_MIB(PA_CONNECTEDRXDATALANES), &val);

Please move the UIC_ARG_MIB() to the previous line.

Thanks,

Bart.

