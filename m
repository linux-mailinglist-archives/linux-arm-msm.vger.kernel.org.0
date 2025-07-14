Return-Path: <linux-arm-msm+bounces-64758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E38D6B03727
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 08:32:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2059189343C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 06:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA89225779;
	Mon, 14 Jul 2025 06:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YI696kbs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE886230BD5
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 06:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752474711; cv=none; b=Mh21ppazwd5EMl5FZJock3FIlTavwc4zNIJtqD2FjJ2sBRmKEjikQGhOqqk9jCBZQj1d3eZMqUUWWDI6YTUcrQI+zcha+YknWfXZm74Ga/M4uW4fDjrvK+xshXR5KmVGy5OS14IBRjf9uYFuUpqPc2Abnsnzo8ma9/L1oZH9DqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752474711; c=relaxed/simple;
	bh=KepZY8zi4khOQ+LkoB9ldagpD9linYgqNDUu7qBt0Ug=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b3Jll8hdIW2oiLl/1Szi9SjGr+iMg6F/3FAK/MiKZ/1jrXv5pf/b3go+z/IW3q64BZXobXv3YU5og1DXvU2GZFTahCKo+limzPXwBKsYPjIE4qIb0IW/xSjNxhKGf7lbp9hU92VZfZ5IGEFR257KOLNSnHEHemFhQN6qS7H9/o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YI696kbs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DMDrpH018413
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 06:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gbtexVl8cn7
	s6dLp3Pk/zhJx463eI0itM2/mzeX7Ixo=; b=YI696kbsIJuZX+Dyf4Y4ffihnwd
	85P4spZnLOkx0480WJIsrVbwll0QaFrEa9q2G3OYF8kBU1UxYmc5ojUj/zQcR3Iv
	sWnE6t7Ua3ihnPDTX3WeUnZtzBLmQhSxsyWzI5n15/vFrhCxe+laJNoWEBbQmadM
	9E1ugX/6ZzWIoZmOJwT1YWfXUjNQSCsfxbtdNEK4s+F4n5uALRhgmz/jLK4H4xxr
	OgOv6hHi+hevH1JAdDG17Js7eXVxhChkBm1Ne2LDtI+Pjc06laFQIR4oSsvGEnC3
	p2MbjhWhHjDtB2ExaIwK6JagNRAxNNj276PpAPvIbwXERFlwwPxImf8Ym1A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug37uffp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 06:31:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23638e1605dso30649245ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 23:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752474707; x=1753079507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbtexVl8cn7s6dLp3Pk/zhJx463eI0itM2/mzeX7Ixo=;
        b=AVtrJC5IryZE9f+oq0pjCD7mrKFl6MJ0jFpyRhD0EZULNWOrJasTbTc6GKObUvN6jc
         OXo9/T+a/TwvIHzztMxCy44SUtuCWB1cE/9nOLSau15cGBXJ5JfG1+42ZWyWMAaIS3F4
         fra5MagfKlVhqdxGfhDL7zwee6xY5neFF+wi97DGV7Iydi1PMQoApBgTgd+WjafYmZjN
         P3GEasBLpvWXyzxW5qqOGpia2ZrM1aKRcjy/r4raJczZBtHnKcPxp52Eh7axKYmZ/ZBa
         3aNwgC9kiw33jTTPX+5D2UeJdYcPKgXCDgU+YU0CakX/2ZJPlDW3wZC4mzJ10ZKsAxmr
         WuLA==
X-Forwarded-Encrypted: i=1; AJvYcCXyiWpNwe93m1p5mVENZl2tlusAkw926bl70FiRDGGRJspstd8EWk2YLmqrmWWwDCR98ROCKQbJ34T6FZ6i@vger.kernel.org
X-Gm-Message-State: AOJu0YwY0t242hnx/J8hKiyKx+UgW2x1j6Vrp3dXi4Vp9EXsMa/MRvGw
	ECNgRzV+d0AdaEhQj5PHSeBwBghqOb8klpyi2vb2zgsOH1aAkK/E+Ytx8UH1FDHIazk0IZAQn5B
	mECuF0mJGyYBUfsrMoWDwmG9MhoJbhXSRCb/Wn2BLLz7W/Rq1CpAs5nO/K6G7mBJclnmu
X-Gm-Gg: ASbGncsLe8hzY86z3L/eCkEps/xANqvb8P8opPfeJ6KE7e6NfLXV5U7P8p8arwVzQGc
	+PJUUudwD5abz8UjzNkNxVbO4B/gUoXZh3YWXBcakcwVrRa0svW2CD0fCQataRX5UE6l/Zj4MHn
	4IYjVKTdj68UPsnq6hlhSS5XA99QcOVVfgH9aJcPBMdcop1smfywZAy/ReQpM4u65UwTLVYd3QQ
	5aiZs2mbHGlZROj4B0pJ2U6HAJE3yfuYVdYNEhqh3PdQ/y2uHWkB0R7k1Ts1o1DVGE8MaXuqwpV
	O1dzGMHygDZypI7hloHWV9fyuflFWKF0Qrn6uMWX9NYG6vtZmJDWGo/yzegEvhjZbMph2WU3H3y
	zQsOblqIdiFl/xZVwW/4C
