Return-Path: <linux-arm-msm+bounces-94009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Nw9FkbunWncSgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 19:30:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC0518B66B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 19:30:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 27E1D305EB63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 18:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0385D3ACEF4;
	Tue, 24 Feb 2026 18:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DS7Cjcow"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F0C3ACEF0;
	Tue, 24 Feb 2026 18:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771957610; cv=none; b=IXCPSBtRKD9EWF48nEF3GxQ8P5rC2C6IBLWf/zxlvZOMVxZ5FjjLFC9yf1R3y4z7VnN4HX6WNQRIs3sU3uPXpi5rksM4w6xdIOd6HOn5Oivqqd8Xja9k17SjOFltpFbwEJ5NzHEsVBfgg/BRyxsmUu492tX2PXWGugqTOODYAsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771957610; c=relaxed/simple;
	bh=OjhnNISGr1jFe6s0B7kPlvPpq6wlL5Gn8zLhoSaCPxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YZigH33fUCVvKgH0arwwoD42tS8p1wN9nkUEb7DM/2HNvWpKpCQgn4xMJeOXzcW5FsT+Aif6eC3EeaU1R3hJ/diau+7U3PQkoOQgi53QP6dcIG+owJAdnOL6GOsRtSvtgdKhK3VzySvnTFTXQJe6A4uV9jEGVSXucY5pji/ZLvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DS7Cjcow; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49091C19425;
	Tue, 24 Feb 2026 18:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771957610;
	bh=OjhnNISGr1jFe6s0B7kPlvPpq6wlL5Gn8zLhoSaCPxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DS7CjcowLzfKvhntGwQlKC/oYivVtOKoPURT+YJ5P322y+faA/fj38Dc7yXXYJ5qe
	 PkgrribQ13EwudXC8Yg/sy07NTegorlxulinFHFAa+z/s2hoM/pnPqG7MX7MQNGBVs
	 3BjXebAsItro5lnUuQBi03Sf97Jwt+5ANhPj7EVhm47AMf9ZyT5V7II3sMNQGRJhTP
	 rlCz8H93V+SxO+J4LshQnf/l7F4edk7Y1+W+ywZ6BxBK1LXTi0iZ1xZh3IDqF59uvs
	 V/g7DNYVEN1zy61n0RJjcmP1QpRq9W49EPAVyXDijOGI14UKWGVrFQW7gLXAQr4mpZ
	 eCPj46r7B0Crg==
Date: Tue, 24 Feb 2026 12:26:49 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: arm: cpus: Deprecate Qualcomm generic
 compatibles
Message-ID: <177195760809.3238880.5827033473830037331.robh@kernel.org>
References: <20260223074422.18468-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223074422.18468-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94009-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7DC0518B66B
X-Rspamd-Action: no action


On Mon, 23 Feb 2026 08:44:23 +0100, Krzysztof Kozlowski wrote:
> Move compatibles for Qualcomm Kryo and Oryon custom CPU cores out of the
> enum into separate one with deprecated: true annotation, because these
> are too generic names.
> 
> These are names of the families and there are significant differences
> within individual processors, e.g. Kryo6xx can based on architectures
> from Cortex-X2, A710, A510 to A78 and probably more.
> 
> Just like other vendor processors are differentiated, also Qualcomm CPUs
> should come with specific compatibles.
> 
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Do not touch Krait and Scorpion because no consensus was reached
>    about whether there is a final model-specific name for them.
> ---
>  .../devicetree/bindings/arm/cpus.yaml         | 290 +++++++++---------
>  1 file changed, 147 insertions(+), 143 deletions(-)
> 

Applied, thanks!


