Return-Path: <linux-arm-msm+bounces-63454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF18AF624D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 21:03:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C82834E827B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 19:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66CE200112;
	Wed,  2 Jul 2025 19:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yb/shqHF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403642F7D08
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 19:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751483005; cv=none; b=cRbpQ4KnXKUcfMltf9gAyjcG7/Rs0swaQgQdPGL/Tm/AqPnahKvigPlYtAbPwZ5KZIobNsSM1vN2rQtA4cadfQ7zDTtYYYbxfeu8pJW3oYvQFSKex30soq5qzQYv4IVNMld5ikX3u8vDx65b37pcCO61E8KIdLGPXP9ZmoyNjWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751483005; c=relaxed/simple;
	bh=DTPvntxXfPOkIQgE+tab8x5b9cpfhPqw/UO52kyJ9vI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nMXI0lEDymGxUNuAVBGHqfqjLulF7l7FWhhrhZCzqNT6WtbZjuURJ5TPVcaL29b+vl7UbBWXAaRq/lhMurVUr1CJZ7xikzL+LTXoxEu+8TQ6w5Ng7tdiUjNik05i6qOE+cyhD8bGWZVTMqx6OTY3A81P6wNdLeF5MU7xilFcyOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yb/shqHF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562EUtNm025098
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 19:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LugcnasxnrE
	5DjEWFlon6r+QRV3BHdeB4TczQqxOcnw=; b=Yb/shqHFNX1bJWDYg9+bVPGYg44
	9rBGAeUxIcErPAObiShH+Jeh+VpxD8RonCAQQuMoITb5YSH+8BiyjDh4LlJLiQR/
	mVa2A9XWB1a+X3KCKB9uyR1nGwBa+lttZoUiYkX0j7br67ey55MmkvUmbrIU3dnn
	j9yQpk79GIwkmzTB8CYFQtjUNCzFuT42kh6U0TL+v8VHOvmFw0IZ5/6l6WHllqYN
	2G3+mVLSRAI92cmCjbbmW2o/pGlbFhzUisO/2htob8W40PtBp+HPJX1NE8orDGmv
	xvGNb3lYHrmfktU2cNWA8EjNmGVH/Ymlfjn5YMatuP5oK0kqG7AjYsShkiw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8025jj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 19:03:22 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74890390d17so6392375b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 12:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751483001; x=1752087801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LugcnasxnrE5DjEWFlon6r+QRV3BHdeB4TczQqxOcnw=;
        b=amVDycESIm5Uz8ErPw1ZRAa0+vex9ebJNx7hI1E81AAKllTR448meMwtPBPbAFHN8m
         qdwq11Kz9OlvizgozRyvTO60hjUwIvA2h3vZ0gdtwmOL4562f+lrOZEszaq8tnngsOyh
         useZy2Rc/yN7pe3dNPS2RvmXXBbiFo+20nwnKEKHi8lKmKwa3z23Sn7iyDp3Ib6mdBtx
         tsA8+f+CXJya50Sj3vMUvyP6GQ0/RF0ex/CoQ9ExQn9N30N7MT0muoilCHNxJ8DOHWab
         WZYd0mPlazbLQmr9rLnweJIuQ6XKHgKfNNHwpUz7aAikNez2xwdTRFfAq+Rd30D+m9P2
         meJg==
X-Gm-Message-State: AOJu0YwjkQfy1tml9OgQ1cetpdKvl28uG7tHZfu8BI9IOUjFemVs8X6B
	JePIcrixT+jjTjEEu0M3c2oMbPGQUwTxE94fx5c5KEChnB4AmU4eUA0pSof+SkDSVij/X7kj6vQ
	ezqOjr6rOzUoSjv7bYd+DQve40B3FuK8AhfPKBgaNSIiEttY8kTewd0ZZPc/b3klFu6xdmRP++4
	9T
X-Gm-Gg: ASbGncuUWKzPgtx16tq4tLXsPeM8hPykG4MHRfO2y61HW/3CBpv8cumko33f/NOfw1P
	6DSePZX9UVcqkgxNIUyHnvjAm4BNcebl/nd+nVv18Gtx43+ZCb73FTGa2gKEoZNBRsCi7cYxQZg
	NZ8HZDVGB/PIAtPNemsGtfww3pdT/GMA7DqQ2ixtBvkgk16Tyq9fieCtIyWivxCNXuTyKUJ59Er
	PFvgoN2hS8l/OwC2KaNcYIJ8emLkai7NAZNxylsqO2mzmxkq+i+DsWuj9kQm6QaSJCvRPc/8GUl
	zQDDfcLD2DdDuoe0E2llaUnn1Kn92uCThw==
