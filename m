Return-Path: <linux-arm-msm+bounces-72421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9645FB47AD4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 13:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55C7A7AD94A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 11:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA81262FC7;
	Sun,  7 Sep 2025 11:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mxQjU3cx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1D025FA3B
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Sep 2025 11:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757244132; cv=none; b=n787XNs4h9SUaunc8gmwr1mHWGu6cmOM8fyJ/Hw3W6n7TRRT4uZ3Kibq0maj+xkJ6ib2QbTPTFBSXx+JXUOc47ubmTdNTqLaNirNF/IcjQRHoY+tGQcTRC0x17x6GWevleaehIUsJnK/M4mjq+e88SrbWAyvFS0mfwsqi2rXg/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757244132; c=relaxed/simple;
	bh=PhB2wEGrckuh+HShGhmgklly6y1CfiMHr/vjqDHdiKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pSZZkIp9JqPdpMGRFoQAhHohKdY0nETVdlD+rMup+pLSRWm8FRoPuvAUWRVB1SC+xs4eJTvQh65Pva94WKzSt3M3hNzkrm2yrefRAnZVRs6z6alQkhoxlBZzk3OOLclsYW4QqebTbdiKhC1Z5X9YIMsKTT7HFHnjJz/HJfKu7H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mxQjU3cx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5879WBPx027661
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Sep 2025 11:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZHK+TaiHSdo
	0i2W1eF6c5y+ExVot/td708SwKzVcklc=; b=mxQjU3cx8An1ObgxEPZzbocnk+9
	Oj3RVCNniYEa1ivUnPnPUffN38fbzLkxuYaAv0Y66lzdTKG13vBjq10yQxgj5NHR
	Zy5A4xrtsrGpyZUf0DlMJBBsyhdVnzTOkPGNHhBdcogpHRBW/vtM4y0PDtFtltj4
	26MGOF5u8VAyCkRrJ9kXOtGqa30OLPTWU5NmOjyCELzazATZkfFwQuKdhBJ1b8Rg
	4dEN1X/km4GBQOm6AkhsdgoxcxE9m9G0PWmhQwdb3rp0c6VpOndn7AEtgucmLfS9
	vKOjc3NhNL7UmjGGCD7vhC5GJzpvJa/B/Jdc66tu/nDT9vVSEKGvV1ywHXQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490d1va0vm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 11:22:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b6090aeaacso7640021cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 04:22:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757244129; x=1757848929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZHK+TaiHSdo0i2W1eF6c5y+ExVot/td708SwKzVcklc=;
        b=wPkpi3ZjTGg8GeRKfCcXOA5ldmLwEJ8JGNYJB1nWiVRcdcHzQVSi7YflPUdDAbtOdv
         JCZrFUdYi2xt6waTyosw1P2pxdb7s/MAkfI5P1iH5xjCrMmNCCZKmOryw1J79zfNvQMo
         gwpPD/68p3GgRXqj4GYIzKFBRJcugeF+JgYUwcILAIYXml96EEU0V0pnQjo99x9k9rvH
         34sD4Wadrn0tKjeZAagd22Ct0cs2iAT9FzLZ2SWE1rAs6keqV62+KHuPFq3tLURUhu4V
         vAjBuqNMr8Y3TjcMJ0HmRbfKxhX4Ks+SRljxd6d0eLx28mJpa5QOSXkGffpn9oNsH7o4
         O/Xw==
X-Forwarded-Encrypted: i=1; AJvYcCWl5zSEBOeYlgE7INsmXDdFBis6EBmHuld+UKHI38BQyslqrC6QKW97bJfYudrJHKNqElNYAzvU0Cc/31pF@vger.kernel.org
X-Gm-Message-State: AOJu0YwandXsBhS1057z2p4H6mAz+veYu3wiAdnAwrnyf2g4I+o78DD0
	jTX6452A5QK2adOhspJaSP6An6mCRTza6PmDBVJVXAVHseK8Njx7MdvclTCjleqqIL1ovfkVLDx
	PBadlYk9xvF0pOEnI6ZzkYrrRfX1ZgELX2YyGRS1TogmNFOPWg5HzZEMVRMtZXGcggHWh
X-Gm-Gg: ASbGncvE4Em7Nzx9U9MFoLZCW5O7FosrWLs7fm9EVUfERg0NNJ+xlNEgv7RGpRh5eq/
	TXeM4uvOGZTJ0y7SNZVnTr5OnmQsaYP4yXiCTb6nEzAGyOT9UzaX9S1HvOnzwvERnk5A8Wge3Uz
	fY2n9woI/9+tQx1CybTlAwYlFOFAHpb+EfCwBcR5gUHJTgeCrvsUPyt9LXJyYWs+Qk7IJgjxaby
	T4kr2/gbRDvp+yD9Kbacvn01kTulaPAhalI20EnJqD5CdVaX4+fuVnC26ORy9mlqVz2KaROSf1c
	J4r5pEFdQcMrAcEpc6uF8ucayKUqMv9Z0tfIL4HmOQiQWDaBJ13ARA==
X-Received: by 2002:a05:6214:130f:b0:714:91a:d51f with SMTP id 6a1803df08f44-739256bd593mr43052286d6.24.1757244128853;
        Sun, 07 Sep 2025 04:22:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRpvo/Ktz++VChqT9BQI0Si6kH1RlxX9IjInFSxnzwqxbCy6DtJu9h6HVvqTLkMEe+8BXEuQ==
X-Received: by 2002:a05:6214:130f:b0:714:91a:d51f with SMTP id 6a1803df08f44-739256bd593mr43052066d6.24.1757244128341;
        Sun, 07 Sep 2025 04:22:08 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf34494776sm37523289f8f.61.2025.09.07.04.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 04:22:07 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 03/13] soundwire: bus: add of_sdw_find_device_by_node helper
Date: Sun,  7 Sep 2025 12:21:50 +0100
Message-ID: <20250907112201.259405-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250907112201.259405-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250907112201.259405-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PBioxhiGps761fbD_2pDSwWWHeUCfYea
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNyBTYWx0ZWRfX3ZYUHqCcis8z
 fBDTepPW6OqhIgTyFo51H1Jzrh92zQC3muBSjMcxLpz7Zj6NlPkg+g5+8FCaAj0B+Wpe40xnVnA
 lkBnpvRzQGaejeZGUpvYKaRwXnLDaHtz7ANF11vPq/Gzvr1HYfwzmLApW+KVV43y9UA2FyI9zg3
 m1D+ZDxdduwjHGT1I4eFXT1Cht+o6VxAQux6a668xixtpcarsvPyUbBT3n/3PH1wTA+Ws5W99OB
 GL1znE5e10t5Ge0oiWdBiQnRz6dJvgtS37Aon6jdQsQ96W93eDlQju5yQSADamidmHvOmwGGISD
 iuvDt7r2kez7OPwPJQ+By0oDv/fCzqsyvXXm+vohBDJNzHXeZ7OM3hKZmHgAjYPfLCBokO5Kp9x
 sVKpw5MA
X-Authority-Analysis: v=2.4 cv=cYXSrmDM c=1 sm=1 tr=0 ts=68bd6ae1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Ogeiovxhkh_6Bnox_XcA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: PBioxhiGps761fbD_2pDSwWWHeUCfYea
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060027

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


