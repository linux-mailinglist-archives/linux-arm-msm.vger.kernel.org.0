Return-Path: <linux-arm-msm+bounces-83732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3C2C91A9D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 11:35:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 576D14E3ACF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 10:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B00930C613;
	Fri, 28 Nov 2025 10:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Prb0uims";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="erpIEWMC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6603064A4
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 10:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764326080; cv=none; b=EOSDEGUPvjQdFXYtggOfLvCXSGlIElxFzDFI374iGnjtxp186jswtD2p2CQt1VkiHVLEQjm5LoKkr9BRItnDv/ovYE+YJ3aEDACqxO7GrOp982gxpa/ho2wuj1plAxF5jEQWLYsKD9x5ySDOtHpqf9s3BUtQR5GqNCUIE5FhQU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764326080; c=relaxed/simple;
	bh=uLyifP7SKlrjfFdP++Nmqu+b1mlkdPkRPtf6vWlcRfs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=InY82J/jtep3ZbO4rALzprMDTp3LJDRZQaTf3xDxKNx+UO7wPsDUrJcE3ndufiYorYYEp/yctOOM6sB8f0rHl4eqfbqgCt5nywgvYumUHc8OTJ7BTKnRXBl4OqY3qxC7RjDH3cLL8zR1cNlJxifKx59BaOEKyjtqJ+RK9r9Dqmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Prb0uims; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=erpIEWMC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8PU4k3797238
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 10:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IPnOVWqwyE7
	dmRiwVJlZo4xKYGYq4wHZIwKE6VXPwFs=; b=Prb0uimsG+A1BXpszr8vssiKGrk
	YEwYJVORVs50v4Px51eC5HCZAomwIvvZOqX3rBkHgy33f/WzY99lL0rgJ8XG8nWf
	A6a5BJ8IDcsBfyf1Xvzbu+4k1wGbCmP9g7GHbLtJRp/Q6rJrB5eEDsPFq28qg78V
	5BptPcWI6Pw/0/Zq7+wQyMsB4hcS7jkwQWRZyW77ufJhisWeRH2G/nn0LCF3DoDt
	XRAJZmXClN31cTjpPI2qgpz9eFsxecoUZ2P4NzYqWUSJDgRlmqL5uLU+hX/VjXis
	6Rpko5gWYGt1TxNr4Qe0fpavGnaVDniRBAHLSc/aprWslzZf8E6LBQ/wMFw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apnudau60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 10:34:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-295592eb5dbso29742585ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 02:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764326077; x=1764930877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPnOVWqwyE7dmRiwVJlZo4xKYGYq4wHZIwKE6VXPwFs=;
        b=erpIEWMCcj5HHHYol2dv2fEHVkoTADGwcbmm5nSPDd9cF7oYYpl4zUkn8/NUTKdeAL
         adCb0kqxA3zQmcjTD8q2LgKr+LgHAPaJVfZDpoQ7fKAw69Y72IbdzKge9w7uzOTRPcJV
         URMHZO3FnakbeV1yw2Apne8gy/xA9FkIHtYD2ftX0D1vb4eehWQm3j6BbCyU3rKvqHEC
         sZP7Ch5QojdcTY0xXulG5PuZS8kdf8IUz12ykFxFHDm/NYYUEZOW8lwQx8jZTXPDq8nb
         0FZE9QiINj7ml6gEDVCMX8HZYPVRqna6tPpqRPRK3oP85YddJdByJVbpikedMv3jEK5Z
         NORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764326077; x=1764930877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IPnOVWqwyE7dmRiwVJlZo4xKYGYq4wHZIwKE6VXPwFs=;
        b=mHwMrgmmu2EvbIpa+J7nmo8JDH5kSBDRTg0ipHnGOOw0JuJ0ULcNdyAKO5THfIzu4a
         b87xvmg97vARRjP0DnSEyPUJ0Qwdkz4iHCcYb26n4dGhX3Z6yn3ZVq0k+mAKt/dgMZVw
         BpJtDG2MhOicQx1h8JPQPJDi/AnYAno3uK/tN4VZWxio9DdDaDhxd1cPZ0tz2qfBtGVp
         Q+1C7JV8KCTbxIMHw5OBnRG885bhC71etFHVqC0IhnD+xHdWUr71sNGv5kS1Cwd1jdbo
         D4r2eJS5I83n1qTfHuQpCUgPTu9uT8pt1vBD/8FtIOaEufmx6JCbef1Si3I3CF4xqJMV
         IJMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdykbgg6NJ/XHyyYTwWiHkvkE9zJeIHlBKIPS5g6XtzIhLnV1kC8jTICe2/bX2W9w5nxDiJoppqaEmtOGc@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0wo+tddJHnvhE/LFHbkl3HHOPdCv6kG+ti9gCqzRVbeVa0h25
	hydh1DN69Ysk5iPU3/j4RZe/XQZuElqGDNGBz4FPo01Yu2whBoGF/rDyWft4CsNdxUXjPbWaC9+
	+14IUsbTywvj6Nkmp1sA5UVTZCCRoV/NWYNU/exT1um52fTQOPpEBdxem2CV8M1DgELm5
