Return-Path: <linux-arm-msm+bounces-104505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id JC0ICGGL7GndZgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 11:37:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CED465B5B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 11:37:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B78E7300CBF4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 09:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C08D38910C;
	Sat, 25 Apr 2026 09:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CFrCfDBa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D3F35F5F4;
	Sat, 25 Apr 2026 09:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777109853; cv=none; b=BjsyvTDDXuj6fyG/CPHdBEqx4/UADbfSjxePN1ZUUa330h3WTsAtvl+6SUA9KPuzN/e63dl6bLqrFm9v8BmfPY8UaMsIr4GteXCTqkXIbk776rjwM0kfMlH+DhcVQ2zdOocsh1zmnBtXpw/h9Oy0rnbn97XTCHPWtd74WDFTpnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777109853; c=relaxed/simple;
	bh=qQjOfwhSQJKzlQ73dUloc3PjvNSBmV5ChNWqZlToFwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQZkIzlRU3ciwYyqFYToB5bAYpT3h5mIpOwMi1uOUEwMALkfTdVcxdDZUW5i5JG3n4gzDxyXcDwRW9fn/2MJs1JsN2jNNqxvgIlWsvm8aGh9csqowEGgyR9WhndD+9vggtAytMuuN/pWU5TLMKzcF+PlA2MAQ306NXnbZfJ7eN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CFrCfDBa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB33C2BCB0;
	Sat, 25 Apr 2026 09:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777109853;
	bh=qQjOfwhSQJKzlQ73dUloc3PjvNSBmV5ChNWqZlToFwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CFrCfDBaEQPt2oIFN1rSPs6fOz5Bdzihu55SByUAD4NzXTUVWyT9nrhm2LHJsMk9k
	 Ee3xm7RhFUGlq9eTrjc5nLB8kGx9GB4c7jCfblQ6ZaTJFdlLbUmrjdKCTZRSsz2B/M
	 5vBSIsx5CEeFsY6FyiLGVIHm5y6nXBS25xv6pIti7zG+UgCtMeAprK0JyR2qv+aQgH
	 3gmuJSQKRbA1RSHbm4vnzpzj32Ve91+B/vILFyEiMCoaSILfrTo2hHLDpvPznpgWcX
	 JHGPr4s8yLIjj4j/DaNIoKs59eX1R/DPg7AAcAe1TPXOVBSdYf/C+Q4VpbRr1XCH63
	 KgvugRSxGWNpw==
Date: Sat, 25 Apr 2026 11:37:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nickolay Goppen <setotau@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Konrad Dybcio <konradybcio@gmail.com>
Subject: Re: [PATCH v4 4/5] dt-bindings: firmware: qcom: scm: add
 CP_ADSP_SHARED VMID
Message-ID: <20260425-vivacious-cobra-of-tolerance-4bf591@quoll>
References: <20260424-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v4-0-ee5257646472@mainlining.org>
 <20260424-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v4-4-ee5257646472@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v4-4-ee5257646472@mainlining.org>
X-Rspamd-Queue-Id: 68CED465B5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104505-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,vger.kernel.org,lists.sr.ht,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Fri, Apr 24, 2026 at 02:13:06PM +0300, Nickolay Goppen wrote:
> CP_ADSP_SHARED is used in FastRPC driver for older SoC's such as sdm660
> for interacting with ADSP memory region [1]
> 
> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/drivers/char/adsprpc.c#L3602
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>  include/dt-bindings/firmware/qcom,scm.h | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


