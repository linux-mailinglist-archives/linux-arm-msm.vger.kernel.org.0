Return-Path: <linux-arm-msm+bounces-63461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D37A5AF6254
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 21:03:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 541C47B2973
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 19:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8EB2F7D0F;
	Wed,  2 Jul 2025 19:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IANHaHO3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F023C20D500
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 19:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751483012; cv=none; b=qlQ9Hn6UeKjhnwGY5wyNKL5UjeQPgVIyuQRDygrn+m4rkzP2Xq6axg4+0AceYsy71nnfmvU5jobWcCv0amNi5RZ8BOxGgqvJfyGuy+dNlKi/1Td/qND/lHF3nvwwb6marvPqzzsOdyG6KqFGg5WFUo05N1ik4jDnjhjsBBjbUqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751483012; c=relaxed/simple;
	bh=3GEmVaIePV8MR16BPdy+31X01eMCE6kFTklyr16qLUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GvPm237B62Aav82CBSvVIwfeTsGMipnQz9qD3pJeAIKOgY49qaK2s1+gOEdqRx5Uf1q/9Eb1I5BGCj3zGj074j2o3qNynmdcK35UxLcpjz58FMchpr6xfMEUbSxZvWalkCq2v4DYP6490BFlsEBsccqtD3qljU/Mv/JOV6dPz+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IANHaHO3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562F7Sbt024884
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 19:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yOxKK6pk6MS
	eBSvknMaULD07OJZv3nVIhMNajSPwiNk=; b=IANHaHO3QMcsRHQzacVQv17TAN/
	1zPNgk3v/T4DTm+W0IXTO2OFRtXnnr524LRvagf1MbU6aoTwXMZsG6VbK8/1mNcf
	xsJ96Z8CBqu7dhxxKWa6s821mRgzxh2PWKZ1ZssaBhodLpAn8mOGGhgRzQURuJaU
	ENZS3W5AZ8SENzLMF24qsRAaQScDvoZU60cXLUxXMu9Qz2yK14NqUc0y0toYGU7n
	UWvQ5ugsndfsfAosi8JHv/Ee5rqnGnH0IauFlLEX4tO8FEOHINWZah8pg4bRgRY8
	7Y8lstJjW7S7r+4mvCDB9uAy0rYzZnlldpfu0UpuhC3+WG5wZ4aZQxJiiqA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8025jkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 19:03:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235196dfc50so1481455ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 12:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751483008; x=1752087808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yOxKK6pk6MSeBSvknMaULD07OJZv3nVIhMNajSPwiNk=;
        b=I6EyRFXzPUQsGlGNvNTiB33LwQMv6exv2OQjgA42ElWRuvx3K9SW0LTFH/Ir3Igl52
         KWXZMGcKvrb9JBOLM27YTdBu6A4Hki1rePwndQhY0TIFScST/y70pDzf/P+Dg9KF5Wrd
         0gksO6a24lWfLp3xeHnBozrBNvt419ZwA4GjVEsWHShdFzdy5IU/ixZ/hnBpBuqvdSrm
         EeGXFYYriTpaY5L4LOE38kll4mpRMBzGMSn9mEETgF+wg/sHftFspQz88Ms1SI4RCPTk
         nJDozzCc8LfZtlc63lQjRYPuVadbevAc20sYtTPr0925Ri/tH7JiGr6t77pBRO6SEf9L
         LODg==
X-Gm-Message-State: AOJu0YwTXFYm7aSLjojlNsDo3v82ByMLhb/PPk8NRUs3+XCn3MSN9ini
	0lYkRMsa9AxPI+U80Rbnmt3hw07ZJ6feJq49fXgAL71+m1sfB+R1wWmqJhJl/S4v1UPkhkJXFK6
	XjM8vvaos+pl+muT9ghJI5HqGrtez26KITq8NCrNOQK5Pk6jmlpp6LrybPQP8G3qgbZt/
