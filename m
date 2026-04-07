Return-Path: <linux-arm-msm+bounces-102102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPoUL+rW1GnuxwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:05:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C963AC834
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9308B300645A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 10:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1C63A3817;
	Tue,  7 Apr 2026 10:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PN2stMdC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j+CRpRgQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35BC3A75A5
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 10:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775556327; cv=none; b=CIyIzSAyYNharIVjPJYXr57DDaiSRwTgsY2bu1ZlrLUlKjK0mAwvYN/0qvfUKAT8gRKxFPRmPVZhj9LMGJGxPoFWeweZiCnrTney0zyCucBKXLj0ZTI4G+YQbUbU+HB/Aa+KHjdSM/N8plJ6Aov2Z3s706uIv2hMEyX06Bil8po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775556327; c=relaxed/simple;
	bh=z6vbDo0OkzuQGNRRmVefXteFHpfMXlyyWBpHr+UoyQM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LWTLQlN7c9TPlLXba7wqTYtNpP1R2LZMs+jCe0ZjKggKN//gcSTe55hq1WjSavQp2gEjY1Y+6698bDXOw1/xcojUfcTP/aPPHZK9NDodubnLUyVElSAhjc22uCQvLUya7HInUhZ5pb4YMvGCiQ9wEJef0gvp91BC1ny1JSqW79o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PN2stMdC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j+CRpRgQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376Ymg0494121
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 10:05:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pX4/CzTEsQ9
	azlafCB2t1IsspVCg3AMoDjZdlkJJoE4=; b=PN2stMdC9hcPqoVKCoG3sy/+JYZ
	eMxF4hFfSvL1LwxthRerBWciWhWbRr04OxKzGywNvrQdrM9OvCE1XGVuNV2/Ivz9
	mP8N0Mu6ZF5FdkOyS/OS9rA8b0WulniVy8qBgqHgoEWJGEcBKVev70eXtvavGrJQ
	Hc40ej5nL7o9Y567+rR8WY333w5unoVxLDK06CDjkaRATyt93cz+5R0myHf3EXUt
	0nxs6BGYrpubi5Ns64Bus9P9WMOeVTtMF4ZjYHwNCHc8VlG2WnevDpVjuIc4/RiT
	cCYI6ATPBF/EJS+NhMUQHL4bO8UOmWPacFks2ldG1f8WlcT68spMG3UXAIA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8t5rn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 10:05:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76b0e04285so1711624a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 03:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775556325; x=1776161125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pX4/CzTEsQ9azlafCB2t1IsspVCg3AMoDjZdlkJJoE4=;
        b=j+CRpRgQ8+8SRivJNcKAb9CmAAt1xs6kLyPbgnfP9EJIkWwJ5Urf7xk7dDmOILDPMf
         7c7MBnP+fZ5ao2dk0g4g9xsKndlmHeZ8K388vyh7eiuvqyQuOrHFcUry7bdd0RnV0Cd5
         DsYcsR62eNQLyW9PR3EXLGT44i4iHFWBlCa+Ux206wKSoGYsW5JK1rL5kgmG5IFo9fQz
         UPdyok/Jh4J5zF8tJO1wbp9y7oELhM1OnJ9xT/+XChtkAfLng8hPqWtHeOs98jEoXylq
         ua0T/nW1LFFjDn0QC+so2rIbKH4A/wkCQTdFtp/2g+d6fuK1qBS6KcgI2ndizHp0iEjs
         ZLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775556325; x=1776161125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pX4/CzTEsQ9azlafCB2t1IsspVCg3AMoDjZdlkJJoE4=;
        b=TLODC2Fx5lS3cNHuLBB55If24fTfSOkfa0O5RPD0kL4oHcf/UplcZysflu3rlkehxP
         x/4C8QlC007bkerg4AhM/4L7kWViFG2s4bPFP7AHt6uHSxxHhgBQUmcF940nNrZvkp6B
         n0fU8mYGnBb1dKPbWpeWq5T/Ov3HWJkx8EVJX8RIKrx1O5slsLg3fHtBYtR4NmpTk6rx
         qUmWumFXQsT8OxGIs32RZzlHOv2HUyyegS+Vg9jo7HGbBHkyCHQILxuZCIVC0JNgc52O
         z2fAeG7q5hvsco2gWAilDE8RLa6Vp3qV1FLY7N1/73nf3eDqqhWHGajCFe/FWHk7gOQA
         juNA==
X-Forwarded-Encrypted: i=1; AJvYcCURTKKJd28IgkqdBXDvRY5jKEgRaSouXAYohkv93X8m6nXtsmI2MxDKvWj6XcJghVkh3OjwYwxLUUtKJRwd@vger.kernel.org
X-Gm-Message-State: AOJu0YyBZK1XN7aAX7V8jsZhXg66aqzeTQ8whj/ryUwS5jKafX+SB8UO
	jqaf6B8KTQM35bEDTBhFyti2dh86TwkALOxR5dLPdAH5CTtnYbyyoPCDJvaWiMNUxHHuqWI8S3d
	SbqQtQjlx7THYdCcM1M01FfVYp5H0kmAM6PMuq/36w5a93CHSNqAGtqhglxi1Qxv8ZEIM
