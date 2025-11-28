Return-Path: <linux-arm-msm+bounces-83733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4306CC91AC4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 11:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1A86D34DBFA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 10:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D06A830DEAC;
	Fri, 28 Nov 2025 10:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BDpDz5xh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dp6GO3IB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3888730CD92
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 10:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764326082; cv=none; b=pwOD3GVOEwdGcnUAV5GJxfBwFUE4B9qjIHzEkzLkiMIY/3gnlfTU+TEIyQ2aDgOqIsFVie7VMpDwxWP9GlWfR1Ry4BxRAfxCuiwgBkLNtbwByMiU5O6i+3MXi6kB2rI1TVDSngb7eF3lCOV+ejFkhx5e1PvTezNTa0RuEnfrtSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764326082; c=relaxed/simple;
	bh=3McFV9+MNY0DtMFk+39XUHIIYjw72LprTYXBqI4SwGA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y89R6KT1U9jml816pySvSajnMIK9xtySrcuuLoE5IDkZPjcw0W1Z8W3j3a/C+ahxXQHcp88ucNm61zXPVDVBeconZvEG8xTDgK4OZ1AQgZcg7cWsCsBbIQbwAydhgcDiJP/aAD0RO7WfnOBlYlx/QRb46V9kZyLrJdK+2RKIii0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BDpDz5xh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dp6GO3IB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8Nl883122964
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 10:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tksOsG49Dg9
	nA4MxpHKa0diwA7zCt+Mdk9sP8H6UiFQ=; b=BDpDz5xhdBTByVRlPHItsGkAxya
	X5Up2sJiSn77996IJYwNJOFnTSAv624Z6EnKTnPhrEeC7dy1Bg73qBAiXE0IsNTW
	sKJ06ZwNEAjN8/J7ibOtWLZ27poS7DdBWLNTONO3WOb8/6hSUNJM2dpPNFk0RqPa
	F17FGpgd98IecvYO67KXyjJ+mPjYZe0zXRjBhXe8pe29XRosnlotmLPRDFTErWAa
	LQMD2gI+jvlIePISdQJXYKJ26A6Wgq5ZUS1MThIt4oy7D8klodB1fhoQQdFN1UMl
	PkNCLvOxkG80Jor60OF+zmbZSwOjTLD1Nh6VzKnwO0hmtCbx0I1WyXAapjQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aq58ugw4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 10:34:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297d50cd8c4so59167885ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 02:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764326080; x=1764930880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tksOsG49Dg9nA4MxpHKa0diwA7zCt+Mdk9sP8H6UiFQ=;
        b=Dp6GO3IB6XIOfk3Vbh5TtQXpdI7fZeUniYgjiGwpvy4x8t7nc56ZaX2u1ox9Ew95GB
         FOmJ1FAgIkubO82kuA4gD/Mjvxu88DepuAuNp+l4e4ifq8oFLK8dTHKw1T2ZbkSS7Mfb
         fezd1ew0vnY1KQRx4NvvU4lVKOFK7pt6ZkHDJS6vqgEXjgas7ZnqhZHLwoz2gZH61+ma
         MhpHR/5vNlIeiapKsAsQzJZ941wcZbAqm1Dvr8GlUQ+hxlcWnAUz0tRq7h9/xz5wlJYP
         5rh1Tx/xacGY57Zvqbj7e1jZIDJGvtD2aZbCBjWBfnoMET7TaQ4tVO9fIPBol0ksO8WE
         Ip9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764326080; x=1764930880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tksOsG49Dg9nA4MxpHKa0diwA7zCt+Mdk9sP8H6UiFQ=;
        b=c31TMevq1bFSP8pQmFtutC/t2LIIEF9AVtUEzMvTkGL4MRR+DvQjOsfaU/55uVOaIK
         HyWL0hEybHehbKGF1a/UmQELUSOawdFn9s51SQ6S+7k/YaFux8ObmLDhPyOwL71uYHFp
         HDoN9+FYqvBTrv2tJGMMCE/+QeFcATjqrWZQuKc2MCrf6JBnK8+v3Kr9fpDotjDmQxv3
         Fsm06n7OP7sr4tqdEAt7s72oo3DqoipEm3QK0fq2DB/A0jJwKy1ogSQYsi9EghUumPXN
         nYvNi0D53yNDRdfrLVaLZyLHsY6vJ7Z/E341Z+AOfQgtQdKoFIq7dI6LGSx2mYFFBrsf
         KJiw==
