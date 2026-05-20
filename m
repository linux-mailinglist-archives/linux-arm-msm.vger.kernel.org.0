Return-Path: <linux-arm-msm+bounces-108793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJCkL4PPDWr53QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:13:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9B3590936
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:13:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C3A33148875
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB026308F15;
	Wed, 20 May 2026 14:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FhJ8HzQn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SQJNqii/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E62F3EFD14
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288698; cv=none; b=NI1x6sawuhFyjalw0htQCC/XwEPtRZN2OGoHJpilVEOgs3wFNZnnrAZpf/wqi7DqEGtiRac7EOg7tgexcQ2xX0k7lRBkUgr0W7dd+KqD9DeeLtaxTHMTiZhhC73q6JWLW32UbHRPJWqAa32UTWVgAbX2uFQN/Se/K+113fwxovc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288698; c=relaxed/simple;
	bh=HMBD+zQalz6ee/fp488Ht0p3cICpZxvH9sX4/PHcPpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s/L7rBaEDeq3kPzRYHl1Sr0IC2Ngh2HQPjMjB3x6tVc11m+Bw8Wp+G24A18N45tEB8RGDnoVCMu11U5m553pPeA51K8ozb8Jgw0ee5taVykt8aE+T1+1TX/aDI6TB3LFWyAA8eIdVFNPzDoXhImDR9BeQAXM97wVwad1TMnGjcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FhJ8HzQn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SQJNqii/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KE6dpb119201
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A6XloU2OeEBOoOyp9QPMtaZvH32CoTQEY7LmlmTrejM=; b=FhJ8HzQnAmcIwAuj
	1X0LwOcccEEvagGW8Y0MIp96vJFC9XUVXrG0J4iyjBa3jPJ+BWfKvPI61efvT07n
	dNq2DjOpK8TNHn1CBpbhA1yYjzlNgank1BGLxBtRqShKLlIOvJAXKOJM17tR1bvO
	XeZqqonj8U7PmQhoQkAE/s6vWeIO9nvB6jGL+SVeUG5kAAD9TKXmXmmw4uOx3Gw1
	TiIQGr2sg/xpjf6NJopd/7BCD8JdsnipHX7AI38E6lCyXhU6+EzL0C6HMyn8SnVo
	56Lxh9xsgwc+Rc5Jc2EZUIVZLCdcrw2dXWOzlGjwkweHBDyu5fWuPwVMbxsM5wAS
	SGQBAA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee886ea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:36 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6322654bb6eso8493684137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288696; x=1779893496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A6XloU2OeEBOoOyp9QPMtaZvH32CoTQEY7LmlmTrejM=;
        b=SQJNqii/2yAp+Mq1OZ3BmBGamhHVKfx41f5P2Aih8+3NvC6+OhH93bpIbsKPWYWA5l
         HZv1f+wwe7qr551Mf6TRO6BjzGapKe/5Fh1xf7KIFziC3zb/3p2z0GjiDQW+vg/qjhOq
         L7dvrHhw6/33debtb1ov/KECR0njyCC+OrIM2hNz5t+IKPMuYaG0Fd+oVzLCcUFf+9BV
         pGmTfNjOk4hdI8Gfced3F4eCYs45FplnPQUxDYjkiBsX8RC1+FIMoV3oxZA5hugSgVm2
         85jscq1G2BMPa8s5qAX79B8DgHr9QRVgwRW3mOCulShHjFByS1EYkxxIfAlDIvA3vU0o
         tUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288696; x=1779893496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A6XloU2OeEBOoOyp9QPMtaZvH32CoTQEY7LmlmTrejM=;
        b=qwYUbNlEEBr4W8zJmKLG2q63BAq18vCZYhnQxjzQ7wbSCMCSqh5iSBtuQPKDnSaaM2
         Sjn1IGHQ13wFpPf0hiekm+dhrK2kpBNyt8I2YK/j6K5EtGqlhi+fV4uHOPKXceTx7tge
         +598yGGKViSDqbzQKANaSmVhCw1HcLWiSDjdhSN4c2sR7evvisZ8/wTjZAHv9r8QCY17
         3kxsiNtvDK6sbVNqjrXzJS3HtwaFbgK5EkEHjFJCiwo6OrV3lYeGGMNumboluzgIf8gE
         MaY93mUVd/BBORMdDf4eRlLaqxMRSHV7eqluxAeyT0dFXdnmwfK6uYexNmEgncAOBjYS
         ukRw==
X-Gm-Message-State: AOJu0YwCilY9H+jh4qok/oXEaVO8SRFgaxE19N6bRU7+OE0jxeAU9OPN
	OQGVuINKAzjNDNBa+ack60ZIdXwSOGe3H1V6SKC41B2RsEqaHaL+h090VFP8a14MtI/gnoM6PB7
	aA9TdA49ENzurkgLGEvEFQMVHfLeutgQEW53Sw81RUm0zkw5vC4EyitW75LqQsgL0AtwO
