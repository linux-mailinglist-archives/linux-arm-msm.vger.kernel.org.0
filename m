Return-Path: <linux-arm-msm+bounces-73248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57783B54572
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C4A917191D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 08:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED23221FA8;
	Fri, 12 Sep 2025 08:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OSoZgAXK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE7926F2BF
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757665955; cv=none; b=tDcBcLlZXKhnApe+wxulbtPJm4fjmSroaDLpOyRYydKnH69CjM6fezSLUencw6rh5Bbf0ImaG3Ao2FYz1lofE+S9nIVRKTgqZRBUAgQMoQCAxPcU+3rL2Gb/LumAvbR2rIyfYA2T6EdC0zV9R6RMAEVPSi5bXaYK63Cz2eLr0WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757665955; c=relaxed/simple;
	bh=6dzcJu5beHXFPE2ysDUwBwwBtBpB4yJJYn3tCF46Fow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=it7WRzD8GmIB9VGNzIHwYLf5njQO5dQHgRkk7O9/RqxYj6WoBF1oUVyYuc++ink58Yl5Zk7UZzXXUmsjnwP8m7Hp+ZjKzIsVnkyAUoy8iyKjU1jyGYJ97bKFxuv0mA3wVzkIaLYpgVms+YdCJ51TBfDBGNu88rLiWXc3dw4ShTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OSoZgAXK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C7VlxL002567
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=B6VI6rYD+l1
	gAQRdPHYZqiU7gvDzWifBcr0RacDOpag=; b=OSoZgAXKmdqUY6KvgQqtrGReG4d
	cm4zghAOs5ox6GVceNxcAUbwQV2+Y5gemn2EpBQHlZdlm1HoaJvZQDTxwwiVH1tj
	Ht33z8GbxpXPB0iIQGp3zX51CgCK4XCJYZ82NBDkKFsGPdRKsDEncKhCe4lX7GvT
	dzb7Vu3DGKpu/IVggLM7D8yGSTy9IE+usRNXyEf2LnikXfqNPRpK7NTNLgiSHvwY
	uNM92GkNLS8p0sgGfmXCslbXp074YuhrSJTP6hjuVtyPktrmttlF43rtWGfamxyG
	xdWzNNgHdpJ9f/xHE/Tvt91MvQPCnyiQPBH4ZCbUPqgejR/KBYsaR239FBA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwsk000-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:32:33 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-76487cdf979so28431436d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 01:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757665951; x=1758270751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B6VI6rYD+l1gAQRdPHYZqiU7gvDzWifBcr0RacDOpag=;
        b=n8tVVBkWsN4nmi61C/c47hNJwJ9sHSTvS646Ir5NjyWvFHZeXxPXSuHbkMJ0YVacYK
         Gv59UMWSR8MYyXxZOzoIXG/AWa7OP4WxTNs4jlUc3JzpGS8PC7U3qMSMZh2uhh3fXO27
         05CJihowEXUXbsCmdATl4vQP9Saq4C9k53PMt4oB3KgD2BOZ1yxA6SrX3q5UG49wvPTC
         puMrsGoiVlm4lbsdZvF5LiHwW9203KEvAKrNQkWGoKc7TxXzsw6AWOotsdanV424SHJN
         9I1pSi69mpwCZ+Bumw9ds60NBqDTFkXbu0KCO3mw0UQ/h/uSDrMD5QqeHpRtk8GJAo/S
         VjEg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ2vJfILfWWPk4BppIQcoqv7uMJAPk+12QpB1nLIPVu41Y0ps7BlZA4dqnOwCv9ZocWHZlK9ZIBSDVT+Yf@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf2yO3uAxHhkBFEUhtpuJ7tmDfuNKBua1B9KigMcSKSCbiEJgN
	nP33WNJKbphjQ4R/QYKMpiWWDURSM+YmNDjeE0SMHq2amm4WIXjgjlMotOYqLTgtWQXTlWiSN30
	OyGUqw8zpmG1/gSTFKKtg/o1lf8klpNdGwsbJgHST3YFFUab3CfFy6220e8qmfh2AgmAb
