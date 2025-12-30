Return-Path: <linux-arm-msm+bounces-86951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 15449CE97E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 12:02:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EB4AE30060E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 11:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78070230BDB;
	Tue, 30 Dec 2025 11:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kgfVR2nk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g16zbEEJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2011F4615
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 11:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767092562; cv=none; b=ndnZ9etve3mka/5jUS8phUm5ifZwEinidNSR3aNkQxKomJYLa+J8pTTe24dvCPoz68f83pe3Ws9PifjiLExAdOMmVYmgl7Q7H5ktv3sWgYLy+KVZZmNk8rhGyX8xyJqV/pq5PzyhtlQ3Gc2j/wjhFH2Ti8/Iq8gf7e6z7iVNpUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767092562; c=relaxed/simple;
	bh=ZlvwGRaijfFW5xTAaesXx212yCTlRoStI6gpLYYYj5w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DmKq0ZaSPZ8Ff3QK23o/Q4WUL8NGIYaGJOmtQDOSJPYOSyHkOnQ2VTRA3CyqlcBgsuXifRy8cUXJCc2JHdWU4AFyZsfi3EwTb6blMUy1ohgn8uHwsx+JvH0Vvi4Z1mhdO4CyoaBJc+cOtgMML/Jv5IRzntmcIwyvvYcz2Kn8Tqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kgfVR2nk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g16zbEEJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU0ifY72670791
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 11:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uZ7b55cvQjq
	GpVCER9aO23V8m+uhwWqcKo+IPNZIPA8=; b=kgfVR2nkirmq64dlE3pnaxzpPnq
	RpZdbyS+US0wzqfuYlw2iS/bSAIuwhLQyn3QIoZFSmhOJzjWvyvosfUIDZY/E6UQ
	jM3mH0Vtzh26u6lgThbM3oewzj1oZ6YDd9plpej129x1JwuMJzj758a+AB93bREN
	cOG+h26/ip8kHSgwFDThXPPdJtTPKp7kPESajMptS4ILuis1/NSyztS6jmuvcULS
	BZtA8EIq2zVjYf0KyIrtIUVnX0z1sbMdxkruJA4/NRff4RlYKxkKxcUrSYWeSZvh
	ZWrGZ5eLTIbQMoEHFqSBVttHoboNZs3JuK7dnJDqQZ4PUXCVCB51Q+9BXlA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc4fcs844-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 11:02:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34ec823527eso13543019a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 03:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767092558; x=1767697358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZ7b55cvQjqGpVCER9aO23V8m+uhwWqcKo+IPNZIPA8=;
        b=g16zbEEJ9SLipP8dMeYwdBPXOSf7COV1jc3eUWHArZYPyG/yw6occLk3e/u8CKBnGF
         AIXyTH6rAyP6zTdOFB8Fuzi8TRHG56nMvoxhzQLOWDBKbwKNjGgeXtKlpz9otW3wd0C4
         QAnVpo7lB7erygKzZax9ItiaW8jlHKkJdvqTpBcfMDfvJ+PU9alxh0jgB5uc3EWAl8nb
         u2xXjd7ILW+mBEKhA/RZuVTIrkdiiXtDc7TfMerRX+LXGUS0+vOzORKo2x8oTds9k2DZ
         bgpLhWMg0gO4pWayV/GqxaKVC5tKImbmMPGr2MjTdb2wvA5tZDwcNpxt3WKZ9xyc1RWJ
         DGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767092558; x=1767697358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uZ7b55cvQjqGpVCER9aO23V8m+uhwWqcKo+IPNZIPA8=;
        b=r5WakyMN16B8Rq7wjXAF7bD0b51c2EOs1baoaCqr8q3OQlPuNEKQXbIjm887X1FcLd
         P5ByH+EeWLapIoa+9QjMjmq+wS5z3FzFLF9SozKZnoG4s4bNRBVgEUAemCfsSResL4Gy
         M/pCGw2l2Sd26KE/RC1/5CE84liYAAykX5QbODVPPA8032rLRX1iuM0Ww5qDJhKNdqL6
         ih1x+wWkMFeYDMfCXegm3dEsz4vSlHgnhEFw6dn6Ee1fCe8rUxaDTuwgtr55lKDHLXJw
         +WiCeHfHjyjXYlD/OHucv1Vgq6jmx+VOGFHULzS+PhilHiTugohQiXMk8mF9lQpNgoso
         LAIg==
X-Forwarded-Encrypted: i=1; AJvYcCWfQsnP3mlVAPVoJXbPEQyninFS9hNBgfqiGpYnchfuBlszywJDC/gVCfip9UGkcMDQC6znqwzXqkL4piYb@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa9STAnhIfMT0oa/6Ge+tJBFhmHU1i80ZMhJ2U6BPjX+DMc0VP
	Ak0+UcYxd9CaDEUpxVo7+DmKEwpN3oLf5gmy506rbXZ0AZ1w+bjcktb+mEXX119rgH2UW4Qj1zi
	tNRD66xTmEXz2755w53n+xN360yy3hJTNquMuNRbr4hkVOfksmO6iX3xYj1/4QAcfARs4
