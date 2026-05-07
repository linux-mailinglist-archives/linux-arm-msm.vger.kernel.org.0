Return-Path: <linux-arm-msm+bounces-106368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NcyCfWP/GlhRQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:13:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 846B44E9022
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:13:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A45430B3EE9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA899401490;
	Thu,  7 May 2026 13:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DyY7RbIx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WUODNGe2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7329C3F54B6
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159029; cv=none; b=nCFgYk620vNVEhDD2Bh5JGh9E665h5C3B4Es4L3l11xIzjPl4O4cLMFMiZFSa16lg3xmcDGBh497rFHwUcx11da/czin8Oy0DRsBT/UXSYYzmEq8bo+7go4xkYz8b11zj9qskL4qXw/PnpMgPt3PwTDzd/JIFoDfy6k7HXm3lRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159029; c=relaxed/simple;
	bh=VltiGEFHSGgs78MqO7UweBRuc9YVg0/om0I7X8C3TaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TN4D6Ucrp61RaF6kAznm8brfbwdPCFWPbZZibMYes/TT77prgOSvVOYcnGC66LRC7MsOch5NjYDfYl7AO6gA0vKsIb3a9k6lqsmwS50/1vImNUcuS9RZCU6ctPVL8k/10HUuiy4TfcWp/QqaJxdegtvNU9rESMmZ+wusdEyMZD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DyY7RbIx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WUODNGe2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647Bpa8D3156914
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3nTcAznbkZwTer2iw0uNN35IcgnJNjhKf/8GRJBkZC0=; b=DyY7RbIxYbh2nKpE
	1rEJbK7ZVNnnGsdLVtRsw2zvaK0rN1UVf2GBwUpYZ7AVWbu95KZvGtxjTHbMV4wP
	zInpeE7EmCtqaJF4/nL+4cGgTMl0fctLHCDijY/aMdmD/uH+J2O3zwNRTnJAxSiV
	eIIyzR+ophxkDUUTvLS6Njzk3+hG/DkZIjSPeu2aUsvgiLksKPVBaswmf4tb7Tad
	emvLwa/xazkFGhiZ5smlt8fSBV13PFVKTrR7KaCpc0aSTPuRFEgP2e5F8bcTWGI8
	+oHLpLLamra1O6yaRiDw/7aehgTfTzBq09UqNIvBcPSMyOAuKKXctnA8qWcJUEek
	lelZBw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhf1n2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:03:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2eba42b8dso10616655ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159026; x=1778763826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3nTcAznbkZwTer2iw0uNN35IcgnJNjhKf/8GRJBkZC0=;
        b=WUODNGe2TkvYTM/62FNzlcxQH9K/dSF2gGF8JVut1q+Buwren7GL6Drt10nhor+N/a
         zVQCXKpyf722OE3Z/trqHEIeyzkaiwwddu/XefjYzEhaaljX91Z4TqBowKff6JntYIKb
         X5HXFpmr2j7mu0dp8P0S8/SxvQHBiXsDh3GbJDUFTQZ5BuMY0Uwr3PGT5vwl2kVrBzym
         gmw7LaM07hMukNzFtZGM0rys6h6EA4UVhfUrTR7d8PHEYS5Z49OKqxGAVaklO2gUf9eP
         KKWxA72arfzXtlublit7wQUl9Hn96GQkvStbPdQ2stHzADX7PYQuMzcyt5PmfnqozLRs
         TbAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159026; x=1778763826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3nTcAznbkZwTer2iw0uNN35IcgnJNjhKf/8GRJBkZC0=;
        b=RGLdnEnfiStZo4zfz8eOd498oCDekR2sQSB9RBwDsyRT2vh5i8T8jQSf7+OXLrF8Q4
         4A4JFPiaiWsYmqyj5h/b/eVGvbowY7uPGmI9GYfBwLQB7/sjiUSvk/ZE6loM0bKz0Wd4
         w/+LPtMnNL/ObGWT1itHPBNtuZVrLHaxeC1V+idiYKq2B9aXOEmvBcM4+mJeIHM1nbDS
         8/YMvo1pH3ElYutGNmeStVXtwZCIu6YYGSWAgESaWJxlKbBajsJaXXTQojqGbzW8LEHw
         v+3UehNMsiiG6pDCF6AVpSWYPk98o1A0Wjxi257xDv3VtGvHnB7G6ZIryzpA33kSedJ2
         SQ1Q==
