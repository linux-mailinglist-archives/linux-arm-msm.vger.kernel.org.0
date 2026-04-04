Return-Path: <linux-arm-msm+bounces-101771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIktMgLu0Gl4CQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 12:54:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF0B39AD90
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 12:54:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 502A0301F496
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 10:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E61D352C3C;
	Sat,  4 Apr 2026 10:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jaMoR2+S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8E5311C2F;
	Sat,  4 Apr 2026 10:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775300085; cv=none; b=PGn19DN9ZkY8PmYBhpVUKyRd5tWlg2Ah0L5mO7mLd2veNY3Hj1MKSqe7RWkubd5A6uEYoAf8PVFLe99kRtYaE94GNyx7AURLWX1PC85uIdMUj5mLFb+W3EDJbmCxamNyvaTn3rZ1C23RwHJGL1rb5FlZ8FXR44hwGwIhYMo9IlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775300085; c=relaxed/simple;
	bh=YqzmCL22FDJ4H6tdl281//P3VCxuaCjuBv+eWpZFmtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LscB3Ki/9AzmkDlpLhJFQv1RHA/Ct8fGXdNEbpHeJs2L5n04S+JuMvs2M3FEm5Q6MP/v7brHGNuGcw7sMtjvmKNryJvSmSdGgmTGm+3mUF/xZi8ZeuueUHdyPQZ+HgL5AoXGGxX7LYzYOswnq3/dEZgFnOmCR5qdqrA3rW4GHZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jaMoR2+S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A590DC2BCB2;
	Sat,  4 Apr 2026 10:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775300085;
	bh=YqzmCL22FDJ4H6tdl281//P3VCxuaCjuBv+eWpZFmtI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jaMoR2+ScBc4ICdiqeig5Z1XIETvaTw2J6yAaHLB37fYMsnV+OVyWjfpZd1NImod8
	 Tq99EwhH1QWkDi5WH1ihjgcMnDiVSCO6bxizOBlozhoHpRN7lXqtaOtOw7tR+h18kL
	 DxJ33b2QNBBPJ1m8MVC8zHs1oloLsC02RpdujZHeY1AeQLgho4+3fIk7sHTiGZaRnx
	 myJJE06bAZ9Yaf6ybeQibi1w/dQ9SvPb+LTj5VpPRlAMDSuJ3OKeAOPxUBkMlMy5Wq
	 UnUH1HMRvTuvLErMgZbhGrZHWKW7EGq7Z+CouS9DA8v+yTPJX8Uxxgan9ibX2FS/Y0
	 EjN0s3RnJI/DQ==
Date: Sat, 4 Apr 2026 12:54:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexander Koskovich <akoskovich@pm.me>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: qcom: document the Milos GX
 clock controller
Message-ID: <20260404-enigmatic-nightingale-of-hail-223a7d@quoll>
References: <20260403-milos-gxclkctl-v2-0-95eb94a7d0a4@fairphone.com>
 <20260403-milos-gxclkctl-v2-1-95eb94a7d0a4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403-milos-gxclkctl-v2-1-95eb94a7d0a4@fairphone.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101771-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2DF0B39AD90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 02:03:46PM +0200, Luca Weiss wrote:
> +  power-domains:
> +    description:
> +      Power domains required for the clock controller to operate
> +    items:
> +      - description: GFX power domain
> +      - description: GPUCC(CX) power domain
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-domains
> +  - '#power-domain-cells'
> +
> +unevaluatedProperties: false

additionalProperties instead. I will fix the other file.

With this:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


