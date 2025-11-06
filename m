Return-Path: <linux-arm-msm+bounces-80515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7EAC3923F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 06:09:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC6CF189F718
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 05:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24C342D5C6C;
	Thu,  6 Nov 2025 05:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AI1ZSuwy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cIpy55ph"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BA62D8773
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 05:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762405733; cv=none; b=cJwYVdKzXzZM614L5XWaX+Qk+bD54xiGy5P3jxNSph/kEFz8rgR8Z1NK+us/UHCdka50OgkHB773vpP52ezVbcVizFRatAEUQ0Q3FyvwqSBLQsShcKd8qSuuPhjZppFAQbmOPQ4C6wZa7t9dE3QzmOQAlo+m6x4kA+u8BmWFsoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762405733; c=relaxed/simple;
	bh=Y8+KA6Hq/h9cqVjom36SFqyO02HmM6mSYiJPIDmdd4w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nN4pcRKBGHd1pTSvO7APrFVn6ufADD2GxJfSxmRZC42hQc8Y/SCocGXWyra+xrEe01PCjZGwRH6ox0wtiztjaG+3v78au/bbL/d+z6vKgX0JKuekJxr6PRn21xrx5yBENV/X3ZAR6Tcd//Jtn9uiRqMgmYrBukZPokB7ChTXx+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AI1ZSuwy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cIpy55ph; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5KElwi1784441
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 05:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ujaoRN0R9JC
	yofw9Ts/yVME10jsyMAe6gDSjtEx7EKQ=; b=AI1ZSuwyCsB/CYf8Z9MoEWTkTlh
	J6zFBGk1mODC6ILBPsc7Rr5w/h9IWEABoIEv3a/XcDA71ou8b4Ovph6h6ieWY7S0
	lXqePUkeTUzuvR6TKHT2L2qTdSnweKMesqnk+aY7qyowsnJzQ1yCL8O7IpXYDMs/
	AJf27D9wQArXIHrnZl8Hpa0RwWTXyuJjukzRGIGPjBJlbW9YsXCmzGcw07/WRX2i
	19EtDc1MuupA/nzo+KN6amf1R3eA4jQaivK33cwfxBuhjL8noHsMa4GI4R803UW4
	um8B54x8WCrANTqhvmt6ZmKkstvPjaWRB/ZUXDtV9UoaCm/iI5fjpVx32pA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8amx9u7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 05:08:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7afc1d55072so582943b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 21:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762405730; x=1763010530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujaoRN0R9JCyofw9Ts/yVME10jsyMAe6gDSjtEx7EKQ=;
        b=cIpy55phJL2lyorlOk4raviiCPLN9SYo7iNP8RhAfWPbTlv96ujDVwX/fr3jXYlUbj
         vphQEvfhiiGkMXBf4P9liuzXmMXlbNCRo9TURsxGVpjd0zkia1Wfckl6/B6kyutEGWig
         C0CfgPbWA09pFEYCxC+8pFOWTKNQibR0HPAH9dNLk4tPBpe5Xue5SwC718LxQmjsu5+h
         1ujT96OGmmQJxrDJeKb47jf7oLPmya5e5/m6lKEuX0b+tlu98oIZ4XgjuQD4mK0OY7nt
         eYDDDOYGhrEqKDJZpLa45Ny/Ls9xA/1MX5J8RiNr2Tsb74Bpd480X/+kCoLCcWz/c5rJ
         fYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762405730; x=1763010530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujaoRN0R9JCyofw9Ts/yVME10jsyMAe6gDSjtEx7EKQ=;
        b=vfPKs8nMC5SxqhpxtHSDNr/ahYduMY5aavo5WAhVm4iKOSTKhRwvNAfhcxTb59x8km
         U27Q7deR3sRjYrAJN7wOGGdWoAl95l0tV2n5W/djQ9s2kNvg4daf6Vv4aRoxXXg1JnTg
         HYJsYav4krI4gRp+HeCDYUpA4dpXhXczDIoqO9dk+mG7sWpwIYD+jVloSCxlRAXtx7E+
         ECg1k/LR+CGH4GvWywGBcLgaz1Jt+iAIemknnaqcs6Vcmm7Q07P4kFsxuGsUkFkh9X1G
         Jpf5VxX8+WfHf+mOhyDqXi5ApQJoYOAoG+xctEVp2VIReNzgNbl9xg+PY1apfJpUcJ6B
         umlA==
X-Forwarded-Encrypted: i=1; AJvYcCVDghJ3I2/BnyerI5uaZITMnAzLQcb6sJI7gm9e1ny2gD7OD4Wgrt6l3UZy+9h0ROyAmCq68O1mIzKuRXjD@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg64Na95A2X1RFLp/UsRtoqkHde4kJVu/+WEUFSUVZy8ueSJS7
	2Tpq8VQ9FFsTCBShZtUlCIvWnUWx5yVX0g9w9aAQgZFaelusB45B/PJMw0crQFomg2YsPNjE/ua
	y/yg0GnGK8bv0sL03WCLaGzdfbzPO1IhRt2UF31P2tD3giTqb9hSl3j0Wq/S0KmdMVLuq
