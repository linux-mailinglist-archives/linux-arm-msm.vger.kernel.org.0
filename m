Return-Path: <linux-arm-msm+bounces-71461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1F0B3EF0C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 21:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7749B4E000F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 19:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C0721019C;
	Mon,  1 Sep 2025 19:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GNi9Q9F+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8A218EB0
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 19:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756756610; cv=none; b=RbydZuQsHTBrQd+S4KFEVK9Vk4zCiKz1G7g9EzErf/VJSarh3YAYOmff4WYrg7sdNovKSB7taeDF1TcLT1UNaHLhLPVSdi/5HMAmzQWc1Iw+cSsqmprKYD2Rtc6PFZjXedYPiZs5ymXzVNvRq5O8wwDbaYqa5d80Kay3suolgSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756756610; c=relaxed/simple;
	bh=K9dT3P4cNGVclh9ZLKH6/pAmPhFcGE5GIr90ZQ1Ay3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AvGnBOtjI6tT66LNv0e/UHGOEufvl6S/OYDs5KGDobsuOWG8tFG7DxZLHRqQmvLJT3Ao5IzC+nwLZbjKNxCZNPc1wlYWUo/hK+fwb6C3h/QdLrKCEC2H6Nhfg3R32TV0XrZTO+9xD74/bNFetnOEEqlioVIXwV5f5IXcvKhNkpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GNi9Q9F+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 581B4QHi025303
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Sep 2025 19:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FZYZhkYWY3P
	hyDI6yRMFY6/iMZaM5cm3CUgvdVWFgs0=; b=GNi9Q9F+br0bgEBbcvvcudpwI03
	Th4pzfWza7xwfz/InzqMH0HGD3NzuKpLoQzCryW7S5ZPawRESuFEfLxfgHyL3l4n
	eqZkqAi36nNBXjTlQtEgGkOgVvrkTXuoUUqXvhUcrc6gf+/zXFNQkAaA/OcHjWrP
	nBFH39w2n2jHLXWZjJfqkj4zElV3A+egDTniLlrz8ggAYvGsTQcJsbziyTKqu2tn
	+sKUogw64J64D/bkDisEqaV/i3PfyAKTMux4wtabx1New+zEanfclCRScR8qXZig
	C9cNaUW1wzzYpRyaD3uelQDi3moWhjeJ3X1xfdqwRIyN3G3OakCN/ZHnazg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fdkxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 19:56:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b3118ab93aso59753891cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 12:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756756606; x=1757361406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZYZhkYWY3PhyDI6yRMFY6/iMZaM5cm3CUgvdVWFgs0=;
        b=Ms6O3XiuKr85q56uFMZZQoGcDS375JPZHs+O6jaatxljAMHRM92rV13g9Rb5dPWGBT
         vZWCgfwL2dW0piKwXyZnitSGenGO68/bEOe0yIvQt06arzQIZUJCz3teoA5yVhIKCjyc
         5CX6CStGCAziw1SddlCDaLsokQw7Z01uMHcT/YYuTCEuJN3k3faUBVawqtVepckloK4W
         /44JE9LgJkBe8P9ikEJDDfY/aoNBL+0uOoEYlxe/XB+fb2dUyTitZ9hQi2iEUS1zibLg
         h2nkeQ8oLsAYdwz+ZVijswaVWTZO62zcrnFzGBVN4uzsstq/64InMz57zhrFc11MIyJj
         oMLg==
X-Forwarded-Encrypted: i=1; AJvYcCWW+x6kEMgzjB1W3KcD+6W0iWdbgqSaGn/WjVrCXcXJ5BmdL4LjKMSl59lzFNqTtegkubPADkRaa9uS8Kzh@vger.kernel.org
X-Gm-Message-State: AOJu0YwgQ0YhnOC7J74Biv9Xh7DJeaKDTjSTRxSdaIclsZCnj5yICPDT
	VIHuddbpA5hDM39eahhnyuG5jhnKtlYW5rJVH1pCbYK1fUG5l1mLm0Ppv9z1me2l0HkH6vo+84A
	XbaPpva++JbxEOqsxRXE5leiBc8L8QandHHbZjFOfkm9D8ZcvFQS7dcxYrVPsOq/VGbn9
X-Gm-Gg: ASbGncsbfe11/Qbk2JWuAEpi9Nc/oX8zi0++GSbFuCYvWk6CVRbvsOQB5PLcnry6Ksu
	b8M6FA4XMzcaC9MQNvyW6plu5gqfe1UHEtpUcZYodjLyeer4wMZ1j6cmI/Pq7AKmZV30Z5ThRnJ
	aRGBVdLDaAMzHmi2u7rqWtxTKKsMy/DyLKRRSZmjvUWRwVBg56qlVSp7J3po+leAcrZYd+SySoS
	+SNJ0EqvKAIo3P2wfxRtk5awDtG3YOZb1o/8LP+ylIV7BO661lDXSZmNNRgwBLbMl5hF4q3SVG1
	52Qa8w4nnxqr0TJAIV3n+Im1XvSLEcuBSKAM0h5m0Du7gh8S4pnipQ==
