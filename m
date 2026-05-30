Return-Path: <linux-arm-msm+bounces-110348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDkLNba2GmpS7wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 12:06:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFE160C046
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 12:06:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 99A2C303811D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 10:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0631339B48F;
	Sat, 30 May 2026 10:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nN3JdtTS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E953976B8;
	Sat, 30 May 2026 10:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780135601; cv=none; b=sn2ydy/MCubxsdTCR8jLb1v+ZvJuRtLMIDC6dv40xMP4BNLp67Qyi3TUzBcEvW0ZmAyrtvjYS3qI5m4oH/YBykC7YxH/+7trQfHyAIaO3gQtkKrelsX+z/7tCtgY/yUiTAG68ZjJgpi0ZRIpSoLiJbOTfMw3skifW1FYNXPJxZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780135601; c=relaxed/simple;
	bh=x7O3sIx0yZKm06mnDzuY18z8FK0uHxez2xVHO3zxjlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gPc/ieP/hmzu7sshN6QfuIWO+k93broZEfOBwrmAzcsUBofDLUMMI4abvI69Sr9sFM2Ma+lYoTmwmM5ttc+29zauUbNWRIFkaBg2/L4V8UmMZmRHPm6uFkgsVuWj/m+zI7kC4WErwBtySn4wb9Zdi44CJarqLyy+A1cbd8iYEYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nN3JdtTS; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 645031F00893;
	Sat, 30 May 2026 10:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780135601;
	bh=QZ0RJ/Wj036Ergbz2w4ILZdo4NvA2nmIivVqplv6Blw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nN3JdtTS+4CNppDHiM6KHDJGi14KNJ5ikoIhvjGmGw8ONb/fF75aG5auVuKnBCQ1r
	 cx59/cDuGC7t3JBeg8EPb4+WgY0VL9eRVe9DDzt64iHQLLy3f0bV8x89x2BUI4Y8wA
	 x6cW4Nf3x9MtHx1XvoGFrwLS1uzrULviyYwuKpsYbwlCQ6WmyCbxn6F5yNqEYVdXr8
	 n3CC7C8CIS0+dVbH1V3r26lx1yj564Y2ZyOtUYuB0wbziXdHT7Menj5taZw+CiUWhY
	 I8mARjTa6zhAmjuk9wE7SfIRZWPjKu+kyOTX1hV2cuPr0rRk2Fe80DGPVvZ7+5b4VV
	 q43hjN+yfEduw==
Date: Sat, 30 May 2026 12:06:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Matthew Leung <matthew.leung@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: PCI: qcom: Document the Hawi PCIe
 Controller
Message-ID: <20260530-glistening-loyal-nightingale-f5f117@quoll>
References: <20260529-hawi-pcie-v2-0-de87c6cc230c@oss.qualcomm.com>
 <20260529-hawi-pcie-v2-1-de87c6cc230c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260529-hawi-pcie-v2-1-de87c6cc230c@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110348-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
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
X-Rspamd-Queue-Id: 4DFE160C046
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 01:10:08AM +0000, Matthew Leung wrote:
> Add a dedicated schema for the PCIe controllers found on the Hawi
> platform.
> 
> Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/pci/qcom,hawi-pcie.yaml    | 204 +++++++++++++++++++++

As replied to cover letter, cannot be tested by tooling, so dropping
from Patchwork.

Best regards,
Krzysztof


