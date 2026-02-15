Return-Path: <linux-arm-msm+bounces-92866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEEbMvoOkmlJqAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 19:22:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 305DD13F5FC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 19:22:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75181303C630
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 18:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55AAE25A64C;
	Sun, 15 Feb 2026 18:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQBHR3PU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WxWWwZ6e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282E7260566
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 18:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771179712; cv=none; b=EJFxLO2A/VJKyPUUQ6usoN6cFVTSbEWy55t+h6m69Bwt1Y+5J5DIcMqVQMCXGxkd5ooWzce9oa1tJwFo/mxcFoQ0qcadVyFX5l1o3S51qIYQmqZJR9hduI6bFgSS47SBR7g1EoFvN8fFLKklIWWgR/GkuK6Bnh2phHqzMIYIjGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771179712; c=relaxed/simple;
	bh=bu77IN3dKv3unoNVwnBp5YYz8WY0MpEtgYSgfVR0D7I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PfF5qv+oYKAKRr9wGofVCS+wKcP1DEG0VLjCl9NBYEFJukSUYmc+3rdGAIaH6ya7SzpE4l38iLmD70ZE6+IcXuO6r/jehNHguiAYQrAB71HCXKXDCrbfRHwXmFECdQ3ea3ZdhClSEECvam5asvKT2mqi3lcZnbJN1K3bsG3pDvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gQBHR3PU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WxWWwZ6e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61F7lNe3350254
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 18:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Q9Y1cdwy9BG
	TV0V5PwHxjZOzyujS+TRJsJwWN1L6Km8=; b=gQBHR3PUylcBdn5Qs0sf2f1hk3n
	XmNVeuHtfMQwyyvqoqsDfgFa92d9yf+TQ+Hw0rO0i9ReHIPqKG8KO2yiCbSIgPFA
	6HGnKb4XPaV2MABg0B3iWc9ypHBQh7Mj0FfEHWB6WYnrlXdumXg5TYpbbh9jXG37
	pNaODDZMkFPP8Z7CAMNX5dKfTFnjTdDadK4icAyRjg0hZJPuDvapJLbFYirKQ+x/
	BXp+JIxu58o1MRp5vKMh+BbT33qOCf43nDx8iHyNMZAl0M6lbzZR3o13165Czs8t
	BlII2dYs/Ci8DgMeSg7BQMxPO0yTbU0Vucz1wWSpU7gWxet4Uzt8L1iXW+w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4caerc2xjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 18:21:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35658758045so1891709a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 10:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771179710; x=1771784510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9Y1cdwy9BGTV0V5PwHxjZOzyujS+TRJsJwWN1L6Km8=;
        b=WxWWwZ6eMQQqJt+fwf4TZQVJ/4wl46rBoHcg2oXfSRSLTlGs9AKDuk9mxcGcjSmBMR
         vHDp9bQCpOMPAUwLkigNZb7aPYNFe6RV60rUhdeCKPrM8Yswu/lp7KhMSSprphTYf705
         O9SdHOoXXtYaMgzFkFZgNAfkj9+8YDRJfNRrCLNiiCVeDCg4Di/F/OW9fkuFjrijlXKE
         lU6ZdehSbDaR0RC49jRXkCG5L4zjI3TAgwt11spxgEqS6i3EEQ54d5IUqNpacksc3+A1
         6gRfkE/Q0sHU2L3jJy/lKM4z/W3qa9DwXMwa/54Uc2aKN9E+u9CAoC0tMDDrEMXkHvyw
         lr9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771179710; x=1771784510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q9Y1cdwy9BGTV0V5PwHxjZOzyujS+TRJsJwWN1L6Km8=;
        b=ngqjyaVvPQTs415cywkP3BIKIjChCP3s0oVwiow63YasXUuJWdB4oWeOwSSeUZqRtm
         NC7JdBa+o398GkxfcPa+KgYq1UzKOF9aZakk2+w8dm2NyR7s3nhVUOb0Y8NeABZi3qHg
         /i5d81onPqfyceZtNk7qi28TQX+J0NGrywZbTFmgoM1jreyim3I/UZFx3F9f2qBILfIw
         JMnu6cIlPy02CbenlZqq4H+wTh3riqOBaffoA1l7dTnHIaAF1M4gPpX+7BIa992CTzrt
         4rs9EXABpD0/LICcTeJ9olOpfj+H7pcEj8ttLuc0qpv9liQvvWqOK/z3K0ILakxPdTl1
         tooQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6Mb74MiGMd24PoqXnIihYMA1WRjEnkC7UoEujR06E+1IHGkqWeEztqK7bJIiWTosN0O5HB7AOlrmGYsnU@vger.kernel.org
X-Gm-Message-State: AOJu0YxbhAuawxaxZzDiIeH6uL7Q0z+xqxT3q9yzJu7nM3wqUZNFJypN
	8uSzC74wIUP5DVvSf05Ac1DTIcA0+thvFj7sM+seaG8ojCn2UOQP9jQc3AADGaiY4wTZX+PRRmS
	JLPfBu7qsV7H+iSdqK+RkU+XeCgz1xJ/BTFX0FH6WZ8hZHuIucJ9rqT+Uanpgb0HC3Ww/
