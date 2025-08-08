Return-Path: <linux-arm-msm+bounces-68131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DD2B1ED29
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 18:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8153B188318E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 16:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7511A286422;
	Fri,  8 Aug 2025 16:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QbecY7Go"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6575287512
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Aug 2025 16:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754671479; cv=none; b=ocWrB+iVW5S8hcyp6r0/WFuxKcaxnbpePMGc32UKuBA0tfXQGL06C4sgTLkBlwzLWUY6aYQ4CiFbv9t9yN5LNNCQmUQ/BYSXJU14whsW9BKzAvJ3zrwLcqHAdoyS5iomyfhte/G4era8QJjY5zgp1LWMsuMW3YQz9n8GoQM076U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754671479; c=relaxed/simple;
	bh=EqzL6rRNfDoERryCSv/CIEvhiAVHF+Sgc/VdogwlX2w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qT2aBmtjxEg7AuaUaC5xZxTalDsS05B9xuL7nvyeBwOhj3kVT1GSBdGJSpNRuVpWkFrzJotMukL4Er8eSIWKdSMHLxYtAtifArS6xIz4TBXzduNwwqf6I2QCaoqrPrqRUTRixm+WBNsaq0kWztwmO7pdLDkswWbmukvIpyBFtAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QbecY7Go; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578F9kJg007961
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 Aug 2025 16:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=huQmaFeVLUaz6BrvOTgjq7zFoIFLwTBr1MX
	tCtGIIfA=; b=QbecY7GocBo81F2WWovpuEGiFoR3MJTiATy3z4eN7gM0iq92c2t
	8hm5m4TBvHIH/DRuvSh7R2lIsG3BGx6RkE2xqbb+GflXOmEaGlnM7OIB0tz6Y4rY
	1wwlyFdUaDgU4NwIIgDh5b/N6rMJoqV3vVX/XpkSSF+PsiBq0bOkbOwlGUMAF70k
	004xSI3QGOLF4/u0nnwwX4+eiqdvSRLZM/1VLUVMZPw7P/DCa9RulJrxYjXGhuu0
	tdD5Vs2G8rLopoxZbYa38BBbewMpfxXu/V52EKXNANcDnsXDXLnSpmZB86quwVZJ
	uBruZwBikLFDgclQUetSznREQFtj13jyHwg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy72nun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 16:44:37 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76bd757bbccso1918379b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 09:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754671476; x=1755276276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=huQmaFeVLUaz6BrvOTgjq7zFoIFLwTBr1MXtCtGIIfA=;
        b=otEwQZDXLIR5CG3W2fRR9WpZ+/nBUNAnN3tOEHoieszHtCV8qJu8jkVwBum/U5naHF
         bZlNXMqrjrMVcZTsRxiiWE3RmUCeYyWT3Gu/sQ+bZUbki8t/wkFXivEpatOD0CoA0tyW
         4Twcw8l57+SZ8MUcHhi1TDLiWCGSW/UyPRE2DMGMKJRIq/v4Xj7z1MfYO+G0AymWfX6u
         gsnPE6911+FBgbAx4Y+jtOJC/vgmJ148nN1lXdqmPlNxV7zGfvO47AumFgnZ4ZNeSkOx
         F+IPIqbXiZwoFCPAiJH0kmZeg2n90Jd9J/AbF0+uOuY6PwQPGEBe4FzWYhoQZc8de8Rb
         nxrg==
X-Gm-Message-State: AOJu0Yx0HfePmu4rLebovO733M20F3KvLpXyiYXkGMz5Io2TLAhBzvuT
	YomimOD/X72uflQhItB3HmJkaW4yUWQPJoHq2p1TsmYtfLS7l2+7BTv9Kx+SnjYszOwqcAfvo66
	Tb27WGDknQ1LSwMdEyiUwTfdFwFw6acWVbX5Go3W7jpleh3g5fooTGeKjjyk/mGXrdbgwDtEgAR
	LF
