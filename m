Return-Path: <linux-arm-msm+bounces-109182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GwOKO77D2qCSAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:47:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0E95AFA51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:47:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 948DD3016EC4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 06:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70DB27E045;
	Fri, 22 May 2026 06:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cLHTKI9c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F9C1F419A;
	Fri, 22 May 2026 06:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779432406; cv=none; b=bThL+DPWLUaICsnz8/WAp+/GnOiMdk6g+fUpQHCkvWg+tkTjYNFRPkvYlrMhJnP1ECcHkDxvGuOPrB4nV4pwwC0JP7PfhnX9I3RDjNOyJf59TgoaeYYAQUS0DPlU1r+5avjT/7tFh74mgEh+WPEb6As0j+YakPCfwlxi210KxNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779432406; c=relaxed/simple;
	bh=ibuSP5C1ZI92JDAiLeOcK5FOkcS9E9F4c+URiJApFCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M103PzXAnRvL6G1+ZT6wvtcm5aLslfrsy+/Dk/IUGfE/3iaWvATfp3gRt8QV5pYQr1OdntEeoqHZXdprVaceGQcExKr8rkm23CEU3MvlNB8GnXS2La3xMt2FHfJvhx2FkJonORVOacx+AkIvyb/E0F/ZfVfSHEBwIsv8/cZMT78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cLHTKI9c; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD18B1F000E9;
	Fri, 22 May 2026 06:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779432405;
	bh=Lmc4GHivIsEB0A3/jAF6LGKkujzqqym8ZZvS1oCGxs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cLHTKI9c3wsL8WarmEDtNBHT352Xv0juZjhw4Dpr3nDirPdj94nuILqg5/tHWMsqF
	 2BxRXG36V01kZhI4WmAiUAzWRa7i+ERLO/y5pqrtNMb/1xI2z5DSqAIfyFawTx9iUo
	 vfc6+Blg0oejnEt++1tSXf4GByGeQPjDBeeG31XhF4V0BNa8EAImeYVsYzdEuQzIDW
	 ahaubWQr+RcXmD+9heeGOYDSdC1l3t44rciCgE7ZgBzMxnjkUxbXWsoRpbzMAN3U6K
	 p0lNPp+kWcXcq0iCWCeaaZdkziO9xc/xHgtqRY4BHlMIieO1U8j2HXP+vifo+YoE7D
	 DB06XhgqhqICQ==
Date: Fri, 22 May 2026 08:46:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: phy: sc8280xp-qmp-pcie: Document Eliza
 PCIe phy
Message-ID: <20260522-crimson-salamander-of-maturity-ef05e5@quoll>
References: <20260521-eliza-v1-0-97cdbe88389d@oss.qualcomm.com>
 <20260521-eliza-v1-1-97cdbe88389d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521-eliza-v1-1-97cdbe88389d@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109182-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0A0E95AFA51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 07:35:29PM +0530, Krishna Chaitanya Chundru wrote:
> Add compatibles for the Eliza PCIe QMP PHY's, which supports Gen3x1 and
> Gen3x2 configurations.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


