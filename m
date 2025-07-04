Return-Path: <linux-arm-msm+bounces-63688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E670AF9197
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 13:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 333113BCDAB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 11:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4C6184524;
	Fri,  4 Jul 2025 11:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EsZVIiTY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897102522BE
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 11:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751628646; cv=none; b=W8PXKwPp2QFynFs6Dqz0ELLlC3yNb/1M5nERqBpKY5ujqwwmbnUmKm3Aqvv0SmuYRdS1ZB7eamKHa1TiD/f2CpbtQN4iMlUzFt+Pn8uznQgPsrQZ+xA75JY8OPDDuzcUpVJuVQopdaOibpCUVmPJpV/2xkxsUI7MAvCB3wz/+Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751628646; c=relaxed/simple;
	bh=3Am2Cd1VOOLz9RfaU+/P+fOLxMsEKbxd6wVjp7Wl+JU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TJ7FDVHN+cRppbgMfm4baV8pmSx9E1LmSxidbnpcaTNXHD+k9IGevCSI/aLWWpwyPnNeX3EfYHO9Lu9TfTyI4Pm1sD4WCWumw6D7qdHXu2OWY+y0sHHM35XQLaWQdaT8Of3HKLfSr+c6qo4AmoHergUd66gS4faUvN33+SolZRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EsZVIiTY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5644EYOC013864
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 11:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TRT/1n9Uj6hl0JSHIwiesVxFk9Y13Rj5QHc
	z9Wen35g=; b=EsZVIiTYwyBVrUqRp1t19DxCNCfddOOP9hFKAdzwyoRdU5ocQrG
	mm7X+Iv+EP6d5vxS/YKFNAcs/wwsd7V5w+7Oe2Gi1VNAR2GhQN7THDDVAaFKnKM9
	DVewZUf388rO47zchyQCs85CuIUhJ04cmPSca8NLzEvqrCMiyOffyhueHTGRfbEN
	LmUAzDhtT93jNBk9M6O4c27OAjPakryVED+PB3XCMZe+c8LMGwvH+ZTEMzB8Z3zD
	/DLoFYqV+S/BEMPAK5/xP+s9wQk+gCTsIdpFTkHjGQZIIw8aQtgObo84iGw/zzhV
	ASQTGLSZ+oPX2G9CZtzXPaOghYGnRP8sQ3g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mw30guuv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 11:30:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2349498f00eso17392565ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 04:30:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751628642; x=1752233442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRT/1n9Uj6hl0JSHIwiesVxFk9Y13Rj5QHcz9Wen35g=;
        b=XGWQU8WlsZSw3s8MM8y6J0E2baE0PiK8JVmoxzMEVOuaACqHa3nj3VFrYJxNwlUEXQ
         L58M3x2PRbF8cnizYWaHWQkfcE7s6MU3cZeh0fWxdjUBtP0nfcNXJzf4UA/dgkYtO7Nf
         lfDxeD119m5+DBKjPlL263dK45PEBKg8hdFsebr8A7WCOBhdQj7ZQsddieSe4cusbjc5
         t37dxOtJiV9wq2ufSUOF8LDq1zzkbsXBfElpxuF4LFs8ltkdQ0T++nHd+bi255SI1VxL
         hvZ2bcC+chTZg/VhtE5zi0u4JUDZpTQlPPJov50Qz47rMavYx3sneE78wy0ytVCmzCLd
         L/dw==
X-Forwarded-Encrypted: i=1; AJvYcCVcAzpad8T0VpN3KRevEHWVxTW/wUxU0NYes3SiwRUXxfkNknn40cvRw0JchynbmCm3nxfLhrKD3VCIGmxc@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9QnAqQCVAU2LASVXKYAk6EYo4xnOqzeHdVKu3i+oVLID0Mkhg
	ejy9EOtM9aK3KoF8evyNjWdH/hN2zt5XbziZ3f7sv52IxmNqrDOnYL84yhMhEN60crcOFl0AYQg
	Q2VtBUDXYXSNU0pAlx+DeI8SJRplulxJxf+Ae7ND5KOKoIUD3w+GtSsJJaDZdFAk2awRc2vKT8D
	c=
