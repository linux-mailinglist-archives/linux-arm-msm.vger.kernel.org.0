Return-Path: <linux-arm-msm+bounces-94339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id JgRDE6iVoGnhkwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 19:49:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9401ADFEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 19:49:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 679FE30B60DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 18:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F040425CC6;
	Thu, 26 Feb 2026 18:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cwpvuwRy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pr1f9TAg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1964D423A68
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 18:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772129883; cv=none; b=F7UoqWgIoOzp/+dv4lkqDsPuczxoevX1x7CKdvWAYQvyVbXpYTVyMT5boCSVOXdQGKC6JYI9chzpyPL9hHr4MXACEkzczsdgtOvm3+WjGyfwfoZrvQ37bbmzo5EqK9I9BygMLFXFQAkBClT4p2sWiFaa4QC6P+gedgRKfiS4sIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772129883; c=relaxed/simple;
	bh=PkGYTmP+orpYOF0vGMHbROclUj3CwVjNeC7verALXO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nlAMcOQjawQQD+Fhl1JQnLRn/jbVCCvkgaJiqrDHPRr7y70hgUVchVnrz3uFzJvz7UBvWAcbwTc7s86Cs04muygDhCpQ51/vlpN6IjyzVLg5hxy88N+VUuD7XHaaZzPPdaD38UFMNi2R1waRhDnHugAEEpOD6cMJ+O+fdxmu7zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cwpvuwRy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pr1f9TAg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772129881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h9UvjMEWFqJfyANBSKlP8CFsUFFg2xZHrqLXxuY6d6A=;
	b=cwpvuwRykJOZeklQDlJgP/gM2PjuJjJwmt4bu36TVVMxD548w3cuuNBRTw0WNpV1+f+ZGA
	sjk4SYdqtRId+XA01G39JyqFeTnluJ5cUbSsSYpn6/znkF2WB/yu3ZllROJqbDldzp4b9H
	68rv4OlT2gjOhoov8YEl6EYr/Rh2MZM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142--nJ8_V_kMPCIMoc9s6pIyA-1; Thu, 26 Feb 2026 13:17:59 -0500
X-MC-Unique: -nJ8_V_kMPCIMoc9s6pIyA-1
X-Mimecast-MFC-AGG-ID: -nJ8_V_kMPCIMoc9s6pIyA_1772129879
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3b0d938dso1033274585a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 10:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772129879; x=1772734679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h9UvjMEWFqJfyANBSKlP8CFsUFFg2xZHrqLXxuY6d6A=;
        b=pr1f9TAgfWoBg7gwOwFKu9ke+ELudNJcb12qSvCasucP7BmmqGyre/4hx6xS5n4GRX
         GtEQdz8V+3AUBFrGBJTTdZeXlsE/GP5drf71wFELF0ga8UHtbtHNhRy9Eu4b03YFmycQ
         galjdsM0rmidVy9b8/sw0brmhZDMRdMObi/ScNwpbGi6m4yJoo96NIsQsXI7WJs2vZYO
         xyY4xxU9TEiZQHRedz7Ok7i6dL/3Af4aovTHsTPuJxJjy+BS4ca54kS1pbf8VRC1uWAr
         h0EYZKcyklOY3bwa0HLCbgUom3KoYjpyEkoZyp00RG0c5oMgWAuD/DisrCTFh8N2FxYh
         eIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772129879; x=1772734679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h9UvjMEWFqJfyANBSKlP8CFsUFFg2xZHrqLXxuY6d6A=;
        b=wEZvWIx4IxRkzw0EPdFeDqzAg/aIWEnxzox5F0b1lRIFvelMBj578M4hAAGtPW3Y6M
         eEt9mMicq2i/FBRgFT2eUiuRc3X0YRf1iWK4whGm7LLyjBBboFTuvufuTcNtMhalaUnv
         +yYGqvidzuh+tAMBjLSYht3Or/3Eq/VdIjDpS1YAjRxTqGlAvisuo7U5y0xDPtWxS264
         ujF8sqkrlplsLCggMuZWrie/t3iKMPhYdhysEgnxFJPYmgQPtJbfmO5Rv1nwd0r1isA4
         UE3M7yXtuFdNMQTk6hAgqXxsPqtuVeFg4v4q4QWlsaJl+MfOYgra4lNai4P6OCRHYmTV
         ADqA==
X-Forwarded-Encrypted: i=1; AJvYcCURzAhh3Lhg3+VJKPHDh+d736+1smkQyqk/IesLae5HGSOchaqWP+XqiIwu6DJiR/PydV7B3nz/6MCbSlyY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7s2jiQoovx36IgXMU1/bWu0RVYdq6vvy8S1B05bVlKcqA/158
	9PAhjP8H79AwS5CIcZwBW3uyRAuMfVPBDwXap75DrdZ56G68rxkhAd2VEJx57LZc1ef5IfJDeby
	NprIZ45++tbs5C6aRaQjNmxZPdeQfqExjdWwE3TPgR2CAYKRQkiQlhOfwOUtYTT3J13c=