X-Received: by 2002:a05:6a21:68f:b0:1f5:8de8:3b1a with SMTP id adf61e73a8af0-2240a6fe5dcmr1039393637.13.1751483001497;
        Wed, 02 Jul 2025 12:03:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0YhGuPC3GZVC7Y63gQdnclTe5KNlyRw9QCw2qK9nNcCqPSiACQpIHLTo/uSJ8VFyMK5OOxA==
X-Received: by 2002:a05:6a21:68f:b0:1f5:8de8:3b1a with SMTP id adf61e73a8af0-2240a6fe5dcmr1039363637.13.1751483001038;
        Wed, 02 Jul 2025 12:03:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e3013d8bsm13483174a12.15.2025.07.02.12.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 12:03:20 -0700 (PDT)
From: Rob Clark <rob.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
        Kamil Konieczny <kamil.konieczny@linux.intel.com>,
        Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH i-g-t v2 3/9] tests/msm/msm_recovery: add iova-fault-stress test
Date: Wed,  2 Jul 2025 12:02:43 -0700
Message-ID: <20250702190249.376313-4-rob.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: l0nTGojLtrL1tlcpf_wwilhS5KxAOPsG
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=6865827a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=WfHhPgbtyIMZGUekbm8A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: l0nTGojLtrL1tlcpf_wwilhS5KxAOPsG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE1NiBTYWx0ZWRfX4hk3DuJsHcuV
 3wFzS2/C2D2wV93vhMOqWDheN45EuTRWoHXjkETj+nD9j7L0haEX0TsXXBlRsYyIpOnOWjizHyV
 qhZkoqfDPWwvs7wcG8EpR/epmNqNmw0z+4SBiQKkiS/B2zG0XgXe6gblbWGhw90PAqs0nm+dnUh
 1iHH1/AOOxY/yQJRvWprnJUvusD7Di8nQ+dyJYFNCoBIgnIiGZFjrr5GuqgxHo3AbgDpHfSOO8J
 kWxWbFisI8rnGX55ROzVsRdscqBBOvJoG/2TvILGZ21LBgIFYvJI17L9gpaEN1tSoWpgWp+AouL
 HJgdawoISMxjQuBSuo/6Mt4oRyTMS2Loc7UC/EtM4QmP3vfd0odGHCV9eWHLBXraVHmCryexsvZ
 4zFCcsr39XYUkIgB9NlR11gYUXmftKifEyMBrqaiE9c9Vm4f5opSsn0twUscVYyURuWmL7eE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020156

Add a test which triggers many faults to test robustness.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_recovery.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/tests/msm/msm_recovery.c b/tests/msm/msm_recovery.c
index 433392079bd4..7b6e3d76e087 100644
--- a/tests/msm/msm_recovery.c
+++ b/tests/msm/msm_recovery.c
@@ -195,6 +195,22 @@ do_parallel_test(struct msm_pipe *pipe, int child)
 	igt_msm_cmd_free(cmd);
 }
 
+static void
+do_fault_test(struct msm_pipe *pipe, bool stress)
+{
+	struct msm_cmd *cmd = igt_msm_cmd_new(pipe, 0x10000);
+	unsigned int cnt = stress ? 0x10000 / 16 : 1;
+
+	for (unsigned int i = 0; i < cnt; i++) {
+		msm_cmd_pkt7(cmd, CP_MEM_WRITE, 3);
+		msm_cmd_emit(cmd, 0xdeaddead);           /* ADDR_LO */
+		msm_cmd_emit(cmd, 0x1);                  /* ADDR_HI */
+		msm_cmd_emit(cmd, 0x123);                /* VAL */
+	}
+
+	igt_wait_and_close(igt_msm_cmd_submit(cmd));
+}
+
 /*
  * Tests for drm/msm hangcheck, recovery, and fault handling
  */
@@ -242,18 +258,16 @@ igt_main
 
 	igt_describe("Test iova fault handling");
 	igt_subtest("iova-fault") {
-		struct msm_cmd *cmd;
-
 		igt_require(dev->gen >= 6);
 
-		cmd = igt_msm_cmd_new(pipe, 0x1000);
+		do_fault_test(pipe, false);
+	}
 
-		msm_cmd_pkt7(cmd, CP_MEM_WRITE, 3);
-		msm_cmd_emit(cmd, 0xdeaddead);           /* ADDR_LO */
-		msm_cmd_emit(cmd, 0x1);                  /* ADDR_HI */
-		msm_cmd_emit(cmd, 0x123);                /* VAL */
+	igt_describe("Test iova fault handling (stress)");
+	igt_subtest("iova-fault-stress") {
+		igt_require(dev->gen >= 6);
 
-		igt_wait_and_close(igt_msm_cmd_submit(cmd));
+		do_fault_test(pipe, true);
 	}
 
 	igt_fixture {
-- 
2.50.0


