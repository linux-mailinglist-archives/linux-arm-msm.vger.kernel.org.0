Return-Path: <linux-arm-msm+bounces-104552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HH4Lrne7WkzoQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2026 11:45:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 232AA4694F3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2026 11:45:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAF7E301C14F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2026 09:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A24345CC9;
	Sun, 26 Apr 2026 09:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gYO0MVcv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZTbggJpm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613BB3446AB
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 09:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777196707; cv=none; b=jt8MaQygZhg3LoONalq0LAcg8HtdwQJjezAR7iTHdDT4QZ4Xj36yhtULpBmiyEq2pw8lC+LoeWkgtJFg/GnCD4nwoM/AHlvBDIDZ9qn7hz1+opvikIvjp8dyWib7ybf1vUI6mR+8EEkI+tsTOFeP5IYCcwg2Z3FbUkqXbrwr81Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777196707; c=relaxed/simple;
	bh=szbdcDNEfxZa+wEBDB/1xeh7V3G/tli8/ScVE484ij0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ErVEKr0VJ8DchHzhIC0tb/zrdZY7kImtukkTZqytNeDedBNwcxGpe2n9c0PF2EC0nGpDXVIeVJo/erPWcKhb22BDj/M355aYAw66gCIPFY+QuJ75aFrC+R14p3o2i2TsLQyVc/t+nqqbgfbtfqzZfp0YAC/EQId4gu+ODsENupc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gYO0MVcv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZTbggJpm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63Q0DcWo3116764
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 09:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QhicpUFnXxLwO+yYmgy6LGHRJEgVAHkak5ZB119glgc=; b=gYO0MVcvlL2IfAn1
	qtf+6iUu/7ZoPzSQxhy8K8654aNQCnav3XsibtlBgGbN2JoC1BkBwbO2Hbg+83Ik
	z+k6x9hx3A2lXrJ/wm7s6pH/JfoSrrdX2zmLFn4BTR7g1fpqMTspk23c6AwCiqLq
	zYhFAgrMdXekTe+vPLJZMGIleLAdP/P140VInAMEM+qwdv/deynAcNPBD9C3QciO
	L1oPuDRja7RACWRlgW5POydfu12ZRCOFxoWMVvs0KQPB7nyanOhk4APm2VXpBF//
	tnIJptH9FLxFH0p3TbBed0xTx7TdMx1p+Wx47yLRf9JRRzfPyA+xpNbQjt7bFf4o
	CTXd/A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnu2tjf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 09:45:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b7c904d476so16906115ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 02:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777196704; x=1777801504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QhicpUFnXxLwO+yYmgy6LGHRJEgVAHkak5ZB119glgc=;
        b=ZTbggJpmEIuFFMQtV5oZ43ltxc1i8yg0jdjknaulazYw81NL/Nr8IEFTUUBq4yaLAq
         FwKT8EunLkToVx6ttPYTkqu7LsTASOoPUPyxnl5QyZtbGWroSMbDLbbCocjSwUcuwqtQ
         uQxM07NzbqJWZFHfG31p28AEZMbwS5AuGLOpqdM+Qw/kCCsmqYlsD3oFaN8RgUzOQXtg
         vhseqZA0gD6ntx9H7AV68z/lrLaxJ6U8U6q1lZJkmVNXvfnmRsJkBcCVsAj155c214qv
         PPoDPTuUDmyXrOcN344rblgBhMIbsg4s0gaOSvFJ/uxzYExgNy7LNZwtfsOPao5Roeyf
         bdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777196704; x=1777801504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QhicpUFnXxLwO+yYmgy6LGHRJEgVAHkak5ZB119glgc=;
        b=EncsKoJCcwJGz8ekwqOhkbwsiMqejD4ZT0c5XmhC1ZmQ/7gqqOl2+sfJLu8MC3Y6NF
         qbzSNzPqnYA7pXSKDwO/G3+SU3LyYmCwibH9lRjBXaBTpC3LZHAAGjrUMh7iHwi6JJr0
         I/7RuUA2IKmUDKwIpc8KyhH1jOXc8RBlW83ccG6U/5cf9TNxu0WdADaGIhycqb6KBztR
         jk0Xqc1RR3I3562xHB/wB7qcl00lbuMxZLgjLHJr6aaMzqCm92fplucIWc8WCXrAwe11
         yXC8w6TpqrfEUfBpEj/cyTDfN8Qvk4EL+rHtdrANuXKEW97YPwhm9jcqBc0CgbWaQ5ly
         REhQ==
