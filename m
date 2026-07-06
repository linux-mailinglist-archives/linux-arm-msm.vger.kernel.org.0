Return-Path: <linux-arm-msm+bounces-116645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vL6lGhVTS2qPPQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:02:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1517170D430
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:02:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ljqRKau9;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116645-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116645-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1105231B91ED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 06:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F2B3F6610;
	Mon,  6 Jul 2026 06:37:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0D83F39EC;
	Mon,  6 Jul 2026 06:37:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783319834; cv=none; b=U7T8M9VjuxE8+72dMucv0vOUPDJ4ZgjbMjnEj4ZHJgCryEDF9DudnuxNFs3FgaYmQViiZf94GApO9McyyLsgRl+Q4daAzH5xdc8YhDHqjkctwWjiaEF4HbmRoXpAbY2Q3ZPFWNmG5/DV4/A7c4dWesw63wPi/JFyQfm7fSIrA8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783319834; c=relaxed/simple;
	bh=Cbmd9UKW9dfTZvnIA7DiY3dYQGgOF0WpXubmOAH8XcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U1LCGA8+09q0DzVhvfxmzZvxcoTjDMBk8LhnWhX2UbUu59duPuEF9soKDOTDvDUbh/Go29/lvvXtgpkYgcMyj8n6KIoqe6aUQNR/0Zyr3y8UZf3fIyxXhcxSFPj535VN8pId4abI2EFEUy9iwCGFiV4LhP7G4OYpqchVe2fjEZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ljqRKau9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7465C1F000E9;
	Mon,  6 Jul 2026 06:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783319816;
	bh=DgG06+fPhBUefxG+g15sZ2YExh0h/ruMjb8SnPH6H+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ljqRKau9DCFpA3AklvnxUyEXQF+DlQ4bo0jmiHb9FTBi0BiNyfJlYGIAoZKmmV1Rd
	 78hccCK9z0lFtUb2/08OsSZNR/Pi5+h/5rLi1hpnrxlMtDgVjOjbPjDIdKLjtaahIU
	 GpIZyvi3nllQMc/bgvupFzCbkdpIl9wlgqyHvtWeh4fqfkOquRJ8EGp/Qvwgl4xxzu
	 3O5NWIkBJzsu+bWpTPQjhXAa8IUEwO5O2xHAy4S52J3Ys0V/u29PSPLAcMu2RPUsyE
	 EwyFBcFZXGkNSl6z7c/nlw8dmQ40+1esWLB8jmB4ETd0kbE9QCw+0B30vYu34Ozvdf
	 2NdYKatgV9IWQ==
Date: Mon, 6 Jul 2026 08:36:52 +0200
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
Subject: Re: [PATCH v2 2/8] dt-bindings: display/msm: gpu: Document Adreno 840
Message-ID: <20260706-radiant-shark-of-calibration-ac2d13@quoll>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
 <20260705-kaana-gpu-dt-v2-2-6ac53de56314@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260705-kaana-gpu-dt-v2-2-6ac53de56314@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sean@poorly.run,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116645-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch,poorly.run,lists.infradead.org,lists.linux.dev,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1517170D430

On Sun, Jul 05, 2026 at 01:30:06PM +0530, Akhil P Oommen wrote:
> Adreno 840 GPU found in Kaanapali chipsets belongs to the A8x family.
> It is a new IP which features the new slice architecture with 3 slices,
> raytracing support, and the highest GMEM size seen so far on a Snapdragon
> mobile chipsets. Update the dt bindings documentation to describe this GPU.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


