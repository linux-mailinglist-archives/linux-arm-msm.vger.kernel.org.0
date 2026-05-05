Return-Path: <linux-arm-msm+bounces-105939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGmRAaHN+WlxEQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 12:59:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 614054CC060
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 12:59:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45A0C303102E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 10:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29FB37FF64;
	Tue,  5 May 2026 10:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gdEu0Okv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0E937F8B1;
	Tue,  5 May 2026 10:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777978119; cv=none; b=RSk2RgYDdzAWFj+VEofux8eEzpH7qE27EbMwsdegzam801gDKE1VUgdPeafuR/Y7jf7VqU1QIG6D+95Ln6cGdJAvDwQUKn3zKU5sPHXJko/K3bjrClCUjF+mLcwXPcGa4hfyZXOyI6goEgp70H8DvkRHBO4djGtoaQc58xuNBcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777978119; c=relaxed/simple;
	bh=k8wxVOeIqz80WLZwC1r+QJNmKJWrY7Q9ApKvYiR8V58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QoZLmZYqoMczHZYHYoaZjPmmAeWt1IUSz4oi5OAd/cAqif7xzVHl3xLscWVvzAMdFEXjN/rhdXW8BVdadqhDRYXoXqL900dfTXECsyrYLMPkrLBsstJSwKYOd1W4BrIK3hlEFmNSKs67cbKxKy35Dbtrj54hGZ/9x2DfPMQV8Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gdEu0Okv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA45EC2BCB4;
	Tue,  5 May 2026 10:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777978119;
	bh=k8wxVOeIqz80WLZwC1r+QJNmKJWrY7Q9ApKvYiR8V58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gdEu0Okv8KAq+vMmxhT2whlVNE4DPIR43AErGtOblFB92fokuogyc4EBWQ9m6Dwmo
	 DExwd+9VdJIv59EG7Kvk9P0Qq+lXD+iCjbjRsGbQxYRtUtILtXASG/RJ+LWKj8JlML
	 +8LNUPFJLdg+ySo1PaTcd7kRDWpVzeszhv/6RHf7p9bRY10joZeAi1Yo3lbTTU3xAc
	 iaNbvNWtMDha9DivrGAGcUsXQRV+i7HUlhfibqRN3COdrtKpEWia/fw7bAKWF+jnt/
	 9eVszCPocAa4OuPvoy0jJvelHXG3MdgmjEPKHR3wJTqgGvQIiUANnlMB6WWovB0Ft3
	 xHxVDTHscIrbw==
Date: Tue, 5 May 2026 12:48:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>, Johan Hovold <johan+linaro@kernel.org>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy
 for Shikra
Message-ID: <20260505-gifted-bulldog-of-opportunity-34dfc1@quoll>
References: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
 <20260504170659.282532-2-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504170659.282532-2-krishna.kurapati@oss.qualcomm.com>
X-Rspamd-Queue-Id: 614054CC060
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-105939-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]

On Mon, May 04, 2026 at 10:36:56PM +0530, Krishna Kurapati wrote:
> Update dt-bindings to add Shikra to QUSB2 Phy list. Shikra SoC
> has two High Speed QUSB2 Phys.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


