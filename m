Return-Path: <linux-arm-msm+bounces-106747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLGaOBNX/mmupQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 23:35:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 413334FBF7A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 23:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C6773012C5A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 21:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DAF033F37A;
	Fri,  8 May 2026 21:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ABfS+dTR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="StufrNQk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71ECE33B6C4
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 21:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778275992; cv=none; b=sD3PU8sSnV89wvijR+jAD5Kh8BaFZHMAGqy4U1R9QXF+RUka3Ujp7vS7PrxKqBybyASOcpyOFVWYuuDdePSZdWw/sUa5Mw2MuEcKaLvvJydTEOZh80lgM9WlBLv7P/Ex7oCOYu2cetdiWe7sZykqlUDnMhOZHnZbLG33sziSjxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778275992; c=relaxed/simple;
	bh=OBRY72tZUlYCYi0CwpxeNjQmGsJtEKzJ3djmtjhsef0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O5LPnFzuXEBaqhOftgGG3S2p3kcYH1flMjxg6aknPHFtwFJyCASIt6wzuD0gfU5j7a8r9M79zhcyux6FJ5XZl5A2aL8YWfQHjQ0WWKMJYvi86main5IqCkkpj0EAKQv50Pxdh5wtY/LJXcgy2reY19IuObdMscKysOegfBP9Llg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ABfS+dTR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=StufrNQk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648G3186724739
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 21:33:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=y+vVEote4hz
	4Wyb0CIVfLSxBIbvO9gD/BB8LI6nAOyY=; b=ABfS+dTRO/eU1Qnhvkwbb/MZvhs
	jBxFK8WqGPpdbXU9rspVkUCcRhsLtaAIguQxl/4/hRBRVX+uz6B3hrEqq69g7Ucz
	vfFJWIHAt1SNpvPMJVT2VX9W+I3ZjsVsfzGGZw3Gp/pvwJo356DJTqjQB9aCCCpR
	b/HoAx3hGNXM/mDxIFb76dZRQzEVWQqNNGpTv9tRDvL5NZnis6RvIoo/V+zxYZF0
	o48cHr/9LonbWFFLjG3fv3txt2lQT3wC0f8XcznFJiX5DEASgh9ObCiBj2Cvxdv2
	er2cbCT7/t0jFWiRA2sL7LFMTTC/S8PjULsWmJ99Hy5gxclUXPhB5sJc6nw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1k0uh25p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 21:33:08 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ee5b73c5f2so11136552eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 14:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778275987; x=1778880787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y+vVEote4hz4Wyb0CIVfLSxBIbvO9gD/BB8LI6nAOyY=;
        b=StufrNQk2O78yTWQyehxzGdyvV0Ll7fYkeH93XroP2a5o+rwEKLhPYP6uLSOXByf6T
         uaXO+TfD5tz2YplflErlUxbDmVO4qe0J+0d7gNsyQwMJo1gQ6Bh/hV8GHTiFU2KlHn8Q
         29uYj0L20eAB9rcn3smvDl/ehzjnIyr9KXwy65BqSqYmfzuKMuM7bJ/Xc4kyDlA35s/m
         baOWEND6jBwSu8BsFCbCTA/EePsIwhxHkKRIcGCdRR1SHEb46awC3plVok6i4aBjrNEa
         hIECCY5yzPU1WfxtroDjX+3Rawvfiy71VexUkIvaFa5t/cqJcHqUWa+8pwNw63JOPrrt
         MtAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778275987; x=1778880787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y+vVEote4hz4Wyb0CIVfLSxBIbvO9gD/BB8LI6nAOyY=;
        b=Oil3XfzlrYb6ulfU+QA5LE2JwqHJts2VLyHzMpuLSDuqSuMdytkx2dbOLpYvvidF37
         0KRBRO0hMa0ThR48i54OSRhITRtY44hb2+yyRaIiEaDYbmIYNHrI+w9g3WU2XWDku+R3
         vVdT02J3DlvCqMa+lgz+i3e6f8J5pJVA78ou6kH7x6eLg+6jJl70bCV/ea4LdX6VHyJp
         v33N/eJ4aI7SAtdT/qk+1TfKW4e2bEzhBfAh+bo8tpAJScRlh8tcaUthCU2KQXekmX/E
         PjxT/X6xA/UbiccLzaW4M54onF4DdpSA4oFBd7xS0A9RR3ks+nAoBxHcqZF3sH8enhHV
         yNsA==
X-Forwarded-Encrypted: i=1; AFNElJ+Kzfm+H/Pki2aBdvb94tGTy4lfoyJu8b8qlXTmhN3OLccWCkQzAwAsncHYIs4TWBN8ENPKsHWAX92YQ380@vger.kernel.org
X-Gm-Message-State: AOJu0YyxFGeh0WWVJJM7rXKq2qulnKYxe/kdnoT2xr2UiczC+TiK0ldj
	KgrEMFTuiSTeoGyvThfmbpRfVHEiGSTYPvw3+2C1oknuyKO4rZoZYDdzc+9uw3B8yQu3rXea1Tw
	fqrH3EBiwphclBwr7XVUb0c5tkoFCECZr3SKg0KXCMIMqYt6TDv9nGkKz9Ul7vSHz6Np6