X-Forwarded-Encrypted: i=1; AFNElJ//FlXp5D7vn9afYIwzfvqfPpdKQZUIht5usDFweHaoPjSd2NzQZtqECJWBgPgKMJL/hXt358oC3r+Ao1Fa@vger.kernel.org
X-Gm-Message-State: AOJu0Yxoe7a1MN/yj8o0WnWYxeqnFFGU21WG/19zxONQaNufhcUhWbpw
	2SCiNGILOOlpdcvsa20v8nZjuzyeYQQ/qDn2vojS6nttxNOI0dJBrPIZyu+zBBHEN1m4GkoU9dH
	RekbZuCPKH5t1JrHRRdxK0OngZkD4GDsnLWvfxkD0TQucwULObWalWml9La1FCbpeZGW1
X-Gm-Gg: AeBDiev105Fs1uFde5nNljWTtsLqrM33bbpY4ZAwFqMJXfjNtbZZJna+TEqkbxehaKq
	SEhvmNVlYUQHSH7MtrHgTUk6vokfpRYCkyDUeVD5YkmfYqiDXhzpehO9AtFxV3dubB8r2QVW1lL
	9YAA4GfP8zYaCwIcMzumNLjQwPMUkkRthejHjCBNk8ak737wIrr181wo9KCqzXdGvTqrPUfWRJh
	5THjYVH5AjxAq0vFRLK8M80NwRODGPil581Hq2nf5oNhlvnw7BszHdeoNSn/4KbkpRFZE+YwmIg
	56MxCp5OEaUUYRtx/DIXOBmXVXUTIPwTVgTsIZVudLWpLl/vydLudOgExxaTRwHKBWsOlNaGaP0
	58u4ky1vTkKB+mJ/GhbTNm6rRvDbcnvfX5WPO98nOUhOGomUE2+vJ6nZSCWLt8HIr36QE/F4SC0
	UKIcNi+qO6XZ7c0M8hXctHpJeR
X-Received: by 2002:a17:902:bf0b:b0:2b2:4b4e:e4d2 with SMTP id d9443c01a7336-2b5f9ede672mr275718895ad.15.1777196703953;
        Sun, 26 Apr 2026 02:45:03 -0700 (PDT)
X-Received: by 2002:a17:902:bf0b:b0:2b2:4b4e:e4d2 with SMTP id d9443c01a7336-2b5f9ede672mr275718735ad.15.1777196703418;
        Sun, 26 Apr 2026 02:45:03 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab208d4sm294960905ad.55.2026.04.26.02.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 02:45:03 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Sun, 26 Apr 2026 17:44:38 +0800
Subject: [PATCH v8 1/4] coresight: cti: Convert trigger usage fields to
 dynamic bitmaps and arrays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260426-extended-cti-v8-1-23b900a4902f@oss.qualcomm.com>