X-Received: by 2002:ac8:5ccf:0:b0:4b3:45d2:190c with SMTP id d75a77b69052e-4b345d21f5amr6627921cf.24.1756756241822;
        Mon, 01 Sep 2025 12:50:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHg6e5dCNjKIORo/d6nONnGIE0eMigxf1K77Q5IjgAIV0Ef4xNH5Q+y1VZ5OQlXqkJvKs9ggg==
X-Received: by 2002:ac8:5ccf:0:b0:4b3:45d2:190c with SMTP id d75a77b69052e-4b345d21f5amr6627581cf.24.1756756241360;
        Mon, 01 Sep 2025 12:50:41 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d7330e4bc9sm4653705f8f.10.2025.09.01.12.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 12:50:40 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/7] of: base: Add of_property_read_u8_index
Date: Mon,  1 Sep 2025 20:50:31 +0100
Message-ID: <20250901195037.47156-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250901195037.47156-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250901195037.47156-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX0JViTeXmhOYm
 C4uipmllKEXpKb5yoJ74GJOfJL288jRihIisvXJyYOE87jGFZPjrBJF4b9h51PzNxA7OKmPOtnD
 RdU+rJ94KhVuptuLUQIsH4ae729I0geF6wE2IqTMvkhNCpcZlGtfFHwVYU5U0HJ6J4JxUa26pPf
 PRPbuzjNsxzP/cjrQm7XCnzknlmdC62IESjFWqucmF3luOL52jiAPIJYr4i8qcbs2hhshnv1c15
 fgrnyRPJDaQYSBTd6xQ2z0dF1xPeQxf2K35Yf1Bd7gORfOG859323mL5G/sInDfsyUwspb44wB9
 agt0Cb1NcQI8t80YepHQiFzK4SmKJfSr0tz/aAUndS1MglhbHuR7eZ1wRmCu78N00gSEEaeblFr
 d2kbvJ1y
X-Proofpoint-ORIG-GUID: sEjGTl8Ml-YKJt0ew1TggpLyRuEHHBaF
X-Proofpoint-GUID: sEjGTl8Ml-YKJt0ew1TggpLyRuEHHBaF
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b5fa7f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=3hxEEigdzuJGYQGY9uYA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038

Add support for of_property_read_u8_index(), simillar to others
u16 and u32 variants. Having this helper makes the code more tidy in
isome cases, specially when we are parsing multiple of these into
data structures.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/of/property.c | 33 +++++++++++++++++++++++++++++++++
 include/linux/of.h    |  9 +++++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index c1feb631e383..a644b24d5b75 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -147,6 +147,39 @@ static void *of_find_property_value_of_size(const struct device_node *np,
 	return prop->value;
 }
 
+/**
+ * of_property_read_u8_index - Find and read a u8 from a multi-value property.
+ *
+ * @np:		device node from which the property value is to be read.
+ * @propname:	name of the property to be searched.
+ * @index:	index of the u8 in the list of values
+ * @out_value:	pointer to return value, modified only if no error.
+ *
+ * Search for a property in a device node and read nth 8-bit value from
+ * it.
+ *
+ * Return: 0 on success, -EINVAL if the property does not exist,
+ * -ENODATA if property does not have a value, and -EOVERFLOW if the
+ * property data isn't large enough.
+ *
+ * The out_value is modified only if a valid u8 value can be decoded.
+ */
+int of_property_read_u8_index(const struct device_node *np,
+				       const char *propname,
+				       u32 index, u8 *out_value)
+{
+	const u8 *val = of_find_property_value_of_size(np, propname,
+					((index + 1) * sizeof(*out_value)),
+					0, NULL);
+
+	if (IS_ERR(val))
+		return PTR_ERR(val);
+
+	*out_value = *(val + index);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_property_read_u8_index);
+
 /**
  * of_property_read_u16_index - Find and read a u16 from a multi-value property.
  *
diff --git a/include/linux/of.h b/include/linux/of.h
index a62154aeda1b..9f921d01a125 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -316,6 +316,9 @@ extern struct property *of_find_property(const struct device_node *np,
 extern bool of_property_read_bool(const struct device_node *np, const char *propname);
 extern int of_property_count_elems_of_size(const struct device_node *np,
 				const char *propname, int elem_size);
+extern int of_property_read_u8_index(const struct device_node *np,
+				       const char *propname,
+				       u32 index, u8 *out_value);
 extern int of_property_read_u16_index(const struct device_node *np,
 				       const char *propname,
 				       u32 index, u16 *out_value);
@@ -639,6 +642,12 @@ static inline int of_property_count_elems_of_size(const struct device_node *np,
 	return -ENOSYS;
 }
 
+static inlinen int of_property_read_u8_index(const struct device_node *np,
+			const char *propname, u32 index, u8 *out_value)
+{
+	return -ENOSYS;
+}
+
 static inline int of_property_read_u16_index(const struct device_node *np,
 			const char *propname, u32 index, u16 *out_value)
 {
-- 
2.50.0