X-Gm-Gg: Acq92OF2639g+9DyoK/ro52plBCswfdJ85wiVRQOF9dvww5WdcA4fM6UHMRL9RGCQ59
	cL9AYVnU4TxZOW8IjPGiVATd9e2gFPI+ZJrcOoscz+QcAYhoMX2ZxB51boz/C76/32CHw4hdPrv
	LrkUnwTOYx2HxQDozCyywZPNkyTFZGqxfWCYqyuUr71N5NvWJSHYaHw2IH11v8E1Kpog180si5h
	2H+vWCq8bOr7s4psxJIZbXQ/JVbKdlMTnH08NabCZ59nlpdXzZ2wyunrU9rglAsFGE/hCchTS4k
	kLWcSTl6DRIEh+5jFd2rCexM1qDlPCzrikv3jOYqQPQ3LDo8ISqt5CTSJnjM76Om6SoyXpMifWi
	vXov+mFWTEjNEU/U+wKjiY2t0XE8omXkWVGE1jWjY5Js436maBKvgfsvF68fWV/+SE9RyGs4CAy
	8=
X-Received: by 2002:a05:7300:6d03:b0:2de:cc07:e99 with SMTP id 5a478bee46e88-2f548a995a4mr6870594eec.7.1778275987075;
        Fri, 08 May 2026 14:33:07 -0700 (PDT)
X-Received: by 2002:a05:7300:6d03:b0:2de:cc07:e99 with SMTP id 5a478bee46e88-2f548a995a4mr6870566eec.7.1778275986416;
        Fri, 08 May 2026 14:33:06 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e3e285sm4871285eec.27.2026.05.08.14.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 14:33:06 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com
Cc: wesley.cheng@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
        ronak.raheja@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] phy: qualcomm: qmp-combo: Add support for Hawi SoC
Date: Fri,  8 May 2026 14:32:34 -0700
Message-Id: <20260508213234.4643-5-ronak.raheja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260508213234.4643-1-ronak.raheja@oss.qualcomm.com>
References: <20260508213234.4643-1-ronak.raheja@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dIqWXuZb c=1 sm=1 tr=0 ts=69fe5694 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=94TNKR-hkEinp_EYofMA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: LPTJjXi6UQodKsgVZOabz57sGjaqDnZn
X-Proofpoint-GUID: LPTJjXi6UQodKsgVZOabz57sGjaqDnZn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIxMyBTYWx0ZWRfX7gta/OFQfBbf
 Guf0l43pKCxsDK+fIUAacF1hiVZboECq7jaVgBbzC1xWEY1CTRfNN4znxP+PI2z+Cx/LxYXPR1o
 teRNWHpOmsK8l7qsYz2B+O1Oz+3iJP27YIdjf8dkMvUHLVK5qmQbPHiAfdSODm2wsboB5VwgEd9
 qSnVpgsarsQIyPhN215AxwmTI7dJRfTZHA6OsprEf/FBkwLD9x1Gbw1UDNHf1DwahWskOVyQckP
 0Dou3M3CQLqQbzLmaqyPoO0850gOoPA5Mr+9tZwSKr4btkLKvd1tblC6HlR6rCOdNZd0NqEQ1P8
 GDH6o0uzsqDQJFYWW6qhFErzF2AfaK6OD6U6n/E7xGYtxJTHB/5Ms4fGbq5OUnh1nO1nuX5QTLK
 klA+gBZZnFUDJYCWXDbUT+Xkiz3MQ28EpiUfydA9dEgToNPnyYznI/qhxorpEZAs0YcJ4MzSfIg
 gyUL0a9GQDAM2mBjXSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080213
X-Rspamd-Queue-Id: 413334FBF7A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[ronak.raheja@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106747-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for the USB3-DP combo PHY found on Hawi platform.

The QMP PHY for Hawi uses QSERDES V10 register layouts. Add the required
PHY sequences from the hardware programming guide and new V10 register
header files. Also add a new v10 offset structure to incorporate the new
COM AON register module.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../phy/qualcomm/phy-qcom-qmp-com-aon-v10.h   |  15 ++
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 231 +++++++++++++++++-
 .../phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h    |  15 ++
 .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h   |  13 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h   |  19 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h   |  34 +++
 .../qualcomm/phy-qcom-qmp-qserdes-com-v10.h   |  89 +++++++
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h  |  89 +++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   5 +
 9 files changed, 506 insertions(+), 4 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-com-aon-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-com-aon-v10.h b/drivers/phy/qualcomm/phy-qcom-qmp-com-aon-v10.h
new file mode 100644
index 000000000000..6542b586be89
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-com-aon-v10.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_COM_AON_V10_H_
+#define QCOM_PHY_QMP_COM_AON_V10_H_
+
+/* Only for QMP V10 PHY - COM AON registers */
+
+#define QPHY_V10_COM_AON_USB3_AON_TOGGLE_ENABLE         0x00
+#define QPHY_V10_COM_AON_DP_AON_TOGGLE_ENABLE           0x04
+#define QPHY_V10_COM_AON_DUMMY_STATUS                   0x08
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 93f1aa10d400..53b709ea93d5 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -32,6 +32,7 @@
 #include "phy-qcom-qmp.h"
 #include "phy-qcom-qmp-pcs-aon-v6.h"
 #include "phy-qcom-qmp-pcs-aon-v8.h"
+#include "phy-qcom-qmp-pcs-aon-v10.h"
 #include "phy-qcom-qmp-pcs-misc-v3.h"
 #include "phy-qcom-qmp-pcs-misc-v4.h"
 #include "phy-qcom-qmp-pcs-misc-v5.h"
@@ -40,6 +41,7 @@
 #include "phy-qcom-qmp-pcs-usb-v5.h"
 #include "phy-qcom-qmp-pcs-usb-v6.h"
 #include "phy-qcom-qmp-pcs-usb-v8.h"
+#include "phy-qcom-qmp-pcs-usb-v10.h"
 
 #include "phy-qcom-qmp-dp-com-v3.h"
 
@@ -49,9 +51,12 @@
 #include "phy-qcom-qmp-dp-phy-v5.h"
 #include "phy-qcom-qmp-dp-phy-v6.h"
 #include "phy-qcom-qmp-dp-phy-v8.h"
+#include "phy-qcom-qmp-dp-phy-v10.h"
 
 #include "phy-qcom-qmp-usb43-pcs-v8.h"
 
+#include "phy-qcom-qmp-com-aon-v10.h"
+
 /* QPHY_V3_DP_COM_RESET_OVRD_CTRL register bits */
 /* DP PHY soft reset */
 #define SW_DPPHY_RESET				BIT(0)
@@ -268,6 +273,36 @@ static const unsigned int qmp_v8_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_TX_TRANSCEIVER_BIAS_EN]	= QSERDES_V8_TX_TRANSCEIVER_BIAS_EN,
 };
 
