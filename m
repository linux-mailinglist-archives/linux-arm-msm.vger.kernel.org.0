Return-Path: <linux-arm-msm+bounces-118349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EsE9AcI1UWpNAwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 20:11:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 940BD73D3F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 20:11:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NBrCvt+5;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118349-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118349-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D2813058E9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 18:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0622B37FF47;
	Fri, 10 Jul 2026 18:07:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECD3233D9E;
	Fri, 10 Jul 2026 18:07:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706846; cv=none; b=DPbirMRPd0EfFxypeOUIntThSU6SkOICV/IlxwWX5f93+knZRyFgWUuA1I/wS6RXd1lc3C4ZUJnLiHBljFqnCQMHgQOHsvwqBHpO55IL7ZIR28FwtnBuHoFfg6bvILMOpJtM5yxRqkypvZEYKKSK5cAWo4wZ15fJbXD88OW2oaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706846; c=relaxed/simple;
	bh=w1oOzUgiUQPXYy3SofXoxAqDEEtFQFAe7W79zy10r+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qiXAlP9F0YqqqWNNdci0E6W7n7pmHb1NPq+iCC+WowTm3+Vsrh1O3RaQaHFDMw6NHdFcb+vamVeHfeYcaVqkpYjoQ4R7kkuSVGF0yv3BN/5DLWk9dtEoSouiHFuJtxXymIokCs2rr04OleYfRCWyOXARTp/L2eXFDu8VJSkSjw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NBrCvt+5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA1E1F00A3A;
	Fri, 10 Jul 2026 18:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783706844;
	bh=v4hTSXpz/g4Rq0ck6FVl5vTd241lb/PScfMRg3d8FFE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NBrCvt+5Iiv/2AFmV2+KxKbGxBkl0TrZhENKAqZuvHQr4viJRJhw+sALCWO8sQl37
	 1aHf+PSaYMsqddi2tQ5HMMpI0ONt7x+hXcbiys2VyCyNYJkdXeNQeIsKs6sfmajaKq
	 wwkdqT96AWw4804JCwSCU60BOtuDhc4toaSdSSMOrh+B3NotMRyqo+9GSkq1MOHQvd
	 J1QiXcHPm1Wo536VvBl7XwenYOIvis6XLBlK7xwMtapBFQ1tLM1Xp+e1t3lWh4Rwvq
	 9FruilzvirTwngNeFKyZxxEtvcIao4lDwTvpkV4x/EcYMjKqIYPsBboZsXjJjjuwai
	 wcGyDC+KOWxmQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	deepak.singh@oss.qualcomm.com,
	chris.lew@oss.qualcomm.com,
	Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
Subject: Re: [PATCH] rpmsg: glink: Replace strcpy() with strscpy()
Date: Fri, 10 Jul 2026 13:07:09 -0500
Message-ID: <178370682976.2572738.17769908949059020506.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20251211-rpmsg-glink-strcpy-replace-v1-1-be06308e5724@oss.qualcomm.com>
References: <20251211-rpmsg-glink-strcpy-replace-v1-1-be06308e5724@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118349-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mathieu.poirier@linaro.org,m:deepak.singh@oss.qualcomm.com,m:chris.lew@oss.qualcomm.com,m:vishnu.santhosh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:quic_sudeepgo@quicinc.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 940BD73D3F6


On Thu, 11 Dec 2025 14:18:34 +0530, Vishnu Santhosh wrote:
> Replace strcpy() with the safer strscpy() to address unsafe API
> usage warnings[1] from static analysis tools, as strcpy() performs
> no bounds checking on the destination buffer.
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy
> 
> 
> [...]

Applied, thanks!

[1/1] rpmsg: glink: Replace strcpy() with strscpy()
      commit: ad6d7795388dbfc8a4c8980b49ad43648b1d6efe

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

