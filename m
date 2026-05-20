Return-Path: <linux-arm-msm+bounces-108631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJWiN/NbDWrBwQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 09:00:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D408588927
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 09:00:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6847D3033DA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 06:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8004B366060;
	Wed, 20 May 2026 06:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mr5M2KeX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F893655CC;
	Wed, 20 May 2026 06:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779260208; cv=none; b=rKTTKmskUCINfxFq1sYAyauSyJaNMasE2njnnOe1MYz3v0206VPiGjJl5u4Ka9GHStf2q/miUJeu4LbiXNSBCOLinISkYlkGIx6ZsVFN1xpAIy9dLm/oOuEcicnRrQWsyOaaLEZRX6QQJi06D3U51mq7/BimFaO0wVa2E20XQLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779260208; c=relaxed/simple;
	bh=Ze64cwqL5R2/ljmPISDVWQnEFLqY5BnIu7Zn+TlBPT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ID0ljzXh7Rkwtd9rXRmhNP1CIA7gh3AcBZ5EKu+Up3+OMO1BmGvkN2bMEzYF9x64I0sNCOVq6nPmBQFI4uf7ZHzKEop91oa1ZTIlPHRT6cHukpkLY2ANTfSSA9/0fcDxRUIZQxRBidEkdHVZipR+5f/+ErGcpFBlYe1oc0uhgac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mr5M2KeX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 6917E1F00893;
	Wed, 20 May 2026 06:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779260207;
	bh=myHqjK9JV6RGlCTmrEqpEM2dzr181ww6aDV0V5o//wU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mr5M2KeXzvmbhG2dY9eXSwDHckR31Nb0NV3DhNd65V6bi1tG7f3QO6i5aoZcPYTEO
	 km5yv6Ix1R2ZJGrmPtuaEq8FO5vCmS++ahiabeIR26MDt0yLWHlxyBYZq6nguQpPsK
	 zN1WKwmJ470e1rkOPYFgmFLuhbVbH0uMf9vqhLDOXaltjnQ4UdcbrKxLrLKrivh2ml
	 TaIJYuv1qDPcSZNrFm+IgTqZ8nnC3uK3CCC/oMMxAzoRBI4Lk5GtX+yc2fIqeLtzHT
	 Gz7K/mWCK7jNDNCELo3lYdUlDyKpEPEeG3xbfay4AvsaYOBsksenyaycxg0ZXSG7+k
	 1vwSfBiNP8BHA==
Date: Wed, 20 May 2026 08:56:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] dt-bindings: arm-smmu: Add compatible for Qualcomm
 Nord SoC
Message-ID: <20260520-bulky-intelligent-wren-cffca0@quoll>
References: <20260519013950.873105-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260519013950.873105-1-shengchao.guo@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108631-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 2D408588927
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 09:39:50AM +0800, Shawn Guo wrote:
> Document Applications Processor Subsystem (APSS) SMMU on Qualcomm
> Nord SoC.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Hi Will,
> 
> It has a dependency on Krzysztof's clock constraint change [1].
> 
> [1] https://lore.kernel.org/all/20260505071453.34000-2-krzysztof.kozlowski@oss.qualcomm.com/

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


