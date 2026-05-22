Return-Path: <linux-arm-msm+bounces-109220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aO0PGComEGoYUQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:47:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BC05B16C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:47:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02581300DDC4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 09:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C693B95F6;
	Fri, 22 May 2026 09:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QgQCmYVm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D36203710;
	Fri, 22 May 2026 09:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779443228; cv=none; b=taykrvAjYShioi80hXAvV0Kkn2j7VExjpnwUE9Di9ekekvzIM9yWnh+GL6Qha/pY7TZM1tJy3tWJFItyFsSgHhNVqJJIaj/YUq3Lp6pTJGkp4n01F/tyKgtcNRLUsxNYaWB2eSxqTCTWQajqQ7jvBi7VniOmSw7HmVGaXrP9/iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779443228; c=relaxed/simple;
	bh=Zcon7re8p4Z48iKim1OWuNLU4yYiUIQNl3F0gDq1AiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tNfikdR0K41Cyb3dp7y7epe2a02i5ObfdU2lwrovKYylYsK6XwIKylIR2Ok2wJLT0fN3XK4uoNBMJvK2XIG+ReNzacSY69w8teup1tFF/QUJU4+Ay+vmba+FMnCAI7xBLQcuurUdjNvndyOI2e3hsYLd7S77wqdnpFnis787K4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QgQCmYVm; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6208E1F000E9;
	Fri, 22 May 2026 09:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779443226;
	bh=1OYOmpcnaYm6xp40B2cDIIULOBqj9UXJM1JtYYK4HXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QgQCmYVmhn54+NAotbRkpDpRHzzHikRu6Ju5h69a5lKRb05HxPJvZcApPCf4wOUYz
	 /SBFh9Pi9ac7JC+/2vF8ZgrQIx7KO4hRigiVPrk/Dgtq5nTEl2colDUZUzbsLBx/bz
	 AYaGVAGY8VR1SXAgGsxGBX5j5MvCCH6yUQNQ7RhQ=
Date: Fri, 22 May 2026 11:47:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Aniket Randive <aniket.randive@oss.qualcomm.com>,
	chandana.chiluveru@oss.qualcomm.com,
	jyothi.seerapu@oss.qualcomm.com
Subject: Re: [PATCH v3 2/2] serial: qcom-geni: Add tracepoints for Qualcomm
 GENI serial driver
Message-ID: <2026052258-scrooge-friction-fe21@gregkh>
References: <20260518-add-tracepoints-for-qcom-geni-serial-v3-0-b4addb151376@oss.qualcomm.com>
 <20260518-add-tracepoints-for-qcom-geni-serial-v3-2-b4addb151376@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518-add-tracepoints-for-qcom-geni-serial-v3-2-b4addb151376@oss.qualcomm.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109220-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: B2BC05B16C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 11:26:56PM +0530, Praveen Talari wrote:
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

This patch did not apply to my tree :(

