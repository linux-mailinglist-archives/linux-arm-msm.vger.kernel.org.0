Return-Path: <linux-arm-msm+bounces-50006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29202A4C22D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 14:39:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35D8C171485
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 13:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C924A78F44;
	Mon,  3 Mar 2025 13:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hX7P9/Jp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A96C212B15
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 13:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741009175; cv=none; b=us8nL3MK8sznuXpbuYbvigGl1YvTsGIe1YQOzWFkYdEApl2BUMrPQ5fZHNaazn9vXAA6uWCTooHI2ReyTyupmK+d3amtdlH5hYrh/VJs1CzO7pyJkwciWmaCQSVtcvSniQA3+YQAdimEtxKWK0RzJ+RC3wTAAYcqzNNZMZGqsVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741009175; c=relaxed/simple;
	bh=W42VFbcHM6C8HgZoC7QynK+IoHwG9vv9+hfbJQmY/dU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=t8W/fh9I/sQdvbpDJ8pJCDIW8Bq6qsioviC4YAxgUfUHPgG3RAqaZ63Vo1gu4OdYHetEctN6MCV71JM3DNgzG5IJErTqECnvBgpDhoIxAaubQF2+IicrQqkMo2TzHySouuOqRZ9rVWF1Uvv7MLtPQgYBqcPSqW3RPjExL9LjbTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hX7P9/Jp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523AaHQ8017350
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Mar 2025 13:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nIQVnwUkhcucJ5H4WOAoDo
	sI74zNR+7bQG2dUOq+y6g=; b=hX7P9/JpXtq8Bw8UBWc35JBKUJ0MdCrPjAtwWa
	AqUwoi6dCkaE7HFlJkuNQltmwuXx3tZfCtgyne5P7vuK6xT+y7ZF1O9MVKYfergL
	B9mFLQU3bn0UFiIlJdsCxN6XWC5YGWroc0VO/FsltQZTVNn5GIhwnUuRRivrxbUN
	vOI40Ona0QfQmNg1L4zE8oZRIpXCGXfgeOtH5FJxbju+YrSg6hUJykzU7x0IR259
	vFkukdQOAZkv6CKWEMvkvsyF+iqJbF083VwdFhuF/KtHaKKv8Niic1pq+RwYOmtF
	EfRKVoimXJ+5Z+YQANtS9ynbYwzSX8JKE4Ah5+BiCu3Gg6xg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453t95w37w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 13:39:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-223a2770b75so26038895ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 05:39:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741009171; x=1741613971;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nIQVnwUkhcucJ5H4WOAoDosI74zNR+7bQG2dUOq+y6g=;
        b=aEanR+ZF+rbaFC66veXKKl3vVz3QX7uQ70IxFcO454ZdXGcAxBMGP9esGbrwqAR+JG
         U9n+2d1i+5x3W8iIiiY4eVK3TqkeTpNX5uoAWphmSEoe7gxw63s6NF4pWInM0QeEmvoe
         ktj+n5I5rKJuorKd5ZsVp1VXLox8bijzkWYTjCutdt1VWQ9nEytGhgmP7Ay8hnFRPFQ6
         b3koM/sj0YJQXUM6QseYZgUhulARX/PPahh39pQKNWbgu3WAkWMwmjEkLVMbKkHHfJ5U
         5S8np8RxPxte6E8UGWgjSuXz8M1krka8zysyzmsC8PHkBd0TPSLk4QRe5e2BnJJDv64C
         ZdOA==
X-Gm-Message-State: AOJu0YydG2HfFLxcIly62IBjpwz0Sbm0g7NN3IW5YceAJrtBKzHWVlg2
	XdG/YgRRZx6ogPs+274eEkBI4l2Y9U+ATlwFv6fFk2fcWRPmKD2hHW0ATqzHAeLI4P9UFYBFbzi
	b9qxWOt7FbQHPfESWIXtlc36/NMai6vLILSok1wkZTLy45YM/xr4bGpO1Q7IDbsmHvBl/j60I
