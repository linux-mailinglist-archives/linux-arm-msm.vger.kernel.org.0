Return-Path: <linux-arm-msm+bounces-72027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2FCB43955
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 12:56:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87E177C0592
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 10:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598132FB968;
	Thu,  4 Sep 2025 10:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pGLY5wks"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59182FAC05
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 10:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756983409; cv=none; b=Kuw5E2Lhdd9FfIaU537VgzhTfQc/CJ7o71bsJezKhF9GvYo2ScB/coZQPXDXH5mBSh8jU5zGnBLnaqjPYvHELI1TpcoiNDF8tM0uocd3Lr+gidpntouqyHBPUarEfBYEzvg645+MLugod4WG1z3uAvHdO2cFY0GDMlwaCg3NPYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756983409; c=relaxed/simple;
	bh=6dzcJu5beHXFPE2ysDUwBwwBtBpB4yJJYn3tCF46Fow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CwKkuY1ZeXAJuLwqZvRB6YSHGomv1z35CbpxW+W7AgZmrWcsaED7aht9xRLVOZwQ1kTWV5RgTeP2i4zgmSS+tV901Y0Cl6K5rDYtOi/12jJt3q2IYVjkvxGbUcHwwykTR9EVr5mktrhfbcJkE0ugZqgTH/ICMvQR5Xs+2PSgSLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pGLY5wks; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849XAhO008141
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 10:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=B6VI6rYD+l1
	gAQRdPHYZqiU7gvDzWifBcr0RacDOpag=; b=pGLY5wks0rpbFWhMhfWy8+K4MYV
	EXMP2eg57SyA94om775L3BkUc4FnSVmxlrjfD6xTnd3bS0ioeR+IB+UOQMdEAEgY
	kTE2cmWTjbxobF0FTKVNVCcq5t8AxH0dbFNOiwOkK63LbXs3N8V0xagMkAkEhMqp
	dLsFfvN0onfYsnE6CVh95KRiyft0FfKHWvDjMR6IQd57b49vWHcwKN48VGGx+vYx
	cuJN2UhJWd4etuQE2YxQGmDLwazkvdciFnROm7OcLfJhzwai0qEhZlStvWXNFejS
	TIZU8nlKdva5XTk7YrRncOkwGxgw1Ah+B+sOe4diHymTB0uCvtqK3SqqHlQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjq5tx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 10:56:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b31ba1392fso20797721cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 03:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756983405; x=1757588205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B6VI6rYD+l1gAQRdPHYZqiU7gvDzWifBcr0RacDOpag=;
        b=FGoLCpczYF5aXE7+YMsskr4f7q4ogaZhBieqSfp9ay8VrMCWCSraLGxAxp8l70w1pL
         Hh3ho7Hq2dCkyS2Ux0hfU2TbExmpnP6E0J1AlVCJaGxQHy9bvrYLslqg9vKMm77//kIe
         iTalfDkMQMybqTEMVRhnviNXF2OfGezQSiDbG5KobtDDG8VLpPnbLVrr6X81Zbtg7rU9
         Xja/DOmvqo2JcOvH/+wPAAcr4KuTvEdjoGa44pdhguezKssvKkdvgi/UZij+3HyO4M94
         NFQcrufnMXMMbs1PB0aVj88miErp3OUQqKRu+9vPr1PpdZEpel/o6lVNXCGzx4prFf8x
         Th+g==
X-Forwarded-Encrypted: i=1; AJvYcCWDr6JnQPDHC8dVmTS0FCqHabLyuNq4a3axbh9+HIkthS6CV7V/sB7+7Irz81cHTpPzNL4BL0Su6zvFufW0@vger.kernel.org
X-Gm-Message-State: AOJu0YzC94x+cI8e1LmGEyCY0lCQriuO7dTUagqaCGSLT8fhh3YwUMX6
	DE0q5j5kBpwvWanqJQEmITy+lYjSEFOZzaVoqigR9hBWvG8Euc4LXO68S5TGhQ4kOAkStypmBym
	ZBhfaJcXO9S27r9bafc4Lr/i7na0CUytKewNJagrxKftVUvMLE1UMN+PNOYABA1jw3i+h
X-Gm-Gg: ASbGncvuQ75TRWGRDmx4GKSKOJQphJ8JS8hzCWzN9TLLYsdaeVY5syrViUAwMixQpb2
	VuaNqB0NlGnTZTEJ1kWw+6zHx3PC2cr9KoJbXQtqPKA7wZbMz7d7jNOoSlzZmWX3P14sXmhznx5
	AJl1nnirtETNUXPP7qu6EE1avEbA6ElxGs+s0GDvIsRq59jZtu2lVhaZLlgf0b1rJKxdRQmVZvM
	6i354NIcZ5goPjA0GXVDv2lbrYzyS3537lBJU03zoycYuW/NQ7MccZBvuQVMiLC21BY5OQxG1+F
	TgxZ0MVWNU/5t633ZsyxqCiZNerpRyrpLboVpGg6fSzuRpP0WhJaDA==
X-Received: by 2002:a05:622a:4ccc:b0:4b3:4b6d:ec52 with SMTP id d75a77b69052e-4b34b6def70mr106821101cf.32.1756983405216;
        Thu, 04 Sep 2025 03:56:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeuvQIN33UNWZHR2JNqlGv2Ymka3KFXoG4mGjXaHF/nLj8DLUeHm4vu+6a1XjysVDhdguSUw==
X-Received: by 2002:a05:622a:4ccc:b0:4b3:4b6d:ec52 with SMTP id d75a77b69052e-4b34b6def70mr106820901cf.32.1756983404715;
        Thu, 04 Sep 2025 03:56:44 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d0a1f807f9sm26462334f8f.38.2025.09.04.03.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 03:56:44 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 1/7] of: base: Add of_property_read_u8_index
Date: Thu,  4 Sep 2025 11:56:10 +0100
Message-ID: <20250904105616.39178-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250904105616.39178-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250904105616.39178-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b9706e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=3hxEEigdzuJGYQGY9uYA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: AeUBO5VRqkxhxum-2l-jgu6g1FSY25W_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX5a4TCCewcG0l
 jdD/Ca/CAuTptP0Io03ZhmIMrArt3KndvVD5ScCPSpqAiFZVt19oLZgaQHpOmrwTdKjo6HqmRYn
 gZGTxjYPkxmeSM+zGM/aln+bkNSoFUyjrnNN/QOMNG4zGP0RisECKMcxd6qoYvvojIOCGrMuKyZ
 vjaBs6Rxvvf6m9/cBpXnbnbkNe89uYuf6qBIMu9s3H7FMrdg3Q48elHlbprYqzj8ZM/nKs85Vtf
 1bRrafaWvoP/O8wSydnGyQ8kJPyp3k6K1QBFW8M3z1J/H/nSzEQuWI1Yr2okGNW7LUpy/KnbIWD
 M8qRQJlFzDmRYhYQKVBmSvT7bYaQSLgD3D3hOPZC8yhhOXUIZ9pjoTTreIZviK5EvetZRAVy2SE
 DDmypGv0
X-Proofpoint-ORIG-GUID: AeUBO5VRqkxhxum-2l-jgu6g1FSY25W_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

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


