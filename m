Return-Path: <linux-arm-msm+bounces-107810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cN6GNF//BmpiqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:11:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB4954E26E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4636C3148EBE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803C946AF25;
	Fri, 15 May 2026 10:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D5vWSaL+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57ED1438FEE;
	Fri, 15 May 2026 10:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842545; cv=none; b=RVbCc8SbLeQ52VVY1CdDFpxSl9jtScG0/94hf/dh4d5Luo5K9X8kD7zUK3SfoZp9cByoreqXM81495a+qn3mxMa6Nqhw1OsL5NScbM2OgWaIsSyhMQSvsNrU2e9dseULEwUH+4LPD6YE31k4SHWFqs2U7S9ImUCu0KxMnK8mS80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842545; c=relaxed/simple;
	bh=29IGxQZNBUzGuWA8s7r27B+7Ef244Dgf6KcW2r1Qnmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UDQ8GBh1hZ35VMWWpHblNqzUY7N8pBGY3//1yW2rmujjBdFp0u7xsohWlV06E7VPUJ072fuiUWdiv2vAzYYfQ0C9FY+Esv911r/O0SDPILdWXpWPlIlSK/AhrklKpU5J5lzvKmSG+WJ1E9AgNlWRzeqMxt4KiavuorGj8ztx8YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D5vWSaL+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3E8C2BCB0;
	Fri, 15 May 2026 10:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778842545;
	bh=29IGxQZNBUzGuWA8s7r27B+7Ef244Dgf6KcW2r1Qnmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D5vWSaL+ONv7rEoZVuEX+tVp9m63nHDX8b+hhhtY8DVg4KBlO6XO3YdNHlBml7Vl0
	 ZoUwhUYykTs1yOlVLQaUYOXTs+Wi7hHCtYdAgszObSJIuoffVlmVqnoUa3JafS4ul3
	 AfA4GwqH149hSlfPCHGZcNCjSpYlbEa/10UWv8/Ow/67koxml5lzVnqazCzgmxU5rk
	 D4l/JIeo8sMsMU7SlbZicwmIZX7Yc3n9koxkVY0CcMKHqu3qsI33VGfSEiwe4Ql5rG
	 tAHlu2ubVHKrEcsuosZk6yQ4Qpf1ge2S+V+Np/oTpzPUGu04uI/YIYkPOJZ2NlFMn5
	 JfaHsI40c5Ctg==
Date: Fri, 15 May 2026 12:55:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: PCI: qcom,pcie-ipq9574: Document the
 ipq5210 pcie controller
Message-ID: <20260515-amiable-incredible-starfish-e9041e@quoll>
References: <20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com>
 <20260514-pci-ipq5210-v1-1-a09436200b35@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260514-pci-ipq5210-v1-1-a09436200b35@oss.qualcomm.com>
X-Rspamd-Queue-Id: 2FB4954E26E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107810-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 09:43:01AM +0530, Varadarajan Narayanan wrote:
> Document the ipq5210 PCIe controller using ipq9574 as fallback compatible.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml | 1 +
>  1 file changed, 1 insertion(+)

Please have your patches reviewed internally, including quite useful
tools.

Best regards,
Krzysztof


