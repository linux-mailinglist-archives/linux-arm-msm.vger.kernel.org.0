Return-Path: <linux-arm-msm+bounces-118347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jZUkD1s1UWo6AwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 20:09:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A410B73D3C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 20:09:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BKV2WcTv;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118347-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118347-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF845303D12F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 18:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33F937CD2E;
	Fri, 10 Jul 2026 18:07:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04CE37C0E1;
	Fri, 10 Jul 2026 18:07:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706842; cv=none; b=owXRJAgBuXs4YI7L0ZJnQj3mgIgPdwdNQhjpKZpAHZ7aw6oerVibTsJ7sUepyNTGW5+f0SzpsUTdcFjZnQ6PTnhIu6To1xHbtkh26IULYW0+t6CKySvLs7UBP97ZGm1owT9Sl5mAhvj4fX8BuffEpFaYiPDLZxoW1l+92x6LpAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706842; c=relaxed/simple;
	bh=tnw7FAdtaAybU6L4IAEPAISIrMlltfpeStH7YQBdL4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sWQzzkptznOgoQWzaFh6TZ2+3x5NxMt9S6xAYRwH+WYbh6t//lEK4U44zggv9NidU3sTdE0n6wbiai2xhFwykYOO0Xc3HBKTgVZPOupwMShJvkToWmu0EGK94YSuwlKEiMyDvKcfJT2NrW8xToP4JcqEsrupflujYpPANQiQ4jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BKV2WcTv; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5CE1F000E9;
	Fri, 10 Jul 2026 18:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783706841;
	bh=IDASqxy4pZTBIbj9QbK6E3ArCs4zatN5FPTCPmPK/3A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BKV2WcTvjwD1qc7gVRmSJNrvvJcJ7MUEoVRI820cOQdPqmoRPhU2pWGTAF1d0NLyy
	 QR5pTK+Siujr2NFWObyKM3LQ3C8BeCQWoDd8GxYpIlQZiTUzQVAGQbRjXkPzauhkqR
	 AvlxQ+mkFkvQwPclpZhzF+Q61y1njEMPraHSqIF4a43D8g4MjO775+SDEj5EHazw5Z
	 RIhUY1CQMr/ayXP8o5kqnsO+BaHEJNWgfqRgGgYcfxtZOc2OM3xVVT69b+WOUqJZZ8
	 A/ocsvAsX/Gyp0I4M/t2+e0DWaYcIQpvBrKK3Qnh6R0kkMeIPy6CCzNJSIBWVk3li0
	 xt5GeikEbB+AA==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] remoteproc: qcom_q6v5_mss: Fix MDM9607 subsystem control instance ID
Date: Fri, 10 Jul 2026 13:07:05 -0500
Message-ID: <178370682990.2572738.16410202237322359346.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-0-f59e728af621@linaro.org>
References: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-0-f59e728af621@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118347-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mathieu.poirier@linaro.org,m:stephan.gerhold@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:barnabas.czeman@mainlining.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A410B73D3C1


On Mon, 06 Jul 2026 17:37:15 +0200, Stephan Gerhold wrote:
> Currently, trying to shutdown the modem firmware on MDM9607 results in the
> following error:
> 
>   qcom-q6v5-mss 4080000.remoteproc: timeout waiting for ssctl service
> 
> This is because qcom_q6v5_mss defines the wrong instance ID for the QMI
> subsystem control service of the modem firmware. Make this configurable per
> platform and fix the issue by defining the correct ssctl_id for MDM9607.
> 
> [...]

Applied, thanks!

[1/2] remoteproc: qcom_q6v5_mss: Make ssctl_id configurable per platform
      commit: b19a43659ae4d34479ba2194961353827e659367
[2/2] remoteproc: qcom_q6v5_mss: Fix MDM9607 subsystem control instance ID
      commit: 4684c0491387814a2a7ebad55fc0f387dd4d4f69

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

