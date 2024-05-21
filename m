Return-Path: <linux-arm-msm+bounces-20142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD3F8CB3A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 20:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71E382832FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 18:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021F51494B1;
	Tue, 21 May 2024 18:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NAGyhtbM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD8C148FE6;
	Tue, 21 May 2024 18:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716316847; cv=none; b=ohGiO9E6eBGaDCK9kjNXsKhBkwCUwZ9z5PB8yZMXJ+EXsBoUwyqdNc6rQnK61yILeG9Wlyf6qjacg37clwGqdq7l5LmxZJLbBgzNoZrBPmu9CrCJiDHx8+flViFr4rbcWu8r8bAkYZh8D6vSHid9i8vv1q9hIDVMjMJMfa6PT4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716316847; c=relaxed/simple;
	bh=Wb09PW7Hkr2+aT9E+lZMGTnvJI1UkmQEhRD1iGSKzjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=L6DxOEAs+8z+PlU4nu5XrHKxOcM9eAIKqkE2fHjdMQyccrNCNx4JkkKTyAdnuUM52hDOwp4tLb2tMzYWX+hxQjLTTwy6eZdmKLJ9Aq9XJPxH1pCaR7Ggnq5PavtvBp7NIqaEa/RyfrVIr7Y7nN81DNepCIaWaLRE9yiFsyLPT4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NAGyhtbM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44LAA2GQ017585;
	Tue, 21 May 2024 18:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=wFapvs5sqECt2yxAZvhfcK0g+PRdjhRiLtTWYhQWucQ
	=; b=NAGyhtbMm5LAUGeze8VjPInLHswAvQtfgjjxfinPp7Jabyk95u7T2QAbTVj
	wId82CdOgOstbO2oesqg6JAoQbyhi62Ra6kebTfHLzXSFAomcl2xNDhE96GOQAE5
	2nmamIZnNfKJhydqr/QMn0ERgbKWg8t16sLeY/x/N/zfSZt9wBiDeKSZP0wjjsOC
	EIl0QdsfZhYJ5d0By9bhSJu4njx/uQMePlcmNKMbGVjIW/ZDfUjr4obmlIdAv37s
	dwUUOqlzUhrK2q5LK1basyrsiYkUU4ScSnAKRnLvbAGtgXYy2JsjkEaWK2dSeU22
	RWUPU81K6A+QU5BqNpiBAvpwPQQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pq5esgw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 18:38:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44LIcP5U012112
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 18:38:25 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 21 May 2024 11:38:24 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
Date: Tue, 21 May 2024 11:37:58 -0700
Subject: [PATCH RFC v3 1/9] libfdt: board-id: Implement board-id scoring
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240521-board-ids-v3-1-e6c71d05f4d2@quicinc.com>
References: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
In-Reply-To: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>
CC: Amrit Anand <quic_amrianan@quicinc.com>,
        Peter Griffin
	<peter.griffin@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        "Andy
 Gross" <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Doug
 Anderson" <dianders@chromium.org>,
        Simon Glass <sjg@chromium.org>, "Chen-Yu
 Tsai" <wenst@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        "Humphreys,
 Jonathan" <j-humphreys@ti.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        "Jon
 Hunter" <jonathanh@nvidia.org>,
        Michal Simek <michal.simek@amd.com>,
        <boot-architecture@lists.linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        Elliot Berman <quic_eberman@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 97M0_qhDY4fDkHKWdgZ-TnVPL5Q5oHL6
X-Proofpoint-ORIG-GUID: 97M0_qhDY4fDkHKWdgZ-TnVPL5Q5oHL6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_11,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405210140

The devicetree spec introduced a mechanism to match devicetree blobs to
boards using firmware-provided identifiers. Although the matching can be
implemented by DTB loaders, having a canonical implementation makes it
easier to integrate and ensure consistent behavior across ecosystems.

I've not yet investigated swig/python support for the new functions; I
would work on that before submitting the patch to libfdt.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
 scripts/dtc/libfdt/fdt_ro.c | 76 +++++++++++++++++++++++++++++++++++++++++++++
 scripts/dtc/libfdt/libfdt.h | 54 ++++++++++++++++++++++++++++++++
 2 files changed, 130 insertions(+)

diff --git a/scripts/dtc/libfdt/fdt_ro.c b/scripts/dtc/libfdt/fdt_ro.c
index 9f6c551a22c2..b19b17127399 100644
--- a/scripts/dtc/libfdt/fdt_ro.c
+++ b/scripts/dtc/libfdt/fdt_ro.c
@@ -857,3 +857,79 @@ int fdt_node_offset_by_compatible(const void *fdt, int startoffset,
 
 	return offset; /* error from fdt_next_node() */
 }
