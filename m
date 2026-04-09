Return-Path: <linux-arm-msm+bounces-102430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FerKfJf12noNAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:14:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB613C7989
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8BB6E3035A78
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 08:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E83603A0B2E;
	Thu,  9 Apr 2026 08:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ai5YDOxS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E95397E81
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 08:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775722421; cv=none; b=dfEo0F5gn0doKQ5RHoF1OO+yTruhEXInk5IiPaXHvfnKGjts3RHiooDkfzVIPt4ojn73jN5cupNO+VIaGrFOvfRiiQlIMeFBtJi3jdq+idI4ODWjHjAGtf6WzmWjqApXWoCI2ZZ2OZV9ccWvUZ7E/cN6VvoMx8GMX+AtUGBD1q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775722421; c=relaxed/simple;
	bh=zVpeYCI0Fp2z5aqjv7cM/PPua39ANpiE2GE9IcuZhfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Akw8q1SU8w7XYJLIRDExXpYPFMGTO1ZVuGdmubSFCofIarvBX5vwn/3zb5rW0YLCpBcIjHD/KqVPWJ52xHHG1ocjVAT9U0iy2hdFbkWW+Ss0LEShaTknFdJRFiNnEHsSd0ze0FFSwwr9t1VOGMxSbsMC3f2VQi0sAMr8E43my6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ai5YDOxS; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-67010289b73so800851a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 01:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775722417; x=1776327217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLl5gC/5dARZUSktr9tifAs18EiDAxNQou2h9Hd7lWo=;
        b=ai5YDOxSESAibjjoqzj6vwacxgrGcmaoMS+m6WTTP3fBMt1V6SUwKsX/VYPRX1DSgh
         klERBGmCt7CbrW31GnumjfHp7x289kiwrHAl2k/gBu3ZcTpGXpN48gp3kOElQ4KmuGmD
         S2s66IQ+3qNSUD33WG4dX6VX9vfpDy3YfnM1gfxN62mprd5JL7jKLLGmYnFpyVKhNIun
         fuC2e69sFBUxBCERLQ0btgVfSyWlPin+SC+X8IWDqd2HeRjC+B5JCwiEhDQta3WQ2zlI
         Te2KgpXWb+AvY3Fu01ytcrHqxPiiTZiyhuaGbf3HdcfM8Q9pFxKCYXstMDI60kGj+O5Z
         1yDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775722417; x=1776327217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xLl5gC/5dARZUSktr9tifAs18EiDAxNQou2h9Hd7lWo=;
        b=VA/RCc6mBrxDAcwww7gJyCu8RloJ/axjr+tRqPsfF6CKI9GMzUul+drlnsNpnUebLi
         02U4GnGcYoJf32C4ePAnA22sy/LqBc0sGgV5S3WEcK6ZUoDYpswMHplMV5mmz+mJ7MuC
         fiZAIRPlTajeQdVTsqfmyizVY0xB1SZfep+K70I8nfcMBoDWLYCPWxQIoH0Jl7qEOH4G
         joZV1tybG8ae7gOgLQv+5gUJPtmNVGi+SfshxdZe7SLhh2bLkSZmp/d+86FOeX9VW515
         GPkXcAg/v6YwvaUaW9HMwsnRru/FcM5Qr9Et0o9rOZHGgb2oUIB6RDQXxO3Z4LwH+yKV
         Z8ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyY6bMcJGZuJV6DXJmtUNCO4uHPTH50F1r4W/HmMqIm/JyiH5TTEsi10XIojy1oWVwAetdqUAOp86wBuqq@vger.kernel.org
X-Gm-Message-State: AOJu0Yx46PVC5UVz9PngeG2hHTmvj8J6S01eBTSyUcGkiAAF4fv1/tcE
	Yes5Yuex6miiBo+826LRCQHdhcheGmfCXdKPdv5EB6mU3hU543aP+1WchQZGKbAVfn0=
