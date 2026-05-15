Return-Path: <linux-arm-msm+bounces-107790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCpFKj0AB2qVqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:15:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A9D54E378
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:15:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D757C313C331
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8F6466B58;
	Fri, 15 May 2026 10:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a3lFiZQL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653604657FD;
	Fri, 15 May 2026 10:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778841944; cv=none; b=r4EifZOC+MiCmXwLj9LDLAz1yn0+TStA3xSpr9/yeJz902YtB/lHwkF2pqwtB3EdcHGcPP+UUQpRgRxQGIpI83RS25VGtiz5AOy66a90O/pmwpBvKEXtp7v+h3vnL1MnVxPcxFDhaM2SvGZ4Q1rdpWhgg2RHvNpADksIu6bBBgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778841944; c=relaxed/simple;
	bh=aFquNM6aEohbhTDbb4fuTNng9STE3xERl1DrIga1r1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AnZeJwfKOmeCSc7ii7g9sEV9BGBS4keOZIeOTbRueT0EmKanHOhY8I3VM0GR8AV1WTILkcwmP/UPxe542GkO+ZY9OVK+9SBMz3wbp0RrZ1l1esX78/fn7gGYGdP4Xlx8t3OuFtH82Il5cnCX0TBr9uKz1qDoi+QfS7TJjrSOUnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a3lFiZQL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 905CDC2BCB0;
	Fri, 15 May 2026 10:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778841944;
	bh=aFquNM6aEohbhTDbb4fuTNng9STE3xERl1DrIga1r1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a3lFiZQLScfSinIM92f7c/vg/GnJQOjtrGB4/SDgFIYZrvBwOONX6ukCUdV+9hScj
	 6NyCX5JmIZe0o0QiCPYIl5uMuRoKGy01+w54DhympqAnpD5zcDDP1TiVLYKSsBSJH6
	 3ZL4nWcXANvhvIYG+SBQuxPQW3JToKHdRzi9uBqDw1/YSG8zap+Yb0gN3neArjGMlt
	 rBcdava9VXEv/eFrsjwUmGoDVhE2cz1CHazsoF4LtQtxBItum1ZUcEWabjx1f3mzrT
	 pi+X6lRYyqf70nao3+2rI01xu5rccELFDO/uoxGIa55lZDafa5DSnAnIbw2tlIO9UF
	 ItTPuVQE550xw==
Date: Fri, 15 May 2026 12:45:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document
 the ipq5210 QMP PCIe PHY
Message-ID: <20260515-enlightened-flat-hippo-bc84de@quoll>
References: <20260514-pci-phy-v1-0-482429192746@oss.qualcomm.com>
 <20260514-pci-phy-v1-1-482429192746@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260514-pci-phy-v1-1-482429192746@oss.qualcomm.com>
X-Rspamd-Queue-Id: 28A9D54E378
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107790-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 09:28:28AM +0530, Varadarajan Narayanan wrote:
> Document the PCIe phy on the ipq5210 platform using the ipq9574 bindings
> as a fallback, since the PCIe phy on the ipq5210 is similar to ipq9574.

I don't understand that. You claim to use fallback only because
they are "similar", which is clearly incomplete reason. Many things are
similar. And your driver explicitly does not use fallback, which MUST be
explained WHY.

Best regards,
Krzysztof


