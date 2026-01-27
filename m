Return-Path: <linux-arm-msm+bounces-90856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEJEFRr2eGnYuAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 18:30:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C228F98755
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 18:30:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1808308200C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7808D2E9759;
	Tue, 27 Jan 2026 17:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kCj5gxwT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191952E7F38
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 17:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769534889; cv=none; b=mvIGGQe8RPBhUZYq7FJgD27v60CyZAClk41Ya+39cqEkVUmT47jCVpwBncIRnaCc1GnOQmp5hEykBvIP8wJ/hQ4OahFb05+6C2BsKnh7J3Igw+IAoCyplmMdfWOWzJk1uAoMufCM1JN9zYkbVNjP8Qklwk8Hj0VM2G+74wGWSb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769534889; c=relaxed/simple;
	bh=iMyglFugiN2I48xS8C84EyFSphRI+ehxCkoM0/iDjQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=URCNBN2jBJT/gzJFqnrgTENn8P9R+MUI/RjiQQpRLjTbcK6RiNYnPgv8DZ+4MpAdHZu8QRlqtAQ+/4RqEkVmPBbENbeQnoeIqWO3nn/9vWx4oDDRbp1OFd9YQTJ7z134V4ZKaLs6rFYB+6XDXz6TFtStw/jNqf/zqWd6cvPKvxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kCj5gxwT; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c636487ccaeso1537872a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 09:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769534887; x=1770139687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2jfwQYt580vw+h8d2tqfwVxK1bX+6/yKQRmVwPwaUI=;
        b=kCj5gxwTG2l9pt3gn6WtC53DCogO+IjKHQXw+lcCOwBVwyG8iwHDqHSUGiTOguI7y5
         36AbjimryFOR9B5k/8D8g7m+cNO3wiYlPb/CLkK2tQh62LdkzCaAS9725+xODaUjtkak
         VziuShuwxTKoKBs21OAdapXR4ze50HtJPSGoguWIkbXDcRo5R0JZKGYMw0mwFwMv8Z3Z
         tqrFVZtT9qJOou4MNWayoFFzYqJVm+zz3twGINyB4Eon/6mPbNk6GCybwvBsMJD8z4Ur
         m4qo6ukVudMK68qwT8pfk7sqcVzSuh/h40yG3OqPohSB+o/BAqAwaHCilcK7FuXI0g23
         0xAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769534887; x=1770139687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v2jfwQYt580vw+h8d2tqfwVxK1bX+6/yKQRmVwPwaUI=;
        b=JrQzb/F3NcZzHRQFw0Ja/epRvUJS3FdTcXKTq3INyIEk6/UleqZ6Z04ajRt4pMfOAz
         6XfGVw4FXhdj5nHkbSRJRMmQufz1KkqRlPjICdy1kWUNAoNcH5+UFd3mVCbRaDzfjcze
         keQtsIA+BGlczVE/Wpd017NW+eFyFj+VksGzEwvQBnYgTtG/J7vSLRdL3Dbae4KOKTmF
         pwtN1V5LpePcYqVwp4Vu0HeB/SfvzTjriQIgp/Vwem0iUjc5ghbHOTge1Td91fGnSzng
         mXzs/7ktsn0QrgSRlqPFmOZOujw3E6v8o/gJlX6wLS9GhbPSRo/LueINALiiTHF0AiOI
         8sWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNrw9MRlLSpkh49rIG4RY3B7xusZzlSTWCtMaMGeZPg8R8rFamKygSXJv9ZAkFTB1d6xrmGHuyaOD+jAXs@vger.kernel.org
X-Gm-Message-State: AOJu0YylwL6ZwOliC9DVR8NS/b2pf2zukkdDq7MHPdd0j7wHzipU06ia
	rCR/smv2xEi4XyVSjTw+bNsUqYKhG7nedew+EWFtdVAKkDoYlUMaHWBr
X-Gm-Gg: AZuq6aKtRNA3aEmvqwy1BZsumAgMUu1aqZdimu5xzMl4RNdZqIo9Vir8AG0R3ajAlQO
	M9WVYCGUHPaAgpmkXKSntl57OEiCOu0gYan2I6xstu1qXfTU6FFS+S9WNLR3gutEiGke5g+vMcC
	ocd0tbcmI7xkV+Pac7qVG5zxGI85iCypoGePKxP/lZCc5g1TFFJhGIh60G5Uk5sEfOAQns+0P9Q
	H2D3T+m63KlUhA2X6YvcuWPx+UskrDEWEFOaVGTEfptHJVSi/0KOGWHsJhRNHv9UStl+Swt3KOk
	4c0E4k03TxEyJDnebKAcSJsKIi4tDJ9TOQgXPeIRDh5bZ8QqlDgGFlmJtUWMyPJ2XnRSHKLS3Ss
	BnGf67Lc+ks/flM2khSEf3ri5NA4c88neKe7w/XKx91BCCWfcTiqUoe7Tm13Ok7wAmYXOc4bkY/
	bhmgkbBYEfQI4FFmRjZbkEain1FF5W3pc+N/PFTkFeJlKtOg==
X-Received: by 2002:a17:902:ceca:b0:2a1:35df:2513 with SMTP id d9443c01a7336-2a870d613bfmr26164625ad.17.1769534887276;
        Tue, 27 Jan 2026 09:28:07 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:d29a:ea37:2567:751])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fad770sm125058905ad.67.2026.01.27.09.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 09:28:07 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com
Cc: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Saikiran <bjsaikiran@gmail.com>
Subject: [PATCH] regulator: qcom-rpmh: Add support for regulator-off-on-delay-us
Date: Tue, 27 Jan 2026 22:57:57 +0530
Message-ID: <20260127172757.75221-2-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260127172757.75221-1-bjsaikiran@gmail.com>
References: <20260127172757.75221-1-bjsaikiran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90856-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C228F98755
X-Rspamd-Action: no action

Some Qualcomm platforms require a significant delay after powering off a
rail before it can be powered on again, especially for regulators that
depend on passive discharge.

The core regulator framework supports this via the 'regulator-off-on-delay-us'
property, but the RPMh regulator driver currently ignores it.

Add support for parsing this generic property from device tree and
populating the regulator descriptor. This allows board-specific DTS files
to specify required discharge delays for RPMh-controlled regulators.

Tested-on: Lenovo Yoga Slim 7x (Snapdragon X Elite)
Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 6e4cb2871fca..aafba61551b3 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -503,6 +503,9 @@ static int rpmh_regulator_init_vreg(struct rpmh_vreg *vreg, struct device *dev,
 	vreg->always_wait_for_ack = of_property_read_bool(node,
 						"qcom,always-wait-for-ack");
 
+	of_property_read_u32(node, "regulator-off-on-delay-us",
+			     &vreg->rdesc.off_on_delay);
+
 	vreg->rdesc.owner	= THIS_MODULE;
 	vreg->rdesc.type	= REGULATOR_VOLTAGE;
 	vreg->rdesc.ops		= vreg->hw_data->ops;
-- 
2.51.0


