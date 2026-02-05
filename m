Return-Path: <linux-arm-msm+bounces-91914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCuLKyaEhGl/3AMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 12:51:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAC5F20E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 12:51:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 12BEC300D148
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 11:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80883A7F69;
	Thu,  5 Feb 2026 11:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hd8LqQn2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DAA6F2F2;
	Thu,  5 Feb 2026 11:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770292259; cv=none; b=QAXoD8cVUnm4AOg4NSaA4BewDV2u0HQP5vNPgNwzAO9ByG0bCQfGYzIV35LuV4F0XRZi7Gc23DMb3jqS28vr7cqTC3WivIs87ViNdqlDePcu0QiqCO2oAsRH1ZT3yVQ0DCDwyPZ6ICn+RtdTpr1oYFLqGfGiLtPVAMg3j0DvV7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770292259; c=relaxed/simple;
	bh=s0TY+ETNO5SgCu7+hJkJzb6eBOIIUu8aGp++nONFUpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JyH/c+1VO9Kq/VbjddszAP6pbVhRJY8CQL18/hgUF9vBMYxcZDGF0DFoTm4RX/o40UqLwDXlQy7+oJG7pwfiKAtIk7AXryq4sThHHarKYgSfzZgcPNoy0GvCDaDJz9MsDHnp8Os4R5LQ/EKf3IgBfY/vGVbA5wJn8AggRUh89uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hd8LqQn2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB5F1C4CEF7;
	Thu,  5 Feb 2026 11:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770292259;
	bh=s0TY+ETNO5SgCu7+hJkJzb6eBOIIUu8aGp++nONFUpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hd8LqQn2DgL5+rEFXZ/nAwZeramaXpQ7VpMEZf4/G/rDzqCO74Cs6Ntghgi4mwQyJ
	 p/J4orXdmFCw0NCmKrf6TOzk7NN5WWj0I4g7K/0Uh7bVEmTOf9F+BOtvdB0JFtWvhX
	 wjKLWxxi1dVLb3ax+kxvJuw5JQFxflkD0ViO+cTsyJMtkGbsj6bDdUHLy+cS9Gf6/v
	 dS4K18eQjkaHA5TRahrRCgf564eNgOyjY3S7V6a8U18G3i2Ky4RJC3eYfydkzgmrl5
	 MrMxdTLcAVWWusHiqjeyvasAE06eyaMqTKOKrOSt3QH3I5MQk46hhhplpKgNwQTJxr
	 U1GcZGpG2lZVA==
Date: Thu, 5 Feb 2026 12:50:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-binding: document QCOM platforms for CTCU
 device
Message-ID: <20260205-hungry-kudu-of-maturity-aa0dbe@quoll>
References: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
 <20260204-enable-ctcu-and-etr-v3-1-0bb95c590ae1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260204-enable-ctcu-and-etr-v3-1-0bb95c590ae1@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91914-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1DAC5F20E3
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 10:22:01AM +0800, Jie Gan wrote:
> Document the platforms that fallback to using the qcom,sa8775p-ctcu
> compatible for probing.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


