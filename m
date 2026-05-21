Return-Path: <linux-arm-msm+bounces-109142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QycII+hcD2oZJgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 21:28:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E80D95AB6EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 21:28:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8DAB302AD18
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 19:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14EB13A544E;
	Thu, 21 May 2026 19:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CqlA/7SK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E52C3947B8;
	Thu, 21 May 2026 19:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779391716; cv=none; b=uBicbd3k/IE8XU5vHj8ztEoYN1MmGesOH/txrHgTA/jLFeORUjI5mRhGWuK+yDQnLixiDB45Tf0WOSFYQeG9Ge5iOZuDJK6UqQckN2keV2QI2/nzTMgb0urKPRGKXsRoIPyVUql0JZoynx6Maq4XIHQwVMZrb1eDOUNwDUv289c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779391716; c=relaxed/simple;
	bh=NVI29elwQmaBbbrNPBhla2gPSxBvtx/gCkRjIbYaNKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cOPD0jg9YJwNYfMLVf9wpu0Lc4Ol476gfdXf3+YSnDHlO70NcSuBVZN2323tMPfNwsY12WhXloqNN8szBQp2mjpnN9NO/gMmu19lA1fZarhQSrhPffMret2WEAtnH3B2aB6e8q9aTQXraSm8W7CfBtlxr2stQP9aNPI84QqOVO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CqlA/7SK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC56E1F000E9;
	Thu, 21 May 2026 19:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779391714;
	bh=RSO7rtKGDgRNBEDE6tBZm6mRqKjk/GfamOJeQxnzsfk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CqlA/7SKCspjxW7wtqvfefVGF4XXExGRaS/ITlqW8vR7q5pfi5vnKYihwUi+1CRRU
	 DJMmuiehz/GsmxiJcs2eoZiAAS/3ccmcpiGJzyayO0PJIDU98TqvIMgPTcbEUKYk4c
	 rTlNTVEHeEWlDQUTua8d4zcOAIAsH3Az8X9y9SUq7/MDgqHEBHFpjb0ruDZuuBOuIB
	 M1JJNDWrp/uz5htayqlTm1GGBGrfDhhcn6R2fXvlnxbOIOUPay+doecyNJqmlce1u2
	 QecmhIm952s1nVrDVsVZqDhLxewRXd0KPgKjm36uMCHem7T4evQ7P4WPNeVhHqgVhW
	 05XR5EWtUHrLA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] soc: qcom: socinfo: Add SoC ID for SM7750
Date: Thu, 21 May 2026 14:28:24 -0500
Message-ID: <177939170557.182385.10193503667877414693.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260412-sm7550-id-v1-0-958a673ff791@pm.me>
References: <20260412-sm7550-id-v1-0-958a673ff791@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109142-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E80D95AB6EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sun, 12 Apr 2026 15:42:33 +0000, Alexander Koskovich wrote:
> Add the ID for the SM7750 which is a variant of Eliza, and found on the
> Nothing Phone (4a) Pro.
> 
> 

Applied, thanks!

[1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SM7750
      commit: 5073d284650a585dc2450d682ae0c0052b253ae4
[2/2] soc: qcom: socinfo: Add SoC ID for SM7750
      commit: d8eae83cefbc251f090b074b533616684e7b60cf

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

