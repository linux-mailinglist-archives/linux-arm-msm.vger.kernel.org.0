Return-Path: <linux-arm-msm+bounces-109045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0K02I+n4DmpKDwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:22:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 223555A4B5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C668830C6FD1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95FCE379EDF;
	Thu, 21 May 2026 12:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k4SHvFda";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CpIKnvAq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8993CE092
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779365810; cv=none; b=sj+1JvetiEXDIQ/izmuEmJQmW708ma4Yz8SP3LAbn5sI4qZkQsR4qKCjYxr9X3wRPu6IdH9XLEz1nbyWwU8o4VgD1vw3nDiC9W6J5Le2TVuB1cY6yGA9xTUwyMtn+GKKcIEMObDP/1h5Wo/NFaoDIPVZJA5oSupg5aHfe3GyruI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779365810; c=relaxed/simple;
	bh=ASJNP5SBvgtIXKX3zaln4ApjABeRa1GyYs6c5sAJhcY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gZiR+6kdX152kxuzPoeFBVMeepV26FqmXJ1nWQEbnzg2/H9WedxGXGHtsi5Z1ZuM3DgzQSrBvkyxmy6VdaorJnmIJu1js8rZ+AbYswUFVzll/TdG8NNZZPBU8H2bJkKQENIYwqHZGUsLvdF4ZaQkiWPRW6PdknZ15XHIrGLwiM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k4SHvFda; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CpIKnvAq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99xlq3528303
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	19s3XdkLyUt2fXZYHgYxTYu1Rl6KY8HXDDyB90niC4g=; b=k4SHvFdaFJnW+tQc
	7AmXpHlxsMhSYkxADr+5g4q6X6EmXlcTMmyn7FR7vBviFDH6quTMyKH1/hCDGqqS
	DSJaCEpu99YxvROsYIXMO57PPB01nPMXW92HG7GTCaYms1bob4aqG9QGOPGSrICC
	kOUxUxdf89OZl1YL1K4UtjLx/jbP2fyQdQi3eByYEREj+mUJWSitWDiCNoEqJ/9J
	Yu+OOs5/T2nxfx5s2l0wDq5Sy/SjWSVcQb99eouFKb875UhWl9LHF6SyYeMO1PpB
	jrnmlNXAg0hgRv9UKzcfpARHl1LXEMj+73taxVpqu3ZlQlCKIbh/DW/WQeizWIBV
	PQrgSw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9vhbhgua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:16:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd00a65673so45033465ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779365805; x=1779970605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=19s3XdkLyUt2fXZYHgYxTYu1Rl6KY8HXDDyB90niC4g=;
        b=CpIKnvAqmZjZZPpIGNSb8sTnH8lAfbFc8FrHygr3D9OS/QalrsfUPh/4nurHPYfY9n
         ad7444njaeV06iAk+z7iOBCwd1ZjnlXpPDES66H26XbDVL/fxJb2iKGL0hzRnoqZ9w0J
         znUFmg6XoSxYOLZQYbbaKbVG6LzbgngRGKok9xO37SNFNX0F6fftGGR4uEAI+5+GQMf+
         3QSSLv97STyK7NJAHZ896BFdOEuTG7MD/2s7grZALIpGeflYs4Nha/J6M9EVtvjL2ila
         cf1MIfgzjR1qzCMr4QZdrN3fK4SSmxvewlsNfZ71x7R1EGdqvVxwH1Nj043HTAYZ+dE+
         tEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779365805; x=1779970605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=19s3XdkLyUt2fXZYHgYxTYu1Rl6KY8HXDDyB90niC4g=;
        b=NE9xIo6GXOa0OSRzOF1BNNhmS7xio4OIzI0hTIywSZAXaE6iNuOm8q+MctEXGn52NA
         JPwRmoB+PoS1Dfz+9vdsqP7j+rS/766MMTGZQ1lYhsCTB2wKT0LiY/BhngyxKNIeOZVZ
         SWHKKyX6pp2q2Z8Ru/g3WPlqNJ3VnFSqceUIrnsrlc4hbUa5FcpnHVn5l7SHN92nQRYa
         O6LtnXB0RM7bAuqyDlvs/Lu05uEas+GBS8guCshBHdJC/Vza8wZh+fDtIuEXDzQDhCbg
         cD8bgNce1M99B3TtePywnQ71RYJFssp1QiV4J4IDvHXyNOIr6rgZwpL7kob7XsuNzSHu
         CKgw==
X-Forwarded-Encrypted: i=1; AFNElJ9xEeTQOBJfL9bf0XwjgfjP9e+Q8/1t3j0GdzbQuAtjQhNxp10sR/gvKSjSsWoY8C1Gi4D7tBNRGbG/Dohn@vger.kernel.org
X-Gm-Message-State: AOJu0YyPy6MHtGI0QRkg3eG0Dl593Y6DcwdRD08N0nk4InVGAn8bBYx1
	TlT7MZrE/sm2KNJnkltmgnVQKnFVQIS59MT6NiBk/p/rm+seP4pIxduCth5eWI3v+55rrpEKJ92
	w/GtTm+XSGfiyf+oRmfUaFAMZSjDvx3+/M9+RghDdv+yO9NSWMVhRWXw51mk63GYpiUkk
