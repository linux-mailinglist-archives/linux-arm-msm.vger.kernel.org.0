Return-Path: <linux-arm-msm+bounces-102934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YF5SEsDO3GmcWQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 13:08:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DFB3EB1D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 13:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D396D3004D14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2B03BD657;
	Mon, 13 Apr 2026 11:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LLJKG2Md"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2739A3B47CE;
	Mon, 13 Apr 2026 11:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776078302; cv=none; b=shyACcD1Z4+uTmaRKIgukUuMGW7wkJyYGqsXspsGLtonmQXNQigr9T4e2/eicZpvUTCM6PT8z3B8n3vu2fWJdDV7NxiNSwJDZBLqBJe+VSwKeY4cIrHGmtbWL6btcbNPsLPwzCoMNF+5Iz23t3QT00pO4tZoXRUcbySynzHUXwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776078302; c=relaxed/simple;
	bh=EW7/I7t0wKFYsBLyPf41BSms1G0EuhpLPw78KMfPKaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lg+tQBEOHAqW4ZhxEeJeUN/t373KjfwX2lTjJOdPzBXwPSJEcKgGB6pXRnBFN15R7fyD5yXfvvAYVHXX4z4TEbAI1V/BXM/olG6QXwsa8qLQMESmc5L68i75WftTEgWl5bl98uSg7FhKO9Sc1aid9EbF+Bw5G1GF9KIEgynXwI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LLJKG2Md; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D91C116C6;
	Mon, 13 Apr 2026 11:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776078301;
	bh=EW7/I7t0wKFYsBLyPf41BSms1G0EuhpLPw78KMfPKaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LLJKG2Md63iATpumkFQbaSa1gOtfuxt5qjbm0o/a5p4fzet++IWoNetlNgeZn9q+2
	 4BnA8nxFAl5p+cjgTALQNzJNb+++/xPPpQZDV+2q9oEcOQFoA6jhaOyETt5SPzEdXo
	 rDi99P4Z7l9QzpI2vxTCOmfdb3UMBgNE7JLBdaRA7pzr2MYp8RRWt7c/2ysvS+LWqU
	 HHoiSu902etlonFqLdr2fVkTKG1wB5EGqgoQXqkHcNUfZkgS/MpB5SwAB5ecD1N/5t
	 SOZwvcnHRq4GLmDgQGQMNFvdCEJJ/WF4PwYoO8On47ujCCf4GgKbotxnV0l2EOZHBD
	 SQnpRtFVO08WA==
Date: Mon, 13 Apr 2026 16:34:53 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: Kishore Batta <kishore.batta@oss.qualcomm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>, Oded Gabbay <ogabbay@kernel.org>, andersson@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
Subject: Re: [PATCH v4 2/9] bus: mhi: Move sahara protocol driver under
 drivers/bus/mhi
Message-ID: <sab2tgxtiftme5gscknsl7cfifpshtlrnnihbm2g56ppbowcit@bg4bzwuta6a6>
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-2-47ad79308762@oss.qualcomm.com>
 <0a2af0d1-27da-4f60-952a-409a5abc5647@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a2af0d1-27da-4f60-952a-409a5abc5647@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102934-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 36DFB3EB1D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 02:20:02PM -0600, Jeff Hugo wrote:
> On 3/19/2026 12:31 AM, Kishore Batta wrote:
> > The Sahara protocol driver is currently located under the QAIC
> > accelerator subsystem even though protocol itself is transported over the
> > MHI bus and is used by multiple Qualcomm flashless devices.
> > 
> > Relocate the Sahara protocol driver to drivers/bus/mhi and register it as
> > an independent MHI protocol driver. This avoids treating Sahara as QAIC
> > specific and makes it available for reuse by other MHI based devices.
> > 
> > As part of this move, introduce a dedicated Kconfig and Makefile under the
> > MHI subsystem and expose the sahara interface via a common header.
> 
> I don't think this belongs under MHI. Mani needs to confirm that he agrees
> with the concept of moving this there.
> 
> The Sahara protocol as defined by the spec does not require MHI. We know
> that there are Sahara implementations over USB. I don't see a dependency or
> relationship to MHI other than the current in-kernel implementation uses
> MHI, but there are plenty of things that use MHI (qaic, mhi-net, ath12k,
> etc) which are not a part of the MHI bus.
> 

Since Sahara is a MHI client driver, it is OK with me to place it under
drivers/bus/mhi/host/. We do tend to host the client/controller drivers if they
also bind to separate top level subsystems like Net, WWAN... but for the pure
protocol drivers like Sahara, MHI can provide asylum.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

