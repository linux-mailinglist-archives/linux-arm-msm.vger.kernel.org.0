Return-Path: <linux-arm-msm+bounces-110464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAAZJxArHGpwKwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 14:35:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 257A2616189
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 14:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B545300F137
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 12:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ADCD37C93F;
	Sun, 31 May 2026 12:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z99Ltmu9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CC8335BA;
	Sun, 31 May 2026 12:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780230874; cv=none; b=iXQQ2LgEjq4zllRnT4hXfIHIUboyENp0WNzRNQGkBWw40gb0vaMC1FZ0M8RAa+hiEGCZmE9fLsEM+cbXumZSfIkgb627C7wp/gGyDDEisorD28+Ph2E07Phbw7cwvXR59ME1CHIOtlgLMclRdVEYGLU3ZOjJ6JGkNzomd79qvMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780230874; c=relaxed/simple;
	bh=2pNTnlEMhlp2hp4N7NnJ2LAy/mqpUWhT4T3BUsI4zGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmNOtbjw+aO3GC1xKdzsgw00/846nhVsteRplhHSsEZzSTEqUiaEc94pNelFqjxw4awDxEaw2swI4/R/E5YmpbI2S7n4E+CEElpkHYUVKcPVIjPvz3Ntg3nWMhbPTpzvBx1e6QvypnPFhsZ/i0UOCIsJvyRkVh8pbF88sfkikao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z99Ltmu9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CCED1F00893;
	Sun, 31 May 2026 12:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780230873;
	bh=RGZWJAedMzfJtDAKfTguqV9TH36qakMMJCWvDjRe+qE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z99Ltmu9iUYm16+7GQVt/7D48T1hX9o6EPp5a/KJmh5vu2lURMEC8tYPGMmCRQ/AM
	 bmG0s68MgdI7RVlQ9ZtnpgGHbNqyLmX0iqOESt4+7Aake+l3sH1O5n9GUE1VJbuYB/
	 WTw8CJhOnPDVVdxczB/BAYRbGMz+G8AFSnNxKrlHIaOYavxJrOXPUFMgRXpZOLyJQp
	 VwGKKPDvsXEGylAJXKN7coEIIulFm9OH4KREGjB0OWey0pns6nJg9tqnNo+j8VD9bm
	 w+7QHx66c0R6zelvm2l0DAPnd1OhWvBhznhEAUnlbMTvV+PZjaj1Cal96n+BfRSTBS
	 ezdGYwloldy8w==
Date: Sun, 31 May 2026 14:34:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: palash.kambar@oss.qualcomm.com
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org, alim.akhtar@samsung.com, 
	bvanassche@acm.org, andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	abel.vesa@oss.qualcomm.com, luca.weiss@fairphone.com, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH v3 2/3] scsi: ufs: qcom: dt-bindings: Document the Hawi
 UFS controller
Message-ID: <20260531-polar-cougar-of-grandeur-cdba7d@quoll>
References: <20260526090956.2340262-1-palash.kambar@oss.qualcomm.com>
 <20260526090956.2340262-3-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260526090956.2340262-3-palash.kambar@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-110464-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 257A2616189
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 02:39:55PM +0530, palash.kambar@oss.qualcomm.com wrote:
> From: Palash Kambar <palash.kambar@oss.qualcomm.com>
> 
> Document the UFS Controller on the Hawi Platform.
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


