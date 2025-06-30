Return-Path: <linux-arm-msm+bounces-63110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CD5AEE687
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 20:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B557164C8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 18:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA25F2E7171;
	Mon, 30 Jun 2025 18:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oDC+4khs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226062E6D13
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751306984; cv=none; b=NFrg/KkV7wnYho/IeGxYkyzmg0TARMlL+dbF995vVlfcTVYwH+bX3QuYjFGt4hmCmzCuAEffiwICLjeC0FgTtLP2PBn/9TmSDc5djlQMMvhlch0w6/t5nWkZs54WJ6kK4AQIQjEE+7aB+taii5/3hVO9/mWyUTrGNAMC6QqdwTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751306984; c=relaxed/simple;
	bh=CefGHTzw+UL3JFVaquVGmfOZ0f7o6lAdf6wRXh4UMMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B8F23OKrXRbKhSoHzCDb3q8knR9RiF0rV/RsS8WshXLXj1QjWzhS23PQ8vy7RH16KbeG4vSYCxPhB9WmOffal+ccpsvYKwGQbX17hp9ofg9jFSc4rixU25ke6XrWRcXodNGZle/xRMbeIIkC/LD+MHYwgOlSMAuPML3yimdI4xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oDC+4khs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UG0Lhq024769
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IJiSwEtwyhG
	HJ8M0kjstv8lfE+Iqb2Bj/fqH+PX+6CY=; b=oDC+4khsKjw4F7pN8vKdhaZTVBr
	kO+z1hPQkTTgpmHrBsobY4kPL2HB70BfPVGBkpwPjnAenmfQyzr64xdG520wCjP5
	KL8FaqkCg2u8O2s3a8sDF8gfVmWKSmlQCXYIC/sjQY7u9H5b4RW3MirKm3mXIQsG
	r35uM8NWEE1pUavChNGDO7dwyRxn34zp3ob4eTbW5kwHodWL8oHTc2Q7FnfgFLhU
	AcbMVNJngwNlCc+Nh0YAfrZ3dY8scU6LQRhbB84/2BSiSwzbFS8E7Es7Y+SAkGqU
	RmvaGimQJ1zBQJgZeH9xFamHaGRFJhEZDkmQ7cq04ZFJTtZsXoRfqiEG88Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9dqkd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:09:41 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b1ffc678adfso3173160a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 11:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751306980; x=1751911780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IJiSwEtwyhGHJ8M0kjstv8lfE+Iqb2Bj/fqH+PX+6CY=;
        b=womO1em1wDggIDlJouwb+vz0fcoXdv1lOa8GMzsCGxBpGK+rPPERbuUR34stZcChS7
         aW3tv870nXKFpBviltq/VPW1fCJcHGqvWNWigHdUES9IYmRpYt7M+vDDUvpNTYHdESCN
         bCdgA1sV1H/9LpubRXltfmSKc4c0EL84pMmWtoRakabSeAjP3ceWEdnEIU6PzdNIOl0U
         2pheiuZbFjvHuE/ey9zxkoM9BWC98iDORUzDQAYVtSNYTX2BO3DfLbJfqm7qGFB/b3NQ
         fSXFimzmU9LGuuwQZM22N2aHzTZhjt7AutuFhfjuO+leae0tcQCMNVTeil+MMR8PfPB5
         81ZA==
X-Gm-Message-State: AOJu0Yx3lBNykwESNBqH0kx9pS6krtR8/roFD+vyl2OIK4ExIdgfbdCs
	xsjPV66OAm8vXXR5fBE9RKSzXu/PN3nmujbWjS6AknNKuo2ohgImLpUheoDM+LWQD54zctUXf/Y
	faAA1H+UqO8e+9YryUolhAe3Aw/Wk3tZ9J7zfGP0jyWy8OnwyC84FI2ADtbPNUVwNJrXQzEfAz0
	Av
