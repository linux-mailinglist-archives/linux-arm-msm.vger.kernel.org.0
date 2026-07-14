Return-Path: <linux-arm-msm+bounces-119091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ieugNdx0VmrJ5wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 19:41:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73922757911
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 19:41:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PJ+lC8nx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119091-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119091-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E7083033723
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 17:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34BE84156DB;
	Tue, 14 Jul 2026 17:38:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C655A4156CD;
	Tue, 14 Jul 2026 17:38:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784050725; cv=none; b=TmCqArMn352u88G4IBtMbZzwHC8xCg4kkJCakUz7DBAWy+VtVOJzJrMfbYTpyjI5EnqNq6tLjQuWUQOBr4B8jQ7BQdCehOyLttTe2yG7CaOO6kH7J5AJLuv8zqpupZFldLBvXiV23wEwo5F4DuKT4/8K//AqZN7/Ol8E5W09+FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784050725; c=relaxed/simple;
	bh=e6fTfbWKGo78Ygb08M1bsQu5ZF6BgDLi7YOQ6OM86Eg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i6/Npjt3c+vHxs/118R1nvWUOndI8sdM1RwnCVFAzKGF6pbVUcZq2YZkzNdQNqKrSrbhp91X1qj7pBwwWbIshcglpIvP4fNhXqz9icTYDSdmrGabH12WAHELHne2snyA080VrOOfbc+M7kaJlfmjelJmVQPqeAhYvj8ad8JvkBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PJ+lC8nx; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9246D1F00A3A;
	Tue, 14 Jul 2026 17:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784050723;
	bh=g3v01uZO4Oz40ilfrll/fmKXE/RowBk9CYi6/DwmjLE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PJ+lC8nx9aDHHcuCP2q5LSgiX5BJRlhzIls0SXa9c9W1uPFuvLFBNgomny2sj/cAC
	 8sIvJZhUQrbADsJp+aIrBBq36HmIZLq9qopFeI+j73fQt4ClI+qHcLY7BvpdtQSiTQ
	 gx8JKWUKVFLBqVZzL3XpT59kiMb/NLHyCqOYp7oyk4AggANqIjGzDpfRGEin7XpVab
	 +NRrvmyEas7cly9jiziQwK0PaLAHpmTpVcbEa5QcGiriFZZTEto8NQTa3WcGOYuwJ1
	 TnpuhgzRmVz4ae/QApdrBbOhNcXx7O0tksQhakgwhsXajfox7HQBr936LRbkLQie52
	 /eYGxRsKFLxNA==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bjorn.andersson@oss.qualcomm.com,
	chris.lew@oss.qualcomm.com,
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: Re: [PATCH] rpmsg: glink: fix deadlock in endpoint destroy during driver detach
Date: Tue, 14 Jul 2026 12:38:37 -0500
Message-ID: <178405071409.579772.15984341130781732036.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604-rpmsg-glink-fix-deadlock-destroy-ept-v1-1-b8a54ad1e4fd@oss.qualcomm.com>
References: <20260604-rpmsg-glink-fix-deadlock-destroy-ept-v1-1-b8a54ad1e4fd@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119091-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mathieu.poirier@linaro.org,m:vishnu.santhosh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:chris.lew@oss.qualcomm.com,m:deepak.singh@oss.qualcomm.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 73922757911


On Thu, 04 Jun 2026 14:12:53 +0530, Vishnu Santhosh wrote:
> During driver detach, the device core holds the device mutex throughout
> the driver's remove callback chain.  When the rpmsg endpoint is
> destroyed as part of that teardown, the GLINK endpoint destroy
> implementation attempts to unregister the underlying rpmsg device.
> That unregistration calls device_del(), which tries to re-acquire the
> same device mutex already held higher up the stack, causing rmmod to
> hang indefinitely.
> 
> [...]

Applied, thanks!

[1/1] rpmsg: glink: fix deadlock in endpoint destroy during driver detach
      commit: 5a5a48e788e02fd8a8eb7188ce440572d6c12418

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