X-Gm-Gg: ASbGncuOYJY1LPiI5gmdJFhzGIY1t+lvDRhGSM0VWDcwHYAYxXfkjshycPprojiH50U
	BzSP8llVYf5pgw/mIMzO4UcHJRVs978+sdrkqrdrdhMemBkNnz8nYF50/fi8WaL8Ac/dhdI1hiA
	sFz3bE5ZC/hmdApAJNUG8Zt6kuU9o8bW+Ao4h+E1z4i8ttDlr+sUk/1VZkYbOgm4FdAF78xJSdI
	fJe/aRLZSirUlFmYjBiMeZMTe9lfvUexJDj76qA1I5nyVJazpUYAvy9tcOrBf5AoQg6vIzS2pWT
	OipDivBX6XznJQpcsbUPUK/x3FSG1MJ84CPax2XXsaXJqyxb1uutXPYpwSRZgvxA4eQ=
X-Received: by 2002:a05:6a00:92a3:b0:76b:d93a:6a02 with SMTP id d2e1a72fcca58-76c45f67a5dmr5010282b3a.0.1754671475951;
        Fri, 08 Aug 2025 09:44:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRN9mDpNEYryQ+Th1q0Yl+AOPWnFZ0wbyScqj1Kwa64LHrFPfZCQPxWBECZkWS/S3tA3rHhw==
X-Received: by 2002:a05:6a00:92a3:b0:76b:d93a:6a02 with SMTP id d2e1a72fcca58-76c45f67a5dmr5010254b3a.0.1754671475508;
        Fri, 08 Aug 2025 09:44:35 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfd0e78sm20690165b3a.99.2025.08.08.09.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 09:44:35 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] remoteproc: qcom: Update MAX_NUM_OF_SS to 30
Date: Fri,  8 Aug 2025 22:14:17 +0530
Message-ID: <20250808164417.4105659-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oJ-h22seih87jxfsFVBdLZlEkHfDZVg3
X-Proofpoint-GUID: oJ-h22seih87jxfsFVBdLZlEkHfDZVg3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX7QMOfn8lS4OJ
 fCcqACX5gbMnmPXTqs1Sd+A3F0cHXPQY6uGZiHEbDamC6zwBDkpz55mND8IKqQGt6FbAhkyiajs
 BhszDsoMjvX1YXyYP1JorhBF9Ol6JdOE+iqpYL2k9+jrPcWXjeW5sVTdRgkhOY7BoSiaHCa8zIl
 xeKm0KRUMgOB0QxnCdWoLCrpT7+mGbnOAQQ+ttsBukEa2LRJQ0h5mxtHmDRHLPtz0pqyV7bbFOG
 kSfVgZdDelAJsjy8YrTQYfbDy7YErtWTpcYK9PXQTzghTYM5XsrwG8KC9acZ6/GAGIbaau1cAhH
 pjZfSowSeSc3Gviglb7Fb9B+s3O8WqJYlKoB1pb0hLrzgea2NHOii0JpxCh1STFh2tYBKiyDMQf
 zzF1v7y3
X-Authority-Analysis: v=2.4 cv=LNVmQIW9 c=1 sm=1 tr=0 ts=68962975 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=evFLFRRwLpfRx6s5WfcA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060009

In the latest firmware for Qualcomm SoCs, the value of MAX_NUM_OF_SS has
been increased to 30 to accumulate more subsystems.

Let's update so that we should not get array out of bound error when we
test minidump on these SoCs.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 8c8688f99f0a..dbe3bf852585 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -28,7 +28,7 @@
 #define to_ssr_subdev(d) container_of(d, struct qcom_rproc_ssr, subdev)
 #define to_pdm_subdev(d) container_of(d, struct qcom_rproc_pdm, subdev)
 
-#define MAX_NUM_OF_SS           10
+#define MAX_NUM_OF_SS           30
 #define MAX_REGION_NAME_LENGTH  16
 #define SBL_MINIDUMP_SMEM_ID	602
 #define MINIDUMP_REGION_VALID		('V' << 24 | 'A' << 16 | 'L' << 8 | 'I' << 0)
-- 
2.50.1


