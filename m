Return-Path: <linux-arm-msm+bounces-63109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 52449AEE686
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 20:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2069F7A6CBD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 18:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B472E54DF;
	Mon, 30 Jun 2025 18:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QyCU05It"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C8F2E3371
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751306983; cv=none; b=c6JokNs8PDifpvKYP5BWV3LIdchVJ6TnPmmyoWLy1hzjFA4Warm+J4G/YzKKQWIf2V2/KRhOU2lFs2qdDAvdFO/WZKyodfYhOxG08Av5quZCBVaLqKccTPrQpDFQz5zHHtVEGxG9KEVp5QmwWAq8yNfWCK3cpf5ecPwQ1q8WjZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751306983; c=relaxed/simple;
	bh=ZtVdZj68xncFfk/Vbj09LwBfaWtKYRxqd90JgkWCnN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rc1UJ3V/3icBfqjZwBfgcFz+8+XVjjEpo3KkCL0Z4agkvKOYLGyk5qJcSMCEFlH6wJPFsSpjIHFmJuErK0SCGFaWFRZuSrwyr37kmn2JJOFu8Vl633isETwMt6ciU2wj/hN7UXEbdqq8RHYIeAoCQPvFpC5Pn0Oav0k5ngOT7M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QyCU05It; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UFnlII025163
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=55DQSDgU9XN
	WkZSlf7911sVDtNc0BKCuuJITO8Sc7fo=; b=QyCU05ItWiAZAZNy1fGrl97gOkx
	SwAUgVexeb8JttYAYuMFiKR4md1DQ/VmlQUT2Q3l9ruhhUNv/7TjpX8hiEMzIq42
	lVmgRXaBZAU0NhGyUUIS3Y22d7/wRt5HTkL2tOn1HXUzWjpuSSfCg5epJNMql9OQ
	LiQJ7LrcJa3iCg/FkwEe4NlCA+o1PQ0vBNikoaobwj+iD2Y+ha39jTyenywrriwj
	7YOKmmHFeaElancx54uPREK9gRWUIPzy9QZQ4ZLgmAjjsc+phD7bu8sv5a9w2QIu
	JdheTtX3xgVv9qbR7oZswboaSc9IhdH2yWiEzttEjawKJ/TEioBATi2lABA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64k1ed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:09:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-237f8d64263so38816635ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 11:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751306979; x=1751911779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=55DQSDgU9XNWkZSlf7911sVDtNc0BKCuuJITO8Sc7fo=;
        b=Y/ZyMot8o9vR23R2nT//hZL1XAboZNrv0wS1wMpfgR+UkAgBbTQmU/lWyF5nXKvli/
         mnEn0d4v913VNqMbwn3V0IiD/AFQpySph/56JgFA7l1U+qVGnQV6npePifzF+AP2+m7N
         9WTvpIsAOB7l0MGlkshptXrqxhcyJaYTvJgF8rKrPCFtc55oUiG7ScCC5ptyX8Pk3UAX
         +5gPIfXi/ZXggUnF5RgEQaCinCG/lFKV/SKSWwvJQhDA/DDd43+oyHPRtPs2KGsJB58n
         0ttZPmcXXPUaacXv3cuiibfDw2t/j/0bLxhsuFyNlbducfX+t+5/s/WNm+zAmz/SDAMA
         4Gfg==
X-Gm-Message-State: AOJu0YzOtocrZUlQw9toWBqNQ/+CliKwe0WPyrrNZEv9oHrSmXXs6jJG
	z6IqntDUZqBlba3LpnygdpCh37ZVqfTdI09iGXnnjVAv6bSMNzlFSQi2OlNppJdLTWD66aCBR6h
	/ZOmowLIR3syj3G4+VmaxiNo5/Yea5OI/40+whoXAgHZQ8Q4xSYBRwc8rK5rAZj0UqoSM
X-Gm-Gg: ASbGncszYU1bfroRv+6FPcMJUT3VBW+PcK93cvEoSG9hpYyQun0uRVwJfZNi8z+hBvX
	fzhEbYV16fusEQWakrhoF6WBfz6cWiALvXe0FV5/GOH7vUJ/ZhnU+cCpRoGCr2nqAySftnpmayh
	eg1SoadjWMG450BJx+iiaujDx3Dk0fOLm/v/LmPlxNjPjaEGJrK7+9lLpjFFN6MqxMaS1tTKTcN
	/kkDpLSNyCKcSoeweS2v5smbi5Ro1hxAEBQwSqaD6nKtUpXOLyY3fRedViJg2+DdIfk1ClXA0SQ
	TVvvz+2R8Y3m8O9FSyqbejAGQPnGw1emGw==
X-Received: by 2002:a17:903:3d0e:b0:235:f45f:ed53 with SMTP id d9443c01a7336-23ac45e376amr211248845ad.33.1751306979034;
        Mon, 30 Jun 2025 11:09:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEimgSP5MOd1GlXXxOYUtftx/nDjse1hzrKVUKPUaxykf/eRNnjnuj1oXkCdn8EmNGh/YHSYA==
X-Received: by 2002:a17:903:3d0e:b0:235:f45f:ed53 with SMTP id d9443c01a7336-23ac45e376amr211248575ad.33.1751306978638;
        Mon, 30 Jun 2025 11:09:38 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b8ec2sm86706595ad.183.2025.06.30.11.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 11:09:38 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH igt 5/9] msm/mapping: Add additional subtests
Date: Mon, 30 Jun 2025 11:08:59 -0700
Message-ID: <20250630180903.77990-6-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=6862d2e4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=uKBAPi6pz9e2o7ac47oA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE0NyBTYWx0ZWRfXz2TPPUjuI9ko
 zvYfrya26f8trCvyBvAydrXHsBO9GX9bx22kEAXwhIiqVbj0WYHFXgE8meW/6wbEwcBE89Q5SsM
 mZOeYiKUIOSxSko4+WH/USSnj0fKEgIVQ9/fR3lEoDWjfZV3rTIFv6bb7xRaXoFGaJsnEmjw2Xl
 c7PGmHNtfQkxDEdRzBoCs8HFX4RJ2xWCfzSQmrFwqgzZ2PU9UQmZH+TvvEa0sg/QS+V26m4YGmU
 EQWn8BeboASRGLJpHI+82+ClPlSZEOzpINTm3RCSb98NBf/RYIQMOndEhY/Ja3TNmfeUMR4Vx8m
 44/aqFJKD3duCjC4iDNgF4LhvxPtpTxpIFZdjZrjcy6AoD+mbJ4UVPMF9or/2ysjsf+kO49kk/S
 sJMPDU60QPpd4aWgQ5ZEJcBBeRKp4V7HukAkQ7BrmEu8u5t15y7CE2U5uhL4PbR8v+7p291x
X-Proofpoint-GUID: WvlD0l7fKf0Skfx8MQQxsLmwNZI7f5Ji
X-Proofpoint-ORIG-GUID: WvlD0l7fKf0Skfx8MQQxsLmwNZI7f5Ji
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=821
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300147

From: Rob Clark <robdclark@chromium.org>

Test a few additional buffers that userspace should not have access to.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_mapping.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index 5afbcd081fc7..846385bb5206 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -253,6 +253,36 @@ igt_main
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


