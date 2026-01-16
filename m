Return-Path: <linux-arm-msm+bounces-89374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 298FED2FBDF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 11:44:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46C3330E9D67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 10:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 048C235FF46;
	Fri, 16 Jan 2026 10:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y6Xfcexb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KzBsDbI7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D95935FF6E
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 10:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768560109; cv=none; b=Wa4VYSb7a4GiYmRFxgc0rexS3RPnI73Dr7pp7YNS2InRhbRrpAyBNmI/tZuuvl1/eTmro7K0C0Mx3LmieW9RbrYHkeqplRLcgRrOFP2mwNYMRLanmEZEkX3w0wL8vtQzeUh1Jf5TyOyxoEFuyyHGy061QQy1tKQYKLC8wTJ2HXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768560109; c=relaxed/simple;
	bh=nRbhcsGUzEBRd//cJGdc1CTziAEXsTl3Od3TxBL84BA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cox4qc5ryo/gqGawUZ3FGjGtKV4VHg+ZVksRqysd+nWUxTZL0SxXHGiMzK8DbBVGGt2JhV11BtmHTUHYKJ6LUM9aKnmZnqKUjTBDiJVtliKKUfLzo/Ja3YQBCEBPZ0FMZ4lGpMs/qisdZUJfEx/tQ4PwCrcDvqWxoeebEa/WgGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y6Xfcexb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KzBsDbI7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G8LIHH4017960
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 10:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+6arHGnDlUN
	YPv3P4q0uiidePRXSn664P7Yjsk4T9s0=; b=Y6Xfcexb5dOMtd+U/CF105any6Q
	I+NkGuIqKe1vrhslHkuYSDmqA7vinIui2LUZAk0x5qXXBN5GU+n5f3kENk47tFfG
	8J1YQcn7Q5iLh3uz7Y/WXKaMJuN5kUDkJdsXvMWcNTEkOn4yaqKYGWue8edMJMOD
	R0/nhp8mIZ4BuHg2+OLSCZBHkcLQHUZXyj6CIo16PMF0+BHjIHLijqSKnv6DW4H2
	Oqt02PrnjwJ47TY24IAXlkQ0NFgpmaStaQgrRwLMmzOrlg4q+KTuz+xeV4beQki8
	F6wFERX0LKcc4jCSCvy9LAtzXcLtR0X54/gLEf5FpmIQfyQZZm0ZKPop52w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq98y9t99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 10:41:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a09845b7faso14056745ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 02:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768560103; x=1769164903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6arHGnDlUNYPv3P4q0uiidePRXSn664P7Yjsk4T9s0=;
        b=KzBsDbI7GKKsggCIoXeT+NrC8LvBoZkEEFsOQ16OwsRv0l5DqwDcOl6fHJFyE2F3Sl
         ihPOhnXEwbSYHFHTJhfzKwfRmLSMc7HAee0LYyRtmH4kFnURuK48NUpJkxYuhMRARJgU
         nGvIN7x8fK/Q2mgOjoP/Siej2zhxqEa6dIcFyQbU971UKTGKtXe56GqqsHnZCdie3Hpy
         KbO4zKQhft3xfYYfvdJL2MxEobM7BJdfZ4HSxLKKmDLqnraqFQIiME8oUVNDRfNwvzu8
         aBpXkiLsRau6E+fKZsBZT+OLcdmdmZ4TJhw88VB251LkNLlFxEirAMkv/TX8+taVJ2t8
         ZIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768560103; x=1769164903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+6arHGnDlUNYPv3P4q0uiidePRXSn664P7Yjsk4T9s0=;
        b=w6N8U2hQRiIez2EPxDCdkjEZ/Gs4uI2sLtwl74HquAWCAwk2+TrQRocezwuYkJJU79
         sKOPN49v5wsJ3Y6blEo1vVXQwFS6oHzw8RCpn1Qx2BxuM2Zy7wVIEO6nEprQT1fwq77b
         1lwVAeLR2NaggkP5+eo16eQ9rYi3AQ1LpDgfyqAM1RrMY+WqCnsPX8aYIE0BHlMw5MkO
         t6xZ4CmZnG0yY6KCWWz63b0nFs8n2ZpJ+KJNe4SQR7q7o/wHbZLHKc4pzf8G46VWDX5e
         fdjgyfH28/0A0kEOJ9GOCgJ3esQhKNiKPjq3Dz6K8ZClNrBicLFODClzhgGVBCtV57/C
         XXlA==