+static const unsigned int qmp_v10_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_SW_RESET]			= QPHY_V10_PCS_SW_RESET,
+	[QPHY_START_CTRL]		= QPHY_V10_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]		= QPHY_V10_PCS_PCS_STATUS1,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V10_PCS_POWER_DOWN_CONTROL,
+
+	/* In PCS_USB */
+	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V10_PCS_USB3_AUTONOMOUS_MODE_CTRL,
+	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V10_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
+
+	[QPHY_PCS_CLAMP_ENABLE]		= QPHY_V10_PCS_AON_CLAMP_ENABLE,
+
+	[QPHY_AON_TOGGLE_ENABLE]	= QPHY_V10_COM_AON_USB3_AON_TOGGLE_ENABLE,
+	[QPHY_DP_AON_TOGGLE_ENABLE]	= QPHY_V10_COM_AON_DP_AON_TOGGLE_ENABLE,
+
+	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V10_COM_RESETSM_CNTRL,
+	[QPHY_COM_C_READY_STATUS]	= QSERDES_V10_COM_C_READY_STATUS,
+	[QPHY_COM_CMN_STATUS]		= QSERDES_V10_COM_CMN_STATUS,
+	[QPHY_COM_BIAS_EN_CLKBUFLR_EN]	= QSERDES_V10_COM_BIAS_EN_CLKBUFLR_EN,
+
+	[QPHY_DP_PHY_STATUS]		= QSERDES_V10_DP_PHY_STATUS,
+	[QPHY_DP_PHY_VCO_DIV]		= QSERDES_V10_DP_PHY_VCO_DIV,
+
+	[QPHY_TX_TX_POL_INV]		= QSERDES_V10_TX_TX_POL_INV,
+	[QPHY_TX_TX_DRV_LVL]		= QSERDES_V10_TX_TX_DRV_LVL,
+	[QPHY_TX_TX_EMP_POST1_LVL]	= QSERDES_V10_TX_TX_EMP_POST1_LVL,
+	[QPHY_TX_HIGHZ_DRVR_EN]		= QSERDES_V10_TX_HIGHZ_DRVR_EN,
+	[QPHY_TX_TRANSCEIVER_BIAS_EN]	= QSERDES_V10_TX_TRANSCEIVER_BIAS_EN,
+};
+
 static const unsigned int qmp_v8_n3_usb43dpphy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_SW_RESET]			= QPHY_V8_USB43_PCS_SW_RESET,
 	[QPHY_START_CTRL]			= QPHY_V8_USB43_PCS_START_CONTROL,
@@ -2058,6 +2093,141 @@ static const struct qmp_phy_init_tbl x1e80100_usb43dp_pcs_usb_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
 };
 
