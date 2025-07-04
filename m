Return-Path: <linux-arm-msm+bounces-63697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCF5AF923A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 14:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 657C37BB4A0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 12:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 428CD2D6402;
	Fri,  4 Jul 2025 12:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IiUjkkFQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D7C2D5C78
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 12:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751631162; cv=none; b=EHcVDny09aFGkn2PxjysV2EpAyjJE5ApS3zPR+/PAKUu9ZUEeax7VHNXM1iH2rSbPGGFEK1OlNRpbaaKfjFNbrFiYQ9fGj4oiM3f9e6yZqWsZ7Obi+9TnYCx7aWehzNxVugqVztk6tp5IEf7bKBuzMGpf2gNJyINPJIaYbJDwPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751631162; c=relaxed/simple;
	bh=igUBUA3n5sE+ryV+TCZZwRELbUlpziFktMSLAQRL8mk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PSfvwX8ENZb9M+X+TM8hJk3oEhqSNzfWbCAp35hWMGMPrE0BQB6OvK6C4+vXDpgBsZm0tcNrOvdQsDJYcGwHBS4EHargja7/3NAADuJSQ2Ml9W7frqHtz8nkr3K8sZH48B/G6esM6rtQkPec3Nbjy94AuRjsK2oGwimysprY5Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IiUjkkFQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5648lRa4025172
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 12:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0K4IH8rL5ak
	/hBH86TtBACFo7QeNlxuqdpxZlK2scYg=; b=IiUjkkFQgodIVtw/lCHAUsfEELB
	XtpPnMImlbQrzO6wMIRpNy2bWOJDWzM+F3rjZvnKu2BrvI2BxVnKS3kA5Z7lyzj0
	m9+NguEBNyccQXOS+fATth19b36OmCDsHTniQ1QSl4KAJ/SxXbp8Z17u+vELxXxL
	/Y6f2lr2DVPo5X34r/ua9VAPk3e1eyx+zOo3CaoNtg4VnMb77vudCaByUMJO7ryr
	wMTJax5apUhXVmIbBmmUgQkW3GGN79Th4R8uZkRZZN8jA5bHUW7O5doimLKkTS5V
	rAFL8vHyQ+dC6QKxi9KhG143Sa3HGnMLGxGByAumEjZQltwJQjmydbb4yqA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd650y0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 12:12:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3d3f64739so209069185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 05:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751631158; x=1752235958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0K4IH8rL5ak/hBH86TtBACFo7QeNlxuqdpxZlK2scYg=;
        b=S3ts0n4ukQmawwGl7X5KScTmpuEOGNERj45loNdf2OiZvSearMyHWSI2hpGGmw42Go
         J/cqUjW9McG7u0m8sB4kAPfBDC1FOfV3bOp9TWj/ioElPXxDvg+lJM2vLRbvzecxqpxa
         n2OFgMAQzNwWR9rVidFDksbUMBT7DaScuzlLeTb2Je5NM8vc1KhlKpzViIHxo5QA5a5Y
         sxLUbYy5RifB3GCUiaOP+snv8YpxeYdopd6mF0XG6dvueWsgb4BvhQx1NhnVAUv04rIZ
         QSDeQYqui9/YmapzJZTaKDeJOzUKgPKVHlrRr0pLRxuPKZaSs22br9OAtI2F+sSEFqe5
         /K3A==
X-Forwarded-Encrypted: i=1; AJvYcCUwMq2Iwh1+yjTlROQyFzagHURUz1b2GWhvlGMELk9lA7tlHCGGMauX8E706sRIoIWM48Cvbi7znDviGmZR@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj/67n8GK6icphY+YTE2FwiLI5GQtw7pIEXHBruzs/Hjo74xgE
	6X3Qsnm5UJe93x9V7Cn8uaMk+BxXYiji9GPFSl+dA2e6jS0aTLlTqNMQJ7838eQKRACvCP6/kGh
	EJdwP57L00xX6kNDfOM3TTPNvzy5OTOf8OOVMEh8eK1JWMw0LxQMbTIwtOh0Ysg+0junv
X-Gm-Gg: ASbGnctLkc7LEEyFM6U/RTFKhP+zr/ZI0gpGKrcWpqJsJjFx6vBJzAXCFS9HCGEfHg8
	6Ga7gCsRZpbHLsd8aph3SuqFakVwzimn0F7LwkAziL6n5r+DDbCN3tocacKRp1aQoq2w6NOTMEm
	1o0iaR9Wn0JuqCpsGgAzAY0d03dMp2yTPR0R21KrAebPrv/nKZhmVYaqeRc11fXJptEmerqPKYN
	zGIFMYFImzBg+9py8cvMooRIIgpJngRVL+hubpQBEYD0g77QsHzCEu+yc4c4C2WocMnYJidGOhD
	Tfo+fO8WNdcXnmAUJ1iyMF+1NycAEorB7wNVZ3nLKHibiUPb2Q3r4yc=
X-Received: by 2002:a05:620a:4044:b0:7cd:5ac0:4f19 with SMTP id af79cd13be357-7d5dcc7292cmr417935285a.13.1751631158436;
        Fri, 04 Jul 2025 05:12:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzCVWXAr6d378Rr/J/MsgHEPTEJ5PePBTQUBZb3QybPZwAeJx5Z9ygLeYof7Xrb9p9N0p3hA==
X-Received: by 2002:a05:620a:4044:b0:7cd:5ac0:4f19 with SMTP id af79cd13be357-7d5dcc7292cmr417931485a.13.1751631157858;
        Fri, 04 Jul 2025 05:12:37 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a997de2asm53656745e9.12.2025.07.04.05.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 05:12:37 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 1/4] soundwire: bus: add of_sdw_find_device_by_node helper
Date: Fri,  4 Jul 2025 13:12:15 +0100
Message-ID: <20250704121218.1225806-2-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=6867c537 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Ogeiovxhkh_6Bnox_XcA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA5MyBTYWx0ZWRfX0GwjklQ9Wg7z
 cRzXgR/WT/gKcx1DcNng60y7d6Bt6MpDzARm40KbOxyxdDcPszfKM8bdMO0PY0L3OFVx7XDgHmn
 6GMCUNBfjZHdd1To6OfYWsIq0DxnOOnR1L82an+nQrLnlndlhMNMiroXo5Ny+x9HZhHQdS7wDoV
 YNHuZusIDsEAjtlnSBaeGglqijA/sj9jQHqArh/x2JKRddhXQqSpPo9gM3EhPbF9tLLQ/i1V2sj
 wu7V5Fys2E8y7pvTjtxw0Kklj2f+nc8TnyN1sbbj3VyxSEHhR5dHjEiEqfCUuaU7B7c3wj2PxT6
 JEWiisR2JB2LmAA+7cgu/898X+zHky4e1Bwnbb9vakwlauToA0wLeZWGH3Jy553wt8s9ySH1/PR
 9YupJXCXTRrbfD6TjMuY1gh3zWjG5sj8K0OMHeOo+104uUl75cwCVj06pJ19AYCspzgsnKRu
X-Proofpoint-GUID: iiKeLBklTBY-5uol5r-nvUFKAN0oSD7A
X-Proofpoint-ORIG-GUID: iiKeLBklTBY-5uol5r-nvUFKAN0oSD7A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=922
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040093

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

There has been more than 3 instances of this helper in multiple codec
drivers, it does not make sense to keep duplicating this part of code.

Lets add a helper of_sdw_find_device_by_node for codec drivers to use it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
2.49.0


