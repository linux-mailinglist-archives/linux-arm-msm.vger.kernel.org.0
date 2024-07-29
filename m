Return-Path: <linux-arm-msm+bounces-27330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B247940167
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 00:54:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02F8F1F22850
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 22:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B23BA1448FF;
	Mon, 29 Jul 2024 22:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P8uGrWvg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B83824AD;
	Mon, 29 Jul 2024 22:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722293636; cv=none; b=o5sJO/GZIehr99LKsqYs9x6e9x5vUq4Sb8sBE6lZtlIpSBXtIqBOliJ+gwxwjvea4LoxhRbgzdaYfnGeeYL17qjXAKE7EIHUf8X7qEfzWoZauF4FHCVEA6VZBywzcwx5MBt7HI4QK52bTHvdeN0FgC7HEN7xQDekBc291HmcFGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722293636; c=relaxed/simple;
	bh=YVaiGUFdzo4wr1z0nQ/+Ssk6ms3096L6v4cv4lYtmQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=UC/8ZVSc5PZJxRjRPp2+5/UJ8+LXcNysi4YnyE906UfSTE6eVfOulNGGLGNypou7kjvQtsL9SJhd2BHApa1Hd6ojyJw4mkCcnLwPCSEw2HI7cM9yYbspybd+sLN7CvvV9kScWFQk/VKsOMgeeCK8TDm5TLMva5FuIb/8WFVCT4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P8uGrWvg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46TAJAL5019162;
	Mon, 29 Jul 2024 22:53:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EXHK91ZQmV6l2IOE6AjQK+
	mmIe6zdsbkePzTJJotiN0=; b=P8uGrWvgjN5lF/0lpFJ2Tp9axPKLOShg+7qNMy
	xjOy41JH9JjFtb7vSDMhU6FwlWr2W1mm2jUeWvQaIiLes+H7acKjIcNDYBZjCwT5
	CQM10CsK9dQlGkV2ZgDyrpnY/SZEr9HEGdXHvpQx68gz7DKgglB+mfDShmZDrAqY
	ED6qBtFOb+s4TujmgJdhgn1PxppSF8CzlNGpoJVSQs3figo2w815ZxVZnybvQdly
	IhSmnRaY/3XQ6B+QpCtIb4wf57G7BiS7Yxle4GN4J+AVNnnMBT5TG2CbqZpXxJPs
	yxOM31xITPKhj8fUlr3kv4ddHBvu/IwJlPShfK4syINFyBCQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mqurnjw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 22:53:52 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46TMrpLh000579
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 22:53:51 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 29 Jul 2024 15:53:51 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
Date: Mon, 29 Jul 2024 15:53:50 -0700
Subject: [PATCH] usb: gadget: f_fs: Define pr_fmt
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240729-f_fs-pr_fmt-v1-1-8a0fc3196201@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAH0dqGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDcyNL3bT4tGLdgqL4tNwSXYNkM0OD5GRDgxQjcyWgjoKi1LTMCrBp0bG
 1tQBt3JMjXQAAAA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722293631; l=843;
 i=quic_bjorande@quicinc.com; s=20230915; h=from:subject:message-id;
 bh=YVaiGUFdzo4wr1z0nQ/+Ssk6ms3096L6v4cv4lYtmQU=;
 b=JuInNwLq/w7rerqhNEENHxoWcJEDCRwD4gjzprgxyldEz181NrXRWQfdzc0BwkZHX7VtihqKE
 CYcOmp2ELmjARuFUeP/q6ILyNYNQ03LR1gb/YplWtVH1wqFL152q5gi
X-Developer-Key: i=quic_bjorande@quicinc.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: geN0Lwyj2IJOCus30mUym1R1LkwmI327
X-Proofpoint-ORIG-GUID: geN0Lwyj2IJOCus30mUym1R1LkwmI327
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_20,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=582 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1011 bulkscore=0 malwarescore=0 mlxscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290157

The majority of log entries of f_fs are generated with no indication of
their origin. Prefix these, using pr_fmt, to make the kernel log
clearer.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/usb/gadget/function/f_fs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index d8b096859337..14ee43cb27b6 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -10,6 +10,7 @@
  * Copyright (C) 2003 Agilent Technologies
  */
 
+#define pr_fmt(fmt) "f_fs: " fmt
 
 /* #define DEBUG */
 /* #define VERBOSE_DEBUG */

---
base-commit: 931a3b3bccc96e7708c82b30b2b5fa82dfd04890
change-id: 20240729-f_fs-pr_fmt-0c610cc10d27

Best regards,
-- 
Bjorn Andersson <quic_bjorande@quicinc.com>


