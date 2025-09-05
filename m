Return-Path: <linux-arm-msm+bounces-72330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0E4B45CD2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 17:45:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4F47189DD56
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 15:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74643306B00;
	Fri,  5 Sep 2025 15:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D02YYZIB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D469D30215C
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 15:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757087083; cv=none; b=fecf94Iap1uFralSpVQ1Wp8nREuUnyBZ//Z4iUUVAIJLss18eHPdGpc6pUei3W8/MCm/251yt7lP3B6rbCA9p9Pkx8R56M9BZ5yceoDetGxeRONh0C7GYtSk76Ex8225S4A3S7KCTMRW8MFb6VVOtxlQN7bUKjqBwA0t7b2cROw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757087083; c=relaxed/simple;
	bh=ikumlZWRZ31uELt9Gx3EsqoON5ydu7Y5Jeqw2vQ5WF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rs2NTQq5Rs/kvuSiC0y4ECHyEbIGgqiAsD/AI+wpFKUpywdC6FSrYpCXyQS37nrrdk6EKUEWolrpttSF3+OCOJq88HICAhCGa+sGFtkfBWDext2cB5FQ7RSk3vvxjAZmb+jCF0WHoyi2DlUFUHYOAQnaECCV7WfR0au+Q5Gr/wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D02YYZIB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585FegWr032203
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 15:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=O3dcTOpjTe1
	fHGNnpmdRKX8jenRcrbq/0mDRIoxdxMI=; b=D02YYZIBUITV5pwlOSftAd7xBpI
	fbZh8JWiJSbEES+tHBf6yJYg/X100rNTm1sLqFgzy/n4hs8sisCcMsWfxrzPYgyU
	F3wvrrHp6MLV8r7x3DwDgeqKe2UWqA5PShOmDJRJZT5TXdmQAxjXYovvjCUXrYjs
	XaGYrBo+g4Qyecbav2B5z7VQbicTVtLKCCO+nlLfOWN7eox3sOAlLB9PaXpPnmeE
	ONVKkLBlVIQrH/MCdaOnKwMGyda9qqgR4x83L86E5S7RZ+TPr/+e5kuhxeOyI2qW
	ZhkSZvmd7VNptORsMo79rfm1Pqe1S2sRG4+ciReNwSTEjoE5uJKmqOgeGvw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpkrah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 15:44:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5d58d226cso49638701cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 08:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757087080; x=1757691880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3dcTOpjTe1fHGNnpmdRKX8jenRcrbq/0mDRIoxdxMI=;
        b=QNz0ROHM3Msx6qe4DWYT/xm20J+NuoGHXENrIpt8GEjrdCu3w6kkfzE+l4A77WE5e9
         ItgUvNxtqNaed0u8Ax1+MoHxU0hZa6fzs5iSxVrLoLRivmLjhnwqaUaGSt8VLTQ6fbKw
         8WKzilO2H0XJq4MjfPomycHkk6pE3oauGkqofPnM5N+/NQTobnQuSjo3rRj18wnca/qQ
         Hnno3PVAcTE87c6HgwoA1ryDD1VPQ0fVtdbE1f7KDK66aIm2lwyNJuNnmEEDQ77JMHOe
         JYynwflsrDJcjQ4AagAIWbqxC2oLTuwSh2Aq1Q1rPnuqck4661knXGbfaSJ0wmC5r6gX
         BHhg==
X-Forwarded-Encrypted: i=1; AJvYcCXER/lxI//BMlk2eeLAdF8WlYtG+L2KWH95g1t/O2RNEcIwRQmIdHMAj6oiwnkfG6zb2UiMwrd3HjIfz1JV@vger.kernel.org
X-Gm-Message-State: AOJu0YyoUEqgABir1/1hBwRE1nXAOVqaqDvq3yTBkTSF6Tj4LEoWlYox
	S/WW5qE2Wt0KXb7ru7SWtl1BI+zreE0rbbnxGqOtoSN2TM5u9i9+tuIHCAnDa8rtELU7e22gbDs
	b+UibR39pt190bE7cuL0oKTM0HBf8qia8mED2EMwEdp7D2ydlQx0OAv9w9CdABk+l6wno
X-Gm-Gg: ASbGncubjjzcinzMxoY3Tdgn/Qnhn8FnWI6cEzvn+T5KmJ1r6FmuWSa0zo8u96W2Ig2
	b6V8w15/M+avVs+BD3BAsx8CnMt3x5Gk2pKuX4ZvIjyW5xAgt0hxm7pAMk4pgiZEdXRNHmLv+SH
	Zkt2aL2pvuOFLR2C9U6AkWjuI6Vs82OIQswUpKCT+fkaFQe3ZT3q4pqcNH8P5bGtGjpcp9RFMs0
	cBs8YEIxSZQxf1V7chD+gVPl4KVjN0hBzWR8O3VOEmRNJP0kgic3CcNTSPkgsBCF0iSyvtRhT5X
	RxGWT2gxeo2kRxkRUuXWkTmDdKGeQydqsXH9qpynEzaMQFGPZ8OysQ==
X-Received: by 2002:a05:622a:1a19:b0:4b5:e15e:d5ef with SMTP id d75a77b69052e-4b5e15ed670mr54954181cf.49.1757087079920;
        Fri, 05 Sep 2025 08:44:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsTP+/oq/rU3gn4qxY8GGD+OI7+4fFO7Hkn/XxWCtszgnaXtzRjTNhePOlo1nQwVRWWK6iJA==
X-Received: by 2002:a05:622a:1a19:b0:4b5:e15e:d5ef with SMTP id d75a77b69052e-4b5e15ed670mr54953861cf.49.1757087079400;
        Fri, 05 Sep 2025 08:44:39 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9bcda91dsm165716585e9.6.2025.09.05.08.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 08:44:39 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        neil.armstrong@linaro.org, krzysztof.kozlowski@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 03/12] soundwire: bus: add sdw_slave_get_current_bank helper
Date: Fri,  5 Sep 2025 16:44:21 +0100
Message-ID: <20250905154430.12268-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2hJWeXsx9jrcB8POHanD1I8VicXU6Fl1
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68bb0568 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=G7Fn18kybrAXfbFeA2QA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 2hJWeXsx9jrcB8POHanD1I8VicXU6Fl1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfXzqmwNu6glAP0
 QGvzYAxRNYYLd0fLf9GoS6QrIB3xoh/vPJSbKUSxsmk3uQisvWHpUqggFSZw4qVOtAznogbXhEo
 R5RDVoEpxrN7BKMhfyO9Sq63s8PACVSfnnuM6WzqtBNEMpFBIk9AFGc/sWFf6X1z3VC7rNLvT6c
 XW91FQqKMSyeOvd+1/SmeknNpuAfQlIhey2bTDJVinRgZ7qPXQXNy6SHQXrBzgaB6KOupqUfQlH
 zHfF4Rw4R9U/Mqdb3xdQZYxZCg8H03isdNE6nJUBl0Q1qFGkbisGcVG05wmD9q1Q71rxw5RGmKV
 APpQ+9VM6/dl7Un3hjgN4eI2SiyCrMU/Gq2sr/BDz3TyQcZ19czBssfC7Ic2T3nlKcJzNpxqdGF
 CgADD9FD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

There has been 2 instances of this helper in codec drivers,
it does not make sense to keep duplicating this part of code.

Lets add a helper sdw_get_current_bank() for codec drivers to use it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Acked-by: Vinod Koul <vkoul@kernel.org>
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
2.50.0


