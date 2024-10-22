Return-Path: <linux-arm-msm+bounces-35318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6089A97C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 06:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A43C8B213D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 04:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB3984A3F;
	Tue, 22 Oct 2024 04:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BTT3ehnV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CA883CDB
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 04:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729570868; cv=none; b=RXQRRQvTKnp8Y6WHfFPp3Bfqffu18zPuxcprC/FRmJD9mbxBO5szUbVWCK5JjEAnq5E3LMFb/xemmJ4HYa1swVW7zpCPc+bsfZ/I+IKZAQxeNkqW2q3nTK7a8N27Zk32wybPUzfXTKYd1t0je7I+lJg/CTzLjECW7QHvj0Rz1Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729570868; c=relaxed/simple;
	bh=ZZx94kuPsJBqKhSDlU3Qol1h7nTVfSUnlGS8qd2Tcgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=r38TsJyRX96huVtawMybzdwKQ5LdepcrJDBLIt85Uf1LpV5uMulU4vLTpni+FLh+QkIeRzy7e4G7GsufZgycRLEI5QJoZcVHcgrdLfLxygAnm1oerEq3elYSaZC2TD+UveWNGE5gdTCvPxJPNXJ9OADHRuG1lFQPtueK/w2k9sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BTT3ehnV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LLoctT001964
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 04:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HENcSFiPTx5iVYi4wXblKs
	xcwftxsbQ86miIac1Sdxc=; b=BTT3ehnV1z6yapmJZZBY1Nzam93UHephGLtGny
	DoGRjfnhRqo9SWxlSb5l2e7tYRpfBXmzTCrSgJmPntN9N78UrBW9J9kukcI76u+w
	8ffswpuqWJqidUbojE6BQbap1oMcKX3JgpqA1VheieHhG2orN2gJcTeh29zrd+Fu
	SWcOiNwutJ1m5n5Fba0vhBNasSjqF+CjF++0BcSUjiSNT6iurKMYH38KlPRYHY8a
	9XrVxm6+7Spq/dZT50G2Zo+ISZa38oHUvRP8NKNA5nNf5gWDFMx/Dsnq4ckjHCVZ
	0+N8BJ74LvbV4DegHy3GBsdaqZPK10sB8KPDn+vmJK12mEPg==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6rj6tpm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 04:21:05 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3a3c27c72d5so46297065ab.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 21:21:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729570865; x=1730175665;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HENcSFiPTx5iVYi4wXblKsxcwftxsbQ86miIac1Sdxc=;
        b=oSvgsmD9TKN87S8Q1F98X2aXmUy5I98zAIT0JUMEA3gMqkIPmmDxUBi/VTDt3MLCoN
         ud/HRXdhJljZTUw/MuF41QoJXqC6w7Ms/6IOUHqFOMx2jQZJjJOW5qxQSbpDg0zC7yfI
         txNIf+Dh9bfp5rBkhIAE3ZQAqp37CMqpFVLmRpRUeq2aZeAm1QOFYu3CEiO6APncNUtH
         vo/t2c+9Ebzp9BUL7sWDCSCFqznnQzwH5IVvvQ3zD91xBFiF24SAVC4RIVIrzeJVNNuO
         T3GrstSKwNb2+KWUYOW+ZR6emaHQlBjQNn/hOoLZlx0CzO98Jg4lhwOSgpkLWzVg18jH
         7nYA==
X-Gm-Message-State: AOJu0YwPot4ENmb5voMoFsGrcI5bZjA/HE9r9L/+cKc5bUCvaMNNm12E
	id7sF1tJX0FMAnwky4R1Jtj6JFaB34PuNOPZkyvoQzfSfR8vyIBCvEKBDPhQQJwP1sFxGDHRC44
	+qUvBwb8mqgH7IplVajQ6F0yxd0Wb/9cOn2sMEapvlQ93YFo9Du2nVsHT8DHWPJTw
X-Received: by 2002:a05:6e02:2169:b0:3a3:b527:e809 with SMTP id e9e14a558f8ab-3a3f406326amr131195945ab.14.1729570865028;
        Mon, 21 Oct 2024 21:21:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5uiaNduHPg+WyNp76ip1D4UiD9rzbbavv5abdTKo3logKNRs+dpMem9fvb6tI30AudDIw1w==
X-Received: by 2002:a05:6e02:2169:b0:3a3:b527:e809 with SMTP id e9e14a558f8ab-3a3f406326amr131195825ab.14.1729570864690;
        Mon, 21 Oct 2024 21:21:04 -0700 (PDT)
Received: from ip-172-31-25-79.us-west-2.compute.internal (ec2-35-81-238-112.us-west-2.compute.amazonaws.com. [35.81.238.112])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeaafd36esm4062644a12.6.2024.10.21.21.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 21:21:04 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 22 Oct 2024 04:21:03 +0000
Subject: [PATCH] remoteproc: qcom: pas: Make remoteproc name human friendly
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-rproc-friendly-name-v1-1-350c82b075cb@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAC4oF2cC/x2MQQqAMAzAviI9W3BDUfyKeBiz04JO6UCUsb9bP
 IaQZEgkTAnGKoPQzYnPqGDqCvzm4krIizLYxramsRblktNj0Cgu+4vRHYRqvOvN0HkyoOUlFPj
 5r9NcygeSUIgEZQAAAA==
X-Change-ID: 20241022-rproc-friendly-name-410ca7185ce1
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Chris Lew <quic_clew@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729570864; l=1350;
 i=bjorn.andersson@oss.qualcomm.com; s=20241022; h=from:subject:message-id;
 bh=ZZx94kuPsJBqKhSDlU3Qol1h7nTVfSUnlGS8qd2Tcgg=;
 b=AkHzqQQIe6kZ4eRZ0l4KUW7cv10TNSmawOi7RRnmXynFRX22M+BSpmS2uWx8Kb1Ypsz3TUjSg
 F4W2Rk/T1IVDiwS5VnznSrF7j7c63ihq7clGki3AgOAJi70XlVD8Hno
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=SAhIzN2NcG7kdNPq3QMED+Agjgc2IyfGAldevLwbJnU=
X-Proofpoint-GUID: aTSRQjduDDtYJnqoRC_8hK2Puv_jeSF0
X-Proofpoint-ORIG-GUID: aTSRQjduDDtYJnqoRC_8hK2Puv_jeSF0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0 spamscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=960 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410220027

The remoteproc "name" property is supposed to present the "human
readable" name of the remoteproc, while using the device name is
readable, it's not "friendly".

Instead, use the "sysmon_name" as the identifier for the remoteproc
instance. It matches the typical names used when we speak about each
instance, while still being unique.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ef82835e98a4efd4bc603cff604d531a51fe9f9c..b2108c3036a33f7e9a63380be3a6e319e76503cc 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -716,7 +716,7 @@ static int adsp_probe(struct platform_device *pdev)
 	if (desc->minidump_id)
 		ops = &adsp_minidump_ops;
 
-	rproc = devm_rproc_alloc(&pdev->dev, pdev->name, ops, fw_name, sizeof(*adsp));
+	rproc = devm_rproc_alloc(&pdev->dev, desc->sysmon_name, ops, fw_name, sizeof(*adsp));
 
 	if (!rproc) {
 		dev_err(&pdev->dev, "unable to allocate remoteproc\n");

---
base-commit: 42f7652d3eb527d03665b09edac47f85fb600924
change-id: 20241022-rproc-friendly-name-410ca7185ce1

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