X-Gm-Gg: AeBDietTPHer7aMotva9XIX5CwfgPIoijsfoAhj+J+MvhWnWRmxxpCRWXeiXz6kSS0c
	lGkKdetr024JQq6GTq+13TYTB6z+/cYGlz0IOPRIDGmEHjIgf/tFUdDeareKxFYl8qD90hF/w5A
	kTrvTR8I+Y76NDjIktsztiyMf8IW4LHg4uMK2aQEYIriLk4mVgRqa9QXPuUtEwvZziCqpKoeXaU
	Snrs58pZJmVUqcRvXv31w3pHSbkcCxJ5GGGpWI9JL42F8HsvB61gYSC2xP8KnPmc1ADlm8miAhP
	5nPac4Ze8Q4uxbzlbbL7dUze24W+LTfRRLByn+TpDxtQCeKtSsF6KfSzkHWRqcBv/3Hq5kYT20f
	IHTJzt9zUtZ8Fjq90IFQ65lBzx03XcKOsppT5vD9kJc7u4KaZpsU3VnyBcEyCHChBi9QGBsLNFK
	5NceZ51/rYQC6YBJmKiQ==
X-Received: by 2002:a05:6a00:4513:b0:82c:21a9:9d6b with SMTP id d2e1a72fcca58-82d0da7be5amr13889068b3a.13.1775556325451;
        Tue, 07 Apr 2026 03:05:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:4513:b0:82c:21a9:9d6b with SMTP id d2e1a72fcca58-82d0da7be5amr13889032b3a.13.1775556324968;
        Tue, 07 Apr 2026 03:05:24 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b272bdsm17844323b3a.12.2026.04.07.03.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 03:05:24 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        linux-arm-msm@vger.kernel.org, ekansh.gupta@oss.qualcomm.com,
        quic_chennak@quicinc.com, stable@kernel.org,
        Jianping Li <jianping.li@oss.qualcomm.com>
Subject: [PATCH v3 2/4] misc: fastrpc: Remove buffer from list prior to unmap operation
Date: Tue,  7 Apr 2026 18:05:06 +0800
Message-Id: <20260407100508.1027-3-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260407100508.1027-1-jianping.li@oss.qualcomm.com>
References: <20260407100508.1027-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 52MOhPJ68jx8kybl2jt5VyD4Ezgkj879
X-Proofpoint-ORIG-GUID: 52MOhPJ68jx8kybl2jt5VyD4Ezgkj879
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d4d6e6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=ZnmZ8TzD_GdZzTgawW0A:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5MCBTYWx0ZWRfX9DXaGZ970mHu
 V5l98jiIeXwo+eRsixyjPJ1aWKMNFRWgsw/rByJ3q+BmqNvEZMpukV53GWbfgUeht1GnGAyKK0o
 n/JF7zTFT4PtfWSU+6T6vumCXq9yG5scddmMHVsZmm4b80jnySq9U0P0bnqThAV5Qiub/xB7J8m
 BFSQHNXqGdnKyIEvz3Shpgha2KR5MZrk1215egPWKvchyo7OyPC7GIBuKkfT3nP0yGXVh/wejDm
 plbfJKULpvE2MVrduqdHZ+whd6IK4UIxQJ0R5CLHczgVSOVPlHuQOlIC/4dmBQBSR+OjqYne01Z
 T7Wy9zz3dxGyV3oeoj3L6NOci6b8A0dZF0XixFVyfMlkdbkhmcC6hextya6lwRr8fvgj1Wt4yTT
 fjJW+f8xnR8gzh/uWIxsKeYNAfdWU9th4roVsQDpeo3qXZHVa5uhXWgKKmq67K6bCjAPh7Wit4T
 JpsjmDTbIz+SXNBcxfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070090
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102102-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 64C963AC834
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
getting removed from the list after it is unmapped from DSP. This can
create potential race conditions if any other thread removes the entry
from list while unmap operation is ongoing. Remove the entry before
calling unmap operation.

Fixes: 2419e55e532de ("misc: fastrpc: add mmap/unmap support")
Cc: stable@kernel.org
Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index b87a5f97c96f..148085c3b61a 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1862,9 +1862,6 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
 				      &args[0]);
 	if (!err) {
 		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
-		spin_lock(&fl->lock);
-		list_del(&buf->node);
-		spin_unlock(&fl->lock);
 		fastrpc_buf_free(buf);
 	} else {
 		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
@@ -1878,6 +1875,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	struct fastrpc_buf *buf = NULL, *iter, *b;
 	struct fastrpc_req_munmap req;
 	struct device *dev = fl->sctx->dev;
+	int err;
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
@@ -1885,6 +1883,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	spin_lock(&fl->lock);
 	list_for_each_entry_safe(iter, b, &fl->mmaps, node) {
 		if ((iter->raddr == req.vaddrout) && (iter->size == req.size)) {
+			list_del(&iter->node);
 			buf = iter;
 			break;
 		}
@@ -1897,7 +1896,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 		return -EINVAL;
 	}
 
-	return fastrpc_req_munmap_impl(fl, buf);
+	err = fastrpc_req_munmap_impl(fl, buf);
+	if (err) {
+		spin_lock(&fl->lock);
+		list_add_tail(&buf->node, &fl->mmaps);
+		spin_unlock(&fl->lock);
+	}
+
+	return err;
 }
 
 static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
@@ -1988,14 +1994,17 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 
 	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
 		err = -EFAULT;
-		goto err_assign;
+		goto err_copy;
 	}
 
 	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
 		buf->raddr, buf->size);
 
 	return 0;
-
+err_copy:
+	spin_lock(&fl->lock);
+	list_del(&buf->node);
+	spin_unlock(&fl->lock);
 err_assign:
 	fastrpc_req_munmap_impl(fl, buf);
 
-- 
2.43.0