X-Gm-Gg: Acq92OG7+4UY04d2kpzcYBfhHYvhu0QNWo0YqQhE93grhOQsi+fbDP/eGil3ptgt0cH
	Eb2VvMc0a1uv6QjmEBEoTXzfRucODmnkl4h05zigGG9owN6u7ENyaNLLV8NlrZZLsoiQWgN63EL
	PPJ0C0YPOPfNLGh9jMU5vkfmRkDNJk6IORucm4LYFfUsV8R44dz8zOAz7UjAOjQdewLPYyk7tvi
	tIhKwgf48uDc9/8Cy5sLWs6M8KMjHGuhlKxtwU4IfmgFr2ripmEQLH3hN4EPYQegK6UZN+csgBm
	beQ/wXryrS0jCPuQGoZ8kfeHhczv/qyEv6fxnuqK7yGL/o5LkfZX/Gg3Le8lPruzTIRCVL1JP3p
	Y44dApONXd9X2MR59Jh834L/6jVSG7yY5LTpOAjaqYcYKGMxPH2V8qfYvA/koLY7u+ewQa2cIMp
	c5LPzVBW69wijZmQ==
X-Received: by 2002:a17:902:f601:b0:2bd:4bc3:2995 with SMTP id d9443c01a7336-2bea22bb7c8mr27750245ad.22.1779365804518;
        Thu, 21 May 2026 05:16:44 -0700 (PDT)
X-Received: by 2002:a17:902:f601:b0:2bd:4bc3:2995 with SMTP id d9443c01a7336-2bea22bb7c8mr27749845ad.22.1779365803962;
        Thu, 21 May 2026 05:16:43 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea917318esm10435555ad.5.2026.05.21.05.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 05:16:43 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Thu, 21 May 2026 20:16:27 +0800
Subject: [PATCH v9 1/4] coresight: cti: Convert trigger usage fields to
 dynamic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-extended_cti-v9-1-d21f4f92c51e@oss.qualcomm.com>
References: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
In-Reply-To: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jinlong.mao@oss.qualcomm.com, quic_yingdeng@quicinc.com,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779365796; l=11942;
 i=yingchao.deng@oss.qualcomm.com; s=20260521; h=from:subject:message-id;
 bh=ASJNP5SBvgtIXKX3zaln4ApjABeRa1GyYs6c5sAJhcY=;
 b=pqvzih8zamQbzAQAKdKnL2RCyGJYp0rit2wZng6X5zLXerX6fP2V5OpirF0l5r6U65tKsiSlm
 xqXocWuyu9VBXnfrgHbSDlUrJ3nnXWmSPVfX0RqCAZaTXe1Di4dhYvC
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=YbHeeX0Qzqo7voZLva784lFhVChB9yF3a4sceW95ljA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyMyBTYWx0ZWRfX/VVpQ8BGbjcl
 3PYuM+sBeRuZZw9ThUsx5m9DChhgu3S3kQpf9iaumbG7gXY4BTD+s76SA5Ek+sDgcNpRHKwp+JT
 dvC5X35AaILogfohMeuen1dZDMsy3YIHCdSHFfqeZWBvhk/i8qT8CAenTBO5dPNkt6tL+hc46Kk
 6DqMTvG7cMhbehNeVHEyyNypEvxFx3oLOtomsIXu1Au9cenIzu/xyDmZvo33FpsXtBssANxh0Xn
 Jf4XOOkXQZPhoKiBnEeHsJ2L7eTMZbuqyNGY5lkH86JD+FbQTXHWHxdTHKu67QAXQVfhAjGgEe2
 FsCoqGsWvpsltHFX1e6deyt1X9/EC4cbzXe9pcx0ZGR/6+n251cnVwbTznt9k8ngaMEyTikbg3i
 EROTJoCdbuASacs6/E5gDfkeM45UE/u0eEStn5Ngr0Wqpjxncmaxg8R4MMHMHI8ehRUISbeQMEj
 B2f4w9UjT6YuWPBDrJA==
X-Authority-Analysis: v=2.4 cv=GYAnWwXL c=1 sm=1 tr=0 ts=6a0ef7ad cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=7_BDbhMBoegF64a6bMcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: qMWzzGndd_sUSMbE8o39RsKgsZ1Lf1WL
X-Proofpoint-ORIG-GUID: qMWzzGndd_sUSMbE8o39RsKgsZ1Lf1WL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210123
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-109045-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yingchao.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 223555A4B5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index d6d5388705c3..ba5a7e4b6bff 100644
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
@@ -316,24 +316,34 @@ static int cti_plat_process_filter_sigs(struct cti_drvdata *drvdata,
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
 	tg->nr_sigs = nr_filter_sigs;
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