X-Received: by 2002:a17:903:1a2c:b0:235:1962:1bf4 with SMTP id d9443c01a7336-23dee1a9a28mr154868355ad.14.1752474707450;
        Sun, 13 Jul 2025 23:31:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj4rbvGnNx+fx3MCBznDJ6E+aV9dfiQvxQXSpTlh5YwlHL8v33E80+qeMS7LmY2WziB5yZ8g==
X-Received: by 2002:a17:903:1a2c:b0:235:1962:1bf4 with SMTP id d9443c01a7336-23dee1a9a28mr154867985ad.14.1752474707024;
        Sun, 13 Jul 2025 23:31:47 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4334005sm86138255ad.158.2025.07.13.23.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 23:31:46 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Jie Gan <quic_jiegan@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 RESEND 06/10] coresight: tmc: add create/delete functions for etr_buf_node
Date: Mon, 14 Jul 2025 14:31:05 +0800
Message-Id: <20250714063109.591-7-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
References: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAzNyBTYWx0ZWRfXxaRtoKN48gbh
 qEevtx0vvD0Vz3m6Hfkj+92Bni2IdNC9DNHvhIMHPxg8/jYRLjAND951rxeSV0vn4O+1mkPeXUb
 4O2kjsh0JZFSBSCRLqeJD1hG/jk9iHAEkKdFPQwEoh8KBEejNMf9mvCPm9bBOcEGscO43C0BDx6
 wpQlg+QzwHN1K9UzBJ0UQNNwf7FjAXHmZ3hXrrS74ROPAS3/piTKruCOwWzTpdrHukAuMWl020D
 4MLo4joRMVnvVNxS2aFjLPyqUAsQ+V1xVBrCnMFYCGI/CYsd0S2mRGaU1ZdfdZdy0/TYlJVCajo
 XWdUX9zl08laPSoNqnTFFIt0YZmF/+q0vCWi32lp89E83jsn+l7NlD5KAvXJKz2Gi/3V5461xBl
 cJ2gr+zC5zdpA6nsIvBoWqH2O3OvjS/V40xnEJY61X+fvX7bCsS19rqXT9+yiup1A1M7diV+
X-Proofpoint-GUID: 8suV6-Tfrh8fhVhFjY4Y4iqiIm7lWCHN
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=6874a454 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=k3jFKW3szlTOC2bxmxAA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 8suV6-Tfrh8fhVhFjY4Y4iqiIm7lWCHN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140037

Create and insert or remove the etr_buf_node to/from the etr_buf_list.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-tmc-etr.c   | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index b07fcdb3fe1a..4609df80ae38 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1909,6 +1909,55 @@ const struct coresight_ops tmc_etr_cs_ops = {
 	.panic_ops	= &tmc_etr_sync_ops,
 };
 
+static void tmc_delete_etr_buf_node(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf_node *nd, *next;
+
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, node) {
+		if (nd->sysfs_buf == drvdata->sysfs_buf) {
+			list_del(&nd->node);
+			kfree(nd);
+		} else {
+			/* Free allocated buffers which are not utilized by ETR */
+			list_del(&nd->node);
+			tmc_free_etr_buf(nd->sysfs_buf);
+			nd->sysfs_buf = NULL;
+			kfree(nd);
+		}
+	}
+}
+
+static int tmc_create_etr_buf_node(struct tmc_drvdata *drvdata, struct etr_buf *alloc_buf)
+{
+	struct etr_buf_node *sysfs_buf_node;
+	struct etr_buf *sysfs_buf;
+
+	if (!alloc_buf) {
+		sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
+		if (IS_ERR(sysfs_buf))
+			return PTR_ERR(sysfs_buf);
+	} else {
+		sysfs_buf = alloc_buf;
+	}
+
+	sysfs_buf_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
+	if (IS_ERR(sysfs_buf_node)) {
+		if (!alloc_buf)
+			tmc_free_etr_buf(sysfs_buf);
+		return PTR_ERR(sysfs_buf_node);
+	}
+
+	sysfs_buf_node->sysfs_buf = sysfs_buf;
+	sysfs_buf_node->reading = false;
+	if (!alloc_buf)
+		sysfs_buf_node->is_free = true;
+	else
+		sysfs_buf_node->is_free = false;
+	list_add(&sysfs_buf_node->node, &drvdata->etr_buf_list);
+
+	return 0;
+}
+
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
-- 
2.34.1