X-Gm-Gg: ASbGncuiBPDp0ARSxOnfIvH8OcUkV+XaaOY4ArpFjGbE7bK9EJNN8TImjDgqNxtFRsn
	VyssgLRtDdgMI6HzGS488b7LaNXBxYd3BoPk5Wp9GBEUOLxjou7ZlOCawjvCx/gvWVwZCFNEuKt
	sa4jd2Q/4WlUSwqMOs2ifZu+RFulQHHvVDhULnkihgejxn9RMZxaIloBUR6gJ9pVbhQLqhdFPsC
	0FKIYx3uJeUk8/RdcUULLicYe2CyTQXhlMy5kM9FTcB2RbdolQxdNC9WEtHWEB4uY/AF+ie0Wxq
	izbkIq900P93a64SzzX+UYr4GAYXN4JK4w==
X-Received: by 2002:a17:90b:2e04:b0:315:aa28:9501 with SMTP id 98e67ed59e1d1-318c92fc24dmr22258531a91.24.1751306980188;
        Mon, 30 Jun 2025 11:09:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtiTNscH74VIL8AiO98nrken82aK/te3q39Fjh+6FmeGfvmFe0oZZxxX0DMuutqqN00TSBpg==
X-Received: by 2002:a17:90b:2e04:b0:315:aa28:9501 with SMTP id 98e67ed59e1d1-318c92fc24dmr22258492a91.24.1751306979692;
        Mon, 30 Jun 2025 11:09:39 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5437e97sm13461953a91.40.2025.06.30.11.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 11:09:39 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH igt 6/9] msm/mapping: Wait for devcore to become available
Date: Mon, 30 Jun 2025 11:09:00 -0700
Message-ID: <20250630180903.77990-7-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=6862d2e5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=wbXP5UgKaa9MPXhy6qkA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: E8IQJ_hLnNk-KP-Xu3Zb_8KK7nEFraBX
X-Proofpoint-GUID: E8IQJ_hLnNk-KP-Xu3Zb_8KK7nEFraBX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE0NyBTYWx0ZWRfX/b0wJpMeinnC
 3MId3iMSk995IW2EJ0InMi4LrSsVLOQ5umTqzeKCPXNWhTP9EZBlp2SIDtiviHSXvH8zvEIlpaJ
 HyA2doFUtijcvFc5b+MJ7JC3twDE2q0fr3I9lXtNUx4xpi1NExnNn1GhRx1hrwjF5M2W4GopfP2
 mRCuYzSDvpI3YDtfWMWWjzVtkmyg+aIo8s4f22lfk81fVV47mtfXJjmSNmjh7veQAVckiiC4gbb
 +a375/wqO0bO3dEXhVxn/36J67NPbPzWSYjS6uL83+OWD9hCPWq3ssRKdiwKoza3gX7wrk5BAce
 4WYDD8fzQwatCGp2WDgLPAtqtvUYvyvf2HkFOTCHCPUKXA08Jp8UB/lY4HPN2Kzc6Li/tOcsfdH
 eCitM599w/5jH3gOJmyWwOvmKKN5cwFKqCp/zWw83pTBtx90QZ7pob/XhDWcgxbIMh2gepAh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506300147

From: Rob Clark <rob.clark@oss.qualcomm.com>

The devcore could take some time to show up, so add a igt_wait() with
timeout so we don't fail the test if the devcore is not immediately
available.

This addresses a source of flakeyness.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_mapping.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index 846385bb5206..03a9e814c931 100644
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
@@ -175,7 +179,7 @@ do_mapping_test(struct msm_pipe *pipe, const char *buffername, bool write)
 	int fence_fd, ret;
 
 	/* Clear any existing devcore's: */
-	while ((devcore = get_and_clear_devcore())) {
+	while ((devcore = get_and_clear_devcore(0))) {
 		free(devcore);
 	}
 
@@ -208,7 +212,7 @@ do_mapping_test(struct msm_pipe *pipe, const char *buffername, bool write)
 	/* And now we should have gotten a devcore from the iova fault
 	 * triggered by the read or write:
 	 */
-	devcore = get_and_clear_devcore();
+	devcore = get_and_clear_devcore(1000);
 	igt_fail_on(!devcore);
 
 	/* Make sure the devcore is from iova fault: */
-- 
2.50.0


