Return-Path: <linux-arm-msm+bounces-106361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIIlBA6O/GlhRQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:05:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3C54E8DF4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5DB0A3004DED
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85DDD3F9F58;
	Thu,  7 May 2026 13:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IDWHqlYf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PlMyspJ4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C943F7ABA
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159008; cv=none; b=T2vL1Hjke7OFkd1OuVn2p/VdeQegcHipMGE1at0BYOGahZYkbtH1JiC3ZP2ljen7JU7S+jWCehlfKpdrGe6n00qDjHK9RLU52ceWjgzMPlAyFIAArbcffb4XT9esNIrLK/NcW7Cv3mJFjTrJAZ2hlka2q3E7f2TSRk0tSS0rFu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159008; c=relaxed/simple;
	bh=taU2aKAGQBJ6W2MyCZ4bOSBa16fxBG0Rs7Rtqck5Xao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A9v6ik1Tq5thO38ENezjEjc3LYeIPbQ+TN13fnWCLgwsGnDGilBFi63SgK3u/WWv7PqrnhAFRQLeE1uhaZhGGRq85Xy0Zv8kfJ44fYSznZp1/O4p8Noh0n2n/8i3cmF0JYe28q2+oLuVn3Yxhs2LN5KAYtIl93I6EurOGLvR19Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IDWHqlYf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PlMyspJ4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647AOmDp879574
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lRizh296idxaeGEPnbWh+8suGLFulwB7M6vVue2aYVg=; b=IDWHqlYf2XmYUPKH
	sJFnDRMRH16Gy9+uC1UG2Y+xpZdJqptWtvg1/qU2c6wgK9s9MI+kkz82w1JdKCQR
	EqVlj3h4fFuOzP7dHm0g/H7DmcMowDcqYzcifr8X1LUfIlkaoKHLrLkXripbQrlr
	iBt1Xnnu+vzdGMVz1VR6MZEnxY3GuHLpqjtjL/BR9plCElaGsouWS7EAhBdPmphi
	tnx2SPEZflzC3qRSSlZXpvcZf3HLd7t6+KRbBhR6Gskl+Ge8D9ulBE+36TZRe7+d
	jXYYNDf/7/SS28Pw5EDlWQK4gR3PO2uAxtF6ugcA2YIQa+Yy1MOEchO4tqe68UnW
	O48HFA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kdq1v98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:03:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b9b8137828so9508665ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159005; x=1778763805; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lRizh296idxaeGEPnbWh+8suGLFulwB7M6vVue2aYVg=;
        b=PlMyspJ4ALCUaJ3PVGznYaSxW+bF1RBhLeAYqkofL2/Jmg5k2EhEg8wQ4fSZbi2O4K
         SJS9M6QoXwLHwfceLM/iH+KTNifZGCNpY79S1wbhNHbScOmaPQScvFPra350ekCedRrC
         J98O8LC6lxXQyTTaFKC/fuhkUVLUh4Dx5rAE7BmP2zv5znUISGuqsfvLqgkvFffwUfZ7
         5yZO4pmjjJbF2aduC7/qljguD2LWym49rMQ6Q2UW5IEBsiQdKo3ESNcYArYK6xEqN8Z5
         PHm4bbqu8g20H9xI2qb2fJVvxMkexBFwhEAJ2UA8i4UFbmYZVKFApbCUF4uS1mQrKCM2
         jwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159005; x=1778763805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lRizh296idxaeGEPnbWh+8suGLFulwB7M6vVue2aYVg=;
        b=Vgf0jj6DwSXlH0Fyi2SkLGTBxfPeeLcqGiGmV0V+htEBaB+1+raNbnCBFLbbURTi2e
         KIbQwN5nHpgvq2t9HLv4inrxnnuKVRHmI4IlErH8fFzPNTwL5sHzz151zEXahqkbQCCo
         sMa6zdBHfnOXeQnAZwZQeTmggIs0kwR0SgcA0ZLux5VqvTxTtqxtZuk5JseNQCIXvDRV
         muC2FLpTbxWUoA2Egx1XE9JOT+1zXAPxiz6dbx/cHohsI67h6PT5EmdDAnV6BD7pJk0N
         SvUJZ5fIR5aR5pYk1P5aBvSXN7sjCkmBLuudVtrVeErH5fSu08uyVHVZXVd6/UahGShB
         PmfA==
X-Gm-Message-State: AOJu0Yyu6hE4ebckUSMYZxJldO+GTafHpk2KNXn0lDLgqa0Hf2uWcWxo
	LWv9ZHqIpdP2zXcx6gl14XvYq/tR8Ihy4RIlY0aQJ6ADphr142zy7qAQO/bf1UkrutXo0M9rhme
	hi6cTqyDr7/7qOW1lGOIzwW3GsN7N1ionSuqmWL1wmWhgqKWw+tN9gCt3gM2UjJ6iR1YP
X-Gm-Gg: AeBDievVuYV1ih9R5nfXIxaB3aRbciWLy+wsKTD4t5Z5J8VaSeMH6fxjvxDGIjE9Llg
	C30fABJJRcbZkHrxgcsOKyKTEcvVXNZhYPvfgFUVYTmTgKN7+V/x15Xsu25Wfw5AKyN7c80USm3
	LuT/CN2vPvIBZcyp2S4EPN6q7ucm5J2LVxClMPNSlHF/QgHN99tNx1cnZQxKe9DclK5Poz6WgJd
	1MG/Odp4Yve3wK8ns4xI4wtNvU6itk3BQAH4tH2dqKNYqThODDpdTQ91ZZj54vobXfByNwHdypr
	cx2SpUPHiFGgamoXibMeNWHLafTPefD9z40t5j7SE32qSk6Q5jJeAOqafspYpr1nASTsMwGRIpC
	xt6w2u+tfbxxF5hqNDQV9ZWc5GgZPZ4l+8sXTesEWHtEeS+RbJRpEO6c5p2zd8eVMuyI3KxEuVH
	HRcxCs7G8npnsFk8RZgup6El/KBxuuzXG/PF+ZvlmuLOsEDg==
