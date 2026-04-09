Return-Path: <linux-arm-msm+bounces-102429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OFfD9Vg12keNQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:18:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD533C7A49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:18:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E5E43097FA7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 08:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC9739EF09;
	Thu,  9 Apr 2026 08:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cutfWxTf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31CD39BFF1
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 08:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775722419; cv=none; b=U8DfK+TUwOjazNBGBfXL6SWPOJJSQp8HZGTwD1AUJSb2ONnzGMNoGa07cLuIp8oRpwZ+tTdl30nx7GVzXjvGm4SMXOumn0Ld/HUrb4t1yphmW0CU+6u2sN1BX66ru63WJcwpLrwiLW6EnWapjLHl0URlpOht3sFjjATVCKR1J4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775722419; c=relaxed/simple;
	bh=wamlg7cG4onOyAvlIExCjVjWIJuPxmnTcceFW3Erxjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Es67+LUQ6Ayfh5aqJqKdYy+fClG9ZLuyeOvR83GqZzR1XM7iIta8+AIU/r0Pc9kcDIa4IjlgyEVXzC6a7tY6eT+9NMgYvSd6+jl+FuKEAGCDHoAVW2t0i5+KRUlDJ60TIm8qrJpif2fOJWqPHEK6u6KOFE3O/uf/kQ/UnpRMc5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cutfWxTf; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b9841aecf72so69079466b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 01:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775722416; x=1776327216; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJTqTg29y4fyyCQIM/Qide/ZIGLKp0SbPQP2kYlNUwo=;
        b=cutfWxTfiQP1lUJE92zdljC1M49hCuOiMfT76lg7gUReZkQ3ZF0h+1T33TeftsJITd
         hVYbWKaFpvB+xD/S5NM1sZyVcHXkFd3B9xVnLxp3lXF0MmojPWjHYo68VidKT8vL2GRu
         0znqA1bgnvaaD5kh9u1+wUA+1PrjFa5Hbwwq668R3uRcLxOgDNq5VGLJfL9RLYWeB/Mi
         awpplN8dqPO/OdByS8E8f8IXSUsW5kD5JET6roJwPshM07iVF8Oe1qY4EpjWK4edH6xU
         nMb3Vij+7ofATzFXOI11EHicMyG2HHBbaFIEEoLD6SJlmbJSshtI6If9laZ/Qx8HtwtT
         1R+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775722416; x=1776327216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GJTqTg29y4fyyCQIM/Qide/ZIGLKp0SbPQP2kYlNUwo=;
        b=KE0oC/UAW6U8t94ERJYSqOw0xxh9JoRBdGfR9SvWsUHCWETH2xw6y+eZgdjvE/0y+j
         hyf0oKcXHXa4efz8BZrYr99JjFX5+5DpKkjQ7qDrZqfWEbg8PvxMmnHGleEJQZ5lHv7r
         rsrao/eBKM64YnuP3bJ1wdKzHBlUJ/gPKwDO5cRrpW6VUlWJbfoASTXo79qaioLl9sEK
         eraf5mVY1prW3/b+xinirHeWBKiYUH+23faVK4yAQcfrJJ49cnUo31y6tpHQJjv0bF5o
         /asOjUSgOzuamscoUZGcLjgAVSW9C99+UTnbDB6iYQOW7JOpEfDDzgr8NMWS4SJIe+fi
         FyFw==
X-Forwarded-Encrypted: i=1; AJvYcCWjy7fFWQvPoON5pt1dfKNtgAXSsWS3bhM4Fp/AYc80jL5E0RP3TQBl3uVm89gZdGRTwdoUKRqXPxH4Xe9l@vger.kernel.org
X-Gm-Message-State: AOJu0YxWNXUrQqS0HJjzw1itN4/emXFpqOiOEkNpPbC4WQ+66S1gXr0N
	nkPtkHvISylvwQXqUA7GG/Yiw53ku++BOCd7CNuNG4iPex9MEJIYLMC5ETGJTkQHXvg=
