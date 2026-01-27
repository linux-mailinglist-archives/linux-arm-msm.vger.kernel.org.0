Return-Path: <linux-arm-msm+bounces-90859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBIhH234eGkxuQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 18:39:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C74CC98917
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 18:39:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5796530860CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1CD31B108;
	Tue, 27 Jan 2026 17:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YDDUt3kW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE55630C630
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 17:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769535465; cv=none; b=Ikg+M/Oi10D1JT4sVI51POCv7Nu6IRVd7cLxQyqlKvxNtFl5EOgieylhC9/PR6Utlo4YaFDXFIEVoM/zD7ghjPhFhQKdc4kF8LG2ATQSw7+xsXSGsRnmVqUbeD7TkbrzlTfpRb1PZj88HXBZdEGlVPYjn4ueA1i+uj2N8ajYNzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769535465; c=relaxed/simple;
	bh=lK9II1Dsnwq0vjo+mhmmlISiI/o/6ljoq4WEuaNBdMI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UjXqJb/jxB7dtGYQNU/lyniXRGH3knkTYaVdL+Q9k+qT1Rb3cxKoZgHSvHQTf6MlnNq7If7X35LdIsAECdgDLWNU3s4oa0Q8TdxGUZWs4aJh/AKq3URLV9FuZCa4ygHB5ODufYrKQ4rd8c8sIZuqVAF67ixgiBEqvNLeGJ4AEOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YDDUt3kW; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-bc274b8b15bso3788603a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 09:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769535463; x=1770140263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FEmxLuzrO1YBtIr6Vi+MR0THe4Bxy0XforMzKziIKYU=;
        b=YDDUt3kWmCwkZ1mMDuwpxhDUYwS96vwK21wiaG871nOgBjrB1S5mhcjJzYXkLyygJ8
         UkT0PoPspY41tUjXGTkFJ6bBQ8wAFDmSMBV2dOUMM2TZLXRS3Vwc6x+9yi968C8zn94Y
         tcXc+apeqFSpGRMR4nXRJpIr9pUryYznT/1ODkcVNPY1xb5yHZa1gYFWffM4qHxWZfaW
         LtcTsG86h/H0NxgPDJ3HbAVQJhKw+l0ITujshTsO7iFdEWA9g5SuQCuWLtMH25lwkbVF
         BW7B91MmpPkhB1URqmHDXKgJ1eH9IyyEWVDMAFeYEhjN9N1EWkQh6oKFZSkCOcX+aSgo
         KCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769535463; x=1770140263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FEmxLuzrO1YBtIr6Vi+MR0THe4Bxy0XforMzKziIKYU=;
        b=loS52oJh1RD5ewf1WN/6srrPwc2rq0ynt5fAgCHWuM2SxkfuMo4vbZpOzx1Luid9wv
         QgITNuq5o3XZnVtpU2oECF+JUm9chx6eXmEx7n6jW7Hhpdrl9UPJOHzQo0LRy2g8mKxk
         quwA46IiSNGI5r2oBf0QEBcCh7mzvp1Nt7hzCzpaavsrckfv5pe/6TDk4w6YNdXSTLFI
         Uz2xPkN8BU0OGwbFQXX9IRKCPd3lIeazJgLLCZE4wHVoaCIT8pmg6+7y83rITxAP786H
         Q7gVRIeo8EJc/7BA7f6LPlhI+H2iK4a3qxmKE4I8aeMN82DOc8UMb/kf78QS2hI7ckJ0
         e0yg==
X-Forwarded-Encrypted: i=1; AJvYcCU3xwOQqxTvA4tHkvaCFNSqvDIhrcBNvG/EnCEkwEQMR5qs13lexeYfl/RLkV+d4UBQZey7ZNghP4/PNFn9@vger.kernel.org
X-Gm-Message-State: AOJu0YzWXntT10mghzR6fr5H6VFB2Kg/uScWgjqmcLawToNKVLabVk9V
	sy+w37+7Jp1ACx3520EJU4QiX/RkVOqjVOH3CYQ2cBfTr5DgZFEzfJ/W
X-Gm-Gg: AZuq6aIU/KQq1Cw9DH0tTMnIJPkJsYT4oLkpOXL3eoJeD0ZosXTyOH4VIMFNK/qoZto
	uqJRGwE7IiaSCjw8dS9V5NmsXXPioWhL+EUOsVDTyOizp3deQ2jHLaBcZnegL6CnTVrN/nu3RLB
	T2NWx8Ol6Q8+NdWlrySD99Yy8FfaeNT1pO8vtdLTrCIcuaHWIb+zvbDSPeWhfGY6AqSdlCw/51o
	YbckQ4952r0u8NeZtsHdek/DI2h0d9qOhoHCFzIjfPB4T/QK5dvb8+fj75zLxdZoc6kd7gfAL23
	PNZK3VHKv/jD7Azgqc6bKiAsdu9R4fyL/SHaccPUMMTFJpZuPMNX2wWUHNLwCQwmJUnGtFWk5bB
	yMKccLRDuh7yB2raoh0SV7zd2VfSrzZmG3JSX1f/1vfLXcX0JgDSTBJj+XxDhV5mZrQFT0Pdcbb
	i7AmG2lH33blC3Mtp66Giumiz7xzxmP9FzIo4=
X-Received: by 2002:a17:903:2bcc:b0:290:c516:8c53 with SMTP id d9443c01a7336-2a870e35c72mr25832805ad.40.1769535463159;
        Tue, 27 Jan 2026 09:37:43 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:d29a:ea37:2567:751])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3eecb7sm181485ad.1.2026.01.27.09.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 09:37:42 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com
Cc: andersson@kernel.org,
	konrad.dybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Saikiran <bjsaikiran@gmail.com>
Subject: [PATCH v2] regulator: qcom-rpmh: Add support for regulator-off-on-delay-us
Date: Tue, 27 Jan 2026 23:07:36 +0530
Message-ID: <20260127173736.82976-1-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-90859-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: C74CC98917
X-Rspamd-Action: no action

The core regulator framework supports enforcing a physical off-time via
standard properties, but the `qcom-rpmh-regulator` driver currently ignores
them. This prevents boards with slow-discharging rails from enforcing safe
power-cycling constraints.

On the Lenovo Yoga Slim 7x (Snapdragon X Elite), certain camera regulators
rely on passive discharge and require a significant off-time to drop below
brownout thresholds. Without this driver support, we cannot enforce this
constraint via Device Tree, leading to sensor initialization failures during
rapid power cycling.

Add support for parsing the `regulator-off-on-delay-us` property from
the device tree.

I have tested this on the Yoga Slim 7x. When the delay property is present
in the device tree, the regulator core correctly blocks re-enable calls
until the delay passes, fixing the camera brownout issues.

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


