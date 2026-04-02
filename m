Return-Path: <linux-arm-msm+bounces-101486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qL/MDKMrzmnIlQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:41:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A9E386342
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:41:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C548130CF31C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 08:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51AD539B962;
	Thu,  2 Apr 2026 08:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="easidMHj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E06B3630BC;
	Thu,  2 Apr 2026 08:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775119026; cv=none; b=pFvk4kIm71Evc7G0IZmecUdjwoK25pb0uJHyz5efXbAi6+1DW4zALTyRSkaoI/q3u4vOKQ7lGhqar+q6Gc9Btx02che+WgDDfEnm53QjCbANEkj4IBoXF6VdnAei/ht+uAWFlu5hkvn3YUMgPUrfoNfu96cTmzW/4qr7/hswm/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775119026; c=relaxed/simple;
	bh=SrwUM8qP2vmvd+iqM1MWO2S5hCKz8H2FDMw7BYuiQ3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYFb1qfP9thCWkX0wNKo1YF5TP1Bq4kqsOwnYXnp4g27Yyp8cqWVP+F/ur5BMGXZgmiVMxl1Tvy6J9robTbnexXCmKCbcoiNcpEQf79gI8TIRwWNOoEzpNntVvSipjPyEjM9mOsO+u035Gm46LtDEDQDUEGhXpNmldp7AkXfkps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=easidMHj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 421C3C116C6;
	Thu,  2 Apr 2026 08:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775119025;
	bh=SrwUM8qP2vmvd+iqM1MWO2S5hCKz8H2FDMw7BYuiQ3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=easidMHj5LXf8hSUbV+p9z+JcOSCCZwxrAjrBNrOYM6Shy8sh0pp0VSUucxzIk46Q
	 rLLJF9oy1KlCu7MJlzn/lX5L52z+no98+Ao1dJkDFktyDMflWfHQ+O8BCNEktsQ314
	 ++mWZQjHOcgddRR7+YIxVHRyWOfT2oYq1jzrVJNLTDcUWL9ijoCsGQ/Xn3K9SrV3Ur
	 2X8P2tvy1Yr5EK4H5ImAdIUSj4i7XWfeKqM7VJu6/eNqvrAFL7utama1k0/hXNESAT
	 ZW+KCV7WP/hrgtvroeq4yujfSiUzkgYfXfwGtAguQeF+LGpS2Lu8IxaK/ZdoB6iHvt
	 KR8NTHGKX5V9w==
Date: Thu, 2 Apr 2026 10:37:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, David Collins <david.collins@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	kernel@oss.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: spmi: glymur-spmi-pmic-arb: Add
 compatible for Hawi
Message-ID: <20260402-nocturnal-dashing-vicugna-b4bbff@quoll>
References: <20260401-hawi-spmi-v1-0-c40963041078@oss.qualcomm.com>
 <20260401-hawi-spmi-v1-1-c40963041078@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260401-hawi-spmi-v1-1-c40963041078@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101486-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E8A9E386342
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 02:41:23AM -0700, Fenglin Wu wrote:
> Add a string for hawi-spmi-pmic-arb which is a compat of

There is no such term as being a compat of something/someone.

> glymur-spmi-pmic-arb.

SPMI PMIC Arbiter in Glymur?

Best regards,
Krzysztof


