Return-Path: <linux-arm-msm+bounces-96276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gA2GLQjcrmm/JQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 15:41:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55ACB23AB81
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 15:41:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 773CE302A3B1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 14:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 994583D5229;
	Mon,  9 Mar 2026 14:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BaPrhzNZ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UfohZobI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4E93D5666
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 14:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773067185; cv=none; b=WCvHMevQLFYaN7XLsa4vG0EoNanM3U03rOg1LLpcrx2Ak/YSrmJkXQSrCY/6NqP9d5lFOM1LygqAhxIisNu2wfIEqhDC0unc6BJAP1Z/rQbKf4VR2a78aHwNJqQ+RsoZ57rEQPMOk0fYYJstFw27HqsXCs5rI3hcvax8YJiI0js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773067185; c=relaxed/simple;
	bh=IvF6uKMPnQFKE1GbYYFcHqzOqYj9gDMJMos1cEoO7k0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cDpuydfNVYtacH9t0pTR0H+fymkzxtR73V6z2cy/M2hjOka/4p1jeXuvCuAAHCL7wz2ftorfGIsm5YbJtLfoT3QdaDxgStcBJ8i2qOr3EqB+ze44ZBjq8Pao8iEpD6QT3mwu/HjRr8tnXd/Fa0khXWhsucoCaRRC4jMDY5U2mj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BaPrhzNZ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UfohZobI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773067178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xiCQ6zXIkcf+xUvAG+Sa0vhKvqR3yyXasqNpgBq06J4=;
	b=BaPrhzNZH2RPrN2QxC770/j2+la1pnPmHXrkgJaP5lzApv16K1hyOI690WndeL6SqsiKs7
	D4JbRL3BJU5oj2i3FuBEQa6PZrIrkXe9m1d7cD8fxvMpepFtPT6htJtNnmzw1CZ2TfC8Yl
	O/O1Ho4r1YbifXJzBeP6c0Gd1dpk3Ng=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-L_vVECioNvO8_d9ht9Bm0A-1; Mon, 09 Mar 2026 10:39:38 -0400
X-MC-Unique: L_vVECioNvO8_d9ht9Bm0A-1
X-Mimecast-MFC-AGG-ID: L_vVECioNvO8_d9ht9Bm0A_1773067177
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb0595def4so180809785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 07:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773067177; x=1773671977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xiCQ6zXIkcf+xUvAG+Sa0vhKvqR3yyXasqNpgBq06J4=;
        b=UfohZobIt4gvuzq2YS4TSVN/IuX2Z1h6gvuzCJNVKXMqX9Xy26pcy7qW6xeAQV9M7+
         t2HBFZ/kWTXWpOTpqwJtirBeCFdNFbLCQmdY3TNUvK03lhgWUhIRq80FZtGiuvOLJF1B
         ESt5CAo5RuJfX2giPlUkc4VqaYQD3bw0vzXibzl812JupuWw+M/xR9i1M/jt/1bwG9r8
         oMXfHc2rienLW+L0RXy2dhb26sWRjNdu1CKyNOEdCAeM94wjvAuZw/7iDU57He8bolvn
         NVuP8xyyiGkbrotK92mheX5IYHfpvcl+5xF4FypPp+2Edeji9c5IkbOSDpf7KEkBDPnX
         rfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773067177; x=1773671977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xiCQ6zXIkcf+xUvAG+Sa0vhKvqR3yyXasqNpgBq06J4=;
        b=oM8UXeICIN+wOJCn4wzjLnx8ofQZfze2OZgaD1/igWRTEGes/bOvvM18RvZSa5sY4E
         eQ3KzWZLQSuft0gUoBv05wX52GT8BY5AE9xtnl/t0hoi3Z+uGeCCVwjJA+EQDcbIppA7
         Zfc+F6g9TYJUiUu1ecmw4xvDkekXq63qPegn7+69l+HnjoUpREWZsE4lTmUwZuFWQB8w
         SxNLpHIfFOFph4WG6Jp+E0og3gLQJoB9ZzVqGWQI+0eizRhuiQ6Nz46IfXKVxdPUscc8
         pIctlCC2M6LnsR8VZSV8Lh6/6uB+CG92ByTZZa7BC3ucRxMz7juHQiMWIaLG/IqHC8KJ
         nkdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwWMo1wdCte8Y7uUrIR9on+BwlJqjBTBGI0210kZ6ZSBJcHZZZnlfkm92FH2h68OBA4sXfusBFW7oR9ZqQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz4VsR2kchfYovAkXynGBFK5HT7zvnTIcEMSCQPDmlo2IEgRju
	BpurcggJivVsViHazmEk1EMzScRL5NLmdbx3cSKFHL4nN7hkt7huu6VCvnYnalyvbGTueQnxgb3
	VRDbk0Nk4+nV0GiLa9QFOreMUZ6CsTgtiKH1sEsaEwczUkM0ocXjqOZCnShyhvpxRAzw=
