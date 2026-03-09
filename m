Return-Path: <linux-arm-msm+bounces-96275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uH/UEfrbrmm/JQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 15:40:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E171223AB4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 15:40:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B1F313028515
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 14:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C45473D6492;
	Mon,  9 Mar 2026 14:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G1Md2uo5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="G54NLwuU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7B53D5229
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 14:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773067183; cv=none; b=I1NZ7D+PuA+6AZckOwMk7AvvvkDYNbLYxFT2a/cHmJldhsw1KSO3pYxkStUL0Ih9vjEwFxSwG6KiivVNRYClh4KIsnlpu6SXTw3TSRMH5yHd0D8w51U2AIr/oG6LqxeXGn7EQR12K40LZTaEFKoTXPtNTcEVKQT71BPhheFTpvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773067183; c=relaxed/simple;
	bh=sLSzbJh7cXz15yujfKRUKVwjHxPskav4bPrL2rWVpLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K7G06nMBuuypjKrX0VqGIQ8QT38gdf/U0+dk1mJKGaOoDxbAh32rjFpnfT0g2t2aPU69BsRNYB4Mshw5/004nAgdtXcCGw5zrg2IpKqL9Gq/UcYqbEnlXaokqhgztaWSGYNVWOuOjiC4SlHcsW0Mw1JfKlijGAR433iBntD84Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G1Md2uo5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=G54NLwuU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773067177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nHpEuLdBDx8DUfHTyOeAjGIaxuajst1Ir/ZXwDHbftw=;
	b=G1Md2uo5H+fsm1Mf1k+EMbAHveWvkJ98Uon9xYvGQtPDlvt9+kVxn9gSF8bZIBxuusiAq9
	dc9/jZOr3Ia9Mnv/7sw/cmHaZnMj+DCwJbBUerhNpvp8Yt0JNNK1jvhLmsykpWgQRUyQ9+
	vUxCwFhWKdFWlatCl6KcrIzG0frqC7A=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-WI69tuw_PY2UaHawXYsTNg-1; Mon, 09 Mar 2026 10:39:36 -0400
X-MC-Unique: WI69tuw_PY2UaHawXYsTNg-1
X-Mimecast-MFC-AGG-ID: WI69tuw_PY2UaHawXYsTNg_1773067176
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd81506677so792434585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 07:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773067176; x=1773671976; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nHpEuLdBDx8DUfHTyOeAjGIaxuajst1Ir/ZXwDHbftw=;
        b=G54NLwuUtqRSXg15tAN+AAaFZDOFqVk5BeprEleQPGRVJr5mvnOyUIbMfl4LME8pA2
         PE3L3Emd9weBSPuPxQ56DZRWAyb92wnKPrSeZc3ErA+ynEWXzNjTGWoxoEAA/nCXvnqx
         TfBLqtUA/ZeSTGY6pveSNBdwlh9L9+p+NM92FgPSCrHSML6FMFt0aY9Ffh5qUZZFlZjC
         KSSO3cKQ21++kGbJ46eCaoP213t5qUjzOLKQNOPHxBVQi/d05il0im8tPXgxxiw0VPTi
         bdiRon8M9TbyOaK+xK/uHxYHYSFoe4WaV8r/4CNW6NX6/1gMAU0PevPVKbnv4jyl6NEC
         oXJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773067176; x=1773671976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nHpEuLdBDx8DUfHTyOeAjGIaxuajst1Ir/ZXwDHbftw=;
        b=Sku7XjGwCPTnEbx6pQhmTBIYvUFlFeU65PeKHSVL3hVb6EjeEgxAwv+h2FZVv/dwtr
         Ln+IJv6iI7/kYsYrCsVUBUPuJHrmWHV6Z3bdAYGKot4MiwyRjgKrilHlryRPJfrJCv9f
         cJ5ArsWMB2cM1k2qhKxd8Dly8d3FiEwb54F0HYplzhJHuJFztAWAvRABfSiJ1qtt2tqO
         4B2og64Vfc2SyXmpt85U/acrSlewKV6g4EXhy5ZWbhEACuNfYVSGHSoppIDGs0+9iakU
         RkTNb5UbqUdZjhEbfpdQp36qMSST4LerwAAjXUjb3Ml17oUQsu+w+qq85JGVivMvXrud
         XPzw==
