Return-Path: <linux-arm-msm+bounces-119090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Wjo4Gyd0Vmp55wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 19:38:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF46E75788C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 19:38:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="j5eH6/d/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119090-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119090-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 45D30303445E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 17:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F6B4156C6;
	Tue, 14 Jul 2026 17:38:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98784156CA;
	Tue, 14 Jul 2026 17:38:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784050724; cv=none; b=kVfkCn4B+42zrCBZ+nTDvx0NPmHGpHwBEuapPaS/BSHa12o3TMHUCgddGKg6gb/3lsSE0sdAry7XV0YOUfw63uDBewlCFGdZd4CSY9JetqN6Vei0t6R1L+K/Dxy93TTLTBD50iuQ36FYSoKR2D8loGqwGcEhXhbdOLtY99rGoN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784050724; c=relaxed/simple;
	bh=zlQ4hvLyjJrGJUqDvU2bRRy6UPS2rq+BC6SkHKiLDzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rXSEBvWuudYQ55EwK3thzamw9WAVFEO8rNZYWiFAJGp/77ve8TP14lpkZ/R2fplSX0WN22elL0Vf+IEtW2QtRXaVkhlR6QavnDQBxDqZKswcOW+a+GcxbI9QrJphagVBbdBp05oJAphcj38lc4EY9Y/ehdM4PvvxmTG90OKRLRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j5eH6/d/; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381941F000E9;
	Tue, 14 Jul 2026 17:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784050722;
	bh=fTSbvsyD1arNaZtplNUn+GJJgVbQsY+rgW72a3TM5kw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=j5eH6/d/ahxQUzjNwLjmS1amL2N9eb4Fm3wTJODEBmi+3Qwk/aZzwoIWo1DPlGO2x
	 0BUPu9MEXLveNRrc/Jd+9bBOpc8Q0jB8VaaSupVSR0v/6fl3AkVXbK2nUZWOLhS5Kb
	 r2I4PbShct32tHYwDCtO4NL/7bd2wG60UMlY5oazwBMleOCYhDUGLGfazuGhHs0v0A
	 Uih4vWyUnDRvocXqa8Yj4BzPp95F2zK2ZUB3zb9MK3wDlxYJj0tT22c/42lbbo233b
	 ZQa1p73jkZOOVbBbvTtnjlTRH1k8NHMdbvRTp9pE4/z7MilvLhZ+/y5PdM4atVLHO/
	 j7HPtRGN2cIag==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Arun Kumar Neelakantam <quic_aneela@quicinc.com>,
	Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	tony.truong@oss.qualcomm.com,
	chris.lew@oss.qualcomm.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] rpmsg: glink: smem: order FIFO read after availability check
Date: Tue, 14 Jul 2026 12:38:36 -0500
Message-ID: <178405071413.579772.309823663334721744.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260618-rpmsg-glink-smem-mb-v1-1-68a026453a69@oss.qualcomm.com>
References: <20260618-rpmsg-glink-smem-mb-v1-1-68a026453a69@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119090-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mathieu.poirier@linaro.org,m:quic_srichara@quicinc.com,m:quic_aneela@quicinc.com,m:chunkai.deng@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:tony.truong@oss.qualcomm.com,m:chris.lew@oss.qualcomm.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF46E75788C


On Thu, 18 Jun 2026 00:16:39 -0700, Chunkai Deng wrote:
> glink_smem_rx_peek() reads the RX FIFO payload after the caller has
> determined data is available via glink_smem_rx_avail(), which reads the
> remote-updated head index. A control dependency between the head read
> and the subsequent payload read does not order the two loads, so the
> CPU may speculatively read the FIFO before observing the head update
> and consume stale data the remote has not yet published.
> 
> [...]

Applied, thanks!

[1/1] rpmsg: glink: smem: order FIFO read after availability check
      commit: 786439ad58763e04b91bc2ec5f590e463939f197

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

