Return-Path: <linux-arm-msm+bounces-92132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id M9tzC+axh2ldcAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 22:43:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FED1107313
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 22:43:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05C523012C5A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Feb 2026 21:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ABC43557EF;
	Sat,  7 Feb 2026 21:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lWTu84R+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257DB2D3EEA;
	Sat,  7 Feb 2026 21:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770500579; cv=none; b=LmF+HGIzB67MvyFxkwp2qg6ewerJflF014qmkWFJqkUVG1rjhkOzs9ICfbgNppNtucQEBqp2pFJIb1pCWP9jwCgMMLjqstMlHicrJUqDRwBrWiBwjZAy6Is94dtPWqGzQAQEknPr1pASaOienWpxloT2D8/wjYi5mv74eIi9ZX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770500579; c=relaxed/simple;
	bh=wbbhFUM6X/chpTqMkhuhX3IaEPOIim8V2XLp+g99DN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EPAvio0E08djorilRA4as7r4cxBtrc27Itvzz4EpaqaFv6oUuuNTy078lM2fZSSO4Z6EZK+jgFB07H+vetHrmV1EekPacZ6ymgeARvNl+tg5G4eHbl8rNontU70tEsM8HUh3defeIr0VBdt5Rswd6cAdYOBAccZfRIMCcIT4CZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lWTu84R+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3172EC116D0;
	Sat,  7 Feb 2026 21:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770500578;
	bh=wbbhFUM6X/chpTqMkhuhX3IaEPOIim8V2XLp+g99DN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lWTu84R+3+HuC2e0DrBqsSCTkzoIE+LAkknfY0LN28PMEj1GOQ6AoebUZ2550yiRE
	 xaaeMWfm3jYKO4ux6hVXhwBSe2VgPIhUQkuebtXgBMWBO5Gd+3CVaHHWCC0s0aMqp+
	 KZJ6KjrMgfDDnL3Cdvux16HmZgyHw/IS/qj/qMdDe+iK01kN9hVPmABJYmDwMA2t1R
	 4sAyqMrTfZLG6V3/qQa/37yX8SqEbWvyG8PdpGwwW7VjT/58hp7Z5Csghv8oTxXOkv
	 Si7mr4YGqU9gF0TCz2exwNUhlbxXF90+LEw/+0llvtHw37sfeL6aaAcLLFFULfJtH4
	 e+OZLBRr9moYA==
Date: Sat, 7 Feb 2026 22:42:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roger Shimizu <rosh@debian.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: qcom: Add Thundercomm AI Mini
 PC G1 IoT
Message-ID: <20260207-private-celadon-gecko-166aff@quoll>
References: <20260207-next-20260130_rosh-v2-0-548bbe0c7742@debian.org>
 <20260207-next-20260130_rosh-v2-1-548bbe0c7742@debian.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260207-next-20260130_rosh-v2-1-548bbe0c7742@debian.org>
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
	TAGGED_FROM(0.00)[bounces-92132-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5FED1107313
X-Rspamd-Action: no action

On Sat, Feb 07, 2026 at 02:45:26AM -0800, Roger Shimizu wrote:
> Document Thundercomm AI Mini PC G1 IoT.
> 
> Signed-off-by: Roger Shimizu <rosh@debian.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


