Return-Path: <linux-arm-msm+bounces-109755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDKDG1JjFWo9UwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 11:09:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 118F15D309B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 11:09:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 09BEF3006448
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C2B3CFF6B;
	Tue, 26 May 2026 09:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sr4TK/H4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BAC356745;
	Tue, 26 May 2026 09:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779786575; cv=none; b=JuE9/HOMvJXlezxP9j3tion5om9OkRL11YUtDjLz1Pd8jeRQRA+ZDbt2R/nW+1Kx2PZE1NGNPn5XlFXnk+le7SXmjZSgjFBFrvGgEyhx2fAiNAWQSbCefqe8pj6OaqOhtI3Wrca6DlPAq9mlxBbyl1Iw8uhNhckP+w1xn6HawAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779786575; c=relaxed/simple;
	bh=8LusY6CJqo8B0HbL2qHzj5F9rCZk3nEy/GM32I00w/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/pRQ0DgK9l5R5B3BqUjYAjg4gmo1nKWbWF9p54Tayguu0j6cCYBVrTPdQVkrGamNW9KJzM3vnTR3QJzKAH4A8t3xJoqYCuUJMMS/3GsUt8a1g4aCmQTo/FcBQxVq1BjvlhSD/Hu5S4I5vjtjpSd6LAcQOAzynmbzdyMhi96u7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sr4TK/H4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560E61F000E9;
	Tue, 26 May 2026 09:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779786573;
	bh=FlSKCiNhqqL+XoMGkk6bTP77IH4btbThHUGNEBoTSgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sr4TK/H4THR9CHvd8DogA/JHdxvY7w3cnO+QiBAj/uKbdt553iSIiu9fSYvJrg73A
	 EDiOoeC/lgyE+1V6D8hWi1JIliEvxGp02r7bUQ2k1/4hCjPijCrg1Vx5JrQtBUspDx
	 xzJmmGnrvRFiaGddkSROxuqVR6ftWkZEQhlMWYoMGBnT1Ju2mBhdFTtsrCTMaAbvSB
	 bT7xFPa+rIIFKEvq7u3wtqEQV5zmGetsaiaE8SV4gPNKY4eW81E5C5tYzTKYmy8OAg
	 n7OVSNQJ1IMk0c/rPuqGNjOBECCPz2nAuCQy/zhF+HebHcDCdDH1HdF8Tb1HlkxsP9
	 PrPE1nimUfXJA==
Date: Tue, 26 May 2026 11:09:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: robh@kernel.org, srini@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	prasad.kumpatla@oss.qualcomm.com
Subject: Re: [PATCH V9 1/3] dt-bindings: soundwire: qcom: Increase max data
 ports to 17
Message-ID: <20260526-grateful-shiny-buffalo-159db1@quoll>
References: <20260523085511.2532669-1-sibi.sankar@oss.qualcomm.com>
 <20260523085511.2532669-2-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260523085511.2532669-2-sibi.sankar@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109755-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 118F15D309B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 23, 2026 at 02:25:09PM +0530, Sibi Sankar wrote:
> Bump the maxItems from 16 to 17 for all qcom,ports-* properties to
> accommodate SoundWire controllers v3.1.0 with 17 data ports.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---
>  .../bindings/soundwire/qcom,soundwire.yaml    | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

v3.1.0 is already listed there, so please provide in the commit msg the
name of the SoC which has 17 ports.

Best regards,
Krzysztof


