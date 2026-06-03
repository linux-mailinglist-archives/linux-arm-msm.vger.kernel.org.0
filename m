Return-Path: <linux-arm-msm+bounces-110884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Dcx6LBSAH2oPmgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 03:15:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B136335BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 03:15:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=RV4vrlzQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110884-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110884-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B9C02301F80B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 01:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDE7A23EAB3;
	Wed,  3 Jun 2026 01:14:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69CF15B135
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 01:14:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780449298; cv=none; b=l5g+Gy7jVhoPkSFGvZHCEz/HT3B+wORyga8SvOq4arhbelTKkSY8Mem+q51qAwSVl9E1UFQ2zA9I4BB/1VMBzCA8LnGTBsHOouDKIDlvvuCuXAt4XPP6imPmqzP+AFWY+vsmHZasWHka1JSWQ6YDVTR+6q7P3hY4LeGz3EBttKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780449298; c=relaxed/simple;
	bh=JajzC6TZGTUiuxzIpeyJ0dRVDu5lvb+jhTk+EFO1NlI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HLPEVkVaMAP/HBC75uuMhqOU5JQbq9gqpoqegzupw5umfyrjvIkAWrQos2nEISUKjmIqiBglpXcScxbyKKV3+i0expIruEHtyCu4KSpKlgvdXQVNTOZFT8bMK/tLT3s2xaMzuqdioik4d50fow3RecqqIgYF9leHSIEDOn2F3/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RV4vrlzQ; arc=none smtp.client-ip=209.85.216.53
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36bdb11bf8bso2508384a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 18:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780449297; x=1781054097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2BHlDhO4W0HN654OiftpkbBAK4xn2LgOoUicfv6wG0=;
        b=RV4vrlzQSh3oz4TKIv6nhej0z9MBYG88oEVmR7XzmZ0n+I5ATCpoVzNmfVy0cA3vfF
         /x+1JllyEiD6Cq+o5kHwJd8R1e9bZ9VX09+FyEWrWnHS8Ou4bT6oAkGL76XMf931VNLE
         NGZUGeaGdAIQJmAwuXTrQQIiiFbAupu7bGJ4mHxcnN3R8XhOQYHAm2WrENbX4BNTikNH
         56l9kG0nWrOkTb4SIlPrMiPMiqP1+5BtpGOwSvNfc2feQSz/ScWC0fOINIw6uipdgbM5
         yBk0YRSlxV5WYmuvQzde0jx7i/x/VEp4c806PBxWQpZitIFrXsTcq4kDX8khPsu2qE0x
         Tlaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780449297; x=1781054097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k2BHlDhO4W0HN654OiftpkbBAK4xn2LgOoUicfv6wG0=;
        b=q0x/u1Gos8X5a+UO0ristIl4ibYMCGCC9CGRWFw5upAIC/spXGpT8g0+G84jmgkfZG
         2q4+aMh3JkI/kTUsyCciUy0GNQeUbVbbEOxpGWvauZ/NuHJ7J5kVhrvFIYgiBI+SWVS2
         PmQ1zFZ7uVrGDEsOej/clurPiuPj6EXpSDocElfsDGu3pQUEEi5MhYQr2kgYijdnIV2n
         uK/XUGN4JtX4F7tnnOpolm03if3sA8aGhHbgV3cKwClmm0Kp9mZUa052s4W42RO83izt
         8xUhn56a2uTQxbyKJ6TB1zWdmMq9sEvuUdbZNcO4iQtb/VN9gJxUvLOvHoivlLSWbSYu
         wBZA==
X-Gm-Message-State: AOJu0Yw8w0LqwoqF0OHcNK4RF4+x4Y/k/wg4UwBS0eBwM999EzVPnkL6
	ZQpoHp7YUNREYsaTP1zdtNodaH/WOdDWCth0lW6CLVWo7Xxjkdg+Iiuy3QVld9l2