X-Received: by 2002:a17:902:e790:b0:2ba:bfc:76b5 with SMTP id d9443c01a7336-2ba78b40166mr83458865ad.4.1778159004441;
        Thu, 07 May 2026 06:03:24 -0700 (PDT)
X-Received: by 2002:a17:902:e790:b0:2ba:bfc:76b5 with SMTP id d9443c01a7336-2ba78b40166mr83457155ad.4.1778159003317;
        Thu, 07 May 2026 06:03:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230c68sm5595959e87.19.2026.05.07.06.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:03:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 16:03:02 +0300
Subject: [PATCH v4 06/29] drm/msm/adreno: use qcom_ubwc_version_tag()
 helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ubwc-rework-v4-6-c19593d20c1d@oss.qualcomm.com>
References: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
In-Reply-To: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1565;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=taU2aKAGQBJ6W2MyCZ4bOSBa16fxBG0Rs7Rtqck5Xao=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/I2EnmzZQ9Ysoo2V1PXmrQNKg0nbhsvvYayiU
 vxiP7NzJRaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafyNhAAKCRCLPIo+Aiko
 1RrhCACrPvBm62tRCkk7HoECYx2MJcGTM/IlTReOG3sDeHdoUQnzfkbAVF9yYO6JRXa9vF998pC
 y6+lGq0kFFtPSew2q9ggzIKfHpWgA9NviJ0EGGsjADx9A0ZJs4Dq8JBoQOQxaYPS3j3G6YClaE7
 lifQEGGfy3UiQjT/Gvv22N2JECkALgXBGCvISbjfjKQ/AECXgCFeumjCcmmQxQ3OkWHqhO+2wVn
 C2UbpoNLvCUB9qwPF+jiOIzA+DuZBuZQZfGDlHvnMy6IWi7rYe+ptPm62Zh1Ioye/RfosCi8zo+
 h4FMml3CgoBS1upR4DTxUoBeK74mZUbwHGVjlig621jDhjYe
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=P6IKQCAu c=1 sm=1 tr=0 ts=69fc8d9d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=xoTxleRWwXRO4XdZWWkA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: hPKMBFD2B3N79EqA-5Y65gK37rLoAd5S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfXwGKUGZ58bupK
 3FtexPmCjnATwjMBvZBW76XUagpl5oMHY47JCjP0rJewp9OzuJW4ZUovBJ3TqDB5ByKLosY7qRS
 QLqtv3rQTR6TNA8v8iJS/Q43Nji3ZbEiPn/VtU8ZmWu5qaHZxqiAKyiRz3HJXJzJbPyuPxK1JUZ
 wRgNgaXkWtpg9Hx0+dYC+AKDjF0eVk7jTL7fctfzyVHyMn+alNlPTANrJkvbFCS7kDCYgIpYKek
 EoAHyqgcOa/E8ai2Zybw48FoYUgXgiEN3MtpsYjxxzGP0HO9FV6GfzuWXlI2T8J+bRvHYv3J2ZQ
 bH2P7Wat9hawD5qPD983+BdQgfACmMbFvDf+7tWFCnjcv/jXQJ+jEEvPDIRXHL84lF2HaPqI1lj
 TIusu0cv5wogaG3IvWQQHnd9DVF1Cgk+TSAsimth4LZByrGADIQo4HEKQnidyeIfALbbrSP9loA
 P/MdPCfK7/BhjoELXvA==
X-Proofpoint-GUID: hPKMBFD2B3N79EqA-5Y65gK37rLoAd5S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070130
X-Rspamd-Queue-Id: DF3C54E8DF4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106361-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Use new helper defined to program UBWC version to the hardware.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index ccfccc45133f..1923f904d37d 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -282,35 +282,33 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 	bool rgb565_predicator = false, amsbc = false;
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	u32 ubwc_version = cfg->ubwc_enc_version;
-	u32 hbb, hbb_hi, hbb_lo, mode = 1;
+	u32 hbb, hbb_hi, hbb_lo, mode;
 	u8 uavflagprd_inv = 2;
 
 	switch (ubwc_version) {
 	case UBWC_6_0:
 		yuvnotcomptofc = true;
-		mode = 5;
 		break;
 	case UBWC_5_0:
 		amsbc = true;
 		rgb565_predicator = true;
-		mode = 4;
 		break;
 	case UBWC_4_0:
 		amsbc = true;
 		rgb565_predicator = true;
 		fp16compoptdis = true;
 		rgba8888_lossless = true;
-		mode = 2;
 		break;
 	case UBWC_3_0:
 		amsbc = true;
-		mode = 1;
 		break;
 	default:
 		dev_err(&gpu->pdev->dev, "Unknown UBWC version: 0x%x\n", ubwc_version);
 		break;
 	}
 
+	mode = qcom_ubwc_version_tag(cfg);
+
 	/*
 	 * We subtract 13 from the highest bank bit (13 is the minimum value
 	 * allowed by hw) and write the lowest two bits of the remaining value

-- 
2.47.3


