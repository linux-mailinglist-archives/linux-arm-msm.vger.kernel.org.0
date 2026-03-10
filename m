Return-Path: <linux-arm-msm+bounces-96523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EJzD1XMr2nWcAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:46:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CB8246961
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:46:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F1063049473
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 07:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194BA31CA4E;
	Tue, 10 Mar 2026 07:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DFub48VZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB7A3E9597;
	Tue, 10 Mar 2026 07:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773128701; cv=none; b=QPNozWTZXjtzsamxztoDA/uatytIIbZMI1+i+MC3pic7oaQ2SFtxdPVfjwTQfOKJYTzQ6OyLplIFn+wCxlQ3FY1tGSfvIwwYd39t9d69fQubmFNCn5w4etFaZmKNaHIlvinRKEGwekA+JbCbybQixPdmzduLP/r/ing1VUTDPv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773128701; c=relaxed/simple;
	bh=14+B0q+DaWJW6o/my67KajMAOoHWePmWrNJ2DJQL25Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZT7DNRAjcNPCHIC96w9ajYYJm2OqpPsnd0T8TQ/SGHI6vZFnpbPKsjxjrMgqz1YglV5/I4PPXoL7cjZBjj+n1pPX3LpI3URIroiUbNIqnzQVSkTdpIPwS8B27FSzRWC6U7Bzj/Eq2GO/rNi4WGODHI8oBTIread61+1ziGQIGQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DFub48VZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 331D9C19423;
	Tue, 10 Mar 2026 07:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773128700;
	bh=14+B0q+DaWJW6o/my67KajMAOoHWePmWrNJ2DJQL25Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DFub48VZxJtW6ZkNuY8VeArYfRckDC1hK+/nxqo02IIvLe+8uYE5F4+H/fEgL5Tzv
	 ksNyZOSsdg4fRsrQ0l+yH5jZLSfcbavPtjkODJszrX5r4SSWnTYsqwoJp/OcX2tz5i
	 14kdDiNOuBjZBPXF2u59Tbqt9cVpDUeFMfpxR0M2pqfMNL8UrUMnpkHGek9VeM0jTm
	 SQ5eQxY05gJiffmGc2VrR4fbBJxH5BLQLlEHvNqHW4Ct/t/VirXKahbd//pvxctXI5
	 9qFhfsrdOGzWhIuJMZKoLukm1SC3PJq2nGWuZvsW2RhS1dfuFhWw+96B3YFGBKCgiA
	 UxywlRMwgAP5w==
Date: Tue, 10 Mar 2026 08:44:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mohammad.rafi.shaik@oss.qualcomm.com, 
	linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mailingradian@gmail.com
Subject: Re: [PATCH v5 06/13] ASoC: dt-bindings: qcom: add LPASS LPI MI2S dai
 ids
Message-ID: <20260310-new-artichoke-asp-6b5412@quoll>
References: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260309065137.949053-7-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260309065137.949053-7-srinivas.kandagatla@oss.qualcomm.com>
X-Rspamd-Queue-Id: 97CB8246961
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96523-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 06:51:30AM +0000, Srinivas Kandagatla wrote:
> Add new dai ids entries for LPASS LPI MI2S and SENARY MI2S audio lines.
> 
> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../bindings/sound/qcom,q6dsp-lpass-ports.yaml       |  5 ++++-
>  include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h   | 12 ++++++++++++
>  2 files changed, 16 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


