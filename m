Return-Path: <linux-arm-msm+bounces-116131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GpTmGiP4Rmo7gAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 01:45:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D98F6FD785
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 01:45:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OahQA7gu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116131-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116131-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 99E9330C7054
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 23:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 045063F0A96;
	Thu,  2 Jul 2026 23:41:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95703EDE53;
	Thu,  2 Jul 2026 23:41:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783035662; cv=none; b=R8zSuCCUpsxeesywVjXQ8zMzmK3q0UHabB1OKMzpYtuRAa9/hbyYNLxB8mNSzHwIUhLCLxIjF365Vdy1GWgOlJHToI9qOp2HN3oEMkqa00F/dXQMx2bIkcx9wwnba9j0eMhDqsbUhfKRlxLkrkh2qrun0VI/d7Vd4l41dwCZOrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783035662; c=relaxed/simple;
	bh=XxteojyFwwF4j7J0F7NDLRbUxClKe6mXawmgLnEHNfM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sdUn4NFTXfmVBl9sfuOOS5H9U37zXvzJmIQyMkh1LMOm8AhrUJIxWosLepCdMUgqS6ZDIAzgJIV9LxpWR7JTuwgR1FaUYoO1e2uKnVpv2e3XLAusuTHlc1HEKZ9E/THP2wtIJRkj0e/6wDSRIYovtoFHLIOvMAmXV/VtdA5iaG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OahQA7gu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6611F00A3D;
	Thu,  2 Jul 2026 23:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783035661;
	bh=K+RtSXSo6fWjxn6tsOkTpmWGW4ErWVcLn2QpGf/xTZI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=OahQA7guCYcdqYDGFMh3ErRuWb68Weqn13IHwV5du/2+FOtQkQf5WYjbKQRAlfiB0
	 bdLy5lmePcSWnAgErzx51OoldOhKmqmPtxa6zzCwrQKN9YmMi588CPTG9j71hjcGcn
	 6L3Y/SYFulNLc/vv2B+QP7SDUdV0qVn2fUqYGvGy8jSMRgnk07e985JgFcSYGm7dzn
	 ZThPfdK/anbXfeGlOkOgC2hnbeQ5dQG+QFi5c+NpTPjPqKbS9P7S+AX6tPGBH6Or90
	 Y8SAE3lG7D7SrNqWrL2Z5/QULZNnobWJHZk3IR8D1zGbCTbgbxkBuoIDiTyQDA7Q5l
	 MD4vMdT9KWzSw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: Unify user-visible "Qualcomm" name
Date: Thu,  2 Jul 2026 18:40:36 -0500
Message-ID: <178303563657.359079.11604992169073511299.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260422083330.84247-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260422083330.84247-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116131-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D98F6FD785


On Wed, 22 Apr 2026 10:33:31 +0200, Krzysztof Kozlowski wrote:
> Various names for Qualcomm as a company are used in user-visible config
> options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
> "Qualcomm" so it will be easier for users to identify the options when
> for example running menuconfig.
> 
> 

Applied, thanks!

[1/1] soc: qcom: Unify user-visible "Qualcomm" name
      commit: 9706c38004ca3a760cc6c6baee24648892526875

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

