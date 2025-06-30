Return-Path: <linux-arm-msm+bounces-63106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A012AAEE684
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 20:09:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41E85189FC21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 18:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC9828FFCD;
	Mon, 30 Jun 2025 18:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnI2gXIU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467182E3371
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751306980; cv=none; b=Oi6WxuGPfOlwHg022rBxIFC87ju3kzuj+aw1tXj1F6qKMtnrANe1ekpHcjreggNzygcMoqekb7YVi7/xXA7o7tPrm29TrOOPMnNKOvEiyMmv/RUTz9FxGClyKjJ8gVEXKl7C2xXnjyKwOzfczqJtmFPJUB6n2jq/UdyBMO6oo04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751306980; c=relaxed/simple;
	bh=8LSls301kunvMmnpIkmo/RJO6kh0VSca4XLjNvBnjBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QA726smYSngzMvfmimIMO7+I9vYdHfRVfCIKdDFrNDLQHrYfulMD/8QFfl7zlt91t17ybsq4VMg+xQAucU506f02Nq9YVvWhuk8Rt0VmGLDnJq3vB7uEtPofu3Vp0logKtvG5l361/yMPm9gzXUx2yUzP5WjnzPvTf9wd5l82uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnI2gXIU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UFVdFx025373
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j2IrTVpPHGk
	3cmgedXeFGuPk4Zt45xwZrIney2J2rCU=; b=KnI2gXIUmv9NXog4BGOFJqjhovW
	xTTQJz96andPBFSagpXYM3T6QZKhykQG55a8u5rLJKyoZjRUIVz7NrzlarK+fjHr
	4oZHd2kSUZSL94/wzhy1rI6+PygsOORXpmheU3EEca9UsH9zQv7J9PmVTUMbFhC/
	ixgR3jQB81H2fFTSnH7VJ45m2EVsjWz6LhnUThWFwFnqBYpowZjoH7OkhX2X0GNn
	z06tlHWOIboYF8YvfYy8s8W2vsrAjJ55ywroHgco4CSdXPhKM989hKD0dy420RL1
	Y/2v9Qdm7pYFP1YJXAjO3r+7hX0OwIo4iHZnf1C2FfyfzIvcqa8tM2Uc39A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64k1e5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:09:36 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7491814d6f2so5295563b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 11:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751306976; x=1751911776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j2IrTVpPHGk3cmgedXeFGuPk4Zt45xwZrIney2J2rCU=;
        b=N3rCHRL2uFT3FupBcm0GNxluCZdrhrQtULOTiXLTFnXY+Lg44ylAe2B3JPrYuUmdBF
         DxhsOJLZTNhj12NnCzOYzWS7oSH+7Rwp5CoOvsnxZAJrhhnbmP+xTa/xDOz5/7HrAj5R
         PPJljdtEDEoGwTvD4Is1xAMVVHyarApGNnyqZAvettRU0FDWXmYGr8fByLKNLkrmzD8O
         YOE9olA4NNLUZEFXer2sH+X7Rv9sSF/FkZO+hrSH1SPUQtQjLmh1kVVnCEogtmCfJwun
         tMItVgvtv37JQrhquQbsKnl1xj5zeBkQ8RLcAVCzwU5ljb35b8EiVc4xbbJLicH51XHi
         7BOQ==
X-Gm-Message-State: AOJu0YznSWKZxX3f/lmejQ09bqkxtRbt9Xn5nDJ9eKpKrU1q0lso20xK
	tJh3uqT0wTPkzUSFB7axt6MyKoBMY24E3Ylo7qv/IMPHk0kN2ATEsErkw0J2XIi1ohslDtUSO9/
	kYMZqsk/XYDhRJzkIdzCwFsV0ZaHk8SkgsrRgqDJD0iR8K3KLRI6bUgUlUxUi3dhOahv8
