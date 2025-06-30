Return-Path: <linux-arm-msm+bounces-63112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FF6AEE689
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 20:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B185D189FE14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 18:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA1E2E3371;
	Mon, 30 Jun 2025 18:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h3bClsUy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403F12E6D13
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751306986; cv=none; b=dhujFcqqkLssWtXrjBpTvv8DZ2b3MooUO8i5J2VxE9bHMkpz4JhltcYOH2UOXtQF0pd0mjKIjfoRHXMUKubr9RKHo3wysqA6pvbhNMo0T5txsU1UwRDRs/x1xUzmAW35gHDrFTC6mlZVFYO6a8T3z4knlurb83Wvdk+tNwNupXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751306986; c=relaxed/simple;
	bh=KobrRg114emSeqeitdEGTPAQf/k43Iq9lSQbsTt1Yck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=beQyPNm6r8Igh36V2WVjAxwhbGXJzw8IfPCx+xS4ZPsGlor0W16n/fkiIzfxCnfu3+diq4kcLCoG9S7hbK06TeCQ3PU1KNwojQTgW+EnLBECSi2ymlVgdCuayz/bFzbd0H17rJoMpvKtaQTB/bMdKqrIoqpzDPJB5lfbf/+08V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h3bClsUy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UFgMkk018581
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5wlg2bP4UTd
	5crkAsljjdslZD3qUqKVHgYw0X3XIpDo=; b=h3bClsUy2IVYXIngSMg0NsUB1g7
	9p6bGLTz/BF58W7+fotckQgfS8Zq/amgpcB16H/6Hqh3DwHKzrVAehzNY1x3U51w
	eyHBe5mw+5F08y7tuEPdFznq3mPnqSXk4Fjks2cIUR1KBmAWLPXuIb3kVbyEARuR
	/tQmNMUaW4ExG9vwfikcfnb/O6O1ao8+6BIeGPRj8P0hnCGZ9iqZ/1J5egjm4hBH
	nI1S44BBRCp2EqECuqNabiAc3rdjUHEZVfel4sPrZpWUCrY1+XEg0iu6Izss48Gb
	4NHbqRPV43sr205LrXUdoxS2ln/goEc98bgetN/g2mXnazcwaMPhpNdWaTQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxdsgr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:09:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2369dd58602so20032735ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 11:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751306982; x=1751911782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5wlg2bP4UTd5crkAsljjdslZD3qUqKVHgYw0X3XIpDo=;
        b=Um1/e+QQOr9DhKQ7f0Qo9xMh9E2e4O0PH6/d0iQw4JO7GhScE1ABk0P5/lyBmwdiD3
         wdLvA4q0Wal4OMF5jTraEy9uQms8FkM/1mG9TZt1D2E1cko7DTLFKZPujFHp7gvdZXkc
         2/jhdkZEE0v2kTkMxQpuyCnznaJ3+4ato1PX8X672L3LZagxH0P5x5tGFj+KcGvfYDHy
         iOctNdJXulpRfLoZwovLT9y1c9oJPdyVvPFfqvSbigoTtUsUHjxKrt1OsF7pMs9dcCNN
         s2jcr519C5bH5Pnah1bW3FqyGE/VF6gM7Yv8VmpB2grF6Xf2ZT7Q+mrCYl4sYl6q5kbh
         uWaQ==
X-Gm-Message-State: AOJu0Yw3OF8gZKAtU+wUj/1KlnHNq7scg+JbNXu30uJGSZmVHMTtaOUJ
	Y87xVIynrcAaXnHQwjUgBDCp3DXxH3/cjzoDxFbcu11rA7XoxBa61eCDkHAe1GRcIW/g/VP6HKi
	9nJbwY3qGvMiGOz2sMXtel5y9ExTIYkQJq/qLRqS8/O/Z9F7gwqhCURq1CdBwQHAQqNXH
X-Gm-Gg: ASbGncvsa4dAp4O3yu+e9npKpFoRutAa1kdOF0gDKBtpEAtvnO8GbCV6x65Ohqp217D
	kQ6S+9mx4KUAxH/q2KxpujACAtfLFX5yHqNISk4ybBZU9at8fD2MhHkljXzVq5Xbs2MYxkHUN/1
	ifrDlZfl3ZzBHDotiZPBEjykp0ys15KBzY3XrX8knIKEAg+0wY7r6PJ94/n3WZJQVbru8dEu3sv
	wDJcXjVmYGQTQqvPIEMBTzCF6zMtDgWCLhtvFx1fJ/kz1AY2wgtD4qUiry4Me/aqkMQRinJrfFX
	5bHPpe8GB4C1C3NTiyrYMes5zjQWAbLE2g==