X-Gm-Gg: AZuq6aLaO9pBfDAcaIzow74df2d59uTvPAs/mBGWuWWFvhyBUmMzrSLJxjSblNk+kPO
	tHPWb5YxAm9jk00LLgBEoPHjh/8yQw13+RyPjm1UUEhvbL05YQMcSo4WSqt+Ha6thcNZv/Y0wt6
	//7hAKayskYUAE4mu4HNa0X6Yt4m2DeASYuo6+D65/VMZv+LX7Q1NCuW06UNTBygkze2g9aCudj
	a7PQPJeUFbE8NSw7CrRiBGkhoVDnf8tQGfHmc8pizF8ES50FNDGzbhR5ZL9s4ar9iAY7Yg3vNId
	y7tmO2Wlvn+tk74mRtrFFQH160I2+B+5qxUBgjDyjkdVDjXoZmdgQAxnEJTuKis5XyRpDfvcX4p
	HutR1/TJk+7FXjvvgV745wfiVSboLHPBFbkO/BvhIeSWBSKA9EtqAqw==
X-Received: by 2002:a17:90b:57ce:b0:356:22b5:704f with SMTP id 98e67ed59e1d1-35844a4f70emr6013783a91.15.1771179709680;
        Sun, 15 Feb 2026 10:21:49 -0800 (PST)
X-Received: by 2002:a17:90b:57ce:b0:356:22b5:704f with SMTP id 98e67ed59e1d1-35844a4f70emr6013761a91.15.1771179709203;
        Sun, 15 Feb 2026 10:21:49 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662e537desm17425381a91.4.2026.02.15.10.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 10:21:48 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v6 2/4] misc: fastrpc: Replace hardcoded ctxid mask with GENMASK
Date: Sun, 15 Feb 2026 23:51:33 +0530
Message-Id: <20260215182136.3995111-3-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260215182136.3995111-1-ekansh.gupta@oss.qualcomm.com>
References: <20260215182136.3995111-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZJraWH7b c=1 sm=1 tr=0 ts=69920ebe cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=9Nm459TXYEgc-GpAQpYA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: L9lZCj8QXEm-kGa-SEEH_QHKAysQjxFu
X-Proofpoint-GUID: L9lZCj8QXEm-kGa-SEEH_QHKAysQjxFu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE1MDE1NCBTYWx0ZWRfX7WXxSIXOXuK/
 0lxMiTDim1ev9OVWoITrO3TUEszA/hmROR9tgrhnYzuhfZkL7kUCckGRUa+TZpERAmnrd0pZd4W
 z6kL4B9TQstmWzqbA/OLwuGe2hjEAgVkG3vBstvLp3h2ELK/il7zR75ylnDsNCR9ugGBN4hz+JO
 Txon33Ey+oi6etN5fox8GXOu9aTGk63MntXX5o/gaKMUxeIHDEL/rlMnEtYBySV3pt8+1mcmkia
 oY51oXcgJGIl/hScupY+6VIuT3ddxyZRfk8BChMNUe4zbnDtK1JASvGjn0VSVOZ+bbm+eI5ximr
 M0Fk1VAETORs/COjUrae7sRQvUyb2aeRpyWHBKYUDAAF/Pw6GlU1NTSoKt/8K6nTFTkl4QRVXHD
 0vC+Z2IJLCzaZzokRY8Za/ajuI87UgSv/7a1IDV41KVLy5iNNFtZ4y0qQmJFQEzrd/HfvlypTFr
 /aiJJ70lLqxyNFoaKAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-15_06,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602150154
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92866-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 305DD13F5FC
X-Rspamd-Action: no action

Replace the hardcoded context ID mask (0xFF0) with GENMASK(11, 4) to
improve readability and follow kernel bitfield conventions. Use
FIELD_PREP and FIELD_GET instead of manual shifts for setting and
extracting ctxid values.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index ce397c687161..0d8d89a2e220 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -37,7 +37,7 @@
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
-#define FASTRPC_CTXID_MASK (0xFF0)
+#define FASTRPC_CTXID_MASK GENMASK(11, 4)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
@@ -515,7 +515,7 @@ static void fastrpc_context_free(struct kref *ref)
 		fastrpc_buf_free(ctx->buf);
 
 	spin_lock_irqsave(&cctx->lock, flags);
-	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
+	idr_remove(&cctx->ctx_idr, FIELD_GET(FASTRPC_CTXID_MASK, ctx->ctxid));
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	kfree(ctx->maps);
@@ -651,7 +651,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 		spin_unlock_irqrestore(&cctx->lock, flags);
 		goto err_idr;
 	}
-	ctx->ctxid = ret << 4;
+	ctx->ctxid = FIELD_PREP(FASTRPC_CTXID_MASK, ret);
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	kref_init(&ctx->refcount);
@@ -2506,7 +2506,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 	if (len < sizeof(*rsp))
 		return -EINVAL;
 
-	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
+	ctxid = FIELD_GET(FASTRPC_CTXID_MASK, rsp->ctx);
 
 	spin_lock_irqsave(&cctx->lock, flags);
 	ctx = idr_find(&cctx->ctx_idr, ctxid);
-- 
2.34.1


