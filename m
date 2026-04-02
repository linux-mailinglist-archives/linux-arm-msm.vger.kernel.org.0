Return-Path: <linux-arm-msm+bounces-101484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJfcD+cqzmnIlQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:37:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 353E838620C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:37:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 78164300348F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 08:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B4338BF7A;
	Thu,  2 Apr 2026 08:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HWMhQyGi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043BB2FCC0E;
	Thu,  2 Apr 2026 08:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775118925; cv=none; b=FYFZKEQg8qEkdLBFyAcXURjU1t/JXkaH8lDB26BBJSpAMjaFE4WE7n0UCAewOFLuRTaFb4BPjwcfRxmoor04N4W639dmNsG4A/J/Hc8rxyY+krjem07m54etuwQHAfLYzMsrw5uPGbDdEoZUpC2IlLJQlpH8pYe+1FkayPW6EVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775118925; c=relaxed/simple;
	bh=t1QmIzACXByrxlX2LDOzw1L7KSsFZSufjVjMUw8spLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jXW9NK+lGL+Lcb92mjDYkBPwndhVgjwdNLZRyst6Y51xMSX6PaZM6RjgVaGp6kVkIYMgr2BhDkr/p7EpClFZ8m8AX6GpkuZMROj3MjqL/j8xoZGDNnvMuht+6aupZn0uyJ+tJ/UCGfEqf5JvgUhhywkgK12UA9r9UxcNdWwiDfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HWMhQyGi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A411C116C6;
	Thu,  2 Apr 2026 08:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775118924;
	bh=t1QmIzACXByrxlX2LDOzw1L7KSsFZSufjVjMUw8spLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HWMhQyGiycfpHTlwbVALlBmYnQj+3QdPBr3NwJaTkXLEkUhAGVkF7yF/2AhtHYWKV
	 5OQPtnhvX1xurEVjRyAXqanTPtymNyZzg2KmQf98HMg3slQkQpGGN28V2wmVo1262H
	 ArBk5VS6kxd0fo6cma+XbU6DXRTgc3EWuXZY5AxVD2y9j23yBUC/GiFII87e00+/LF
	 UtLwm07AFLtn6VAfqWeNST5t6jY4x3zUvWvmNa14Kce5b/Z3c1WBFygzy+uzABlhb+
	 JRhKswAa6O+CS6SaatKEY7Y547tP0NhUly6TIglRcJ+V9afbBr/bVl5V1cyWS/ltBY
	 HrZOaq+Ea5qSA==
Date: Thu, 2 Apr 2026 10:35:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, kernel@oss.qualcomm.com
Subject: Re: [PATCH 1/3] dt-bindings: power: qcom,rpmpd: Add Hawi RPMh power
 domain
Message-ID: <20260402-honored-persimmon-grasshopper-ef8d83@quoll>
References: <20260401-haw-rpmhpd-v1-0-c830c79ed8f9@oss.qualcomm.com>
 <20260401-haw-rpmhpd-v1-1-c830c79ed8f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260401-haw-rpmhpd-v1-1-c830c79ed8f9@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101484-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 353E838620C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 02:15:29AM -0700, Fenglin Wu wrote:
> Document the RPMh power domain for Hawi SoC.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Missing new power domains, no?

Best regards,
Krzysztof


