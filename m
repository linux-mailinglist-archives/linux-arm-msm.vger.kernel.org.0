Return-Path: <linux-arm-msm+bounces-108790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IxtOhjNDWrh3QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:02:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE367590689
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:02:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 826793077A49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F3F3EFD03;
	Wed, 20 May 2026 14:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RQ0RXCA6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NOGy09X0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A093EF666
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288695; cv=none; b=CdPV/FK6fuSUyrn0dAc5cduD1y0Mkuqj9QI17zspq7D3RifnaXWWlSLL1ktc0lYTXLceow3rbmOpQRqJIKA0ZwX6ERUBGsaCBjK0GZG2e7n+idmnWPlIqotVnhp6tkHv2gGCh8tOV+4OeCZBfKXXRdJcWI6p2Fjw75NZItX/kow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288695; c=relaxed/simple;
	bh=0l58tGlCZ3KJhlnY7QHsm5XAPXWOlSpowmtYXNxh9w4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=io8I/YhSHHZ4tvufITq+d4yLK4ilLH2KXZHDH0ztE1WaFqlus/SpJ+1BvHOjWhuanLRe8Hi3BCKQxO86xnmUWjVfLq0sY0ZBjk2oKNQfnAMw+FF3VJjWVpmymEnnyUX+uNlpfUt5G58NZYpp2NWYtjjXLIaZo3wtxFnMOMoHMVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RQ0RXCA6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NOGy09X0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KDXvGf1798612
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FqMqhI5UYkOHH0CWlGEm+fCS4mKO20wPw4ekmFs5Kkg=; b=RQ0RXCA6PbqLb/Fx
	WlXE3RChKqir9pgSvrG+scBdVL8hkGPu0CC50TNpLGr/DBpoqynSgUZFbg+aMvi0
	QXPkHFX0XG8HfIVwE6D7S9XcOWl5PJDLC/KfJBhnR1KdXuG3XqhFlqBzuNoynnTE
	k3xdi7IqzPLBmi8AGkPQ7R4WRSXnVVqkMU5qU06QsTEZuMOg8iVkTbcZpACq8C7u
	0d8TI6OvnL6ihaWmfuidvY4ipsxbOrqAElF/JYfWvKqH/UGMaBFTaK9XEXudShLV
	mojhsnur7LO/riw0ls96Scu9R5hace9g8zjya3ZhVWzOsSWsWe/iaSZSKHi/kqEQ
	xV5bNw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu0a05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:34 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-57584c23424so13265583e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288693; x=1779893493; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FqMqhI5UYkOHH0CWlGEm+fCS4mKO20wPw4ekmFs5Kkg=;
        b=NOGy09X0IbHY6J+G6x54UBqlwQ31fiC5H1yrqrFT/7dtNypZpxrE53xbLE/b6P9CS/
         y0/S0LJLugNMmDf3JyCNLA6Hv8ZFKJ4Jx1Js3PBN1LcS5S/LJcnwcj6zPuBfIMbjl4DK
         hvNrgNOAcB7EnSc1Iq5/0Vuss623gOScIa6EBRf26KXREGrISmns+f2WJMU5xe+C6Tij
         bCmzStiW9PW6V0ljCIAoVawnXaioPVJVUlVBBgyHyIhMtPvamQxtmd56kB10wAEF5J9z
         Qb0AftYti0s/0W04K4feIS0L0wgfyzwL7FgsbXHlwftJIUJ8JCzqeNuoH8MzkRY5fGBT
         6nLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288693; x=1779893493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FqMqhI5UYkOHH0CWlGEm+fCS4mKO20wPw4ekmFs5Kkg=;
        b=spsjdjer4ofAy+MWdcpqfbGGpWFlMCbp9H49+YW0kTbCanLfwPVB2mMKO3MQFPCgpt
         EzuOFoSn+LYuMZxg6KG38XBL+FnBMVTE6LuVHs+z2iSmopz4Vrk7ky/8Qn1vvBMS3Rsm
         nW1aGpfLqdDtz9gzh9ImgSccZwPWRlFrL7H0XV7RW+oQre+gnkySMzZZdquORds9YR4t
         CUVn2uP1g2Mp5+fFrgVtZyqMtu6PXUhiobm4fljzKtGTm7JimyUxXt5SRF2V2pbApPwy
         63G9azdNSo5/ZqDshZ/PRc+D2hpul8J+9h+4iT8+6Prqo8u6tI2NNFSlSK19cTWzCM23
         LK+Q==
X-Gm-Message-State: AOJu0YxLqxvN1mq87423VxWF3xqM7X3IQ3uUfjuu3sa4qg8SOETPSiG3
	2bHF44ZVLly8/92/47UERvoTw6ZZYW2zt9dQvHMa+xT6IoxY87ZNZ9lD1SDFwsborbkAhkpYPhl
	muTkcwx684k1YHLlNceIFuWOxZOcfHwTK5Kx3jBqX+3ybfx1/lxCPY09sr3Tju5hFQI7y
