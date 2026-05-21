Return-Path: <linux-arm-msm+bounces-108919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SD3YFUecDmqTAgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 07:46:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B72C659F32B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 07:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB2333074015
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 05:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAD7E1D432D;
	Thu, 21 May 2026 05:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZfwPBGFz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NXUw1FwJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA373546D9
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779342355; cv=none; b=Itu/C05QUBINOxcc+CD1WiXy2V0mmrShGgUQoLYpmboTIlWYYgChOaxZbttBX4j+G8Fp6UzPBuzrwyYsShA+iAyrqUQWgBo1jGwHN9v0jguDK68SFdZIRdPcGGnO2Ylj8XcomKjoZf9mWEGjVKPsytoz7wlV9eoo9xRFpl8lza8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779342355; c=relaxed/simple;
	bh=1ddE0U7h9weXbIaT7HOzewRICM+9yO0cSWfl91aUt5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AeXvivMSauhknoOmxkkjDWl/vKvlLweFEKtkQ8Ve6LlRHPHMSGF0+B7nHEmeIBuM38/bsvHUp/1l2DgT79UCZI/zykNms9jphTDCcNfI6BBEeMf0GcoSdN5GYkLerVj1h4IHCfhW80p1uH0r2QYdtwJjTMCFpSFnnhVUvIKv6lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZfwPBGFz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NXUw1FwJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KMO3TH119201
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JIaEBu2fXti
	OblnnO/rwwIoef8J83XO0Fyvu0X3nK9Q=; b=ZfwPBGFzxho5X5ZszEUmmAM3mJG
	3nZGqVTg2yNReTyiPavbYj3iuf3xS4B7wur88ig2Hg/uKKmTVJYdk/bpMdUNIG6W
	lZTP3XntY2wIrIFI1IzNesbI6HEbJVXTjxq4RSLrE0acS7RRUWEzr0L5WMj4PBSS
	Bglm7/FWPBjSY2WDvLuEwT37DOm2xnZPSUT8OQV2z4E6a8qYzwEqc7s4EY0mg2Ak
	yF3ixCQIPtMs5DNVBE7YYFIMLiRGk7Kvg+5JE+1YPfcOEZ/QMt8XbT+BY3DrgfR6
	bXP7Ho+6N8110kQquJiOa4s1qybiV6EM3j4sdTSyDpNRN/+47LVAGuPAm8w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee8baqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:45:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-368b15eeb3bso12076837a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 22:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779342353; x=1779947153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIaEBu2fXtiOblnnO/rwwIoef8J83XO0Fyvu0X3nK9Q=;
        b=NXUw1FwJqMuzcuUSaXjfO7nCvz9NTmjjC/Xut+qdCLaSJ62IVPBMOAuQI7Xnq6WnEA
         pz78ixLultNJiehQDVHGMUeA1jTnqldFdUFoInaA9MU93UWxDXKkQJBeuqOnTiii1gcA
         uuVyeQa93Rg17MK/LUn6hyAEcWpR0ItiVUI9c/HIAzPP2k83JVzlpNPJ8XqyVt8AfsXV
         FCuRyuN7gFlBeCSM/Z5N177uxqhTMyVgEAxxGq8DrXje2E1w/Lpa1wzd1aIUQB4ViJpT
         TGejtkKUwuW4y4LM2lr4SmiSvsLDs+juGJAjaoGHlTTckscVoaV9vYelPgmP6JIJx8Ny
         yAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779342353; x=1779947153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JIaEBu2fXtiOblnnO/rwwIoef8J83XO0Fyvu0X3nK9Q=;
        b=edsGtv8LRNDC7t7irdTRCDosTzJ9ONDWTnhv56nwtwn+ascusgIe6gx/viv7JRNkGU
         CXrybi1KhwItafcJ51zUUTs91Hq2fte8AmPtvMGUlOsq5jVd0Pkdt9KsZCBZ8tXlDOCb
         eVDHehBwHufRIgFzpBIaQbwkjBWHwY+wH01iINoIS0k6VhqQ/xligdoCaFho69Botut6
         fUmWE27CQQ8JPycBuIAxr0sP4Ne8wL7GVFwHAJgvAzXITYPGhOTlIDHTe2smo4ncVFYs
         l3RsxgjnP8tDH3xW4cWwRCKimwCbPVecliuCbgsG11e4Zj/X7NyZyL8iJCJ7IFJGIPe3
         VPEg==
X-Forwarded-Encrypted: i=1; AFNElJ8QYc/h4hluqgSOHgIVnKP9TRQydPrNzw4cFNVzpiCNWsKA3q9J+VpiqrII85Kt0hJFPKzXq0YY5Js12Ngf@vger.kernel.org
X-Gm-Message-State: AOJu0YzeTotky4TPRUAftTO17un6g+P2SVKCi3srd9qkA+w1z8A/2QJy
	xaS5w6/sJ3XraWS1xyaMlDcE82hfm5PeAuyix+PfnotY5Xu6SBQ/4sCmexJrGtu+/4mQszJhFC7
	hwDYyxICWZQy13n3o0IPsDzKsOAARP59R222jReBIXWWpN2gqhG7AgdxwXDqKnpCit6v0
