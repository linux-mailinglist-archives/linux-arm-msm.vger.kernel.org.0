Return-Path: <linux-arm-msm+bounces-91933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FxqGdufhGmI3wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 14:49:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CB4F3883
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 14:49:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B02D73041BDA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 13:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A9228469F;
	Thu,  5 Feb 2026 13:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lbWd02oc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3737A225397;
	Thu,  5 Feb 2026 13:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770299041; cv=none; b=WHeaTHuX0mZCbIlejgSNGSXM9C0v7jR/Q6ddKW0+c23o0RMCId3dYE1IbxxHio3hNlWwjRFBtRGULpUEFQiLa9FxZ21jw2PP1lZwIqTXcju7jsUkRLsdnx7iyvFdyXEu3vOnPIzTE0gFCF5/LBnvXJHT5nVOXTLpqoXe/SvM3Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770299041; c=relaxed/simple;
	bh=8ePgJeNEd3SGqKStl8ovXuQgapPueav6xL+4rbGT690=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ngy3Jqnjr69o+ifqPFvYdGlaZH9hTHC1K2HpIhk4T61BInMPcT4fiVYiU/GmYJDCdfqaa+yrXMiBDy7AJgAOioZZ/2N0BsY8DEBhLScYNveMOxOKBHOMOJ3yfwiXCOnueYBmkrXBqdRDtr/SwZUAxREXszztXK82e2KdpR4d8FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lbWd02oc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AF97C4CEF7;
	Thu,  5 Feb 2026 13:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770299040;
	bh=8ePgJeNEd3SGqKStl8ovXuQgapPueav6xL+4rbGT690=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lbWd02oc/X2jDWbG0U5SgYcRheoAI+YyvWoMU1wx6409t+bxcQvZwDI5dplbAkcjd
	 aCQSjnpVi614y6DcRaAQeCBP1vqfcoA9Sry6tDkVME17lSBaMt19wq4//WfFqeJ0PC
	 ldtTT1AmHa+tp1JjVYIEUaf8b0z77sD2dFJo4/wumF7zBIDPOsQYFdLWu/krdiI4sH
	 AX8SEBY+9mYVOPzm8N6BhpMoMz9pq/7ShTEA3cSq4e/b+VGXVUVh554nbNFJs9vi3D
	 xcLz4yFJwL9yMiKH5rlCp9/4mmYcXoT1YGEJG8ySTf5NKYl3IQlRwRkRmUFqmnO+7C
	 LknVDpv6Co7/Q==
Date: Thu, 5 Feb 2026 14:43:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, sumit.garg@oss.qualcomm.com, 
	dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v5 3/4] dt-bindings: arm: qcom: Add IPQ9574 AL02-c2 and
 AL02-c7 eMMC variant
Message-ID: <20260205-amiable-finch-of-order-e6cb6e@quoll>
References: <20260205085936.3220108-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260205085936.3220108-4-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260205085936.3220108-4-varadarajan.narayanan@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91933-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 10CB4F3883
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 02:29:35PM +0530, Varadarajan Narayanan wrote:
> Document the IPQ9574 AL02-c2 and AL02-c7 eMMC variant.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
> v5: Add AL02-c2 eMMC variant also

Heh, hust after my review, so no incentive for me to look at this one
for a few days.

Best regards,
Krzysztof


