Return-Path: <linux-arm-msm+bounces-101483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EP8pCAorzmnIlQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:38:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1E638623F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F023B300A744
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 08:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13745361DDE;
	Thu,  2 Apr 2026 08:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kEk7h3qC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22DB4C6D;
	Thu,  2 Apr 2026 08:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775118899; cv=none; b=lOLsvH/sV5PW27BD3oW3TnfGd2E6DyyS/7r7sGNxxTr6GostR+oeLNlUlUgiPzgqIGIaaS0QNLNCjYh5CgUdNsXOR6phaw5Z49mWCk/Yic6OHiqHANicXsHKLQSYOKy6J9hbu9+00l80reMKGeLTedJsmA0WhWysU2h3oL0HOkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775118899; c=relaxed/simple;
	bh=AN1/6eZW0wvj995vM30V0a/DcaXupU3vIlyvDAfOmnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JuacKR8BoIdJbJ2Nj558yEdysNNkBOxllylz501b8kwFqnbo+dQaewWxn63iNMAd3iQnzrksGBCVoG7M9OjA8Po4MvwL7nyg/Vc/8hXn8i5jnAjyXDPupSd0/Sg+75jHnGJD9UimqXF1YVFCLcZ/HDYdaOUhsV8XJ7xuOZs8Mk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kEk7h3qC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D6F6C116C6;
	Thu,  2 Apr 2026 08:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775118898;
	bh=AN1/6eZW0wvj995vM30V0a/DcaXupU3vIlyvDAfOmnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kEk7h3qCPHFgsJMMj4DywJBkJAya6LRwgPgAIes6PH37xZRPZrKrWAE3PT69WAfb3
	 S4jVxRE2opyy+B3Mq1E9gFTXPMUEJlrphSOrDc1HAoNL8+f+/9w59h1cLgHprT/6VW
	 Rdgy4vJsfcyhgc+ffOEEeqd3ZcgHkQYa7efEAQIRcxNRHmZl48+/Z7VtB0gxwHpRlY
	 nppn0Ow0anNfCrsn5Tv7ZwokQrV7WtvpENFcOlSK9LaAZ+F5dJXFxyLJtQYC4xZePh
	 7k4b/6JS5vKw6zTK0OzNPKvMmHvkXe15zsBPo3/odRdfyfVotRk5R1j8aXnz0vNZ4/
	 IGMQ1UikYlbmg==
Date: Thu, 2 Apr 2026 10:34:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, kernel@oss.qualcomm.com
Subject: Re: [PATCH 2/3] dt-bindings: power: qcom,rpmhpd: Add new power
 domains and new levels
Message-ID: <20260402-great-affable-panther-1a5ed7@quoll>
References: <20260401-haw-rpmhpd-v1-0-c830c79ed8f9@oss.qualcomm.com>
 <20260401-haw-rpmhpd-v1-2-c830c79ed8f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260401-haw-rpmhpd-v1-2-c830c79ed8f9@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101483-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: BC1E638623F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 02:15:30AM -0700, Fenglin Wu wrote:
> Add definitions for the new power domains which present in Hawi SoC:
>  - RPMHPD_DCX (Display Core X): supplies VDD_DISP for the display
>    subsystem
>  - RPMHPD_GBX (Graphics Box): supplies VDD_GFX_BX for the GPU/graphics
>    subsystem
> 
> Also, add constants for new power domain levels that supported in Hawi
> SoC, including: LOW_SVS_D3_0, LOW_SVS_D1_0, LOW_SVS_D0_0, SVS_L2_0,
> TURBO_L1_0/1/2, TURBO_L1_0/1/2.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

This belongs to the binding change. Unless you are not doing it for
Hawi...

Best regards,
Krzysztof


