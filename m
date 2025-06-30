Return-Path: <linux-arm-msm+bounces-63105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C260CAEE682
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 20:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53A11189E838
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 18:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF3AB2E3B0E;
	Mon, 30 Jun 2025 18:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dqoOWmsD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C5128FFCD
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751306979; cv=none; b=F4Sw5p/dnRi456wOSd9uycydPzxA/8Kiyk/0TkEJQhOer5JObRpNsV8P5PfCls73fMKl+OCI3QTJSYPj7xXjFUeJ5HzB3i8Qm+EaFMi0kjeHHB5JlSy2V5Y1bUzSe6yw7ktKquhzrBARn5vKldoOxtCYdgR0Z2GP5Kx4eqJNHDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751306979; c=relaxed/simple;
	bh=+gdd30YBJnwgBHUDpm5vhfUPUMZfrXlnT6OXY+wiEoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XXKwkjPCuwcUj6zURfwSvmPxkdMn3qQYzKmCbos3tPFzwvjOYs87bv0pxJiWIhlI/aguyyggtopNnBEdOHSkjs6YJIGjXdS/bTT0lABObJ40t8kBtYkxPsA+a+UU1ZLfn5OcZKfQw+2i+UV1P90YGQAvNUyVemRTy2wwdr9dct0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dqoOWmsD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UG1UGi000442
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pgz4s8FJQk7
	kyDkHVj6kgwKaok/lpGZglyQVNF6QRKk=; b=dqoOWmsDWAp1rfH3+FNhn80Sv77
	UN/4u/+tncg4SHZlio+EyKS1EnvtTGwBIM7DS7lffQTsAciOcE5ynhq/ejFeOIN5
	Gjn1m+7kmznY96d9/UbGIOXSHUeDQFD2/T+Tjaw91nHwsMOJ66iKTU6aDGaIE4Kn
	fd2oxSpkgoEdqETwHGnWUtUbOc5jojuI34UK9MH22E7t2XfINKm5L0s2+aZG9X12
	q6iqZ7KK835q9vNQ1wUXaqJF9s6lFh4EULRhM3VsC2EIEcpqkseB3Xq3wNVLuEGD
	svitUH3ue0D61QB+dHXPrGViU++N/3tZSxoVaC7LIUWqLKLD9ZzZsASE1ig==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm5rad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:09:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2349498f00eso44967635ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 11:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751306975; x=1751911775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pgz4s8FJQk7kyDkHVj6kgwKaok/lpGZglyQVNF6QRKk=;
        b=B9alEin3980JAMEuL2iXL0+o53AQUMlJ0DUeF3gEle4OVnrzSYMgeY+jrpamnZA2Og
         J8WgWkiUiVIEwEH3YjrqPrVV42i2NmW0b2+BjFUUmIu7RWKj24IPTqI0JMYCfTA+jCVm
         1UwA9vAep+avkqzUgiWpKQy7RtTfIdF0By06iI8FuOJCipfU1TYJ+l7/EadHQHR9d72B
         adCNeB0li62dyPH6N92/65gtyD+d9A+E0GAQZn3ZWMwUhQq34uZu+/biv3R2b0UhRw7D
         ZKMvRA63iPZnINSsmPsNCMfo5VN2bEFzm1+CZcbJ59os16eqeI+cyfBmvaNOOrrEL8vD
         cpnw==
X-Gm-Message-State: AOJu0YzrWmv6H7KSyIr3Znm7e/fNFLUoOvzCrLBLh7DtUpSkcj7X7ubR
	hoYGRwVdIOi7kJ4iNORwfXo8FhAI5C3Jvx/gJtjwxM6zKGibHSiExxToI4p/uldJoQ8ecY0c5QO
	3iDRvWt487GA9pYkVZXr+rPTAxoPASI2HMIWcDfxibdrqjir2tK3XJVFf7bJwX3C9I5mh
