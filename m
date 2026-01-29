Return-Path: <linux-arm-msm+bounces-91190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMdsIZp7e2kQFAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 16:24:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6D3B1680
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 16:24:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E6A3300B9DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 15:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D37828934F;
	Thu, 29 Jan 2026 15:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MSS9AkuK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YVsroC0o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF104279DCD
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 15:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769700247; cv=none; b=qTQmjq6aEVZZ2+y2jR60ZrpW5a8jJUSqpBV14FzzYnguVH1T3Hvvkj8f2Dr97Jly2e7/u9WO84/xd1XvIwq4iLegF4odbiA2sG+q1sPk5R1FGEQ+f1KlhVKq/lkxgsWpDJ5FYmVrv6xTPnEUoYdn1qQihRJU4grG6ixvbl2c0rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769700247; c=relaxed/simple;
	bh=sOKHK7T5L3NVe+bDeczyQJH7VpdmJZ86CkF6WtMmLe4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=koRtRBsyrrJgi7U1k1uEoljQQMbFTDUsM7Quj5L8d2v07Qi9hAtFUVXO1OU5srJWWq0tVPC0BCpE08S/vqDI6aD3Be0tGIodRWpPlrP/aFhLmfKPlaumbRR+C2H4fyK24Hw9+9wdTn2QlTzOy6mRO8LbAAYUieiugfst2yHH+6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MSS9AkuK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YVsroC0o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAAaWj3713391
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 15:24:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9U4JeWmKqSKMWm64Dzyeq11u0XHk7WlNtOs
	Z2B+mOYU=; b=MSS9AkuK5uxcYvewojie+0/MuCEntYYiXmv0Txjy+MsTVB9AjQ2
	bIw36+3z9r3Pd9alcQjcGDrlClYcTe6ZCfyjOGHubYLGuPg0B3jjYgVVKZrVjytu
	c9FyI/MCGBkILLIpadNwS4XygoTag+q75bvfmgf5FElWngUZrH80nmFBKIfR+kFS
	oQItLPhHsQy7bx6iZ7S507na48XOOMyGko+41nS0XHAca+IHXMQ3a1A6TcKQE0DL
	QAosOokblEDWXvhs34EPD6fpkANeshH/pesOuxV62AvKUYeMwCLXbfTPwqpF2G//
	TQdlvef2Hg8koPF+iKC02oSJzoLj0sgrkdA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byxcuacap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 15:24:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a7b7f04a11so25221755ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 07:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769700245; x=1770305045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9U4JeWmKqSKMWm64Dzyeq11u0XHk7WlNtOsZ2B+mOYU=;
        b=YVsroC0oGqhpC2nl+bMSO2xmE+3TZa814yCLoxhKVVN2V2D4tqbRWiHF6K+MrAJLyM
         pUatHazeWAalz472/V2LIcYlI8qYYztgtXz+PR8fsxhtMBsGfUomdiLiybatsoIXVfiR
         dmsssXc0KCqSs3WdXC+s9KwwPy0Fppyg8nUUiR6vYoiEYZHuYMSZX8lCMtR2UmUV8IiU
         oXVYkXWM54T8wkIAiSCjMIwVIxXwg1yZ8EumF9CFo2CVxlyVGExjwu97giV2XyL6AXuZ
         NofJDPQNKwMkiys4fZ6h6BJlsuoH7dWSE7kDHFBhoY4m297yR4IS9ta8udrGs2YCZzTJ
         uiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769700245; x=1770305045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9U4JeWmKqSKMWm64Dzyeq11u0XHk7WlNtOsZ2B+mOYU=;
        b=EzpEEBJecUrMZGQ+xN3VVW4jI3KgfpqwuD4pKGvflLOmD0iAJW2j2EBTjn2f71qKVU
         ntou2zRREi4Zuwxf5Ypf5i4BtM72euJwJQQ0ql430O75w9C7VOthhzUtKFVwCGwxqPHI
         pwSuJoQUtj5C5fR9LyDhCgSofQKD8ceEyCVUpkWKfz03yO+OLWLRS5C1M9DjmBepfZh8
         9cs4ooX2cOc9jGmqVlbnW31BEHARnLgpAZxTUycPxNOX5ZIFR8W70ZLjOKvQM/+hXF0h
         9a5lNVEz4KwjbB/nOOA69KbMN+C3MOH7+uRtTL9qgUMh1T+fc6F8ng7LQC9DlJXJ9Iuz
         hgkw==
X-Gm-Message-State: AOJu0Yw2BhLt59WMJXpZXfRAQmc8e4vFfFdLlUM5gy/91JvzbSO8k+5c
	shNEHOJItdotBSGS+VSAbsZjYJOl9cq4JCNnwrH76p+4rfITcvfUB/YtWEgAS9OyMz07r2wZ0zA
	HNXVKnciXKIEBG1/q2NDQQYpct68h6AaAnC9HaXM8q8akFouP3Utyjl/PNxebAUZdbLerPCcqUi
	GR
X-Gm-Gg: AZuq6aLpZ53EbiCCKKQrYFx1d67QRcSj1ZELnmNfhf3T+WvpcSxkjyMXq0iSFHkcyCr
	S/EYaSvPRQ97QGapIHa6gh0EnadG8VsyAPfxoVooi3FWf4sCi/cU+8i86BQgZ40tncP9WtLE+Jm
	avguSSFuVuHw33GABCiGZ949IlWVbo0JzuD0ojp5/2OqgZNYKS7UEJvsXeymvUCq0Aian/qoEiu
	j+/ik1O/xBMrjsyC6zE5zcAdxavFZ0IIDm+kmis+koD+nmG8A0WFBvmUIRYzXStw2/fO/CGpeYW
	bpulpc6E/sIdy2cCWZ+UsW7RtFGwESCeEEh8grGrfa5e6Yl5S6RfNGeBImcm1d8nYWOIMpmeakV
	Z2u/+7H1O0HBWT6/vZOFwBjcKapXLLIzsOsLg
