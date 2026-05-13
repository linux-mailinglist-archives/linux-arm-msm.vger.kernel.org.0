Return-Path: <linux-arm-msm+bounces-107497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEFmMYz5BGqNRAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 00:22:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD9453B63E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 00:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D539D3017F9E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 22:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB630396D2C;
	Wed, 13 May 2026 22:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QriUn4q3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A85389453;
	Wed, 13 May 2026 22:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778710919; cv=none; b=FkKZ/3FqPbUuW5EjIP7YN8LgGV6ZsMBMDJMwXE8LRHzwRQLYiqMk35bMAoMkt1zxJV2XWT8VIHlOveZGZulRvNF2b2SrZ87qzq/jpCAC877z1Ipr89JnPn7P7qs8MjRHPVagyMdcTMPgBjpjyrvM+vBzyjPFXWYEU9uBXpQS8G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778710919; c=relaxed/simple;
	bh=AomMlh3FBAzOZjg8+K2ZaHOaztdMMkb6ZwNQ9IEXrdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gkAFqyZurHlcRSyCiHmKI/FmDfj9+MykXc0y2IG7HJfZquTGCrcSrecdbjqCGMDhmDWwKRQVqgQVEmudkyrqRIWpUJjU7TrQzVcycIzitJqwhjszLoXE2x4YTvWgZNWtB40N3OTOAcKqlc/r/mWb39Bm8LTBzLRPjbXuFge4izA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QriUn4q3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F80C19425;
	Wed, 13 May 2026 22:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778710918;
	bh=AomMlh3FBAzOZjg8+K2ZaHOaztdMMkb6ZwNQ9IEXrdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QriUn4q3FFjwKSPPVxVeJeJknGiLs+XqqGLxxHSVMB/39bgNLYoEBeaDXUHI6z8rN
	 yQ+bcNa9Pc/AwWorALUOBCcmizWUVJMuVizI4cBezYB8BY40vLV7ky+wSuk7qM3tqb
	 I3AeM26oqeTSVB9lxBBQrTMvY0MjnZo0ujToaWIcUi94gULh1ng2W00oOVLqZGxYMu
	 gLL42mgFJ0qxjwG6BRPiM1Zcb4m3XTeLS5voJ1brCpkBIf+MDj1Rmq8EsUhj5fyo1J
	 +kPCo4NtjAfJxNAB5PLuhCebCLQhJwE/iHIMZE55b5JxHcW8boK3z8GuDUGtP5su+9
	 tQmjU9Xr2s4Qg==
Date: Wed, 13 May 2026 17:21:55 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: William Bright <william.bright@imd-tec.com>
Cc: linux-arm-msm@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: arm: qcom: Document IMDT QCS8550
 SBC/SoM
Message-ID: <177871091465.2047555.15648180450961057689.robh@kernel.org>
References: <20260507-imdt-qcs8550-sbc-rfc-v3-0-47d3d3372b33@imd-tec.com>
 <20260507-imdt-qcs8550-sbc-rfc-v3-2-47d3d3372b33@imd-tec.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507-imdt-qcs8550-sbc-rfc-v3-2-47d3d3372b33@imd-tec.com>
X-Rspamd-Queue-Id: 5AD9453B63E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107497-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,imd-tec.com:email]
X-Rspamd-Action: no action


On Thu, 07 May 2026 09:36:41 +0100, William Bright wrote:
> Document the IMDT QCS8550 SBC which consists of an IMDT QCS8550 SoM
> soldered onto an IMDT QCS8550 carrier board.
> 
> Signed-off-by: William Bright <william.bright@imd-tec.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


