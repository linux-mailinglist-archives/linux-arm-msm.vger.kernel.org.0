Return-Path: <linux-arm-msm+bounces-92854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFziNIPMkGn3cwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 20:26:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D2413D06E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 20:26:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5A21301FFAB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 19:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AE90303A04;
	Sat, 14 Feb 2026 19:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mm21YYYj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91192BCF6C;
	Sat, 14 Feb 2026 19:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771097217; cv=none; b=sjdwOADb6Kzrv11YR7wW1M4wRBKYwCy7i12vTAxVGc9Hd3tFdmk5REEucq9YhFFjkqRDLYCyxF/OPIQ/nhWnL8FPFBfhyldUb7DI4BR6qYkfkPRuZ3PasNmBQ0G5J25z9OSYgYAqJRTtQaXqWnrqoCyUVlcth5Cn8P5lA9vKFF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771097217; c=relaxed/simple;
	bh=zVE+zElLDJRJ/vh72R6z5M7yYo9adh6BG2IXaDWNDGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hsfuT+9oKQS31EIUqqdi/+rZ1tnekiZbpuaBsEb6SxISwBoseK0LzEUOJoobKgVCK4vhWkN2cBBwKm+8kKwKxlGVtt0qSVaUFsCmPWxIvnDn/k4Z1IvKHaR0vWVqZS6wjc+dawlxKwJMydjqJJGiIPAB+l7I6SStgfKPPJ20K6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mm21YYYj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 509BAC16AAE;
	Sat, 14 Feb 2026 19:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771097216;
	bh=zVE+zElLDJRJ/vh72R6z5M7yYo9adh6BG2IXaDWNDGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mm21YYYjnumIoYF4BRGDxJMjD4RAAKRwzWvkY8s7TEa4tD2NrqvaK3kuB+dt7gkj3
	 NTsFMC/KZWICJor0QN/shR4EFUyx8zLn5po+L5D0bClQLSTnufZEwJCpFa45ClcZtP
	 8ikR/jWBstotk5z1aPOH5y1x7RH093ZqiXDdRZKHGBJapJlz5e0e9vhZFMWZtQIf4u
	 Dl0V/qiWZldg4XKg8pUsfoqOh3pd/+JRnBHTnSt2amqie5cxitX+nR5/W6uvqDM+2l
	 Jgo8oNNahKW0qPEZbsYbQkE4xsO3on1uULF9GgIQH9ANFyzjaGr4XTBTrl72/J3P/s
	 fHIksf2u3vRJg==
Date: Sat, 14 Feb 2026 13:26:54 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Alexander Wilhelm <alexander.wilhelm@westermo.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Subject: Re: [PATCH v5 0/3] soc: qcom: extend interface for big endian support
Message-ID: <mmd44dczfsfcjfhfikcjzaxongb6dwy4oqxtpv7t2jvyudzut4@hi3n3e7brse4>
References: <20251119104008.3505152-1-alexander.wilhelm@westermo.com>
 <dfb72933-938f-43f2-87f3-2e3ab9697125@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfb72933-938f-43f2-87f3-2e3ab9697125@ixit.cz>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92854-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 33D2413D06E
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 09:22:07AM +0100, David Heidelberg wrote:
> On 19/11/2025 11:40, Alexander Wilhelm wrote:
> > Currently, the QMI interface only works on little endian systems due to how
> > it encodes and decodes data. Most QMI related data structures are defined
> > in CPU native order and do not use endian specific types.
> > 
> > Add support for endian conversion of basic element types in the QMI
> > encoding and decoding logic. Fix the handling of QMI_DATA_LEN fields to
> > ensure correct interpretation on big endian systems. These changes are
> > required to allow QMI to operate correctly across architectures with
> > different endianness.
> > ---
> 
> Hello,
> 
> I recently (next-20260119) started receiving errors on Pixel 3:
> 
> [   21.158943] ipa 1e40000.ipa: received modem running event
> [   21.164616] qmi_encode: Invalid data length
> [   21.168930] qcom_q6v5_pas remoteproc-adsp: failed to send subsystem event
> [   21.175844] qmi_encode: Invalid data length
> [   21.180494] qcom_q6v5_pas remoteproc-cdsp: failed to send subsystem event
> [   21.187467] qmi_encode: Invalid data length
> [   21.191772] qcom-q6v5-mss 4080000.remoteproc: failed to send subsystem
> event
> [   21.199088] qmi_encode: Invalid data length
> [   21.203360] qcom-q6v5-mss 4080000.remoteproc: failed to send subsystem
> event
> [   21.210636] remoteproc remoteproc0: remote processor 4080000.remoteproc
> is now up
> 
> Since it's not well tested, I believe there could be problem with
> configuration, but after reverting this series, no errors pop up.
> 
> I would believe maybe these errors was previously hidden, but just to be
> sure asking here.
> 

#regzbot ^introduced: fe099c387e06

> Thanks
> David
> 
> [...]--
> David Heidelberg
> 