X-Gm-Message-State: AOJu0Yx/ChOtjobwyF28lgegz/qYPB0+7SjbqplWA1ZUogLPdm4an2H0
	NssqycV9REORSmP916Ryx7o4wNvkCaNEnjdV7V9KZT8blAPi0XzGVagkblqrjdpwPFbpH+AdXul
	QpPuUmK/R7IDmsayJR3vnZaBHqPVJJjzLfxhbZjGQH4yCETyG/17nqghnwuLaOHr5ly5n
X-Gm-Gg: AeBDiesUddiimf0Vzjxg8IyLkqLT15jkRqBeCEIRCmPcmU5BcR7vEDeW1XPz/uYwfYs
	Nz4Xnn8cYjOqb2QWWGoK7pBTApIXjBCWrRqaTxw6Vuxhk328u0OGiQLmCBvHfVT9AxOvNuTMvsH
	O9+zpuebnSrz9r1hVCiziGV8wwxg1o4XyIFdLfiMmVQIm20lbD2y7zWraqhMVYnu1znMT/EqVlp
	9jCkoCeQ+P6mNu6lCQjvqTaWpfhXUZwGNHfYn2WUqfaSKfQJHCG/vaHlv60UBiaDTbpcLSNC0AO
	ZhCgVcbhek2Guin6h1YmD6F+8rerEC8Y9LaYIQrnRYR2bvEZRLsb/Tzz+vb1m0Nj+glPoclMxVh
	5IdiKvNBV4ayzS57q/aogpavFmlZIczQpJx83RhyKS5JyQFLKt5pMjK1q3wLgFcI7rtyohtxWR6
	n8XlNP1yOqlYHmtAaGGPhuweKS4OsNz05Yhv5Y/ijw9Xx/DXLs5IcSHubl
X-Received: by 2002:a17:903:280b:b0:2b4:65ab:57cd with SMTP id d9443c01a7336-2ba7a362979mr53135095ad.36.1778159026169;
        Thu, 07 May 2026 06:03:46 -0700 (PDT)
X-Received: by 2002:a17:903:280b:b0:2b4:65ab:57cd with SMTP id d9443c01a7336-2ba7a362979mr53134665ad.36.1778159025532;
        Thu, 07 May 2026 06:03:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230c68sm5595959e87.19.2026.05.07.06.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:03:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 16:03:09 +0300
