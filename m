Return-Path: <linux-arm-msm+bounces-63590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 644E1AF841D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 01:24:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A5803A76B1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 23:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6EBD2DBF48;
	Thu,  3 Jul 2025 23:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A3ZnMapY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285052DAFB9
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 23:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751584999; cv=none; b=PDoadWyhpo/mPXXL1agWqlPU9JS0lT2oHZLOwYiihR9M13Lnj1mJVFHvaT54hyfKg73S0EtOwhr3UaIn7OFHxC45HhU9lpUC5qblQsenU3vWQqHAI1xNIHm6QMvEL7A0nYqIWqBbD248Xl4ytgJAYTJPLFwW0iHcB6vIhR0ETrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751584999; c=relaxed/simple;
	bh=jJkTWWJF3/5RXKxSt11n2asRYUE42Jhyt7x72H7Kcqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RSF7TyMl0Xy2dDmD7Pt+ql1xi5mNgXQ0VUYyYKcHVR2kCsXU9G4akUL1SqemjBipM/EVEop3MaSMfgmsplxBl7g6/eSkr9mX/L2lgxZbqLOOQi5d8o1KtwjdertUh3wJnNJm7ae8yqhsJWZoN6jXZBqXFVTmmq1StXLWHOjJgII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A3ZnMapY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751584997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kG8RA2RMN+WwY2ubKngIBCBT47zo9cYuBqM+5cnEdCI=;
	b=A3ZnMapYgGhv9SkS1q8QAuUAtbL5OqJSzwOHl2iC7D5+dE5UKon8bvNvV0Gbbbe2vd1a4c
	mW4jIg/J63cAnQxtlHpJR0atHytJWDedWwNQh8ABcWdhNU6FCW0J66+X/ndPr5WEmOebi7
	G31+Z4wkIjMEz7ok6cFSpaKEpX3Eebk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-ab5KBJ9sNQamJVcJgciUCA-1; Thu, 03 Jul 2025 19:23:16 -0400
X-MC-Unique: ab5KBJ9sNQamJVcJgciUCA-1
X-Mimecast-MFC-AGG-ID: ab5KBJ9sNQamJVcJgciUCA_1751584996
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6facf4cf5e1so4273346d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 16:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751584996; x=1752189796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kG8RA2RMN+WwY2ubKngIBCBT47zo9cYuBqM+5cnEdCI=;
        b=TNolPy9CuqriG330gxrWh0hPVabgJUuIdijJWsfRFbfa8AX5/yjZnz1WYe7a2wbPCb
         FTmIkTfv4xIM4WlMhxvvQQCfmRgnmsmyYJtuoVSknZPPrdkhf/tvTjwzrG6xfiqCFOp7
         iYxveic02QEqnJkGKnCzjSHj1bD8B/BQi3eG3ui3xiErqMXjULcObZh2EVpuT8geNEDB
         uc202blUccR6s8VkgxGfHtU4bVfdZ2/GSS/98GcZtdYH4RBImYx8BK8QKsD6fPJIpSr1
         htnQWrMICnR0qYQIXrcUpgjrInVSfg8CF5a4ITUblHIJ+LDr22xjXLk4rCcyByUPMs78
         lEvA==
X-Forwarded-Encrypted: i=1; AJvYcCXt+MB/YQeVColtNHbRZ8ug0kBf0DibwSTEBahDkBE7FC5tene/6n0Q4nZpvgnwQuvin2e3saY/dtX+NdlR@vger.kernel.org
X-Gm-Message-State: AOJu0YwMIROPgXGBc5wXSXwyMD5DjWF4J3qB9G9QGVrRJqGwymAjte9s
	VPdnsBU5D8YCOX99i2m1V5RG3AFK+fELImSl0spxTdsd/CYSmm3RKnCffAxcXZ66QkrBPDGgx30
	tX63SzYx2IaxWjHH3bJGVDd1RcKH9Yz4GJgZeQwKdAGi1JB7/pOWoY4ukeSlZdpLZ2Eg=
X-Gm-Gg: ASbGncvHWbFWtCsYuLM7w+J2Z/fToJCOJUaqxOMWS+AaOT9OoBtZHjXSGV0dbJLDkRZ
	OiLHlX+CQisWfByl/8B/fMJ61DNcWWz/NMvUylkaQbf6MZ9yU9GXVJthiYy8FpuSpgpUnGghPCA
	GDSGH0coT09cgKFYtS/yCVl/JrxI/68Ma9/YRsIItFsQDkymM9nrINjc+LXNlw/1jZoO4jY71Tp
	c0qQHSVdXvbyaBCCIg2kofQ4XMGRjuXHag3bW5aOCtL47udVSMN4Z8zfPagFm25Oqv2VtDe1hpH
	fzZgUd5eK5Fo3oFU61MLdcOL/D3Nl3t8pYTwRMrqqln4dPs7DmiBjU2IVQBtPw==
X-Received: by 2002:ad4:5ba5:0:b0:702:c123:da1c with SMTP id 6a1803df08f44-702c6d5a1bfmr3133176d6.18.1751584995721;
        Thu, 03 Jul 2025 16:23:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYU49F29nXLLJhUF6aQEdxZXPH42Yhu1DTnmyZaul5HXNd1rIQI+KPYemKNRW8NflwAqOr4g==
X-Received: by 2002:ad4:5ba5:0:b0:702:c123:da1c with SMTP id 6a1803df08f44-702c6d5a1bfmr3132936d6.18.1751584995402;
        Thu, 03 Jul 2025 16:23:15 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:14 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:29 -0400
Subject: [PATCH 05/10] clk: qcom: smd-rpm: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-5-3a8da898367e@redhat.com>
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1507;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=jJkTWWJF3/5RXKxSt11n2asRYUE42Jhyt7x72H7Kcqg=;
 b=WVf99xpXURqHDMOlRG1isIsZmcxQ2hVzruPLXEZLBIO4b3rIoDFPUB+65Us88g7XSb6xd555r
 vRtnzyNPfgpB/pkwsRXhEbFCMwp6sgfC61aI01PDavIaz23Jb23DZ8c
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/qcom/clk-smd-rpm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 3fbaa646286f284da12b902873b079863a2c0d77..3bf6df3884a542e7be572f2319990c2bfa7bc642 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -370,15 +370,15 @@ static int clk_smd_rpm_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static long clk_smd_rpm_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int clk_smd_rpm_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	/*
 	 * RPM handles rate rounding and we don't have a way to
 	 * know what the rate will be, so just return whatever
 	 * rate is requested.
 	 */
-	return rate;
+	return 0;
 }
 
 static unsigned long clk_smd_rpm_recalc_rate(struct clk_hw *hw,
@@ -427,7 +427,7 @@ static const struct clk_ops clk_smd_rpm_ops = {
 	.prepare	= clk_smd_rpm_prepare,
 	.unprepare	= clk_smd_rpm_unprepare,
 	.set_rate	= clk_smd_rpm_set_rate,
-	.round_rate	= clk_smd_rpm_round_rate,
+	.determine_rate = clk_smd_rpm_determine_rate,
 	.recalc_rate	= clk_smd_rpm_recalc_rate,
 };
 

-- 
2.50.0


