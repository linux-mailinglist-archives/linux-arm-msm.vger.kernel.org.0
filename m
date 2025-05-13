Return-Path: <linux-arm-msm+bounces-57661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 11271AB4A8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 06:29:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55C3C7B143B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 04:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6C21E990E;
	Tue, 13 May 2025 04:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="clTGICtS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47EA1E47BA
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 04:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747110530; cv=none; b=kiriE0mh6Re5iPIy49rf7BA32EMvX+lH4IBh8R+J3nbmtBjD/VPLyNh0QV4n2OW2FCSFur38R+nLR9fnj9qJ5aFB5PRz0sejQEuFuXz69/4PM1+heB795FEgTUBhofFN0GFPV4mWro7gNPtIWqs3joVtbyVxqqG6nABfMpS2qbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747110530; c=relaxed/simple;
	bh=b/jdrld+JHj+dMZXOOpKT68s1sxFCgElAgmgr19swG8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oyo3DburuN3JnJJwSlHZXYzmWNkaA3bl4mKkqrDX51qpV42SobO0MYTEnJLqHD2srn83/6D/0EG4qHDz4cmec/u8F4rEXEN6oqj962jMjn9n039I+N9WGnGqMTJj4Tg25jc6VY1wGifol0Nb76D14vlwdolnD1MDUnyQikVjRJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=clTGICtS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CHEqNx022673
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 04:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qholBjkmu03
	FdHRvMAFEHiCnlryUcq+WCE0WsE9Lw7w=; b=clTGICtSj2YYasarQEdnigsEtQN
	1UT8M62U46N245c09+C/51ctES6Tg3128eZijR98FSW6063mS6gmg3vWCExn5jA1
	HxHOEDjuuM+RpI73EOuZ5Jbkessxk/V197ZAxaaimVcSSnHcgRyVPrQjuPzEbc6d
	FkihbXrK7v4FwHkFrFBrJwSlDbJZMCA7v2qih512O8V318lh3vOp5OGriOtC3/vE
	OA4OJsaUAktMv4vKFFcfk2bGiNSAbWqRC/KU2vKKDWyWq25hA8DuWsA0L8PMsilp
	36TYkTHCsHglJrnm037fNcxKru69Pz2enzw936vvkW3gl/WVLeYMHtsubyA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46kdsp2m9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 04:28:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30c9b0aa4ccso1952574a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 21:28:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747110526; x=1747715326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qholBjkmu03FdHRvMAFEHiCnlryUcq+WCE0WsE9Lw7w=;
        b=odf7WNlwKlElztgCirKzHPwPOrONdGSdgfQM5bJFjj2otwAJwq2qFn7gl1Sg1+iyl4
         LQdvPsCqAoRojjy4IR69SpROiZjW0aB0ix7rR5odoG45xGAzJ+YW4G2oEIXrbumUkS+Z
         jY9A0LsD30a+DtgOsvM1F952eDLGJNj6u6bMm7dN0mOROZWwihZj9trKiED03RCZdv+2
         kgTNRB4QzfmzNdnB8LFjuxMUnjt5bV4JUIqM5G7/eNUKg4mwRRGE8oD5swm6xKHqp+FI
         GninCqg8iRHghxqD9j/aKETcrrmq4yuZwqbbmrNLv+D3N/8EX1OppN+JD4rqzAVzHG0d
         OJxA==
X-Forwarded-Encrypted: i=1; AJvYcCV+cE9iTaYz0VpEXF8NDV7KCNu/sxYKga6SFjlKXQ54SGwb+XYyyuZnQ/NQY7hhtDqfMQpZRZmHf9x0iCYv@vger.kernel.org
X-Gm-Message-State: AOJu0YwKYtjRjJ2siDtmHCMkGsHDkl/ESPCbPmp0sIxFqYWl9sqSRT9j
	9hp8AiB2yTmHzUeVcIEXyk9AKv3dxN0k+gUzFP6C7AZaX3jK11qi3a7FSS2/tY6nTlDuC80gLnO
	lzyVOQ8ffkFzmyGic/62LvnPikIzLOMggMaProUoSTwR6QM1PiZ43/i8v3Fx5gJ6P
X-Gm-Gg: ASbGncvBpfHHubrPgtkgP65bXd/UopwPRck7Oa1SNjxu/CVXBrun7kxNTeY5gh+JfAC
	jEzatxN/aZY9wOAKW+/6rMV9UwxABc4eec5uuJoDns+duhEoDByOJxXLa4cR2peVmtPJuOkZMAf
	LA7eB8jU7ATOi4yNkhy/LlsLtRjMbqcHrIFmnabLVHBDe/0FjgUNLsXoTFzIo012dVW3UjGct0v
	/d1nbzISVuOvlTYF8EGIr/gUj40/69IXsdoQ8rJ9qnY5xquHNDq0w7RHyeo0f3Gh/k/RpmOSIbm
	wzvs5yDBaPUnKe6gHTFMHRaP1LEdfdc1axlBQ36TbcGD
X-Received: by 2002:a17:90b:4b4b:b0:308:6d7a:5d30 with SMTP id 98e67ed59e1d1-30c3d3e0a86mr27034336a91.18.1747110526294;
        Mon, 12 May 2025 21:28:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6dBAWDLUjqJ4kvsD4zVoy0B09Mb6RcQq2ArhYi6gGrcPHxd8tFxTtMMDWjf6AjNgGa2lz2Q==
X-Received: by 2002:a17:90b:4b4b:b0:308:6d7a:5d30 with SMTP id 98e67ed59e1d1-30c3d3e0a86mr27034300a91.18.1747110525743;
        Mon, 12 May 2025 21:28:45 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234ad3e9f1sm5486101a12.35.2025.05.12.21.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 21:28:45 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: [PATCH v1 5/5] misc: fastrpc: Add missing unmapping user-requested remote heap
