Return-Path: <linux-arm-msm+bounces-72757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 080FEB4FA95
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 14:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C39B344BBF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 12:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B71732BF4B;
	Tue,  9 Sep 2025 12:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VFM/HQRW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437973375DA
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 12:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757420425; cv=none; b=eb5v0j19gudNFdUNKkpHQkKowP08RHquOFXEdWfBo3xvctvLpDJ+C9r+nNavwR8MZWFitbXCnIwSxmliZVx1z2e02QXSUqclRKUaqENRyyFtGov5RKMTF+/PnlQOwF8NpUavk78XU3w11+tW2cyRYPG+TOGZ/06rIE5OxAfxxxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757420425; c=relaxed/simple;
	bh=PhB2wEGrckuh+HShGhmgklly6y1CfiMHr/vjqDHdiKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g0rKtDODsF6nG+NAcfeuQtYxSMQx8NFm0P6/r6yNaq+r8rYwNaEQOwXM6Vv+jhgpL7FjYDuFk5pTrxNjaHSkzYHDfd3IMqgwcmmD3EnJaXIQNCdGmKy6W/scCf4LXbHbRPm7TfpIjqfNdxxYrdvmZ1pfpPL0iwKRUJMKPp0uwuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VFM/HQRW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LSCN030498
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 12:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZHK+TaiHSdo
	0i2W1eF6c5y+ExVot/td708SwKzVcklc=; b=VFM/HQRWMGJdywAHGJTpi37ZUr9
	6meXcoZgtWvYwi5ck7swsNxf3AZaVugO3EHoFlgoGv/iM+DOWME9hCPZRXSg2gl9
	O1hDLDNxGw2WrTh5oRZUtL3TCAkyOd5ZfNLGjjyVidyDEpIDvzBzkriKOQxK5IL9
	rsSoYGuel9Y+UpRJ6DGJGDNNiSTj6szr08lHgIVSybEjdf8jd9bSou+T+w7lDprB
	sda2DiMeYnfnQzhV0Xczt01kzbqLH8LT3eH3yXKYhcWIW0IXz2QT0HX1V7WPyfLs
	GUJPLwC8I7qIjnAGkVc8p8qxRHIP+jSuImfFy0/ShOxc/4Vfc7fjA7cm1dg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j88su-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 12:20:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-806a4452050so1078095485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 05:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757420422; x=1758025222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZHK+TaiHSdo0i2W1eF6c5y+ExVot/td708SwKzVcklc=;
        b=BcENAipy0QwE2KGSZWuogdRgYk2c1t05tYJJ2I1QYDkYhalOWfHqQyYaakFFr0lngK
         QXZTDJ/aiCjpQkSzgq5YGW0/KvsqDNZMGW9tFu/VwSvBnHM3e156MYxmUHy1YL7BYXaP
         Ceg3BDCIoWLCb7cowrl+Y7jLDqWupJ6uI7orba8XXumul80hUGWpu9APycQ9Ba3in6gT
         0VsQHsm3i6tHljWiTjoRVSIyD+OlEXhxJvxzW2fxgF5XyX4fyZP2IpeCXiBr9uWGi+Tu
         9KQMI9Y/DJjRHoMfhASIH7bdaqqAyCatyhq4PgbcAoM/Py8/XQNpJh9KTpDrh9rYxYl5
         Nmtg==
X-Forwarded-Encrypted: i=1; AJvYcCUL2MsW2qiEi3vVjU23kh4HPUDitiDjocbYDq+my99U0jt+VW45HKpv5W0J+HPkxr0EKflBc04aFdhNzd59@vger.kernel.org
X-Gm-Message-State: AOJu0Yxydzgkqs4INcdReE7qEVk1ZrrsKCKgUg2VxKc01m1TjsrvV3P8
	Up+pxInU2Io2LvLGEgpHh9iz/O6xwWYXTnzXV/w/JLeJ8kqjOkILlke7lx49qxlhJn8CRROLEZO
	zj0/OAIyU8vQZ4HlrI6Sm73cp77z2tYHG6wGaPaUD5tPsj6wROw2+WcdKYBtsHxu4CoW2
