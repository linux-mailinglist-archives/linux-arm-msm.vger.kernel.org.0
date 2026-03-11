Return-Path: <linux-arm-msm+bounces-96827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oG2PK0bgsGkuoAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:23:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 147B825B71C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:23:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A2A630B55FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371DF3290CB;
	Wed, 11 Mar 2026 03:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mBqQFKbb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H2caCwIB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422F7248873
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773199405; cv=none; b=EMdI/6jxg3QaFnOTChibbFYIQB0keGGkTnYpWatPo3CTXaGwSBjn57ZZcvUnKWkUQtG31AMtcSYY3Saj+PssHBk5+FRGQ5QKPBZ4cGx3t9QJgYpQrnB3Undbiy1BC/atgOKEG809RCAzjIavBpsG6gJrSQU+9/rpX8AJUDTeYSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773199405; c=relaxed/simple;
	bh=uSnw+FGxAf1+lIyAZwtg2QGOswUDFmlVWOT07uiqNc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oi1n16ScQASOcILbxQc+4y4R9jsF3cwoUDYrPlVgjg+UFNVHCe1Ds27m/wzM11MaTjAAAb4HD25SL9WDY3G7oH8SnJ5nsZjMAvgu6GSWxjt9B5iS70teA4qpDetpgLc1A5X7JymlXJ9as3K1bUbSdLkWxpnJIKsbFARKuTRrW0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mBqQFKbb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H2caCwIB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B3FMkJ248220
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KDZZPG9DkNIoQAYC/ZQxpoKTbgw+/Pi/qUEgyBqUeUo=; b=mBqQFKbbO/V+Rc5G
	cz+jOpsOD1eQO79WD2MsOy7K3yJLqyYA8w/F2uzgvSdhBUtpxUHOHfeojxEujTr3
	layt1dO05KYP5II5K6cZBXzD/y8yytThBo5I7CbHsYZdFaAyAL8I6vCi8rCjqo7F
	IvcuawqsFerOgv9H+kDf7Xt4R61lIcLlcuaM7M20c08Jx9J/puQ8fNFfaZICGisa
	g1RpAYHP4XuxBUFFNGI1Y+1t4UuXGTMce+GO/mMc/M5VMPf51mx+ofIgg/Q9gFJn
	wqWSp+67rb9dRUVkuOY1lzIUG3Y0OL4s9EEYpaDVB8grNY9AmDT/bSY+WwMnvFFN
	rds5IA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqv11ntt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:21 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56aa6d6bb5bso17704085e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773199400; x=1773804200; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KDZZPG9DkNIoQAYC/ZQxpoKTbgw+/Pi/qUEgyBqUeUo=;
        b=H2caCwIBUx3EynrSdyBk3ku1RllP/8jhWzFdwCnuzVGfsVcPTXI+uq7LoHbmObD/TG
         1OrZ3nYg0VlZ5hlJGKMDqwC9OB/zIRoQCZtkfstdRmnRBYg4FbH0Ec2AItOG4pi2oRel
         JhkZF/dq1SwPfaNhMb+TkzKdH6/l/C4vcDEMcpYNxIHYid9O3YY3PdiEjdENn76isP/6
         8GhWVEnJqfFb3mM6SizpjMBdxKb1lgcn9R51Afor174BXp5n9kQ5cv/NBkD9tGugJ7FW
         D+krc//tMmSMXGjUoEgPqucQooYgSA6qymhlCwBD93cfp9eraQjGjQRHcZcJW9PmAE5T
         oo/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773199400; x=1773804200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KDZZPG9DkNIoQAYC/ZQxpoKTbgw+/Pi/qUEgyBqUeUo=;
        b=SCkYnmF7IlH5SIJHMeL6YrfpMMg7lVCiFmsjHbOqVkYhEEwduECyYSpF0nBx4GSAfm
         K1U4Dt0m+jCuiWwJYdGx1xINDm3J1W6wYDPeUG2NRgGCT55Oae2u/4FP8JbvPhgtVQv0
         JibZFKj56Dve51aa49jP7Gf/ahGTpz8xJkmJ5sd5EcOQcrsSlq+7iN4TPPc5xhzYBVHV
         QHluSLaHxORqhlg4A+yJAuBI7zguawPpS2Nv2lMie86zEUEDrG1PfuXY351FUf2d7IA8
         4FA9N21KFjfh83P/Zrn4kYRabJG/Z7ulealRK8VgPYBJ32BTquGVA2ZxJl8iIVqMaq4t
         Ov3A==
X-Gm-Message-State: AOJu0YxNqWiL2qE6ixVYCtHUQQKPPWfnlVR5aPpYI9lyNqPXnFPsJguE
	ZbR0CcCIrqldE1uEtr10xjspL147dbI+sQ1e/HvbMu7PONb8vLp6MaRJcI0ZQQhk8zKXU0N5z0V
	U8/+Er6vgfZH6XXVPvRc0SLHwggsh3hunEg76llQzor0h3yAn1bH9JgOD5o0PFVHQQrBz
