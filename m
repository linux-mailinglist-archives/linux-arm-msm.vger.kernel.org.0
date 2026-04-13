Return-Path: <linux-arm-msm+bounces-102886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FpoAD+m3GkEUgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:15:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B8C3E8F70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34AFA300B05B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 08:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D1E53A4F47;
	Mon, 13 Apr 2026 08:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bEAEdORy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D97266581;
	Mon, 13 Apr 2026 08:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067818; cv=none; b=ayCs+AmUKaPkvwO5leuwlX6ofMIT2zOToWM6rSoFW5CyGXOXr9wBSBjSmwCfchKV7M7jK5MpBXr7twAzbYHN69MXs5H9J03jSJExyGj2quPATOkqBRJ9wICnp9BcCPnBCTlBqJtg/YjZbC5C9ZdD+QeheblpVQOQdq9CEgPtpcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067818; c=relaxed/simple;
	bh=zfFmyITgPX1D8/Eh2hvI5r7GcuggwASGrs3jhpwvHvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hN9XcBjoEjGqksXsjMXvftaUT/GjBsfWooavmLansPM+mUHUe4wSGpFp4058uhK7CAfg056+P7X58XOF2tvCXhWTmpR9CRnzlP/BfKRLmdLAsYd2Rr+wY+DhCPGad9Doj7qZAQs8Ef/Rc1RdiDz0zOytYQR3VDKgOmEKh9tQTRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bEAEdORy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2DB3C116C6;
	Mon, 13 Apr 2026 08:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776067818;
	bh=zfFmyITgPX1D8/Eh2hvI5r7GcuggwASGrs3jhpwvHvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bEAEdORyGuoWhsOQLnHyRwsfFlOQTTiL3LuIGPd8TKYGjatyUEGqYS3VA4HCsmprj
	 OgXsRhN4UCVo9pwM51B3jlOOuZAET5vaRsSbzwko7hKZ4xBMGQo07LwaTVY+j4O+3R
	 zIDjfPd0IqdR6n5yNTQxDJ3x52DOSsOTYz+uISUqvO2ghDtNlBMN4dViAj5P3Jk+AL
	 2w7jIcsm8hKCLh7BKN5BWL2bbNR4VV0cdoBpwyVrAcMYWguuesjCaVrU9jG7nad29E
	 te46FEXGeUEkIEF3/F54iRptMV8Z75/WUzus8wvPlGPnMOhku5QqjzKXr1Nl9hZQdO
	 kKMhNfPvJMcqQ==
Date: Mon, 13 Apr 2026 10:10:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 01/35] dt-bindings: qcom,pdc: Tighten reg to single APSS
 DRV region
Message-ID: <20260413-delectable-fair-nautilus-ccabcc@quoll>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260410184124.1068210-2-mukesh.ojha@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102886-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 52B8C3E8F70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 12:10:38AM +0530, Mukesh Ojha wrote:
> The PDC has multiple DRV regions, each sized 0x10000, where each region

Here and in subject - add "example". You are not tightening anything
relevant. This is just an example, it can contain whatever "reg" value.
It's nice that value is real and correct, but now your subject creates
impression you are actually fixing something relevant, but in fact it
has zero impact.

Best regards,
Krzysztof


