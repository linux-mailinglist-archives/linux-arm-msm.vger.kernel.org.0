Return-Path: <linux-arm-msm+bounces-102593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mF5FMlOm2GkhgggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:27:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BF73D3506
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25689300917A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 07:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DFCB3A168B;
	Fri, 10 Apr 2026 07:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tuw2sMvG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E9538D68F;
	Fri, 10 Apr 2026 07:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775806003; cv=none; b=uIlv7N93Kr0AOmRkYEftiGllKHKKdPOsSyU7H2izqgyeosJ1r13brwlcxKf9cSS1XFyF5hi98+YC3J877w+FL8ceSEn6YWZj6y8hQHawPwswKSrgAFSLGdpf8K6o3u00KsYSakFTRBLbeZaH8/rRS8rAMtEzdgNNn6kozDlLUkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775806003; c=relaxed/simple;
	bh=a1gduW3M5G7bUw2e0IKIKRKOnodkiPsAGPFERA2yiBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pCOzXq0388R7g9s3EhGJZVj9paMbuR29qOUgO4bnKXl4rsRnaIfFw2uK4RfJ2btcNGRvXTPB6x7pvAgXz+E7dxkvUIA/FrgpHJ98s1s53575Dsqw/LP1tVwXP4p7rYkNE14SrSc9XEYF3qJqHicEm7XfnUZilN2m50uQLsKSgZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tuw2sMvG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E66BC19421;
	Fri, 10 Apr 2026 07:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775806002;
	bh=a1gduW3M5G7bUw2e0IKIKRKOnodkiPsAGPFERA2yiBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tuw2sMvGnM3VuokAWhST1C5WljelM/kT65RtZ9eTpAaEhQinIL5JWEx+mPQk49MBU
	 TQDZCSzwdoOgah7IM1HhNAIOA7I2Qz19+cgG0Xh3Qxcr9uHRZMbl3yomZHudZm0Um7
	 Vo7eEoy5aQnA6OVIh2OR3aPjvveGEimxh+pwLQICAEsbeEpFLvdGnDXsw3AVz565mu
	 Izc3WNd59kvwfbMDBhRhZIVgVRBJd0kka094Nw7cVS5ADA0BS3ktss6cnm1YI0qiD7
	 tt+RE11cgIydxHIrBgq6WDkvNkHWaVtzm0is5ijq8lEkychPnvfSOcrnQBWYf/COda
	 DvwTqvm/OCIwQ==
Date: Fri, 10 Apr 2026 09:26:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: interconnect: qcom: document the
 RPMh NoC for Hawi SoC
Message-ID: <20260410-lyrical-labrador-of-experiment-83cd08@quoll>
References: <20260409-icc-hawi-v3-0-851cac12a81d@oss.qualcomm.com>
 <20260409-icc-hawi-v3-1-851cac12a81d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260409-icc-hawi-v3-1-851cac12a81d@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102593-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 62BF73D3506
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 02:01:37PM -0700, Vivek Aknurwar wrote:
> Document the RPMh Network-On-Chip interconnect for the Qualcomm Hawi SoC.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  .../bindings/interconnect/qcom,hawi-rpmh.yaml      | 131 ++++++++++++++++
>  include/dt-bindings/interconnect/qcom,hawi-rpmh.h  | 164 +++++++++++++++++++++
>  2 files changed, 295 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


