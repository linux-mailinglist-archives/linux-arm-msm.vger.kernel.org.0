Return-Path: <linux-arm-msm+bounces-110344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJqGA6+eGmrE6AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 10:24:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9F560BAE4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 10:24:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D91033051FC3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 08:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D8CA39021E;
	Sat, 30 May 2026 08:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lr3XSW/R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38ECC384CCE;
	Sat, 30 May 2026 08:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780129452; cv=none; b=nyNWvkzHdjf//OTb4TZIzxw+y+v2NcLpxWBZP+pbZ+h7nsJX+m06udAn71MDbAkrhBLgRB+mPJIGtS3Nm1dqNkARjRZzmE8+Lr3ywtSf/YwtxvetUFlXLWqK1B5dIrzpYZMCCbWpInLAba75Ng5KPRJqWGtivQmBrSAsTkMm70g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780129452; c=relaxed/simple;
	bh=0kQgF0VU6WNLml0oxeOF7FDH7Un9q9mJ28Xv5n/URQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CaX7575fL5IqfIC/i6u9tbctSyPcN8j1aL2EnZzTEyi7RiCu7I5FEk9uWsv1Qpp+PPyXiXSQ2RrOrcZM1M/OjHf/3E57BeOT5nPXv4KRKiwY9CCdYfrLEdzBwWhGZCn80011PjACCNQ7oHlZ8WrZGY9Fr+3PjhZDBt80e41JNlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lr3XSW/R; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BFFD1F00893;
	Sat, 30 May 2026 08:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780129450;
	bh=avfTWFeGMGmg1ha5Cp8GXYUEmbzZJ9JNXqzfpHVT4PA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lr3XSW/RJq7tQURrbYa01m4nuNrteDP4JE4TJ96z+va0ETKn9PeM4HhkKgNbDlC7Q
	 8su+Dm8RrN2D1yAlQx+NlmlJq4NiC6TYbs9Y9Fx6rGwcg+S8J0Qwl9GT3otUWRIsG4
	 kr8pkXZjWctIxvcChJCnTh7heleAGs3Bmkb6L+e5UFe4QjAHqU6+JKMS+rt2DYLO+t
	 c4tJZ3DOrz3Fs61Q3GJUDjfXWIaRPF44pdb18/HZFsikZdMFNJ78Q8OTd1IidVFuSw
	 oIZoED+LkcVF1Y+Y4OpsG15GvoDw+Mzh4WbBev1gCc2IWALo/nP5HIolkDKa7fOzDX
	 jmVUkAc83Bz2Q==
Date: Sat, 30 May 2026 10:24:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/18] dt-bindings: firmware: qcom,scm: Add minidump
 SRAM property
Message-ID: <20260530-lumpy-zircon-gibbon-dc83bc@quoll>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260522195009.2961022-2-mukesh.ojha@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-110344-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gurudas.dev,chromium.org,vger.kernel.org];
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
X-Rspamd-Queue-Id: 7D9F560BAE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 23, 2026 at 01:19:52AM +0530, Mukesh Ojha wrote:
> On most Qualcomm SoCs where minidump is supported, a word in always-on
> SRAM is shared between the kernel and boot firmware. Before DDR is
> initialised on the warm reset following a crash, firmware reads this
> word to decide if minidump is enabled and collect a minidump and where
>  to deliver it (USB upload to a host, or save to local storage).
> 
> Add a 'sram' property to the SCM binding to describe a region in
> always-on SRAM where the minidump download destination value could be
> written. Boot firmware reads it before DDR is initialised on a warm
> reset to decide where to store the minidump either to host PC or to
> on device storage.

You described how firmware is using it, but we do not run the firmware
here. From this entire description we don't need it in DTS, because this
is not a DTS for firmware.

Best regards,
Krzysztof