X-Gm-Gg: AY/fxX7LBHFcmhTlfaORVVGTPygxdIwFWtO/g1ULjGZEtpXmvbcCAdA1Ung3wmjJbfN
	aWegIICq/QIIeE2SnoppXybUHzMWFOgvoGEnHwIt4jsov9cxzi7RUd5PwogEh/Cm5N7tUYAtEKa
	QEPmrd5ZTj/bQcPfjEtYnUFI89m40MvnyIaJxD1XurD8Y0gi6Fo8dD4EpxYKkHEKqODXd+ggv1f
	FnsyBl64T7UyciTsMVcQq4isUuy0wdIU07++aW+ki0hHi63cr4W2ZpD1J4x8tHiEj+qIXgvyIC1
	G8oQ1jUoqU6MUgXrgxcQKgYiK9BsKd6+T4hDIREOYVmwW+YnfNLurN4uRVxROh09ZlAJ3KBNiaA
	fXzyByrDYOWs7dOUDALldOS2mQFhTOZdrhtPLDUwxwQ==
X-Received: by 2002:a05:6a20:6a09:b0:371:d67d:e56a with SMTP id adf61e73a8af0-376a9ae2989mr33085246637.57.1767092557532;
        Tue, 30 Dec 2025 03:02:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1CkBNPOEDBq7uLze8A3MeLEdvhLojl1SQfevGINRj4fuvJbn/fzelF4LuaAuwutBx4iWerw==
X-Received: by 2002:a05:6a20:6a09:b0:371:d67d:e56a with SMTP id adf61e73a8af0-376a9ae2989mr33085211637.57.1767092556872;
        Tue, 30 Dec 2025 03:02:36 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c3a4deb6f17sm2556908a12.22.2025.12.30.03.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 03:02:36 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v3 2/3] misc: fastrpc: Refactor mmap and munmap logic into helper functions
Date: Tue, 30 Dec 2025 16:32:24 +0530
Message-Id: <20251230110225.3655707-3-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251230110225.3655707-1-ekansh.gupta@oss.qualcomm.com>
References: <20251230110225.3655707-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YtwH7YFXR4GbvHrDfDb0V3qASEHknngO
X-Proofpoint-ORIG-GUID: YtwH7YFXR4GbvHrDfDb0V3qASEHknngO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA5OSBTYWx0ZWRfXymz0luc79oYm
 eVe10tpZufgUArOmN7MCA+XmrP+rMa36JF8nm8SQrW26hNelPcar1eOKIvzTpKq10tzS8z6bPv1
 B1lJSxAXBEGGZqZ2QFPBglP2hH5UcnOKpyDumMz4qbSxndJ3/2r0zVNtclsp0nMcMmN/I/bkucm
 S/NYpnngWjGLU7GSKhD5LN372ZsBv7+X2rB4YxLXd4zAB7C84QXuYRp0z3Y+RmVxIch0uxEMr4k
 JosNC7akeEHmZThluVIF3tgf0pn1cxxKmoNmVjehdDOvUfRyPAgtp/a+eslz1aXtK98tyNjYxXt
 kVKMoZ3F4NWpU7yRLUeWvRe8nVf/ZjG7myBO7erpUWoZXWYMewpdH73P3dxdLDkFyrdGxeo2Uvr
 81buMZFrBgpV7Z/ZGwUiG06gOhuEcp7Y5QPQBdSTtos34DJRTP+InQzydZjkzmD4W5XbKDCOumo
 i87WZ00X+eiDvEaPf3w==
X-Authority-Analysis: v=2.4 cv=foHRpV4f c=1 sm=1 tr=0 ts=6953b14f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=04dbU8GgqVRi9gjLVHMA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300099

Refactor FastRPC mmap and munmap handling by introducing dedicated
helper functions for DSP-side operations. This change improves code
readability and separates DSP invocation logic from buffer allocation
and cleanup.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 110 +++++++++++++++++++++++++++--------------
 1 file changed, 74 insertions(+), 36 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 408fe47e9db7..24064efe5dd8 100644
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
+	args[0].ptr = (u64)(unsigned long)&req_msg;
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
 		dev_dbg(dev, "unmap OK: raddr=%p\n", (void *)(unsigned long)buf->raddr);
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
+	args[0].ptr = (u64)(unsigned long)&req_msg;
+	args[0].length = sizeof(req_msg);
 
-		return -EINVAL;
+	pages.addr = phys;
+	pages.size = size;
+
+	args[1].ptr = (u64)(unsigned long)&pages;
+	args[1].length = sizeof(pages);
+
+	args[2].ptr = (u64)(unsigned long)&rsp_msg;
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