X-Gm-Gg: ASbGncv9fwELf5evM4pLutDaF3uapP0Dk/jAw34zI4/dMm5g6V59R5gGxYDWabi9I0W
	4OW6rFIVr73/cTDLKpnHpb/YD8pDe9e8NtNggw4gB4USAF9Spp5kuNCu8iX0jtmOCUk5U961+hG
	RQsuM4q9+t5qQxOGX4FJ16nAeRFvHEIREUuGsiaZ71WUspmBWIHQ2dqUnc0bj1ioBVMV+q+IB98
	XMw0wIFhXbkZIQPbKQn/G0lh4fJ7kGukb5JByjtHCdMVyHjctQg9OU9i/35Oq71Y7gdULyvsH7D
	Qy5xOytxfOfAR+qgmXTGzSj4VhWNqfLrYG+WXC7GohRA1Xlq0Kue
X-Received: by 2002:a17:903:298d:b0:235:278c:7d06 with SMTP id d9443c01a7336-23c858ac2camr35630955ad.8.1751628642294;
        Fri, 04 Jul 2025 04:30:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgveXe0/YeKWEfOQKlimaMpMFKvBsskf0SziUSbDx8nOrhY41iGmb2VeU9JAOFPCpbCoAhQQ==
X-Received: by 2002:a17:903:298d:b0:235:278c:7d06 with SMTP id d9443c01a7336-23c858ac2camr35630505ad.8.1751628641873;
        Fri, 04 Jul 2025 04:30:41 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845b4f8bsm18221515ad.229.2025.07.04.04.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 04:30:41 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: rakesh.kota@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com
Subject: [PATCH] soc: qcom: spmi-pmic: add more PMIC SUBTYPE IDs
Date: Fri,  4 Jul 2025 17:00:36 +0530
Message-Id: <20250704113036.1627695-1-rakesh.kota@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CY4I5Krl c=1 sm=1 tr=0 ts=6867bb63 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=X0g3_YmebwwKsQmXG4UA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: VMPS6fZ4ZSipVxYIsUn3s4JiIZ5tXByp
X-Proofpoint-GUID: VMPS6fZ4ZSipVxYIsUn3s4JiIZ5tXByp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA4NyBTYWx0ZWRfX8aBkExkFgoxV
 ZbWSM+y+NzmOxznz9d8O2WfbYYsZRAVx8gTcwFfM5NccX6oc9AS8Hhbhw3b5BmQ6jtKJ4uJb1/N
 3o1yBLOU7/2a1Y5ooZ2uXWThl9HOqxqGzmYv9Anm0LDuw1fmWWiton/zOEzZaXpVrze1qTOtGz3
 j6MBlAMndHmbbaA34BluhPW0hdZBirLqAfxub66CwK8oOsh5g4o8gL0j3wu6gUhDut6cyJk4now
 1MQN8+TsOB1YNchdHx90cubxpAZycDKjYibBMmVH4cIx+8EvhPRVqjIJajqDA5oZiHpfXA+xoji
 D64ozrIDcFSO6k88ekMwY9KBQD3HmEGhMcmfvpIsA46Kv0597UcCXsfB+SNg5gM+VnDqj0uTRv8
 OzANyXdSwNwAEr1lhjRsa9kOYR4lfO4FlUYURXY1gdXHmLX5onMsoYCjV+DeTf1fA3AMMrca
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=710 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040087

Add the PMM8650AU and PMM8650AU_PSAIL PMIC SUBTYPE IDs and
These PMICs are used by the qcs8300 and qcs9100 platforms.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c        | 2 ++
 include/soc/qcom/qcom-spmi-pmic.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 8c4147737c35..e975b30d3ee0 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -126,6 +126,8 @@ static const char *const pmic_models[] = {
 	[72] = "PMR735D",
 	[73] = "PM8550",
 	[74] = "PMK8550",
+	[78] = "PMM8650AU",
+	[79] = "PMM8650AU_PSAIL",
 	[82] = "PMC8380",
 	[83] = "SMB2360",
 };
diff --git a/include/soc/qcom/qcom-spmi-pmic.h b/include/soc/qcom/qcom-spmi-pmic.h
index df3d3a0af98a..2cf9e2d8cd55 100644
--- a/include/soc/qcom/qcom-spmi-pmic.h
+++ b/include/soc/qcom/qcom-spmi-pmic.h
@@ -50,6 +50,8 @@
 #define PMR735B_SUBTYPE		0x34
 #define PM6350_SUBTYPE		0x36
 #define PM4125_SUBTYPE		0x37
+#define PMM8650AU_SUBTYPE       0x4e
+#define PMM8650AU_PSAIL_SUBTYPE 0x4f
 
 #define PMI8998_FAB_ID_SMIC	0x11
 #define PMI8998_FAB_ID_GF	0x30
-- 
2.34.1


