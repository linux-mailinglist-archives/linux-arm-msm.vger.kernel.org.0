Return-Path: <linux-arm-msm+bounces-63459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E34CAF6252
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 21:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBAB01C44F16
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 19:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28771A2393;
	Wed,  2 Jul 2025 19:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dG3Gyt6g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC861E98EF
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 19:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751483009; cv=none; b=kXa/EDNPGxgseu/2uhFEKSpsgaIT3+8XLPRspJabB8dgxSTBVfI+gjp6te+b6Nan8UXUUaAcnwFinlwzVukB/FGnu+No+k1LVmoxF0v9jA1KHiGSYixI9j1Qur1lQqGtuyo73QHnzqaKTv5yJUGGKQvROHDcGVI4rNr28VVAnvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751483009; c=relaxed/simple;
	bh=mAD0YjbmekuySoQFBsMpPbWxOnsbCcsn6QJBfbQ7nEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KFW5+QLlvUYMc2XRRZ+P570NEjak+1Y1MfKz64muOjyUaQvz4BjCwv6vGj19OxrghYCDhWCeeWFEmNdk2L4vFULXlGT48G9D9tLlVFBMQnzq3KVPYzlKqTo+rHfa8h5fRbsrWMGu4qAqTv7F4dkIQmYVwQu1/rphP/Klcz7U274=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dG3Gyt6g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562IGXI7020529
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 19:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RVieOWNeJ8M
	MdayS7WadzxA62ARSjnJLctXxysDjRjI=; b=dG3Gyt6gRioW1gmdTtRBFOsVFz1
	JPJ0aeIfI6zvDUQftDe9Uvk+AqgH0sp56HIyWavuRHUwOZv553jkSrtaE/Q/F4nF
	S08lJZmjXp+9HS0mS57eXMmjKVx5uv/R2mXMkZPSiqhhZPd2JYPek5BJneDNCDRq
	+wT/gi16jofFj+3hyRZUUCqmSduonzOEDez2ZkkivonorGMYX7soB74SJWxt2bJB
	quoQp3rEtDqzxSCIECydOfAvZRAlQkhJMHFOln5P0NhwfmEVkWrBbEbbyEmjn4sc
	ClM5gIay983NSy/cxYORXJiDLjaMD5aCJb7kNZZp/hBF6mEhPUe8pMdiAYg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn4dws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 19:03:27 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-749177ad09fso2131820b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 12:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751483006; x=1752087806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RVieOWNeJ8MMdayS7WadzxA62ARSjnJLctXxysDjRjI=;
        b=V83MmBZxLkGT8p1Z0AQl2YGU9cZnezFtsF2ME5qrdOFjzVgDiWyzeGReI6/OjpjhCX
         zrXSjOjjFZEDqd8jUe/ZT5qf8FAIXqjBkjyLAL8WIj/jWQJb1BeM803b64AYS9F7VBZY
         ZE8l1tcl5n4tPqiVt+IHXKyAHaG4Bd54O+aBvJG7I50sUNYq+pPJ3tsGWVAsSLBxpBBY
         eetDemhywNuLfnoNjtikE3Fxl2vSZ+qu8Yx3wD/fhZCIE9OoAxujt9Yc27byRw2CsRlE
         SYt6tz8XAzXyQ2EUnkDLmEA5ItR4rl8uuYecGfu58dQ+k5zVJDDPLS0aCBPqkCVUlYAm
         vtXQ==
X-Gm-Message-State: AOJu0YyslZDCY/MqcibgcWglBWD1Nhy8LlLN+vnxn1lFzXpZaVJzTbhv
	sOrf7Xj5GID4xEKwPM/5SkOuJ4bI1TdjeY/Wma3gSdEXiyeQitbkZ2z9yx9jJKZ202GfEgQSU4K
	sEQOwKbaIaJQzGlLHF7N54oZtUzPQHdFDUNNXRi2jWAZyIoh6Mo++TmhwweD29ZiDKoJT
X-Gm-Gg: ASbGncvEzhs4YNPi1Nfun3MGo1bF5u9snx0PMM5cH8hVXj78DBKPmhRC9JBSJXDaxMl
	o5k86062DSyVSiKDgvHi05WxdA1/tPNgN+wAX59MlJ3/nQ1+1tkEFNxt9twkn0Zj+4kqBaxRsBH
	0fJHeOTdVxxeNmavkUn7J/RsnUI2PKin+OdcnyjnsFyNbh1DiV6J3PRB4kz/DldbzYXUWMmEP4s
	Qk0xp1ppTJUSKFSEfTR/cdVOtcs8OjSMxbhGHZQvgakiQNIzlTGv+vw4LuUbfoPJrW8LK3jBqkU
	sQfIcqzisevMnnWl9ou+WaiFiq8h6ug8Pg==
