Return-Path: <linux-arm-msm+bounces-110371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJzdOifOGmo59AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 13:46:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 517CF60C991
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 13:46:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C22B3018290
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 11:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1055F3AC0EC;
	Sat, 30 May 2026 11:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UVc9T7+I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154683955D3;
	Sat, 30 May 2026 11:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780141602; cv=none; b=nQR4puWPSeE3hQXmgYiXB7QbsG937N1z27MzMdcaRtD1gnnf4YEaVfP76YfHI1I//eRXl7AvtcX2YKx71KJ84oiF2ZI9KibVyzdhj9N5Xikm02N+xFCnUOjWKOaW1ZjzJpfgwm+blcS4u9ZankObmua3S3OqjeadvLB5eURlKoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780141602; c=relaxed/simple;
	bh=wHsOlKX63fgfP92ymKm5m+IAIs4eZcPGWPqvtwWUA14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lU566kstJRK0WD7KEj4FUNJc/4n22M5MNlfMGbkTxLGyhqJ6OU0SUJU8E0Yxca0u9RWJPhn9mpQL7MG4eO8wd2e5oFh++lUpuMtndFkt9sDXCro5dex9QLi+oIulbKjwIBHwzVp49UDTqfpm6xHehXdUXwyS+lwzx+veYfMr7zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UVc9T7+I; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21F2E1F00893;
	Sat, 30 May 2026 11:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780141600;
	bh=4w+pGBw8aB7TTsd8Ahao0ApeXWwKjsPmyYUKP/TztV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UVc9T7+I4XrfBA3fB5JQ4uNDa4CqnLFuUeUUZWCIYqZk7LCh1dSf8HrKmiVSn9ALC
	 ExkJXGTCjpjYeZ02T63fDjcMYUlFoPMMcs/PXQxSb75JYQujmyNfANXjaE8HlSxoi1
	 W0T1tpwxzFQ99mSKX9GHHCR6xpIiehhF6cQyCBx1FqkatObrXMMiYHetziXubeMBmU
	 6M057OmAq8cFp5fNruIGVFGIIT6ePOt2JXNbHXZKMkWESYGuKicprRHSgprc06wfX8
	 Yh0lVOCga6lM6VOLNrNFPnAaZzTHv7fistBMyIX1vksHikbioVbG4EaLlkicZuzh+R
	 BcdndSAvTphyA==
Date: Sat, 30 May 2026 13:46:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: ulfh@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: mmc: sdhci-msm: Rename the binding to
 include 'qcom' prefix
Message-ID: <20260530-prudent-whimsical-bull-7ef4ff@quoll>
References: <20260528135342.11678-1-manivannan.sadhasivam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528135342.11678-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110371-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 517CF60C991
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 03:53:42PM +0200, Manivannan Sadhasivam wrote:
> This is the only Qcom binding that doesn't have 'qcom' prefix in the

One of few. Definitely not the only one:

dp-controller.yaml
dpu-common.yaml
dsi-controller-main.yaml
gmu.yaml
gpu.yaml
hdmi.yaml
mdp4.yaml
mdss-common.yaml
ipq806x-dwmac.txta

Plus there are such like leds-qcom-... which also do not match pattern
in MAINTAINERS file.

> bindings name. This doesn't match with the regex in MAINTAINERS file and
> the 'get_maintainer.pl' script fails to list the 'linux-arm-msm' list:
> 
> Ulf Hansson <ulfh@kernel.org> (maintainer:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND...)
> Rob Herring <robh@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
> Krzysztof Kozlowski <krzk+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
> Conor Dooley <conor+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
> Bjorn Andersson <andersson@kernel.org> (in file)
> Konrad Dybcio <konradybcio@kernel.org> (in file)
> linux-mmc@vger.kernel.org (open list:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND...)
> devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
> linux-kernel@vger.kernel.org (open list)
> 
> Hence, rename the binding to include 'qcom' prefix so that the regex
> matches correctly.
> 
> Reported-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Closes: https://lore.kernel.org/all/20260526151003.p4kn2vek3hpv4gzv@hu-mojha-hyd.qualcomm.com

Suggested-by, please. No bug here.

Best regards,
Krzysztof