X-Gm-Gg: Acq92OG4zWDBGMRFD0bvbAgM71wqoJHkWoLcX5F8/MsPB7HoQCzViEwjN7MjODLKnkH
	WZSxyHMTuIILko4sk4YRDm7jGILnOuArD3bOCofw19VXTOGgIksVla1SpNhuswYJ572yr9U0rFV
	4Mi5oJpxBieekA8y8LEWdLjIM3EM62f2GR0VS9C4/QSAfWJIayBnk8ZlbaDpHkm+RuGhlAwBMqs
	zAf9sRBMYbCSZ2GrGQdlFxd29dkwXj/6Wee4Q03ZIuAWQNiIl4p1Ot0UhPm3/ClU6YNIz6mjNIH
	LOATJibFMCDcM+APONcVCGdjt7WPy2DvAYWbL36z2m9ONATMiojvlXVnTeu/N76xYiCAeqiofu6
	d4ptVmaVF30UrmObu+ahq425BKAZ3FyOA0IiNhEIkFEzGIBAjxSsQ67bJeFjHTm/94IJqhGhHlM
	ZmaG8m0d2Wxo9ENYAmABRViElllK0OsnojZZY=
X-Received: by 2002:a05:6122:920:b0:574:6c7d:ff08 with SMTP id 71dfb90a1353d-5760bfb8c49mr14718739e0c.1.1779288692993;
        Wed, 20 May 2026 07:51:32 -0700 (PDT)
X-Received: by 2002:a05:6122:920:b0:574:6c7d:ff08 with SMTP id 71dfb90a1353d-5760bfb8c49mr14718621e0c.1.1779288691430;
        Wed, 20 May 2026 07:51:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c78csm5128907e87.14.2026.05.20.07.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:51:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:51:12 +0300
Subject: [PATCH v5 05/28] drm/msm/adreno: use qcom_ubwc_version_tag()
 helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ubwc-rework-v5-5-72f2749bc807@oss.qualcomm.com>
References: <20260520-ubwc-rework-v5-0-72f2749bc807@oss.qualcomm.com>
In-Reply-To: <20260520-ubwc-rework-v5-0-72f2749bc807@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1621;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0l58tGlCZ3KJhlnY7QHsm5XAPXWOlSpowmtYXNxh9w4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDcpm+jKgocPYblJFNAWl3I+e8kco9lDn6wZwP
 H6K0qUhOxGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCag3KZgAKCRCLPIo+Aiko
 1SVyCACsyXzB2/3qJ9oEITmYeNPQ8pb5ecPBHWIyxss0NLfSG09OY1LszIQJbDAOElFDIi0BwyD
 /2QUMiU12+O/Iw2EOSwJkLruPtrNxlZMEKphxlEu1/5bzoo1rmNODFavRQNjcPcrU5zpFxRY77e
 ZC/DSsA3U1I9i9apqLif4jP8eC6m1HSN7vGXcldD+7stgh5QIYZKorw0YuvMC01sZlm8DZeOCGp
 ZZxJvsnTYVv65cuV2132BRV4JL+tCnbvANSP0g4e/kXm9QCnUQFFQYLXCerDMvx5TbKmpiG0C0J
 /endi0aQSN7Ef5RAnGWawBPg9eSN5wzLSVZoVXyc6ZvO8bW7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NCBTYWx0ZWRfX48kky4UxnCBq
 366xOn2pBYFwcT7E9T3dp2lZRX28VT8SxGluwGCyMZcA6gx8JzbpsxtdzuIAQll9zGjqO6TePKE
 POnK7s6g1AmA/RmWFp9QzU7+2ZVorhGH/JzA+BsllWexbukvFGZXmBe2omaVEn3mt5wn4lqAxYI
 lcqSlLooiYA+qFXpTEG7cd0z4acZmmfr/f4e/5dsAGzDBh1D/bnvzYd5pJ0BUN6MmT7NDTIs9as
 EJ3Wg2dR2LeBtoz2Rgx1M0yNi585sASZ/XEBT+iHJpZrWsAsrVlZ0idmtur8iHvCq0Hdvg+eXkw
 Rrjudod1LBqz5vEyh1X4+Ifxuiaj6UoloAuLYfgAgBSg4093P+40F9UPYH625jwTIbvw7UAXUno
 F3IhGukl/gX+qYcQXvm78kiqm75EzNqtRepTJZpS+Dkk9tb4ZEe9Sw5JE9xS+j2sbS+7UWyjM2g
 ygN5WCzIv3PiEoCPL+g==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0dca76 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=xoTxleRWwXRO4XdZWWkA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: n35GlyyretxNA13yvAe-jt-V2CKG0Ya3
X-Proofpoint-ORIG-GUID: n35GlyyretxNA13yvAe-jt-V2CKG0Ya3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200144
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108790-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[16];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.5.7.0.0.1.0.0.e.5.1.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: CE367590689
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use new helper defined to program UBWC version to the hardware.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
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