X-Gm-Gg: ASbGncsi+EtUobY3f/k3h+E7M6K3mRNNinw6jyb7pNiWe442dcmlwBNfIMBY3TEg3X2
	4u/SBaPHE9HxxaAsFfioRW/Mad5uL4ZogHNmWNlVg6Re9tPCl9w6i1e+hHF9vIv5QEW6VVY9h4v
	uqavlCifBWuTVCAiMh4x9pLTLbhJD43Xm93JLCQWWujh//GWX2/NhG2D9QSg7KZqAu3LduFexpL
	8SrA8kXX0Ec6TUp7QIfs5BTNabezsqEDN+nojZeGCCq8rcacBoCecXosnbJ6v7NWEIlOT2I9sGj
	JGHA9iQHj7wRNp90XQj/vyBTcujw+k+tMOD3WoMCMxFrMmkFhfDFkQ==
X-Received: by 2002:a05:6214:e6f:b0:763:e314:63ec with SMTP id 6a1803df08f44-767c5af17e2mr29399196d6.67.1757665951447;
        Fri, 12 Sep 2025 01:32:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0qy4hjjfisWxEbcXf4ENJkYksaMBthTfpP/gGk+hCjiWoQIz3yScOjbpnmM/mruFNXXqz0w==
X-Received: by 2002:a05:6214:e6f:b0:763:e314:63ec with SMTP id 6a1803df08f44-767c5af17e2mr29398906d6.67.1757665950959;
        Fri, 12 Sep 2025 01:32:30 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017c1dd3sm31247265e9.2.2025.09.12.01.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 01:32:30 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 1/7] of: base: Add of_property_read_u8_index
Date: Fri, 12 Sep 2025 09:32:19 +0100
Message-ID: <20250912083225.228778-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5C5dP7U2RqKlyyMGORTyYaBc9N31Buf0
X-Proofpoint-GUID: 5C5dP7U2RqKlyyMGORTyYaBc9N31Buf0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX+ePr+RLBUDXo
 i6NQX4TZjsyJEfLmM59CHbVJEYAcvu9fdVf0PhSDxPesknJd7spJ03h2itJ+nbqppTp7TpHYbz1
 2KvWU+CzugSsOHLELefF/E0Le9wPhMOibSDBpEpAyWMo6a+Wcq4aL9jtF5VGXLQciU/h4veiYGu
 mHTzqysq6P5o3chrLCcairEjF3tYOgF0aSGyou64cWYWcZRA3TbqT4+EP3QV1tnfvrhnfGhen8V
 9XsfYW9ho8ezknEMXMIJNo18f0oBfQgWyhDk/Wd9YnsTDqIAVZpHqXWD/OfEkFeUzUeqgUJ4k4G
 vbG+a33RYv631ACiBNIgaJmmbIWDwrmFNHB280XJKxvq1meccnQsNeNOsN5Tp9nNnUxDog/61Wx
 5hcFAoMJ
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c3daa1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=3hxEEigdzuJGYQGY9uYA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

Add support for of_property_read_u8_index(), simillar to others
u16 and u32 variants. Having this helper makes the code more tidy in
isome cases, specially when we are parsing multiple of these into
data structures.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/of/property.c | 33 +++++++++++++++++++++++++++++++++
 include/linux/of.h    |  9 +++++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index c1feb631e383..4e3524227720 100644
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
+	*out_value = val[index];
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_property_read_u8_index);
+
 /**
  * of_property_read_u16_index - Find and read a u16 from a multi-value property.
  *
diff --git a/include/linux/of.h b/include/linux/of.h
index a62154aeda1b..0c95e26c7191 100644
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
 
+static inline int of_property_read_u8_index(const struct device_node *np,
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


