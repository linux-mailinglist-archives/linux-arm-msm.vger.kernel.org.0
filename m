Return-Path: <linux-arm-msm+bounces-109833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMC4If2hFWprWwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:37:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE2A5D69B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:37:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 49EAA301FE7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47DC73FB067;
	Tue, 26 May 2026 13:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MkFnESDZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A523FAE0D
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 13:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802302; cv=none; b=KbQOXr84paOOLMb+f/Oxd/QttllCdkzZecdA3348Kl+YQuUR/FDSKhYO/JlXM/UTtehReXq+uxvWaVsImSAEBmxk9QLs9cXlNUYDX60iHbeHFmIszZ+Qttx6Jo1yyqbFrpPfLMtzQD1veINSBZ3F87DkWIMKU1VOrmlCnt/3l9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802302; c=relaxed/simple;
	bh=JnLKribf6AOHWDcyQv5gYJuWC2U2xXYnGbnDQ8hOUS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UjpmxBdEXsJKylJFu+1IU/uRxITx/xWZYMU+fCzvPPdqb8sKEuE2EEHMzDJ5dZ+tqt4dOYRafahvraDxdEd7lEXg55dM3wFrlLH3VugmIiQXcQmzbyEb3KKmSxJNOyK7NXFSnWjd05jdlRvTLcr3lDBBcQBbGGIdp3x3N/+nR5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MkFnESDZ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4903d5c67bfso26171195e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 06:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779802296; x=1780407096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=amBSrb1L86JvC9qeeZudzfDQINj7fZsVpdnG470cOWg=;
        b=MkFnESDZ7DLJ9+quB3dxFSDweMX9dE1XkK7rPHfSbBH1SByaoAfLapOwalTPAFOebE
         6dwiCgT78lSxCDTZGTSW/9w3pf9YTx6xA4E2CLksFQDXRyLfdqVx2eea5wF/xkcYytDu
         CUFrOjhMgTBkllaLKxTCx9cEnug4KR+0ByL+V1c4Cz5leD3ei/lBJ9G5BH9RWz4YWrhe
         EuXqZcfFmRM2O8uuUAbLRNNJ73g8phLPsG9rfX1lRm9szKpVC22HOBkOqk8hdnyGh4of
         49rDKBXFSN5NJee9cCXvW0Lx6U7x9Bma3j+0h1iMf2b2004N/L4QuNKdx8t3ezTnFo9+
         RvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802296; x=1780407096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=amBSrb1L86JvC9qeeZudzfDQINj7fZsVpdnG470cOWg=;
        b=sW8DNfftPOFcxW575CP8V0kvAx9qp8zuU/Fz+BNGIoIDmFHHecxBGOkua31ytNOhVV
         5/Su5jJzRzfb1V8z9K9bgqKcniL6hhm9X1/FUoxWKyuOAFi3SIVLUpjbnNFAe/qbskW+
         cO0wIm86zezpXjokocvXGvovDqDpMd8HsnVIjNfpRrDmbqCAD14JH3SwFlj0pg4/Jqw4
         IxELhZW7HOUdKLOSnC3eVUcTbA75ESNkC6P86F1UuN6UbXRHOx7d/JGlRaVD6BhJ/AYO
         XmP/A8RnrTdI6g6xgPtfW4lR0htwzqzTlE3pNXPVclBfpwD0Zyqvbfd/I7ataDERrJlU
         +eNg==
X-Forwarded-Encrypted: i=1; AFNElJ8FnjF7mFUWfql2Y1UJN4jq9wql7p6bwEdDJGvxizwXHsYbYTquoGQjOxtt6COJYi0h3ndikWw+TPq5KFEA@vger.kernel.org
X-Gm-Message-State: AOJu0YyjrTG4uT9duSZ5Ej95RxrB/k+DYnvIgTQ262ipJydOiMsBuFlD
	Ys/xdFIrpTGJrcZlz26BObmvUVY+SwNbLg3X3GNIVvtS1aRK62sXyTFv
X-Gm-Gg: Acq92OHh9UJmMm3x356n8EI+Bk/kI/vEnElsCoMxQXfHFaKMxvJI6g352eIjqJqraTw
	QJF5tWwvepDHqLeRZBXaH0f7KGg+xbWnVZ19P944wUPLR5SpKmcdozARLI9v1vrq626bik6obFf
	rMzaCoar4jpDsb9+Ug7worKQZ1J+JyWl81U/sFCzN2sNFtRn9NPhobRnkaqpvU+NLvWSNPBS9QB
	8muK0J3FjYaBkxWkUqtUEHwIzLoZbmvn9J850uxWgoY8UbKF0/eDn79xO6zYYZmon2gIC2n8MhF
	HXKe5fsGINkl0E0OOX3va5iZIj1gBL0yP6mKniQI7DRvZqau3hP8t8QwXdiVafpza8cI0cingTB
	tAaHAQwbVEgzxXQgUiZn8aBPidYo9daZge0C3/lfMLNJoA8X6cQRbnJu4yEw07QdJVuee/oMyy1
	l9xpIUrzHesQCvsdhnlw6Ccmhtuw==
X-Received: by 2002:a05:600c:3592:b0:490:44eb:c1d9 with SMTP id 5b1f17b1804b1-49044ebc292mr352432175e9.28.1779802295540;
        Tue, 26 May 2026 06:31:35 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452580dfsm170958895e9.1.2026.05.26.06.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:31:35 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 26 May 2026 16:24:25 +0300
Subject: [PATCH v9 2/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-msm8939-venus-rfc-v9-2-bb1069f3fe02@gmail.com>
References: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
In-Reply-To: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109833-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: CEE2A5D69B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Allow Venus core GDSCs to have their control passed to hardware, so they
can be powered on by Venus firmware.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/clk/qcom/gcc-msm8939.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 45193b3d714b..956295289ae8 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
 
 static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 	.halt_reg = 0x4c02c,
+	.halt_check = BRANCH_HALT,
 	.clkr = {
 		.enable_reg = 0x4c02c,
 		.enable_mask = BIT(0),
@@ -3681,6 +3682,7 @@ static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 
 static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
 	.halt_reg = 0x4c034,
+	.halt_check = BRANCH_HALT,
 	.clkr = {
 		.enable_reg = 0x4c034,
 		.enable_mask = BIT(0),
@@ -3753,6 +3755,7 @@ static struct gdsc venus_core0_gdsc = {
 	.pd = {
 		.name = "venus_core0",
 	},
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
 	.pd = {
 		.name = "venus_core1",
 	},
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 

-- 
2.54.0