X-Gm-Gg: ATEYQzw9f3ephf5AvUfLdxj5u45DKKVTpiIldhwlYGHPq8QqWY6URnDbewDiJDY6oE3
	Ep89VOe5tDPXQ0ynXiXo2/wwgrP3LZKVLHx5r6XfPza86lw/QJ1xw2geAoB26PdniljXeMnmwTj
	KMLqREWRinZD14oTGglEgfGN+CDMMO9SJ38rLl4wXky3nHLKleU0rAoCrnUYeSOLrBUXZ4OV8UC
	TjXEv1tiVdWyrBNNhu3nRviyOhjp5P/xtOnu2SbgNcF7oUCTuV581oC7uStql65MXEmaUWHw3+q
	uBgc44GUIQvUNYA8Ggfplm2+Tt3pptTM4CgTsiOr0h/K+yIhLEvMuvSkN0N2mUkLObdiv10WXtg
	xIF1/9VL3lpCPc91F+NdhjSmi3JC1KCRTpJEWVjsro4/AUbfJdOuMgLw8NJJipg==
X-Received: by 2002:a05:620a:2550:b0:8c6:f416:69f8 with SMTP id af79cd13be357-8cd6dbdb095mr1319501985a.15.1773067177362;
        Mon, 09 Mar 2026 07:39:37 -0700 (PDT)
X-Received: by 2002:a05:620a:2550:b0:8c6:f416:69f8 with SMTP id af79cd13be357-8cd6dbdb095mr1319498485a.15.1773067176941;
        Mon, 09 Mar 2026 07:39:36 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f49fcafsm756064985a.16.2026.03.09.07.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:39:36 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 09 Mar 2026 10:38:48 -0400
Subject: [PATCH v2 09/12] clk: qcom: rpmh: drop determine_rate op and use
 CLK_ROUNDING_NOOP flag
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-clk-det-rate-fw-managed-v2-9-c48ef5a3100a@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1661; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=IvF6uKMPnQFKE1GbYYFcHqzOqYj9gDMJMos1cEoO7k0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDLX3Z40YbJyYp09I6/QD8vFf5sf63+pEo5V3PG0LPega
 mTSDMXQjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACaS7Mfw32tRjpa/64PacDtF
 v65Jaxqyn8/963Tna9rGAwVXL23avJiR4TBrKecON2H+7bP+a1/jCxO3+lv+sP7nkfazgvsFV7J
 acgIA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Queue-Id: 55ACB23AB81
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
	TAGGED_FROM(0.00)[bounces-96276-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.940];
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
 drivers/clk/qcom/clk-rpmh.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 547729b1a8ee01cf28c11ee8c4bd2f36d7536e6d..877574b952efffd1bf3ceab5d347ed4d5eb24049 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -129,6 +129,7 @@ static DEFINE_MUTEX(rpmh_clk_lock);
 		.hw.init = &(struct clk_init_data){			\
 			.ops = &clk_rpmh_bcm_ops,			\
 			.name = #_name,					\
+			.flags = CLK_ROUNDING_NOOP,			\
 		},							\
 	}
 
@@ -321,12 +322,6 @@ static int clk_rpmh_bcm_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static int clk_rpmh_determine_rate(struct clk_hw *hw,
-				   struct clk_rate_request *req)
-{
-	return 0;
-}
-
 static unsigned long clk_rpmh_bcm_recalc_rate(struct clk_hw *hw,
 					unsigned long prate)
 {
@@ -339,7 +334,6 @@ static const struct clk_ops clk_rpmh_bcm_ops = {
 	.prepare	= clk_rpmh_bcm_prepare,
 	.unprepare	= clk_rpmh_bcm_unprepare,
 	.set_rate	= clk_rpmh_bcm_set_rate,
-	.determine_rate = clk_rpmh_determine_rate,
 	.recalc_rate	= clk_rpmh_bcm_recalc_rate,
 };
 

-- 
2.53.0


