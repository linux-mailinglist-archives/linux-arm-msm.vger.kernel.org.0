Return-Path: <linux-arm-msm+bounces-105310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPPiEG4h82muxQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 11:31:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B393049FDAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 11:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13B22300B9CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 09:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D1734D4CE;
	Thu, 30 Apr 2026 09:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N8VtOWAw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1204831B830;
	Thu, 30 Apr 2026 09:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777541483; cv=none; b=IQMOt8RbM/IbVmpTGY9G3fyGkkFkZXHKfXTZrRLTGHokubpjkc7pXHbpOEvI0Jsw0Hz3ffctIKQn9naG5REcWWyNbouIXJI1vD2lpTRnCryA/ASlILg2u0idUdovsP8N1B4oUIAmvd9BpoapMdIjaxFNdvIicErST3cYyVusI9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777541483; c=relaxed/simple;
	bh=lNyfrnysNzXRa/d5wAQ61BZKV63ROnMlAqiKmaO5TiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oroAdkojnMzZ2RZ3fQzpLXwCMIQ1/E3BzfDG1YG+ImI9VH/5REbtHhW7anmv0jOInF2Yaeon5QSehmlKsX5dEfl6ldIfFoEzO8RrSHGf+IY5Hzr3ZGHyUFwazgKQGTXf+LRK+i4nrxz5QAblbMGWWHY+Uj4Uhcb2/de8mNex35o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N8VtOWAw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AEDCC2BCB3;
	Thu, 30 Apr 2026 09:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777541482;
	bh=lNyfrnysNzXRa/d5wAQ61BZKV63ROnMlAqiKmaO5TiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N8VtOWAw6O0Mnar8m/p8NfAM2S6bQGzfi6zgBdPGBYEsh1hmYFWs0w25zTsPX+wyU
	 gmEK/pOtPwd0ItoCRD2yo9FgUbdyMfLRoVXV3FIlJkR+kYAFWshCG2q1ERLy3SSWRc
	 XoDvq+Vc14EeI5ZYNRmWoNiWGg2HRs/3Q/uvN3N3TsR2ABJv2XwCa+Y3xLfXtK8GEm
	 LpbBcOMvzaQQiJfarjpZgG/Ixl5XBKLCsTMbDuh/FlXou2yfSM21VJwW3iqHTuAdbo
	 hIVJdwh4jTv3v3S+uyD5t2nUVwNOdIUywKXh+Ynx6f1q8u75nD8nlJ2lF9p4KFTJen
	 1uqfaY0gaPazQ==
Date: Thu, 30 Apr 2026 11:31:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: nvmem: qfprom: qcom: Add Hawi compatible
Message-ID: <20260430-finicky-jaybird-of-prosperity-0a26c0@quoll>
References: <20260427182618.3667963-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260427182618.3667963-1-mukesh.ojha@oss.qualcomm.com>
X-Rspamd-Queue-Id: B393049FDAC
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-105310-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, Apr 27, 2026 at 11:56:18PM +0530, Mukesh Ojha wrote:
> Document compatible string for the QFPROM on Hawi platform.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