References: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
In-Reply-To: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_yingdeng@quicinc.com, Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777196695; l=11909;
 i=yingchao.deng@oss.qualcomm.com; s=20260426; h=from:subject:message-id;
 bh=szbdcDNEfxZa+wEBDB/1xeh7V3G/tli8/ScVE484ij0=;
 b=1HowNSpGCbTcPyqfJDD4zBSLNk+Sh8anrDkLhXwPh2w6qi3z6Hpav4gSb3QhMNaM62lnZZpEP
 a167+bcPvkWCQlhkusEDdZYrmBycjO6OyfcKjbECciEVMheXyDu321x
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=aufKZC4I8k2lqi+B/z87rB5kPPybOn8C3mLosbtw+no=
X-Proofpoint-GUID: LDLhyTK7AFwUhx7mfFeg5WUALa1Vex88
X-Authority-Analysis: v=2.4 cv=cbriaHDM c=1 sm=1 tr=0 ts=69eddea0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7_BDbhMBoegF64a6bMcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: LDLhyTK7AFwUhx7mfFeg5WUALa1Vex88
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI2MDEwMyBTYWx0ZWRfX0+/z6aGaoeQm
 92XQn0fOGfM7vNYWARdKH6c1yBfv0bf2NIhRInEDeR32xsM4KGxQ2HWnItlBOXGRcYpjvfUFz/3
 /vyzCqrWdPjoCvD7yb/YGjZpS3F0nIhJoDoI0yuck8b61U2JjdMEBeSprfhDBvtvugbu7QgS4sL
 REHP9UJwHP8Ob2RhyMXxbt/ziwMjRtVqSAoDuyDb8gfu0GI6fEFh4kmHBOTB1HUO8UQnTWiS2Ii
 ut2v7PY9L536CIO3Z0p98+4xfnVLZs0qopNeaVpKMiDiqTlHa8x7JftQwN9uuYAh/hhSzerzj/2
 yH4O+KKIbhsURurRhEY49i1ks44PoVukFBQM6nMV+gyiPlk5SFaRHewXHJJpsZtoSqoKbM2oAny
 vCP82CY7XwYclSD+lWO9eapxkokOTlK+JzKO1ohtS3qLgFsByyhMkdGxWv2jg7UDoIPZRaOCfij
 aCiA1jXAQEUbmK61+7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604260103
X-Rspamd-Queue-Id: 232AA4694F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-104552-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yingchao.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Replace the fixed-size u32 fields in the cti_config and cti_trig_grp
structure with dynamically allocated bitmaps and arrays. This allows
memory to be allocated based on the actual number of triggers during probe
time, reducing memory footprint and improving scalability for platforms
with varying trigger counts.

Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c   | 59 +++++++++++++++++-----
 .../hwtracing/coresight/coresight-cti-platform.c   | 26 +++++++---
 drivers/hwtracing/coresight/coresight-cti-sysfs.c  | 14 ++---
 drivers/hwtracing/coresight/coresight-cti.h        | 12 ++---
 4 files changed, 76 insertions(+), 35 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 2f4c9362709a..4e7d12bd2d3e 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -161,8 +161,8 @@ void cti_write_intack(struct device *dev, u32 ackval)
 /* DEVID[19:16] - number of CTM channels */
 #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 16, 19))
 
