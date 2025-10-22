Return-Path: <linux-arm-msm+bounces-78323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA724BFBE49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 14:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B8B73AB393
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 12:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B43280308;
	Wed, 22 Oct 2025 12:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pfVvjU1P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE1E33C52C
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 12:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761136874; cv=none; b=mj9b7CrlEeuf4kX+uiW9srYiztv2rK9iyyricUPotlQXG/R/NDG8FXglP3mEWSRpexrHiHUaJtj3PTPyGATWshvKaeOJysb+/uEfPFBWqEL50nPFQFKoyCqGzrzJUsiJ52MNfn3M8vAeR5mxb0/1sPyui2NVSHSbidYIGrK5X30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761136874; c=relaxed/simple;
	bh=6pJ9dnMSsLKZDxpPNzBow+hyI0DRbC2M7if5g38+jas=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KmmZj5pSK7HWv07fpsgBUgxLCM3lXKhRf0UxyLMAwDbyKWLdM6k0QEyx0fsGNbXK2ktlj/g1VDJf3czaJWIwUw7GZXLCD9rR28qr6KEWyqhqL6/+D+FZuB/M8N6qVzHK5yZ+6nrJRdvHBLWqfab5drqy3EX4OccgdpweSYVqpVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pfVvjU1P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MA5ZoZ005410
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 12:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RfeB47HT/QiUsh1/oI/2Si/JRWwIwPFsYvk
	n2bnCrfA=; b=pfVvjU1Puhj210Xunm3F+HooWC5NkWy44nmwuuXx/Wrr0B8Hd1n
	WitlIhtMgQLaMxgUPDduF/HWN9G1aTxdoHMEakAIPIrX5AXLETOw6pZAmmAM9U8/
	fkG2ALQnvdNzJhJRra8Zvelp7xJrl3flPacVrZ+AcHmSna1GA13rPYJuiu5i/uS7
	kt1lJQFyaHRNPqbhIWGQuF5yviryoHH2Fjve51v0z7ZyJuIciOjfI0j+xDrLzvd/
	PL7fyP/1Tabwxj3xakPdH6kpCHLdwJwSf5mwihW7GtlGTi06LzFkxb6z+ZE3fuDm
	8+d4HaImfsySfnmFM5YFtjLwpHWnfi4rEQg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfmk1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 12:41:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e88ddf3cd0so36984931cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 05:41:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761136870; x=1761741670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RfeB47HT/QiUsh1/oI/2Si/JRWwIwPFsYvkn2bnCrfA=;
        b=JNadpToWen+eyzs96CBz+nRRLNo5plHvQpzVmGEz+TIgZ2Bm0/Ar1nbtrv7XNW1qG2
         7H50OnI+nMFYgE8dnXtVicqUQysryP9HKw2mNTbCjob9fr+Yp+NNW0Zcmm/QaXz4muKt
         juPe6GsVMQsoBpkXDyyqex+IqzKSP4hsKmjZO+6XxclRNQy++CRHZDQsrhZ74+4BKNSG
         K/YStPRViRXYBgIiQd3KnzchpZmfjeR3NAgsm7jd/lytgkXHSH/H3rjpGOtAayz0PLnZ
         22ON5/+d70Yn05ZvI0pw4lmo2Mq6tR8utWAYO0vCdn+Ajnr2BEDvvSASztUZMBbu5k4t
         h/OA==
X-Forwarded-Encrypted: i=1; AJvYcCULqTVlyv9Cm/SG0ePGqvXGuUIWSRVlClX9Kafywp187iVxasGiJ/HNAf6EMEvWXgYz+waKywPUMIRX76bw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+m3xUjwTC/Vt4SYhO+vebQLKSXFNLgzFngkONUNS16wMEzhLm
	SAxtN2fVQtjZgJAmYZGqY5diIlobpxcLTGA87vNQ1/YCuxw9xRIFdbYxHK3jwjnUQtfxpqSK6nm
	Hn7TMLzjDvtmearBEEWoHtPgWGboHEPAVpAs2/lpbdei77W6WZZrdHVqaNrfxdCWgHKtA