X-Received: by 2002:a17:903:37d0:b0:2a1:14dd:573 with SMTP id d9443c01a7336-2a870db415emr106058855ad.23.1769700244862;
        Thu, 29 Jan 2026 07:24:04 -0800 (PST)
X-Received: by 2002:a17:903:37d0:b0:2a1:14dd:573 with SMTP id d9443c01a7336-2a870db415emr106058365ad.23.1769700244226;
        Thu, 29 Jan 2026 07:24:04 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d93cdsm52959165ad.70.2026.01.29.07.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 07:24:03 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Chris Lew <quic_clew@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 1/2] soc: qcom: qmi: Print error codes in failure paths
Date: Thu, 29 Jan 2026 20:53:19 +0530
Message-ID: <20260129152320.3658053-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDEwNiBTYWx0ZWRfX1N13cjZr54Wn
 5snfmvkbvrR8ebNw8x1qZqjCJsf/nSsBPt4N66/SCifS6SBI8eiSWo14eEPpBz7bxJ5iDHWEz0o
 xd0REvY87o/YV/Ri7Frg4rRZ/zdWO2vZilTmlp/UGrQeqTUlZ5ZHavxkZMa/5wAJmlfF6qgCk9R
 6oIa+T0JcEPFy5EWAGYKScSnkbMKD1AgoBpyqk4tirLa4ZSbP45TUUPqTBIVfbTcbqNLeOcQbTI
 2NlRY2DTHcnaGjc2kd+GYFhlZXz37n6f9PRaewqpYlPqSLerIlTYvV1OIS2Yrwzmd4+PDC17z09
 ZoxAfpSI/2C3okFnORL5yLMr7Q5lNHJyW0yw1rBEtHrdrAcQLPYfe9S6DG7BOigLKjCGWZTjTAB
 PQvrICYbG+fsKRZ2ENKCNXzlt6+E36ms5wNYINO697GOWKMefON8577SB4uD2OmR5FNKF27OVIC
 4gsdYS376lhvzE85fnA==
X-Authority-Analysis: v=2.4 cv=QpRTHFyd c=1 sm=1 tr=0 ts=697b7b95 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dDuzJLjRrGaJ8GpUzEcA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: LiEy0bLgqh65Vhj9ymojeXGpcDnYq-iz
X-Proofpoint-ORIG-GUID: LiEy0bLgqh65Vhj9ymojeXGpcDnYq-iz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91190-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DD6D3B1680
X-Rspamd-Action: no action

Few error paths in the qmi_interface module log a failure message but
do not include the actual error code. Include the error value in the log
so debugging failures becomes easier.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/qmi_interface.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/qmi_interface.c b/drivers/soc/qcom/qmi_interface.c
index 6500f863aae5..941612b1bd2e 100644
--- a/drivers/soc/qcom/qmi_interface.c
+++ b/drivers/soc/qcom/qmi_interface.c
@@ -321,7 +321,7 @@ int qmi_txn_init(struct qmi_handle *qmi, struct qmi_txn *txn,
 	mutex_lock(&qmi->txn_lock);
 	ret = idr_alloc_cyclic(&qmi->txns, txn, 0, U16_MAX, GFP_KERNEL);
 	if (ret < 0)
-		pr_err("failed to allocate transaction id\n");
+		pr_err("failed to allocate transaction id: %d\n", ret);
 
 	txn->id = ret;
 	mutex_unlock(&qmi->txn_lock);
@@ -413,7 +413,7 @@ static void qmi_invoke_handler(struct qmi_handle *qmi, struct sockaddr_qrtr *sq,
 
 	ret = qmi_decode_message(buf, len, handler->ei, dest);
 	if (ret < 0)
-		pr_err("failed to decode incoming message\n");
+		pr_err("failed to decode incoming message: %d\n", ret);
 	else
 		handler->fn(qmi, sq, txn, dest);
 
@@ -502,7 +502,7 @@ static void qmi_handle_message(struct qmi_handle *qmi,
 		if (txn->dest && txn->ei) {
 			ret = qmi_decode_message(buf, len, txn->ei, txn->dest);
 			if (ret < 0)
-				pr_err("failed to decode incoming message\n");
+				pr_err("failed to decode incoming message: %d\n", ret);
 
 			txn->result = ret;
 			complete(&txn->completion);
@@ -661,8 +661,8 @@ int qmi_handle_init(struct qmi_handle *qmi, size_t recv_buf_size,
 		if (PTR_ERR(qmi->sock) == -EAFNOSUPPORT) {
 			ret = -EPROBE_DEFER;
 		} else {
-			pr_err("failed to create QMI socket\n");
 			ret = PTR_ERR(qmi->sock);
+			pr_err("failed to create QMI socket: %d\n", ret);
 		}
 		goto err_destroy_wq;
 	}
@@ -766,7 +766,7 @@ static ssize_t qmi_send_message(struct qmi_handle *qmi,
 	if (qmi->sock) {
 		ret = kernel_sendmsg(qmi->sock, &msghdr, &iv, 1, len);
 		if (ret < 0)
-			pr_err("failed to send QMI message\n");
+			pr_err("failed to send QMI message: %d\n", ret);
 	} else {
 		ret = -EPIPE;
 	}
-- 
2.50.1


