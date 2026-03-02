Return-Path: <linux-arm-msm+bounces-94947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCYNARSVpWnXEAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:48:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE0B1DA100
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:48:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FC183070DE8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 13:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46D53451A6;
	Mon,  2 Mar 2026 13:43:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8F7332EC1;
	Mon,  2 Mar 2026 13:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772459005; cv=none; b=imfmrYLKAf5yBcdn9yycSWQQNew3jhkQ/O0oMS6idXZ0gK69ibeATaxuH10A7eG8lhZLBP1JwBD1SCNzQkMretv03EG9r0saD6VVUPiHX8f25FutjT7jd5XGKA3PUMuAwyq3590OGn1xYxGsf3sgOTj/HzB4/uE4pUQMx1+JyeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772459005; c=relaxed/simple;
	bh=zsWgoV8Guqv96aPi9dvfyPDucsCQRWi/m1EPAQvx7o0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OXSwAZgCfteMocVINNfTtIiK+ncX0uexnsj5VOfVXSyjnoG1vo9khA4F4fbmvBo5cnhGECMcYzaiXsqDuNfBQ49JFd//q2FIhmcPwTx5Cf6AGMsIk5QxbF3QSaRGCZF6fMGl0F5QcwY+kTsSzrjxbjLrUGQ3yyk0sXTcPkPmnXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1759714BF;
	Mon,  2 Mar 2026 05:43:17 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BE4B3F73B;
	Mon,  2 Mar 2026 05:43:21 -0800 (PST)
Date: Mon, 2 Mar 2026 13:43:18 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
Cc: catalin.marinas@arm.com, dev.jain@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, mhiramat@kernel.org, will@kernel.org,
	yang@os.amperecomputing.com
Subject: Re: [PATCH v3 0/1] kernel: kprobes: fix cur_kprobe corruption during
 re-entrant kprobe_busy_begin() calls
Message-ID: <aaWT9hneQSRgpIuj@J2N7QTR9R3>
References: <aaVzOfAKhQ-uLG06@J2N7QTR9R3>
 <20260302122338.3618334-1-khaja.khaji@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302122338.3618334-1-khaja.khaji@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.86 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94947-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mark.rutland@arm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.765];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5FE0B1DA100
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 05:53:38PM +0530, Khaja Hussain Shaik Khaji wrote:
> On Mon, Mar 02, 2026 at 04:23:46PM +0530, Mark Rutland wrote:
> > The el1_dbg() function was removed in commit:
> >
> >   31575e11ecf7 ("arm64: debug: split brk64 exception entry")
> >
> > ... which was merged in v6.17.
> >
> > Are you able to reproduce the issue with v6.17 or later?
> >
> > Which specific kernel version did you see this with?
> 
> The call trace was captured on v6.9-rc1.

Why are you using an -rc1 release from almost two years ago?

> I have not yet tested on v6.17 or later. I will test and report back.
> 
> That said, the fix is in kernel/kprobes.c and addresses a generic
> re-entrancy issue in kprobe_busy_begin/end that is not specific to the
> arm64 entry path. The race -- where kprobe_busy_begin() is called
> re-entrantly from within an active kprobe context (e.g. via softirq
> during kretprobe entry_handler) -- can occur on any architecture where
> IRQs are re-enabled before invoking kprobe handlers.

AFAICT, re-enabling IRQs in that path would be a bug, and re-entrancy is
simply not expected. Please see my other reply on that front.

> I will verify whether the issue is still reproducible on v6.17+ and
> report back.

Thanks, that would be much appreciated. As would anything you can share
on the specifics of your kretprobe entry_handler

Mark.

