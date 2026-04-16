Return-Path: <linux-arm-msm+bounces-103356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oK8ZKImt4GkRkwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 11:36:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0680840C780
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 11:36:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 144563127903
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 09:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D17739C645;
	Thu, 16 Apr 2026 09:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B9MTCzhd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AB739C01C;
	Thu, 16 Apr 2026 09:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776332029; cv=none; b=QA60J7S25Tj+GCdm2oupRjs5lAX8WymBEnOcMvsepF0hF8riPomBcZdfYMHNhFRxKwZgFzPizEd1mIpdrFRWXfplLcpt0onhthVBo1C8gVOG3/QkpjOOCVXfL3ghZ5eLMhzfGvJowr18ctyy6FfgiOqTsIYol2chTWXwYegWrqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776332029; c=relaxed/simple;
	bh=Jh+asE2VdZvxm0VqfRG4OVBDlfnBq8L5ByHANtlWrqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QScPpUEq2bC6/W5ZgFDbp52CHmgSKvhdnB6FAba2mLXgDDC2X4vljHJyDGHBXwg3U0O5zo9vieqwzEW5GTpu5g/UL5OWGaAinVzu1WWvWEqW/uVH+kG08HSaHh9DZd7m/1klkgjIQe+0zmOrQgv3Cbt+zWpAiHsnTIOv2llBukA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B9MTCzhd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD9BC2BCB8;
	Thu, 16 Apr 2026 09:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776332028;
	bh=Jh+asE2VdZvxm0VqfRG4OVBDlfnBq8L5ByHANtlWrqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B9MTCzhd92lqkeaHizEVY8vfYxOVt9CzDnVBoY+FwJsJ4KSpx8osKI9hrnRhLX33E
	 sD5HKkOoRf5OdtM7C1iWxXjydGnmGbIsqPNO7r6KOove9iAF/aL5FWcs7OatQZlPqU
	 QG8QSr9R9E1HV+d0yMgvl9Zjkz9woBkpLuKi9dCZ9lkaA+Ql/ckTEfqePDc2FPGpeQ
	 D83Vp6VvFEQMDp3+kYvRFSm30ZqG82uzKrUhVb6A4rXCMJdghljl0AXm1bb/LGMPxW
	 sk3o+xfbJ96v8CNi/CYfEPdRpT1Vvde8Y0rMcDT/oBu0WPrV+WaAlfEBSqyLsf1MG/
	 WZY0H1rc9JW6g==
Date: Thu, 16 Apr 2026 11:33:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: clock: add Qualcomm IPQ9650 GCC
Message-ID: <20260416-succinct-crafty-koala-e4ffec@quoll>
References: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
 <20260415-ipq9650_boot_to_shell-v1-1-b37eb4c3a1d1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260415-ipq9650_boot_to_shell-v1-1-b37eb4c3a1d1@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103356-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0680840C780
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 07:03:16PM +0530, Kathiravan Thirumoorthy wrote:
> Add binding for the Qualcomm IPQ9650 Global Clock Controller.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,ipq9650-gcc.yaml           |  68 ++++++
>  include/dt-bindings/clock/qcom,ipq9650-gcc.h       | 190 +++++++++++++++++
>  include/dt-bindings/reset/qcom,ipq9650-gcc.h       | 228 +++++++++++++++++++++
>  3 files changed, 486 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


