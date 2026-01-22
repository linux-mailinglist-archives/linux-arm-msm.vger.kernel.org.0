Return-Path: <linux-arm-msm+bounces-90250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ADcKZFlcmmrjwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 18:59:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5701D6BD7F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 18:59:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6CD4F30AE04B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 17:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67BD0392B64;
	Thu, 22 Jan 2026 17:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V0Y0Z1yU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF98385ED3;
	Thu, 22 Jan 2026 17:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769102552; cv=none; b=eOYJH2OFFHtFNa4zvzTJCm8qxGBvLGMKY4V49lXXvhiVqM976Rs4tPswwqXKHWGb1K1gXZDc53bU0L9CwjnjjzjC7MV5gpxbRtRVCTiqg81AVSODTaY/3GZZvyHN00NelONI+MCatYLZLhZFyCVLf0lsS1miOhdFYXfoS0lSmRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769102552; c=relaxed/simple;
	bh=ZXgc4ls2l+UTr7xuiwP7s5TAw1RCHTN+F57zA1QyjWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZNPAfts277nh+gCbJ4o4I8S92IgGQfRuCeHpRIwBuqjBIDO1sjwzSZCH3b30FG/9bCr87vkIjAZmDhYDJ3Np7MxlogJr4XChXRO9W94ErFSvtfqdkpiNMY4AINutu/2jaxaF+U9ac5kgeRQk8jZ/wolIlbFJIZWU7K+Wo6nGjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V0Y0Z1yU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241F2C116C6;
	Thu, 22 Jan 2026 17:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769102551;
	bh=ZXgc4ls2l+UTr7xuiwP7s5TAw1RCHTN+F57zA1QyjWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V0Y0Z1yUcSg8epRL0AOeG4Ff/a47F4k7sthg/dnEGyg460wg8uPl9D6gkm3oaSwwT
	 38yLk/kKfgUccvpTAiVdNIc/B5dwj5xrFKX9Xi21OPhC2hm9dU5wlpuJWV0cdFQRL4
	 PwZs2fxFXA9IfvbGgbphPYUhN8q6tn4ghdUvg/gJ90JwCK+CurtNLbmqg0IcIgKduA
	 FdE5tX1VqfeuBoo77irWKDTkLIvUh9I5out/kxRfcfb+cC5jzU55pwi9WSI/YGHrIo
	 NdA8gdCoq+Aq330TrpVH3YBWzSGvRrAEhGnH0mMvxFdR8g7kmS9k8Bx5swdFH6vydP
	 fieifz1AUTfYg==
Date: Thu, 22 Jan 2026 11:22:30 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: vikash.garodia@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, loic.poulain@oss.qualcomm.com,
	andersson@kernel.org, lumag@kernel.org,
	robin.clark@oss.qualcomm.com, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	konradybcio@kernel.org, akhilpo@oss.qualcomm.com,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: display: msm: qcm2290-mdss: Fix
 iommus property
Message-ID: <176910254929.2770285.16428801494760549498.robh@kernel.org>
References: <20260122121042.579270-1-sumit.garg@kernel.org>
 <20260122121042.579270-2-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122121042.579270-2-sumit.garg@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90250-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5701D6BD7F
X-Rspamd-Action: no action


On Thu, 22 Jan 2026 17:40:40 +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Fix IOMMU DT propety for display via dropping SMMU stream IDs which
> relates to secure context bank. Assigning Linux kernel (HLOS) VMID
> to secure context bank stream IDs is incorrect. The maximum value
> for iommus property is updated accordingly.
> 
> These DT bindings changes should be backwards compatible.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml  | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