+
+int fdt_board_id_prop_matches(const void *fdt,
+			      const struct fdt_property *prop,
+			      fdt_get_board_id_t get_board_id_cb,
+			      void *ctx)
+{
+	int data_len;
+	const void *data;
+	const char *name;
+	int name_len;
+	int string = 0;
+
+	name = fdt_get_string(fdt, fdt32_to_cpu(prop->nameoff), &name_len);
+	if (!name)
+		return -FDT_ERR_BADOFFSET;
+
+	if (name_len > 4 && !strcmp(name + name_len - 4, "_str"))
+		string = 1;
+
+	data = get_board_id_cb(ctx, name, &data_len);
+	if (!data)
+		return -FDT_ERR_NOTFOUND;
+
+	if (string) {
+		return fdt_stringlist_contains(prop->data,
+					       fdt32_to_cpu(prop->len),
+					       data);
+	} else {
+		// exact data comparison. data_len is the size of each entry
+		if (fdt32_to_cpu(prop->len) % data_len || data_len % 4)
+			return -FDT_ERR_BADVALUE;
+
+		for (int i = 0; i < fdt32_to_cpu(prop->len); i += data_len) {
+			if (!memcmp(&prop->data[i], data, data_len))
+				return 1;
+		}
+
+		return 0;
+	}
+
+	return 0;
+}
+
+int fdt_board_id_score(const void *fdt, fdt_get_board_id_t get_board_id_cb,
+		       void *ctx)
+{
+	const struct fdt_property *prop;
+	int node, property, ret, score = 0;
+	const char *name;
+
+	node = fdt_path_offset(fdt, "/board-id");
+	if (node < 0)
+		return node;
+
+	fdt_for_each_property_offset(property, fdt, node) {
+		prop = fdt_get_property_by_offset(fdt, property, NULL);
+		if (!prop)
+			return -FDT_ERR_BADOFFSET;
+
+		name = fdt_get_string(fdt, fdt32_to_cpu(prop->nameoff), NULL);
+		if (!name)
+			return -FDT_ERR_BADOFFSET;
+
+		if (!strcmp(name, "phandle") || !strcmp(name, "linux,phandle"))
+			continue;
+
+		ret = fdt_board_id_prop_matches(fdt, prop, get_board_id_cb,
+						ctx);
+		if (ret == 1)
+			score++;
+		else
+			return ret;
+	}
+
+	return score;
+}
diff --git a/scripts/dtc/libfdt/libfdt.h b/scripts/dtc/libfdt/libfdt.h
index 77ccff19911e..de1cbc339315 100644
--- a/scripts/dtc/libfdt/libfdt.h
+++ b/scripts/dtc/libfdt/libfdt.h
@@ -1230,6 +1230,60 @@ int fdt_address_cells(const void *fdt, int nodeoffset);
  */
 int fdt_size_cells(const void *fdt, int nodeoffset);
 
+/**********************************************************************/
+/* Read-only functions (board-id related)                             */
+/**********************************************************************/
+
+/**
+ * fdt_get_board_id_t - callback to retrieve the board id for the platform
+ * @ctx: Context data passed from fdt_board_id_prop_matches()
+ * @name: board id name
+ * @data: Callback sets pointer to the board id data
+ * @datalen: Callback sets length of the board id data
+ *
+ * returns:
+ *	Pointer to the board id data, NULL if the data doesn't exist
+ */
+typedef const void *(*fdt_get_board_id_t)(void *ctx, const char *name,
+					   int *datalen);
+
+/**
+ * fdt_board_id_prop_matches - check if the property matches the platform's board id
+ * @fdt: pointer to the device tree blob
+ * @prop_offset: Offset of the property to match
+ * @get_board_id_cb: Function pointer to retrieve the platform's board id
+ *
+ * returns:
+ *	1: the property matches
+ *	0: the property doesn't match
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_BADSTRUCTURE,
+ *	-FDT_ERR_TRUNCATED, standard meanings
+ */
+int fdt_board_id_prop_matches(const void *fdt,
+			      const struct fdt_property *prop,
+			      fdt_get_board_id_t get_board_id_cb,
+			      void *ctx);
+
+/**
+ * fdt_board_id_score - calculate score of the fdt's board_id
+ * @fdt: pointer to the device tree blob
+ * @get_board_id_cb: Function pointer to retrieve the platform's board id
+ *
+ * returns:
+ *	>0 for the number of board-id properties that were matched
+ *	0 if there was a mismatch in any of the board-id properties
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_BADSTRUCTURE,
+ *	-FDT_ERR_TRUNCATED, standard meanings
+ */
+int fdt_board_id_score(const void *fdt, fdt_get_board_id_t get_board_id_cb,
+		       void *ctx);
+
 
 /**********************************************************************/
 /* Write-in-place functions                                           */

-- 
2.34.1