X-Gm-Gg: AeBDiesi6V+kSDEnMRbKnj4aejafOJX2njux79NuyOWK9L2eWoicC9Ix4GP81pwLaAt
	yoRzMvqgdOkM6IDH6uyttgUMc17K0DoVjQTxv83WD2NBT4ccwkhiKsVLueSncLEVw3Tntg75u1x
	1v7qe0glWWdOcyNoqIasmdrmXIJcwtZ+yTojfFA5YSOhagqm3E9DEWESHbnuiAyPlURx2NfflIa
	whXMSlBTO6sZiPcroauJRewLmkdfj9ARJX4IrEM3L0D8f+THdfGBwXE/soNesKF7SwhZFt3rvxq
	f4Lv9cqyycfjDd66vGqbhr/DExSuRlWHbmKymNzNUMc2R4uh0/144vKgrfHSU5MvzUYt1CtH+tK
	kGyhBV2TPcqssLoZbDT2nKtiCCr/za/JVxTs5Qfn8YIebJP7rX5nZIuysM0H/zEggWbA0zvLBE5
	n32b/T/WhQ17cM2q9MXd6itCFE5lvtCMvUgAEynDhYtb++O5ca/jYG/BdT+OD+5JpQ3//q//ebU
	ushCA==
X-Received: by 2002:a17:907:3c85:b0:b98:286a:e2c2 with SMTP id a640c23a62f3a-b9d476ac76amr120880466b.38.1775722415821;
        Thu, 09 Apr 2026 01:13:35 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6f20sm709846066b.38.2026.04.09.01.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:13:35 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 09 Apr 2026 10:13:31 +0200
Subject: [PATCH net 1/2] net: ipa: Fix programming of QTIME_TIMESTAMP_CFG
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-ipa-fixes-v1-1-a817c30678ac@fairphone.com>
References: <20260409-ipa-fixes-v1-0-a817c30678ac@fairphone.com>
In-Reply-To: <20260409-ipa-fixes-v1-0-a817c30678ac@fairphone.com>
To: Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775722413; l=1436;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=wamlg7cG4onOyAvlIExCjVjWIJuPxmnTcceFW3Erxjk=;
 b=XZUulr8BhdYKcjjF8UzgaLp8pFwenn1sWPeLayNoINHm02FB77AyoV17swCL4CwNvDNSccWeg
 ea0YmdRC+XKDrAalkWmGOiQnYrsAI0HM7+Hk4KsUAtNMY6UyJ6Uq1q6
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102429-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid]
X-Rspamd-Queue-Id: 8DD533C7A49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The 'val' variable gets overwritten multiple times, discarding previous
values. Looking at the git log shows these should be combined with |=
instead.

Fixes: 9265a4f0f0b4 ("net: ipa: define even more IPA register fields")
Link: https://sashiko.dev/#/patchset/20260403-milos-ipa-v1-0-01e9e4e03d3e%40fairphone.com?part=4
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/net/ipa/ipa_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index edead9c48d1f..216506eeef1f 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -361,7 +361,7 @@ static void ipa_qtime_config(struct ipa *ipa)
 {
 	const struct reg *reg;
 	u32 offset;
-	u32 val;
+	u32 val = 0;
 
 	/* Timer clock divider must be disabled when we change the rate */
 	reg = ipa_reg(ipa, TIMERS_XO_CLK_DIV_CFG);
@@ -374,8 +374,8 @@ static void ipa_qtime_config(struct ipa *ipa)
 		val |= reg_bit(reg, DPL_TIMESTAMP_SEL);
 	}
 	/* Configure tag and NAT Qtime timestamp resolution as well */
-	val = reg_encode(reg, TAG_TIMESTAMP_LSB, TAG_TIMESTAMP_SHIFT);
-	val = reg_encode(reg, NAT_TIMESTAMP_LSB, NAT_TIMESTAMP_SHIFT);
+	val |= reg_encode(reg, TAG_TIMESTAMP_LSB, TAG_TIMESTAMP_SHIFT);
+	val |= reg_encode(reg, NAT_TIMESTAMP_LSB, NAT_TIMESTAMP_SHIFT);
 
 	iowrite32(val, ipa->reg_virt + reg_offset(reg));
 

-- 
2.53.0


