Return-Path: <linux-arm-msm+bounces-110363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGtuEH/IGmqA8wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 13:22:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B042D60C6FA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 13:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8DE763020FD2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 11:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8D173A901F;
	Sat, 30 May 2026 11:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PnGgUWog"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83232475CF;
	Sat, 30 May 2026 11:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780140156; cv=none; b=YGfV+4KOQU8fRMnGDCi5xMBqnqHqQCZCS6XeIq2R/a1ZHXvX0r1XVSV6+xoiE2XF3/kYhOamTSpB1W6/0K+lLfLJwIeMwfslNfNLeV6l88DuYMbdM2ldIajbHjOAlRUMw/9dLZqCOE/SplRx2l10QIfbz9dsIBMECDSFaO1cXyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780140156; c=relaxed/simple;
	bh=388eYwfeQxlWdJscmIQOSrJlDGjPqpuWOTwpU8hejw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ouqZZFS3+vojiOsYRgMBLDkbjimmmeoRz/hGmWePw+drONuzB6usEKXHU5y/ucwV87oIz64lCmCt0NVBoG8o29Br+SxqE6p/hX2AjlFkHWDA4nmZZYqNzM5hwKFkM/ELS9nOyLfEfHkySTrQFpSkfw6yHvaOAhhVADA8+OiXbWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PnGgUWog; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A1DE1F00893;
	Sat, 30 May 2026 11:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780140155;
	bh=IQZCkiGEMrOdJSxAFeiMja7PHP7ISa6FzqvAqnIIwqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PnGgUWogYuXDSQ7JT7Rz5zV7cHWcLOaFmjLd8HfPly9lUk2V/syMDJmMDnpGZtwDk
	 1j1vV2qj7oSP6SsweuqUxaV1mVPuW6E3OSpzwUPYXAjt9D0oLIKazk1mj93NeatQ6p
	 hiSs8mELlkmGn+f1PhqpdRgybJLo3MYbm41FCPGEqI3I98kCiR5X/zo98B802R9X6C
	 WOgUSef5pBMcCMEUDuc9wO7zsj9L8/pdlJL/xEjJ+FGSa2TSOWeCX1rmn3zuLKWIGJ
	 LpmsMQmpbZqe0wXHFTrfkvLz/gwRJqsUL8F/5glSct1VrxtYGdbSzzo1jT8zsBPEME
	 hOwNI8aIS+nQA==
Date: Sat, 30 May 2026 13:22:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] dt-bindings: soc: qcom,aoss-qmp: Document the Maili
 AOSS side channel
Message-ID: <20260530-swinging-wakeful-mole-359940@quoll>
References: <20260524-maili-soc-binding-v1-0-fdf9f9ff1b23@oss.qualcomm.com>
 <20260524-maili-soc-binding-v1-3-fdf9f9ff1b23@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260524-maili-soc-binding-v1-3-fdf9f9ff1b23@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110363-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gurudas.dev,oss.qualcomm.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B042D60C6FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, May 24, 2026 at 11:29:46PM -0700, Jingyi Wang wrote:
> From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
> 
> Document the Always-on Subsystem side channel on Qualcomm Maili SoC.
> 
> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>

Same comments. Also incomplete DCO.

Best regards,
Krzysztof