Date: Tue, 13 May 2025 09:58:25 +0530
Message-Id: <20250513042825.2147985-6-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 44LBxmetKwHoBhK2GMZt-FDJBtThzH-D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDAzOCBTYWx0ZWRfX+E/3b82Y0+LC
 2kO4qn/aKbYFxtpiBWU+XKPvCPZ4u3gD7ucjj1VfvgzNzj2R+cZ9IRr8TRS4arKxBXUGdbnyIXP
 W0SwdLMzwU2ax39xLYP4f4S4z+1M0mySiekPuZ1AkRgP6ZUgLAg9WE8cMQkR/oBFchyHRD7Mwk6
 IOSDTDvY9dfrVWTSYW48jlivzB602lpLy3nrpXjY532elYLd1wBoi55WU1MXEgC9Gc9+QoL1KTM
 1OJk/Nlkr3xtls/fXjDgFq9y5Ko55mNl9g1sIS09Nz7uIgQkZuwJxXhvqnc/UiksbMaMCeDBxUP
 MuaFNDhn8NhOmRUPe1LYzldbT19hezg7gZWTkw8hIt9n5Uk2k69OKldq7IYbAx+1BrjvCQ+RA6B
 /HvvIV0Ja7WtEs9yBZm/J7D8077eV8ZLO5Z+fNgynLG/gUd18vmRRWUN8QhxcDupVnXNLZSB
X-Authority-Analysis: v=2.4 cv=TrfmhCXh c=1 sm=1 tr=0 ts=6822ca7f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8BRqyYDQAlS27bmPn4kA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 44LBxmetKwHoBhK2GMZt-FDJBtThzH-D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130038

User request for remote heap allocation is supported using ioctl
interface but support for unmap is missing. This could result in
memory leak issues. Add unmap user request support for remote heap.

Fixes: 532ad70c6d449 ("misc: fastrpc: Add mmap request assigning for static PD pool")
Cc: stable@kernel.org
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 62 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 51 insertions(+), 11 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d54368bf8c5c..b64c5b9e07b5 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -197,6 +197,8 @@ struct fastrpc_buf {
 	struct dma_buf *dmabuf;
 	struct device *dev;
 	void *virt;
+	/* Type of buffer */
+	u32 flag;
 	u64 phys;
 	u64 size;
 	/* Lock for dma buf attachments */
@@ -1867,8 +1869,26 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
 	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
 				      &args[0]);
 	if (!err) {
-		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
+		if (buf->flag == ADSP_MMAP_REMOTE_HEAP_ADDR && fl->cctx->vmcount) {
+			u64 src_perms = 0;
+			struct qcom_scm_vmperm dst_perms;
+			u32 i;
+
+			for (i = 0; i < fl->cctx->vmcount; i++)
+				src_perms |= BIT(fl->cctx->vmperms[i].vmid);
+
+			dst_perms.vmid = QCOM_SCM_VMID_HLOS;
+			dst_perms.perm = QCOM_SCM_PERM_RWX;
+			err = qcom_scm_assign_mem(buf->phys, (u64)buf->size,
+						  &src_perms, &dst_perms, 1);
+			if (err) {
+				dev_err(fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d\n",
+					buf->phys, buf->size, err);
+				return err;
+			}
+		}
 		fastrpc_buf_free(buf);
+		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
 	} else {
 		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
 	}
@@ -1882,6 +1902,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	struct fastrpc_req_munmap req;
 	struct device *dev = fl->sctx->dev;
 	int err;
+	unsigned long flags;
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
@@ -1896,20 +1917,38 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	}
 	spin_unlock(&fl->lock);
 
-	if (!buf) {
-		dev_err(dev, "mmap\t\tpt 0x%09llx [len 0x%08llx] not in list\n",
-			req.vaddrout, req.size);
-		return -EINVAL;
+	if (buf) {
+		err = fastrpc_req_munmap_impl(fl, buf);
+		if (err) {
+			spin_lock(&fl->lock);
+			list_add_tail(&buf->node, &fl->mmaps);
+			spin_unlock(&fl->lock);
+		}
+		return err;
 	}
 
-	err = fastrpc_req_munmap_impl(fl, buf);
-	if (err) {
-		spin_lock(&fl->lock);
-		list_add_tail(&buf->node, &fl->mmaps);
-		spin_unlock(&fl->lock);
+	spin_lock_irqsave(&fl->cctx->lock, flags);
+	list_for_each_entry_safe(iter, b, &fl->cctx->rhmaps, node) {
+		if (iter->raddr == req.vaddrout && iter->size == req.size) {
+			list_del(&iter->node);
+			buf = iter;
+			break;
+		}
 	}
+	spin_unlock_irqrestore(&fl->cctx->lock, flags);
+	if (buf) {
+		err = fastrpc_req_munmap_impl(fl, buf);
+		if (err) {
+			spin_lock_irqsave(&fl->cctx->lock, flags);
+			list_add_tail(&buf->node, &fl->cctx->rhmaps);
+			spin_unlock_irqrestore(&fl->cctx->lock, flags);
+		}
+		return err;
+	}
+	dev_err(dev, "mmap\t\tpt 0x%09llx [len 0x%08llx] not in list\n",
+		req.vaddrout, req.size);
 
-	return err;
+	return -EINVAL;
 }
 
 static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
@@ -1977,6 +2016,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 
 	/* update the buffer to be able to deallocate the memory on the DSP */
 	buf->raddr = (uintptr_t) rsp_msg.vaddr;
+	buf->flag = req.flags;
 
 	/* let the client know the address to use */
 	req.vaddrout = rsp_msg.vaddr;
-- 
2.34.1