X-Received: by 2002:a17:902:d2c6:b0:237:d192:ac4a with SMTP id d9443c01a7336-23ac4637a94mr195028685ad.51.1751306982365;
        Mon, 30 Jun 2025 11:09:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQ3AQ5YxttXQ7WbGoYp2DJpMJ69NA0wnJKUJE+75TdfXbr07IuQB365nFkgY6WdnBYUOMXVA==
X-Received: by 2002:a17:902:d2c6:b0:237:d192:ac4a with SMTP id d9443c01a7336-23ac4637a94mr195028355ad.51.1751306981954;
        Mon, 30 Jun 2025 11:09:41 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bf32sm88001485ad.94.2025.06.30.11.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 11:09:41 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH igt 8/9] msm/mapping: Add wait for stall-on-fault to re-arm
Date: Mon, 30 Jun 2025 11:09:02 -0700
Message-ID: <20250630180903.77990-9-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE0NyBTYWx0ZWRfXxBTYfwyED8Dq
 eBv6eV/CL08heMa6PB1iEbm/an0+ScHY0QPb/0Vsw9SO0NeHgplv+Obm+JyrQJZIHOycAozlhi3
 G8eQYOIV8+ASeXts+qhZ3/L9bDwMCEMIxmS9NeevnYYxsrUi3R0jKNBkVNsA/yyZ8ez4YUvzb78
 KIKNFPPiPTympYhQn9/CuRD+SfOwVY9WcMIfTRl7nlvcHF69wCj2WDFTTY0nYJH2FNE632GABFS
 Cq8prJq5dOD7BybVRGPbMyI/bY0ULOhk5Kp9/0XtHde/6wmH6fa844BCm1ZbzKof3BjLFaGV1n/
 ZWCJCFvoPvXKyPACk0kRDbSRlaAER2i1cjNgVd16VPIhJv8+XVB/I7WGic3kNQw5Ejye6HChgYW
 INX0kol7csVvenCofTeZ2nnZxdRpGk6G5HWZPFBhr/w5Sg407xZaeXVPYdOeoDennLzhgZXQ
X-Proofpoint-GUID: bmBqe0vtMDPblSQd6idUbskGG3IEGDX4
X-Proofpoint-ORIG-GUID: bmBqe0vtMDPblSQd6idUbskGG3IEGDX4
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=6862d2e7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=ZbXLqgdrMctJ-p1oMuQA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300147

From: Rob Clark <rob.clark@oss.qualcomm.com>

Newer kernels disable stall-on-fault for a grace period, to avoid a
flood of faults causing instability with memory translations that
the hw attempts with the translation stalled.  Fortunately it adds a
debugfs file so we can know how long we need to wait for stall-on-
fault to be re-enabled.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_mapping.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index 978ea18375dd..7e2f5c7eadc8 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -74,6 +74,30 @@ get_and_clear_devcore(int timeout_ms)
 	return buf;
 }
 
+static void
+wait_for_stall_on_fault(int drm_fd)
+{
+	char buf[64] = "\0";
+
+	do {
+		int us;
+
+		igt_debugfs_read(drm_fd, "stall_reenable_time_us", buf);
+		if (!strlen(buf)) {
+			/* Not supported on older kernels: */
+			return;
+		}
+
+		us = atoi(buf);
+		if (!us) {
+			/* Done waiting: */
+			return;
+		}
+
+		usleep(us);
+	} while (true);
+}
+
 /*
  * Helper to find named buffer address
  */
@@ -224,6 +248,11 @@ do_mapping_test(struct msm_pipe *pipe, const char *buffername, bool write)
 	ret = sscanf(s, "  - iova=%"PRIx64, &fault_addr);
 	igt_fail_on(ret != 1);
 	igt_fail_on(addr != fault_addr);
+
+	/* Wait for stall-on-fault to re-enable, otherwise the next sub-test
+	 * would not generate a devcore:
+	 */
+	wait_for_stall_on_fault(pipe->dev->fd);
 }
 
 /*
-- 
2.50.0


