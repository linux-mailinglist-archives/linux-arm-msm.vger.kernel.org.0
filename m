Return-Path: <linux-arm-msm+bounces-104535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOYeM2YJ7WkEegAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 20:35:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0F94675B4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 20:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89E08305021B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 18:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D195372B4F;
	Sat, 25 Apr 2026 18:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3bWBZMS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FFD378D8D
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 18:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141896; cv=none; b=PobXXEsM1Wr5EW8ZBSXWts2cM2Z8Vi6VE0p1ygPxQusLFURLpwLgqMwg81omacyKUeTlxCArQAGQGuhr06nuwNHPFtz5p7q+/UGYdwgpyebPnbkKs7JOjrcmiAKCx5LHf4iTP2Yg11YeU4yggg7aCysBTqNrnI4dR36cneF4GeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141896; c=relaxed/simple;
	bh=VSLaSITH1xdATqlS484rLYMQm4ukxtGBmOVJ8SIHjDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DLxeK8+o9TBttRskSP9KE0pkaVnhCibfheQbkOxT9Z2GtkTrWxDnM2tfwppNXZIzzjwApgy0X2JWwZsJknkr6hCBRxN3BPdza37P4mt7YXJMAuWOII71x//J0Ck/rKJGy+uBKLylgFNacjiQqaZMAmArBDcVVlQ7NUDWXYfoBYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3bWBZMS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so74042405e9.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 11:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141889; x=1777746689; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MV/bujBx1VBvtoI0/pKFxzWl/PDaO04fBui3KZGqFvc=;
        b=Y3bWBZMS/mcFFkGD36D5wZookWEBsU/W7RzuCuJG1bTN/LngYLXZtRhJ6jEnioAfRd
         QPGWsOK8FPte1RMcqLeHyhHsfubHgWB8fe8PLfap5P162//Cvk+l4QqcSsU0AYqIgvxj
         hxOAM8sQEBtcxcZSDc9pBY/ARDoNELA74e/684bWDsFUwBJrQAA1TdbWsd/OeEQjYfLH
         MOQv1JBi6hK2xTwv2kl5H9Ko7mn1A8OStDJ6mEFuQdZWdOl5fGVOvM8vCKb0iRRK1vqL
         Bg3emTp1LE6TG4WUrJPfkgIZ6fJN0FHKLMgfGDYMpeM8UYV1r5c60+HVXB7hFEsLptIv
         18wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141889; x=1777746689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MV/bujBx1VBvtoI0/pKFxzWl/PDaO04fBui3KZGqFvc=;
        b=F3fsZ6W8a8J2O81t2ZR+KsYV5SaDpcchbXlwRZDpw7GAeZSMluy6dyC1zfeVS9V7tx
         3RhFlbnBNutHeMi6Hs1wF3n5yUBmeUI098uk1cvBFsQgifrWLF7OYuXbKoKFQtcUFwG9
         odbwM/ZRboX6oi8CrK6fUoKP8ZETv7BwJ2j6bYFLfaTZj8mrAHnealk8JK+oC3UipBJ5
         2tq4td7d8+8RoRcAbVSzD+6KQVUXpA/HKpCWHA+v26MQvQQopz5FcbmA5X9a+QI2FW+f
         Gu6v+wsM3ti5thevUgC983l7vaGuD9RPTHnZBCtCf8Cj1Dzu+wrYvNQVlY2UUOJe3bTz
         /mtg==
X-Forwarded-Encrypted: i=1; AFNElJ/3TRMc+YjrkJjQY4T7OXyiP7AKdhEjsAtLBx856xMswoUjL3A9WIprJCylC4dHIs6UqblZyRkfJLGy43hX@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz8a7VYcmxA7nzYtuVvC5FryDFnNzN1rlPQcPDWxvveJyT7I0q
	Hchv+AlcuYDeWkTgj6wgl/xgxRSTGDo29HgXTx8m1Q4HqoMe2oSzqEsicW8u4okv
X-Gm-Gg: AeBDieu41bE3w16srzlCUuTKXBHiulkkrXoTNyd2zif8BO+XlVDHRCb5F3dG8umpS2A
	CZwTez+RA11euPo6Ipfra6gSJHo7FZ2rxdM65OVf6oryiTV+rjdJlPSDhgF8xKib3F1fkeIqIWc
	w+zE2teEC7baaZFy2kH7xvyjJiMzxR6HrFbSdcRv5F6VGKiUaUjx6HpvsnpSysMEhrx/V7QfDOa
	ZeIAWmlwz2AEONHRModTi6gYhra/H9J9r2zM6or2Wdu+zySqeozhv4zS30VdYe2m2qcabj2YPTS
	aV63aafEzoY2iVNmb1a2O1+5PB7TAptxH3MX8Rllq48EckM+tpEroKWXXQ1VY0zrvSg6IQGKGx3
	OYJMkCujXCHzpgDOxq5hnxwQp//MFD41vz6N5pkbpAjgbImcGEvneyRkKxPxcYcrgDU9/WyDoaQ
	qzotU8xLR+E8C1DlKwjyAjpm6d4tMglGKsW4I=
X-Received: by 2002:a05:600c:3483:b0:488:af7f:775f with SMTP id 5b1f17b1804b1-488fb77d343mr512182135e9.18.1777141889423;
        Sat, 25 Apr 2026 11:31:29 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:29 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:07 +0300
Subject: [PATCH RFC v2 06/11] arm64: dts: qcom: msm8939-asus-z00t: add
 Venus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-msm8939-venus-rfc-v2-6-f69e52b36207@gmail.com>
References: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
In-Reply-To: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 1E0F94675B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104535-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.

Default firmware paths work on Asus ZenFone 2 Laser/Selfie, which
means firmware-name property can be left out.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index 90e966242720..231a3e9c1929 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -267,6 +267,14 @@ &usb_hs_phy {
 	extcon = <&usb_id>;
 };
 
+&venus {
+	status = "okay";
+};
+
+&venus_mem {
+	status = "okay";
+};
+
 &wcnss {
 	status = "okay";
 };

-- 
2.54.0