-static void cti_set_default_config(struct device *dev,
-				   struct cti_drvdata *drvdata)
+static int cti_set_default_config(struct device *dev,
+				  struct cti_drvdata *drvdata)
 {
 	struct cti_config *config = &drvdata->config;
 	u32 devid;
@@ -181,6 +181,26 @@ static void cti_set_default_config(struct device *dev,
 		config->nr_trig_max = CTIINOUTEN_MAX;
 	}
 
+	config->trig_in_use = devm_bitmap_zalloc(dev, config->nr_trig_max, GFP_KERNEL);
+	if (!config->trig_in_use)
+		return -ENOMEM;
+
+	config->trig_out_use = devm_bitmap_zalloc(dev, config->nr_trig_max, GFP_KERNEL);
+	if (!config->trig_out_use)
+		return -ENOMEM;
+
+	config->trig_out_filter = devm_bitmap_zalloc(dev, config->nr_trig_max, GFP_KERNEL);
+	if (!config->trig_out_filter)
+		return -ENOMEM;
+
+	config->ctiinen = devm_kcalloc(dev, config->nr_trig_max, sizeof(u32), GFP_KERNEL);
+	if (!config->ctiinen)
+		return -ENOMEM;
+
+	config->ctiouten = devm_kcalloc(dev, config->nr_trig_max, sizeof(u32), GFP_KERNEL);
+	if (!config->ctiouten)
+		return -ENOMEM;
+
 	config->nr_ctm_channels = CTI_DEVID_CTMCHANNELS(devid);
 
 	/* Most regs default to 0 as zalloc'ed except...*/
@@ -189,6 +209,7 @@ static void cti_set_default_config(struct device *dev,
 	config->enable_req_count = 0;
 
 	config->asicctl_impl = !!FIELD_GET(GENMASK(4, 0), devid);
+	return 0;
 }
 
 /*
@@ -219,8 +240,10 @@ int cti_add_connection_entry(struct device *dev, struct cti_drvdata *drvdata,
 	cti_dev->nr_trig_con++;
 
 	/* add connection usage bit info to overall info */
-	drvdata->config.trig_in_use |= tc->con_in->used_mask;
-	drvdata->config.trig_out_use |= tc->con_out->used_mask;
+	bitmap_or(drvdata->config.trig_in_use, drvdata->config.trig_in_use,
+		  tc->con_in->used_mask, drvdata->config.nr_trig_max);
+	bitmap_or(drvdata->config.trig_out_use, drvdata->config.trig_out_use,
+		  tc->con_out->used_mask, drvdata->config.nr_trig_max);
 
 	return 0;
 }
