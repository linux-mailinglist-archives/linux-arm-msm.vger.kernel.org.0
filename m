Return-Path: <linux-arm-msm+bounces-105605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMbfCaZb92k1ggIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 16:28:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3CE4B60EC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 16:28:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A0B6300953F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 May 2026 14:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A03473CD8AC;
	Sun,  3 May 2026 14:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kvCYBgrt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC2A38F928;
	Sun,  3 May 2026 14:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777818531; cv=none; b=Qd1g6624cMHrjuOnsPFfTJW1tqKB2CmlesoV05+SRlM3cVc8oF707m4siaF11NtoLaD/LBazKQZF8BSZc3H4Y4a96zVPI4rrVgPqX6ucMrtEZHDaw1SOg51+3stKTRXmYkGL0KJJN5et/54NR+8Jm3xs98Cm5hRv1plcQtE2Kj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777818531; c=relaxed/simple;
	bh=oHAOj34t+OP+42ilbhbpzhVXom5S5idw7VJNHNzAO/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IA7F3VySz5o+psrzHsN15XjXsll7nu9ipan3iCJJE78I3an74ZPYdYvce55I0Bwc4GJz7d6t0m9tDSgORIVCr+1mztGx51DmWP4ylul521Y7hgswfsF+nSm0FXfC/ms04CXQ/l95xLKrnN4fO9KwZNvAguVDO28bUFrKzBRV6zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kvCYBgrt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82BC8C2BCB4;
	Sun,  3 May 2026 14:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777818531;
	bh=oHAOj34t+OP+42ilbhbpzhVXom5S5idw7VJNHNzAO/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kvCYBgrtZdcsS0oFa49+XtYmkawnz84P4vlwD/cBYoLlHxSO9Ix+h/G92zdtS+cmI
	 Sj4i3WSEtHAskA1L6gfROpadTn0Hizp2kDX2wzPwDF1T3Plo1l3nCnXUXBahFiKlaT
	 8il59j4x54Hf81+m6051FzMv1/U870WO1cOPewjKkUSyCb+i1VX9RnhUH+RvL16UGf
	 SoJbNwArxi4EvagNY+M+viqqEHV6UhBWZGAyvCD8HF58vOGhzmh+6n3a5BBVKxe97w
	 yhg9pJPObiK1asTZCh+OkZTIMxrTamFUYGicAe6EYe2i6kR7Q9ESvhgR2a1dbUDq5Y
	 O7yHZdLgLo4YQ==
Date: Sun, 3 May 2026 16:28:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kamal.wadhwa@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: regulator: qcom,smd-rpm-regulator:
 Document PM8150 IC
Message-ID: <20260503-courageous-vole-of-assurance-e37de6@quoll>
References: <20260429-add_pm8150_regulators-v1-0-9879c0967cf0@oss.qualcomm.com>
 <20260429-add_pm8150_regulators-v1-1-9879c0967cf0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260429-add_pm8150_regulators-v1-1-9879c0967cf0@oss.qualcomm.com>
X-Rspamd-Queue-Id: 8D3CE4B60EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105605-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Wed, Apr 29, 2026 at 06:56:18PM +0530, Rakesh Kota wrote:
> Document the pm8150 compatible string and available regulators in
> the QCOM SMD RPM regulator documentation.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


