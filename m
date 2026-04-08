Return-Path: <linux-arm-msm+bounces-102268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +H3FCmEG1mnbAQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 09:40:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8B23B86F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 09:40:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECD1D304DE8B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 07:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D1B3845B7;
	Wed,  8 Apr 2026 07:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j/Pv7aCl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1058D3822A4;
	Wed,  8 Apr 2026 07:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775633622; cv=none; b=uEPhPGtZ+QCwLHXZUSGSLMMjZHtGo97dOq6kKWKPNCtegbOEvZpmlmCByG2H73vNkBT7jgQ/6ey9pE+yYzYZDX3gYJdeRux2lewRseesst8iy/jV8mSoOn7RpLu5p5FM2VFb4sOTItIrPPiOlcCFcoOdxgF/B+qYwsJMGssZnjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775633622; c=relaxed/simple;
	bh=AWUzCjhzbRetWnJRTg3dh4hsvuiaoSsnYuEExUjGLUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aufN11LywJHBcARofYA2q8ARIxfB6j4/QBxirIh1u+EXFYkd/+jpoKVocY1bId/0xFSdOANNhyBECIQ49ZHXXzqHbdsonyAhWJDCEZ/v1bb4DMxLL0sSslTOwbcKiFRHWu5ZhB77OlMX8AjPJu3ZlvlkSajkfNObuceU4cD4O0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j/Pv7aCl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B42FC19424;
	Wed,  8 Apr 2026 07:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775633621;
	bh=AWUzCjhzbRetWnJRTg3dh4hsvuiaoSsnYuEExUjGLUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j/Pv7aCln6o5KExkiqWv89Ou7qAil+RMH/Fs0JdVE8cpJeXwHgY1FjmRVhX1XYGHC
	 srsw6PQW5KD6sRXepiAXbH9ZJ/mg6gZLtmGeBZZ20uXbMkn0uNcWY+eEBFfiINBc+O
	 waIP+x85lJqTKjuOI8yfli47Fm4dOf27xnbIjIb2pCKsPrxIIwN9OMSxSTJ0WEB4GJ
	 dbo8sdk6yNCbLTAJxpLw9hn/ZgRix68id4mi9EyLFJk4L1MsmgbryjqF/we7cJGN3S
	 c0PXujUIg5v1RQ4ytb40tPMWKyXNS76gHC+UC4YAfKpvF1WHAZOq3Z9yS+Kykdse/t
	 bwU802A6eMIsQ==
Date: Wed, 8 Apr 2026 09:33:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: sram: Document qcom,milos-imem
Message-ID: <20260408-sparkling-quartz-tamarin-9bae4d@quoll>
References: <20260407-milos-imem-v2-0-5084a490340c@fairphone.com>
 <20260407-milos-imem-v2-1-5084a490340c@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260407-milos-imem-v2-1-5084a490340c@fairphone.com>
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
	TAGGED_FROM(0.00)[bounces-102268-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:email]
X-Rspamd-Queue-Id: CC8B23B86F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 05:11:10PM +0200, Luca Weiss wrote:
> Add compatible for Milos SoC IMEM.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/sram/sram.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