X-Gm-Gg: ATEYQzwetNWfJeY7lGt1zsDQiT3meC+4tlZqTvYr6nQYe+pMvPSGzW+F1oz/t6PAFui
	CuUtosuUul0THJx9Au8WX5TnNFzPTLSA/2U+FbmFkT708JwmtDKLfboIlX2QIa65JhMLWJ9AVOa
	V9f0T5uc6SFiTtqhW4+UjTFhkScI1D0p4X4JC+qfASTRbHsO8hQv10VhvM2vMD9a7xzUVhSsAnK
	lVuft/v+f0fQwmSo46m+UsTQHPWP4UnpiyYfmnvkAqbdsk5bI0LFu8BzCA5fDzKqfbxOfP7AG+I
	eUbB6VICqXW4tBO2NXG/bevNUTOcXUnA2sJ4U/AwFhg+aXv9ZqdCb2bnCLoDr+hwVQ6N46+8jEv
	am5h1H+Ne0SzUvO5rH8oE7+l050wzDP7FXtV49gaAjQlKfASmJnzGKKUE5TBy
X-Received: by 2002:a05:620a:2942:b0:8b2:ea5a:4149 with SMTP id af79cd13be357-8cbc11cc8bbmr351572885a.65.1772129879202;
        Thu, 26 Feb 2026 10:17:59 -0800 (PST)
X-Received: by 2002:a05:620a:2942:b0:8b2:ea5a:4149 with SMTP id af79cd13be357-8cbc11cc8bbmr351569085a.65.1772129878741;
        Thu, 26 Feb 2026 10:17:58 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf717f2bsm247046685a.35.2026.02.26.10.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:17:57 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 26 Feb 2026 13:16:52 -0500
Subject: [PATCH 08/13] clk: qcom: rpm: drop determine_rate op and use
 CLK_ROUNDING_FW_MANAGED flag
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-clk-det-rate-fw-managed-v1-8-4421dd2f6dc6@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2680; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=PkGYTmP+orpYOF0vGMHbROclUj3CwVjNeC7verALXO8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIX9Bk+vvo1+MhjneK5vm7xwlMjK3Vjl5x7p9j043Bhw
 GfRjS8OdZSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjAR+x0Mf4W0ZqxKe3+10PHr
 7Inaq+yOZBdmOMyvleaafqCLoXG9zH2G/5WTz/qt3XP/Uby8iWa3vU/c71jvSrn7vzluVnnyrYm
 ewwMA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94339-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email]
X-Rspamd-Queue-Id: 5B9401ADFEB
X-Rspamd-Action: no action

This clk driver has a noop determine_rate clk op. Drop this empty
function, and enable the CLK_ROUNDING_FW_MANAGED flag.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/qcom/clk-rpm.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
index be0145631197bea65438f3bed10344f18d6de802..7875cd1815f524572f630242e3b71ff0810cdeda 100644
--- a/drivers/clk/qcom/clk-rpm.c
+++ b/drivers/clk/qcom/clk-rpm.c
@@ -42,6 +42,7 @@ static const struct clk_parent_data gcc_cxo[] = {
 			.name = #_name "_clk",				      \
 			.parent_data = gcc_pxo,				      \
 			.num_parents = ARRAY_SIZE(gcc_pxo),		      \
+			.flags = CLK_ROUNDING_FW_MANAGED,		      \
 		},							      \
 	};								      \
 	static struct clk_rpm clk_rpm_##_name##_a_clk = {		      \
@@ -54,6 +55,7 @@ static const struct clk_parent_data gcc_cxo[] = {
 			.name = #_name "_a_clk",			      \
 			.parent_data = gcc_pxo,				      \
 			.num_parents = ARRAY_SIZE(gcc_pxo),		      \
+			.flags = CLK_ROUNDING_FW_MANAGED,		      \
 		},							      \
 	}
 
@@ -78,6 +80,7 @@ static const struct clk_parent_data gcc_cxo[] = {
 			.name = #_name "_clk",				      \
 			.parent_data = gcc_pxo,				      \
 			.num_parents = ARRAY_SIZE(gcc_pxo),		      \
+			.flags = CLK_ROUNDING_FW_MANAGED,		      \
 		},							      \
 	}
 
@@ -351,17 +354,6 @@ static int clk_rpm_set_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static int clk_rpm_determine_rate(struct clk_hw *hw,
-				  struct clk_rate_request *req)
-{
-	/*
-	 * RPM handles rate rounding and we don't have a way to
-	 * know what the rate will be, so just return whatever
-	 * rate is requested.
-	 */
-	return 0;
-}
-
 static unsigned long clk_rpm_recalc_rate(struct clk_hw *hw,
 					 unsigned long parent_rate)
 {
@@ -383,7 +375,6 @@ static const struct clk_ops clk_rpm_xo_ops = {
 static const struct clk_ops clk_rpm_fixed_ops = {
 	.prepare	= clk_rpm_fixed_prepare,
 	.unprepare	= clk_rpm_fixed_unprepare,
-	.determine_rate = clk_rpm_determine_rate,
 	.recalc_rate	= clk_rpm_recalc_rate,
 };
 
@@ -391,7 +382,6 @@ static const struct clk_ops clk_rpm_ops = {
 	.prepare	= clk_rpm_prepare,
 	.unprepare	= clk_rpm_unprepare,
 	.set_rate	= clk_rpm_set_rate,
-	.determine_rate = clk_rpm_determine_rate,
 	.recalc_rate	= clk_rpm_recalc_rate,
 };
 

-- 
2.53.0