X-Forwarded-Encrypted: i=1; AJvYcCWESe2rO/mCSHFB2vUuN3XCIrtLazbG3EJML9OWO5OfyVj4/blU27hM1tPJ73HpZb/42ps2D9ufiWpvDCGx@vger.kernel.org
X-Gm-Message-State: AOJu0YxXr2qFgvPJwr8KYFJz0VmVaHTURtiE8Imqdje2BybDtRnyJdc8
	BbXLjIH77HtoBzkZ0nwclugWYoiCxd2JSxEKGxeO1xaFDJbYG9Igr9QosV8TPQgRrUpkVQ2dQ4O
	eov4Z6MBCCOiEA2Lh4bn38mZdkways7RhLO6Mf1ybbn412//iFZpcXMi8PV/+OTmwEDA=
X-Gm-Gg: ATEYQzx8U3w8QJ9iBJO68DbCsk7FsnqEooQ9tOqHYIe/djU5AZe6iBKXQgdB1N3Vg1m
	VT6Ut6s193gzWwRK/afT+LfhEA1J604vtbYsWn8neNfg+hL1cZ7nTasol2vEj758myZx6a8uzJr
	Rq8KOVEdPEY9PU3zvBUheuiHgDD4jOZaOZi3HUEYBbhrSg19EhdBczWt9Uo6IJ/ZejZkO+y2Y4M
	Z8CJxjTP310GQtlk5UHaMak8MNop9CPeoMdC3yISRjlHDp+jBKUwPEQnn4XOiQwoUOs3PxC2T1Y
	1g+HhSWT4p51DmXpwCi1JLsiX1w07cgmM2SMywLzVnfL0qY2GouVnqs3nlmfk2DZRrzh8tm3o/A
	I7Ofa0WB7c9yTFXnl18C9DWCO/qi697aWt+VXRoA6gvNUbbWPZRLxZb555wmpGQ==
X-Received: by 2002:a05:620a:31aa:b0:8cd:8f04:50ec with SMTP id af79cd13be357-8cd8f0455ddmr198562785a.2.1773067176051;
        Mon, 09 Mar 2026 07:39:36 -0700 (PDT)
X-Received: by 2002:a05:620a:31aa:b0:8cd:8f04:50ec with SMTP id af79cd13be357-8cd8f0455ddmr198558685a.2.1773067175644;
        Mon, 09 Mar 2026 07:39:35 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f49fcafsm756064985a.16.2026.03.09.07.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:39:35 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 09 Mar 2026 10:38:47 -0400
Subject: [PATCH v2 08/12] clk: qcom: rpm: drop determine_rate op and use
 CLK_ROUNDING_NOOP flag
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-clk-det-rate-fw-managed-v2-8-c48ef5a3100a@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2724; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=sLSzbJh7cXz15yujfKRUKVwjHxPskav4bPrL2rWVpLE=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDLX3Z4YsMBuVzxrMftysXMGLcYlHX/1Zf2ZL2dYffQQY
 ulKn67SUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwET2djEyzItv2OzQ3/A+IOST
 tb/ePe279Yt/MZrHxef+Ol6y+cDPVkaGV4fbmRTj2sUlP/LWSLS3Jl04FVHfurrFeG3gjDuap+z
 ZAQ==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Queue-Id: E171223AB4B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96275-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.949];
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
 drivers/clk/qcom/clk-rpm.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
index be0145631197bea65438f3bed10344f18d6de802..af2cd40107054cc6d25724497b5749a23f72a04a 100644
--- a/drivers/clk/qcom/clk-rpm.c
+++ b/drivers/clk/qcom/clk-rpm.c
@@ -42,6 +42,7 @@ static const struct clk_parent_data gcc_cxo[] = {
 			.name = #_name "_clk",				      \
 			.parent_data = gcc_pxo,				      \
 			.num_parents = ARRAY_SIZE(gcc_pxo),		      \
+			.flags = CLK_ROUNDING_NOOP,			      \
 		},							      \
 	};								      \
 	static struct clk_rpm clk_rpm_##_name##_a_clk = {		      \
@@ -54,6 +55,7 @@ static const struct clk_parent_data gcc_cxo[] = {
 			.name = #_name "_a_clk",			      \
 			.parent_data = gcc_pxo,				      \
 			.num_parents = ARRAY_SIZE(gcc_pxo),		      \
+			.flags = CLK_ROUNDING_NOOP,			      \
 		},							      \
 	}
 
@@ -78,6 +80,7 @@ static const struct clk_parent_data gcc_cxo[] = {
 			.name = #_name "_clk",				      \
 			.parent_data = gcc_pxo,				      \
 			.num_parents = ARRAY_SIZE(gcc_pxo),		      \
+			.flags = CLK_ROUNDING_NOOP,			      \
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