X-Gm-Gg: ASbGncui6u9Trfj1HDfYPnYUQ9C0aPQj60rbYPEyIiNUxgh6oUaGkSnviDZ89vyEcIT
	6F5SuE1fHFsoIakU6GF8awTJVqZvDivy0oJUm7VCU6Id5LfGj0DrxI5fWPZM5aw3ibyztupcVKv
	160W4e3xUR8nSfJ7tWmc1U68Ic7uXGT3gE/Pck1L1TGRQwf09uYkfET/dfgegro5rmk8A0xZiFL
	GDKXEjCbMK9IVy9fTCD6cYD+BMVL/fssjRKjFEAxqC/vtgtEC5RqHttQmP0ubygFzrFbjwN8SZj
	R3bTLh7Pfn1NmWvisLMbbo8eqaiPgdrsOqDFPu3DDQON3Z/Zz65mhLQR5871Zig+z63+aQGOUx9
	Hgd+t+dtU5MyOE6JFFW+GqEbH3di66iLICkvvn9QTFdU48LI4XSA=
X-Received: by 2002:a05:6a00:1395:b0:736:34a2:8a23 with SMTP id d2e1a72fcca58-73634a28b2emr12020352b3a.15.1741009170910;
        Mon, 03 Mar 2025 05:39:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGhCNCrjRuRuCl022cqkXQEPD1tlSMudTTCp9392WLz5n8Bj4Pqwey3S/sR07jQTUFTopqirA==
X-Received: by 2002:a05:6a00:1395:b0:736:34a2:8a23 with SMTP id d2e1a72fcca58-73634a28b2emr12020313b3a.15.1741009170425;
        Mon, 03 Mar 2025 05:39:30 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73669aa1497sm221264b3a.92.2025.03.03.05.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:39:29 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 03 Mar 2025 19:09:26 +0530
Subject: [PATCH v2] mailmap: update my email address
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-mailmap-v2-1-4a325bca941a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAA2xxWcC/2WMwQ7CIBAFf6XZszQsVKme/A/TA6XUblJKBSWah
 n8Xe/XyknmZzAbRBrIRLtUGwSaK5JcC4lCBmfRyt4yGwiC4OHLJJXOaZqdXJs+9MnhC1aCGYq/
 BjvTeS7eu8ETx6cNnDyf8vf+NhAyZalohx8G03PRXH2P9eOnZeOfqMtDlnL9J4ZVwpQAAAA==
X-Change-ID: 20250303-mailmap-39b7c161741a
To: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741009168; l=1473;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=W42VFbcHM6C8HgZoC7QynK+IoHwG9vv9+hfbJQmY/dU=;
 b=7IbBPU3YePa+D/g1N6+Mtj+EdOl4SVCL5ns1KKzYNeLsNBAjAbjnZDw4SnvbZwiCbwCXzjek7
 dWRCFz1lQs1AMy9940gsuK3X07u3gPJSgvae1budABX1pXXp6B9cyYj
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: gy-0tGRJV1LvVAvNatUUE-DdukEKeleK
X-Proofpoint-GUID: gy-0tGRJV1LvVAvNatUUE-DdukEKeleK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_07,2025-03-03_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 phishscore=0 mlxlogscore=858 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030105

Qualcomm is migrating away from quicinc.com email addresses towards ones
with *.qualcomm.com. Incorporate the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- added linux-arm-msm in the TO list
- Link to v1: https://lore.kernel.org/r/20250303-mailmap-v1-1-74823fdc80cb@oss.qualcomm.com
---
 .mailmap | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 01145c078838bf9348e8d0e5e48b7b0954248dc5..928bcf4e45bcd0f6f8d275b59ef876fb3581a108 100644
--- a/.mailmap
+++ b/.mailmap
@@ -381,7 +381,8 @@ Kalle Valo <kvalo@kernel.org> <kvalo@codeaurora.org>
 Kalle Valo <kvalo@kernel.org> <quic_kvalo@quicinc.com>
 Kalyan Thota <quic_kalyant@quicinc.com> <kalyan_t@codeaurora.org>
 Karthikeyan Periyasamy <quic_periyasa@quicinc.com> <periyasa@codeaurora.org>
-Kathiravan T <quic_kathirav@quicinc.com> <kathirav@codeaurora.org>
+Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com> <kathirav@codeaurora.org>
+Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com> <quic_kathirav@quicinc.com>
 Kay Sievers <kay.sievers@vrfy.org>
 Kees Cook <kees@kernel.org> <kees.cook@canonical.com>
 Kees Cook <kees@kernel.org> <keescook@chromium.org>

---
base-commit: cd3215bbcb9d4321def93fea6cfad4d5b42b9d1d
change-id: 20250303-mailmap-39b7c161741a

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


