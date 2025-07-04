Return-Path: <linux-arm-msm+bounces-63698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF382AF923B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 14:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5652C1CA3FE7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 12:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF2002D6615;
	Fri,  4 Jul 2025 12:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vz94Nr3d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3590C2D63FF
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 12:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751631163; cv=none; b=QvLaG2+Cl+Yl+kCupx5Gph0MONaKTu1V6sHGOswqAOE9PNjljSs+5oJju30oTCAHLS4aBF2XBtNjzbhyeudvHjL7ng9BMfdZVLkHc6i4L3JZwzNSzrc+FkgkmsYHAfF1YDHR3BZG7haGH4fGBDiPyAZ5i+nfbTxYqUzQ83/hJH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751631163; c=relaxed/simple;
	bh=RWcMcENuzadS5pKo+gf9BqH0aTezwUdBlEwlff9kRkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vCwm4UthlBDMOcJ5RO4biQe2EeU0KthY2Xn74s3BttXL2X5jd9zgzniInH55w3eospg7fXPI//VqVnxPiy8gji2fXAVh/Uin9KdOL3LZjA9iazz1heS7KdCm8dm41oNB89mIYL2hnvi8Eq51ixgH/ZZeTQCQYioA/IlnYHd/Bnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vz94Nr3d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5645rWOf024769
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 12:12:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LR3fVYUOH7o
	ec8B/p5wHCcMyr6Oxyk+LtpFmeCILY0Q=; b=Vz94Nr3dXhZ1V0u1N7LN6CBomqh
	tKLc7oBFCZspB4OUD0OC5iWwTtd+Fxy4mEr4niwdvKy0wjx/03v0Vnv0aNvHdVsT
	hgmzK6LUZ8pEnLVl0+5L0vVtFjXvnqEUwhXoUkmjSw0j/KOysR77VE0JsbNpOyrm
	SRuneknDB8ZpcCkxcHHDod1Ypdvl3pk4BlB718HEgGWy/PZ1Syh+3StyLVL0yWx4
	lMaNB0uzF4m4DZcQiYGqH0gW9O6epq5kClgztOwUeY1IHkRQDR1RauzNCZkoCqHH
	WQ5KoZ7770HS2lBOu9QT9SYw2qXK7GZBvtUE7HU0/tDmqMUibPocwb9sujw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9uw4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 12:12:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c760637fe5so124119885a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 05:12:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751631160; x=1752235960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LR3fVYUOH7oec8B/p5wHCcMyr6Oxyk+LtpFmeCILY0Q=;
        b=ACrZ9D8HuFJX2+jKknZDV8XDcs3Y39ytU3bqepGdsudU5Y+tsbuSn7eQo8F3jWTBD0
         ONMvK/+c8SZL2IxaQ9XjVOloQa+8HA3mvr20F3KKcehBZMMSLPlQymkSvaf6tE/37RJQ
         puDtj9YoyP49j7WleUbLbz7H9OzwbSNxYonP4xVWAux0hds2DolTgaNDJUxYG71EZccQ
         U0Kus5B/+2q4+ql8oRWdtVkvj3+ugzW7Jp+LOhAnEWcQfuyME2ChmrP3oiZt1qgEFqHH
         38aX25amyV9SrANjtoKQegLLnlBviw9gilAiWl60rvlTNZT1tGAydmtf9GVglDHBFMUu
         FdJA==
X-Forwarded-Encrypted: i=1; AJvYcCX5KTfL2JEmyI8AJ3KWe+kYuheEEejLp0Kp8zJOq8Ot2lVk1WLI5hHJaGn31smkAIAuOyFMv3t6DvF1gcCq@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ96J6sotO/ckSAqSabSJq7X96+UF+FfCmphK95bjW/7ntAahG
	ng7DDn8HUSxNbbTqUE4V5ihgWcsrbw88kzsaPeEjSEZGkxuUdQKRa2WxdePCcQAMgwvxPQ9/e6k
	8qBbe0eTUac0jQfnfg78eahWEFTQK9DLOmTIrkSqKI6KSsVylQsNDRuJjOq1LfOXE8ToZ
X-Gm-Gg: ASbGncvgtYbgLyHS3vHxBubWGGxOtMYjuOznESp5EHvDzx/vUd5WukpCHhrdJVePovl
	C9Ss08EIoWhgfhG+sq6nBU4In1ypAzPrlt797oqe+JNDG8kaN5CaLhMHJymHkKZanTvR/bWtsek
	UZiE/YMFl3x2kSOWocfDWAXYS88xUgMGS0xzw0PAQjJ1pmhO3ESajpTeVe0DmqKN4wppFbkjbHn
	nJepWgdU193psWOD7Pxo451uRvyA1XfTsdJ+bJPqCLUoXHVHNDBXFYwiJ1Z9KnRpDgda+nhdZiL
	tQnp9F6nhEGvTxVJ4WCswRjgkKrczJhx+XwpAzycIM83yb1ASZmu7bM=
