Return-Path: <linux-arm-msm+bounces-63460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E036FAF6253
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 21:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 963B54A4428
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 19:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C5F1E98EF;
	Wed,  2 Jul 2025 19:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mmn+83ce"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C378B190072
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 19:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751483011; cv=none; b=iYJPV/P+Fxd+4tIG6MOqEqKvFy4jcf2M8Iso6IfODXLzSKV/pOMHkPjG3fUnA9CuHZvENiVTAXNpLL0kACOSp06lFmylYrFxIOx0K9ARrVNHJMbF9ka7581p5Yv4vRFH2X8WAgOTZqXY/LtjqU+27PosMExIBYsUJ3heOZHSKXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751483011; c=relaxed/simple;
	bh=SeRJl9tGpBcHvX5gfjlbfpzCebi8AMTd4CfniA+sqcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W4ZkxmeBKuhfqu8bjGYWBFfZT6HvysM4ROxF/zHCnZAEo9Gkj/PU5Ah4xbygR9ILiw/wuL6wCPFUsr+k/UmMKiFMUjUixQ2qXHJEra2RBrVQ7PCEZpgGDDIDEAJzdTzothAO7AUy65mtIgIy3U5mWPD4FBKex5vqIjCSfdj9fCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mmn+83ce; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562FGSR2025048
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 19:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gTqMT534P4X
	LkzlEGLj1riKtd1dD0FbfymLHKahsx4g=; b=Mmn+83ceqTbVFqEwTD0V/BaBTTq
	s81lu99n0SZHcwcaBsDUtbcp2w0qn+ZEl7VD664wq/56W2+NdSXqbMOae0LTN1hM
	gx9Fmdg0rkgWQq8VJqPd4KyotGVTHYpNkPVSq075O31pyNbayGPWpLYJQRf+qa2A
	PGudAOIaEIuQJ2+N0eYx8FtLgbGQmU7OuDjvCA61DlSSszUlvWmKMbhbDNLBFJQ1
	yskB0lgtesNHTuTjD82IhOyTmUtxISMgVkUpW6yvhvkEgdS/PHP6cqIOFdPkL5G+
	GfRRJHKCsAqOSIo1N2+DHjlV2WYBjm6rmEJqIas/AAXpRfOBpNPZ5feHZyg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8025jk6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 19:03:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235e3f93687so68102735ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 12:03:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751483007; x=1752087807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTqMT534P4XLkzlEGLj1riKtd1dD0FbfymLHKahsx4g=;
        b=vlNfwHGzU/Oq1C+UnpbEBW0+t+tM1mgSFrF90KF/5O6iDJKd1vch3jDFG4aJhR3Huv
         ylGk7fF/xpoeAWJoGs18LZ+FKGeangO8rJXcpGr434MTC6/R1IK942MsK/lHqK6D3qDD
         G5kFexfvaCEF3NLJAWX+ihLYWLba/oFmB+mcz164r012br89FFRSyHRfkmdjmaJRwnb2
         yLG3yI+LYluNlZxYj0fUhbPr2rsRroiWyscFMzCsio5Jhg6xFq8TynyTU6eqFYWEsROC
         JGomlOllKMNr037TDjsE/xqQjzlcV+VCmm9LzwSlk3W/6JisFy/i5fAsF3AlvOKASpDV
         HgMA==
X-Gm-Message-State: AOJu0Ywj2oDrMgBSdJDycw3IEZwfjzwEEm5LIoqb9/sTBX78J/59gT6c
	p0OIsRynZjdjGAreNg2Y09rWLQPF8n2bKoSavgwFHRPYRKvQVn62H+b4AQh7+CRfBO/iCymrlTy
	l9IaBRREjMOBvPsXTx5uqflkQixQPmw6gXrd9oe6pvPXPhtmGUA2zeZ4Pf4H4eCW8zNiFyDnERO
	YT
X-Gm-Gg: ASbGnct/pI74MRPJYRbvo/whn0rnGJiRG6dFjhU0tKq6Bor9dOmJrQuJBUZ/K8d3uHR
	8oC3SQhoDN26bdN8TUw8FxOnKh5O/MiL6oYxYlMLlcCjkvb/ydN6hDqiFc8qG/SPN1WvMAfIqeT
	9zi6shOala4QNfPnm068M8emiQuE/b0HoIaBHxemL+HWw97pYHZpiUiqCCAtvGKCVu2007tNTqU
	LqC2w0lm/3bnuasxtYgGZfSzRqdSxard9lYvapEWMHgXF1MbdxjOCNLtWizu7AiJGEgKg46q2Gl
	beLI9JlmL70gyZup9ZgIxSo1qr9K/rfG4Q==
X-Received: by 2002:a17:902:db0b:b0:235:ecf2:397 with SMTP id d9443c01a7336-23c7968e67emr6108345ad.33.1751483006994;
        Wed, 02 Jul 2025 12:03:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZXw7dIGLnZLdiveYZjoitXLYn4iAxi0Q8ZfmVwKqfDca6Kssu/5Q0Bf1FkAb8/AOU+yXiQA==
X-Received: by 2002:a17:902:db0b:b0:235:ecf2:397 with SMTP id d9443c01a7336-23c7968e67emr6108075ad.33.1751483006598;
        Wed, 02 Jul 2025 12:03:26 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e325bsm137064555ad.29.2025.07.02.12.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 12:03:26 -0700 (PDT)
From: Rob Clark <rob.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
        Kamil Konieczny <kamil.konieczny@linux.intel.com>,
        Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH i-g-t v2 8/9] tests/msm/msm_mapping: Handle larger gmem file size
Date: Wed,  2 Jul 2025 12:02:48 -0700
Message-ID: <20250702190249.376313-9-rob.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: s3In4bbXwQEhF32HXdNU1hVF0zUBquQA
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=68658280 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=vubaehVBMwJoC4cWCuwA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: s3In4bbXwQEhF32HXdNU1hVF0zUBquQA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE1NiBTYWx0ZWRfX74TsrXIZPYwy
 Sur9QufGvx/mZfZ0QHC4+NBfBuDGXDm/1a4w9U8NWa+nrg1AlTwi04fd9whrLW8XJZLZvxuh8LH
 A08EAXY9Jb3YMz6a6YwD9r44qerxrZ2DNz5osesfQW9LWbWqCnDv+uY0W8UC+8UHt4roU0otpyU
 rhAKiVR+wckqH3xOKxyRDp8Rp+Vn87B8K7RmKvRTwr4S+M7SzY+2GSJFy7QGFduByNA+jyRlyOK
 PPM3HyOglHkZw8JXIVF7RelHFLu2P8NbITguItXjLFf5pmSqBOZilzVFubOlXTdcF/0DQSmNQxd
 v3n/bWmw8M/HiKLs40M6BZ4mvlQb1b0aUQZKW008Akb1/UlhDAWZ7KuQ31gYt/zLFYUqUrjUhIM
 93Ib4ahioCDTTllttKaRpkLO55wCmfN4YtyMYdq0tyRt6B3U0bqfnSfNqpWjjJtciW1YYQY9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=924 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020156

If running on a system with full desktop environment, the file will be
much larger than 0x4000 bytes.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_mapping.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index 1e166570787d..f820467a3ad2 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -123,7 +123,7 @@ endswith(const char *str, const char *end)
 static uint64_t
 get_bo_addr(int drm_fd, const char *name)
 {
-	char buf[0x4000];
+	char buf[0x80000];
 	char *p = buf;
 
 	igt_debugfs_read(drm_fd, "gem", buf);
-- 
2.50.0