X-Forwarded-Encrypted: i=1; AJvYcCUAmyudrP8zWK8YBvwnJCaji12wycunWYECrdsLfjN7du5KSXt2QwOu5gsfanNYj0B+YzrNejR/ObmhI61g@vger.kernel.org
X-Gm-Message-State: AOJu0YyVbW6rJ/V4PwhyRTMw5OvtYNzeSAEuQFV33Qq7IvSTiBerbu0L
	cZYce3/aSBUrChc7CTKRuBFKY5PZEMzU1jiiaZYxniaDopBgNte7YIZo+1sQpcArGj7T68aN64X
	knqgsfai3b7gKbWDF+Z/9vSc0XlbVhkIzHR4fGeQiymCzp9uFSYnZiMsChYNO6fXgZHeC
X-Gm-Gg: ASbGncuUeQM2qSJKVKPb/4Be+xpq9Iyq5+S6xrv0QuNMw/WSRrKRwzZKrjzM0EhV5/b
	F9xKMo4V4tsX/N1jpAmuu6eP3fhFgWPDbbWUmcfK8oVHhwt4TRCK8FNkYLiX8PXSPDcJ0rFT3tf
	p6bHU9XxteAFqfPh2U0LqoMRQL8M6RvjlP7h6987CstHBJoyr0pX09P/zW+J6M80tE+WIa+YwMS
	DiwsepQ/lxXfbV8nAMnXqHu9jyudRoDRHv2qT+aPjFLO1wa3Iq/QCmI/g8pO+kUn06sGm6A6tmg
	+NqGOmYAbU455bOdWyYdIIZ4dw6uhb87s5PiFSCF+LHpi1dhRJ79mLoNYRSrqWtmnOPzDyrFTWb
	7dcvayt0lfdPw97zJcYO3IUXZtC+mKQXqbLACEvcysw==
X-Received: by 2002:a17:903:3b87:b0:295:565b:c691 with SMTP id d9443c01a7336-29baaf75d56mr164237025ad.17.1764326079668;
        Fri, 28 Nov 2025 02:34:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQsu550Gf8bRhwbobshsjKneIYUQA5FyjtpAtmmp+z1D8G7bxKdB2r9mHvhM84fy3g652XSw==
X-Received: by 2002:a17:903:3b87:b0:295:565b:c691 with SMTP id d9443c01a7336-29baaf75d56mr164236655ad.17.1764326079120;
        Fri, 28 Nov 2025 02:34:39 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40b993sm43098195ad.14.2025.11.28.02.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 02:34:38 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v2 2/2] misc: fastrpc: Support mapping userspace-allocated buffers
Date: Fri, 28 Nov 2025 16:04:28 +0530
Message-Id: <20251128103428.1119696-3-ekansh.gupta@oss.qualcomm.com>
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
X-Proofpoint-GUID: dx9uUjqEt98v0RVUJFPKgEvLIHK358LQ
X-Authority-Analysis: v=2.4 cv=UKvQ3Sfy c=1 sm=1 tr=0 ts=69297ac0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=9b90K331daA_tkPLntcA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA3NiBTYWx0ZWRfX5yks6zhPyy3W
 amrrK7C+QbeGOUzwoELNS66Q6viebSP93m7E99aLA9yTckbKafQoSVSm+7jmNCBUnq157RW/Lhd
 jqBHoI3gfE6amUDekwNjsijckMkzTC9BzXk8m79HWyUvasWK30CD3geVGlMhaUAmSasDvxPkSyX
 Ii8y+Mecy13zSbVkmV+BHTaA5PTZgsEYR8CYDRfNV+W9DeHR8OwAsJaSAJP4qRppi1smATTiqVR
 SewSxcuUluoVjVqbyBmxM2f116wdygUKyscZsGvhOsT5rTqbv1p7Hs8sRqebK3i84liHhR4yBcU
 qu55I03/DD8D+FKgqfKyWsf46hDGnIuVjmzaDnSdIvsWu9819r/0myZpdvYN+pwfAkoVlg7h7oy
 LyPtsSH/BQaHKbQJYHXZDBbNYL21VQ==
X-Proofpoint-ORIG-GUID: dx9uUjqEt98v0RVUJFPKgEvLIHK358LQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280076

