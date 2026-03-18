Return-Path: <linux-arm-msm+bounces-98326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0A6mNElOumlUUAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 08:03:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF332B6A7A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 08:03:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 114A0300BC8F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 07:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C46BE368960;
	Wed, 18 Mar 2026 07:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ts/QV93o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A188A366DC0;
	Wed, 18 Mar 2026 07:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773817412; cv=none; b=FN2kfEv3vwXT5DsmB5U3TgTE/z/VXk8hYawBcXP/gHd1aSwcG/2hEYJOaesUJ5FkQaRZcO3GRs2cJC2Pb7dGwvdB6i3P8wfAjTfYWM+6On71YVdzKIx1ZMutGhij0MhfJ9BtxmmdpCSfDMAVNT8ChTBSP9dooN42qi/5jJH9kYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773817412; c=relaxed/simple;
	bh=gRHdCWV8tqoJUtCV3OMyo7dNo4HVb79QhQvB6N0dZgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VL3T1ef7wRKrcdGovf+VHPx++Ov4Bmfmk4fIiLdqdVkuJK2Q7F2fEQqzJia0gVWDXjfavdzPOlepe7exSMTIf5CzmSO19KBQi+n5LXmNTYH00GbizDVGToXzvjxj7O9aKTc7fa8U3CqUISIHClRg3ZQXFhBw5rma1jzUbIlK7GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ts/QV93o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF03CC19421;
	Wed, 18 Mar 2026 07:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773817412;
	bh=gRHdCWV8tqoJUtCV3OMyo7dNo4HVb79QhQvB6N0dZgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ts/QV93oq1lwlrBL/llm41nF8LNVDG8wHZMQluFG5Sh12SqdO250RCteIrxoZMhDD
	 jjfu1tTAZ4PtyE1MstdXCOKLbKWEB//tuPrHdpYo/e/Ogcl6LDC3MMaQfRTrX/6DVB
	 UPqL9SC7GT3iCa0QKgYY5qbF3GKNPAR6sTQ5CDCpVnrnttEKAYZz2U3tLQEKM4d1BJ
	 bGgQRF/l9ywd6CUUqSSKDtn6ORZx72gYULpO2oU+7Vt4rPn5bIHuxEX+f7/XswzvkA
	 BmWeQJqmO5OJOrvqEhHRSqlOqkil2Xnblq+TzDMLHE4o9AfDaxBT/njtSFJ8b6j+Q+
	 o08CXvwG9wz0Q==
Date: Wed, 18 Mar 2026 08:03:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, 
	Matthias Kaehlcke <mka@chromium.org>, Mike Looijmans <mike.looijmans@topic.nl>, 
	Pin-yen Lin <treapking@chromium.org>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	J =?utf-8?Q?=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v6 0/4] Enable secondary USB controller in host mode
Message-ID: <20260318-neon-vigorous-prawn-dce7f3@quoll>
References: <20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98326-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DBF332B6A7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 09:36:40AM +0530, Swati Agarwal wrote:
> Enable secondary USB controller in host mode.
> 
> This patch depends on:
> https://lore.kernel.org/all/20260306091355.1178333-1-swati.agarwal@oss.qualcomm.com/

Honestly? No. Drivers cannot depend on DTS.

Also, combining here USB is a no-go. Do not combine independent
patchsets into one patchset.

I also do not see how you addressed my comments from previous version.
You never bothered to respond and I do not see them implemented.

Best regards,
Krzysztof


