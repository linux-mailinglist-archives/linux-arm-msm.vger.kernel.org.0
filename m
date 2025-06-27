Return-Path: <linux-arm-msm+bounces-62840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EBFAEBC76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 17:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FD113B0BF4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 15:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1725A2EA158;
	Fri, 27 Jun 2025 15:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TxdfPwmc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9046F2E9EC8
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039501; cv=none; b=oushRaGVlWhaFnnvIY8WAyPN6c9J7xk1gfEb5Qd2dy6rx2WpG55u3jroJ/kKO5EUoNskqXlGq6uvTnoRAxpGcteI9u0Rkfta61AhN4aBsO2ss04zN91LeZ7gIRIaVYcVyLNDIFDbcIABnw0mcS0r1vaIchUpg+cnbRNr0YAl39w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039501; c=relaxed/simple;
	bh=kosxl35EfEgbTnzpOOdVO7IGdUHdh5M6/Ni0KGZQblQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e7WbzhOVxjL6OPviNdilpMjIcGVHSYre+6LJrzqD/OnyXMBZBIKCOPNdYGoDDpdf6uxgN4aNvFikYrzvKWfdHkP8c7Bljki89CJilQw/kdm6Gn93UEZSsRPgdy2lHz295nubRWd5qEfbV+V8wvDxkCnHvG+Dld17EDZBS1nvriQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TxdfPwmc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCFxmZ032644
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0/WQwutoxYF
	O60eUV5V7tAQwlc8UzZ0qXtK/lPMjb1E=; b=TxdfPwmcnWw/3KBcJ/6KY8ZcXzh
	10IxG+WOLWpnKepIgEuk6sip9xJgq5nJiCblOAE2ADmArTm76cvyvAl2Ah8qqd4m
	f7ErYgCv2YGEWmheY4cParD9AEglwY386lfrSN3vI/cNzV0Z32bX0WjeasdbX44f
	62YbIra1AzJcuqYxBMsUGXYCYjZMNqcaDJemyxjUDWWILVZbyP7XxYO4tJa8BSQg
	zwfR4MBrrw3E7dLiiaBcT2yLONQZFk5YzFzXmlwy2e+LE70dliDR1cGlL8h/3R5s
	smFXxsV4T82+Q3b82VVk87ISN6EtOGShoEei+vlzFlezujoj+5oF17p5I7g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdhcje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:51:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5e2872e57so318927085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 08:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039497; x=1751644297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/WQwutoxYFO60eUV5V7tAQwlc8UzZ0qXtK/lPMjb1E=;
        b=iot4L9cjYcYk2fgMbN/P15+HO4ShlSzMkjMXi3RYG28KbsMll4brK+1aTmMPZV7bs0
         iSnlwuWZrZAlLwYsyFKr5oULa0OefMTBYc+N0WgLrjQkvvxSE07AZ1HlFGY40mzZBehc
         OPqaAT2ejpIraLNAMfXppdGc9GBy1/eThvIv3IFA9TNWvx8t2JkAoBA1dqdnN/Uyi9dI
         OgTGuMlZ8elGQta20Xkf+WQX4A92XNNCJorejeELH6aGYQ4revsKbV02Q+EtjgPJYXNJ
         qmLxKMEeA8Bvn04HUpood5EznId0pUODT/0mNGeb728d6GCNioBIHlExdPDJPvYNaNnu
         evwg==
X-Forwarded-Encrypted: i=1; AJvYcCW3stAC9ZRVPIgcj+3g73U9wB/U0OL62u8xR9EEZ0SXK4uaB0pypmTGUj78r/h9dRYa0bG8e9o2Qtw+TO/l@vger.kernel.org
X-Gm-Message-State: AOJu0YxWUQ8MfkVyh8zfvxTyzSrVaNvb2dIVxO0b9xxq7DgclnkL/F6F
	fg3d/9t6WElR5t3bRdRpW6Ih4HmQBiY+a3hufh2tkiPXO+C3/x/LRoPO7IiKj5kPiow8JjYNN5d
	Va8MJzqevl5Hid2wnArIIRDV1uxBdwe4SNWugB4O3izA3yTQZHV0cHU53aXBKlNaYaf6d
X-Gm-Gg: ASbGncv+npSdQuq641HgpGQSAwpVOxGxZe/Zc4t5UqE1oLMd/AZ378VoBnHxjGPNTBk
	bySJflPmqKKrYBPlIDVKzIjc2qTEvQrDNWoHglD6D4YA7L4aTYf1ilNe3laGt5BvCzewzNVBjEG
	jc3boF9CIBbrEkEUNVvPcWzDGpP+zSfFK1pAAlMehfutv1qG+6nKK0QmSWkNXVfZV2HXTUbKzbp
	zrQ6GIFN1tRU0EnpOYea7t6ng2qHT0cnYahaMO1ngLo2tkSqlYqL79vyrOX/h0xVqDRo6GDxSQi
	z904nifC4b7CsD/dM7yqxnY9erfkAChfaC8RwAmpcGfj7Zx0M8JYosQ=
