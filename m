Return-Path: <linux-arm-msm+bounces-19312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6CB8BE2FC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 15:06:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8D6EB21169
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 13:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57C7B15D5DE;
	Tue,  7 May 2024 13:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K9hi1qas"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D590115E218;
	Tue,  7 May 2024 13:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087168; cv=none; b=PEiJGbOYTjDZDZ0Y7TYa/VKnZmCyCIY/GtQLZwW0JdObGdsaZzqSWP9vN095Op9EKGNSCJty3JiOBkON3b9HgpuVcgS0656BmUdi79L22qVixx2HRdO33woCb1h7A7DUQHmUJ0768GUmjs/rTOFYwVpomh+qcgl1MTLwgW5OkLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087168; c=relaxed/simple;
	bh=HGCQPQ8x93bOIwr55Kq5+6ZUP9VipvONFNTY8lTlIO8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ioE1txa2RbBq4TXEPpS5Vz2cBcIF4r+2q6tj91n7OJhv1E7USGqNkN22E6Vs0652gGsb8QLr8OjGLlxsxpKPjULkV4qn5n5/HtvlqF25qLaECw4V0T/jMSKP1QZBFowIJl+xvQae2l/Op6qYdDBzF5HgOYfwJsEBVLPbfd8uWB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K9hi1qas; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4478r0gs031464;
	Tue, 7 May 2024 13:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=0RepwHau/d9spJSH1Sl3WD9M7XJFlicXdJoUYlAuaaE=; b=K9
	hi1qasEdaC6JkJLEi5x8Lxl+J3687/qdFTPMYavaXPKmQsg8X80IBIy2Azye0Z5O
	oECS5Qb+IzgGJMrjQ+CM7t3tZQ8oYLh8iCpfjmsEf9T34/9uceza3QdXovlxyEYL
	YacaUHFqXtxEMdk4/64RMuBtvB7xvtSangckyo9toh7aB46/yF7s38N2VcaCkVqG
	wt1gWe6eaulEYqJdZpb+IqyksikV9jy/qbdHEc5RbGpsLL9AlirK82Sjw4/KpcXK
	YBCj2LQZb2dwdZUI7IeQlU1CVnP03gzGjrm4K8XVXbBVl/qPhUwvh0h0GAKs6aNE
	EbZgmb1M9h9kQjSdhvbw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xyc03h742-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 13:05:50 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 447D5n68004463
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 May 2024 13:05:49 GMT
Received: from luoj-gv.qualcomm.com (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 May 2024
 06:05:45 -0700
From: Luo Jie <quic_luoj@quicinc.com>
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <p.zabel@pengutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_srichara@quicinc.com>
Subject: [PATCH v14 1/4] clk: qcom: branch: Add clk_branch2_prepare_ops
Date: Tue, 7 May 2024 21:05:28 +0800
Message-ID: <20240507130531.3286999-2-quic_luoj@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240507130531.3286999-1-quic_luoj@quicinc.com>
References: <20240507130531.3286999-1-quic_luoj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: T0FDk7NW_qIPKA4smUEGFqB1FvJfo2LN
X-Proofpoint-GUID: T0FDk7NW_qIPKA4smUEGFqB1FvJfo2LN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_06,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 phishscore=0 mlxscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=901
 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2405070090

Add the clk_branch2_prepare_ops for supporting clock controller
where the hardware register is accessed by MDIO bus, and the
spin lock can't be used because of sleep during the MDIO
operation.

The clock is enabled by the .prepare instead of .enable when
the clk_branch2_prepare_ops is used.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/qcom/clk-branch.c | 7 +++++++
 drivers/clk/qcom/clk-branch.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
index c1dba33ac31a..229480c5b075 100644
--- a/drivers/clk/qcom/clk-branch.c
+++ b/drivers/clk/qcom/clk-branch.c
@@ -191,3 +191,10 @@ const struct clk_ops clk_branch_simple_ops = {
 	.is_enabled = clk_is_enabled_regmap,
 };
 EXPORT_SYMBOL_GPL(clk_branch_simple_ops);
+
+const struct clk_ops clk_branch2_prepare_ops = {
+	.prepare = clk_branch2_enable,
+	.unprepare = clk_branch2_disable,
+	.is_prepared = clk_is_enabled_regmap,
+};
+EXPORT_SYMBOL_GPL(clk_branch2_prepare_ops);
diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
index f1b3b635ff32..292756435f53 100644
--- a/drivers/clk/qcom/clk-branch.h
+++ b/drivers/clk/qcom/clk-branch.h
@@ -109,6 +109,7 @@ extern const struct clk_ops clk_branch2_ops;
 extern const struct clk_ops clk_branch_simple_ops;
 extern const struct clk_ops clk_branch2_aon_ops;
 extern const struct clk_ops clk_branch2_mem_ops;
+extern const struct clk_ops clk_branch2_prepare_ops;
 
 #define to_clk_branch(_hw) \
 	container_of(to_clk_regmap(_hw), struct clk_branch, clkr)
-- 
2.34.1


