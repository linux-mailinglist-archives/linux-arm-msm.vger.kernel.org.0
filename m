Return-Path: <linux-arm-msm+bounces-62841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91334AEBC70
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 17:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE0A31C23695
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 15:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CECDB2EA46E;
	Fri, 27 Jun 2025 15:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XQUM1MSN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E042E9ED4
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039501; cv=none; b=RGuSNlJdNLRL3JBLZg1YwGb+W4+ZcTuNc0a8NFmD3o3KT5xAbwARfjWHCi8AkVzwGO92JfTXSY2YcCtOrVBXfM24Ga/HdatiKjiitRHZgQo2TrRcOF9b7cqj9o63dGHj/mNhyey8ZXC/kjZCgCljgdTl1w41wSlADe8acAM1jBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039501; c=relaxed/simple;
	bh=lKyVz1aHAtW5wZADQysDpTlDrcMAjTf3GNRnaui/Uzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AYRvXFd+ofiFCRUSnlxcYTzGVvVFbevXzKX4BUDFhItGe66kyhtde8hMELYAiS0ey9vU/Z5oQTbhdw7K96TtGbuuJLppa7ueXhEnRP+XZUuCQCcYHVe6RZwlvAIgB+1P+p5IWhijYVag7CEPidmAzFkkQdL1zXKwfalteivI7z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XQUM1MSN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCNZ66007832
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LDHorwnuAdX
	V1WbIuhFcYVwPnTn751yCNIEq0iuBI3w=; b=XQUM1MSNcSUVDOdyhjEOYFtATz4
	PVg8jbT9EmvF+xq1+1abSYZLaK8H2WKVH8kfYIL3viNpQDZvM1Sj9DS77xQPy0ch
	axMakC6PDBd6lckDTrXFXmetO/n9CbD0v5IN77eJgZ2xXpT1iRo6q9rCtnEGpH9l
	IvYn7LGdSPNjVd1RgwoOM93YWi+xUkEHiJV11tghB5+QzX7PJPtbHysRu7yrOqGS
	TfzGb0O7v4je7YpgN9hEzhhhzpG9wGiGJoH0LWDK25AW/Fw7akBAcQQZesSNH8BF
	UaFSMoUpwiLLVGZsH09fYvA7glq8BKqydlGlozgsSnA/jCVXGcqtcKbxT4A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqwqsv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:51:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c955be751aso354376885a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 08:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039498; x=1751644298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDHorwnuAdXV1WbIuhFcYVwPnTn751yCNIEq0iuBI3w=;
        b=lhmBHp3e4PnNO6IN2JtHYcmNN2SlnF+aU5y3afp4ohsVTHtRI3m4X1LChhyXVIstIY
         cTygBR97qbqErdtCWOZQqvkIi+NMVGmLLjid0nYIxrQvuDes5+W2WmtB9dzxrAcYwOMs
         zZNRaQrCeGAqrAueHzkL9ckX6z9Hq+IocC7XAu6FJlP3yP8NCDsk7E8UZZrYgEVwMzt4
         /FvPiIWOEjJQyVoIRg00zsSEy4xiNF/xIRuQ5V0i1w5FMPgYiW5RtjBZ5u7KupBJt4Q/
         IL9VJlbH1/OIM02zirHeAqqQJEurH1VGWGxLg3s/DzNRvlpR+7vMs7YjSmbB/WHRzJXk
         n65A==
X-Forwarded-Encrypted: i=1; AJvYcCXkxWgh7Wii6VAZJqFH28YH6UNri7XuUGFd2uacj91h3sT3UW3eqnLxwY8n037wOsoOOwxFz2xF5U/AvgsN@vger.kernel.org
X-Gm-Message-State: AOJu0YzhcWcSY3kjGn3X8o5Q5EkqQwfzcHq78OcDmrlth6wrwVJtzasD
	x2RZbDqumqzjPcOU9VJhXvgXPjN/jmKRD0xZ+TMBV02C9GPNV5w2ONem2rcvsgudlhnXu5Pxnrg
	CdEdt3V4Ol82EYc0YH25LS8IVONEQN1QHvwyENpg7qaV4UsFzjPGZzz5Je1CJPoHqxVYV