X-Gm-Gg: Acq92OGmGOMa4+dwrJrM2aJC2kU8s/yAaw+P7hAJsWPktqX193N+kf7tU0xeIsUEbAL
	91MUJB/DSFy9pKyO1Q6YQnEqf72StOiP5zdi11E/vqIypclf+OFT3U3urEwSKY+ZnM3acVG8Odi
	wy+6cxbiwg5Cd18iIY0PxOECmzRqNXrXbvbmT5WD3E+KT13XXCubBolzDXcOX3OgVKcILCPWn7D
	RxP0Rt1NOM79XhThyMZScEnvfR6DZW75St4cIYKGEzmuSxm0oGOQHMS06d1YNuJhkcSuZiBktlc
	BuO1+rSGllBYG+4eSkHJSirIFKypV+Z6yCa0sq0+sVGK7BDKKF6DdtsPzuHsp43yQRJjf1G0+0P
	vfbMe++NChl/UjYbmeq2SCz8PWq3OZ+NwCK4oU+b2lNcWeUYqOzM64g==
X-Received: by 2002:a17:90b:2f43:b0:35e:3e86:e2d1 with SMTP id 98e67ed59e1d1-36a451488fbmr1504409a91.7.1779342352876;
        Wed, 20 May 2026 22:45:52 -0700 (PDT)
X-Received: by 2002:a17:90b:2f43:b0:35e:3e86:e2d1 with SMTP id 98e67ed59e1d1-36a451488fbmr1504375a91.7.1779342352434;
        Wed, 20 May 2026 22:45:52 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a3cb323e3sm1474847a91.4.2026.05.20.22.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 22:45:52 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v12 2/4] misc: fastrpc: Replace hardcoded ctxid mask with GENMASK
Date: Thu, 21 May 2026 11:15:37 +0530
Message-Id: <20260521054539.128651-3-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260521054539.128651-1-ekansh.gupta@oss.qualcomm.com>
References: <20260521054539.128651-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HBzTieD1fWzJS32t_GiW9AJ-u9T5gr9F
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0e9c11 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=HL6mAI18knL3XnPGOeUA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA1MiBTYWx0ZWRfX1ssWgYpWBUDi
 R1lDPpdGeWpcWkAxHRtJfIZBiOg6L9gkgfJ76kWXAxiMokjRdct7stlThsmxIoMrtMJVJie0k3J
 ydEXB8dtpOZag82sifnZR5ImCi8z0ZisLy7LfrpAuqmD4IZUBnzyFd0+XroSPRXAxRwYoJqonSa
 aYBXQWmyZ+o1AF2Jw+Y8ba70jzNcOh/6+7auisLuRwQOuhT69nHcLOqh24W/2JESuDONQHskEKr
 ZhH9oCyEMtwZ8S4dFn0Qb+uzb9075ebhuD75S6k+0PE/DWPpZ8XwRPCF+yNxfyIxov7iXpidNoR
 j6Qe0IOGrb0RmDS5IGd52fwD1P9fBgpvXhltL5smzNq21hxygmJVTM//6Z0Q/aSzaxdne+PEOVG
 Bb5izmlYYTqk0hPNKNBU3xx+pqgJvr5TAy+hL02eAv0hYmPl2OaJYoriXKH+gjQH1dTXRbDWppV
 JTCMzZEem/9VlH1cWmg==
X-Proofpoint-GUID: HBzTieD1fWzJS32t_GiW9AJ-u9T5gr9F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210052
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108919-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B72C659F32B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace the hardcoded context ID mask (0xFF0) with GENMASK(11, 4) to
improve readability and follow kernel bitfield conventions. Use
FIELD_PREP and FIELD_GET instead of manual shifts for setting and
extracting ctxid values.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index a9f507a88c67..3f5d5d73be5a 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -23,6 +23,7 @@
 #include <uapi/misc/fastrpc.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/bits.h>
+#include <linux/bitops.h>
 
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
@@ -515,7 +516,7 @@ static void fastrpc_context_free(struct kref *ref)
 		fastrpc_buf_free(ctx->buf);
 
 	spin_lock_irqsave(&cctx->lock, flags);
-	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
+	idr_remove(&cctx->ctx_idr, FIELD_GET(FASTRPC_CTXID_MASK, ctx->ctxid));
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	kfree(ctx->maps);
@@ -649,7 +650,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 		spin_unlock_irqrestore(&cctx->lock, flags);
 		goto err_idr;
 	}
-	ctx->ctxid = ret << 4;
+	ctx->ctxid = FIELD_PREP(FASTRPC_CTXID_MASK, ret);
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	kref_init(&ctx->refcount);
@@ -2508,7 +2509,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 	if (len < sizeof(*rsp))
 		return -EINVAL;
 
-	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
+	ctxid = FIELD_GET(FASTRPC_CTXID_MASK, rsp->ctx);
 
 	spin_lock_irqsave(&cctx->lock, flags);
 	ctx = idr_find(&cctx->ctx_idr, ctxid);
-- 
2.34.1


