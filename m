Return-Path: <linux-arm-msm+bounces-93935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MG0wFBpgnWkDPAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 09:23:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB4418397A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 09:23:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AEC123021582
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 08:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2992C21EC;
	Tue, 24 Feb 2026 08:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cpx6cgZq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9932749E6;
	Tue, 24 Feb 2026 08:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771921429; cv=none; b=maBDRQOVO/9BgwnYxKp8vWQcwFDMliKsfnfanwFl8YrmOQmV7LLP2VN9Y+X/8G2y3SN83QAg4lt4ia+S5qGJW5vtPBMzQas/vrHLbcJdbmOkHnwbiLTLu54uAM8gRwHCu2HC/wQ7AlQ3x0k6Sx7G4SrhRDKhP1ipcZUUUwWw5Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771921429; c=relaxed/simple;
	bh=yW/XdX7C6OB/JJmDVlyglpXhjr79lcN8BLHSEqmvmuw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=CJnuuTw3aQWdrGHehTuLEmlowpJ8PYzSmDeUF9SzqhEXAx3o/fUQ7oOIpzeBz5dPwxv2ESwpg4G7oUvbyM3cmjl2Y4Y7ljs7dhvK3EIUyCWbpaNGFezRRVvQPkTSTBKMFov9PlENTxhTecSVwTO7P0N/huzPhJmMUZl5toGtxQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cpx6cgZq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E176C116D0;
	Tue, 24 Feb 2026 08:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771921429;
	bh=yW/XdX7C6OB/JJmDVlyglpXhjr79lcN8BLHSEqmvmuw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cpx6cgZql3OwQ/HJCQrsGktvOyjDIU47oLrJ4zVE+Ubk8lQBV/R9eo0107OvLJmIT
	 roM6sWuHUryAPLCGIugNxqV4ptPnsT5YEcnOTsruUM9QWg0zkXwVPlCO/zdKfJniQ5
	 yEWn5ketwoDlGyBemeLEemHxdcQssoZhutw8nN1PitISkwNx+rAnFQWmqbQ1xTPARH
	 5znb2xfgDnRI94BHc77IG6Exdx46ShMh914oWmr8Tjvuz2hGe8UK0zZFQS3Gtu5QmH
	 cQznkVTt0t1t10c0gFdoUA/+E1DWEVEosXP0M6yIdK3e0Tzsqip84sWbdFOW2fqhrH
	 6Iz53NCvwyDtg==
Date: Tue, 24 Feb 2026 17:23:46 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 catalin.marinas@arm.com, will@kernel.org, mhiramat@kernel.org,
 yang@os.amperecomputing.com, dev.jain@arm.com, ada.coupriediaz@arm.com,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: insn: drop NOP from steppable hint list
Message-Id: <20260224172346.9f094cffc58ce7e013a4d7c2@kernel.org>
In-Reply-To: <aZSd5O0gdGM9dUkR@J2N7QTR9R3.cambridge.arm.com>
References: <20251106104955.2089268-1-khaja.khaji@oss.qualcomm.com>
	<20260217133855.3142192-1-khaja.khaji@oss.qualcomm.com>
	<20260217133855.3142192-3-khaja.khaji@oss.qualcomm.com>
	<aZSd5O0gdGM9dUkR@J2N7QTR9R3.cambridge.arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93935-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhiramat@kernel.org,linux-arm-msm@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: BDB4418397A
X-Rspamd-Action: no action

On Tue, 17 Feb 2026 16:57:08 +0000
Mark Rutland <mark.rutland@arm.com> wrote:

> On Tue, Feb 17, 2026 at 07:08:55PM +0530, Khaja Hussain Shaik Khaji wrote:
> > NOP is already handled via instruction emulation and does not require
> > single-stepping. Drop it from aarch64_insn_is_steppable_hint().
> > 
> > Signed-off-by: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
> > ---
> >  arch/arm64/include/asm/insn.h | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
> > index e1d30ba99d01..9429f76906e0 100644
> > --- a/arch/arm64/include/asm/insn.h
> > +++ b/arch/arm64/include/asm/insn.h
> > @@ -456,7 +456,6 @@ static __always_inline bool aarch64_insn_is_steppable_hint(u32 insn)
> >  	case AARCH64_INSN_HINT_BTIC:
> >  	case AARCH64_INSN_HINT_BTIJ:
> >  	case AARCH64_INSN_HINT_BTIJC:
> > -	case AARCH64_INSN_HINT_NOP:
> >  		return true;
> >  	default:
> >  		return false;
> 
> The intent is that aarch64_insn_is_steppable_hint() says whether an
> instruction is safe to step, not whether it *must* be stepped. I think
> we can leave NOP here unless this is causing some functional problem?

Agreed. I think we should keep this as it is.

Thank you,

> 
> Mark.
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