X-Gm-Gg: ASbGncvkg2xcmUw9fiUpSZ1LDaTkLsixOjc2scWFdXec22vSQ5dbQVqikEQjloep69+
	k5rL9qfovPexrdUD8Dq3mLsQEF+2IqCcR9teSepqrRH7ahEm7M1znXPCxW5lWIhHjJX8vHUHDdz
	l8P4h5xeXl6FnbYOJtvvJgbbY9zRn36Y/N0VGyY9dca1zEeL3ynNfd0gcI6gBL8OZ0KcYJxH2kZ
	0+M4x0YDLQZ1pRpugM2txo5V6KaT0YTpL5KTWecKNXCql9a8Vsi+8avUQmB7kdQM9XTq2/MALBM
	kN25vhsLBQBj+jzegpSidTpTgy4RuMNvFXOZKAh+EpmhYCZBxynfnGGxL9kv2GGpkkVcN1FtUkT
	jHgvVFbDP/2BkueZ0u9wDFa5uK3i2UQUWCEYYquA=
X-Received: by 2002:ac8:590d:0:b0:4e8:b8d4:a79c with SMTP id d75a77b69052e-4e8b8d4b387mr164900561cf.80.1761136869213;
        Wed, 22 Oct 2025 05:41:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqCfqyUzXWxiXG0l7vjX+HSWH2fQ6hXaF+mWu6DPoEfJooEHAYpGwfxJnETVGQVv5KJ8VGgQ==
X-Received: by 2002:ac8:590d:0:b0:4e8:b8d4:a79c with SMTP id d75a77b69052e-4e8b8d4b387mr164900251cf.80.1761136868622;
        Wed, 22 Oct 2025 05:41:08 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65ebb4ae4dsm1315965766b.74.2025.10.22.05.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 05:41:08 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Fix comment
Date: Wed, 22 Oct 2025 14:41:07 +0200
Message-ID: <20251022124107.3712466-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vwJX7Zcg9rWSg5rq4DKBGYrmz-JMFwBV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfXxr68uSjGfUJ5
 GHSfWvZH3hw38+8QiKfZ3DQUgMqZHDSNrGv3EE2ycG5gaisEqvHucSq0qN9wIJbpotUXvxZjU1x
 nPGgc/9/H2bqiqHX0cqU2M5O1ewf51nXOnen8j7vNHBlMzsd6ajUPrECEgI7jS/TuQ4Rz4h1AXQ
 n9Z4KB7AL0t2DVl1Ib7cCd7RA8UfLk9S7MIt6sq7S8b2Kmfsh7HYixubOcXVDsp7sNWdZQ8My05
 GyrUxL18U4yv0z7da7eJmCp31l9C91VYj1s6wcyryZ+XsL4ciINK+OphzI/FhC/LkPQ52jmx0I6
 OvXJ5GQ26c+5P/mxQSTPpoDQDvXUGbCQUttbzILkv5kd4AzzVKTs6BkBzYr9Wfttzb0V4Lnhy8Z
 lZ4/5Zf+75RMa5PfSygaKitO4AiSIA==
X-Proofpoint-GUID: vwJX7Zcg9rWSg5rq4DKBGYrmz-JMFwBV
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f8d0e7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=jbbOOnZT4aFDcoY3tVQA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027

From: Aswin Venkatesan <aswivenk@qti.qualcomm.com>

Replace the word "Qranium" with "qaic" in the function parameter description.

Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index c4f117edb266..8751b5381d27 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -1941,7 +1941,7 @@ int disable_dbc(struct qaic_device *qdev, u32 dbc_id, struct qaic_user *usr)
  * enable_dbc - Enable the DBC. DBCs are disabled by removing the context of
  * user. Add user context back to DBC to enable it. This function trusts the
  * DBC ID passed and expects the DBC to be disabled.
- * @qdev: Qranium device handle
+ * @qdev: qaic device handle
  * @dbc_id: ID of the DBC
  * @usr: User context
  */
-- 
2.43.0


