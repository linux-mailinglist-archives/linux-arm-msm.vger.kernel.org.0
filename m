Return-Path: <linux-arm-msm+bounces-86952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAC9CE97E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 12:03:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 975A33004874
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 11:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A02292E5427;
	Tue, 30 Dec 2025 11:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pPjnz7Gy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="epwWxpOG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1122286D55
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 11:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767092564; cv=none; b=FC0vuEwVzLXaUEM3Jcknn0rKHMEaS9L6HoyzKRwvr86TWljBPVU8cDJxpJMLrWb4IRkGNHBPuLkYK9PDO4U2MDqHctAufcA3kA42d6lD9HQ1JEEfRUuxxeOxeqWhq3X0N82Q25DwuP6xm9QGLXEIfElU4VITQE2tbNHpx9x1TS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767092564; c=relaxed/simple;
	bh=kzaUN+x2tytlHR+0KUUHjrghzg/fT+mbgBEGSbNP1ag=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NFJCBrJYqeIjcxZUfXBH1r8jzedSiWnMamza6oBEt1yoiZjfd7XSmeB5eOWzIK+2I6gHKcMo+SRAt/mtD2ZRomY1TIUZ5UzZBBUZpl47DGDf75Rn9KPl48xmiKWmyBAlbt8mTudDbbiN24rfK8pk4mbIdvF3+B1Nu5nO9Kv/950=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pPjnz7Gy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=epwWxpOG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU3jbff3555789
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 11:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VYwQ/Hx44kd
	wcs759Yx8Gs08E+Q2dSlIoFnhLpXFKqU=; b=pPjnz7GygYTWoDKptwvj3aPNlKv
	I34MNm9IYPfIHWBK2zVtO8L/GpuxXjM5dP7vmLNFEnCeGzi1CvdpiFFhcbttQpBk
	K5L2biLIiclFdHxUBfsBmQvIAg7ErWGwH7vKiGA/wjVlwSXgPGBFCnf2dPfPYDQN
	LxBc07Vc8Aix8C5xBYrWRq/lARdQjng3XCDzUt4kchFcEBI7lPl5xjiS6f8qOp0c
	bwNHupfQWHdcFOZzzz3LL26vDnn1Juo77P9oMl2hj07C0B1vOUfgAlBOKYeYjfkZ
	Ruk30Lu9dNze0bjao1xuO4aXYBzKwYMsZltYLEFB12/pZrKWCUJDGiqTFIg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc7460x28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 11:02:41 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7ba9c366057so25566156b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 03:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767092560; x=1767697360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYwQ/Hx44kdwcs759Yx8Gs08E+Q2dSlIoFnhLpXFKqU=;
        b=epwWxpOGMhG3mFnBl8rmJ6/j2vbL62wbt+U30ptSxVJDd5qsxquc7x4xblaEUvb3Sd
         G35cZAkIubGuZom5VQPubBI/gOiqUqy3NK8BWEwY5bntFnw3ts+VrpHxtWenfMr45vtu
         um73uspxeGAUkr5pSYhbp326VSqKs+XJK0dOmIDI4zZ41TI3sFYJBZw2WvwwsXLGJ/RQ
         MpNF7NXOJmmqQiWRg+NIWv+1OL/1cpaDeTKG6oNsx/DfFq9bpcwkITP6OG80qnvxlzEn
         BW2KeUL4BGu6OqM+5CFy5CM86CWiD2CgqsVvEeVWmww+f54HOW0h3O0Z4WYa62K2eUmu
         tI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767092560; x=1767697360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VYwQ/Hx44kdwcs759Yx8Gs08E+Q2dSlIoFnhLpXFKqU=;
        b=rL/hAQ0HHG0aGYssqKLIHImv9NroyOlpIz5VG5ZbaEEIz+UTomxDU9Aoa/bQVVU0Bh
         ZK9HyzNimhoYiOwYIUvkPZZvDvF6tZyx+9i5yRWOUvxJm8iOTbQrPxRICsUAiqZQPmrv
         v64nord2sjGflk3grP7Zn02ZbSkfUA9Y26gaKpl3vyAJU/ead2oVqgG3EpQI1hLrIzgS
         GlSlIG2/vtB6jPBcnJmYbNgiqkBUbE2POSVzt1O+edodrMIOHhDSTfG/pLZKBYbDklS8
         qvC7e5pK7OlVUGsJtsPUDWlOD6k+Q4b8jB0cwkj9Vfqh0NJI/3ORd5trhqiuqVA/cviV
         x7BQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPVXooOeDjFl869Ma+N65Lu4I7l0XykarB+RZZl109kKGv+WQX9uWUh9Jqh4s8F7th4tyzTYx+7wNPyNVK@vger.kernel.org
X-Gm-Message-State: AOJu0YxNhWBWt56l8UXvXbMArio2cILBiI+EgnvSeEreQpRGONaTylr/
	oyZHceWVInv9qacsZNd5nlQdegciP3bhzl43BBhbITdnEX18CMH7Omr6qeFcIqG0uizV7hdoI38
	ymgv/WNS90uYuVT65ogaSwn0m2VLPPe0N3HRR+VjB2MzGU4CbmFCjhzrcFkOzUkgZ/zlV
