Return-Path: <linux-arm-msm+bounces-63458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97410AF6251
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 21:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 352893A5BE7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 19:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5B82F7CF5;
	Wed,  2 Jul 2025 19:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="el4Q9pai"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6EF2F7D16
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 19:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751483009; cv=none; b=aPGVFX8nekKepa/WQykEi+2x+W+VINwChddLvz4rp558UDFxEbtho/lkii4DTC35zWQVeuyktamBc5Tc5AF567SoA2UeCsoNeaEv2ATs6kqokTW1rf6S2n/8lRZ80q9edknzir/7wrSwx5cPxJKG34EwyvvdBBsb6Eni96f/0gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751483009; c=relaxed/simple;
	bh=OclojJZ+LNem95MWhPkMlkvqo0CncmXIUBPY6ejgiXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Plp6x25bajpcJtJOJe6oGQbGgoL3KaIWt6X6p1RZ6LyfdqxDVr87EtPZH8juSd9ay727QW6q1AUhLsQLQbCLXkUPUdhyDbhZg51CgGOZctXMsqMYk0nBo5FGgSQuuLU9eTR1FjHns1G5/duXn3p+BaYFCrucdWBYeyyV7ytpyKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=el4Q9pai; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562DqDqm026279
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 19:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z3PtBraniMt
	5ty3O6M0zJCeao1OxUkgsqI1RcMenfG8=; b=el4Q9pai8vNMF6WBQlmfR1VkN9w
	WGHMUyh+jkaWOHNfnhQjagAiqtUucjBgdFUZt70QVd0D2o02jM44NH6dtCk4iVXj
	x0KnpGAr1lRd2cnHY+YAQU2tAFyT7G6JWPNMv1Jra7m8OzEEHmKkDni7bmU6dXTF
	ceuAsnnD11yaxXLF7FdiaEBwdkFkUReFqAS0G4Mkls4tlFhvuG9J/n0DUj2I0b2i
	gPcbpgYdWL/isdeTxCSM4eKi/Ht99JdHnKNqtNdz6UsOCbRC8ML1VcOgTY389yRS
	e/FVsqDMUotj/zvKf/5ZY+wQrosf96lXvliGKL+prSpd16TWMbTvOY3gsxw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64twk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 19:03:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7494999de28so10073126b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 12:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751483005; x=1752087805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z3PtBraniMt5ty3O6M0zJCeao1OxUkgsqI1RcMenfG8=;
        b=D1nxjj1ub3+2mqGQFVTYMIaHMBzkt9zMiSdCobM6BqKmWPnkrhAcQV1zlejLT35U2g
         zKHI7lEX5UHU74AGkqYRJ+PIdJDuWagy6ioHwp8O9mRvzw7+Njtd83IJ7r95Gc/9xHmS
         7Hhn95P3n4HkY9vs+/eWX3DI9Ak6YFN0xIGhms9vIOMnr2G8S2X6tBynK5GPSW44JWWy
         /htC6b7udRtrc/OAkim4/G2wGfb+PFTXAwUGr++tdsr8GYK5wmnMgmz58Qb+qbQFJEMg
         2ZfTuh4PF4vAUS4Omf2OWybSCvBkH2RCVZdgrALHeJwGAjdlWIXhDXeZP2whu97dLiZr
         8UsQ==
X-Gm-Message-State: AOJu0Yzg8ThhxrqQKkJR7zs5BAo/8pLfI/RC2m/q8VCUE4VvJCrB6SBD
	nJw3z8XvMqGWRecMPaHuqpQjXdkzZoIikGg4Y7Z0NKMvAajf/1T3vfezk2A/7IKj+uMigUUge24
	bSb9t+VOTYn+JWFyaIFZ+ZnYDZ+Hprh+kUbB59DpZm7pDOakXM2rgdoSGIawLe982Xvi9
X-Gm-Gg: ASbGncs3hUk9sHjEoiU4UMER4jEhtoijMJF+++nUDzAFhxuAe8RuDRx31NRmN9d/91P
	+kRAIf6uvIBQbpjArY9LX6cFB+TnYwpJkywlqF26A4hvkjI4LO2bJl/qyYyRPSiu0/AQOYBKPV6
	zvpatrEb+aLRCCQrRgRMqOxNpJRDiaMKo5SQDGObRivPeIc7kJ+genwtMIt6FMmhz7JAPIO3zP1
	6ay+xlp9gEf5FrtO42hw5YsYgWuluRXVAhT4lV1/v6b+DUNW6utp8sYGr6pklatD8aeHZfvVJ6y
	EWhxqkpd0vzV7erXVv68KrSp0N1SNqrrNw==
