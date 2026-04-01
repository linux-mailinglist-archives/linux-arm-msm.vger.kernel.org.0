Return-Path: <linux-arm-msm+bounces-101312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHttF1L6zGnRYgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 12:58:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4596B378F28
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 12:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D047D307DAA3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 10:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 595593F7E65;
	Wed,  1 Apr 2026 10:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k02IpKij"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB593DDDCE;
	Wed,  1 Apr 2026 10:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775040929; cv=none; b=jUwsgdKLIGu7EJKT0OGMzkJLpbtj4XI18Q28sIAuTzXXW7PUYoSHkiVYRUwGYfRNRbIr5lw/KeYEFBJjOQvfQVsRgLiPuwb1tDgjpNIysE1EXGfgGK+OGKA1O2h2mm0S4KWl4YS0v9HffUeDZeoxKlUOUTnUM9k7hGK4J4imDGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775040929; c=relaxed/simple;
	bh=FifC0TABefbI8m3DHxVVECYbxBgXfp7dc9pcZyU+ZnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZvuXNRmzSr+kPvedpCIpviui/XaNCLQ1eY3+/XusD/wjyD+IH49dw1PiUAlmzH1iOFm4zncobDsTbKoLndE5ivXpuRdHxkFTMh6qxBD1YlGBCeA9hxEZnLlVmlM7fNh8JkRaQERoEZy5Pbtv22KOCyq/XMKy6FZqSq/MO3rilNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k02IpKij; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40B66C4CEF7;
	Wed,  1 Apr 2026 10:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775040928;
	bh=FifC0TABefbI8m3DHxVVECYbxBgXfp7dc9pcZyU+ZnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k02IpKijT0IG0969pYGr58wi6gZ5ZLK1AUh4K6Kkn5a3q139VgyRL/SJofXet3BQV
	 e8onBoAukteqOl3vWxM2mjFt4u+TipMxjSnQXdjSO+tGvktHHJjorCCVozFKCq+vFe
	 QRmeTLdVEYM07mHag2aFTj34ERwnuhty4xIgcpZoL96EwghhUQkAu9vF93iKwdJcm/
	 FMFWigO5Bw0xwPgKDOjKasFP8y29yaHPJk2L/IdwR3JUEsLMQZGJXGCfclWZZjOc/m
	 mgpUNJou9uSOyQd9v2rLqjPXIEE8lCZqv//920gEaGtXchhPOdrvNVeC5P+zeLnS+c
	 RdpaHeWnBhmCQ==
Date: Wed, 1 Apr 2026 12:55:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: qfprom: Add Milos compatible
Message-ID: <20260401-sceptical-jackdaw-of-awe-a9876b@quoll>
References: <20260331-milos-qfprom-v1-0-36017cc642db@pm.me>
 <20260331-milos-qfprom-v1-1-36017cc642db@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260331-milos-qfprom-v1-1-36017cc642db@pm.me>
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
	TAGGED_FROM(0.00)[bounces-101312-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,pm.me:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4596B378F28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 02:24:57AM +0000, Alexander Koskovich wrote:
> Document compatible string for the QFPROM on Milos platform.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