X-Gm-Gg: ASbGncuwNinx84/wM3DZhAoVJ9yq00nKyPbXm7YLcgBAs+/CtIT/XIzBmFOvPxBJN17
	4llQFf4VlgX7Fj5UKE/ME3E8Us9VXAgi95xB9OQ9diyZsQu8uoWYjsvhjSjgwMEs07640/kNDj1
	QCFVXi3dQb96EOV3BU7GkGTk28hoH8a7gdu5CdCPJV9XcTivZqLVX6Uxn2yfUH/cJtlOtVJK67o
	7WxKc2Tzi3oRsuZ95FePKvqoPx1vz3BnrSV4RqfU3u5APxbvptRsokBXGY/qC218KgeEwMfh2XI
	LLBWT8/cPikgKQGVONO1DkZzh7yzbYNv1A==
X-Received: by 2002:a17:902:d683:b0:215:58be:3349 with SMTP id d9443c01a7336-23c793d0aafmr6362725ad.14.1751483008205;
        Wed, 02 Jul 2025 12:03:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyaWlExVheMgjEW/YF4CVY6gNhIUwl29Jm+XSpgsBDV5XaVbkW0QCxnh5MMAB5goe4O3xGTg==
X-Received: by 2002:a17:902:d683:b0:215:58be:3349 with SMTP id d9443c01a7336-23c793d0aafmr6362425ad.14.1751483007694;
        Wed, 02 Jul 2025 12:03:27 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bcbcsm133694125ad.134.2025.07.02.12.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 12:03:27 -0700 (PDT)
From: Rob Clark <rob.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
        Kamil Konieczny <kamil.konieczny@linux.intel.com>,
        Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH i-g-t v2 9/9] tests/msm/msm_mapping: Add wait for stall-on-fault to re-arm
Date: Wed,  2 Jul 2025 12:02:49 -0700
Message-ID: <20250702190249.376313-10-rob.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: 1R2SkPldJaoLdd5py9ZiStwmOwk9cmwY
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=68658281 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=myMhhWgJnj-yCtkpNQ4A:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 1R2SkPldJaoLdd5py9ZiStwmOwk9cmwY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE1NiBTYWx0ZWRfX2W7wv+REajUa
 WOhJq3kxlog0JmFIdbT54WcQ0fUZ3CIcGCsMZbmCip1CDl4jeX8JbG2YVWWRm+M0tz89zDlmtAM
 qlbHaIs8OVdU2jMSSLr6nt+NVSfAVwYC/rO5FmGwyE2fqypryGWbRUbCbGITkG6FI4EdesnUetP
 jCaDviXpAtPfVgBtL34Y9uLsNGb7EkoAl+czGruiEErTQm/ROUTKh9FFvzsga1xxHRrma8IWcVv
 ysazDzTC5gn7ZyfYH6YITbUPHTuWdeAs1Ik4BDjRty4VNAG/8be1Kw2n9FCvSTLGTMLeWGAdh+e
 mab3mXtoTs3EWyF9iOuSJk9OxPtCmIDu5kDy/Z2fAAu1GIi/zbMmHToymJkT9+ESAf98uiTejup
 uQ4CZRMnGk1ArB+AyvYNmrarfFpOG7Jt0FxgQTX6Jacp6OlPvpHNPOV118zLwWRIJ73zSNcI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020156

Newer msm driver disable stall-on-fault for a grace period, to avoid
a flood of faults causing instability with memory translations that
the hw attempts with the translation stalled.  Fortunately it adds a
debugfs file so we can know how long we need to wait for stall-on-
fault to be re-enabled.

See: https://lore.kernel.org/all/20250520-msm-gpu-fault-fixes-next-v7-0-96cd1cc9ae05@gmail.com/

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_mapping.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index f820467a3ad2..d224a413cbf2 100644
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
@@ -227,6 +251,11 @@ do_mapping_test(struct msm_pipe *pipe, const char *buffername, bool write)
 	igt_fail_on(addr != fault_addr);
 
 	free(devcore);
+
+	/* Wait for stall-on-fault to re-enable, otherwise the next sub-test
+	 * would not generate a devcore:
+	 */
+	wait_for_stall_on_fault(pipe->dev->fd);
 }
 
 /*
-- 
2.50.0


