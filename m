Return-Path: <linux-arm-msm+bounces-118277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dK8eNP7pUGp38QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:47:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C82073AE67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:47:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=wiaptpKI;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118277-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118277-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95227301A72C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43AA4426689;
	Fri, 10 Jul 2026 12:41:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CF441F7E9;
	Fri, 10 Jul 2026 12:41:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783687291; cv=none; b=AiDsmGLBu2cMh0jI6Wm8E8O0GuyMO9+tvrJaVnq7t7/p6l+cZpfpgfb1hlaTYV0Wd7wj6v0RNOFKzfyQBtpgAc3rqxbRCN3zChKXpIEeTspAMj1rmokVveE0tmLZQKgjN/2CzmrEwjkRbCrwygz8XFMdVQc0RiEXEbzCMFNPGR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783687291; c=relaxed/simple;
	bh=EE3TjfG5eBu9Kd/+X8PmMovB9kNi9gsUzWBASrpUxJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BZCzk2O0JMKJD++b3poocO5HslT63b5/iz6Qq/iG8G8DlFLXrUymUsvdATjfnBeFX31SZ5L3BaYgyNxSfngohU2dpu1D0qKgOE063sCRUnahyXMey7UV7i+e3hwsSHnNKUtS9WiKksY4+YmjxzsRBn6A9mpk9lE3i4uI5ZhwpDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wiaptpKI; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E7A61F000E9;
	Fri, 10 Jul 2026 12:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783687289;
	bh=hDRYjbEaGoQ0tWoMPUac6jeuxz0p0lipsR0FrMDOr4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=wiaptpKIaT2vKbCT97Xw1lAzPN97jTJ7LbV6tqRp67jzEMDgFgq30g/xXN7ILSxyy
	 Rg79dR3+x86n6Ikq3v85BLbHXFwdzzK68+Y5U52/KhKzspCYBSa/OI0w69KsCbJFOg
	 4mtV7UUdjdoZ36eI2aZaQEtKh5KhS0xygKPCyjVM=
Date: Fri, 10 Jul 2026 14:41:25 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jiri Slaby <jirislaby@kernel.org>, konrad.dybcio@oss.qualcomm.com,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
	mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
	chandana.chiluveru@oss.qualcomm.com
Subject: Re: [PATCH v5 2/2] serial: qcom-geni: Add tracepoints for Qualcomm
 GENI serial driver
Message-ID: <2026071015-empower-sandpit-97a8@gregkh>
References: <20260615-add-tracepoints-for-qcom-geni-serial-v5-0-2efa4c97e0e2@oss.qualcomm.com>
 <20260615-add-tracepoints-for-qcom-geni-serial-v5-2-2efa4c97e0e2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615-add-tracepoints-for-qcom-geni-serial-v5-2-2efa4c97e0e2@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:jirislaby@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-serial@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-118277-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:from_mime,linuxfoundation.org:dkim,gregkh:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C82073AE67

On Mon, Jun 15, 2026 at 07:46:53PM +0530, Praveen Talari wrote:
> Add tracing to the Qualcomm GENI serial driver to improve runtime
> observability.
> 
> Trace hooks are added at key points including termios and clock
> configuration, manual control get/set, interrupt handling, and data
> TX/RX paths.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
> v2->v3:
> - Updated commit text(removed example as it was available on cover
>   letter).
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 27 +++++++++++++++++++++++----
>  1 file changed, 23 insertions(+), 4 deletions(-)

Does not apply to my tty-next branch :(

