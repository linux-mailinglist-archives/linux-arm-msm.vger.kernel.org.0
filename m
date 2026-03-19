Return-Path: <linux-arm-msm+bounces-98694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJ2NIZrCu2n1ngIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:32:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3565D2C8B46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:32:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 167E0303C818
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291643B6379;
	Thu, 19 Mar 2026 09:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BUV6n73Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058BD3B6347;
	Thu, 19 Mar 2026 09:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773912599; cv=none; b=N/3UMgdh6KisRkMD/ADgJypVbDjCts2d8XDFrCfVsS/0SZr6OtRzqd9vFu/aEGAi/F9j6SZoN/nxXuW281VPO4WbGw8/nxAyOcKJSZPuVe/cWcGJ/DKfDEte3sszx2jRsWNd1a+qpI309840eH4Ok1kz4GIcElWiZWMF8jg7MI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773912599; c=relaxed/simple;
	bh=q1hnpwKppncTtL7PGsBSeRmrf3SRFAt7hcNLnymxJLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=isxmDrzdSFJIbPeiSjlEWnGnd+Epz/ItEAm6cQLdsDi5PGWl9MSngPeYkXEVXJOAwqaHY6d4tt4qL0ctPrr2cXM/FOcQ4VTnkQzMcN1NANqzE8Mreds699+IdHZq23yLszj8hwC8dNP94mzPi2Y44AH5PbGvCeG7xVjA2QX1Akc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BUV6n73Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5500CC2BCB0;
	Thu, 19 Mar 2026 09:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773912598;
	bh=q1hnpwKppncTtL7PGsBSeRmrf3SRFAt7hcNLnymxJLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BUV6n73QIi65p+I3UpXEvnZaaRhGLZclCrGu64+7Y0l8zy/1tQM1WSqcd27Pova9d
	 UY4inUst1BFtZHVU6JtJTXpL5nuUo72YHdfqT3mrn/BF5pIW0DqhJNRKju2jywHPeP
	 EvIkRZLmGcCXuTNzO/VK3OHUJewNV6NOi+tO9ZyE3M0swm9E7kevjBBxncrfJsudk5
	 eiJJKkV5Fwz1ZuyNtavFwnlJFaFt+HsKcaUOMj35/zNSUZmOwZ4jkJVeyWDIxO7NCO
	 6TjbL05UoLx60vi9JUc4GhN9shG7Nac/Gr/L7J+7vpeqyLnPv48Fx+gldHEb/eXzX2
	 +NR8z80CedSlg==
Date: Thu, 19 Mar 2026 10:29:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add
 Eliza QMP PHY
Message-ID: <20260319-fervent-aspiring-wasp-e4836c@quoll>
References: <20260318-eliza-bindings-qmp-phy-v1-1-96a0d529ad2d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260318-eliza-bindings-qmp-phy-v1-1-96a0d529ad2d@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98694-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3565D2C8B46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 11:54:36AM +0200, Abel Vesa wrote:
> Document the compatible for the USB QMP PHY found on the Qualcomm Eliza
> SoC.
> 
> It is fully compatible with the one found on Qualcomm SM8650, so add it
> with the SM8650 as fallback.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