X-Gm-Gg: Acq92OEH+FjgYO/5tKJ7INFQgRprjsgbf6+JK6hubcVIiUTr4yjJcOLhB3Qj9GJErBH
	NZ9ENIvz8uIMM85wtEPMncgrie082L96K4JfOcC4Izydq5nOnoqeplLBvp2l5YV38/1RnmilQsO
	7u+w11jRVT1f7cHPmtRKH3i7yjH7dmW8fJ2UdTz3WxPrdYZeOv1nCdkQ4ZasfqMPEMY1og07cTV
	ScA4kyf+KJr4hqg9EX0aojsQairuBaYKIM/AyZ/g1e6hcvZKOJHUcYaEjGO4XagPYbzPZfUCYG4
	cFz3igiZ8+8SwmOaBJW7f6yEZ8t+3+ck6qQZWiKwMbtelgwgHpLwzcMKWuJp7bY1zQtFwdTAiW/
	Ie9GihGFvh+DZueJhyZnu47Aepic7aYSvdXyHy3PeAlyQUlamhsAiR8crAGVWRXLFYUmFM/Pgu7
	J5xe5twovHx7iHsmgU/JFylw29D/3Gp3abITQ=
X-Received: by 2002:a05:6102:5e88:b0:633:c6c4:b32c with SMTP id ada2fe7eead31-63a3ee7d510mr14583180137.15.1779288695883;
        Wed, 20 May 2026 07:51:35 -0700 (PDT)
X-Received: by 2002:a05:6102:5e88:b0:633:c6c4:b32c with SMTP id ada2fe7eead31-63a3ee7d510mr14583149137.15.1779288695410;
        Wed, 20 May 2026 07:51:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c78csm5128907e87.14.2026.05.20.07.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:51:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:51:14 +0300
Subject: [PATCH v5 07/28] drm/msm/adreno: use new helper to set min_acc
 length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ubwc-rework-v5-7-72f2749bc807@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1349;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HMBD+zQalz6ee/fp488Ht0p3cICpZxvH9sX4/PHcPpY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDcpmOk/QDc5BszdG1Cy99moG6bYTjHAju/kgl
 KoHccTJntGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCag3KZgAKCRCLPIo+Aiko
 1c9hCACEfZlXYi2usBJHOpyfQdxGSG3YqIcwolWkdRupnez7HJd274TK42And+zpnTeQnr3PQks
 k+vKaiv+L87o3ehRk5twOG1CwhoT4KKxBtLcRYe+NIkoWLbmXLitdUAAZT2Ov0ZP6FzldJ7mWbm
 +PCia4irpP2/x9BYaDdojgVOnN6qqBaHpr1FXZZcL64XuMTQxnzJTOz6igCPSnO1FbqfcBSN3C0
 1t/PZ1jYQi0iWwwB1s0A8ucn09FfC7oZNWOjK39LcjywIJR74fXo1dEBFgweJFcZulVjnaJPHbQ
 zybs44gIetawaIcy9Vfch1k023ifY5o2j2Ud0rFy67445cJ3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: iXIocaCO2gaK2GFA0Qkbk7Wtt-VUVbUe
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0dca78 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=X-e67srwgh_QgMMAbO4A:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NCBTYWx0ZWRfX2tW8o5l/wRGc
 W0dEDjXoBuwpn4jx+PUnHZo72hSWPOVPNpB0yU88twANWkYZU/o7fNnG175LOR+nNpCLyIghBVR
 FmE1ySQfBcy5QrxJAqm4zj4QJQj/ldk70VNAgeGOJHZv5imOcjcsYn9lj+wNlb5W0Ye3tRnqTjJ
 xzxh5YIAyakIrC178JbJdibejr4OX5BYLsdM/WcJPWzado1BEGzyjh5OrF7ijOF7sDeacKFWNRF
 qONeK82ulHUUNIbr/ZcMliTSAYP5DCIBOpU/Z99gVINK9q0IBRva041B90MiiuYblgGgYaOYbvz
 U2eN4l1PdjM2Oa1t8QjsIIZzkWmtP6ZLIEny8yUD7BTv0eM+ISwZkCQ5UjHF6YVXHBkpK1wzdr+
 ZH+vJE1wUh1Oey5nYS/KRNifvUZd0E45+9PMMCbnGjF/tHXLybo6gKej1nK29yR1Om+eiuugNs3
 lJ1KmQ6eEu2jNtP5cqw==
X-Proofpoint-GUID: iXIocaCO2gaK2GFA0Qkbk7Wtt-VUVbUe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200144
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108793-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3C9B3590936
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use freshly defined helper instead of hardcoding the checks in the
driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 90e814c64c6e..45c966610511 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -748,7 +748,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
-	bool min_acc_len_64b = false;
+	bool min_acc_len_64b;
 	u8 uavflagprd_inv = 0;
 	u32 hbb_hi = hbb >> 2;
 	u32 hbb_lo = hbb & 3;
@@ -756,8 +756,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	if (adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu))
 		uavflagprd_inv = 2;
 
-	if (adreno_is_a610(adreno_gpu) || adreno_is_a702(adreno_gpu))
-		min_acc_len_64b = true;
+	min_acc_len_64b = qcom_ubwc_min_acc_length_64b(cfg);
 
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
 		  level2_swizzling_dis << 12 |

-- 
2.47.3