X-Gm-Gg: ASbGncuvAtvXT8YYoGawoFPqSP90cnDXuf2IeBb1fFa4gWaWgGVPjKrho9HzT4fXUxe
	Rqxoc3N0U5RbpE47gJ6H8gesrZmyBBZi+HKzTPTgznQDPPscVNQ2tVBA5WcUc9cB8CBTy3BcQwX
	Mlk3co+fV70idstF7Gtk4VcPcxd0x3twwK5+YZcMBxNZAjYOLJ0aRX6ZDVgd3jKaaNYqYUmkL1i
	ZQvUyj7FwQDnwXQIbXWXwYImJBBCw8n7kSYFbV0nz/UUiBnOiTpmf+c0r7jOgmNpU3tKc6v+KOL
	fM0dLvmJ3c9siujgHohtQiSdZuzhHZbg7IdKg2MaV1xHLMU0PPvUOSWptvxVgWeV/BFmGMCd05Y
	SehmwRNL+oSqNZ+V3tiDa4PWXo6Q9k08b4HKNb821pg==
X-Received: by 2002:a17:902:ebd2:b0:295:57f6:768 with SMTP id d9443c01a7336-29b6c575687mr281002135ad.33.1764326076497;
        Fri, 28 Nov 2025 02:34:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJ95n2o/SW33n4j5YjSWDtSMjNHUljAZYogDtIPZGtzVCHAvGey5m8vbtw1/igS5b/hrMCtA==
X-Received: by 2002:a17:902:ebd2:b0:295:57f6:768 with SMTP id d9443c01a7336-29b6c575687mr281001705ad.33.1764326075878;
        Fri, 28 Nov 2025 02:34:35 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40b993sm43098195ad.14.2025.11.28.02.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 02:34:35 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v2 1/2] misc: fastrpc: Refactor mmap and munmap logic into helper functions
Date: Fri, 28 Nov 2025 16:04:27 +0530
Message-Id: <20251128103428.1119696-2-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251128103428.1119696-1-ekansh.gupta@oss.qualcomm.com>
References: <20251128103428.1119696-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3Fq5kjkdWZ5cMnGHkCIOADDhUmv74eMZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA3NiBTYWx0ZWRfX5R8Nys8Xg0GC
 LIAbUVKQsJA3FgTVCsZOaLQAyZ5yZlT8OqO7tkz0MN7C6Gy8z54oC+VR6R49713ncXNAX49T9at
 8exsCW2Z6Xrq+zBupjzEzFMzF96E1+nJ6cZADclXLPT/WViJwYd56HZQYJKmRRodNxTtrIG4H8q
 FwHhQpAL5BPoNYurTYFce7Z6W0TjTSVhkBQGJdTFhiFeM1VamnHacKH0E4wFfNd/LUzFyOeFxt7
 oCzMXdwxWtmE5F/BT2vSGw/p/39kalBzzEfI1Vtzqe+icsmXj0eYY4WzNce3oMq9qE2dAu7LmI6
 I/llZn9/hZ80Vdbe2AEaICQhyBIufo5YrvY4YsN+MxJUsXUiBJhg7hZ6YcGXJBZvox4Tn/iX4DL
 ZNMajRjcLU3rbBs2kN9gPWQlMDpoFw==
X-Proofpoint-ORIG-GUID: 3Fq5kjkdWZ5cMnGHkCIOADDhUmv74eMZ
X-Authority-Analysis: v=2.4 cv=MKNtWcZl c=1 sm=1 tr=0 ts=69297abd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=04dbU8GgqVRi9gjLVHMA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280076

Refactor FastRPC mmap and munmap handling by introducing dedicated
helper functions for DSP-side operations. This change improves code
readability and separates DSP invocation logic from buffer allocation
and cleanup.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 110 +++++++++++++++++++++++++++--------------
 1 file changed, 74 insertions(+), 36 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index ee652ef01534..9bf76e224852 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1811,24 +1811,33 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
 	return 0;
 }
 
-static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *buf)
+static int fastrpc_req_munmap_dsp(struct fastrpc_user *fl, u64 raddr, u64 size)
 {
 	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
 	struct fastrpc_munmap_req_msg req_msg;
-	struct device *dev = fl->sctx->dev;
 	int err;
 	u32 sc;
 
 	req_msg.client_id = fl->client_id;
-	req_msg.size = buf->size;
-	req_msg.vaddr = buf->raddr;
+	req_msg.size = size;
+	req_msg.vaddr = raddr;
 
-	args[0].ptr = (u64) (uintptr_t) &req_msg;
+	args[0].ptr = (u64) &req_msg;
 	args[0].length = sizeof(req_msg);
 
 	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MUNMAP, 1, 0);
 	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
 				      &args[0]);