X-Received: by 2002:a05:6a21:32a8:b0:1f5:591b:4f7a with SMTP id adf61e73a8af0-2240c3afc6dmr897825637.38.1751483005878;
        Wed, 02 Jul 2025 12:03:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4JCxNMzkHFGamTgBRTgqFiDHwKuAeuy24Hr05yKIF4gb7mpEXVdg7LMk/xaDgCwibv25LMQ==
X-Received: by 2002:a05:6a21:32a8:b0:1f5:591b:4f7a with SMTP id adf61e73a8af0-2240c3afc6dmr897800637.38.1751483005486;
        Wed, 02 Jul 2025 12:03:25 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57ee760sm14274269b3a.155.2025.07.02.12.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 12:03:25 -0700 (PDT)
From: Rob Clark <rob.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
        Kamil Konieczny <kamil.konieczny@linux.intel.com>,
        Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH i-g-t v2 7/9] tests/msm/msm_mapping: Wait for devcore
Date: Wed,  2 Jul 2025 12:02:47 -0700
Message-ID: <20250702190249.376313-8-rob.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE1NiBTYWx0ZWRfXx6rl8SwOG46e
 GP+863gj2R+e4FzAESRHAsOMpNyI2KypLMpXfNDa9gTE704xi85J0vFESuRkYVrPpa8HpqiWR58
 ZEhdQJq2UgeubH1hsw0dpwpMJq59WnBMtHzhamBMZQZWl9Y99cUiAwpM02Aw1V7br14oEL5Kn6C
 nVp8/ghdjzPpyxkUbF1riIvmZOb6Mik+7/AAoj9xpRCoBvAxMM0Z1VIQ0yPHPE9UoGuvsG2DMHV
 qTXwkfzJ37KyxievJwBbKdhH2Xxf7pkAsfGhcgXCAoa83IfyfMUuSKfBiaiRsGhMcxw2JSno1XU
 HkzKBCO4wZgRm8RCu8W+yVXZq4rlfRCOlKxifUe0Vbn6cW+jnAuugICZIaOrX6Vdy0s9oIm2V/3
 IVhcE7EhrViKkpt/1x3DQpAFD1gJOX1eK7rY20sK+lsxLfldDF8+GHAHw3DxTBDW2EZdqNjM
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=6865827f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=wbXP5UgKaa9MPXhy6qkA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: izNPtA3zulYiS2K2P7O8Fsw0oHZOTbG4
X-Proofpoint-GUID: izNPtA3zulYiS2K2P7O8Fsw0oHZOTbG4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020156

The devcore could take some time to show up, so add a igt_wait() with
timeout so we don't fail the test if the devcore is not immediately
available.

This addresses a source of flakeyness.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_mapping.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index 95f5f5635881..1e166570787d 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -42,14 +42,18 @@
  */
 
 static char *
-get_and_clear_devcore(void)
+get_and_clear_devcore(int timeout_ms)
 {
 	glob_t glob_buf = {0};
 	char *buf = NULL;
-	int ret, fd;
+	int fd;
 
-	ret = glob("/sys/class/devcoredump/devcd*/data", GLOB_NOSORT, NULL, &glob_buf);
-	if ((ret == GLOB_NOMATCH) || !glob_buf.gl_pathc)
+	/* The devcore shows up asynchronously, so it might not be
+	 * immediately available:
+	 */
+	if (!igt_wait(glob("/sys/class/devcoredump/devcd*/data",
+			   GLOB_NOSORT, NULL, &glob_buf) != GLOB_NOMATCH,
+		      timeout_ms, 100))
 		return NULL;
 
 	fd = open(glob_buf.gl_pathv[0], O_RDWR);
@@ -176,7 +180,7 @@ do_mapping_test(struct msm_pipe *pipe, const char *buffername, bool write)
 	int fence_fd, ret;
 
 	/* Clear any existing devcore's: */
-	while ((devcore = get_and_clear_devcore())) {
+	while ((devcore = get_and_clear_devcore(0))) {
 		free(devcore);
 	}
 
@@ -209,7 +213,7 @@ do_mapping_test(struct msm_pipe *pipe, const char *buffername, bool write)
 	/* And now we should have gotten a devcore from the iova fault
 	 * triggered by the read or write:
 	 */
-	devcore = get_and_clear_devcore();
+	devcore = get_and_clear_devcore(1000);
 	igt_fail_on(!devcore);
 
 	/* Make sure the devcore is from iova fault: */
-- 
2.50.0