X-Gm-Message-State: AOJu0YwMkm9K6uEhN/pfmI+/PrV98gR0j5OBFVllz2r58F73bLhT18iD
	aDgp58BMzE0yjQ/qF/qTqhrzaqMWLJcnig8rF3ll2Cfv8C6ZbnSt846/fsmMwcKzfougOYHub8w
	tTpg5lLi9hLKtzPwFagE4ZzOFd4VmfDUNybAUM2J6rBQorwF107ixzzmCCGabGE7aLdiZ
X-Gm-Gg: AY/fxX7v8VdoaE8h9eb2Ud4QVGAV/OiwJPvAncQDR69mDQIwKoifXEraGMas8kjDg0T
	+pmuHXpQMnKvj+A2K4kxiJgfrslQOXH3yOvDqrRL+0JwxdODYFAmbmuHEk+nGh1mbr1OBxoFfCr
	B/s+oRbbR29J7/MijeQouvvxjVjxUmRp0uTOJbqhIcKCcGMZXg8bs8y/OdisDFSftdE+b0bOMvX
	Pv/AkqEhucs+JIlknXzkIM063Sun0F3wl/uhmpadS38m8Re+9P72r4NzgaJ59CQoLMTjyNT88A/
	yJCXlWZcKwMyt60ZTy+W0ox2/X2Wj8FeDZfzgFviLjbhMeo60gwE32i8KKr+ijGA90Nqb1KnLQa
	wTAEw9I1Un8UhIAQf1T7SLHyI/LDxjREiRFQdD2Kejqnpa778wUaX2OILfnwlbF1y/wKve/uJfU
	Y=
X-Received: by 2002:a17:902:da48:b0:2a0:9d0f:b1ed with SMTP id d9443c01a7336-2a7188be6f2mr23864905ad.24.1768560103587;
        Fri, 16 Jan 2026 02:41:43 -0800 (PST)
X-Received: by 2002:a17:902:da48:b0:2a0:9d0f:b1ed with SMTP id d9443c01a7336-2a7188be6f2mr23864655ad.24.1768560103166;
        Fri, 16 Jan 2026 02:41:43 -0800 (PST)
Received: from yijiyang-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190aa340sm18009215ad.3.2026.01.16.02.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 02:41:42 -0800 (PST)
From: YijieYang <yijie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, yijie.yang@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 2/4] firmware: qcom: scm: Allow QSEECOM on PURWA-IOT-EVK
Date: Fri, 16 Jan 2026 18:41:28 +0800
Message-Id: <20260116104136.2922032-2-yijie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com>
References: <20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FscIPmrq c=1 sm=1 tr=0 ts=696a15e8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZmGgbmymOzp8U7yWMvkA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: glHrYwwVhgpVSwDB0KU88MPYKcBmYUPi
X-Proofpoint-GUID: glHrYwwVhgpVSwDB0KU88MPYKcBmYUPi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3OSBTYWx0ZWRfX+UzllqcGhKr1
 luXqNNJgNS5M0p2FAkNPipEnL32qNeN0VH1QnY+fakW13Dec8s/XcLLKA3sVyfo8TSEMwoUJj8p
 ycToqxh2EkUF1mgGmrcgdtvKbNf+TMfbdkyZXUv2QhJn7W1JRSgNWxsUsg/M0bqKloWwKc9PsP0
 UpeT/ay8CO+WH+zygWfZpFqK4LFc8PVKKirQiceN8Ui322n1urWO0yDp6LB2pL2cxrMS0lMCtdJ
 xt5cz3hxLmTw+p5A8wtrYiIy8c44fbcbX1yYOmwptYvvwgZYYuo1k5jodjMByu4mSGOf9GDrQcl
 gY2G08Gardeab/lOyXxzg1hnpe++xF003vUT+lOn4aRTb4eXt7q2VLCMMfCldU0lZTZ+jqXB2nU
 b2MU0g5v5J5GQsNXxHGfV8gDnzWWOGve/bf1HVrRpqkAWKKe8dNKKn/OoUcAHm6qV9E+sOQNVl4
 XrEwFsNv1fYAb4oUFow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160079

From: Yijie Yang <yijie.yang@oss.qualcomm.com>

Add the Purwa-IoT-EVK board to the list to enable access to EFI variables.

Guarantee that subsystems relying on SCM services can access secure-world
features. This change improves reliability and prevents missing
functionality or boot-time issues by making service availability explicit.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 1ced6022c716..9a046b09275d 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2022,6 +2022,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,hamoa-iot-evk" },
+	{ .compatible = "qcom,purwa-iot-evk" },
 	{ .compatible = "qcom,sc8180x-primus" },
 	{ .compatible = "qcom,x1e001de-devkit" },
 	{ .compatible = "qcom,x1e80100-crd" },
-- 
2.34.1