X-Gm-Gg: ATEYQzxBoA5XmWMsGWWgfJv/n2dxqnTx0pLPzfNAHRwxMww68Mvw7vvXf1MNRAnHv1j
	dbRcSH3MPxUaYdv45lpwvqRfn10BIo3JaIdbJeOX6DyAg3+9ncH+/EApRImFiL/K5a8Jpg0kCRl
	CAZiu9C7hgDV+GUo4C7xZb2cQJw7OzG6LA1jtEJFwOWJACV7sL9BEd4HcSbbaIQQrh19R2SYxvo
	Y7X03sJYUmQCVnraXGsNETHoDQKxKox7IJ31knuvJeMKNpklZPBKt0CNujSyt/H5Sjs9aUzTplG
	9SeZbkgWPMyj2F5erIDLP02fH8hVUMrOCGEjBcUajiX/05/AL8ncwHss1UoyPuENG2fsJyjxvxp
	1Traohlb5yIpORgIfdAE64Zc3mtqCAWMjGg552incHuhrO4rDnLOeVlpQostsHRVopY8j9LJFTF
	JmyiFyxj7fG5Lo276n3wq78emOVdGFK/2liRE=
X-Received: by 2002:a05:6122:90b:b0:56a:fc35:9664 with SMTP id 71dfb90a1353d-56b47438bcfmr367666e0c.3.1773199400223;
        Tue, 10 Mar 2026 20:23:20 -0700 (PDT)
X-Received: by 2002:a05:6122:90b:b0:56a:fc35:9664 with SMTP id 71dfb90a1353d-56b47438bcfmr367657e0c.3.1773199399783;
        Tue, 10 Mar 2026 20:23:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ed41sm1422721fa.25.2026.03.10.20.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 20:23:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 05:22:55 +0200
Subject: [PATCH v2 01/25] drm/msm/mdss: correct UBWC programming sequences
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ubwc-rework-v2-1-69f718f2a1c9@oss.qualcomm.com>
References: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
In-Reply-To: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6916;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=uSnw+FGxAf1+lIyAZwtg2QGOswUDFmlVWOT07uiqNc4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsOAd1kg8HBo502twDi3RMzA/fa7vBmR7TiWDW
 tdDAL2OdBWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabDgHQAKCRCLPIo+Aiko
 1RfVB/wKZ1nWG1/vnjr7LfDjt7Y4o1OX2kv+6lepua9Tl2OeAtNUrdsR24baxlkBg1HBphtGhgl
 AZbi9JTmm1fmXcNXB6GJpqPY4anViI4CKqDfXujBKKoaqf/iFHrWWXJcsDZ7TRDBdsDdiBwibSQ
 f12jxT3pmItf60YWGOUU3keC3V2iPl2R3sumef0nCyMHQYjtPpNxRZ22GxuRtRnZ7wBjz0laAqD
 sjkgjumjo8Hw4BrDIQqRoCHz28u/WFUpRnx6ZULychiDnamOxLpZ+ZcF5Ybc7w4VtN5aa9qL1x8
 y2Q7++zY1H+5ivL+SOrG3t8HRg0bFRJR6V2EaSHqreIxFwpV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyNiBTYWx0ZWRfX31ekLkmlG33P
 PAuiU2yHhsyV/hmY5MBJ8ggoSKICQXJt0itmorDdNyR+HdayqWRkOnOXh2uWDvkWSfjqvj48tIq
 dpi6ug3C3gF6/3QrRI4gvyzezOc8XTobOs88pSG4OGsJUYeiNd9wsl9jRSwJS1c2N6H0ltYjPmY
 sZjGM3YoLcUe7Lu/GlpXJ+pEbwRm291lx9LDsFs+iB1qn5ms0YaQWokFCaKpWoAjWYTSrZBpYMX
 ZuAg1SSm4K9QzyBDpGl3w6ugbL6lZYY/hqWHoVoozKjWrGPV1+1RzPBJjerL+/tqhL63y8YXW/r
 uRLdZu25qglhbmqf4PrIpCQqnjQ6Ozw+n4ZUMzxEs5mLeJh5bv/NSlz0kwa5pZEadf+G+WyM7cx
 fALfwIjH6jaYrpUBG8kHLXV/44xzxFSjPVUoqtjxkBeLCDKEFGhfu5+evm4YVhXGjRjeTdZ3+bL
 HtGIqoK266NqrjH5YQQ==
X-Proofpoint-GUID: wJw-V6VhMEGqYOTqGvr90Bmc36Svq19O
X-Authority-Analysis: v=2.4 cv=S5vUAYsP c=1 sm=1 tr=0 ts=69b0e029 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=hQCg4X1xv2bm5S_WMKMA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: wJw-V6VhMEGqYOTqGvr90Bmc36Svq19O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110026
X-Rspamd-Queue-Id: 147B825B71C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96827-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The UBWC registers in the MDSS region are not dependent on the UBWC
version (it is an invalid assumption we inherited from the vendor SDE
driver). Instead they are dependent only on the MDSS core revision.

Rework UBWC programming to follow MDSS revision and to use required (aka
encoder) UBWC version instead of the ubwc_dec_version.