Subject: [PATCH v4 13/29] drm/msm/adreno: use new helper to set
 ubwc_swizzle
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ubwc-rework-v4-13-c19593d20c1d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2707;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VltiGEFHSGgs78MqO7UweBRuc9YVg0/om0I7X8C3TaQ=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+af3rZsu4rUyXLJG02kbPTsLHrFWO7fvKnQ+tj4isFeM
 ydtldudjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZiIzzf2/yVrytOEbq0LWiVV
 /u/1R7PPS5dsymAIZ2SNeRUZ4bTk9JUrKS1Xn4ZO1Av7tr7UNPG//a7sR5eW7/nqcDWqc21X2q3
 Vmd+kHLqlTCr4DlWx6rq+651TdIA/oSdM26DIv+XVv3X9bhnuh1JvLZiZ/uqAXGaOtWvJzxvnep
 Yo9j8q2ryH+/5+2UfXd/5j8FL5tcFi/fYCTsHJLMdMnDh41HeuDc0+k7n2d1F9QMAZZf0nmb/++
 s673FgZYX1TMHeTRq/L8xstcZvCf9zjM8qQUdi9wzVe8JX/ySLPXZ8mMGVJCNRzzJphuDR63/RI
 CwPn6aEZahJq05TCDQsdo6T2Wfecip6W/SPU5InnxeQoAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfX9uMOlIhxFxvA
 PO+WfUkljrGC69TgQYc4UR8y0eQOTPDKpuSJSt7HXcKS+l0bqRI8WRwkpOlw7I0ijn3v7fAahcI
 NE5qknRXFEYK3oMre4eMhwBPqaxFZtCnTqlLRN5lSQ29SFDgYLfXVcMWzVtlrnZC2zI4aUSTgAc
 JbJaIUzXheAgb8a4jbRQ74ma9U5tU/l5p3vvcWv4PpmM04XMtUU+PbL+bfTCesKFHZ2/ZGULclw
 wsvfusm9gYdAwTlQU8qHPFxPpojYtwi/nzBLlW/qnxIjcYyEDc8/GT3M5ta+ox8IMafx0GDm6Ol
 cXVyjCP375Id+UuQE+e79QX4Ngfd3DKmfphr10lRnAXtSLJF06XoJav0MqDkFeP35lwjLce16vy
 f/7R66nNvzx9cyiTLtSiP9XoDb0pNsOgylGMMreIEwpM4RwTHj+rGCfQoWHXfiSpHJsNwmhKuqO
 H+ib1gFqlvXn4iiCofg==
X-Proofpoint-ORIG-GUID: fH3HEyt8yBwAJilMGwZ-HghaHvUSytRY
X-Authority-Analysis: v=2.4 cv=SuagLvO0 c=1 sm=1 tr=0 ts=69fc8db3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=yqhp3bNzI1c8ER7VfgcA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: fH3HEyt8yBwAJilMGwZ-HghaHvUSytRY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070130
X-Rspamd-Queue-Id: 846B44E9022
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106368-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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

Use freshly defined helper instead of using the raw value from the
database.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 2 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c   | 4 ++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 76c681614416..5c17565b0499 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -745,7 +745,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	BUG_ON(cfg->highest_bank_bit < 13);
 	u32 hbb = cfg->highest_bank_bit - 13;
 	bool rgb565_predicator = cfg->ubwc_enc_version >= UBWC_4_0;
-	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
+	u32 level2_swizzling_dis = !(qcom_ubwc_swizzle(cfg) & UBWC_SWIZZLE_ENABLE_LVL2);
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
 	bool min_acc_len_64b;
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 1923f904d37d..53def136e0fc 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -275,8 +275,8 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	const struct qcom_ubwc_cfg_data *cfg = adreno_gpu->ubwc_config;
-	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
-	u32 level3_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL3);
+	u32 level2_swizzling_dis = !(qcom_ubwc_swizzle(cfg) & UBWC_SWIZZLE_ENABLE_LVL2);
+	u32 level3_swizzling_dis = !(qcom_ubwc_swizzle(cfg) & UBWC_SWIZZLE_ENABLE_LVL3);
 	bool rgba8888_lossless = false, fp16compoptdis = false;
 	bool yuvnotcomptofc = false, min_acc_len_64b = false;
 	bool rgb565_predicator = false, amsbc = false;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index bf1572156b0b..d26985c88115 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -430,7 +430,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = adreno_gpu->has_ray_tracing;
 		return 0;
 	case MSM_PARAM_UBWC_SWIZZLE:
-		*value = adreno_gpu->ubwc_config->ubwc_swizzle;
+		*value = qcom_ubwc_swizzle(adreno_gpu->ubwc_config);
 		return 0;
 	case MSM_PARAM_MACROTILE_MODE:
 		*value = qcom_ubwc_macrotile_mode(adreno_gpu->ubwc_config);

-- 
2.47.3