X-Gm-Gg: ASbGnctjnPwPssR+ifeGyjc8Dg5HkP7r3NQRl8Cu2LbcMwHyYxnOYSdw5fyKbwHpZHL
	+WwccpRsdr3OIvtfbgwZvtvn1wFJYX3JDiAqOyyU85Ys6DfYHn7/bHndlvjrTcu2Af/INlZcAJx
	X9/ZUB2+Erwa2gdJYfbGPI5PuLBHZzQzyVOpZGMp6oDGgrCjW3l/CN++5ZPNu7wR/kZ+7kAInVq
	QbcaK9iMQIHN0A3CgSpHviTZipHT9SjejovS8fJJdH+7iVfzGrBXem5S5gNNopy7EGJEcSobBvE
	qhrDvKYsk4SjvtkazPg2SoY0LulfBJeAUx1rWhpO+sBbD5MMKbM8Fw==
X-Received: by 2002:a05:622a:1207:b0:4b5:e344:2238 with SMTP id d75a77b69052e-4b5f84854a5mr122850971cf.66.1757420420931;
        Tue, 09 Sep 2025 05:20:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMoY0xoETxBaCFi7Ptq14Jrth0iFyOEnu4PH9NM0c/GGJJIt5VqKgJPg30ywYGkxPCWm/D3w==
X-Received: by 2002:a05:622a:1207:b0:4b5:e344:2238 with SMTP id d75a77b69052e-4b5f84854a5mr122850571cf.66.1757420420197;
        Tue, 09 Sep 2025 05:20:20 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75224db20sm2414629f8f.60.2025.09.09.05.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:20:19 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 03/13] soundwire: bus: add of_sdw_find_device_by_node helper
Date: Tue,  9 Sep 2025 13:19:44 +0100
Message-ID: <20250909121954.225833-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250909121954.225833-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250909121954.225833-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfX4vZEjd4ymmFc
 2JI0F2WWljka1LBPf1fefmIxJil+bx5RVP23ClETEcaCtw75nkXXFyUZqTOd5qkLdWFf5Mbp2mB
 VEeYnVnDqUAkd4MuGPdhCq0eBuxNAVYfMk1lPaJdd/S1yAYIpiHGVde7gLNXbXGr4U04/GMHWgR
 kPMIUe1Z8HcqDrJQQN4DhohPHVjbzEeCmy51cOkmTBsWMyFLuYm6dwQYp6+eFljOVOZR7qjUR5B
 QAqTDo2NPPvl1ilUJOfIfZMsWxYW03CEgmdy+UMnf+XrvPUxIr50UCVUEIdWeaZhUujrUfdVtiP
 DkPfhofaKEeRB01sZXDZmYy+w9/IPRi2HLgT69bw2Dp4LolxE/d9zqNeK3hDCJIEeLZP+yGQK1d
 APyG/evp
X-Proofpoint-ORIG-GUID: Vvqh4WYKz6S00y7ztm0o89c0TwguLGvY
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68c01b87 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Ogeiovxhkh_6Bnox_XcA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Vvqh4WYKz6S00y7ztm0o89c0TwguLGvY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022

There has been more than 3 instances of this helper in multiple codec
drivers, it does not make sense to keep duplicating this part of code.

Lets add a helper of_sdw_find_device_by_node for codec drivers to use it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Acked-by: Vinod Koul <vkoul@kernel.org>
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
index 0832776262ac..096213956d31 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -19,6 +19,7 @@
 
 struct dentry;
 struct fwnode_handle;
+struct device_node;
 
 struct sdw_bus;
 struct sdw_slave;
@@ -1086,6 +1087,8 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 int sdw_stream_remove_slave(struct sdw_slave *slave,
 			    struct sdw_stream_runtime *stream);
 
+struct device *of_sdw_find_device_by_node(struct device_node *np);
+
 int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base);
 
 /* messaging and data APIs */
@@ -1119,6 +1122,12 @@ static inline int sdw_stream_remove_slave(struct sdw_slave *slave,
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
2.50.0


