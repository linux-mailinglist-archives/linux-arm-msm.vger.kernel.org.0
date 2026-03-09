Return-Path: <linux-arm-msm+bounces-96277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EN3lNhbcrmm/JQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 15:41:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E4823AB93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 15:41:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 567BD3023162
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 14:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D638C3D34BD;
	Mon,  9 Mar 2026 14:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BKyGXHWH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XoMWFzx/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD6F3D412C
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 14:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773067187; cv=none; b=dr6v2Nz1q/XWZgCCy9V+VAA9bv4HmJiF6GAmdmJJvCUcladJt44r+aTs9xwaK6Kzul/83Ls00KDQg56xKxXOzZgzVgcDyrBc2WNfxJyYNXixFM5gcdCvCnTL4tkQKqSikJVEsQC7mJSgVK1fd2tBNCuwZS1UUkg/2TxuSZR3WI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773067187; c=relaxed/simple;
	bh=YVMyzc0tTOkSGaDGON3cC3M+SX28i9oee7MZh9VvHmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UHTqNDkEA1nATnem0Qhf2JH182+DcxJpT853FrrgYW1oyuvzFuK+LjlYr4HT8PGhSKzUbbOon7GbMu/q0hSgu3zzhNkdvuRqD2p69t+KDbiAQ3eiMWrv/UIDvB5yWETPpJfaYI1lSnAf+6ZjftISqLuUeRPuu3IAJa3JM/OXKWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BKyGXHWH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XoMWFzx/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773067182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pk77Zp5eBE1xjZSOOGEOtHT9QaqlbkHo7+yWZujn4VA=;
	b=BKyGXHWHKRz2xK5YiqHEZdTQtGIYwWspiVga9aMbjaUKwRbBMc4Jhw9R6h3w8Qne2//3Jj
	2ucUBY2V2KDFq6j/AE6dMG5AJfONwaeeszsqHz6XulzXiMFwRu6j9SFULN1Z5orEusnQiV
	/zc+Wpi7kdvwDhEh0yH9yLLzr5suUOE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-IfD9zU4xNuS__AIQ5EOLAg-1; Mon, 09 Mar 2026 10:39:39 -0400
X-MC-Unique: IfD9zU4xNuS__AIQ5EOLAg-1
X-Mimecast-MFC-AGG-ID: IfD9zU4xNuS__AIQ5EOLAg_1773067179
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7fec8d44so771524685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 07:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773067179; x=1773671979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pk77Zp5eBE1xjZSOOGEOtHT9QaqlbkHo7+yWZujn4VA=;
        b=XoMWFzx/dJQDjiFxF7PkgQu6Qz//shpt4DEN0fLEgT1Th7P2bnfI2S0uQL8Y7CM2EC
         uugEzcBrNdjzS1p4DvOEMzYXzmVApUDwlZ15yAnnlhjz7csOp89CJPqxvFM3n+D9QCez
         uEnJqX1tK3knDLyzAzp2HvqzCy1xcfGhi2zX2ED3bi/a0VfV7rEUEwZ6io0yBbdEaSvG
         TG2fGI4aIAEKuqBirViTOyfqLaI9pRKtgMs6X59BeNsbDxwS/YkAIaM6BbVTevsrQBZ8
         fENi7ESrJtBHRIH3328130lcNd7xJZZ72RI7SAkMTsxBRQ9fUS40iLQt6Wv2KrIk5PvG
         plVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773067179; x=1773671979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pk77Zp5eBE1xjZSOOGEOtHT9QaqlbkHo7+yWZujn4VA=;
        b=rOS9pAk+3kUDk7zEJDHFh4FSWOrR7w1rBGd9hq+D1x3QF6KWKL1GTGsG4j/lL7L/yO
         sauBiViN4JDB7b1I2PKmGRoTNF/dQQgkUQms+m69Cav64tFUSD7f+UgyCxW2byIvnVnR
         qVqVE18v3oVAYGeJqUE2OKNZvNTgL6qzA/H9xpr+/KPxZbUsMf6ZQV17ccyhlmjTREJ5
         B5XdajhvT77ocpigtbJCCV1cc43JEu1mBeQEhLK4QYZHt+oV8AHyevOqdUzhycKSIFpU
         +a1BmlTq42eO62fSYXgFnbvNGhmoMVJuZKp0bxpj87VGLXceV2mrUgj9SRh+o/puehWr
         s7uw==
X-Forwarded-Encrypted: i=1; AJvYcCXuHeMvSQMhjU+VIaYEgUO0v8dRlu8jor4eSwARSWv7nwAuh2/8PnE4N+pSIJ7fKw/aD+1QgjXMv8Cxevfy@vger.kernel.org
X-Gm-Message-State: AOJu0YwYzPhqATy7PY5h3tZy9Q2zvpsU8r+yCoGPkIZp0u+BTMgBF/UE
	nTUeZzOXsYojwhyoOYUCV3Od08udeymcWtH4uGDpyZeDY6ccMlivB2Uqls7lUg9bNKNFEOEYYP7
	roaih/fj2eMhWXLqd+CRCeFgsB4P3fSXTOm6RS0zFDaEMsStaY22qwxwW4ZiSprvgu1Q=
