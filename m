Return-Path: <linux-arm-msm+bounces-109761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COLILoVqFWrgUwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 11:40:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 116765D37F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 11:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B85233011C57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F05163D7D7D;
	Tue, 26 May 2026 09:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="egD0gI8m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FED3CD8AC;
	Tue, 26 May 2026 09:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779788122; cv=none; b=TJup5NpkNxzjKRmwlCJPrd39PzT5mN8xsq+GTJn0nAADzYqrVJu8JN37Qx0bYIggdfRhUnzNuaWQVwcstGsa6hwyS31BQZiOXg4m9uKDm8HRq4KjxQMOaAktkveMddjCTMjzpzk8diWh5bwr3itnYOTfZrwC/OSHo2sY48UwT64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779788122; c=relaxed/simple;
	bh=MP+Zanjg8IN978xLzG5jbfG2CDrIY80s1DxvJ3cz3+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IJPZ5QIbslJVFpActQ+NzSZwxNED1kdsP7CkYv9IKvPXE71arCPQYjL5iqyFkrg7GrayDaSTwlOEMAPjSX0W7nieiuwHpwyBO1gpUB6pnNBQXPtJgE9L4RkfOQwq/eW9PWl83kzPToUsPSrZwgGXjal/BKPLbg4w3+sVMrIIWdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=egD0gI8m; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 888DF1F000E9;
	Tue, 26 May 2026 09:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779788121;
	bh=VjdWwVx11B2owiNtlnnBG9aofooAg//Wrod2Av6nBG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=egD0gI8mZv2jT9ujrJ9anIMvv+1CV1hP6ANO/zRmq6fQ2wKAI9X0QMGV5P6egYKg9
	 1W8b7nzX6SDVAf/5iqO1i17Jfo4BB0CpzbSmXwsnIsi5p58610OYLKm5jI4CFUQbF3
	 +55rvCNp4969GbA7dLZpnoTW0ID77SlOpgqlOYKtnQxE0rUh3FeisVAxMJUc1u2ux1
	 7rZp0+RJdBzrsnjqzidM4GNrUnLVLIYztZ9Cz8GL3BPPr8RHNIjxJ0EIk+c1Jg64Uo
	 dWgX7ns6kcgWk9KJxXSQQl0iD6scdU5SxrH5MDWt8m2f9vMbI114PBNqHUrIDHV59d
	 BDXURAugAf/Yw==
Date: Tue, 26 May 2026 11:35:18 +0200
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
Subject: Re: [PATCH v5 2/5] dt-bindings: display/msm: gpu: Document Adreno
 X2-185
Message-ID: <20260526-cheerful-classic-grouse-bc3d60@quoll>
References: <20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com>
 <20260522-glymur-gpu-dt-v5-2-562c406b210c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260522-glymur-gpu-dt-v5-2-562c406b210c@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109761-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email]
X-Rspamd-Queue-Id: 116765D37F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 03:41:58PM +0530, Akhil P Oommen wrote:
> Adreno X2-185 GPU found in Glymur chipsets belongs to the A8x family.
> It features a new slice architecture with 4 slices, significantly higher
> bandwidth throughput compared to mobile counterparts, raytracing support,
> and the highest GPU Fmax seen so far on an Adreno GPU (1850 Mhz), among
> other improvements. Update the dt bindings documentation to describe this
> GPU.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


