Return-Path: <linux-arm-msm+bounces-89157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00583D2326B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 09:33:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9B4D4302AFE1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 08:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F11F8336EDE;
	Thu, 15 Jan 2026 08:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JpRj1lqI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TtnialaF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC96E335552
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 08:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768465802; cv=none; b=GJLVYTgrhbvDFh9vt2YGgg87DdszMTBbkQgCGYsX9a7nyUWNXXNNMV1bPgbtQ4uiP3bjP1/pICYk4GeUrF2kEMZU6taXF+zUntBM8dTH/Pzg1MmmG0QkZ2URKMQajYW3hL0C33JBszysdKVTeU1MA/sryBY7/+7mLDDB3WUWut4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768465802; c=relaxed/simple;
	bh=VCRsiSWmBZTWoniAiDuhukrpl8fYTCpGwB7tOHtDVsw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rdXRd8um5x/NFLGnQ9HTEhkC1Z8JbB9zcY8ocafVcOcMAUo92p4eO46jVERblovBRIikFtogt4G4/gI52B9mvi1cfGDiFklJ0ORrNm/wunqRYdKANItqc1ZRDQxWAUyaCqQkIuRpMKsRAbIvoz3bSVZcCtRsDp1UOUtfIe5DzX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JpRj1lqI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TtnialaF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6flwZ3419286
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 08:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=12vcQeB7vtt
	+410hwakfDxk9ykcl1qmLQ2Bo+92glU4=; b=JpRj1lqImLTb4jPLxwNJf6PGwh+
	R4DUfocyLZEugvuOkB9EttRFJvUCYqsqhfw84CC+fe/wvO17O5fSntJhciOAXXpD
	5I4K2vtUhakIWW3QdOucZ3xa2/t+4iw7vMwVY2sBAfjreskxNR0cnK/k3pHIIqWl
	BU5P0F76cbLedbqdUOhcvfcPI5Rh3+k5eLWTl0XmDPcEcvvENxkqXOyv3anq0G2r
	PBBlfYE0ecdYzyA3E5lWk8uyer3FQHzQYXmKsTdg/xStnbrfmlj8MnO99HGDWaXj
	4WhHVjSyfOFbiMvjfoZw5Oz+/glZgAA4gYDrFie3Jbbta6hWxxgbbNAVqwQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpjj89rdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 08:29:52 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81c68fef4d4so1459924b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 00:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768465792; x=1769070592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12vcQeB7vtt+410hwakfDxk9ykcl1qmLQ2Bo+92glU4=;
        b=TtnialaF6JLmw5+hO2bRwz26D9KPnjd476tuW4hZUVVXSMb2tgsJh245ZbNp5/PG7Q
         l6E+2O5SdmfB5Dsahe4CFSKZOq2fYXKNh48XiR6oVyCXSCpfVhXk3zgrJroEFAwEPRzv
         dDmew1wnHUx/LHtWSD0ZyFUBc/iEMiHphrzOlNYbF3USNmwlb7P2HdY8ZpVWdI/qSVP7
         5UMxMt0HfURm0Ru/EPsyQkDQ8ajJXsjxS9pmldEqwYV4QrUrqC+558q1uzvOHCjsmDtr
         FOt678WOTBHM1ZENkgrx4oSAxN33um/4+o5FH87fDbiuZ6udaxZ6uh52et9tQm6SBCAr
         Bt3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768465792; x=1769070592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=12vcQeB7vtt+410hwakfDxk9ykcl1qmLQ2Bo+92glU4=;
        b=aqPL9vi8P3bih9nXzDLCIFSlf3pM1Q5GGcffC97ySu5+w7JemmLKO5WI51VLWEk4dK
         k6aumKLUpQp3RCXVjPYcTsKMPBG+g8gtx2oYSyyvhSk735TkkFKEixr9H/29qqD6EIN4
         3XaiHKq4gxYhUZKFmvbr9j6DfXMjZo97uacucxfzVOWzjKAYnfEC3yCUIaAcgu8ua8jT
         pXUVHcZ+EQCEkYDsIknwxARU7MsId9+POL7CvzixYkJjW4ZZ1yk84+R5egbH517RGNeJ
         Pcm1GQFEYYRXgO1M/J3GdMqo1/Vn52iyMJekJixsZ8MG8IBZ+mi0NmIiQKQZ028mg7tn
         7ZFw==
X-Forwarded-Encrypted: i=1; AJvYcCXFp6h/fY/v95KBazHHWNI0PzoHrgvsJSVzrrj/HDLkFQ1y721OMiQ/IjIVCKXvcmPkrYKXjAo86Mxa1QBA@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf7AYkHF8YjvnieNOYzg8lIJeZUwJkPTi2kxZ3DJxzM0OkdnUu
	fWaRjtkW+Q++7MOTckUNsSvT8aGP/445XpGRQSEWHGRdqtuO7D5VOb9R1y0pNcmCjcYzSFUWtvx
	Lg7LKYCekwSd4utfOQtenTIaZdtvKc0yeyBaFZVqydv+sCzYVjtJYxNshU3nVGqGykLTi
X-Gm-Gg: AY/fxX74aLH2E0FmuG1Pvhbvfepj/gA6NvB3wDVuwUlBmsFMwuzDHAGoaLYAg/G395d
	ATi4Aku9/GPtK+x56jE6zMM7yvNqelpqZO+o0K9IdBIu2h37TPGVjafJZqhoa1csawGB6l3Y4hp
	5DpPYFj8THiwrp9y1cJzcnXfyfx7L13tRp7TvTMvn+WPmyi10VstVBAxzPVT69ghaIkc5SvZiyv
	EBeNq4fgZBkP1+2kCHgfXv/RjwOg1U8FbdWaElvHmF4cxi4M40IS3J0WAQlVKK1pxlnBlLHG68i
	yw7horgKJLKAAXu6hmTAEvNqg/nTkWLfbRnBergn8PbDBODJ8X6AK2eo3S3p/cmGya5CPia9HNt
	apeVtIvSx2sz9i/CduY5EXk9LMAt24Dz+SZ6JE4Ms