+
+	return err;
+}
+
+static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *buf)
+{
+	struct device *dev = fl->sctx->dev;
+	int err;
+
+	err = fastrpc_req_munmap_dsp(fl, buf->raddr, buf->size);
 	if (!err) {
 		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
 		spin_lock(&fl->lock);
@@ -1869,26 +1878,54 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	return fastrpc_req_munmap_impl(fl, buf);
 }
 
-static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
+static int fastrpc_req_map_dsp(struct fastrpc_user *fl, u64 phys,
+			       u64 size, u32 flag, u64 vaddrin,
+			       u64 *raddr)
 {
 	struct fastrpc_invoke_args args[3] = { [0 ... 2] = { 0 } };
-	struct fastrpc_buf *buf = NULL;
 	struct fastrpc_mmap_req_msg req_msg;
 	struct fastrpc_mmap_rsp_msg rsp_msg;
 	struct fastrpc_phy_page pages;
-	struct fastrpc_req_mmap req;
-	struct device *dev = fl->sctx->dev;
 	int err;
 	u32 sc;
 
-	if (copy_from_user(&req, argp, sizeof(req)))
-		return -EFAULT;
+	req_msg.client_id = fl->client_id;
+	req_msg.flags = flag;
+	req_msg.vaddr = vaddrin;
+	req_msg.num = sizeof(pages);
 
-	if (req.flags != ADSP_MMAP_ADD_PAGES && req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) {
-		dev_err(dev, "flag not supported 0x%x\n", req.flags);
+	args[0].ptr = (u64)&req_msg;
+	args[0].length = sizeof(req_msg);
 
-		return -EINVAL;
+	pages.addr = phys;
+	pages.size = size;
+
+	args[1].ptr = (u64)&pages;
+	args[1].length = sizeof(pages);
+
+	args[2].ptr = (u64)&rsp_msg;
+	args[2].length = sizeof(rsp_msg);
+	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MMAP, 2, 1);
+	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
+				      &args[0]);
+
+	if (err) {
+		dev_err(fl->sctx->dev, "mmap error (len 0x%08llx)\n", size);
+		return err;
 	}
+	*raddr = rsp_msg.vaddr;
+
+	return 0;
+}
+
+static int fastrpc_req_buf_alloc(struct fastrpc_user *fl,
+				 struct fastrpc_req_mmap req,
+				 char __user *argp)
+{
+	struct device *dev = fl->sctx->dev;
+	struct fastrpc_buf *buf = NULL;
+	u64 raddr = 0;
+	int err;
 
 	if (req.vaddrin) {
 		dev_err(dev, "adding user allocated pages is not supported\n");
@@ -1905,26 +1942,8 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 		return err;
 	}
 
-	req_msg.client_id = fl->client_id;
-	req_msg.flags = req.flags;
-	req_msg.vaddr = req.vaddrin;
-	req_msg.num = sizeof(pages);
-
-	args[0].ptr = (u64) (uintptr_t) &req_msg;
-	args[0].length = sizeof(req_msg);
-
-	pages.addr = buf->phys;
-	pages.size = buf->size;
-
-	args[1].ptr = (u64) (uintptr_t) &pages;
-	args[1].length = sizeof(pages);
-
-	args[2].ptr = (u64) (uintptr_t) &rsp_msg;
-	args[2].length = sizeof(rsp_msg);
-
-	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MMAP, 2, 1);
-	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
-				      &args[0]);
+	err = fastrpc_req_map_dsp(fl, buf->phys, buf->size, req.flags,
+				  req.vaddrin, &raddr);
 	if (err) {
 		dev_err(dev, "mmap error (len 0x%08llx)\n", buf->size);
 		fastrpc_buf_free(buf);
@@ -1932,10 +1951,10 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 	}
 
 	/* update the buffer to be able to deallocate the memory on the DSP */
-	buf->raddr = (uintptr_t) rsp_msg.vaddr;
+	buf->raddr = (uintptr_t)raddr;
 
 	/* let the client know the address to use */
-	req.vaddrout = rsp_msg.vaddr;
+	req.vaddrout = raddr;
 
 	/* Add memory to static PD pool, protection thru hypervisor */
 	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR && fl->cctx->vmcount) {
@@ -1970,6 +1989,25 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 	return err;
 }
 
+static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
+{
+	struct fastrpc_req_mmap req;
+	int err;
+
+	if (copy_from_user(&req, argp, sizeof(req)))
+		return -EFAULT;
+
+	if (req.flags != ADSP_MMAP_ADD_PAGES && req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) {
+		dev_err(fl->sctx->dev, "flag not supported 0x%x\n", req.flags);
+
+		return -EINVAL;
+	}
+
+	err = fastrpc_req_buf_alloc(fl, req, argp);
+
+	return err;
+}
+
 static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_mem_unmap *req)
 {
 	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
-- 
2.34.1


