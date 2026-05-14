Return-Path: <linux-arm-msm+bounces-107561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLx9DZKgBWp3ZAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:14:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1544D5403F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3BED13014FD7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 10:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4743A383B;
	Thu, 14 May 2026 10:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iacatgof"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5DD390219;
	Thu, 14 May 2026 10:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753647; cv=none; b=CNEby1WEALoOieQ8x8EjZYtgNh8VYTLuCP8FfqycCWn0dCb6Bov3ZJupuDqJLnV6/XaAxKSWj10MjhLzgwcDPLKCS2wjqsSL+JmFuqUCNnUV8seZJzvNAhxhOTheJvI2p0HvXT+ozWIlNC6PpvCy94XhxBN+fvCI5HGKerOx2zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753647; c=relaxed/simple;
	bh=Ai7USvYvyJ9yhKer/xbhmzZOEjs1bRuuZfWyxxvYC4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UkVkN8DX/W4Ml7bz/n1as+gxdBkPWiyvpZPEDhTQcMGkshol6hntM9C47Ep3Oy9I7UXC1Hn7rIxqew5iDKBh1El0u/dHnCxZhQaxHcFv9X7K7Scf6aoOTxjLrViw2H5tuWZTgNOxG6F1367M2f7sdqQ01jgXEjxLAIfXYkJQFH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iacatgof; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33276C2BCB3;
	Thu, 14 May 2026 10:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778753647;
	bh=Ai7USvYvyJ9yhKer/xbhmzZOEjs1bRuuZfWyxxvYC4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IacatgofsSu/xqMZZklpNnXJdSI6nAIFlYlPEa1NbsS4Re6tjRYW9t5HGe67WIYmO
	 TbIpb+0X7geOY+djEwTG5BKm9WwrYEPlxvHO8TVG+EtO0JYelydwZeoijdZ/NhkGCA
	 9Za80pixVdYNyZ2RojmFuSdxPruh+5GvCK6gACMCjSi2bcwLJsMU/cLEFhD0zeLaBw
	 5t03HMvrg5HppYP40Rh2d3s4jzv1BzV9W1xoX7NgAUysugDYj28+d6mZdWpTVycE6E
	 g4oQUCCPSiGS9YOrcJQaetaPfEOjjos+McR5G2lXUQ6PZNVRhKPoYyx17XmWMaeuAK
	 lBhSJBeeTnU/g==
Date: Thu, 14 May 2026 12:14:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Subject: Re: [PATCH v4 3/6] dt-bindings: arm-smmu: Update the description for
 Glymur GPU SMMU
Message-ID: <20260514-loutish-roaring-fulmar-53cbab@quoll>
References: <20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com>
 <20260513-glymur-gpu-dt-v4-3-f83832c3bc9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513-glymur-gpu-dt-v4-3-f83832c3bc9a@oss.qualcomm.com>
X-Rspamd-Queue-Id: 1544D5403F8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107561-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 12:51:20AM +0530, Akhil P Oommen wrote:
> Add the interconnects property to the common SMMU properties and extend
> the sm8750 clock description section to also cover Glymur since it uses
> the same single "hlos" vote clock.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


