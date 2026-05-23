Return-Path: <linux-arm-msm+bounces-109453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNc5D48PEWrDgwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:23:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D98CF5BC992
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B9715301F820
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 02:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1C933C1AD;
	Sat, 23 May 2026 02:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lA0aF4NE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDF433B6FB;
	Sat, 23 May 2026 02:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779502831; cv=none; b=FX+NDjMPkZ8UhUq+JPuOeUP/2M5jRhP3lo8nm15nlnnw1G0xJ6L7PC7XoWGaYKNCE8F2fjCu9QakXjcE/zHCKfCoJ1Z6G/+jig9Vudk4PbWk87eztodacMxJgSNmtF8dHifav2qBhIYIPpdJKu8Aav30a4Rn1CN6TzAUlQHtEos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779502831; c=relaxed/simple;
	bh=lzHLvfoBoij8mKdzn3elNK4spB8vtlT4BC2jr3P8Tgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nK8dZ3grA/2yMLt/z/LXiUv0m7AyQeucmG9bs9MoKQRd+8IRI2xnsXjL1KxbVXOSMrxV0XnHCqvv2W9r+wJ+CPWJXNh9SEqi1dQVWqPIXUAc3AyW1DTp6Vcyym3B1umG5MFOGRPbjKihF+sH9GqcEbAST0YQrDNT/0bkFOOMdFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lA0aF4NE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6CDA1F00A3A;
	Sat, 23 May 2026 02:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779502830;
	bh=KqlubUSAcgBl/Nhn6z8O4GteHUy5UexnhaLlZiLc4dc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lA0aF4NEp0ZY88DRXVmlTKz22KiVRDZgqFxcn7MCd7wLoy175bjdGk274huilg/nD
	 h3foL1vfP53fHBsPtPEOI9LoxF8sgkZmWD29aZbRYcd+CIcJtBUZxgM5bhgJmM31lo
	 kcrMpsqmYsRFNaHY8xoHbPK39FfVJ6HkuYWVFaNlx1y22Z95LfUoDMnbHCewiITuMs
	 vPJ9/iqM7nI47xlNnZ2Ph0oGq3q8tyPXRRlNPeDXw159qYqPxFOtM9hhF6hXZ30TSK
	 2v8AZfei+fP0T/I7VDGibfifdEij9RjRFqdbHZQrAQYCNHVfzoCRHUiimIu98TLWbn
	 bssJwWk0BH6cQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: mani@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] soc: qcom: ice: Fix the error code when 'qcom,ice' property is not found
Date: Fri, 22 May 2026 21:19:57 -0500
Message-ID: <177950280339.1097700.2447797771671056086.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260520155704.130803-1-manivannan.sadhasivam@oss.qualcomm.com>
References: <20260520155704.130803-1-manivannan.sadhasivam@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109453-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: D98CF5BC992
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 20 May 2026 21:27:04 +0530, Manivannan Sadhasivam wrote:
> When both 'ice' reg entry and 'qcom,ice' property are not found in DT, then
> it implies that ICE is not supported. So return -EOPNOTSUPP instead of
> -ENODEV to client drivers to specify ICE functionality is not supported.
> 
> 

Applied, thanks!

[1/1] soc: qcom: ice: Fix the error code when 'qcom,ice' property is not found
      commit: 462a85f9f887a4fef36550bb76c7f7d7a0fa296c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