X-Gm-Gg: ATEYQzz2MzFlfQuh0SsYjoqi29fMhs5rQZ6p6woC/I3mUf2sk0CURpgk4/Ra5W07OyE
	e1iWk+4Qp2lpgOfBtgx0P/sgIR8y9SyPsngqBIFKUaIXhtpLtHVU/C3/sqkJfCstXdkGMEVJLUg
	1ftuWw0yPWBvZ+F9qG5eX8yB2nISBHn0xMeAi8bCGSeTI8Xr246Oh2FNurgbgw856yD9l2f5tfR
	hLSY3SyG801OmR+2qUOUw1VOQ/I7BbHxZfLBbJxWIZnZpzNj8+zJrGWw+6CaCc+v/DdvhA6M5w2
	KR9MHsYb/06LFetuu6ZzJQiel4ZaoydbjRKP9AgxWnKhUU88Gvtm4k9Pr4iz/9nO2arwJwSTaCO
	tz1ysIvCp8Alg595mDzD9FyK42IB+5H2CnXwyJgGr5yg65mczgDBmL0joG44JyQ==
X-Received: by 2002:a05:620a:3911:b0:8ca:4288:b179 with SMTP id af79cd13be357-8cd6d33640cmr1364160785a.5.1773067179062;
        Mon, 09 Mar 2026 07:39:39 -0700 (PDT)
X-Received: by 2002:a05:620a:3911:b0:8ca:4288:b179 with SMTP id af79cd13be357-8cd6d33640cmr1364157385a.5.1773067178618;
        Mon, 09 Mar 2026 07:39:38 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f49fcafsm756064985a.16.2026.03.09.07.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:39:38 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 09 Mar 2026 10:38:49 -0400
Subject: [PATCH v2 10/12] clk: qcom: smd-rpm: drop determine_rate op and
 use CLK_ROUNDING_NOOP flag
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-clk-det-rate-fw-managed-v2-10-c48ef5a3100a@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2129; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=YVMyzc0tTOkSGaDGON3cC3M+SX28i9oee7MZh9VvHmE=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDLX3Z688binTaDCt90NB+MbJrsLpnnmdWWcmhgqbXWop
 FpD841SRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABP58J/hn16L5qK20wK5gp2e
 vtuN1/z4kx/wKXZvAU/dsiDpqfnBJxkZNlWeYY8w3yS39f5hmSOnjgTpqQf8qn6b+qnqRK2kSEw
 qPwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Queue-Id: 86E4823AB93
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96277-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.948];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,baylibre.com:email]
X-Rspamd-Action: no action

This clk driver has a noop determine_rate clk op. Drop this empty
function, and enable the CLK_ROUNDING_NOOP flag.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/qcom/clk-smd-rpm.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 103db984a40b950bd33fba668a292be46af6326e..8c6fc5adf5f50537a4f8d43872bf2f9065e5d6d4 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -35,6 +35,7 @@
 					.name = "xo_board",		      \
 			},						      \
 			.num_parents = 1,				      \
+			.flags = CLK_ROUNDING_NOOP,		      \
 		},							      \
 	};								      \
 	static struct clk_smd_rpm clk_smd_rpm_##_prefix##_active = {	      \
@@ -52,7 +53,7 @@
 					.name = "xo_board",		      \
 			},						      \
 			.num_parents = 1,				      \
-			.flags = (ao_flags),				      \
+			.flags = (CLK_ROUNDING_NOOP | (ao_flags)),	      \
 		},							      \
 	}
 
@@ -370,17 +371,6 @@ static int clk_smd_rpm_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static int clk_smd_rpm_determine_rate(struct clk_hw *hw,
-				      struct clk_rate_request *req)
-{
-	/*
-	 * RPM handles rate rounding and we don't have a way to
-	 * know what the rate will be, so just return whatever
-	 * rate is requested.
-	 */
-	return 0;
-}
-
 static unsigned long clk_smd_rpm_recalc_rate(struct clk_hw *hw,
 					     unsigned long parent_rate)
 {
@@ -427,7 +417,6 @@ static const struct clk_ops clk_smd_rpm_ops = {
 	.prepare	= clk_smd_rpm_prepare,
 	.unprepare	= clk_smd_rpm_unprepare,
 	.set_rate	= clk_smd_rpm_set_rate,
-	.determine_rate = clk_smd_rpm_determine_rate,
 	.recalc_rate	= clk_smd_rpm_recalc_rate,
 };
 

-- 
2.53.0


