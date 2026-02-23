Return-Path: <linux-arm-msm+bounces-93654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KK7eJ4YsnGkKAgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 11:31:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9B6174EC4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 11:31:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2CB9E305FD57
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA87435C1AC;
	Mon, 23 Feb 2026 10:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QhbYLtTq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959A135BDCA;
	Mon, 23 Feb 2026 10:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771842352; cv=none; b=rVcDI2Ud8RXFfA8c+Deukxu5JeKAdR9T1o6cbyzJYN44ptXBtZvv4Kri4/D4r8nElbgIA5vJZvkyT1mNwwzoPLYbAcpEmeD+g4sFCneUGKlo1jOgDNNJCFwoEBVqscyZRYcfgHw1dfXmnIE8efm0yhPrBlhdJiln4iKRF44Q/g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771842352; c=relaxed/simple;
	bh=eOZvOyeMiUAyRxE8OxnmYiwJsq5EuJamUv57QzoABT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lwnbwMZgHojgTtDGuetgKUl3Z8sDQRx2OjW3DMT7gMhbZNbxS37UMjZM1I6pm3DXtIa+mtzUTuLuLdrv2CtwPoLixAxJT1l1qBo1kfmHBpEQ5ol4DqKzBBiNMKhRSG7PoWx5s82Xu4w+Yfkq4YVUfzcsb6UnZX3+UUzzuOv9uJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QhbYLtTq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE73C116C6;
	Mon, 23 Feb 2026 10:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771842352;
	bh=eOZvOyeMiUAyRxE8OxnmYiwJsq5EuJamUv57QzoABT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QhbYLtTqOn4ytpxhIiLvO6iPHP3IA/ZeqWGhZqRXHGHG86PqVQO3pso7B0arpJwWn
	 yTRHyrSVY2yepzWYNwOESCLdlQvwOYncpu4HU5rU5UnFMPfk76fjO+tstJoVMvXz0K
	 ty+SKHnvVFJTJ+DQnUU8OxFwcPs4Xlw/ZhC9qk+mwxjXD6fWk45O8JLV4j9TWfilqN
	 dr/iYeRKRMe7NlOAjp95zoLpEFGLZ77siI2xCzcCNhhmhgRnbYswzdAaQ3DztTHW3Q
	 z0rL3lVGVwhuGSvipGpuFlYwMaIOZk9izQdvAasa3Zxf3bbN3uo1cZKPwqnaNF7y38
	 X9MuX/bcUi76g==
Date: Mon, 23 Feb 2026 11:25:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Adam <adamp@posteo.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: add WIKO SAS
Message-ID: <20260223-literate-flamingo-of-reading-4deaa5@quoll>
References: <20260221-wiko-chuppito-v2-0-6336b1b12389@posteo.de>
 <20260221-wiko-chuppito-v2-1-6336b1b12389@posteo.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260221-wiko-chuppito-v2-1-6336b1b12389@posteo.de>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93654-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wiko.com:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1D9B6174EC4
X-Rspamd-Action: no action

On Sat, Feb 21, 2026 at 09:55:39PM +0100, Paul Adam wrote:
> Wiko is a french smartphone company: https://wiko.com

Everything in Chinese, so not that much French company. Also footer says
after translation:

Copyright =C2=A9 Wuke Terminal Technology (Dongguan) Co., Ltd.
The main body number of the record: Guangdong ICP No. 2022057930

so for sure not French.

Best regards,
Krzysztof