Currently, FastRPC only supports mapping buffers allocated by the
kernel. This limits flexibility for applications that allocate memory
in userspace using rpcmem or DMABUF and need to share it with the DSP.
Add support for mapping and unmapping userspace-allocated buffers to
the DSP through SMMU. This includes handling map requests for rpcmem
and DMABUF-backed memory and providing corresponding unmap
functionality.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 96 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 85 insertions(+), 11 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 9bf76e224852..feba79913763 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1854,8 +1854,10 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
 static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 {
 	struct fastrpc_buf *buf = NULL, *iter, *b;
+	struct fastrpc_map *map = NULL, *iterm, *m;
 	struct fastrpc_req_munmap req;
 	struct device *dev = fl->sctx->dev;
+	int err;
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
@@ -1869,13 +1871,41 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	}
 	spin_unlock(&fl->lock);
 
-	if (!buf) {
-		dev_err(dev, "mmap\t\tpt 0x%09llx [len 0x%08llx] not in list\n",
+	if (buf) {
+		err = fastrpc_req_munmap_impl(fl, buf);
+		if (err) {
+			spin_lock(&fl->lock);
+			list_add_tail(&buf->node, &fl->mmaps);
+			spin_unlock(&fl->lock);
+		}
+		return err;
+	}
+
+	spin_lock(&fl->lock);
+	list_for_each_entry_safe(iterm, m, &fl->maps, node) {
+		if (iterm->raddr == req.vaddrout) {
+			map = iterm;
+			list_del(&iterm->node);
+			break;
+		}
+	}
+	spin_unlock(&fl->lock);
+	if (!map) {
+		dev_dbg(dev, "buffer/map not found addr 0x%09llx, len 0x%08llx\n",
 			req.vaddrout, req.size);
 		return -EINVAL;
 	}
 
-	return fastrpc_req_munmap_impl(fl, buf);
+	err = fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
+	if (err) {
+		dev_dbg(dev, "unmmap\tpt fd = %d, 0x%09llx error\n",  map->fd, map->raddr);
+		spin_lock(&fl->lock);
+		list_add_tail(&map->node, &fl->maps);
+		spin_unlock(&fl->lock);
+	} else {
+		fastrpc_map_put(map);
+	}
+	return err;
 }
 
 static int fastrpc_req_map_dsp(struct fastrpc_user *fl, u64 phys,
@@ -1989,25 +2019,69 @@ static int fastrpc_req_buf_alloc(struct fastrpc_user *fl,
 	return err;
 }
 
-static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
+static int fastrpc_req_map_create(struct fastrpc_user *fl,
+				  struct fastrpc_req_mmap req,
+				  char __user *argp)
 {
-	struct fastrpc_req_mmap req;
+	struct fastrpc_map *map = NULL;
+	struct device *dev = fl->sctx->dev;
+	u64 raddr = 0;
 	int err;
 
-	if (copy_from_user(&req, argp, sizeof(req)))
-		return -EFAULT;
+	err = fastrpc_map_create(fl, req.fd, req.size, 0, &map);
+	if (err) {
+		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
+		return err;
+	}
 
-	if (req.flags != ADSP_MMAP_ADD_PAGES && req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) {
-		dev_err(fl->sctx->dev, "flag not supported 0x%x\n", req.flags);
+	err = fastrpc_req_map_dsp(fl, map->phys, map->size, req.flags,
+				  req.vaddrin, &raddr);
+	if (err)
+		goto err_invoke;
 
-		return -EINVAL;
+	/* update the buffer to be able to deallocate the memory on the DSP */
+	map->raddr = (u64)raddr;
+
+	/* let the client know the address to use */
+	req.vaddrout = raddr;
+	dev_dbg(dev, "mmap\t\tpt 0x%09llx OK [len 0x%08llx]\n",
+		map->raddr, map->size);
+
+	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
+		err = -EFAULT;
+		goto err_copy;
 	}
 
-	err = fastrpc_req_buf_alloc(fl, req, argp);
+	return 0;
+err_copy:
+	fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
+err_invoke:
+	fastrpc_map_put(map);
 
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
+	if ((req.flags == ADSP_MMAP_ADD_PAGES ||
+	     req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR)) {
+		err = fastrpc_req_buf_alloc(fl, req, argp);
+		if (err)
+			return err;
+	} else {
+		err = fastrpc_req_map_create(fl, req, argp);
+		if (err)
+			return err;
+	}
+	return 0;
+}
+
 static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_mem_unmap *req)
 {
 	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
-- 
2.34.1


