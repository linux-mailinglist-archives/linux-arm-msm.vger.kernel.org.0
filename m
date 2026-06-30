Return-Path: <linux-arm-msm+bounces-115347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wDtOBB2PQ2p7bwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:40:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BC66E251A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:40:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=jEZxTv+l;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115347-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115347-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1487A30FA250
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C283EB10B;
	Tue, 30 Jun 2026 09:27:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60243E8325;
	Tue, 30 Jun 2026 09:27:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811662; cv=none; b=dM9kIkig5OWb6YpYl8UlDoXPwujCnTft3aUv99lRP72hiLDuunS9htldUFprQA/0FjLIGS2Afh/Ah9qSzTjFEKQ4WLLPp3plFiX2I9gQs4ee8QY3y4wQlRmqbRo0rIazqkMOdYscOjQG2TpMAJbtTR+Nab6+uLVo8YrPeRwXtWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811662; c=relaxed/simple;
	bh=BLYQJTRqy9dO94bkthH9kJKo8XqAj2Hb1ATJ6aKrsTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t+/jl0Hv0JTSTcZQLar6qMAK/1ahMXwG8R5Vx/TGHResRwNj5m4stSA9iFZ4YU9kRzXvQyaMG2kqg9shoE1dqzLhu/v0SFRkzR8pnTtCyIeAjWHG00HiJ8FJ0r+ROTI+Pjxd0suObPAH/Ojy+WaaJ5+gNaBluRcR0LaQYRAExtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jEZxTv+l; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B19491F000E9;
	Tue, 30 Jun 2026 09:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782811661;
	bh=ugwhfcxPpXyb5lcG6xT5ZSDZoRYaKnLUPCCn2ZRHAgo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jEZxTv+lThopYW4B4p4Egdjl9Ff05qgLMXCc7yPPquOYegVualcVPi498yst3PDxP
	 VUo4vKal+BiLimjB2Y/UE4e3fc31PFLI7b8hmuEh4PaAxYEHoLxo2/tdbatniu7UoJ
	 Q+462KE+FhEeIbXL7qak8IUGBwp4ox/Iisn6qKFsWqqWuzEHJIqtNUaBi1OnmwIjol
	 KZVPrXA1hqVCwVlK53/mYeWChGIQCLYc0JgJ/BUzEyCKBUFuOHi655wnZqqfkkg8v+
	 D+RnHs/mxMeKOCx5MCb64ziMXOeBIVTYpccGsBg2PfU/1N0l9QgQTk8MR3p8ROfB+w
	 Bj3o2I89MP96w==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	kernel@oss.qualcomm.com,
	Trilok Soni <trilok.soni@oss.qualcomm.com>,
	Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
Subject: Re: [PATCH v2] firmware: arm_ffa: Fix NULL dereference in ffa_partition_info_get()
Date: Tue, 30 Jun 2026 10:27:34 +0100
Message-ID: <178281163007.1093271.9754656642307066889.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617-ffa_partition_nullptr_fix-v2-1-bc801b4ce34c@oss.qualcomm.com>
References: <20260617-ffa_partition_nullptr_fix-v2-1-bc801b4ce34c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jens.wiklander@linaro.org,m:unnathi.chalicheemala@oss.qualcomm.com,m:sudeep.holla@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:kernel@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:satya.prabhala@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sudeep.holla@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-115347-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sudeep.holla@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 80BC66E251A

On Wed, 17 Jun 2026 16:35:00 -0700, Unnathi Chalicheemala wrote:
> ffa_partition_info_get() passes uuid_str directly to uuid_parse()
> without a NULL check. When a caller passes NULL, uuid_parse() ->
> __uuid_parse() -> uuid_is_valid() dereferences the pointer, causing
> a kernel panic:
> 
> Unable to handle kernel NULL pointer dereference at virtual address
> 0000000000000040
> pc : uuid_parse+0x40/0xac
> lr : ffa_partition_info_get+0x1c/0x94 [arm_ffa]
> 
> [...]

Applied to sudeep.holla/linux (for-next/ffa/fixes), thanks!

[1/1] firmware: arm_ffa: Fix NULL dereference in ffa_partition_info_get()
      https://git.kernel.org/sudeep.holla/c/8ae5f8e48366
-- 
Regards,
Sudeep