X-Gm-Gg: ASbGncuPJn9rMB7jGDnUlpC4KHuy26fnUJVFPpGqrD6YtdGGuQPGttCDP3OwUh288Er
	s8CMLCcc711AdnxsWIzmDHQjJdV7zEOiAL0P0YUM77Uu+aRcZJYWo5pfEecPEQgaaxhHa6Jbdlw
	gzNgMDsHsWprNLm2EOKCft0JYVMXVS6nCAX4rEfHVjvHMEYJh9nGNEmOk6ZsXYvzKlXqfsOqaMF
	8oeotjwliJouxk6T0+B1Fxr5BVsl80DY8m6RNjh78s11MtGtJUvQBXCjX1eB6d2utP7w/y9Ndy+
	Q6rl1YHI26N+0VEGHYOJTaWTHNFei7LifbIUpkzaf9CPl2pOZDNlowDLrzm8c7EQAb9OTkH2k6O
	bPkYb4B36U/hr3i5CTb4zmC4cFqzcC00=
X-Received: by 2002:a05:6a00:2d22:b0:77f:2f7c:b709 with SMTP id d2e1a72fcca58-7ae1cc5f5e8mr7330938b3a.5.1762405730151;
        Wed, 05 Nov 2025 21:08:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcvDhrmBVPROt+wlrWa8IJlto8+biiFvtqHVaANPX8XnmNXEXYFFqELu1OvtY/577w190x3g==
X-Received: by 2002:a05:6a00:2d22:b0:77f:2f7c:b709 with SMTP id d2e1a72fcca58-7ae1cc5f5e8mr7330892b3a.5.1762405729612;
        Wed, 05 Nov 2025 21:08:49 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7af7fd5238csm1185862b3a.17.2025.11.05.21.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 21:08:49 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v2 2/3] misc: fastrpc: Update context ID mask for polling mode support
Date: Thu,  6 Nov 2025 10:38:38 +0530
Message-Id: <20251106050839.3091707-3-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106050839.3091707-1-ekansh.gupta@oss.qualcomm.com>
References: <20251106050839.3091707-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qTQEpi7Xb3TWRmGS01iSZO2R21kXmUhd
X-Authority-Analysis: v=2.4 cv=P443RyAu c=1 sm=1 tr=0 ts=690c2d62 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=eMrONWwZx6N8dQ6zNQwA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDAzOSBTYWx0ZWRfX1pak3FpuWTbZ
 4r+v5jJ4HI9oZErxMwZYO7ZQ5yDePisp2oqvVYSpNIBy8yQXKozfDnkGiOh1JpMxe+uzMniOjpL
 zNG3/V28t/iqjF+saT+vjKlYCOM/WrlEZujaRWlFqvtLa5spd/5Hi7QoyrHLJuKqwKKrbrhRT8B
 vW2DbMcBoCKNBZ5W9oSCQVJJIeJsppyFTI4DH35zDlvKYGYH4MGe8UJNjA3SP7Yyy5DSrwL2+Mp
 UfPcZZ7jWerNUk/y0TubKuiyHJXRzjy157ppFqR1ncSXRJteEMIAf1sCkJWHTxxzdipzrEsyl+e
 ahRWifaEY+Y9VSrG8qvJA8okZpLNckdfzUcZfF+pELMg4yXrZ2q68tHKvdiFMZMc7gnWJkR0Lx4
 +iOa3n3ZrLZqWgFEedzMz5poQW/N+Q==
X-Proofpoint-ORIG-GUID: qTQEpi7Xb3TWRmGS01iSZO2R21kXmUhd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_09,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060039

Current FastRPC message context uses a 12-bit mask where the upper
8 bits are context ID from idr_alloc_cyclic and the lower 4 bits
represent PD type. This design works for normal FastRPC calls but
doesn't work as expected for polling mode. To enable polling mode
support from DSP(DSP writes to poll memory), DSP expects a 16-bit
context where the upper 8 bits are context ID, the lower 4 bits are
PD type and the 5th bit from the end denotes async mode(not yet
upstreamed). If this bit is set, DSP disables polling. With the
current design, odd context IDs set this bit, causing DSP to skip
poll memory updates. Update the context mask to ensure a hole
which won't get populated, ensuring polling mode works as expected.
This is not a bug and the change is added to support polling mode.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 679cd8997a00..ccba3b6dfdfa 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -37,7 +37,8 @@
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
-#define FASTRPC_CTXID_MASK (0xFF0)
+#define FASTRPC_CTXID_MASK (0xFF00)
+#define FASTRPC_CTXID_POS (8)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
@@ -489,7 +490,7 @@ static void fastrpc_context_free(struct kref *ref)
 		fastrpc_buf_free(ctx->buf);
 
 	spin_lock_irqsave(&cctx->lock, flags);
-	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
+	idr_remove(&cctx->ctx_idr, ctx->ctxid >> FASTRPC_CTXID_POS);
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	kfree(ctx->maps);
@@ -625,7 +626,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 		spin_unlock_irqrestore(&cctx->lock, flags);
 		goto err_idr;
 	}
-	ctx->ctxid = ret << 4;
+	ctx->ctxid = ret << FASTRPC_CTXID_POS;
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	kref_init(&ctx->refcount);
@@ -2451,7 +2452,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 	if (len < sizeof(*rsp))
 		return -EINVAL;
 
-	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
+	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> FASTRPC_CTXID_POS);
 
 	spin_lock_irqsave(&cctx->lock, flags);
 	ctx = idr_find(&cctx->ctx_idr, ctxid);
-- 
2.34.1