X-Gm-Gg: ASbGncsxRqFcB7zBK7RBX1tlSI+R72sBpO+J35egmvBJVKs+nL/+FxPoqRLzeKPBteY
	mvxuAYYzIS/YlQvCZiQmNbwS2VUppD/2380kwfUhaf1Q82ps8ENWUfGTLbK/qTnedGVlLoxKSdt
	KybTg6MmeKDZoyiHXgZHoY/S59CXWyeOdQqW8meYkXZfil5/PBAGW+wUFwYyYCeBjG6KQehq3+f
	Dl7DdNvcsUIbSX5YzC4VbWU2sBcmZcGBAFvjgmaspkpG6pBu5VpBHMlMAVZxI14KEoBVgyUKd2e
	U4NUTLvlVtH6RMxDhQRgIbJuz0rExc+sd2lBD48O+mTKZcV3zUjr9DU=
X-Received: by 2002:a05:620a:4484:b0:7d3:99d9:3da with SMTP id af79cd13be357-7d443988ef3mr526645585a.38.1751039497956;
        Fri, 27 Jun 2025 08:51:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJkxph6O/jbArRyCSDoDEI4L1/ZQJj4wRXUA2X3/E8kJSQIhQWta3eDD7mnBbK8obJSzGztw==
X-Received: by 2002:a05:620a:4484:b0:7d3:99d9:3da with SMTP id af79cd13be357-7d443988ef3mr526641485a.38.1751039497535;
        Fri, 27 Jun 2025 08:51:37 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f8absm3082663f8f.95.2025.06.27.08.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 08:51:37 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/4] soundwire: bus: add sdw_slave_get_current_bank helper
Date: Fri, 27 Jun 2025 16:51:01 +0100
Message-ID: <20250627155103.441547-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DU-DTp0r-IQK8Hytzfl8tD2JKWYsvDxj
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685ebe0a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=G7Fn18kybrAXfbFeA2QA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: DU-DTp0r-IQK8Hytzfl8tD2JKWYsvDxj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyOSBTYWx0ZWRfX7PbBciT9ouAU
 i2k7M1MgLw4HDyHKpFvmXglp5UInpDAga7KpnDlTZNJaQuLyvcOrMsAuUslbura9Vblf2ijSvv5
 HgqtJWDKMnrM/pKnYYabNyDwJSClgRUyAveEv9l72r0n/aZY/X835AvIPatz9Ps7YFtvVsdyWNp
 MwNaKM32OGH3YX3V9Xn63jPtwvEZ5exO0d4pAmRJv4ZlFb8axUDyqOnpTnQA4FtBkHyk+sDJzYZ
 NVcyBUZUgLf3GnYlJ5gSigkiPGAwhla+530YG5tOPEvvwLwZYJFLcpD4uib/8v2s8+tWlcYqsb8
 H4K7ehg27cU5fecjYNe8Aocm6y7XMLuIE/ZVqoXchhNHeh0pHhRoyw7M9kG7s9N9O0QqW7YjR/L
 5aqyD/SYEv6akK0tUyKSaDfbtJHyHjCbYBNhN90kcxh5X/M/iQ2d3NNBgKFa53gGg/o5d9Aq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=858 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270129

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

There has been 2 instances of this helper in codec drivers,
it does not make sense to keep duplicating this part of code.

Lets add a helper sdw_get_current_bank() for codec drivers to use it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/bus.c       | 7 +++++++
 include/linux/soundwire/sdw.h | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 39aecd34c641..58306c515ccc 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1363,6 +1363,13 @@ int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base)
 }
 EXPORT_SYMBOL(sdw_slave_get_scale_index);
 
+int sdw_slave_get_current_bank(struct sdw_slave *sdev)
+{
+	return FIELD_GET(SDW_SCP_STAT_CURR_BANK,
+			 sdw_read(sdev, SDW_SCP_CTRL));
+}
+EXPORT_SYMBOL_GPL(sdw_slave_get_current_bank);
+
 static int sdw_slave_set_frequency(struct sdw_slave *slave)
 {
 	int scale_index;
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 84d1a101b155..41c36470ad2d 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1083,6 +1083,8 @@ int sdw_stream_remove_slave(struct sdw_slave *slave,
 
 struct device *of_sdw_find_device_by_node(struct device_node *np);
 
+int sdw_slave_get_current_bank(struct sdw_slave *sdev);
+
 int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base);
 
 /* messaging and data APIs */
@@ -1122,6 +1124,12 @@ static inline struct device *of_sdw_find_device_by_node(struct device_node *np)
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


