Return-Path: <linux-arm-msm+bounces-98582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPetCWBku2lVjgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:50:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CD22C525B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:50:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CB5E31CE241
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 02:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006D138945D;
	Thu, 19 Mar 2026 02:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ROEkQuzK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC6638945A;
	Thu, 19 Mar 2026 02:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773888428; cv=none; b=n0Kl2cFYtToURpg6remAFtBI9RTQOpHNzGNbZbsCU3qkxQNHTFssHOrzGFZhPRnFNJcy0euUKZtANcFbGqU/vvul6Byx0AN2V87ar5zv4zdlMpYvjE9UVqAl0ZoPc0z897GWNZoVaTFhqDW+Pk+3+GWQYcGUiV6Brp2S03lejR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773888428; c=relaxed/simple;
	bh=Fln3qYyCptT9Fc5dSOUoOr0n68ifjBHJeeobNUxe9hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gDuzmIacwik5QSIBc2zCDz/dJPIZVTy/qxmOWY18kJ25/HacOFgDWJOPOwItJLmh/rBRwDxE06MJg4LMpvPaclzFhLYZLTrt29KFOzA/b/lM9mcuRGVH9EIDk8hSMs6cqr59kiYt5vlBK1Wo/a0Sb4BXPMcqd/5TByYvIlff7so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ROEkQuzK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3073C19421;
	Thu, 19 Mar 2026 02:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773888428;
	bh=Fln3qYyCptT9Fc5dSOUoOr0n68ifjBHJeeobNUxe9hc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ROEkQuzK0Kbiqnd9kzmaRY/zkeGZgZ8Z/z8m+jZZZzfmmWOCvnL7JSI610uuxb50O
	 w031YlyIyO41kq3R7p8FhX5VL9UzW3Oef23mLm+jGgM9KtX96KQwdd5JCc9FhbtwgL
	 HO0e2KvyBedcdFMaUhoy6TfvoKF58r6DjRQ9KJS/Qk8T/miYMlw0MxvquJEmls1Myw
	 QhCAmjXsq1Q4mVYPTzQjd467qXQ9idQxlx1218slFLu5M84g0WeColA2wEmEj63fvr
	 sO40678NDRB4bUuQCgR3yp1U8gQKOLxtRad0ePuCgb97ea0Gj6fSJma4PCwz90r/sA
	 IRmi42+5ceZsw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] Front camera enablement on Fairphone 5
Date: Wed, 18 Mar 2026 21:46:47 -0500
Message-ID: <177388840386.11529.14159549325064762681.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313-fp5-s5kjn1-v1-0-fa4f1c727318@fairphone.com>
References: <20260313-fp5-s5kjn1-v1-0-fa4f1c727318@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98582-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 93CD22C525B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 13 Mar 2026 17:00:37 +0100, Luca Weiss wrote:
> Since the Samsung S5KJN1 driver was upstreamed recently, we can enable
> the camera upstream by adding a few bits to dts.
> 
> 

Applied, thanks!

[3/3] arm64: defconfig: Enable S5KJN1 camera sensor
      commit: 48847fea51194edeff7f475f8decba9b2ea95800

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