X-Gm-Gg: AeBDietzN+LE1znqiRM+6TGoE5F++COakCjJ1I0c8eEzIT41hHX7kE/g8aPagy1bycm
	C45HfON3eSah8OC/YxFe2Pu4/SwqgyGqDfH/FsbbZItr1D322mfd3xyuHSV4PVKRlIY+WYY5ONr
	NspczPKWL8X3yHA8PwnwQma4/baow/QgrzmOd6sx2D6PwVXSN6MYMJOKTCNZGj2YGpGDdtOENSu
	qMBy/vxPhbB7RHDsGmSEepfmOFdyRCBcikAhPkivkKTIiKbLtVZwQYOfmC2K4p8MLdEsiR10fKu
	3CSvRSo8rXI/gXeWEpRYis6ADRt+0oLmISrGLPVO43VL6gA1E7kN1VD53w3lBhqeq5p8sO2K3iW
	MrT3YCQvNbwiAC9k4t6QYcYQVkUVYAAsNNzIn7VkAz+5pgx3kcNoaC/QrPJSpOgIkzUIHwEYVeL
	Xd4kElCKVNN0KjOJgb9fPnaMyHjkzfnbdM+NMlwvUE5jwUbtuYsBXqrSnYTYOo1ZR0uvXB7TbIX
	jQ/6PBSr+WbwHMP
X-Received: by 2002:a17:907:2d9f:b0:b9c:b3b5:bbf0 with SMTP id a640c23a62f3a-b9cb3b5bc8fmr892722766b.6.1775722416882;
        Thu, 09 Apr 2026 01:13:36 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6f20sm709846066b.38.2026.04.09.01.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:13:36 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 09 Apr 2026 10:13:32 +0200
Subject: [PATCH net 2/2] net: ipa: Fix decoding EV_PER_EE for IPA v5.0+
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-ipa-fixes-v1-2-a817c30678ac@fairphone.com>
References: <20260409-ipa-fixes-v1-0-a817c30678ac@fairphone.com>
In-Reply-To: <20260409-ipa-fixes-v1-0-a817c30678ac@fairphone.com>
To: Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775722413; l=1045;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=zVpeYCI0Fp2z5aqjv7cM/PPua39ANpiE2GE9IcuZhfs=;
 b=CHEi445KZvoC0I15KF5hTJRWv53wWRXSGHOTpa7orG3qMHl0QrFrlARJUij2VbYkde8+d0wyF
 KqVSQMVHMVbCXXj8FH5xKxVlPcmaajmNdmK1qmTVgdje8Gkloqxakwv
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102430-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1EB613C7989
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Initially 'reg' and 'val' are assigned from HW_PARAM_2.

But since IPA v5.0+ takes EV_PER_EE from HW_PARAM_4 (instead of
NUM_EV_PER_EE from HW_PARAM_2), we not only need to re-assign 'reg' but
also read the register value of that register into 'val' so that
reg_decode() works on the correct value.

Fixes: f651334e1ef5 ("net: ipa: add HW_PARAM_4 GSI register")
Link: https://sashiko.dev/#/patchset/20260403-milos-ipa-v1-0-01e9e4e03d3e%40fairphone.com?part=2
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/net/ipa/gsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ipa/gsi.c b/drivers/net/ipa/gsi.c
index 4c3227e77898..624649484d62 100644
--- a/drivers/net/ipa/gsi.c
+++ b/drivers/net/ipa/gsi.c
@@ -2044,6 +2044,7 @@ static int gsi_ring_setup(struct gsi *gsi)
 		count = reg_decode(reg, NUM_EV_PER_EE, val);
 	} else {
 		reg = gsi_reg(gsi, HW_PARAM_4);
+		val = ioread32(gsi->virt + reg_offset(reg));
 		count = reg_decode(reg, EV_PER_EE, val);
 	}
 	if (!count) {

-- 
2.53.0