X-Gm-Gg: ASbGncu/t1uJwRaxM/9dlmDhN0QObDYr05ooLF9d8gw1M7Qv1asXeVCiqGU+aLVBcpm
	doFNUNRS5hmfLW5aqtHY/xJrLVJ4fu5zqY8EUAAusmcWViZyqeyh3NXvSR+Nf2rytpyj+/wRr0K
	2/bVfVXOjexyOcBh6g4kMfkDKuMHS9EEu5MHQwE5ksFZUKoZ3HFyV2DEAXtRd1ITnZPPwn8QRN5
	thRqQPR3ar6VZ2Z5tevtchqD0mfHcKmClDoqGAA5E/uyoDRh1S3Pbu5r1EsWji77XbIzNX31KiH
	NWo1ezYWPUdevDRgiPcsBMR6pUdT+cqFSQ==
X-Received: by 2002:a05:6a00:2e09:b0:748:fcfa:8be2 with SMTP id d2e1a72fcca58-74af6e6332cmr17721020b3a.2.1751306975718;
        Mon, 30 Jun 2025 11:09:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJ3O8y2ECboE6xOGFXRtAZOY7C0DZ9frX12JQWBPnD4Jg6ZmDzwgTEEb4oZkG3IoXABb/yHQ==
X-Received: by 2002:a05:6a00:2e09:b0:748:fcfa:8be2 with SMTP id d2e1a72fcca58-74af6e6332cmr17720994b3a.2.1751306975323;
        Mon, 30 Jun 2025 11:09:35 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541e64asm9844647b3a.63.2025.06.30.11.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 11:09:35 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH igt 2/9] drm/recovery: add iova-fault-stress test
Date: Mon, 30 Jun 2025 11:08:56 -0700
Message-ID: <20250630180903.77990-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=6862d2e0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=636ExQzhtIBJ3iDFxPcA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE0NyBTYWx0ZWRfX6db3UDQr8VyK
 uzoOMW2YHi03s0KLtjfEfrRBf12DygeqFv2da9FXS7Z3/ewKml+LnznNXdSK/cmJhj1lnADWa74
 dfGr9hhX3RTVVGcj8B378N5Lcq2rwoy++df/cssZ9+9wVu0zNfxvvX3I5SfrA7ZostEG0wc6RuW
 rLxMe2VAKlcYwQT9G1UPYNwnk/HRyxdxzHg84wviEEqslh+yKGZKYXbQO/IDkzavlicoIiRrHq/
 FjXwNFiDiZNc3BN7Hzdqoa50LWFEvzMIH7pylGPRIR+oX1I1xer0vxbTSJozgLvXPMzDSq1QHcB
 3Y4QbkG4Gve9bQpbXoZUkFEy7fe/lFd1OtU212wX+l/J3P1Du220Y1pWoF10ZO0WhLy1ooIYaUZ
 D2RljtJSJOxY2iqXXEsNBfPiLI8DFeKuBQ8orxFG9IVCmWMwnAOi5BKPcL97s2rExhepJ1k9
X-Proofpoint-GUID: fjSi3JMdCfTItWpft-vDng0DS1V9RBxi
X-Proofpoint-ORIG-GUID: fjSi3JMdCfTItWpft-vDng0DS1V9RBxi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300147

From: Rob Clark <robdclark@chromium.org>

Add a test which triggers many faults to test robustness.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_recovery.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/tests/msm/msm_recovery.c b/tests/msm/msm_recovery.c
index 433392079bd4..8a83a6f24c41 100644
--- a/tests/msm/msm_recovery.c
+++ b/tests/msm/msm_recovery.c
@@ -195,6 +195,23 @@ do_parallel_test(struct msm_pipe *pipe, int child)
 	igt_msm_cmd_free(cmd);
 }
 
+static void
+do_fault_test(struct msm_pipe *pipe, bool stress)
+{
+	struct msm_cmd *cmd =
+		igt_msm_cmd_new(pipe, 0x10000);
+	unsigned cnt = stress ? 0x10000/16 : 1;
+
+	for (unsigned i = 0; i < cnt; i++) {
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
@@ -242,18 +259,16 @@ igt_main
 
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