X-Received: by 2002:a05:620a:6588:b0:7c5:9a6c:b7d3 with SMTP id af79cd13be357-7d4439ae47fmr345773285a.37.1751039497168;
        Fri, 27 Jun 2025 08:51:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfa8s9Y0FwOhSzbrQ5pjE93rOdbio/0YW5+sByFJBn5oLIzV0LRQoYDm5jLeIJKqi4k62MAw==
X-Received: by 2002:a05:620a:6588:b0:7c5:9a6c:b7d3 with SMTP id af79cd13be357-7d4439ae47fmr345770085a.37.1751039496536;
        Fri, 27 Jun 2025 08:51:36 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f8absm3082663f8f.95.2025.06.27.08.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 08:51:36 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/4] soundwire: bus: add of_sdw_find_device_by_node helper
Date: Fri, 27 Jun 2025 16:51:00 +0100
Message-ID: <20250627155103.441547-2-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685ebe0a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=bs95RrtT4r1_5-ck8vEA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyOSBTYWx0ZWRfXxIEL23xGb4DI
 l147xyZh9D+fv79icaXJj2X0qIsBHD5YJPvlOmYYLp0bRGYcUoJOV7st9ZIRa4xjX9Y1tRKz2pj
 PHSODpgFwoTAfNL+BznDlBuIuweo++Hk1MZcIHstfAdH7eB4Xak9wZMLXRr8ipuUhE5yqNAs3Ho
 nxT0TAez74aJmkHkvre0hzKAa/bd6Inqu3drInsnYwDJ1/ioOFAZqncW5t0zhgn4urihVKFauHV
 uBkr9Rcg0qj67Zq88rQwC46q6P0v+Bn66obAP20O5/Y8rI1qjPpI0P7La7Zb23zk4g16JssSd4o
 7JWh8KGCvxad/MDv2v2IYYCaVwv/PuyR5jQCTeIiTXbJLNytF+/I4KIvB3V7NzRXPHTnIKhamTJ
 v3WAyAmRET1SRBh9lgpsSMGR+1h9ml0A7EjhlKqYVWpetVTQ851JNd4orugOmhF4lBAfI3Ca
X-Proofpoint-GUID: XPR4f7ZZzNAmG2EbznvMFkEQPxrIcbOJ
X-Proofpoint-ORIG-GUID: XPR4f7ZZzNAmG2EbznvMFkEQPxrIcbOJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=918 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270129

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

There has been more than 3 instances of this helper in multiple codec
drivers, it does not make sense to keep duplicating this part of code.

Lets add a helper of_sdw_find_device_by_node for codec drivers to use it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/slave.c     | 6 ++++++
 include/linux/soundwire/sdw.h | 9 +++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index d2d99555ec5a..3d4d00188c26 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -273,4 +273,10 @@ int sdw_of_find_slaves(struct sdw_bus *bus)
 	return 0;
 }
 
+struct device *of_sdw_find_device_by_node(struct device_node *np)
+{
+	return bus_find_device_by_of_node(&sdw_bus_type, np);
+}
+EXPORT_SYMBOL_GPL(of_sdw_find_device_by_node);
+
 MODULE_IMPORT_NS("SND_SOC_SDCA");
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 2362f621d94c..84d1a101b155 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -18,6 +18,7 @@
 
 struct dentry;
 struct fwnode_handle;
+struct device_node;
 
 struct sdw_bus;
 struct sdw_slave;
@@ -1080,6 +1081,8 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 int sdw_stream_remove_slave(struct sdw_slave *slave,
 			    struct sdw_stream_runtime *stream);
 
+struct device *of_sdw_find_device_by_node(struct device_node *np);
+
 int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base);
 
 /* messaging and data APIs */
@@ -1113,6 +1116,12 @@ static inline int sdw_stream_remove_slave(struct sdw_slave *slave,
 	return -EINVAL;
 }
 
+static inline struct device *of_sdw_find_device_by_node(struct device_node *np)
+{
+	WARN_ONCE(1, "SoundWire API is disabled");
+	return NULL;
+}
+
 /* messaging and data APIs */
 static inline int sdw_read(struct sdw_slave *slave, u32 addr)
 {
-- 
2.49.0