X-Gm-Gg: AY/fxX4wS+YN7f9/D8x/dy+Qn1CXFFRgzZ78SdxLimUlW/emCSpWqsKuT0QfWE3raMZ
	j30TsVaZYy3fB1NXyqVDR/fTVBvJG1TVBhgEKCt4rAHRDnE08jtVYWtRiEU0dWUQvXxXc7Lh83D
	QLa8fgipWOM+6VzHAcKdI4X287Wzzn9CYcUs2zp1MtoixzWIK7unfV4kWQfI62ce2XRTTSHEE1L
	hc6ftyI01Zq2uhXQzYSx9S8lpZVMZshPVgTGFQnMi8Nuv1H0sNFmekdd7J6tmjpILT8tt97J65W
	1hUz+1oM+J6AxYYtkJur+WZmlC9Rej4Xp09aNKHKQxt7mZktr+kEc7TrnbWYwTlI0u+EXSoWg6H
	HOHy16iPyZ/oTK+I53axAV0y2ZfLko1rUabmdReRF1g==
X-Received: by 2002:a05:6a20:3ca8:b0:33c:2154:d4f4 with SMTP id adf61e73a8af0-376aa500867mr30883649637.49.1767092560450;
        Tue, 30 Dec 2025 03:02:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhhWXGKYIxwN0TmVgGtWsqgsEy8WyS+QDcMuCfhzukRTbnwE5KpXtMVJAEy0hB11Qi0NV12w==
X-Received: by 2002:a05:6a20:3ca8:b0:33c:2154:d4f4 with SMTP id adf61e73a8af0-376aa500867mr30883629637.49.1767092559966;
        Tue, 30 Dec 2025 03:02:39 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c3a4deb6f17sm2556908a12.22.2025.12.30.03.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 03:02:39 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v3 3/3] misc: fastrpc: Support mapping userspace-allocated buffers
Date: Tue, 30 Dec 2025 16:32:25 +0530
Message-Id: <20251230110225.3655707-4-ekansh.gupta@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Do9bOW/+ c=1 sm=1 tr=0 ts=6953b151 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=LDv6qzVS_9dTolnp15UA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: lvNdJQAHBvvXyiqjAB_P0683T3k-yigF
X-Proofpoint-ORIG-GUID: lvNdJQAHBvvXyiqjAB_P0683T3k-yigF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA5OSBTYWx0ZWRfX0kdOhpeXqoD+
 lf2QXmdUeTCzsokW9zPK9w3ygZof/qd1N8mQEoHXGZ1JeC35zS/yjjuZ+nLQUFRMdxtYfLTydpy
 i81ewcswso1HCnHOPEjODA5INyAyuzyabyxSj58YRTlhvGi7TBCIPz/NpAfoB+g8yiCrfp/2s0L
 Dl6/At86jiE0EQAmKsqPsxzx9CGPQEkk/OJewrsUrGZDbZ079JJO0AkxrzaJDGXZwdBD5c1+gbi
 PicexLixvWxXMaaiEG8YSc05+QG2rxQvVojTTgBi1fDP8xXploH5L2s3xyQdds9aTS9K3Q7WN96
 CBoWL1U53eOwAMB3VwL+84PnScpWpTOqEgzyhezJbd6QoIEHmvVcvdsGfCpl5Emo1fZ4aZ4EOFG
 Q6rniCpmQ7L6wAw5ez6B7ZDlNQ8znYWEHhRVCouvNZlbloOdp+xwnqmelFiLcXoU6utcYBvsGlH
 eE999au1diksODdBJvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300099

Currently, FastRPC only supports mapping buffers allocated by the
kernel. This limits flexibility for applications that allocate memory
in userspace using rpcmem or DMABUF and need to share it with the DSP.
Add support for mapping and unmapping userspace-allocated buffers to
the DSP through SMMU. This includes handling map requests for rpcmem
and DMABUF-backed memory and providing corresponding unmap
functionality.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 97 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 86 insertions(+), 11 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 24064efe5dd8..b677e485bade 100644
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
@@ -1869,13 +1871,42 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	}
 	spin_unlock(&fl->lock);
 
-	if (!buf) {
-		dev_err(dev, "buffer not found: addr=%p [len=0x%08llx]\n",
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
+		dev_dbg(dev, "buffer/map not found addr=%p len=0x%08llx\n",
 			(void *)(unsigned long)req.vaddrout, req.size);
 		return -EINVAL;
 	}
 
-	return fastrpc_req_munmap_impl(fl, buf);
+	err = fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
+	if (err) {
+		dev_dbg(dev, "unmap error: fd=%d, raddr=%p\n",
+			map->fd, (void *)(unsigned long)map->raddr);
+		spin_lock(&fl->lock);
+		list_add_tail(&map->node, &fl->maps);
+		spin_unlock(&fl->lock);
+	} else {
+		fastrpc_map_put(map);
+	}
+	return err;
 }
 
 static int fastrpc_req_map_dsp(struct fastrpc_user *fl, u64 phys,
@@ -1989,25 +2020,69 @@ static int fastrpc_req_buf_alloc(struct fastrpc_user *fl,
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
+
+	err = fastrpc_req_map_dsp(fl, map->phys, map->size, req.flags,
+				  req.vaddrin, &raddr);
+	if (err)
+		goto err_invoke;
 
-	if (req.flags != ADSP_MMAP_ADD_PAGES && req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) {
-		dev_err(fl->sctx->dev, "flag not supported 0x%x\n", req.flags);
+	/* update the buffer to be able to deallocate the memory on the DSP */
+	map->raddr = (u64)raddr;
 
-		return -EINVAL;
+	/* let the client know the address to use */
+	req.vaddrout = raddr;
+	dev_dbg(dev, "mmap OK: raddr=%p [len=0x%08llx]\n",
+		(void *)(unsigned long)map->raddr, map->size);
+
+	if (copy_to_user(argp, &req, sizeof(req))) {
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


