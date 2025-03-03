Return-Path: <linux-arm-msm+bounces-50253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC47A4EB12
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 19:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 967B28C37E1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 18:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE46297520;
	Tue,  4 Mar 2025 17:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hX7P9/Jp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from beeline2.cc.itu.edu.tr (beeline2.cc.itu.edu.tr [160.75.25.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA152857F5
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 17:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=160.75.25.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741110624; cv=pass; b=ICdNpF6/QzAftswCVTLLjUimgEuSX+60xaDDRZZvx2kOrjPt7xDULXQOMZhBIJk5agZ+tV5GkkVBlQ3cDcDDig3BLIkHJhvub4Z8hNj/7o16nA5UoaOtMHjMioyxvArguZFRvntJ7a9Z6eaIdKzK4wk1Mjlc3y1abpEp39nKl2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741110624; c=relaxed/simple;
	bh=W42VFbcHM6C8HgZoC7QynK+IoHwG9vv9+hfbJQmY/dU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NzZ8wR3G7EB8AWpQmdMFC3UtZhJx6foiTmmz4hzZvE+zQNexSFDLmDLYiM+2lPEHMG98GV2fpBlW6aJDysz1ITlB1o68DEya71ourpndIpQWC0pKdegu/+6OQwaRhVxVJJ7Us6pi69ux7FHWbSonz8dh8Irj915uodNinvW7sZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hX7P9/Jp; arc=none smtp.client-ip=205.220.180.131; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; arc=pass smtp.client-ip=160.75.25.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline2.cc.itu.edu.tr (Postfix) with ESMTPS id A79DC40891B5
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 20:50:20 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hX7P9/Jp
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6g233wppzG184
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 18:43:23 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id 1905A4275B; Tue,  4 Mar 2025 18:43:13 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hX7P9/Jp
X-Envelope-From: <linux-kernel+bounces-541836-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hX7P9/Jp
Received: from fgw2.itu.edu.tr (fgw2.itu.edu.tr [160.75.25.104])
	by le2 (Postfix) with ESMTP id 8CB9941A55
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 16:40:03 +0300 (+03)
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by fgw2.itu.edu.tr (Postfix) with SMTP id 3FC162DCDE
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 16:40:03 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A1F51713C4
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 13:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5C03212F83;
	Mon,  3 Mar 2025 13:39:39 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8F9212B0A
	for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 13:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741009176; cv=none; b=OIMsBzMxMNfqZnfRrI8TceT1ohGKyNnRZ9HjfNx+kbcYY6O5Xiopj8C7948FwVo9LRZXPcZvSmVEHRAJ/1uGe2ZSLozSGIOasgxFF1K1gAwu9Fw3XXBe7mpfu89hEgX+Z7QjhU2rIxr2W4GrZnCCVhvMapd1Q5qI7w/j3EplStI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741009176; c=relaxed/simple;
	bh=W42VFbcHM6C8HgZoC7QynK+IoHwG9vv9+hfbJQmY/dU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JAmg2sDGVawk2rms4XD/+e77gvIMbI2ywVK4ccKU6U7+/jZyTqKD3kfVjU44alEx5BdhA/Rth1xKyQNjm+hfCO6qgc0rdcYfIiFlU8qBM0NQKWPSIHLZ9HaPUdbWllSiWwFuA0fryNrBhU1hqkViGP8hYLi/grnPJz0Mxn0hieY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hX7P9/Jp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5239WmcW028371
	for <linux-kernel@vger.kernel.org>; Mon, 3 Mar 2025 13:39:33 GMT
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
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453tm5n2rm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 03 Mar 2025 13:39:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22368a8979cso52291675ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Mar 2025 05:39:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741009171; x=1741613971;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nIQVnwUkhcucJ5H4WOAoDosI74zNR+7bQG2dUOq+y6g=;
        b=YjIY4bCZ1IgqLef8eVo+jz2jkg9ik5Xh30mkpORhfGI22VJqo5Nu9Sie15mjeqCu37
         kXe0RbM4zxJwtcvlSsY8DD6j03nzid3sibrzIvKWf7IFeOsYPzERqyI8HGBAR43KdJTK
         tvbUl1oB+96FwELDnRXr1RGHHxlH8g6B/t13P9GFy0q1k3JwTbqjQqwhKIwNHAlSPVCw
         uIiLh+sSypBBy9Uoj0uyWGNOoWNY82UuIW72UJk4hoVMXpRYhNZpVVc5AEYDp/sOp9Yj
         3J26E0CLTJupdoHORGGeCh7cym99rx8hvW6Z9PfLooGAzOxopOSiUOMBrv0ZjhYfKvnU
         3k1A==
X-Forwarded-Encrypted: i=1; AJvYcCWAPNZbH7KoIqIh2yj4hHq/UBv47yBkybvymjtnF9Smpzw+GDmAq4mlruxJYUtPecAOy9uVehlZpNkf0XU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzokllhAOHgW1MKa6qdT6ezqukQHl9UDs0OeQbaT1AxicZprsha
	vGOb8ReL9ZeaFemXegsYnbGkCkk7kdn6ApC0QXDd+eQGGNuyBrprk8PFMrlCAD7QMu1DC7CjPnQ
	ViMN5Pgrn9PAKqZ00E3ziGQCJ4ZkXAFnU2Izy9ouCgh5xuAeCRJ5k4THiOLsNV5r7TtjX+5c=
X-Gm-Gg: ASbGncuf6mAlThlz0hDRYFPcKBO4YSomeUgBs/TqAPjXtlQe1L7vsUntKmHJ52fwVts
	jHmj5QgmlcfQ4zNfqLxlZ5kTLWEtUMGaL7Ik5NYEhXpZNe1AimAfAqp3BCaRHVnJqc3Wg0fjEya
	9fZNJcFDSuFwMLzuy1KZiNWHiCuP0H9sNNs6cq6LA06fQyGarVuHr9dMCYZE6U9SFVdT3x7fxbf
	qboBxEdnWpfiPZph+fC5lJFOrk1s6YJ7752gcURnjxTZFyBVLw9zCuW5K1D5Y/gP/fBa8WTeX3W
	dAi4jDH3m+reefLr8vgiya4Dkyd30F/FZ9QQReVvqNlvpXN1MPjm3Z2ZVgUxHjJZOvUgEEjVVZK
	s+6SwmIyQDCzglpbDwnnfZb3dk2yDqomHURIYU6LIaiRFpjViK6g=
X-Received: by 2002:a05:6a00:1395:b0:736:34a2:8a23 with SMTP id d2e1a72fcca58-73634a28b2emr12020351b3a.15.1741009170902;
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
X-Proofpoint-ORIG-GUID: ve7c8-xm56wUz_6V5rIdUrpPqaqLKxw2
X-Proofpoint-GUID: ve7c8-xm56wUz_6V5rIdUrpPqaqLKxw2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_07,2025-03-03_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=858 suspectscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 mlxscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030105
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6g233wppzG184
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741715298.06224@O1xiN1xpEOt6RrOGfVKQtg
X-ITU-MailScanner-SpamCheck: not spam

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