X-Gm-Gg: Acq92OFhkweq6Jb1YDGiGJd75SSTcI8OtsUaFn2CcOG+cPRGCI4sKo8853jQfRFMhEd
	dbZsb/7+a1P4t5J8t7U0PGGe8+U6vvWIjmcIRhv7p96yTSUewbsvzIVEaz7RpOvTCN6FbpOTgTD
	hufnvZrZ6RSpAGBP7xNcl7iNomUHMJFwSTEQHaE7DN89arFcAW9xI8+I1Z1oHIrEIzt4eFN++Kh
	9xlIp/Dz7JnCrhOjtpyslmL1pRWad1CecayWjUE8ykf24r14kz3hUd1z3r/IAMsx8ikYERXVt67
	w4xZgxAiijNnteKlYnm97kySlB0OCI3Xtq222eNyPeFnWb2qGG7DXjJQvw7GkVHWSVJ0kgeMJVv
	0sed3lyY7vjyKxvbmLL1w/0k2NfzJbpiTExifH46TMYomjJEzGBazdhGLGyRP+F32/gfkB4Kxpg
	3rP7ujfPRVt44CLwkN0M4q9rwUckhHZlGPTuaJFYboIQYfO2ELmaVnow==
X-Received: by 2002:a17:90a:e706:b0:36d:b818:f848 with SMTP id 98e67ed59e1d1-36e2eede3e3mr1315342a91.5.1780449296991;
        Tue, 02 Jun 2026 18:14:56 -0700 (PDT)
Received: from BNE-CLN-QCAO.digi.com ([159.196.14.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd90548dfsm4866590a91.0.2026.06.02.18.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 18:14:56 -0700 (PDT)
From: Qingtao Cao <qingtao.cao.au@gmail.com>
To: mani@kernel.org,
	kees@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	mhi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Qingtao Cao <qingtao.cao.au@gmail.com>,
	Vivek Pernamitta <quic_vpernami@quicinc.com>,
	Qingtao Cao <qcao@digi.com>
Subject: [v1 PATCH 1/1] bus: mhi: core: fix sys error handling latency
Date: Wed,  3 Jun 2026 11:06:11 +1000
Message-ID: <20260603011333.3306102-2-qingtao.cao.au@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603011333.3306102-1-qingtao.cao.au@gmail.com>
References: <20260603011333.3306102-1-qingtao.cao.au@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com,quicinc.com,digi.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-110884-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:kees@kernel.org,m:linux-arm-msm@vger.kernel.org,m:mhi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:qingtao.cao.au@gmail.com,m:quic_vpernami@quicinc.com,m:qcao@digi.com,m:qingtaocaoau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[qingtaocaoau@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qingtaocaoau@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 53B136335BD

Bring forward the idea to fix the power down latency in
mhi_pm_disable_transition() further to mhi_pm_sys_error_transition()
so that the transition into system error (triggered by AT!RESET)
won't have to return only after the timeout of up to 24 seconds

Signed-off-by: Qingtao Cao <qingtao.cao.au@gmail.com>
---
 drivers/bus/mhi/host/pm.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
index f799503c8f36..9d29f1591a45 100644
--- a/drivers/bus/mhi/host/pm.c
+++ b/drivers/bus/mhi/host/pm.c
@@ -651,21 +651,13 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
 
 	/* Trigger MHI RESET so that the device will not access host memory */
 	if (reset_device) {
-		u32 in_reset = -1;
-		unsigned long timeout = msecs_to_jiffies(mhi_cntrl->timeout_ms);
-
 		dev_dbg(dev, "Triggering MHI Reset in device\n");
 		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
 
 		/* Wait for the reset bit to be cleared by the device */
-		ret = wait_event_timeout(mhi_cntrl->state_event,
-					 mhi_read_reg_field(mhi_cntrl,
-							    mhi_cntrl->regs,
-							    MHICTRL,
-							    MHICTRL_RESET_MASK,
-							    &in_reset) ||
-					!in_reset, timeout);
-		if (!ret || in_reset) {
+		ret = mhi_poll_reg_field(mhi_cntrl, mhi_cntrl->regs, MHICTRL,
+				 MHICTRL_RESET_MASK, 0, 25000, mhi_cntrl->timeout_ms);
+		if (ret) {
 			dev_err(dev, "Device failed to exit MHI Reset state\n");
 			write_lock_irq(&mhi_cntrl->pm_lock);
 			cur_state = mhi_tryset_pm_state(mhi_cntrl,
-- 
2.43.0


