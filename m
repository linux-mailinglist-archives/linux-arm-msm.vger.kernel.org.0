Return-Path: <linux-arm-msm+bounces-71658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C31A1B40A3D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 18:12:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 785663A51F6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 16:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1077630AADA;
	Tue,  2 Sep 2025 16:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ElV5BDSN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A25334380
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 16:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756829556; cv=none; b=rTJtNa838iUjY5EoS6FdVJfag1ZBPMeATpVDju1yDgoRQcLwVyR5Pa2ReNAllfcLicovb0vI/drNy6ovQke0hlJShqokxyhV5DjiINrhjgNh4cJQGHRurJkYCpIdSigGucR87GznkzPdivDeT1Ev7A+EJzr661LRm1PJjXU0g5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756829556; c=relaxed/simple;
	bh=nVcE8cWRXOB48T5NMOjigsTbnDdQssjbYl79J7cZkxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ff+8J1bK/xCCib6haHG/hn/exoh6e8jGSNBz50zEHoXJZBl3C+GgSCy92Rtrzg/gFarq9iS4IZxPEtkwXWYgluBo4VyS/CR5L14vc+sZmDGGLCD2bupaOo8sYNAWNHz+s62MDYHfi4iaCEatyj+VMH7nzYvt/0oitiKAc4BWlN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ElV5BDSN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqCI8019572
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 16:12:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=h2Gn3rEd3us
	JLYmFOFpxHWy5o4BbWHYKvNrDEsewIrE=; b=ElV5BDSNr0UmK/0N7CtPtFCI0FF
	T+KUD+RNwy568tpiTe3+eByVd9vmKPQncBxdGB1oE6iHtKfQApajizP53cIz97of
	frdjpq7pTYf9rolcQYGlexXtiSCvA9VS4uiBX+uWcBPMQeXJxJBU4Uv9x8tMLsra
	6O5bHEwkjn7Dhi81VS42pldwbjJ5ZHpdmuOt4jGRbM3m0nchMyCraIZGt/wA1BVX
	6z0mUDGnBS13MVmTPol7OFCz6UcrMbfP7eHePbBZBGy73MYLPEx11U2WUF2qRLbK
	KDQjA/lW4QguNEE99orAZXi81eSKWic8PnXGO7dzmmRSgENHJz26skA3hrg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw00fus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 16:12:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b302991b39so93633861cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 09:12:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756829552; x=1757434352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2Gn3rEd3usJLYmFOFpxHWy5o4BbWHYKvNrDEsewIrE=;
        b=C6jSgwUrTTDiVwldclUHd/FE5QnBq9vpEVKhOyPkDqiJhM3OKeGNgfFJq3HSerP4mU
         b93WK65c5JArg8DaItHhm1WuZZZnYC1ZCyeCG6CW1hNQMrd+bIDQTsZsSip9TKCRMqcc
         VU3hrP5Y1JPjU3nhChQh0wJ7gwCx3P8IDX8pXHWqjvneYBHEKa436q9PXDZ1HmDzdmJ1
         rxwlKh78tiHbju/AIuwWSETmeq4hZPyVhE9stLkNAGLh+v9g980oiMCUyw8UDG8ZJaTh
         U3XkOyY1HZlfp2TDdWD/1Rlnio0KyiBLbgwX4O9JCQFqD4p+LszJ2bX45Pb/A4eyODHn
         NNcw==
X-Forwarded-Encrypted: i=1; AJvYcCXwjyU3OJDTn/MRCKLGrd+K3igSb7UXmVjbcJLkT8mgE6PD4+19VJTuXQoUeE0Rz6h3NFH4B8/k413mOCwc@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi4LSSeX4DkDHXX1g2jwcESnk8VWX1uxfIf2Ho0EtpBB03oHq8
	iFVBNXHLHrOEqVyQZCmTq5PonlBVMCM5Yw6z+nKCzTIYVlNUdEzX6m0YXJuBey6BhiDkN0M+qJz
	gSVc9JIUX8xHBXrstCDFXvvPwTHZc2DXgaMv1ObIaH/2c2DPm8qm+ZA13/yIYA+zy6yvA
X-Gm-Gg: ASbGncuLykcN96+EJjL9Wy5pwcdWMXWUusee9RN5IEwc2yA+SKWuTHbEwOJOuVsJ3yR
	mcdR/U/RZqVvwn9ongXAeRWRRKmE6Uu6KZPygTENaGDLY0jUtPMkBKThpFbr46TRXkWYR0uxPJw
	XCNX+2kv5adHKUELxYDTOLuLWUzqc0oldGtnkTvjVd394RmArTJocHX7fJnP5IHYUqSCNPzaN1b
	Q771/ZSleKl+f/q6SWmP62lg+kKv4auw/tMhSpmK8XCMld1Uze62MTY6XveLIHgdl9eXr+TZqWW
	/tF2dsh4BUnMnFtQ+cV7XREHCv6nCoyqQiV87K5DNBTeIttTho9t1A==
X-Received: by 2002:a05:622a:5b09:b0:4b3:81b:c5ab with SMTP id d75a77b69052e-4b31dcd8859mr133724551cf.54.1756829552193;
        Tue, 02 Sep 2025 09:12:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGq2usZdYeCp2ppJqxGqoRr4BkZnJXxtOGXHJVqsgRbfjafw4ZUoIUXNQykrB6encxNvBvqg==
X-Received: by 2002:a05:622a:5b09:b0:4b3:81b:c5ab with SMTP id d75a77b69052e-4b31dcd8859mr133723911cf.54.1756829551677;
        Tue, 02 Sep 2025 09:12:31 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0d32a2sm309894655e9.9.2025.09.02.09.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 09:12:30 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 1/7] of: base: Add of_property_read_u8_index
Date: Tue,  2 Sep 2025 17:11:50 +0100
Message-ID: <20250902161156.145521-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902161156.145521-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250902161156.145521-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FJACgfT1F7qgEu2S8JxGmKCU-oLxR4oC
X-Proofpoint-ORIG-GUID: FJACgfT1F7qgEu2S8JxGmKCU-oLxR4oC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX43cR4096OMnp
 1SwitRCXknIBTz8OygML+n0VMxAh//xajy6Ds5TeFH/Fn69bRWdD8OGgSpP9i/OXoV3TCNpdseQ
 FH4gw6PvxHSAKT+vQ+0eZlHF5qmWMz3JNIiPLWXTre+HYY0nDQ8UL2XW2yScYk4gu/bDPy72c/A
 M98vGjnh+oFMVCDjeWx7mnTm8qTFKkGHGQTYciG+txkMzQsj7DcY3HhNf6kwyRDqUff8DuRbaIr
 flE8S7ft73BF7di6+1Lq8F6CDuu2F/03WvKFd75GZjwacyYQ9U7cHJqZQ6u9Doc5qZdR2vMT7LV
 cOKmSSCn3fVqZ13tUMF8VlGQ3r630FdAlPnMMnVQ+xhkl4ex7zC1hjHlNGFj0sjCC+Aybatj6Z0
 XOwGbGRj
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b71771 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=3hxEEigdzuJGYQGY9uYA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

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


