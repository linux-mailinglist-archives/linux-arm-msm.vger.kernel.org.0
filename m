Return-Path: <linux-arm-msm+bounces-103554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOLMEaFg4mnI5QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 18:32:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C14641D262
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 18:32:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E8848300C0E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 16:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F2334C98C;
	Fri, 17 Apr 2026 16:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="COhxLGLi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755C82D46A1;
	Fri, 17 Apr 2026 16:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776443545; cv=none; b=nqgVZ1xTdwKKNK5xPD5sa5ITDzOJE3Y0EWEGHyWg3KmQPJ+itJWTvb/JzhmbY6zbI9ufNgmqn9JD3bezidwyA855h0LXLP+cfIGu+ZfWMwbWWf4w7v2eqEXU9VqYwCmEi1sUE+Ihc7QfgP390LCGpmxpYBs/kPFAMMXtRb7GqNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776443545; c=relaxed/simple;
	bh=sltB6aXAXBgtLNLAaD7dzZynYfJO2yzIsjmhXfUTGxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJ67G6MCYJMgyuMRWbPMmsT/kMDjnHPHmLvOpseQEObS0mhxYyMlqFImkamdouk4bHBPELyPvwJz8qizBnHuPDKWmvlk9Lxn1EuE9SIEFOEfE6/MIlJa4ekUZsFYeqcXO35bq1OEIZkAZOvGdc5YsPIZYZTG1FMcmxgs7Ew/Kug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=COhxLGLi; arc=none smtp.client-ip=199.89.1.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4fy0lp6Tndz1XM0nn;
	Fri, 17 Apr 2026 16:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1776443538; x=1779035539; bh=gz1AoQmUgLXhR20pUhpaUXni
	k4NmkuLib5mdsTRmPpo=; b=COhxLGLiBPlUQDCMI8lcprbTQq7myTK1A96KGeBs
	qGH5BMjNLSWjEhcKABkZPGtTvNnD91Wb8L+ACh2htYKSBwZRLKRR4EAKmklAkUoo
	3yDBuHWcFH74Xet0S5BlbYy1jfLPAmR1BXKB/ZKzZkyf/Fm6rQBdUgsDa7mIPfU0
	oU/xHGYxwVAczNd8nJQJY2Y8h4vX+eWal9JbeDejD/9PKirM8EHqB0ryFnD1LGt7
	hkxeP/rooKTo2ljg2ECCNUW1Kyx0YiCU7UxDqXCs+leSAYqAg/vL5mLv4NVydcl0
	Hr5NO9dMvBn1Ch8ztdboI4MCXo31qBmIg1P5A1pZ0b1WWg==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id SWrtd60MNsYn; Fri, 17 Apr 2026 16:32:18 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4fy0lg3KsPz1XM31H;
	Fri, 17 Apr 2026 16:32:15 +0000 (UTC)
Message-ID: <7594972e-5c01-470c-a59e-2419da730f21@acm.org>
Date: Fri, 17 Apr 2026 09:32:14 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] ufs: core: Configure only active lanes during link
To: palash.kambar@oss.qualcomm.com, mani@kernel.org,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
 shawn.lin@rock-chips.com
References: <20260417045602.3042928-1-palash.kambar@oss.qualcomm.com>
 <20260417045602.3042928-2-palash.kambar@oss.qualcomm.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260417045602.3042928-2-palash.kambar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[acm.org,reject];
	R_DKIM_ALLOW(-0.20)[acm.org:s=mr01];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[acm.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103554-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,acm.org:email,acm.org:dkim,acm.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1C14641D262
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/16/26 9:56 PM, palash.kambar@oss.qualcomm.com wrote:
> The number of connected lanes detected during UFS link startup can be
> fewer than the lanes specified in the device tree. The current driver
> logic attempts to configure all lanes defined in the device tree,
> regardless of their actual availability. This mismatch may cause
> failures during power mode changes.
> 
> Hence, Add a check during link startup to ensure that only the lanes
> actually discovered are considered valid. If a mismatch is detected,
> fail the initialization early, preventing the driver from entering
> an unsupported configuration that could cause power mode transition
> failures.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

