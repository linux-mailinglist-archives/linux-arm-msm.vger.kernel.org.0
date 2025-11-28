Return-Path: <linux-arm-msm+bounces-83685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4C1C90DDC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 06:06:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03D643AC438
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 05:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC44A2C3276;
	Fri, 28 Nov 2025 05:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bNyAr8uO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DcYGhAo2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6101A2C324E
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 05:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764306349; cv=none; b=SCEdJnbb++sWTRoHUL6EAsEYgDpM5lvq1W9GzLcCi3qlW6LCFuA8t6V38scyuEzG6s0rgTb3dGcAz98zPrI8NmAEa6vmW6e3haQydIns+maPlc2NbCNLnafeZxT5Yw1KXvzFy9UsUspv+i5HcLF0Gkz1qJA8Z+VM+k2yZ8013pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764306349; c=relaxed/simple;
	bh=MHn+V6TRZoHpB/IKHPrGSV0ycKamLtaH9inFw5f2g5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Do5fqmx6j5BwE4z2eQD4MgMVBsXe2cV210yi4az1AHeIZacIda1fMUq8pFSbE4TCnYGUrtCYkY7ToLijJza/nRxKoZuurKP3sj/PCcwiUh0F7omEzhelszYrIjTQJxmuFAcL8+LUQ5d2+QFc9k0yPfuGnv6qpXPviZe71IlJjgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bNyAr8uO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DcYGhAo2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARLF2bV2150851
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 05:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=44twYS2j8pu
	ef9SPj0m2ACmUVD52vfoicRaqJwTY5UY=; b=bNyAr8uO7bts12AzHYKQ8z/cNfl
	z5T6xsO4+YmfTg/HZ0048u/vEk73rflpzjqeyZ9vX4XHSYlnJlZJqgEYCsBGlT7e
	XSbbqLcZb2FtKVTfef8U02Z3eaIoSfagEUpK3OV7q0t3uE7x33/jEfxU+4IIGcpp
	3ymZe5MPTx+Q5lZYaNWNM9B94tnt1U26IazZmrUs3neMe04OEi+E5Hk8dvGeO6p4
	dWIGorrhRF7bvnW0mAY5TT7fq+0Ho+g5rzpkPO26Q+JMjYXUmUyofzwF3sA1odcB
	aOrSj6dc+5u/9e9VQ/xCkZJFgl5TzWeFvlWY+6PbuOFoQ2tQpQRIfoIE+4g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apm2rt9wm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 05:05:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-299ddb0269eso18463415ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 21:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764306347; x=1764911147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44twYS2j8puef9SPj0m2ACmUVD52vfoicRaqJwTY5UY=;
        b=DcYGhAo2mFXvHIRyBkeStDBw0MqqCXjiA1PRrN4hA4SjjtUwEDSB5eIc9nyuo78GqM
         XGbbG1Ya+20b21StuKs/CReaCz8XVfJAmB1y86SNcFsidCsxBX1aBFIlXaTRm30laG72
         BvPPOSTomjebyN0tFnXYpLQhS9xxn94UnFxM/jGL2/xz1sROKAUwXjHuiMLVEmuIV7QB
         HsaIhKBZzQVSSI+wmpYjbep5LCbbIZ/LfKqdHdT7kywwj5fDzvoiVlUlbFxAoVkLNjp0
         xwSCoPZ6uDDYjuxQ18ZZMneMC6F17r+UmouveQ4LP8z+4cra0I9MTkI5HNapGsaL3E2i
         i6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764306347; x=1764911147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=44twYS2j8puef9SPj0m2ACmUVD52vfoicRaqJwTY5UY=;
        b=KBSPjHgUp4C7LmMq46YCCifPt9rqwlkMqqmfdg3/qR1JrQa4j7Zus7/v6OYl8YEhqB
         2SyFhC/aDVFlqqcl0VZ6GmAOTPqHM86BvyU+AIAxBJ5Ec3N7vP/l0+yLnrtXkET+Xv5h
         e6AixZ440bIg/r4Ev2uzB3vIHnr723e1uvRDtgbCh5zqCrNKRw557jOBnIja9UdIH0E2
         1PDLLjqdmqFAXOBV6CC+ul7FL528QNdVruygHCZW6Tt5A5RmJIMp2cF93C0j7sXiqRyg
         5XA8yZWuu0N83jFt2D4Y4g02q0+jmXUtQ/gL1tK2YOCqqeID11UW48m1bT5uIVb+4d2H
         4XkA==
X-Forwarded-Encrypted: i=1; AJvYcCVp09l1WiRnKu6tSboDKYsQTV2LBxPmOQ6OP26MylXhFT69fM1h7AKQS48ydN6PGUbxCIsZSZ8hNhobQF1J@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkhl8MLFYR8e5gMNIFHxIZBhVSJfGewihmX3TeYKrlv9UHIvnq
	acHylbHFhDcn73NWLmn9rzTRlwkRkiHc8+oFnjTV1zeVYbJXN4RrOtlesEA6EyWNT8RgDZeIUF+
	I1c2fRRCIuOAIHFEYpaL+zxxR2n+ETC3RBla04CgE6BtgYAzPH/4ESAyeXZ8bQWuZ0Yfk