X-Received: by 2002:a05:6a20:7fa7:b0:1f5:79c4:5da6 with SMTP id adf61e73a8af0-222d7db4ffbmr5935066637.5.1751483005067;
        Wed, 02 Jul 2025 12:03:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRR+zKqm8Nvu+uFQJAoi0TrGyHLk0CLFtKdKtbIWBkF0qNH9y4KwsTkzhS4Jy/71vAzZ5z0g==
X-Received: by 2002:a05:6a20:7fa7:b0:1f5:79c4:5da6 with SMTP id adf61e73a8af0-222d7db4ffbmr5935041637.5.1751483004536;
        Wed, 02 Jul 2025 12:03:24 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e3009154sm13528169a12.1.2025.07.02.12.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 12:03:24 -0700 (PDT)
From: Rob Clark <rob.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
        Kamil Konieczny <kamil.konieczny@linux.intel.com>,
        Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH i-g-t v2 6/9] tests/msm/msm_mapping: Add additional subtests
Date: Wed,  2 Jul 2025 12:02:46 -0700
Message-ID: <20250702190249.376313-7-rob.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
References: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=6865827e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=uKBAPi6pz9e2o7ac47oA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE1NiBTYWx0ZWRfXzANJ/fPc6Y+m
 EbD4t7oCmL2OkFIbQNwmQQebuBF3/8lC5GLhG5tT9MRTnBNmay8pXq9BMfpfgUsmeYYxEG0mRzu
 ZHGqOqRvYrF47CSNkDDSrW2cNuViAkti/kM28/Kn+mqMHrxScJRcU39umjsdXgBdW1PptkXyJNI
 UxL4NpkoKWCWYiUDXG25/IMOZlH3J9R85SE1frWdsDYmo/5G+nE9q7mNzSxCEgE6q5lkEEDYiUR
 +StTk5GlMnALy/m2LmnzCexqz8rDmOmKmE1kqOKatpaxKC7bvs02AR+HSLImyX8I+oXheXRZojN
 b/VC8LbpAPN/8d28vxMX+X57G7gNb8+78jNKQ2KwStJ5vFckkw6rKX3G/n8oDDLZ+L/3rhRyvLu
 j9FSNM6R1dYPmxgwLsHpiXsWp60Na0BtumP8p77lQEeKYRbPu7/H6oQDUxx3Xu/4FVvgkHpQ
X-Proofpoint-GUID: DPtmSIrM7NoDjG1KDGGfPsGubtEDG4cp
X-Proofpoint-ORIG-GUID: DPtmSIrM7NoDjG1KDGGfPsGubtEDG4cp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=831
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020156

Test a few additional buffers that userspace should not have access to.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_mapping.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index 923bf8734bd2..95f5f5635881 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -256,6 +256,36 @@ igt_main
 		do_mapping_test(pipe, "shadow", false);
 	}
 
+	igt_describe("Test pwrup_reglist mapping, should be inaccessible");
+	igt_subtest("pwrup_reglist") {
+		do_mapping_test(pipe, "pwrup_reglist", true);
+		do_mapping_test(pipe, "pwrup_reglist", false);
+	}
+
+	igt_describe("Test memptrs mapping, should be inaccessible");
+	igt_subtest("memptrs") {
+		/*
+		 * This test will fail on older GPUs without HW_APRIV, but
+		 * there isn't a good way to test that from userspace, short
+		 * of maintaining a giant table.  Probably just easier to
+		 * list it in xfails or skips for those GPUs.
+		 */
+		do_mapping_test(pipe, "memptrs", true);
+		do_mapping_test(pipe, "memptrs", false);
+	}
+
+	igt_describe("Test 'preempt_record ring0' mapping, should be inaccessible");
+	igt_subtest("preempt_record_ring0") {
+		do_mapping_test(pipe, "preempt_record ring0", true);
+		do_mapping_test(pipe, "preempt_record ring0", false);
+	}
+
+	igt_describe("Test 'preempt_smmu_info ring0' mapping, should be inaccessible");
+	igt_subtest("preempt_smmu_info_ring0") {
+		do_mapping_test(pipe, "preempt_smmu_info ring0", true);
+		do_mapping_test(pipe, "preempt_smmu_info ring0", false);
+	}
+
 	igt_fixture {
 		igt_msm_pipe_close(pipe);
 		igt_msm_dev_close(dev);
-- 
2.50.0


