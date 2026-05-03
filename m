Return-Path: <linux-arm-msm+bounces-105598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIXNLmZB92l7dwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 14:36:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D244B5CEF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 14:36:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C58F33005394
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 May 2026 12:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369C83B7B76;
	Sun,  3 May 2026 12:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNYuabM6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C733B6343;
	Sun,  3 May 2026 12:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777811812; cv=none; b=s6hulUcQlBpj5m/673K2UudT0N7yA2puO1MMhqv3RLyHGi5haiAynRGcomdOpE60T6AJDB08GDRCLz9d/++6Xoc0UkMklYLluHW/ju/lxNrN7CMIZuIauoTvkILs75lSvnmRZ1slJbyTjdt8W66aGRbzqHlDSiE3Z7JeouNz2EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777811812; c=relaxed/simple;
	bh=RTD5YGB88KLOQTR+WJyATg3R1brE0ypLanO4eqtDI3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mozqg6VH+qgex8y0A1f6JHzAgXJ0dGm5rQE5p6dGbMeoqEk/vBbrqsMyPhADAXRWXMCfRRVlk+1qgmAeSdZCAUdob1ATkCgN0bL/N+tZR8c0auxsVgOhjzQTiRMBzUHmzZO0hlKjCDULDIR3INpywIR7/UvH/5uh/4JWFWFlSws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNYuabM6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 266ECC2BCB4;
	Sun,  3 May 2026 12:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777811811;
	bh=RTD5YGB88KLOQTR+WJyATg3R1brE0ypLanO4eqtDI3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TNYuabM61jEu8qpv2g7NW9QFm3rIlmX8PuEO0e9U0yNt0j9xtQCYrUanrnTfK02Ps
	 +VfGJj1ZO2UoZyl5kdcVih2T1wZk0UONMEXByvn31YYCx2BHCd+WVULGco3Q3Kfa9l
	 BGKZx6SSH3xl+6889PMwaZ93wCULI8/uIfPhYv5SvmhB0NYvjXXoxugtJOoR6NfRGp
	 KtlLm1KPZ9opdUWOSlaRsZTgILlGmpcUtLbiJUYoa2bBpVtCsJjr9FF3L3M/G+xa1m
	 2bocJBwW8l1dPWvQWUmeEE3MwTX2v0igXpBHvhot/7LCUsW7UpgdeH23RlFVZM7sEU
	 rck5ONZwBgm2A==
Date: Sun, 3 May 2026 14:36:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Georgi Djakov <djakov@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Mike Tipton <mike.tipton@oss.qualcomm.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: clock: qcom,milos-camcc: Document
 interconnect path
Message-ID: <20260503-mature-impala-of-rain-4b3dee@quoll>
References: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
 <20260501-milos-camcc-icc-v2-2-bb83c1256cc3@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501-milos-camcc-icc-v2-2-bb83c1256cc3@fairphone.com>
X-Rspamd-Queue-Id: 33D244B5CEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105598-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Fri, May 01, 2026 at 11:18:30AM +0200, Luca Weiss wrote:
> Document an interconnect path for camcc which needs to be enabled so
> that the CAMSS_TOP_GDSC power domain can turn on successfully.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


