Return-Path: <linux-arm-msm+bounces-109786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCL1JAmAFWr3WAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:12:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0057E5D4B6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86E37300DF70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 11:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E0738D3F0;
	Tue, 26 May 2026 11:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KAUF2vQD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZcu57ip"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1FC3C5523
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779793908; cv=none; b=czkQyHTp9isz8qYCVI9jUmdHsgLaX1woXb02nmG1xlTRByXNc7YMlAQkNR3OTz2gvZzMxPlFHKNSJIIDTOE+xN01+5b3jzeAfNQHvFAz3W3yFWbalLrRKfzmTAzMeLT1e8E+I4fl8S1bufwQ3EqYGFk7zb1KxtZoAuTQxoVqBOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779793908; c=relaxed/simple;
	bh=uwUosZaTRLvg70pMj5LLo47klKvzExFmHdJcqWxZT4Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Aegtetrdu+TBzcr1zAEAkt7Cx/ciSBeYEoNQsZeBwjj4wUofsEUa6ZjYbwCSy9LuHkW++IZYnBknfl2yJHCEWXqG3eim0zwndmLGUIthI/FA+7MRsH3RJIX5++WALVqJ8F1IGeQcTa+SCllYNDIlvGuGRDgMEolmx8hw1JVt1IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KAUF2vQD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZcu57ip; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q8pMDo4117420
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=h2rbBUksZJT
	YcjdAJliGesa3QsJPl7wEGaGM4JyELQc=; b=KAUF2vQDBbaZGwDuqkg+NtXqbh2
	pJVpFT4JzXSXLkb/67qx6MkDXZUu5zL9kJmAGswpFaU8qqn0aNqWltwON9gbIrp3
	sdiJhfNKcwKB3N2kk1Cq4GhlEprFMStaqnDWc8Z6DooCx+/y2dYZmJLU8svprSBa
	pbIfA2kZfYqkKVOY/T4ThwIsljlGrT0Bbezorpk37O0OISvBD9WixWB6Ikv+w8rS
	yuDGX1rQv/ZMtl9y3MiE9SDwFYUw52v1528IgHGh9yQYpLI2LkGEfpDa+FPIGpdF
	AxSexWs49jCBucPZPqBtreXhXIiuLUmucRWowy28iZ7dmlR1N5s9JhXK/Sg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqudbjub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:11:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36865d109dcso9675554a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 04:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779793905; x=1780398705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2rbBUksZJTYcjdAJliGesa3QsJPl7wEGaGM4JyELQc=;
        b=cZcu57ipBduZzMmbhgqRkHleV00D/tI5fhGbAA1gi8t6U/RmiJbRdCOT6xJZCsmibi
         5xEuzS5mjNkYI9mca9eHMh6DMvbPpFGqe7R9jf/PrIHRq5R8FaT+7yrjn5WFMCIjAKrk
         X6olCyV5POUGhS5K64fxpsxo9esKgPVtXhUBwclvwIwN3faC3T2UB/XVGPb8O/F8EjPB
         CleyKGJly4pIhVGUM7vt1hXLbQuKf6bJB95r1CQrbjtqNWN5G0XFjNiYJzmuFCRbTgjE
         tDmkLgcT55ce/MXjR3S2CFDbKKUvSkYMAQrlI7AtphEVJ/N/FSsxH5NoSXXojcx3GBFo
         aJjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779793905; x=1780398705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h2rbBUksZJTYcjdAJliGesa3QsJPl7wEGaGM4JyELQc=;
        b=YdgqjvChiJUtJTeHCdGYoqWe0cgZFi7JzXLwK95+dX3zHVuQbz4A6pNE3yuPu9npzE
         4d8via9QinlKmunVnAQbzdHJKPaSk9Rd1vNwX87BczDXAUkBCaCw80FlFhGjqwAR0xsJ
         PXL4i/iaw/klBC4MbxJAcvfOFQ4jwdyk8KJDOBhFwB1j+jHfRI5iJ79Zejmy/qh5xA6L
         aUVZaWzff42jRqLf2SQ27S+n5chxCAnBLnTqHWSrHe6U2pW2ZrhjzYlTA87Bonbo+3IW
         fEakzQvh+bz/Ex4BIRjOszCBb41HZpApPujDwcOyevWlTuZm5GtbB3IbGTHbg9xkLdec
         7OOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Abg/tL+gk2WVjug1V3TPS3QsGOoXirubeQ0i9eGK2GKIq87dEMpShCqiTJwi4sKl2pYx6+SYDxyfrQ4zl@vger.kernel.org
X-Gm-Message-State: AOJu0YwLpcX5FB8/xSGTySW86FI7jSKEwxpjZHRdfXYcQhR7Rj23tRrN
	w44G/p7YDBv9NmONhav/iWNqNEz93qH1axlnCU/PUQWlsr9BADGWEk5Eb+dcY3xoM0HTJWIU4lD
	iC6baKwScAYkomVytacetWAb1SyVDSZMYLEmCTj24AibGN3JJJRLWKqLQZp/eor/8VgJw