@@ -231,6 +254,8 @@ struct cti_trig_con *cti_allocate_trig_con(struct device *dev, int in_sigs,
 {
 	struct cti_trig_con *tc = NULL;
 	struct cti_trig_grp *in = NULL, *out = NULL;
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev);
+	int n_trigs = drvdata->config.nr_trig_max;
 
 	tc = devm_kzalloc(dev, sizeof(struct cti_trig_con), GFP_KERNEL);
 	if (!tc)
@@ -242,12 +267,20 @@ struct cti_trig_con *cti_allocate_trig_con(struct device *dev, int in_sigs,
 	if (!in)
 		return NULL;
 
+	in->used_mask = devm_bitmap_zalloc(dev, n_trigs, GFP_KERNEL);
+	if (!in->used_mask)
+		return NULL;
+
 	out = devm_kzalloc(dev,
 			   offsetof(struct cti_trig_grp, sig_types[out_sigs]),
 			   GFP_KERNEL);
 	if (!out)
 		return NULL;
 
+	out->used_mask = devm_bitmap_zalloc(dev, n_trigs, GFP_KERNEL);
+	if (!out->used_mask)
+		return NULL;
+
 	tc->con_in = in;
 	tc->con_out = out;
 	tc->con_in->nr_sigs = in_sigs;
@@ -263,7 +296,6 @@ int cti_add_default_connection(struct device *dev, struct cti_drvdata *drvdata)
 {
 	int ret = 0;
 	int n_trigs = drvdata->config.nr_trig_max;
-	u32 n_trig_mask = GENMASK(n_trigs - 1, 0);
 	struct cti_trig_con *tc = NULL;
 
 	/*
@@ -274,8 +306,8 @@ int cti_add_default_connection(struct device *dev, struct cti_drvdata *drvdata)
 	if (!tc)
 		return -ENOMEM;
 
-	tc->con_in->used_mask = n_trig_mask;
-	tc->con_out->used_mask = n_trig_mask;
+	bitmap_fill(tc->con_in->used_mask, n_trigs);
+	bitmap_fill(tc->con_out->used_mask, n_trigs);
 	ret = cti_add_connection_entry(dev, drvdata, tc, NULL, "default");
 	return ret;
 }
@@ -288,7 +320,6 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 {
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *config = &drvdata->config;
-	u32 trig_bitmask;
 	u32 chan_bitmask;
 	u32 reg_value;
 	int reg_offset;
@@ -298,18 +329,16 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 	   (trigger_idx >= config->nr_trig_max))
 		return -EINVAL;
 
-	trig_bitmask = BIT(trigger_idx);
-
 	/* ensure registered triggers and not out filtered */
 	if (direction == CTI_TRIG_IN)	{
-		if (!(trig_bitmask & config->trig_in_use))
+		if (!(test_bit(trigger_idx, config->trig_in_use)))
 			return -EINVAL;
 	} else {
-		if (!(trig_bitmask & config->trig_out_use))
+		if (!(test_bit(trigger_idx, config->trig_out_use)))
 			return -EINVAL;
 
 		if ((config->trig_filter_enable) &&
-		    (config->trig_out_filter & trig_bitmask))
+		    test_bit(trigger_idx, config->trig_out_filter))
 			return -EINVAL;
 	}
 
@@ -687,7 +716,9 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	raw_spin_lock_init(&drvdata->spinlock);
 
 	/* initialise CTI driver config values */
-	cti_set_default_config(dev, drvdata);
+	ret = cti_set_default_config(dev, drvdata);
+	if (ret)
+		return ret;
 
 	pdata = coresight_cti_get_platform_data(dev);
 	if (IS_ERR(pdata)) {
diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
index 4eff96f48594..557debbc8ca4 100644
--- a/drivers/hwtracing/coresight/coresight-cti-platform.c
+++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
@@ -136,8 +136,8 @@ static int cti_plat_create_v8_etm_connection(struct device *dev,
 		goto create_v8_etm_out;
 
 	/* build connection data */
-	tc->con_in->used_mask = 0xF0; /* sigs <4,5,6,7> */
-	tc->con_out->used_mask = 0xF0; /* sigs <4,5,6,7> */
+	bitmap_set(tc->con_in->used_mask, 4, 4); /* sigs <4,5,6,7> */
+	bitmap_set(tc->con_out->used_mask, 4, 4); /* sigs <4,5,6,7> */
 
 	/*
 	 * The EXTOUT type signals from the ETM are connected to a set of input
@@ -194,10 +194,10 @@ static int cti_plat_create_v8_connections(struct device *dev,
 		goto of_create_v8_out;
 
 	/* Set the v8 PE CTI connection data */
-	tc->con_in->used_mask = 0x3; /* sigs <0 1> */
+	bitmap_set(tc->con_in->used_mask, 0, 2); /* sigs <0 1> */
 	tc->con_in->sig_types[0] = PE_DBGTRIGGER;
 	tc->con_in->sig_types[1] = PE_PMUIRQ;
-	tc->con_out->used_mask = 0x7; /* sigs <0 1 2 > */
+	bitmap_set(tc->con_out->used_mask, 0, 3); /* sigs <0 1 2 > */
 	tc->con_out->sig_types[0] = PE_EDBGREQ;
 	tc->con_out->sig_types[1] = PE_DBGRESTART;
 	tc->con_out->sig_types[2] = PE_CTIIRQ;
@@ -213,7 +213,7 @@ static int cti_plat_create_v8_connections(struct device *dev,
 		goto of_create_v8_out;
 
 	/* filter pe_edbgreq - PE trigout sig <0> */
-	drvdata->config.trig_out_filter |= 0x1;
+	set_bit(0, drvdata->config.trig_out_filter);
 
 of_create_v8_out:
 	return ret;
@@ -257,7 +257,7 @@ static int cti_plat_read_trig_group(struct cti_trig_grp *tgrp,
 	if (!err) {
 		/* set the signal usage mask */
 		for (idx = 0; idx < tgrp->nr_sigs; idx++)
-			tgrp->used_mask |= BIT(values[idx]);
+			set_bit(values[idx], tgrp->used_mask);
 	}
 
 	kfree(values);
@@ -316,23 +316,33 @@ static int cti_plat_process_filter_sigs(struct cti_drvdata *drvdata,
 {
 	struct cti_trig_grp *tg = NULL;
 	int err = 0, nr_filter_sigs;
+	int nr_trigs = drvdata->config.nr_trig_max;
 
 	nr_filter_sigs = cti_plat_count_sig_elements(fwnode,
 						     CTI_DT_FILTER_OUT_SIGS);
 	if (nr_filter_sigs == 0)
 		return 0;
 
-	if (nr_filter_sigs > drvdata->config.nr_trig_max)
+	if (nr_filter_sigs > nr_trigs)
 		return -EINVAL;
 
 	tg = kzalloc_obj(*tg);
 	if (!tg)
 		return -ENOMEM;
 
+	tg->used_mask = bitmap_zalloc(nr_trigs, GFP_KERNEL);
+	if (!tg->used_mask) {
+		kfree(tg);
+		return -ENOMEM;
+	}
+
 	err = cti_plat_read_trig_group(tg, fwnode, CTI_DT_FILTER_OUT_SIGS);
 	if (!err)
-		drvdata->config.trig_out_filter |= tg->used_mask;
+		bitmap_or(drvdata->config.trig_out_filter,
+			  drvdata->config.trig_out_filter,
+			  tg->used_mask, nr_trigs);
 
+	bitmap_free(tg->used_mask);
 	kfree(tg);
 	return err;
 }
diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 3fe2c916d228..2bbfa405cb6b 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -719,12 +719,12 @@ static ssize_t trigout_filtered_show(struct device *dev,
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *cfg = &drvdata->config;
 	int nr_trig_max = cfg->nr_trig_max;
-	unsigned long mask = cfg->trig_out_filter;
+	unsigned long *mask = cfg->trig_out_filter;
 
-	if (mask == 0)
+	if (bitmap_empty(mask, nr_trig_max))
 		return 0;
 
-	return sysfs_emit(buf, "%*pbl\n", nr_trig_max, &mask);
+	return sysfs_emit(buf, "%*pbl\n", nr_trig_max, mask);
 }
 static DEVICE_ATTR_RO(trigout_filtered);
 
@@ -931,9 +931,9 @@ static ssize_t trigin_sig_show(struct device *dev,
 	struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *cfg = &drvdata->config;
-	unsigned long mask = con->con_in->used_mask;
+	unsigned long *mask = con->con_in->used_mask;
 
-	return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, &mask);
+	return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, mask);
 }
 
 static ssize_t trigout_sig_show(struct device *dev,
@@ -945,9 +945,9 @@ static ssize_t trigout_sig_show(struct device *dev,
 	struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *cfg = &drvdata->config;
-	unsigned long mask = con->con_out->used_mask;
+	unsigned long *mask = con->con_out->used_mask;
 
-	return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, &mask);
+	return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, mask);
 }
 
 /* convert a sig type id to a name */
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index c5f9e79fabc6..ef079fc18b72 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -68,7 +68,7 @@ struct fwnode_handle;
  */
 struct cti_trig_grp {
 	int nr_sigs;
-	u32 used_mask;
+	unsigned long *used_mask;
 	int sig_types[];
 };
 
@@ -145,17 +145,17 @@ struct cti_config {
 	int enable_req_count;
 
 	/* registered triggers and filtering */
-	u32 trig_in_use;
-	u32 trig_out_use;
-	u32 trig_out_filter;
+	unsigned long *trig_in_use;
+	unsigned long *trig_out_use;
+	unsigned long *trig_out_filter;
 	bool trig_filter_enable;
 	u8 xtrig_rchan_sel;
 
 	/* cti cross trig programmable regs */
 	u32 ctiappset;
 	u8 ctiinout_sel;
-	u32 ctiinen[CTIINOUTEN_MAX];
-	u32 ctiouten[CTIINOUTEN_MAX];
+	u32 *ctiinen;
+	u32 *ctiouten;
 	u32 ctigate;
 	u32 asicctl;
 };

-- 
2.43.0