+static const struct qmp_phy_init_tbl hawi_usb3_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SSC_STEP_SIZE1_MODE1, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SSC_STEP_SIZE2_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_CP_CTRL_MODE1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_PLL_CCTRL_MODE1, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_CORECLK_DIV_MODE1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_LOCK_CMP1_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_LOCK_CMP2_MODE1, 0x41),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DEC_START_MODE1, 0x41),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DEC_START_MSB_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DIV_FRAC_START1_MODE1, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DIV_FRAC_START2_MODE1, 0x75),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DIV_FRAC_START3_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_HSCLK_SEL_1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_VCO_TUNE1_MODE1, 0x25),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_VCO_TUNE2_MODE1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0x5c),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x5c),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SSC_STEP_SIZE1_MODE0, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SSC_STEP_SIZE2_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_CP_CTRL_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_PLL_CORE_CLK_DIV_MODE0, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_LOCK_CMP1_MODE0, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_LOCK_CMP2_MODE0, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DEC_START_MODE0, 0x41),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DEC_START_MSB_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DIV_FRAC_START1_MODE0, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DIV_FRAC_START2_MODE0, 0x75),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DIV_FRAC_START3_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_VCO_TUNE1_MODE0, 0x25),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_VCO_TUNE2_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_BG_TIMER, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SSC_PER1, 0x62),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SSC_PER2, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SYSCLK_BUF_ENABLE, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SYSCLK_EN_SEL, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_LOCK_CMP_CFG, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_VCO_TUNE_MAP, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_CORE_CLK_EN, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_CMN_CONFIG_1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_AUTO_GAIN_ADJ_CTRL_1, 0xb6),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_AUTO_GAIN_ADJ_CTRL_2, 0x4a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_AUTO_GAIN_ADJ_CTRL_3, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_ADDITIONAL_MISC, 0x0c),
+};
+
+static const struct qmp_phy_init_tbl hawi_usb3_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_RES_CODE_LANE_TX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_RES_CODE_LANE_RX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_RES_CODE_LANE_OFFSET_TX, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_RES_CODE_LANE_OFFSET_RX, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_LANE_MODE_1, 0xe5),
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_LANE_MODE_2, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_LANE_MODE_3, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_LANE_MODE_4, 0x31),
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_LANE_MODE_5, 0x5d),
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_RCV_DETECT_LVL_2, 0x12),
+	QMP_PHY_INIT_CFG_LANE(QSERDES_V10_TX_PI_QEC_CTRL, 0x21, 1),
+	QMP_PHY_INIT_CFG_LANE(QSERDES_V10_TX_PI_QEC_CTRL, 0x05, 2),
+};
+
+static const struct qmp_phy_init_tbl hawi_usb3_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_UCDR_FO_GAIN, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_UCDR_SO_GAIN, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_UCDR_FASTLOCK_FO_GAIN, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_UCDR_FASTLOCK_COUNT_LOW, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_UCDR_PI_CONTROLS, 0x99),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_UCDR_SB2_THRESH1, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_UCDR_SB2_THRESH2, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_UCDR_SB2_GAIN1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_UCDR_SB2_GAIN2, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_AUX_DATA_TCOARSE_TFINE, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_VGA_CAL_CNTRL1, 0x54),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_VGA_CAL_CNTRL2, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_GM_CAL, 0x13),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_IDAC_TSETTLE_LOW, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x27),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_SIGDET_ENABLES, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_SIGDET_CNTRL, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_00_LOW, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_00_HIGH, 0xbf),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_00_HIGH2, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_00_HIGH3, 0xdf),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_00_HIGH4, 0xed),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_01_LOW, 0x19),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_01_HIGH, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_01_HIGH2, 0x91),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_01_HIGH3, 0xb7),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_01_HIGH4, 0xaa),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_DFE_EN_TIMER, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_DCC_CTRL1, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_VTH_CODE, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_SIGDET_CAL_CTRL1, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_SIGDET_CAL_TRIM, 0x08),
+};
+
+static const struct qmp_phy_init_tbl hawi_usb3_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_LOCK_DETECT_CONFIG1, 0xc4),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_LOCK_DETECT_CONFIG2, 0x89),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_LOCK_DETECT_CONFIG3, 0x20),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_LOCK_DETECT_CONFIG6, 0x13),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_REFGEN_REQ_CONFIG1, 0x21),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_RX_SIGDET_LVL, 0x55),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_RX_CONFIG, 0x0a),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_ALIGN_DETECT_CONFIG1, 0x88),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_ALIGN_DETECT_CONFIG2, 0x13),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_PCS_TX_RX_CONFIG, 0x04),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_PCS_TX_RX_CONFIG2, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_EQ_CONFIG1, 0x4b),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_EQ_CONFIG5, 0x10),
+};
+
+static const struct qmp_phy_init_tbl hawi_usb3_pcs_usb_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_USB3_RCVR_DTCT_DLY_U3_L, 0x40),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_USB3_RCVR_DTCT_DLY_U3_H, 0x00),
+};
+
 /* list of regulators */
 static struct regulator_bulk_data qmp_phy_vreg_l[] = {
 	{ .supply = "vdda-phy", .init_load_uA = 21800, },
@@ -2198,6 +2368,7 @@ struct qmp_combo_offsets {
 	u16 dp_txa;
 	u16 dp_txb;
 	u16 dp_dp_phy;
+	u16 aon_toggle;
 };
 
 struct qmp_phy_cfg {
@@ -2270,6 +2441,7 @@ struct qmp_combo {
 	const struct qmp_phy_cfg *cfg;
 
 	void __iomem *com;
+	void __iomem *aon_toggle;
 
 	void __iomem *serdes;
 	void __iomem *tx;
@@ -2416,6 +2588,24 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v8 = {
 	.dp_dp_phy	= 0x3c00,
 };
 
+static const struct qmp_combo_offsets qmp_combo_offsets_v10 = {
+	.com		= 0x0000,
+	.aon_toggle	= 0x0400,
+	.txa		= 0x1400,
+	.rxa		= 0x1600,
+	.txb		= 0x1800,
+	.rxb		= 0x1a00,
+	.usb3_serdes	= 0x1000,
+	.usb3_pcs_misc	= 0x1c00,
+	.usb3_pcs	= 0x1e00,
+	.usb3_pcs_aon	= 0x2000,
+	.usb3_pcs_usb	= 0x2100,
+	.dp_serdes	= 0x3000,
+	.dp_txa		= 0x3400,
+	.dp_txb		= 0x3800,
+	.dp_dp_phy	= 0x3c00,
+};
+
 static const struct qmp_combo_offsets qmp_combo_usb43dp_offsets_v8 = {
 	.com		= 0x0000,
 	.usb3_pcs_aon	= 0x0100,
@@ -2705,6 +2895,27 @@ static const struct qmp_phy_cfg x1e80100_usb3dpphy_cfg = {
 	.regs			= qmp_v6_n4_usb3phy_regs_layout,
 };
 
+static const struct qmp_phy_cfg hawi_usb3dpphy_cfg = {
+	.offsets		= &qmp_combo_offsets_v10,
+
+	.serdes_tbl		= hawi_usb3_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(hawi_usb3_serdes_tbl),
+	.tx_tbl			= hawi_usb3_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(hawi_usb3_tx_tbl),
+	.rx_tbl			= hawi_usb3_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(hawi_usb3_rx_tbl),
+	.pcs_tbl		= hawi_usb3_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(hawi_usb3_pcs_tbl),
+	.pcs_usb_tbl		= hawi_usb3_pcs_usb_tbl,
+	.pcs_usb_tbl_num	= ARRAY_SIZE(hawi_usb3_pcs_usb_tbl),
+
+	.regs			= qmp_v10_usb3phy_regs_layout,
+	.reset_list		= msm8996_usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+};
+
 static const struct qmp_phy_cfg sm6350_usb3dpphy_cfg = {
 	.offsets		= &qmp_combo_offsets_v3,
 
@@ -3662,13 +3873,18 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	void __iomem *com = qmp->com;
-	void __iomem *pcs_aon = qmp->pcs_aon;
+	void __iomem *aon_toggle;
 	int ret;
 	u32 val;
 
 	if (!force && qmp->init_count++)
 		return 0;
 
+	if (qmp->aon_toggle)
+		aon_toggle = qmp->aon_toggle;
+	else
+		aon_toggle = qmp->pcs_aon;
+
 	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
 	if (ret) {
 		dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
@@ -3699,9 +3915,9 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 			SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
 
 	/* override hardware control for reset of qmp phy */
-	if (pcs_aon && cfg->regs[QPHY_AON_TOGGLE_ENABLE]) {
-		qphy_clrbits(pcs_aon, cfg->regs[QPHY_AON_TOGGLE_ENABLE], 0x1);
-		qphy_clrbits(pcs_aon, cfg->regs[QPHY_DP_AON_TOGGLE_ENABLE], 0x1);
+	if (aon_toggle && cfg->regs[QPHY_AON_TOGGLE_ENABLE]) {
+		qphy_clrbits(aon_toggle, cfg->regs[QPHY_AON_TOGGLE_ENABLE], 0x1);
+		qphy_clrbits(aon_toggle, cfg->regs[QPHY_DP_AON_TOGGLE_ENABLE], 0x1);
 	}
 
 	/* Use software based port select and switch on typec orientation */
@@ -4733,6 +4949,9 @@ static int qmp_combo_parse_dt(struct qmp_combo *qmp)
 	}
 	qmp->dp_dp_phy = base + offs->dp_dp_phy;
 
+	if (offs->aon_toggle)
+		qmp->aon_toggle = base + offs->aon_toggle;
+
 	ret = qmp_combo_clk_init(qmp);
 	if (ret)
 		return ret;
@@ -4986,6 +5205,10 @@ static const struct of_device_id qmp_combo_of_match_table[] = {
 		.compatible = "qcom,glymur-qmp-usb3-dp-phy",
 		.data = &glymur_usb3dpphy_cfg,
 	},
+	{
+		.compatible = "qcom,hawi-qmp-usb3-dp-phy",
+		.data = &hawi_usb3dpphy_cfg,
+	},
 	{
 		.compatible = "qcom,sar2130p-qmp-usb3-dp-phy",
 		.data = &sar2130p_usb3dpphy_cfg,
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h
new file mode 100644
index 000000000000..6f3ea7d13556
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_DP_PHY_V10_H_
+#define QCOM_PHY_QMP_DP_PHY_V10_H_
+
+/* Only for QMP V10 PHY - DP PHY registers */
+
+#define QSERDES_V10_DP_PHY_VCO_DIV			0x070
+#define QSERDES_V10_DP_PHY_AUX_INTERRUPT_STATUS		0x0e0
+#define QSERDES_V10_DP_PHY_STATUS			0x0e4
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h
new file mode 100644
index 000000000000..b858381bc238
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_AON_V10_H_
+#define QCOM_PHY_QMP_PCS_AON_V10_H_
+
+/* Only for QMP V10 PHY - PCS AON registers */
+
+#define QPHY_V10_PCS_AON_CLAMP_ENABLE			0x00
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h
new file mode 100644
index 000000000000..0cc25e6acf58
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_USB_V10_H_
+#define QCOM_PHY_QMP_PCS_USB_V10_H_
+
+/* Only for QMP V10 PHY - USB PCS registers */
+
+#define QPHY_V10_PCS_USB3_POWER_STATE_CONFIG1		0x00
+#define QPHY_V10_PCS_USB3_AUTONOMOUS_MODE_CTRL		0x08
+#define QPHY_V10_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR		0x14
+#define QPHY_V10_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL	0x18
+#define QPHY_V10_PCS_USB3_RXEQTRAINING_DFE_TIME_S2	0x3c
+#define QPHY_V10_PCS_USB3_RCVR_DTCT_DLY_U3_L		0x40
+#define QPHY_V10_PCS_USB3_RCVR_DTCT_DLY_U3_H		0x44
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h
new file mode 100644
index 000000000000..ac0fc434984b
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_V10_H_
+#define QCOM_PHY_QMP_PCS_V10_H_
+
+/* Only for QMP V10 PHY - PCS registers */
+
+#define QPHY_V10_PCS_SW_RESET				0x000
+#define QPHY_V10_PCS_PCS_STATUS1			0x014
+#define QPHY_V10_PCS_POWER_DOWN_CONTROL			0x040
+#define QPHY_V10_PCS_START_CONTROL			0x044
+#define QPHY_V10_PCS_POWER_STATE_CONFIG1		0x090
+#define QPHY_V10_PCS_LOCK_DETECT_CONFIG1		0x0c4
+#define QPHY_V10_PCS_LOCK_DETECT_CONFIG2		0x0c8
+#define QPHY_V10_PCS_LOCK_DETECT_CONFIG3		0x0cc
+#define QPHY_V10_PCS_LOCK_DETECT_CONFIG6		0x0d8
+#define QPHY_V10_PCS_REFGEN_REQ_CONFIG1			0x0dc
+#define QPHY_V10_PCS_RX_SIGDET_LVL			0x188
+#define QPHY_V10_PCS_RCVR_DTCT_DLY_P1U2_L		0x190
+#define QPHY_V10_PCS_RCVR_DTCT_DLY_P1U2_H		0x194
+#define QPHY_V10_PCS_RATE_SLEW_CNTRL1			0x198
+#define QPHY_V10_PCS_RX_CONFIG				0x1b0
+#define QPHY_V10_PCS_ALIGN_DETECT_CONFIG1		0x1c0
+#define QPHY_V10_PCS_ALIGN_DETECT_CONFIG2		0x1c4
+#define QPHY_V10_PCS_PCS_TX_RX_CONFIG			0x1d0
+#define QPHY_V10_PCS_PCS_TX_RX_CONFIG2			0x1d4
+#define QPHY_V10_PCS_EQ_CONFIG1				0x1e0
+#define QPHY_V10_PCS_EQ_CONFIG2				0x1e4
+#define QPHY_V10_PCS_EQ_CONFIG5				0x1f0
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h
new file mode 100644
index 000000000000..92fbde7c9c7c
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h
@@ -0,0 +1,89 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_COM_V10_H_
+#define QCOM_PHY_QMP_QSERDES_COM_V10_H_
+
+/* Only for QMP V10 PHY - QSERDES COM registers */
+
+#define QSERDES_V10_COM_SSC_STEP_SIZE1_MODE1			0x00
+#define QSERDES_V10_COM_SSC_STEP_SIZE2_MODE1			0x04
+#define QSERDES_V10_COM_CP_CTRL_MODE1				0x10
+#define QSERDES_V10_COM_PLL_RCTRL_MODE1				0x14
+#define QSERDES_V10_COM_PLL_CCTRL_MODE1				0x18
+#define QSERDES_V10_COM_CORECLK_DIV_MODE1			0x1c
+#define QSERDES_V10_COM_LOCK_CMP1_MODE1				0x20
+#define QSERDES_V10_COM_LOCK_CMP2_MODE1				0x24
+#define QSERDES_V10_COM_DEC_START_MODE1				0x28
+#define QSERDES_V10_COM_DEC_START_MSB_MODE1			0x2c
+#define QSERDES_V10_COM_DIV_FRAC_START1_MODE1			0x30
+#define QSERDES_V10_COM_DIV_FRAC_START2_MODE1			0x34
+#define QSERDES_V10_COM_DIV_FRAC_START3_MODE1			0x38
+#define QSERDES_V10_COM_HSCLK_SEL_1				0x3c
+#define QSERDES_V10_COM_INTEGLOOP_GAIN0_MODE1			0x40
+#define QSERDES_V10_COM_INTEGLOOP_GAIN1_MODE1			0x44
+#define QSERDES_V10_COM_VCO_TUNE1_MODE1				0x48
+#define QSERDES_V10_COM_VCO_TUNE2_MODE1				0x4c
+#define QSERDES_V10_COM_BIN_VCOCAL_CMP_CODE1_MODE1		0x50
+#define QSERDES_V10_COM_BIN_VCOCAL_CMP_CODE2_MODE1		0x54
+#define QSERDES_V10_COM_BIN_VCOCAL_CMP_CODE1_MODE0		0x58
+#define QSERDES_V10_COM_BIN_VCOCAL_CMP_CODE2_MODE0		0x5c
+#define QSERDES_V10_COM_SSC_STEP_SIZE1_MODE0			0x60
+#define QSERDES_V10_COM_SSC_STEP_SIZE2_MODE0			0x64
+#define QSERDES_V10_COM_CP_CTRL_MODE0				0x70
+#define QSERDES_V10_COM_PLL_RCTRL_MODE0				0x74
+#define QSERDES_V10_COM_PLL_CCTRL_MODE0				0x78
+#define QSERDES_V10_COM_PLL_CORE_CLK_DIV_MODE0			0x7c
+#define QSERDES_V10_COM_LOCK_CMP1_MODE0				0x80
+#define QSERDES_V10_COM_LOCK_CMP2_MODE0				0x84
+#define QSERDES_V10_COM_DEC_START_MODE0				0x88
+#define QSERDES_V10_COM_DEC_START_MSB_MODE0			0x8c
+#define QSERDES_V10_COM_DIV_FRAC_START1_MODE0			0x90
+#define QSERDES_V10_COM_DIV_FRAC_START2_MODE0			0x94
+#define QSERDES_V10_COM_DIV_FRAC_START3_MODE0			0x98
+#define QSERDES_V10_COM_HSCLK_HS_SWITCH_SEL_1			0x9c
+#define QSERDES_V10_COM_INTEGLOOP_GAIN0_MODE0			0xa0
+#define QSERDES_V10_COM_INTEGLOOP_GAIN1_MODE0			0xa4
+#define QSERDES_V10_COM_VCO_TUNE1_MODE0				0xa8
+#define QSERDES_V10_COM_VCO_TUNE2_MODE0				0xac
+#define QSERDES_V10_COM_BG_TIMER				0xbc
+#define QSERDES_V10_COM_SSC_EN_CENTER				0xc0
+#define QSERDES_V10_COM_SSC_ADJ_PER1				0xc4
+#define QSERDES_V10_COM_SSC_PER1				0xcc
+#define QSERDES_V10_COM_SSC_PER2				0xd0
+#define QSERDES_V10_COM_POST_DIV_MUX				0xd8
+#define QSERDES_V10_COM_BIAS_EN_CLKBUFLR_EN			0xdc
+#define QSERDES_V10_COM_CLK_ENABLE1				0xe0
+#define QSERDES_V10_COM_SYS_CLK_CTRL				0xe4
+#define QSERDES_V10_COM_SYSCLK_BUF_ENABLE			0xe8
+#define QSERDES_V10_COM_PLL_IVCO				0xf4
+#define QSERDES_V10_COM_PLL_IVCO_MODE1				0xf8
+#define QSERDES_V10_COM_CMN_IETRIM				0xfc
+#define QSERDES_V10_COM_CMN_IPTRIM				0x100
+#define QSERDES_V10_COM_SYSCLK_EN_SEL				0x110
+#define QSERDES_V10_COM_RESETSM_CNTRL				0x118
+#define QSERDES_V10_COM_LOCK_CMP_EN				0x120
+#define QSERDES_V10_COM_LOCK_CMP_CFG				0x124
+#define QSERDES_V10_COM_VCO_TUNE_CTRL				0x13c
+#define QSERDES_V10_COM_VCO_TUNE_MAP				0x140
+#define QSERDES_V10_COM_VCO_TUNE_INITVAL2			0x148
+#define QSERDES_V10_COM_VCO_TUNE_MAXVAL2			0x158
+#define QSERDES_V10_COM_CLK_SELECT				0x164
+#define QSERDES_V10_COM_CORE_CLK_EN				0x170
+#define QSERDES_V10_COM_CMN_CONFIG_1				0x174
+#define QSERDES_V10_COM_SVS_MODE_CLK_SEL			0x17c
+#define QSERDES_V10_COM_CMN_MISC_1				0x184
+#define QSERDES_V10_COM_CMN_MODE				0x188
+#define QSERDES_V10_COM_PLL_VCO_DC_LEVEL_CTRL			0x198
+#define QSERDES_V10_COM_AUTO_GAIN_ADJ_CTRL_1			0x1a4
+#define QSERDES_V10_COM_AUTO_GAIN_ADJ_CTRL_2			0x1a8
+#define QSERDES_V10_COM_AUTO_GAIN_ADJ_CTRL_3			0x1ac
+#define QSERDES_V10_COM_ADDITIONAL_MISC				0x1b4
+#define QSERDES_V10_COM_ADDITIONAL_MISC_2			0x1b8
+#define QSERDES_V10_COM_ADDITIONAL_MISC_3			0x1bc
+#define QSERDES_V10_COM_CMN_STATUS				0x2c8
+#define QSERDES_V10_COM_C_READY_STATUS				0x2f0
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h
new file mode 100644
index 000000000000..84f1adee5ff7
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h
@@ -0,0 +1,89 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_QSERDES_TXRX_V10_H_
+#define QCOM_PHY_QMP_QSERDES_TXRX_V10_H_
+
+/* Only for QMP V10 PHY - QSERDES TX/RX registers */
+
+/* TX registers */
+#define QSERDES_V10_TX_CLKBUF_ENABLE				0x08
+#define QSERDES_V10_TX_TX_EMP_POST1_LVL				0x0c
+#define QSERDES_V10_TX_TX_DRV_LVL				0x14
+#define QSERDES_V10_TX_RESET_TSYNC_EN				0x1c
+#define QSERDES_V10_TX_PRE_STALL_LDO_BOOST_EN			0x20
+#define QSERDES_V10_TX_TX_BAND					0x24
+#define QSERDES_V10_TX_INTERFACE_SELECT				0x2c
+#define QSERDES_V10_TX_RES_CODE_LANE_TX				0x34
+#define QSERDES_V10_TX_RES_CODE_LANE_RX				0x38
+#define QSERDES_V10_TX_RES_CODE_LANE_OFFSET_TX			0x3c
+#define QSERDES_V10_TX_RES_CODE_LANE_OFFSET_RX			0x40
+#define QSERDES_V10_TX_TRANSCEIVER_BIAS_EN			0x54
+#define QSERDES_V10_TX_HIGHZ_DRVR_EN				0x58
+#define QSERDES_V10_TX_TX_POL_INV				0x5c
+#define QSERDES_V10_TX_PARRATE_REC_DETECT_IDLE_EN		0x60
+#define QSERDES_V10_TX_BIST_PATTERN7				0x7c
+#define QSERDES_V10_TX_LANE_MODE_1				0x84
+#define QSERDES_V10_TX_LANE_MODE_2				0x88
+#define QSERDES_V10_TX_LANE_MODE_3				0x8c
+#define QSERDES_V10_TX_LANE_MODE_4				0x90
+#define QSERDES_V10_TX_LANE_MODE_5				0x94
+#define QSERDES_V10_TX_RCV_DETECT_LVL_2				0xa4
+#define QSERDES_V10_TX_TRAN_DRVR_EMP_EN				0xc0
+#define QSERDES_V10_TX_TX_INTERFACE_MODE			0xc4
+#define QSERDES_V10_TX_VMODE_CTRL1				0xc8
+#define QSERDES_V10_TX_PI_QEC_CTRL				0xe4
+
+/* RX registers */
+#define QSERDES_V10_RX_UCDR_FO_GAIN				0x08
+#define QSERDES_V10_RX_UCDR_SO_GAIN				0x14
+#define QSERDES_V10_RX_UCDR_FASTLOCK_FO_GAIN			0x30
+#define QSERDES_V10_RX_UCDR_SO_SATURATION_AND_ENABLE		0x34
+#define QSERDES_V10_RX_UCDR_FASTLOCK_COUNT_LOW			0x3c
+#define QSERDES_V10_RX_UCDR_FASTLOCK_COUNT_HIGH			0x40
+#define QSERDES_V10_RX_UCDR_PI_CONTROLS				0x44
+#define QSERDES_V10_RX_UCDR_SB2_THRESH1				0x4c
+#define QSERDES_V10_RX_UCDR_SB2_THRESH2				0x50
+#define QSERDES_V10_RX_UCDR_SB2_GAIN1				0x54
+#define QSERDES_V10_RX_UCDR_SB2_GAIN2				0x58
+#define QSERDES_V10_RX_AUX_DATA_TCOARSE_TFINE			0x60
+#define QSERDES_V10_RX_TX_ADAPT_POST_THRESH			0xcc
+#define QSERDES_V10_RX_VGA_CAL_CNTRL1				0xd4
+#define QSERDES_V10_RX_VGA_CAL_CNTRL2				0xd8
+#define QSERDES_V10_RX_GM_CAL					0xdc
+#define QSERDES_V10_RX_RX_EQU_ADAPTOR_CNTRL2			0xec
+#define QSERDES_V10_RX_RX_EQU_ADAPTOR_CNTRL3			0xf0
+#define QSERDES_V10_RX_RX_EQU_ADAPTOR_CNTRL4			0xf4
+#define QSERDES_V10_RX_RX_IDAC_TSETTLE_LOW			0xf8
+#define QSERDES_V10_RX_RX_IDAC_TSETTLE_HIGH			0xfc
+#define QSERDES_V10_RX_RX_IDAC_ENABLES				0x100
+#define QSERDES_V10_RX_RX_TERM_AC_BYPASS_DC_COUPLE_OFFSET	0x104
+#define QSERDES_V10_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1		0x110
+#define QSERDES_V10_RX_SIGDET_ENABLES				0x118
+#define QSERDES_V10_RX_SIGDET_CNTRL				0x11c
+#define QSERDES_V10_RX_SIGDET_DEGLITCH_CNTRL			0x124
+#define QSERDES_V10_RX_RX_MODE_00_LOW				0x15c
+#define QSERDES_V10_RX_RX_MODE_00_HIGH				0x160
+#define QSERDES_V10_RX_RX_MODE_00_HIGH2				0x164
+#define QSERDES_V10_RX_RX_MODE_00_HIGH3				0x168
+#define QSERDES_V10_RX_RX_MODE_00_HIGH4				0x16c
+#define QSERDES_V10_RX_RX_MODE_01_LOW				0x170
+#define QSERDES_V10_RX_RX_MODE_01_HIGH				0x174
+#define QSERDES_V10_RX_RX_MODE_01_HIGH2				0x178
+#define QSERDES_V10_RX_RX_MODE_01_HIGH3				0x17c
+#define QSERDES_V10_RX_RX_MODE_01_HIGH4				0x180
+#define QSERDES_V10_RX_RX_MODE_10_LOW				0x184
+#define QSERDES_V10_RX_RX_MODE_10_HIGH				0x188
+#define QSERDES_V10_RX_RX_MODE_10_HIGH2				0x18c
+#define QSERDES_V10_RX_RX_MODE_10_HIGH3				0x190
+#define QSERDES_V10_RX_RX_MODE_10_HIGH4				0x194
+#define QSERDES_V10_RX_DFE_EN_TIMER				0x1a0
+#define QSERDES_V10_RX_DFE_CTLE_POST_CAL_OFFSET			0x1a4
+#define QSERDES_V10_RX_DCC_CTRL1				0x1a8
+#define QSERDES_V10_RX_VTH_CODE					0x1b0
+#define QSERDES_V10_RX_SIGDET_CAL_CTRL1				0x1e4
+#define QSERDES_V10_RX_SIGDET_CAL_TRIM				0x1f8
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index a873bdd7bffe..7af77572970e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -39,6 +39,9 @@
 #include "phy-qcom-qmp-qserdes-txrx-v8.h"
 #include "phy-qcom-qmp-qserdes-lalb-v8.h"
 
+#include "phy-qcom-qmp-qserdes-com-v10.h"
+#include "phy-qcom-qmp-qserdes-txrx-v10.h"
+
 #include "phy-qcom-qmp-qserdes-pll.h"
 
 #include "phy-qcom-qmp-pcs-v2.h"
@@ -65,6 +68,8 @@
 
 #include "phy-qcom-qmp-pcs-v8_50.h"
 
+#include "phy-qcom-qmp-pcs-v10.h"
+
 /* QPHY_SW_RESET bit */
 #define SW_RESET				BIT(0)
 /* QPHY_POWER_DOWN_CONTROL */
-- 
2.34.1


