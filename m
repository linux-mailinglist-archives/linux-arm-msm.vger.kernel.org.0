Return-Path: <linux-arm-msm+bounces-112335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CbnnHkIaKWqsQgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:03:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2FA666E41
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:03:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=d8ciimsW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112335-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112335-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 038D73073D8F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 07:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03B9639903E;
	Wed, 10 Jun 2026 07:59:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB923988F8;
	Wed, 10 Jun 2026 07:59:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781078353; cv=none; b=ibS0tV8yW37Qtm3BThXvC2duaoNzR96omh+AK/KmRXU2Xu1K4v9A9itGB/4vCoi0xRwCwzK4XM+Gye/tkNb/TDTanUYd889oFGjJlyZv7gLDSx+KVFuhLJLN3kPcAPK8oQ9xAszxeL2pD+H6Zbl2y9rsHjw+XYJAzvu0cL+0QpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781078353; c=relaxed/simple;
	bh=EBBdv6Bzg5Y9btu0dO+LKzrTm4K3s9RoMX2AglowUZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IG8X2qroI+trYiom4iWKr+4xq6wLP48j/GKFunOYPtho7BE/Wh5+5ZwRZ6wTI5CCHvlKTGQOksXkp62pbiUOXSmCwHlO+tvqOTe/5m92srZCUmhlB9DV4Q/lLQRG5s5dU4MMh3o8WDoW+MM0Nj7xGGi1iBuE6/sof79nq+WDGbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d8ciimsW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F1D31F00898;
	Wed, 10 Jun 2026 07:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781078352;
	bh=EBBdv6Bzg5Y9btu0dO+LKzrTm4K3s9RoMX2AglowUZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d8ciimsWBia9bhTpfZ1sbLaLuy3QZrcBTm9h/LMovnPMS6EdiNqvY0hTr97SAJplP
	 neGT8UPuwATuw/0g+n0LvwygPluknhiRRbpFf6wMp20frP3tJsg1hy2Ko1rPsIcyek
	 kquiD1wSP/711ibbJhGPEivM+p1vZ4FT781kQnWH0rybcMiR1BISeR9f2JjwQ3k6R8
	 +gG7HaE4pujYwd+lEwoaMwpOfcPrsiu4l26TIwprOSBRvHnCpbAzj8PP6MthCor3uH
	 /87+93Cu2CZ9F/F6z6uUT/rKkniz5FmADDw2bYDL4JIe8AJqEzk4vYfIEEMJF7aYSy
	 EpTEcAj2cudUA==
Date: Wed, 10 Jun 2026 09:59:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document
 the ipq5210 QMP PCIe PHY
Message-ID: <20260610-camouflaged-crayfish-of-energy-3da48e@quoll>
References: <20260609-pcie-phy-v2-0-83bc80e79fa6@oss.qualcomm.com>
 <20260609-pcie-phy-v2-1-83bc80e79fa6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609-pcie-phy-v2-1-83bc80e79fa6@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112335-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:varadarajan.narayanan@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,quoll:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD2FA666E41

On Tue, Jun 09, 2026 at 02:52:12PM +0530, Varadarajan Narayanan wrote:
> Document the PCIe phys on the ipq5210 platform. The 2 lane phy uses the
> ipq9574 as fallback. The single lane phy is documented separately.

What does it mean "separately"? Diffent commit? Explain here the
hardware, compatibility or lack of thereof, not the diff contents.

Best regards,
Krzysztof


