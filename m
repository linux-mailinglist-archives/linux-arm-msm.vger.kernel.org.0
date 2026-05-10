Return-Path: <linux-arm-msm+bounces-106803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EMoCsNUAGp5GQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 11:49:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD0C5036FD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 11:49:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CFA0C3031AE0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 09:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEE1930F927;
	Sun, 10 May 2026 09:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pgf7kvMm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1653A37BE9B
	for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 09:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406484; cv=none; b=ZcP+aI2wBzTofoIwX1XotFGiYcEEk1SgnLn6Mk6C2vzLonCSuiwKyvNPGj/sNRO10UzWSox1p3pQUSGt0crkr0EJMCn0p9YjpaaN7xlvQlPXxHTv1X5YhawrqO27FJ/m0d1i5cZj44e+6nYAl3pFji3B5LoMDJ41/o48xqfiFjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406484; c=relaxed/simple;
	bh=16AoPtmHTYpJSipw80SylHAI5EPglqbbZ9EkozbD51k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NM/ccRJWSnJ3es+eZWVUvutW3/ocJL/U4k65j+NnqyUq1e/mRvOvW/pKhy+axstYRM9tmc6RQzFHyN1Ui9Yf71BymBSxIlwC1iSsq3HrBe84mTJ64/AM966QE19jme96dmB5RE95pqj0wZQlYsppTXCOQC2/eGtt0XBvRKyo4SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pgf7kvMm; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso31709125e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 02:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406481; x=1779011281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MD8vAn9/wfDPga+z35YKtSQ1Eizg0RFa87mkXotuc18=;
        b=pgf7kvMmVkYJnmNLJoIUPvxtNlJMODYv2qv9olqLxTA9xJ34iJzlzS3ckObW5BmLA8
         9KYGhGj7JH4bHoo1ELMBamLipuaOrrc//AbOesrCHKw6rK3wroS/8Au3IFyj4F/ut4wh
         kvJPZTQmDF0FiGuL2ZUWB2UCCRRuaAK7a13iqSx4O266oQH4FbK9TBjaTIppQkpysCtV
         hc+/7vwyovW9HkAdM46eaTF7UHAdamEyTHgqontHzvzTUC2tEWi11vuKijxJED9445u8
         YrtkjCkyGbrMuIcMJBf0tqa9pD9Sc3B3s4oWQfUfoIKemXWsGIq6cRmZHeZC2soIZzyO
         mElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406481; x=1779011281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MD8vAn9/wfDPga+z35YKtSQ1Eizg0RFa87mkXotuc18=;
        b=WvjOSXtMTTTMqEh0dRa2+EjWPbGiyuK6EFT6Svn3BxvQ7ThPxESkRtrxSb1+/Mi8pw
         FKtXAGqDDKPv/FhDZtNqcCjCHgJFgfuflufJpvW8TO/btoMHi9B3h2efMXK/wNBeXiFp
         1lXr0jUGw0NtKrL5CFcqMhct50lg/GbHD3jb9a8G8LtosiqPQsUkzD6ZE1cEQ1+KJMju
         7kw6nM15DnjkiG5n4URQCLHufWOlLcZFsLr0FfR6+F6g1TswtDdKvupVTAlqUCF/8N1L
         2Ico/d2xqplCWYixEEnRN0Jm1Jx1w0N2BzD67Uxn13tcU0ZxuLrBKDD5mu3Sf3tjhVea
         XH6w==
X-Forwarded-Encrypted: i=1; AFNElJ9oCYnDepVtXKG1gkGEZF+9CvQyx098Rp9M6dWFV/nHCqub47mUjlkwu0KAj/H08ItPGqlbV3p3eE5eH6UF@vger.kernel.org
X-Gm-Message-State: AOJu0YzBZdcJsroujsqoMnfir9tJqgl/+4P5eDs1Ms17Wh/IMuIezWQB
	Fpbp6Qe2LEBGHaefxELi0A0vw0dE8ftbCEtD383BC0brmE0PdkDtg1by
X-Gm-Gg: Acq92OFkysUyzjarE2bRqReiFRyAjpHvd/6pLxqvcfmt+IlZO/8hPpiUz3NXW8sNfdp
	SCeV15D/DXo/tD1aV/bF4RY5j9FSgHEAVkpMLbzTkrFCv7SHyJ05ihPvNtQA0bWUr58FHff907X
	W4PkFF3vibNj65eYH7VcI6/M2Nq94sOOrdcYoYJcS2y6kBd1YIMa4gp+KQ/O077KKlLnO4w09qU
	CrdAOFA55THTBVpCdqtUN9QFT+Xz2bQS6JxFu2ZR2KjFwPAf5UlRgdYdEcVVrYTnhn4/BeAGjPb
	6epQtt9JEVzzrVKGKEdg0s0CtDho1ivC8UtImjMXrsRh+uEer8tBpHajaU3uX4r6w5QT5jk/nT5
	GapF2DF3fk2vy4HfiBYWj6E6T47f+WJibVEQc//gUsiQLLP8MAY0R7qDPa2W2pdEByhY1vOZASC
	PH3BHgTFFQRGE5dm189LDI0bT/LbTDfGMnYILDE20=
X-Received: by 2002:a05:600c:4710:b0:48e:7854:1608 with SMTP id 5b1f17b1804b1-48e7854162fmr52680165e9.25.1778406481389;
        Sun, 10 May 2026 02:48:01 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e0bf2sm182807925e9.4.2026.05.10.02.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:48:01 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 10 May 2026 12:47:41 +0300
Subject: [PATCH v6 3/8] arm64: dts: qcom: msm8939-longcheer-l9100: Enable
 venus node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260510-msm8939-venus-rfc-v6-3-e69465375900@gmail.com>
References: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
In-Reply-To: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
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
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: ACD0C5036FD
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
	TAGGED_FROM(0.00)[bounces-106803-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,apitzsch.eu:email]
X-Rspamd-Action: no action

From: André Apitzsch <git@apitzsch.eu>

Enable the venus node so that the video encoder/decoder will start
working.

Default paths for firmware work on BQ Aquaris M5, which means
firmware-name property can be left out.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
---
 arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
index 13422a19c26a..48514c3df718 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
@@ -314,6 +314,14 @@ &usb_hs_phy {
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