X-Received: by 2002:a05:6a00:ac03:b0:81f:5acb:55e7 with SMTP id d2e1a72fcca58-81f81fe0a08mr5626392b3a.54.1768465791735;
        Thu, 15 Jan 2026 00:29:51 -0800 (PST)
X-Received: by 2002:a05:6a00:ac03:b0:81f:5acb:55e7 with SMTP id d2e1a72fcca58-81f81fe0a08mr5626370b3a.54.1768465791237;
        Thu, 15 Jan 2026 00:29:51 -0800 (PST)
Received: from QCOM-SocCW5bzXR.qualcomm.com ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f8e69d1e7sm1773296b3a.58.2026.01.15.00.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 00:29:50 -0800 (PST)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, thierry.escande@linaro.org,
        abelvesa@kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org, Jianping Li <jianping.li@oss.qualcomm.com>
Subject: [PATCH v2 3/4] misc: fastrpc: Remove buffer from list prior to unmap operation
Date: Thu, 15 Jan 2026 16:28:50 +0800
Message-Id: <20260115082851.570-4-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Vrx3sNkLkZtZOD9i8g2f_gypA3rGnzM2
X-Proofpoint-ORIG-GUID: Vrx3sNkLkZtZOD9i8g2f_gypA3rGnzM2
X-Authority-Analysis: v=2.4 cv=EIELElZC c=1 sm=1 tr=0 ts=6968a580 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=65MDuzgJ9_6jycvYPFoA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA1NyBTYWx0ZWRfX1NUvtJ8zoZDA
 T8kmG7I8Lne5WZ1ceEuXlqenQmrSHBSBt6hQRbMh1Y5h0OzBhBgYsifuNM0WYqDESEc0hpKaoiI
 zNWd4iOc0Vmpaqm/3vCARUerw6FaTKzPG6cv9NUtK57afyAqh8CGz4E5vKdahQvsMkYvOiRAR3u
 1mjpnvkpLcJ8Wn8DJ4RybN5U9lz6gdOXLzza64pfOk4xUc0KuamKvgJP/CLAoBhfvP80x8Lq3+m
 L+J99pYkFLImxGiFJeFl9SC3iRBDICSWjPN/z4SbFop4YumaybkYdK98CkhUmQeYDpMzlv+mJBR
 CQL0t8NRGFkU80UebsMLYx9lyNT/BC5VBEXh+vfJnkJzXjjBeWAgUrQ4HhsgT1XjN5QefwvE160
 wOgncEzwh6fCoseWxORpNEZDGXObHMKKkQzFD1A8DDjMti1VBW7c6yfmwuIxelHmD6RBjD5cHgM
 2zqksCAsKN4HhcUV5kA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150057

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
 drivers/misc/fastrpc.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 4f12fa5a05aa..833c265add5e 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -202,6 +202,8 @@ struct fastrpc_buf {
 	/* mmap support */
 	struct list_head node; /* list of user requested mmaps */
 	uintptr_t raddr;
+	/* Lock for buf->node */
+	spinlock_t *list_lock;
 };
 
 struct fastrpc_dma_buf_attachment {
@@ -441,6 +443,7 @@ static int __fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
 	buf->size = size;
 	buf->dev = dev;
 	buf->raddr = 0;
+	buf->list_lock = &fl->lock;
 
 	buf->virt = dma_alloc_coherent(dev, buf->size, &buf->dma_addr,
 				       GFP_KERNEL);
@@ -1865,9 +1868,6 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
 				      &args[0]);
 	if (!err) {
 		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
-		spin_lock(&fl->lock);
-		list_del(&buf->node);
-		spin_unlock(&fl->lock);
 		fastrpc_buf_free(buf);
 	} else {
 		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
@@ -1881,6 +1881,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	struct fastrpc_buf *buf = NULL, *iter, *b;
 	struct fastrpc_req_munmap req;
 	struct device *dev = fl->sctx->dev;
+	int err;
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
@@ -1888,6 +1889,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	spin_lock(&fl->lock);
 	list_for_each_entry_safe(iter, b, &fl->mmaps, node) {
 		if ((iter->raddr == req.vaddrout) && (iter->size == req.size)) {
+			list_del(&iter->node);
 			buf = iter;
 			break;
 		}
@@ -1900,7 +1902,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 		return -EINVAL;
 	}
 
-	return fastrpc_req_munmap_impl(fl, buf);
+	err = fastrpc_req_munmap_impl(fl, buf);
+	if (err) {
+		spin_lock(buf->list_lock);
+		list_add_tail(&buf->node, &fl->mmaps);
+		spin_unlock(buf->list_lock);
+	}
+
+	return err;
 }
 
 static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
@@ -1985,20 +1994,23 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 		}
 	}
 
-	spin_lock(&fl->lock);
+	spin_lock(buf->list_lock);
 	list_add_tail(&buf->node, &fl->mmaps);
-	spin_unlock(&fl->lock);
+	spin_unlock(buf->list_lock);
 
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
+	spin_lock(buf->list_lock);
+	list_del(&buf->node);
+	spin_unlock(buf->list_lock);
 err_assign:
 	fastrpc_req_munmap_impl(fl, buf);
 
-- 
2.43.0


