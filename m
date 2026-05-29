Return-Path: <linux-arm-msm+bounces-110210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLoTL8brGGpnowgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 03:28:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBCE5FC057
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 03:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 086F9301224A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 01:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5648930F55F;
	Fri, 29 May 2026 01:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YCaq+h9Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E50719067C;
	Fri, 29 May 2026 01:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780018096; cv=none; b=c0M0iuk9fY6IZsM3o2elOnG4rjqvUeFueRGblQ3Zp815R9zqnzWKHVBy9RNA2WWJSJif4J1EktYhhnA3zYTml1hx+T8AXYeALQqZVHaPxkep6lDx8L7NIdnpODrgfm2BgvhC+O8JEets1QhF0pvzW9M1y7qqjhwhiiuj4DizRdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780018096; c=relaxed/simple;
	bh=577YCxBQyijttrD/GDDpiPNAegNNoIYy/0sCwpR697Q=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Ycubk4bLfZ2ZiaqTMOQ3J9s+0PawVVJ0Ngz/ezIdZnAQnIqAdKznAJiymh4U+hS62u/YJHcTPYFaRF4A3vshRLemTlOPIJIDW8ElJzB0Y1EAMrP+G76FtCbRCW9M5tcO6n07rbGFZovtHRcZkXVMIl0WvpvYNrvXtfXzpj9ra/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YCaq+h9Q; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC621F00A3A;
	Fri, 29 May 2026 01:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780018095;
	bh=577YCxBQyijttrD/GDDpiPNAegNNoIYy/0sCwpR697Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=YCaq+h9QYgsif34iSCrdrUxFZ7HWypSjWzMi/+Y2uOHUybgK+tv4rrtHcJN5NJLwA
	 9n59vRcZVsIvK5XNv6RBD33zE3xsihareiZb1++jNozMgrLXxSb5nsCd6Co5I753zK
	 0qOuQOa71NrZwvcgdIFtuuWX0GzGVu/u+fYI+cKlIAZkDJAk+2s6LoFhtsKpHFmRoW
	 EXLuKva+syrO4i/Tm17xluOg226BTHcLp69k+YS0HzGwC2JSsBFhuU0HNf4yqHVTV2
	 QMJdaCKci1DCYmE8OzMFvQzQAtxvSHzCoMF68Im0jd8VxhM+0IKkS/DcsAoTM2YaEg
	 aWXTdMecL42rg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260419-hawi-spmi-v3-1-b04ee909cb87@oss.qualcomm.com>
References: <20260419-hawi-spmi-v3-0-b04ee909cb87@oss.qualcomm.com> <20260419-hawi-spmi-v3-1-b04ee909cb87@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: spmi: glymur-spmi-pmic-arb: Add compatible for Qualcomm Hawi SoC
From: Stephen Boyd <sboyd@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, David Collins <david.collins@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel@oss.qualcomm.com, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
To: Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Fenglin Wu <fenglin.wu@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Date: Thu, 28 May 2026 18:28:13 -0700
Message-ID: <178001809324.7182.13624403441092934995@lazor>
User-Agent: alot/0.12
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110210-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sboyd@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 5CBCE5FC057
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Quoting Fenglin Wu (2026-04-19 19:25:52)
> The PMIC arbiter in the Qualcomm Hawi SoC is version v8.5, which
> introduces parity and CRC checks for data received from the PMIC,
> as well as NACK checks for command sequences except for read.
> All other features in PMIC arbiter remain the same as the one in
> the Qualcomm Glymur SoC, with the only differences being some
> additional error status checks.
>=20
> Therefore, add a string for "qcom,hawi-spmi-pmic-arb" as a compatible
> entry for "qcom,glymur-spmi-pmic-arb".
>=20
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---

Applied to spmi-next