X-Gm-Gg: ASbGnctFuSHOKgoSKmltzQ+xKyLwY3gpK215HiWiOd2nB6GHXo7G2v14T37QVl+XmQ1
	7xdv2PF8/bMsHVOW4cuy5vNQROnfQyRF4fiDNTRzSUOK9IGajc0YyTugo621QnQ3wXg56RZpjOb
	3+twT3ASLqSlnbRSQxFSSgwrcPTUKRfyjoNNOf6zPkkPG1l0Ee0QgwgvSZ0N6KQt1P3XoIVyB6g
	o6xXlAoqIRLGPr+dg+3DKasrzTu9bj3RUv8DA1fftpOOJrBRUEZ42BO3ZBahxc1lUCmYrQ2iv+b
	m4YTIH3ZkXoB2QWcQhB35rRIjBLMHOvSLTDYoYicB5flFfQKFbY12A/z3nnagL74zzvJWUW3PGV
	39FJESotPpJF2PCJnGLf/yMuyqavBobdSdfDPUgd/KQ==
X-Received: by 2002:a17:903:4b4b:b0:298:35c:c313 with SMTP id d9443c01a7336-29bab30b2c3mr152791295ad.61.1764306346596;
        Thu, 27 Nov 2025 21:05:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5vU/dXx4v3KW0plfFY8OrOYCD0CU/vAR1V5h3oXplPI2SFfGWsGEiYMb5j54hJMtNg3yK0w==
X-Received: by 2002:a17:903:4b4b:b0:298:35c:c313 with SMTP id d9443c01a7336-29bab30b2c3mr152790925ad.61.1764306346126;
        Thu, 27 Nov 2025 21:05:46 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb40276sm31952075ad.73.2025.11.27.21.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 21:05:45 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v4 2/4] misc: fastrpc: Replace hardcoded ctxid mask with GENMASK
Date: Fri, 28 Nov 2025 10:35:32 +0530
Message-Id: <20251128050534.437755-3-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251128050534.437755-1-ekansh.gupta@oss.qualcomm.com>
References: <20251128050534.437755-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDAzNSBTYWx0ZWRfX7uqCMKMgCU0t
 /pubpP+NxtWI4Tr8/oCU746WVjiOMn3i70Lq0ePvq4ClFm9yEsxYrO4JnDRdSBfALZDhr3PfbFw
 9jeor4Vty7HpRSmDR9A1CsCd5Ku1adv/O/hIflUIatrG6aplwzs66kbq8tsIr2XbdRhPQKp95Bz
 /aV9x9XmOi4dwp0fojwEZXlfsiFABfiQLkVX6ZNhbTDLO9oymppjuA3bPLdBsvakDpz6UbgX5yQ
 +o6dpQbEoRRz89uKpIUZgF8ChoqdWUgawDNTWnpr9yCjtgcg4H0bX1kk9l0d0MQ/ORaJQPsugO0
 /k8NjoD2QCoZXEAR66e4fqNmr20mf1/kUQ1Ctp6+hrFPbeZcsbmKGkAeirFWQTaLn3MljtqESdE
 I70b2Np5JZxxV9hIZbGlcsGzNzTsjg==
X-Proofpoint-ORIG-GUID: FK5K0TdEvK3VMuwDN1oBYQMyeOVfriD-
X-Authority-Analysis: v=2.4 cv=W941lBWk c=1 sm=1 tr=0 ts=69292dab cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=mhgHPu3uRlbtNExDwEMA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: FK5K0TdEvK3VMuwDN1oBYQMyeOVfriD-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511280035

Replace the hardcoded context ID mask (0xFF0) with GENMASK(11, 4) to
improve readability and follow kernel bitfield conventions. Use
FIELD_PREP and FIELD_GET instead of manual shifts for setting and
extracting ctxid values.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 679cd8997a00..f7fb44a8e9c0 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -22,6 +22,7 @@
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <uapi/misc/fastrpc.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/bitfield.h>
 
 #define ADSP_DOMAIN_ID (0)
 #define MDSP_DOMAIN_ID (1)
@@ -37,7 +38,7 @@
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
-#define FASTRPC_CTXID_MASK (0xFF0)
+#define FASTRPC_CTXID_MASK GENMASK(11, 4)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
@@ -489,7 +490,7 @@ static void fastrpc_context_free(struct kref *ref)
 		fastrpc_buf_free(ctx->buf);
 
 	spin_lock_irqsave(&cctx->lock, flags);
-	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
+	idr_remove(&cctx->ctx_idr, FIELD_GET(FASTRPC_CTXID_MASK, ctx->ctxid));
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	kfree(ctx->maps);
@@ -625,7 +626,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 		spin_unlock_irqrestore(&cctx->lock, flags);
 		goto err_idr;
 	}
-	ctx->ctxid = ret << 4;
+	ctx->ctxid = FIELD_PREP(FASTRPC_CTXID_MASK, ret);
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	kref_init(&ctx->refcount);
@@ -2451,7 +2452,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 	if (len < sizeof(*rsp))
 		return -EINVAL;
 
-	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
+	ctxid = FIELD_GET(FASTRPC_CTXID_MASK, rsp->ctx);
 
 	spin_lock_irqsave(&cctx->lock, flags);
 	ctx = idr_find(&cctx->ctx_idr, ctxid);
-- 
2.34.1


