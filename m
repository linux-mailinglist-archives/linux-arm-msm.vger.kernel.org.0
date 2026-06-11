Return-Path: <linux-arm-msm+bounces-112565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N0vtFdcTKmpjiQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 03:48:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EA666DACE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 03:48:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CFAsMHyo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112565-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112565-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D8793025E59
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 01:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C2525A2DD;
	Thu, 11 Jun 2026 01:47:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E561EFF93;
	Thu, 11 Jun 2026 01:47:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781142473; cv=none; b=NUYAzAXfGcZK5k2E9esZl6b4H4wMYFbMcM5ch9N7ss69yeLZuYBJ1bigQ6CkrwQF63beuikKbxN8CU1hqYSHOuBn/n0y9R+j8RutCmBWpuj5DSIVS6CPAoIhgnLxmebOypzfCRY+vM0/T3x/vJda86Jnvb4akqnD9YMUWve0xHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781142473; c=relaxed/simple;
	bh=an5+Phs7WOHTvtkxyvMcWcU7I/voWjG0m+oVSgcSXHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uuzPsms5h+ukD14jVOyODdLAWtnFfaIf+Q2Wz+3CtDczoa7tPvMNHarSc6jMURtqiYUYXYa8u60T0nXQvY87MWENbDMEA/eix0FaFatoQ/+xlYZ2T/k/9/ARgtMUv+byjlDo4g95YBIi+JLOV9LHLAqFaUSEfl5vcb7LRoIOM44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CFAsMHyo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 360061F00898;
	Thu, 11 Jun 2026 01:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781142472;
	bh=Ze70WVRR86IRgbm0GMzr/QNM+abc0/lu74z148X5ohA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CFAsMHyo/QAX82e/t/fR8ubpLtrexPWfqJRiSf/2E1mMd6cE1vNyFZluPhxeBTzzR
	 vVSYktmSjw8YYtGpTaotyChQqSWQh0wV/hW/nrkSNORZoXPc6ePSVGuoSfsdqCbMfB
	 EwFPTTX+ve50IYSoY/hSnZe+XL6DGGxPPLL2PxSc65b24G5/j5gOJtPqG9OOpwSCWz
	 taNP2CuWWwmcTNezCDA4b+9094IjMMUeSxEF0J6NWB1IfN172KBKtqo5Mkm/MoOJu8
	 dg5CEpCQDfUPFUlHJVqgi/VZ36f1Zz53EOXqfnI+wVhYgzMRzIvpqIROvzFzkZog0D
	 5ZSo8S36rXz6w==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: Unify user-visible "Qualcomm" name
Date: Wed, 10 Jun 2026 20:47:41 -0500
Message-ID: <178114245718.590736.6428568100226874946.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260422083334.84294-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260422083334.84294-2-krzysztof.kozlowski@oss.qualcomm.com>
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
	FORGED_RECIPIENTS(0.00)[m:mathieu.poirier@linaro.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-112565-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 12EA666DACE


On Wed, 22 Apr 2026 10:33:35 +0200, Krzysztof Kozlowski wrote:
> Various names for Qualcomm as a company are used in user-visible config
> options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
> "Qualcomm" so it will be easier for users to identify the options when
> for example running menuconfig.
> 
> 

Applied, thanks!

[1/1] remoteproc: qcom: Unify user-visible "Qualcomm" name
      commit: 955e3852ad4fb65effbe1064d9f967964d6ee542

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