Fixes: d68db6069a8e ("drm/msm/mdss: convert UBWC setup to use match data")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 120 ++++++++++++++++-------------------------
 1 file changed, 45 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9047e8d9ee89..d8b0288f0040 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -166,27 +166,27 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 	return 0;
 }
 
-static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
+static void msm_mdss_4x_setup_ubwc(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
-	if (data->ubwc_bank_spread)
-		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
-
 	if (data->ubwc_enc_version == UBWC_1_0)
 		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
 
-static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
+static void msm_mdss_5x_setup_ubwc(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
+	if (data->ubwc_bank_spread)
+		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
+
 	if (data->macrotile_mode)
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
@@ -199,11 +199,12 @@ static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
 
-static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
+static void msm_mdss_6x_setup_ubwc(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
+	u32 ver, prediction_mode;
 
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
@@ -211,45 +212,42 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 	if (data->macrotile_mode)
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
-	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
-
-	if (data->ubwc_enc_version == UBWC_3_0) {
-		writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
-		writel_relaxed(0, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
-	} else {
-		if (data->ubwc_dec_version == UBWC_4_3)
-			writel_relaxed(3, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
-		else
-			writel_relaxed(2, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
-		writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
-	}
-}
-
-static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
-{
-	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
-		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
-
-	if (data->ubwc_bank_spread)
-		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
-
-	if (data->macrotile_mode)
-		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
+	if (data->ubwc_enc_version == UBWC_1_0)
+		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 
-	if (data->ubwc_dec_version == UBWC_6_0)
-		writel_relaxed(5, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	if (data->ubwc_enc_version < UBWC_4_0)
+		prediction_mode = 0;
 	else
-		writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
-
-	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
+		prediction_mode = 1;
+
+	if (data->ubwc_enc_version >= UBWC_6_0)
+		ver = 5;
+	else if (data->ubwc_enc_version >= UBWC_5_0)
+		ver = 4;
+	else if (data->ubwc_enc_version >= UBWC_4_3)
+		ver = 3;
+	else if (data->ubwc_enc_version >= UBWC_4_0)
+		ver = 2;
+	else if (data->ubwc_enc_version >= UBWC_3_0)
+		ver = 1;
+	else /* UBWC 1.0 and 2.0 */
+		ver = 0;
+
+	writel_relaxed(ver, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	writel_relaxed(prediction_mode, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
 }
 
+#define MDSS_HW_VER(major, minor, step)	\
+	((((major) & 0xf) << 28) |	\
+	 (((minor) & 0xfff) << 16) |	\
+	 ((step) & 0xffff))
+
 static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
 	int ret, i;
+	u32 hw_rev;
 
 	/*
 	 * Several components have AXI clocks that can only be turned on if
@@ -275,43 +273,15 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	if (msm_mdss->is_mdp5 || !msm_mdss->mdss_data)
 		return 0;
 
-	/*
-	 * ubwc config is part of the "mdss" region which is not accessible
-	 * from the rest of the driver. hardcode known configurations here
-	 *
-	 * Decoder version can be read from the UBWC_DEC_HW_VERSION reg,
-	 * UBWC_n and the rest of params comes from hw data.
-	 */
-	switch (msm_mdss->mdss_data->ubwc_dec_version) {
-	case 0: /* no UBWC */
-	case UBWC_1_0:
-		/* do nothing */
-		break;
-	case UBWC_2_0:
-		msm_mdss_setup_ubwc_dec_20(msm_mdss);
-		break;
-	case UBWC_3_0:
-		msm_mdss_setup_ubwc_dec_30(msm_mdss);
-		break;
-	case UBWC_4_0:
-	case UBWC_4_3:
-		msm_mdss_setup_ubwc_dec_40(msm_mdss);
-		break;
-	case UBWC_5_0:
-		msm_mdss_setup_ubwc_dec_50(msm_mdss);
-		break;
-	case UBWC_6_0:
-		msm_mdss_setup_ubwc_dec_50(msm_mdss);
-		break;
-	default:
-		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
-			msm_mdss->mdss_data->ubwc_dec_version);
-		dev_err(msm_mdss->dev, "HW_REV: 0x%x\n",
-			readl_relaxed(msm_mdss->mmio + REG_MDSS_HW_VERSION));
-		dev_err(msm_mdss->dev, "UBWC_DEC_HW_VERSION: 0x%x\n",
-			readl_relaxed(msm_mdss->mmio + REG_MDSS_UBWC_DEC_HW_VERSION));
-		break;
-	}
+	hw_rev = readl_relaxed(msm_mdss->mmio + REG_MDSS_HW_VERSION);
+
+	if (hw_rev >= MDSS_HW_VER(6, 0, 0))
+		msm_mdss_6x_setup_ubwc(msm_mdss);
+	else if (hw_rev >= MDSS_HW_VER(5, 0, 0))
+		msm_mdss_5x_setup_ubwc(msm_mdss);
+	else if (hw_rev >= MDSS_HW_VER(4, 0, 0))
+		msm_mdss_4x_setup_ubwc(msm_mdss);
+	/* else UBWC 1.0 or none, no params to program */
 
 	return ret;
 }

-- 
2.47.3