X-Gm-Gg: ASbGncvVcWKqdLB4qCjTQgFV2i7FlX0dCowUj5Vpj28EWH0pIVNom6qr4n7cxiiVoyP
	zncVq68xF8fPQvuZqBSteAU7MM63otfVZR41aLJFYYQs6eYdNONpP7QdrSS96NUaTdHaMK6SnG+
	w0VsUbiK4eG/yxVgjumZ90xMBXUMrzlXFxKzWpXCmoUqHwIjf0vBYmZ87BmPWnov6AYKhZedCRO
	U3O4VGDAPvutf0vWlwtudllc1Kw0OxDrXNFvGfy12uaRdsYpCfUZIwpe7oSyDv3nc8OUoMOBL0W
	8JvWa1CsmYtHCQRFvzuUJJABNmtS0kKbyA==
X-Received: by 2002:a17:903:240d:b0:235:e5aa:f51a with SMTP id d9443c01a7336-23b3549bdfbmr7769415ad.7.1751306974633;
        Mon, 30 Jun 2025 11:09:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/HKW7Hch1kkUtIXV6Hh9HwuHielf7LI9DqpO00Dg/BmI2Q/6TQF178R7NkczStcugG8DNwA==
X-Received: by 2002:a17:903:240d:b0:235:e5aa:f51a with SMTP id d9443c01a7336-23b3549bdfbmr7769095ad.7.1751306974203;
        Mon, 30 Jun 2025 11:09:34 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3bbf9esm86891455ad.191.2025.06.30.11.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 11:09:33 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH igt 1/9] drm/recovery: Wait for devcore to become available
Date: Mon, 30 Jun 2025 11:08:55 -0700
Message-ID: <20250630180903.77990-2-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6862d2df cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=wbXP5UgKaa9MPXhy6qkA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: XJk13FzjCoiIusYpVyhLMzcReLu1npMV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE0NiBTYWx0ZWRfX7uHsm78xhM6c
 /miGdrwx4/fFTqR0ydk7PulfAUU90HWwENQSSNlrX8YYWHoTseM0jD/nh7Vy79Z6PrlAqLKSEEK
 r2Ls6DClGrwCrLQznw+1Xh9FR93CykBZ3EUyZ1iWzARXX5QKT2tg3ZPPcVh6QNJm1bJWgofVm2r
 FEC9b5ClT8wVeTM16pIPu7hv2uhuIKKzcGX4ZukX/9/du2MHKZG5uVvJY6+nD8YdwhexDl9hcYZ
 z8umJm0OsWpVqLT8n67V3lmX9Utx5S4Bfs7qnWNJos4xv0ExItsgZLMvRt3L+jOEgdip18wYh5A
 do9fs6k1BFCj9WNii80H5kW3urCUC8mdnnWtWZPxB1G1fxshaK5Ci/3U05GmFTlurzfaJ2bchwa
 3U1y6WnUvcd58lCXRuQoVG6m+mcdYVPTyaHpRJEY9EcIzgy6bqIU/ILnCxZPpDCINoj2gT5y
X-Proofpoint-GUID: XJk13FzjCoiIusYpVyhLMzcReLu1npMV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=959
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300146

From: Rob Clark <rob.clark@oss.qualcomm.com>

The devcore could take some time to show up, so add a igt_wait() with
timeout so we don't fail the test if the devcore is not immediately
available.

This addresses a source of flakeyness.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_recovery.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/msm/msm_recovery.c b/tests/msm/msm_recovery.c
index fbe26e687ed3..433392079bd4 100644
--- a/tests/msm/msm_recovery.c
+++ b/tests/msm/msm_recovery.c
@@ -44,8 +44,12 @@ read_and_clear_devcore(void)
 	glob_t glob_buf = {0};
 	int ret, fd;
 
-	ret = glob("/sys/class/devcoredump/devcd*/data", GLOB_NOSORT, NULL, &glob_buf);
-	if ((ret == GLOB_NOMATCH) || !glob_buf.gl_pathc)
+	/* The devcore shows up asynchronously, so it might not be
+	 * immediately available:
+	 */
+	if (!igt_wait(glob("/sys/class/devcoredump/devcd*/data",
+			   GLOB_NOSORT, NULL, &glob_buf) != GLOB_NOMATCH,
+		      1000, 100))
 		return;
 
 	fd = open(glob_buf.gl_pathv[0], O_RDWR);
-- 
2.50.0


