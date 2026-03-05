Return-Path: <linux-arm-msm+bounces-95581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIqdIqBVqWli5gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:06:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3805E20F5C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:06:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EC0B8307ADC1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 10:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7551B37C101;
	Thu,  5 Mar 2026 10:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RRhCBGNt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FB12D8399
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 10:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704970; cv=none; b=KN7fuCjX4j4wolpzputAnp45ay3LgcQLpfMEXm1GcMFuZql5YSJkMBY1MZNu6YVze3mpPMxxeinx7o7YkGTgmC36yaayyqQ4lIcEnKVR2hRIGaI0OPd8c/nKLXRH7lm+wECI1DwPlUcGo8USBEyMnDnsyISyjldHe6LKNCp9L8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704970; c=relaxed/simple;
	bh=hcnMZVDwUZ+EGbvLXxia/KehBwbwRkhgOkugMzIQI0o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=emYFcefkWAZp+SobTLRzrFG93708YguIqQp/VEztsEgjzvzU9p4Ftkaygb9ZLahkOUOHWCCxuSilfUEmyWKR5cQB0H2ufhi3gKVU8ZU5LCbfnVS/8/fOFRa/yvgr5BP9P2jUjV32l+MwqItxK7YxdcBJogwtm8YSnubyklQ44h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RRhCBGNt; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48371119eacso93564915e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 02:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772704967; x=1773309767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FAdsTf7MFOGZ52YqX65Y5KfNmcZTpehqi/9UwGDGN68=;
        b=RRhCBGNt5dofnKh5VnWKjrz/eceAs+gAdH2ETpJJ3SAX3jH+2FrIo7ILrb85vyL8oa
         MQfJOf9yiMt6WxMtUYYe2WFeuox1GAzB/NABynHuIQwhqnCXaH8/NPD0ivCZHX0e+M02
         X89K2sfG07PVeE6g0NEqqHbFq5nbuWuwMDHBvYP26/mGCfwlJbFgSS3xlFpFIsCh13gE
         aGlbUilKFn1gyhqGcW8YsNYIsfBNxeJAjVaphC9vOAcRIm19S+zKnrNFOklGX9uDPz2w
         QBGol4sLew4UVtVF2dO8K1/cK1LTuLF3wB7cRUmE1Ar98ncoqLZ7NilHD1ZvjldpfzYJ
         MULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704967; x=1773309767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAdsTf7MFOGZ52YqX65Y5KfNmcZTpehqi/9UwGDGN68=;
        b=T6NFhzdgfqE8Yof7MUvrYx81UwIdRjbpKbai6RG/MbD50xXyxSsT7rBHCE7UQ7ZBTP
         tdntKxSNa132hkUNr3sgKKxBIeHpKMF1PBBQObogA8TTQUhpNgyRPaln24Ws4XQ+2Yeq
         ehxTIgWYSAIIU73NhdapMJhzOK+LQKNMTbzR7qi0ya/GP9vlNOy5ZWl3pH1CveSZQt6E
         d1dsGwePg+ghyIpMpfNlpEuGgOhxEmGm2zsl7FQ2sHDDo/P4HVse2pisfSBKUJDUTr/G
         D3IrHb0DjfOkZ0zMZQROXjAzEWi3Xz9Z8S8guve2rv+fHJE5IpSgL74iT3RrBP04jvyA
         b9xA==
X-Forwarded-Encrypted: i=1; AJvYcCVbbj31PUUQi7PtFRc7OebxZXPXfCt5eWJd9tHSJsfTjfzsZVSgMyFkdSmZHyS7PGvtzUy0L5vsldUVTYPk@vger.kernel.org
X-Gm-Message-State: AOJu0YwT5EhFArtIN4L7K4TNR/sWPoyR2hYswSfkS99pHeik180IorWe
	wrd6mE5ryYinnLV+wqD7wY8IgZomkwRbeXXCXCEqbn4WiDJfllZJBIo1
X-Gm-Gg: ATEYQzxJuzLh8r9BQapIY7xrGBoiBtN62BqsxopcMZypNm7kCXRgO4DGiEZMktydPnl
	ElRKUAvV52LGmZrJ49vhB+kC1axzO08PtWUNIaxWBM44L9SZiTy1fKGf7lPcJpcfRPyGYyw1mD4
	R/qOX3HP65ZsK6mGivrFj5YeuJg3nN9x+XKV8NDyr35qBqrqD7X+/tz3sk9Tu87LM0PUgkpcxI2
	F2s2oZ/oVojoFTC7XxlF4lDKkCp+sMOAsCduGFaYrElbPdsK+WZy5EDlKnRlDhlEkxX0mT9zYmb
	ffiYgBpYIqm8Uh3xrihvOWpgOytc86CtjYokQj0nr8mkh6ATktGXCOxOI6HqaYh3VtLHFvNt3Sf
	wE/NfPuG6lvmvY7Xim1fvqA+SPl1Zd7Xri084iZRqMsoPF6VXSiDY0Xeek5cm15OEVS33EX6Nfa
	TX5K1ZhZZmG3t8lJgkR4LrAojeeo9tvKH83vTMTfmRARSivBW1ILexFS5qJg2v+IKMrEn2qSfDI
	rEaGhhoye/H
X-Received: by 2002:a05:600c:8105:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-4851983bf08mr76081195e9.6.1772704966997;
        Thu, 05 Mar 2026 02:02:46 -0800 (PST)
Received: from ThinkStation-P340.tmt.telital.com (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b4d06c27sm29409452f8f.17.2026.03.05.02.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 02:02:46 -0800 (PST)
From: Daniele Palmas <dnlplm@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH 1/1] bus: mhi: host: pci_generic: Add NMEA channels to FN920C04 and FN990A
Date: Thu,  5 Mar 2026 10:44:04 +0100
Message-Id: <20260305094404.1956028-1-dnlplm@gmail.com>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3805E20F5C0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95581-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dnlplm@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Add NMEA channels to Telit FN920C04 and FN990A configuration.

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
---
 drivers/bus/mhi/host/pci_generic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 425362037830..e5b647486f7b 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -798,6 +798,8 @@ static const struct mhi_channel_config mhi_telit_fn990_channels[] = {
 	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
 	MHI_CHANNEL_CONFIG_UL(92, "DUN2", 32, 1),
 	MHI_CHANNEL_CONFIG_DL(93, "DUN2", 32, 1),
+	MHI_CHANNEL_CONFIG_UL(94, "NMEA", 32, 1),
+	MHI_CHANNEL_CONFIG_DL(95, "NMEA", 32, 1),
 	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
 	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
 };
@@ -849,6 +851,8 @@ static const struct mhi_channel_config mhi_telit_fn920c04_channels[] = {
 	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
 	MHI_CHANNEL_CONFIG_UL(92, "DUN2", 32, 1),
 	MHI_CHANNEL_CONFIG_DL(93, "DUN2", 32, 1),
+	MHI_CHANNEL_CONFIG_UL(94, "NMEA", 32, 1),
+	MHI_CHANNEL_CONFIG_DL(95, "NMEA", 32, 1),
 	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
 	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
 };
-- 
2.37.1


