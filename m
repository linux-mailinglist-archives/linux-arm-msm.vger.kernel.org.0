Return-Path: <linux-arm-msm+bounces-107737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DUrLxvjBmoGowIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:10:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA7854C192
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C29430053D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 08:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD78E40627A;
	Fri, 15 May 2026 08:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oRN7HuI8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AD43783C7;
	Fri, 15 May 2026 08:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778834501; cv=none; b=kemEAtoPhEP6Nc3vaLPiovdWe0lAZOUt7MOcQIKJ42pUc27FOxNGtMDa9kMAB6IHj8FoSEBboPfCPAwshP66HQzZRldQ00mkv5bwOrm1V2HMdFKGUwhhgthdc7++SqFXFL5OH+ffTLVa1ewv8enaBLt4E38irFU+eP+kGOTOJN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778834501; c=relaxed/simple;
	bh=aY+I/LTAujFm+hDwZi1iHm/T2SvWphqZsDt1Qu4o7K8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SaKPVDwn48Iy8+v7tp6qVXieHdT5kstCGt80fmUnpdNh8nVienq/oWYD02v6DFj0MBoPGDFtSAIXrDH0iHQ8Oa276+Qyh6eQ5ynucYi7/EKWJ4zr/ju8nimtRlhQJycNP+jJhiJoAZA9XgxN5e3+Hp4aobszyUguipw75tRG8yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oRN7HuI8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA76C2BCB0;
	Fri, 15 May 2026 08:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778834501;
	bh=aY+I/LTAujFm+hDwZi1iHm/T2SvWphqZsDt1Qu4o7K8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oRN7HuI8F/a/wkF5ZQMN+bjdRzVs5CGPHU28vmycUxBHRi/o+yl6mzyI7K0EaOrbX
	 xcqkcorF1nR5zCVz2nEy4IEle+hQKtJEtG22BbgZBL+T+HiK8rjGkkpr0fQppTStLD
	 HXLweRFTks+nwQw6i4PpMGjjn5IbfUGRQptc+wYTKY45G7/0usy2ppltNfIZ2566bG
	 GZtBckNeBuHCwwuAq9BwIuYf6sdiEOPtXlxTBH2VjvavoQQP4GY20nVkB0ygmGZYME
	 u4PLo9k2xrvRdiWYOnbc6XEN+gS2scQT9gffMtGvhmuy+qgPpYCe+dyg6/tpj3aEDe
	 kfQUR0qQAL2Lg==
Date: Fri, 15 May 2026 10:41:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sean Paul <sean@poorly.run>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/8] dt-bindings: arm-smmu: Update the description for
 Kaanapali GPU SMMU
Message-ID: <20260515-reindeer-of-original-skill-cb55a1@quoll>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-1-13e1c07c2050@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260512-kaana-gpu-dt-v1-1-13e1c07c2050@oss.qualcomm.com>
X-Rspamd-Queue-Id: 1EA7854C192
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
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-107737-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch,poorly.run,lists.infradead.org,lists.linux.dev,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 03:53:15AM +0530, Akhil P Oommen wrote:
> Extend the sm8750's clock description section to also cover Kaanapali GPU

There is nothing about sm8750 in the diff. Probably you wanted to
document the constraint of clock for Kaapanali Adreno SMMU?

> SMMU since it uses the same single "hlos" vote clock.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Best regards,
Krzysztof


