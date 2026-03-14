Return-Path: <linux-arm-msm+bounces-97693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MUXM7cvtWkXxQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 10:51:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 586CC28C8AA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 10:51:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D2763045C3D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 09:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3539C34EEFA;
	Sat, 14 Mar 2026 09:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BSoPmFdl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9E134E767;
	Sat, 14 Mar 2026 09:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773481777; cv=none; b=E8GDL3v9CDXWI193nkYrHLaVd2WVLCrPK8bBebp0nITMcOzo7v8g7PoKGYZekM67ZANWn3crx8if+BXdj2x78EZhgF8pQZ9VLatUoiq7IUggQBIiaV4qzi9pX16N+pEtIHdpDsYUlf0nTmAeUCVfE+LDazhmbKyN70nRqjJeJUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773481777; c=relaxed/simple;
	bh=fcrIRgo7WiG1bH6sO/LxIQs2quqbjD/lDxK0CwZbRdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHjz98gLC064mobuVccuIMhr6o9sc+lZ2ZnZCwe9SJNis5oGJTlJ9w74CDOHn2lw7ihMCfPsCDiIT4a3VbqjfoNZl9nU3pF08fjD6c5gxbki4cS1haPT0m0XGu8b8N6If/aYRko4rBbChz6zWQCA4uRrpjQHSsmLSEnJY13qDp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BSoPmFdl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E96B1C19425;
	Sat, 14 Mar 2026 09:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773481776;
	bh=fcrIRgo7WiG1bH6sO/LxIQs2quqbjD/lDxK0CwZbRdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BSoPmFdlFfBqCJLL3ptAYbd/Vl1+wpQPGDz6FW8jgiKcfLd/BDfui27gHhVikmDyr
	 TLS2v6MzWQevab2P34ULibP5LJyvvAtJzXEUFS7qbLBLk6CH/ui5lzZA9uoUVmetOE
	 vSml/qG8psiXPQe6NPgy14rDXIxgrd9Cdl+P6J0qDAXO2NnMb9/m12kZV8AbPgNNGJ
	 qgO2KuW3t/BLrc2C3nY/bblS5bwl/fufDMMxbXm+UFVkrl2VOIHpVSJnfnYlenMYtB
	 i3wma6nJj2pYYOydc5dchfW5mQnTvIqcCX4m/gFAI6T1Blp2JqnxXGSeMarwOIZQG6
	 8jUHmq7cxElUQ==
Date: Sat, 14 Mar 2026 10:49:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: spmi: qcom,x1e80100-spmi-pmic-arb:
 Document Eliza compatible
Message-ID: <20260314-happy-funny-muskox-5c0ba4@quoll>
References: <20260313-eliza-bindings-spmi-v3-1-b8ff1e0a6171@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313-eliza-bindings-spmi-v3-1-b8ff1e0a6171@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97693-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 586CC28C8AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 02:22:38PM +0200, Abel Vesa wrote:
> The SPMI multi-master Arbiter found on Eliza is version 7.2.0, yet
> driver-wise, still compatible with the one featured on Hamoa (X1E80100),
> which is 7.0.1.
> 
> So document the Eliza compatible and allow Hamoa one as fallback.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


