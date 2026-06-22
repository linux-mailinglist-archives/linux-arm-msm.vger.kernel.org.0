Return-Path: <linux-arm-msm+bounces-113993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PuB7OSY2OWpyogcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:18:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA3F6AFBD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:18:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RJPTxwnS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113993-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113993-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 84762300F750
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554973B1022;
	Mon, 22 Jun 2026 13:18:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644593AC0ED;
	Mon, 22 Jun 2026 13:18:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782134306; cv=none; b=UUfqe5penXD4i5t/y6qb9edw4KnU2Jy04uZfqlhtrheun3NvhMkgT9YOi/qS0nq365XjbICi4bIMKBeD0jedlyIXSPn7KyOKSz+e2XDFrydPfT+O7r2gRCvr3wRRSbHbBOXu61Yd/Zr5vzmfEv63pNIenhltK4ocm7SJcZ4Qx5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782134306; c=relaxed/simple;
	bh=u1csng2k8UDRm5DnegyEPcqXuJB6KzAMw7RNh0kWorQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bgr0KxKwv2yKaBX1yT5C7MR6GP2T/vNVPwER/pKYMx0wIkaxiryX4XokVMUuScL1lWMUAQ0BOT+xVznHbDJtX4b6F/MVGY4BSmagB02EvJVFXsN3dkobt5j0ayDeYzqtKqUk8DFYG8Ihhoqq9eDFpZbtQihSZKqQgNtZGqkeK3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJPTxwnS; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8DBA1F000E9;
	Mon, 22 Jun 2026 13:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782134305;
	bh=cBN+5U4CBEdsvmtBBPbJFP18nwxyK6aWfGgPckI3/8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RJPTxwnSK/xV8/t0V16E5c9NUMUZNT993cZI3BbvRe5WCJJTJh2o0KT/3DlJcrBoc
	 YdxbzL4PZRt3tkNWIvK2DdHILozjldO9V234W3qxHKm3eV2XLMAJInp3VkkekBr+/D
	 YX/E948sZMg/yCuTy19V2H8TpTumvC+Ub87XMDBeK3Cmaswh2DSZSuRvMysj5toQLf
	 v+XH2QdlDjQ5944LUN69edAYL+oftNtabFH+4PkhaMchpfXZq/TEOS/qgOOX6Y9f44
	 JLL/VDE2TcbK+5ETtlGni5gmtp67xY2uV5/GHbwp1HJiQZYn70yrQVQna0D9xnBhF7
	 5HDPrIjjOgg+g==
Date: Mon, 22 Jun 2026 15:18:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 8/8] arm64: defconfig: Enable Qualcomm QAIF and
 WSA885X-I2C drivers
Message-ID: <20260622-analytic-pigeon-of-force-bd53c6@quoll>
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260616201315.2565115-9-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260616201315.2565115-9-mohammad.rafi.shaik@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mohammad.rafi.shaik@oss.qualcomm.com,m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-113993-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8AA3F6AFBD7

On Wed, Jun 17, 2026 at 01:43:15AM +0530, Mohammad Rafi Shaik wrote:
> Enable the QAIF CPU DAI and WSA885X I2C codec as modules in
> arm64 defconfig.
> 
> These options are required to exercise the Shikra EVK

Qualcomm Shikra EVK, but anyway the problem is that:
	git grep -i "Shikra EVK"
gives me zero results.

I already commented about this for some other patches.

Best regards,
Krzysztof


