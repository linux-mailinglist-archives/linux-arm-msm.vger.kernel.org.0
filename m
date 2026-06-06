Return-Path: <linux-arm-msm+bounces-111463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lR+4GX+dI2rgvwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 06:09:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D636C64C578
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 06:09:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=o8FcU1pr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111463-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111463-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 613AB302BDFF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 04:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD372F7EFE;
	Sat,  6 Jun 2026 04:07:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CCD274B23
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 04:07:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780718864; cv=none; b=P6O4kVzWlnN53akNqW4S/qbPnx39VuOHSYcvijTJ2vqVNCB6r+niwz4jc8XDHWzqR9LHbOaBhyWkLvkfdLmDl2xW2ojYw1HsxS2FYEGSNxTPLpikSl7WLk4RgMX8HmjVWL4tGL+W0E4e0uzjBsPPTtZ2Z8RqcFGwGnoqpV9qjTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780718864; c=relaxed/simple;
	bh=9x7dw6AGeMKh1Bn92NV9sKxESMgeC0e3t78u9dvb9bA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VLsu36ymVne4kv/qY8+4CR6JMCct7Cm3JM3z/JXG7Hvxoqwtflvc93c1s/zH03qTTZyZfuyl9v7mz2Q+U98Hp4ZDuzIG92mAJ5jeHrIozVSb5j7vaobEwZS6tBufccD91A/SU6DPR3opeWfCJgt6r0yFvFO700Eu5xKACOVrnT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o8FcU1pr; arc=none smtp.client-ip=209.85.215.172
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c858d69bde9so1180092a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 21:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780718862; x=1781323662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BL2rDzljN+JUju+bXJw3h26H68MI0w3fOTjMRKuD/Zw=;
        b=o8FcU1prgprO3Xy2eDkLKuwWPIpcN/lweHFbOBL4hYiemBOCdITAgyv2FtqP7WQqX/
         IhPvQktKNZYJOBTC/TSGPanX6YAsRfDulfz3UFtz06NqctSZPhx02RXhSsReioVuFLPz
         qmLcv2SHicTKuq6a3aZoZa/kr6UI5QDkOl1eyE6V3aXxJgACv5UDiERFQdYX/TMP85En
         D1e0Ay/OTQRTz1IpfmjlQVd1HGh0y93XsrF8hMlQLWZeK8H4X291MWvK6UBH9N1VDbQ4
         dzfEfVkq3FiON4YD7ejaVs9/7OxtZwF9U2NA6qyNvCUsyXEACr2gWf6/QXv5+7mkyDrt
         wDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780718862; x=1781323662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BL2rDzljN+JUju+bXJw3h26H68MI0w3fOTjMRKuD/Zw=;
        b=AMl07F6RdlzjC0Op0678QSe3XnUmVUEeoPWB2R+pKO3HUuQCTMveWfQXf9uheghzJf
         yIhS1Dt2vWi9PMOoOrxh1PVUhRLM3RA05L4/DaX1NCOHiKMzs6sx1RMCdwm0YtqzdCow
         CrYqoU6D3BLfODgmSYJygVSh7GEZweNdxqWy8Dk+lYQ7XBlZ1HEznhaW0grmbPgv8Fqj
         VzWYWjJm1FFR+5A9Ry7/H6qePonUFXoBemTlCk1xD6Bd8aWitV2gA5PVQ8KK2/ZYJ+tn
         cCgA4WvSmG6QUNOtpHvhIjN2ki5P0d+Je76kekWvSvatVaJCdplKtjRZo9KkglIrLIH+
         XnMg==
X-Forwarded-Encrypted: i=1; AFNElJ9lcScDA2rtQYPo9b6npILzlyXQDqUqePw+FwAH2CM49BKNlS6bGzB6PgYUNjkcm8tXc4gSYtct1ywhoiV1@vger.kernel.org
X-Gm-Message-State: AOJu0YwNjNFVW7LrcXP2+w6yHEg40ntFghsVRuCt7tUV41fWVC6/xWAA
	s6Yt9MyPsJAMVdlRNeIR0m3JVBPssnLnqfg55KnkIF1vmdmlhn4DJMq+
X-Gm-Gg: Acq92OHJNccSdjWstxH95qYQ8FtFFTE4BNoLvNsWGAsXxqh3jWwAdGaP3IYxXM4Rp+Z
	j2UANeJzD3b4HX1KHIX6S4Z6cU9YVWeM2NbGzLT294M9irPkGwf2KwaWtl7tbo2SICFEjmIEoq5
	cwgBvmeuRe9trsoYY58NDXFmU2WZX36/ZzZxssvdZuVgccF0osrmvgnkRZuqS0t0j/1Ll51YDB1
	PZuCcCedozUNajaXR+qfde7tZ8w1o4ZM6MFBwY8PI43kcQWzGiNrXldqec1u1vuMnyOUG7ksJWT
	K4gFIuBkLI2wik3WcIkldFKyS4DT+CukguEtaZFL9RnQl48Yww+jIrYcnYFsgHqbpgrJK/TAPaA
	R83ZJpVSEAXt49dFoGq9bkWz2XcMR63kybYJV79mredKdAKgQHW6JzWEqYktv6MOnxbBwWVHizb
	ndTlXWHWu+cDRPOBBRgCj9ENq9JbrHsy2vRCe/BaZ+p+2y9MR+Y1r9TBHfiafNC2VX
X-Received: by 2002:a05:6a20:7483:b0:3b4:65ac:e2ed with SMTP id adf61e73a8af0-3b4cccfde75mr8758914637.2.1780718862406;
        Fri, 05 Jun 2026 21:07:42 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:967f:7ce4:ec98:f08b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b2ddbsm9042027a12.24.2026.06.05.21.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 21:07:42 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] media: iris: check decoder format allocations
Date: Sat,  6 Jun 2026 12:07:36 +0800
Message-ID: <20260606040736.13-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111463-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[quicinc.com,linux.dev,linaro.org,kernel.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[ruoyuw560@gmail.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:quic_vgarodia@quicinc.com,m:quic_dikshita@quicinc.com,m:abhinav.kumar@linux.dev,m:bryan.odonoghue@linaro.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ruoyuw560@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruoyuw560@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D636C64C578

iris_vdec_inst_init() allocates the source and destination v4l2_format
structures and then immediately writes fields through inst->fmt_src and
inst->fmt_dst. Either allocation can fail, leading to a NULL pointer
dereference during instance initialization.

Check both allocations before initializing the formats. Free any partial
allocation, clear the instance pointers so later cleanup does not see
dangling values, and return -ENOMEM so the open path can unwind the
instance.

Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 99d544e2af4f9..dd18079a9ea5f 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -23,6 +23,13 @@ int iris_vdec_inst_init(struct iris_inst *inst)
 
 	inst->fmt_src = kzalloc_obj(*inst->fmt_src);
 	inst->fmt_dst = kzalloc_obj(*inst->fmt_dst);
+	if (!inst->fmt_src || !inst->fmt_dst) {
+		kfree(inst->fmt_src);
+		kfree(inst->fmt_dst);
+		inst->fmt_src = NULL;
+		inst->fmt_dst = NULL;
+		return -ENOMEM;
+	}
 
 	inst->fw_min_count = MIN_BUFFERS;
 
-- 
2.34.1