X-Received: by 2002:a05:620a:1924:b0:7d0:9c51:498a with SMTP id af79cd13be357-7d5ddb56b75mr297333685a.13.1751631160223;
        Fri, 04 Jul 2025 05:12:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzjkILAwypMIZUshaZVGJonIlhgRWDFAm9d5sNhdyHQ5r3X/FUqOT+lCNh7XuKnxet9HlSNA==
X-Received: by 2002:a05:620a:1924:b0:7d0:9c51:498a with SMTP id af79cd13be357-7d5ddb56b75mr297329385a.13.1751631159751;
        Fri, 04 Jul 2025 05:12:39 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a997de2asm53656745e9.12.2025.07.04.05.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 05:12:38 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 2/4] soundwire: bus: add sdw_slave_get_current_bank helper
Date: Fri,  4 Jul 2025 13:12:16 +0100
Message-ID: <20250704121218.1225806-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704121218.1225806-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250704121218.1225806-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=6867c539 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=G7Fn18kybrAXfbFeA2QA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 1__HhHgWvoEGwUXju0eZ16zPQjEllQeo
X-Proofpoint-GUID: 1__HhHgWvoEGwUXju0eZ16zPQjEllQeo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA5MyBTYWx0ZWRfX0i+oeYDADlgX
 cFjKt8eTzfh3pRDYsUjxJtDgcpb+yp3tyjb6aMJX99RcD++t0b7aJmS6YWnkOj2P32BQVqQUWTN
 nQKnTjCnzi8u7E6WSwJvkbYPhL54RO2P2XdJjj16/yuecdLcYryAtDLQgJ8ujzZMK/7ze20B3aQ
 /NHIFpulMeCL03KFDK9T1IAR9iIHuAlWd67ArYa0nxtRY5YL679vAQEZTV0avjQDpyB9L/eGkms
 dMq/VpRO5DXBrH2U96YuEfKe51vtvM23tGFyfOV5m9kgQUikKwsSJXRjdDxp69MBOYjSYrSJT77
 zOLr7u0YWaT9MGg75fKfQMDHRusE/zBWuWZ8jsAvOHnE9PYfTHYp/OZIPI0oHrQTLaFMCnPiJQn
 QsCpPTB/mdQivSya0TJ02EfgqGliPr1sfZSj70qc6Zu6EJsJBa1ue3Bib/QCl63aB2ynrsbx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=855
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040093

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

There has been 2 instances of this helper in codec drivers,
it does not make sense to keep duplicating this part of code.

Lets add a helper sdw_get_current_bank() for codec drivers to use it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/bus.c       | 12 ++++++++++++
 include/linux/soundwire/sdw.h |  8 ++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 4fd5cac799c5..55c1db816534 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1360,6 +1360,18 @@ int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base)
 }
 EXPORT_SYMBOL(sdw_slave_get_scale_index);
 
+int sdw_slave_get_current_bank(struct sdw_slave *slave)
+{
+	int tmp;
+
+	tmp = sdw_read(slave, SDW_SCP_CTRL);
+	if (tmp < 0)
+		return tmp;
+
+	return FIELD_GET(SDW_SCP_STAT_CURR_BANK, tmp);
+}
+EXPORT_SYMBOL_GPL(sdw_slave_get_current_bank);
+
 static int sdw_slave_set_frequency(struct sdw_slave *slave)
 {
 	int scale_index;
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 096213956d31..e6a3476bcef1 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1089,6 +1089,8 @@ int sdw_stream_remove_slave(struct sdw_slave *slave,
 
 struct device *of_sdw_find_device_by_node(struct device_node *np);
 
+int sdw_slave_get_current_bank(struct sdw_slave *sdev);
+
 int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base);
 
 /* messaging and data APIs */
@@ -1128,6 +1130,12 @@ static inline struct device *of_sdw_find_device_by_node(struct device_node *np)
 	return NULL;
 }
 
+static inline int sdw_slave_get_current_bank(struct sdw_slave *sdev)
+{
+	WARN_ONCE(1, "SoundWire API is disabled");
+	return -EINVAL;
+}
+
 /* messaging and data APIs */
 static inline int sdw_read(struct sdw_slave *slave, u32 addr)
 {
-- 
2.49.0


