Return-Path: <linux-arm-msm+bounces-93207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAWrEu+dlGmrFwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 17:57:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA9714E71B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 17:57:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 008533003BF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 16:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719C636E496;
	Tue, 17 Feb 2026 16:57:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB0C36EA82;
	Tue, 17 Feb 2026 16:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771347434; cv=none; b=AvWo6sTKLzNmme6P4nUOwCK4srwr40Wh1RM03tVbTkhV1ygoq9Y8TqNoRhkGLVHWdPtJSz6fCw0DEaQat0GhrByD2rrPBbmsB/+wcNQA/v6gYDQDqYwYDpGmdwnJhChyp24eGlqyPo6ddSPw75TDayCefPulucFeq/TXihpKuXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771347434; c=relaxed/simple;
	bh=MkrfJhrfMnF73crGr4J6gThPr+9VbYlUypDShbpRoxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SPjUEpEWnXjUfAjU5knIdVAG1NHS56zQN1Tp0jdJCbblwEArzPFng0Yf7DDrqbqJWLrhqjpn/5R5p7wlK8KG4NlplLbOragBZZ5iVJwHFcy71oGfW1ivkyo8FRZY/2jrDXPQQo+8KBbEM8uMm5h2WE1YzoqvrN+LHJOl4R/qfsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B9C91477;
	Tue, 17 Feb 2026 08:57:06 -0800 (PST)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E3853F62B;
	Tue, 17 Feb 2026 08:57:11 -0800 (PST)
Date: Tue, 17 Feb 2026 16:57:08 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com, will@kernel.org, mhiramat@kernel.org,
	yang@os.amperecomputing.com, dev.jain@arm.com,
	ada.coupriediaz@arm.com, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: insn: drop NOP from steppable hint list
Message-ID: <aZSd5O0gdGM9dUkR@J2N7QTR9R3.cambridge.arm.com>
References: <20251106104955.2089268-1-khaja.khaji@oss.qualcomm.com>
 <20260217133855.3142192-1-khaja.khaji@oss.qualcomm.com>
 <20260217133855.3142192-3-khaja.khaji@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217133855.3142192-3-khaja.khaji@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-93207-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mark.rutland@arm.com,linux-arm-msm@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[J2N7QTR9R3.cambridge.arm.com:mid,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6CA9714E71B
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 07:08:55PM +0530, Khaja Hussain Shaik Khaji wrote:
> NOP is already handled via instruction emulation and does not require
> single-stepping. Drop it from aarch64_insn_is_steppable_hint().
> 
> Signed-off-by: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
> ---
>  arch/arm64/include/asm/insn.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
> index e1d30ba99d01..9429f76906e0 100644
> --- a/arch/arm64/include/asm/insn.h
> +++ b/arch/arm64/include/asm/insn.h
> @@ -456,7 +456,6 @@ static __always_inline bool aarch64_insn_is_steppable_hint(u32 insn)
>  	case AARCH64_INSN_HINT_BTIC:
>  	case AARCH64_INSN_HINT_BTIJ:
>  	case AARCH64_INSN_HINT_BTIJC:
> -	case AARCH64_INSN_HINT_NOP:
>  		return true;
>  	default:
>  		return false;

The intent is that aarch64_insn_is_steppable_hint() says whether an
instruction is safe to step, not whether it *must* be stepped. I think
we can leave NOP here unless this is causing some functional problem?

Mark.

