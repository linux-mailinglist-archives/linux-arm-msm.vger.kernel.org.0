Return-Path: <linux-arm-msm+bounces-92219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDUUDIWViWlj/AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 09:06:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F46D10CBF4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 09:06:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6403A3004F35
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 08:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E020133C524;
	Mon,  9 Feb 2026 08:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wj6Uv8B/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9F733C1B9;
	Mon,  9 Feb 2026 08:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770624386; cv=none; b=YjZKYmgsVPLNS+617Izi6AB/Uj0PacK0hoLu9jvof2SlTtzQfxYEfuuclMsH5HQih98HJXNoi+HwJ6L3G6Wero3NsmGxSxI6WoGCdTYA+saZ6i14g3Xbz4URFnzJ5agoox3Ttxu2jHTyZTggmGuCEvyiggsEelLJK6B0qtZ6pJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770624386; c=relaxed/simple;
	bh=zEzOJjpOXU99Hg+Ob4CvIWFFPfptLCL1jvRZD9c9JfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DhlFvNVPQm7bcTJQb1RGxcRxIU1H651rDRoUC/KJ5Ov8138FDFUtq24oGkn7Rd5fhVf7K5IXCix5DvXuStI1FQShlzCc3fxskPBa3dJuZvIltMGbYics5SI+4elBtzJlLlP2aPxzFwJkW9EAImQ4Cl6AIl56J/23YT6nSRWr2n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wj6Uv8B/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED53DC19422;
	Mon,  9 Feb 2026 08:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770624386;
	bh=zEzOJjpOXU99Hg+Ob4CvIWFFPfptLCL1jvRZD9c9JfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wj6Uv8B/pnBKCk2iKXVD6C1McjKDob7VJ6nqQyBA9h4c+ibUvxyRrRm6hL8g/mjPR
	 9H4rFvxdCFtH2hL74+PHYWCc/yDhB3zeZBtI6eEEtxyoV2R0XpJsqF8SEBj1i7W05M
	 8L0gGdaeTu61wNccXP98d/ir5c6PX0gBtSG/xxiWTz8K+mQBdxNqw1zX3HGJz0mZUz
	 jICctpJ55qe9FRhJqAzadufmR6LKhXpJD1nCJBc2AxFDf2kYp4xmURwACmN9EEeb5Q
	 zXzuIek0jWOVq9ZJ5ezCbTl0aI6pX3uxCVxI4SutTZM5d2Yf8XlSdwHEJlcWJf7nMC
	 hbBbC+yDZOO4g==
Date: Mon, 9 Feb 2026 09:06:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 vdda-refgen supply for Glymur
Message-ID: <20260209-magic-conscious-seahorse-b81c8b@quoll>
References: <20260208-refgen-v1-0-87ca84fd78b3@oss.qualcomm.com>
 <20260208-refgen-v1-1-87ca84fd78b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260208-refgen-v1-1-87ca84fd78b3@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92219-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0F46D10CBF4
X-Rspamd-Action: no action

On Sun, Feb 08, 2026 at 08:49:39PM -0800, Qiang Yu wrote:
> The PCIe QMP PHYs on Glymur require stable reference voltage provided by
> refgen. The refgen itself requires two separate power supplies:
> vdda-refgen0p9 and vdda-refgen1p2.
> 
> Since there is no dedicated driver for REFGEN, add vdda-refgen0p9-supply

How does the driver matter for the bindings? If I add dedicated driver
for refgen, then I change the bindings?

There is qcom,sc8280xp-refgen-regulator so why there cannot be
qcom,x1e-refgen-regulator?


> and vdda-refgen1p2-supply properties to the PCIe PHY dt-bindings. Use
> conditional schema to restrict these properties to only Glymur PCIe QMP
> PHYs.

Best regards,
Krzysztof