X-Gm-Gg: Acq92OGZX5Rj2uaIhVJFyUwpgOYq46y7Zb8dBFHYahHU6UaZxLsvNJVnibY+f3cWj2T
	lkeRjUD5EuK51ehtcqgUa8WC8FoGh2U6idny/AtKh9UJGn+4QYC9HyI/JJ1Z2t4XiOQ7Cs3sSzI
	P/c8dMNf51q3t3vdMzEwJvKa/jrO1gdXUVMDigB29C9qwY5levwO0mc8pEBuF7EbVG5B1knko6V
	8G1XDX3zP/FXP2TAB81sOofA1eXDBe5fwFLi+t4prrCAt3P6xIMl6hxntGsUIpRi6VDiy93Dqgu
	o57CwSFvKSm6p6NZktwwbohb46d+DaxzTBYh4rHMXhwlomlBL5qwTKGxyZwOwMXvDpsirOtyjqz
	/mEZOzMoC9J8pBXu6NJAH+ahvHO5p+39YX5cO0MsvcUSDTXNtAEUw1I/ocfSTMxbGn6bZFnds1G
	Sl3oSWZUIRUCtlw97eKg==
X-Received: by 2002:a17:90b:58c4:b0:36a:2a9b:3fb5 with SMTP id 98e67ed59e1d1-36a677f4ba2mr16425720a91.18.1779793904687;
        Tue, 26 May 2026 04:11:44 -0700 (PDT)
X-Received: by 2002:a17:90b:58c4:b0:36a:2a9b:3fb5 with SMTP id 98e67ed59e1d1-36a677f4ba2mr16425670a91.18.1779793904174;
        Tue, 26 May 2026 04:11:44 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72c4ce6bsm12104253a91.11.2026.05.26.04.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 04:11:43 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, abelvesa@kernel.org,
        jorge.ramirez@oss.qualcomm.com
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org, Jianping Li <jianping.li@oss.qualcomm.com>
Subject: [PATCH v6 2/5] misc: fastrpc: Remove buffer from list prior to unmap operation
Date: Tue, 26 May 2026 19:11:21 +0800
Message-Id: <20260526111124.515-3-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260526111124.515-1-jianping.li@oss.qualcomm.com>
References: <20260526111124.515-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vMOyWs_9IV5komBe3sVCmKFpyIEZ8tOZ
X-Proofpoint-GUID: vMOyWs_9IV5komBe3sVCmKFpyIEZ8tOZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5NyBTYWx0ZWRfX2elrKn6ooUkP
 IKuASoy18gNBvdaC+AG/gxHnXIqwX3Gd4grVKVwKAumGvnCRGoSQEoHA75k9ZxS5DPpdVdo3A+O
 yw23v5fbttgLs0J03bmUsRm8rqRgPTdEWN3tjGXbrQvCbt3ImtNjo25SRWI7uyrGOjztoes47Nv
 VR90swvPHJZjmhUg+RsVg/FFpXdSCLkQjWgzrTeZXI2Ma1BCDislT9gmpc+PcR79PiJ70nJ9yKO
 i12YDy590EolOMu9LAalYSgA7Yhs2wM+6ov5bjoEudvq04N368ngsEQ64qUGhh0bPwZqOxuyKBv
 14520pezUp58ihN08+ZNnIqU/Y56JCRW06WpWZAvFGosvspS9TC1uhiXzlu7kQYViVv40FZ1r6P
 OGtATF9g1WYLsmgCdDHHxHK02qEOX1/aaZLZBj9CfUAjKDXlg/zSY6bmz3Fx9GUcRIy3pBphmOA
 3Km5XV36rf7JFXniurQ==
X-Authority-Analysis: v=2.4 cv=C9jZDwP+ c=1 sm=1 tr=0 ts=6a157ff1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=8ZZxLbFAX5vHFMKIXQAA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260097
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-109786-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0057E5D4B6D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
getting removed from the list after it is unmapped from DSP. This can
create potential race conditions if multiple threads invoke unmap
concurrently, where one thread may remove the entry from the list while
another thread's unmap operation is still ongoing.

Fix this by removing the buffer entry from the list before calling the
unmap operation. If the unmap fails, the entry is re-added to the list
so that userspace can retry the unmap, or alternatively, the buffer
will be cleaned up during device release when the DSP process is torn
down and all DSP-side mappings are freed along with remaining buffers
in the list.

Fixes: 2419e55e532de ("misc: fastrpc: add mmap/unmap support")
Cc: stable@kernel.org
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 80a636962357..a8a58f889d07 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1892,9 +1892,6 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
 				      &args[0]);
 	if (!err) {
 		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
-		spin_lock(&fl->lock);
-		list_del(&buf->node);
-		spin_unlock(&fl->lock);
 		fastrpc_buf_free(buf);
 	} else {
 		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
@@ -1908,6 +1905,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	struct fastrpc_buf *buf = NULL, *iter, *b;
 	struct fastrpc_req_munmap req;
 	struct device *dev = fl->sctx->dev;
+	int err;
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
@@ -1915,6 +1913,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	spin_lock(&fl->lock);
 	list_for_each_entry_safe(iter, b, &fl->mmaps, node) {
 		if ((iter->raddr == req.vaddrout) && (iter->size == req.size)) {
+			list_del(&iter->node);
 			buf = iter;
 			break;
 		}
@@ -1927,7 +1926,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
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
-- 
2.43.0


