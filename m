Return-Path: <linux-arm-msm+bounces-118345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5ZSoImI1UWo8AwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 20:09:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB76E73D3C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 20:09:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NnZJCp5T;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118345-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118345-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6D875300D54F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 18:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DADAD37C0F6;
	Fri, 10 Jul 2026 18:07:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A404A37B012;
	Fri, 10 Jul 2026 18:07:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706839; cv=none; b=C6wYNHDEq3Pl9r7dlho4WSznCYi7DCPJrQFSSNHiHyPMj07LFe99bLEFxN5cNrfwVzj6QDfSJ+l5Ow2xDqtCATdGG6dFv/N0NEmyXNEPc8pZa0JxEuDHmN6f9zfzVZ7TaJeYObA4KdjxmnpSdJ7e7+wxwRsxqxyB/SNEuv+7ia0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706839; c=relaxed/simple;
	bh=OtkX6ASGW9e01cJh5zHqePef5qHIAj2Uvr9j5bUarmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e+OIvkBMLYKFDc6RkLbkVmL43/gmK0gUJrLK2wl5IK+gnoTIoAYa8Zo7UkI4M210uiK2r3fY+K8HPQYM1w1afYxL9FQgl5bqWkm2Id4LA8UQUKhz6gsp02c1y70g46rbofyywuDuRubURVSUhmVPdzfyBQmcSev0eAwzqH1Hwr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NnZJCp5T; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23971F000E9;
	Fri, 10 Jul 2026 18:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783706838;
	bh=KvfHhmaWu2O0Zfch96SYtl3PC99iZbwOdKodTrKyi9w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NnZJCp5Tu1eP/59Px3L/XsndcqnfPazSHZai/8ZrgR0D0C7sM1RAiuD3JK/TLqzZI
	 61bpwU9+GiamjGole3IXFMFAHHTuC6ny3q1uvbEPAUBl5nv9iammOI53QhJPtaRxLB
	 xwwJnmfDqYDeaoTLl/QQF+4vBHdF+7b4/t5Eqyc3rKKD7sF7q7Gl9By1cM16DeUIX2
	 tvfLCkVkFKIpFd+GyH/dHzw2ABLntCBLue/H9sKZSqODnwF8ff6OGhXS/ScvOG2cgp
	 /12Fl24dVO6WeQUb9jEGRly8vZ3ImnaivedokQgh8y9edsQHvC+QxPC3YEG9v8N62K
	 4PRhPbfnyaKfg==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
	Felix Gu <gu_0233@qq.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom_q6v5_adsp: Fix reference leak for device node
Date: Fri, 10 Jul 2026 13:07:02 -0500
Message-ID: <178370682974.2572738.5764391250838504715.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <tencent_EDC2253D3B1C22217E1259E07765D269100A@qq.com>
References: <tencent_EDC2253D3B1C22217E1259E07765D269100A@qq.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mathieu.poirier@linaro.org,m:quic_srivasam@quicinc.com,m:gu_0233@qq.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,quicinc.com,qq.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118345-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB76E73D3C9


On Fri, 16 Jan 2026 20:11:03 +0800, Felix Gu wrote:
> When calling of_parse_phandle_with_args(), the caller is responsible
> to call of_node_put() to release the reference of device node.
> In adsp_map_carveout, it does not release the reference.
> 
> 

Applied, thanks!

[1/1] remoteproc: qcom_q6v5_adsp: Fix reference leak for device node
      commit: 8c952807c2cebd5e9e9b37146c9383229794c129

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

