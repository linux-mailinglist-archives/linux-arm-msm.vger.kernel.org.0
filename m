Return-Path: <linux-arm-msm+bounces-97225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEfdOSnAsmmvPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:31:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C44272A30
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:31:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C11983020EDF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527093C73C0;
	Thu, 12 Mar 2026 13:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mgZcgscQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hzzY1X9G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88413C8717
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322184; cv=none; b=FpsoDzue1LBHwyJMuLAFQETcZHHRwrVcKTgVxnvo5jamhHEf3V+u2utnvUvAmj2oQ5hw91I9aqDuUaQD0DUfVxONgpRDOWLtww0JWESodSDTxJ0LnoFlDTFWmocSgp8jaD2VH95EIyFyiKhz/gSWnQg6lhsSwmQQpFdbt2zcEeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322184; c=relaxed/simple;
	bh=gndBRl4Z4xRh4kFQivFGZ2SUW+Ocdg1Tl9bo+8948vQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b/IiLY4f//Yw0IH6JjNdY1HxdAeS3Cd3aFn7BLhz8NWezdN74sQgnglvlzx6retKh6UMGJBXu6hJVEY5nK6ZloOgjlpMj+tfwRX2n1v2GC6QxjSZ+GK+zDcYk/nOiPx57xyXbF7LH/6NpyxZp2HVUxwCVxIQYSm1zfMx6tTAvB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mgZcgscQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hzzY1X9G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CA3jK8263571
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wdo2GXNLuey4il0IRDIYFRsck7+hcgeJ1IZK0URwteg=; b=mgZcgscQ02PjXWUx
	xdt+c8cv9/ydhBJ1TAhJl7H6Iy5889y0cZ6zTCSYz5+vH1/TNSIbXhSBF5Dr5jQc
	uETYOU8W5ZqwnFL2wh2KC7mIGTcSTWGMZHfXnPJE3LM/WAWKzY6e8ohXc4qeTzbk
	KnXaZEjeWeWWkvBRsqz0BUrep+IQqGY1kTIsgkVsGETOPuq52poNGWNi976EJ26k
	a9D1fEWv0DQAYl6Kvv8V7GUfvZUNbkyhK2iTyVeANyix5Nib2DV4jaGFpgswy/bI
	zBtVEjG6kldLfN700lIP6rJ7IqY7S+Wi0a1aQlZWVq0CocKTgBD46N8tNatpkwpv
	e0387g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4yj63k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd820c6a4fso887809885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773322181; x=1773926981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wdo2GXNLuey4il0IRDIYFRsck7+hcgeJ1IZK0URwteg=;
        b=hzzY1X9GHEC/Ym+s+8IosddfzCjAyCv/ssmAgR8a2hDJZfsKwBapjB7ZmPM7xdPU0d
         OpwVkIKEmo0EoTQLcI09XDv6YpW6RuV/delTuR7qFaYO5Q5VL1VeMf9FG/XLkhXBTwB9
         pX/bjA1jiGDwSQCd/4JthIMBznbsHP/rZUq0ftjmkaz1AwbkbBpQwXjsln6qqytGF/G+
         KIbCpN07+SxBypHLLKwkuha2kob2KWCzt7qQ+JI06Z1d5MBdWXY7BgqV2rdous3nk9Ti
         7RXeF0xJR38cV8uKwG+qPupbnh0l8/LyyL5kfaGJsp3O4O7+wEExRZcfklb4/Pz8Lf+8
         Vomg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322181; x=1773926981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wdo2GXNLuey4il0IRDIYFRsck7+hcgeJ1IZK0URwteg=;
        b=nNH6KpwBMsi4kk9hVYnAw8rnSoLXzwwaHH1cbx2jtKxSNYNnXztjG9K8p2Kg5kSO8j
         CfRET/2MmIiUfvQWKCMqcnUDzR1Rl5aVMcjiBPGZ3mfJrOxOgb0Enbz5XK7Lxvuvq28X
         f/GOhUNkGJJpdEcFPYoEXqV9096BWdwOPKeF4a345ZzwnXwZ6JdYx6bii6Srl1yLwrwx
         6aYSNhx0PlIz6YJfqkpKFalLAi++P1I9le4vd6R+9ITvgAeY6eM3pCThePWspZWEMaRj
         ZmD8EO00aReB4wLKHwzyFBwl/AZ+MXhFvOtxE7L/hvMz78ZW03UBrzhyTyNj4ogsWhK2
         8NWA==
X-Gm-Message-State: AOJu0YwMviVjfP3D09TLPQUgfSAuhw/S2XAyAL0DicSz0rJevmGgStYX
	CJpGpHfhq1uERiwfMMyq9bwofsfqymTic+6EwzKH1SUmtP4oUnLTXKonFBUKwjpTIIku1+Iu3y1
	gag9ebzcq/rYuLpcd4BgFE29LW9w9hbzm0Tv8YCvpU9OrwBiSm+1f8uLpxQh8xTGrfvGE
X-Gm-Gg: ATEYQzzAD4HOJp7Rzk4Z0fFrZvQorvSUFzy+NzEbQJLBs9mdeQl/l1FMZlNLBd0tE+4
	Atx1/x7VUcNB9701K/345kP2U/aTmASh++ij5ezz5xR43I/IKJpegCAejRVH9+95STJwFB1baLo
	ZAmVd1ZaKYlN2C1foR6ZfYU5IZUrJr5d4TT8QMbIy5iJ7JGRzKpdUsPPj/WmOBPog0MbqPvn8DA
	ojAHXJQqZySfyCqSaZOSamrwnHtMutuSMe1H/tumdSb8tecfNJ6OxDSsGFZVvFwQihQSQ0yS6M6
	SEcynwrS48Qldbkb0xWJlqoqCWbVDubrudHID6opF1xU3emevEuT4MOu/ZKtp2zRX964dDF8nSV
	5um0ewOg8N1SPocFm+a4CxiNH3fGuFTTlWYWYzXwUSf8A4RgTAqI1e9Vx5iZ/gu3xkt8oLL/Q0g
	yrsdtJ16H9JvSScoNkYizwLA67LeJLgNv3JXw=
X-Received: by 2002:a05:620a:410d:b0:8cd:7811:9418 with SMTP id af79cd13be357-8cda1a88115mr853817985a.45.1773322180974;
        Thu, 12 Mar 2026 06:29:40 -0700 (PDT)
X-Received: by 2002:a05:620a:410d:b0:8cd:7811:9418 with SMTP id af79cd13be357-8cda1a88115mr853810885a.45.1773322180342;
        Thu, 12 Mar 2026 06:29:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm8646671fa.9.2026.03.12.06.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:29:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 15:29:26 +0200
Subject: [PATCH v3 05/27] drm/msm/adreno: Trust the SSoT UBWC config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-ubwc-rework-v3-5-b7e8f800176a@oss.qualcomm.com>
References: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
In-Reply-To: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5880;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=E5AQkqpaNuM1RXBAxJ/mn1wbVur7sOZpcfQb1l6t7DE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsr+1ZZ1VL0esfykadZwLa20M9PyGGoGxQofe4
 2145JtAJhmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabK/tQAKCRCLPIo+Aiko
 1X69B/4wo2C/IzVyMnnSwpzQ/jCwMuw8tqFrJpiAekQksRWYKMAAbH1gSHDbCCcpEs8QScqudu0
 Y2W/GMoXe8sEuxooXs4fEyzPHR7/lPCcSnHUmxcznTrsm5Wu/y6Llxg3dfFNLi9eg7w3bx+g+7i
 v5cLkcYyzchUo+HVgSYPLIxIi4G6RmAa5BzSGSq5a6Vyk8BtnHFdTeLnvDHKzhyeIlAu0XA082/
 x2YiGE1j8AyuAtAkS7y3nharboer8I66eVcS9pu5V5yv+yzJCbIsCittxDXIC5QVCJiZp+SiMg6
 cK7/9q+pA48OVjPavOUt/4/FTDXSbELmAaCus4S5sk+iXJwx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNyBTYWx0ZWRfX8Wcx+wToIMPq
 caHNN9K/BL823+8xMXpQXD7pqNmbN/m2NiRiw/gB5nxG/fvpdgw0ZbtlNHwEk/i6Xc0k/xv5LdV
 L9DQuIkqFPQvCewCBzOQunqFfZoRlqa6xX8l87uhruGdqoiPSQktC4NpBV1wgCGz5Qc5xHw67vA
 BDitA6Z/PWF2iUOAWsFSXckWZAtrzoB5d1IM9rJxqthwQHBPS/W6L9IoXYcVlSe6pHQk5jwmaBG
 xEOS/kDjHZFlQYaNj76Ai4KsA8cK+bxxG86H3vqfWlz/w9aE2IR2w79jpeXiGFrUIWridIcPAga
 2fWzYtfNheYdKoYOiXUSSSLnSKL2QaVziRGuQ6ZdX2d+um8S4wauMWD+VpiGuBCtmnqTVq5ZuSf
 wnma1AeW0RNvunvwSEYaHtR+k3a+FbS7mKX8xjkl89A2D5itlY1UY2MyKEDsADNZeRqgRNrmN0H
 QWv7PVaL1dZDiPRIAXw==
X-Proofpoint-ORIG-GUID: f-cYUFwEuW8Ut9YG4JvZ-FUgvhyca3da
X-Authority-Analysis: v=2.4 cv=C+7kCAP+ c=1 sm=1 tr=0 ts=69b2bfc5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=IhcC-CrlSmvFA89tYH4A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: f-cYUFwEuW8Ut9YG4JvZ-FUgvhyca3da
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97225-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 62C44272A30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Now that the highest_bank_bit value is retrieved from the running
system and the global config has been part of the tree for a couple
of releases, there is no reason to keep any hardcoded values inside
the GPU driver.

Get rid of them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 11 ++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 82 ++-------------------------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  5 --
 3 files changed, 6 insertions(+), 92 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index ef9fd6171af7..513557741677 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1727,7 +1727,6 @@ static struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
 	struct adreno_platform_config *config = pdev->dev.platform_data;
-	const struct qcom_ubwc_cfg_data *common_cfg;
 	struct a5xx_gpu *a5xx_gpu = NULL;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
@@ -1765,13 +1764,9 @@ static struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	a5xx_preempt_init(gpu);
 
 	/* Inherit the common config and make some necessary fixups */
-	common_cfg = qcom_ubwc_config_get_data();
-	if (IS_ERR(common_cfg))
-		return ERR_CAST(common_cfg);
-
-	/* Copy the data into the internal struct to drop the const qualifier (temporarily) */
-	adreno_gpu->_ubwc_config = *common_cfg;
-	adreno_gpu->ubwc_config = &adreno_gpu->_ubwc_config;
+	adreno_gpu->ubwc_config = qcom_ubwc_config_get_data();
+	if (IS_ERR(adreno_gpu->ubwc_config))
+		return ERR_CAST(adreno_gpu->ubwc_config);
 
 	adreno_gpu->uche_trap_base = 0x0001ffffffff0000ull;
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index d6dfe6337bc3..6eca7888013b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -729,82 +729,6 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A6XX_CP_PROTECT(protect->count_max - 1), protect->regs[i]);
 }
 
-static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
-{
-	const struct qcom_ubwc_cfg_data *common_cfg;
-	struct qcom_ubwc_cfg_data *cfg = &gpu->_ubwc_config;
-
-	/* Inherit the common config and make some necessary fixups */
-	common_cfg = qcom_ubwc_config_get_data();
-	if (IS_ERR(common_cfg))
-		return PTR_ERR(common_cfg);
-
-	/* Copy the data into the internal struct to drop the const qualifier (temporarily) */
-	*cfg = *common_cfg;
-
-	/* Use common config as is for A8x */
-	if (!adreno_is_a8xx(gpu)) {
-		cfg->ubwc_swizzle = 0x6;
-		cfg->highest_bank_bit = 15;
-	}
-
-	if (adreno_is_a610(gpu)) {
-		cfg->highest_bank_bit = 13;
-		cfg->ubwc_swizzle = 0x7;
-	}
-
-	if (adreno_is_a612(gpu))
-		cfg->highest_bank_bit = 14;
-
-	if (adreno_is_a618(gpu))
-		cfg->highest_bank_bit = 14;
-
-	if (adreno_is_a619(gpu))
-		/* TODO: Should be 14 but causes corruption at e.g. 1920x1200 on DP */
-		cfg->highest_bank_bit = 13;
-
-	if (adreno_is_a619_holi(gpu))
-		cfg->highest_bank_bit = 13;
-
-	if (adreno_is_a621(gpu))
-		cfg->highest_bank_bit = 13;
-
-	if (adreno_is_a623(gpu))
-		cfg->highest_bank_bit = 16;
-
-	if (adreno_is_a650(gpu) ||
-	    adreno_is_a660(gpu) ||
-	    adreno_is_a690(gpu) ||
-	    adreno_is_a730(gpu) ||
-	    adreno_is_a740_family(gpu)) {
-		/* TODO: get ddr type from bootloader and use 15 for LPDDR4 */
-		cfg->highest_bank_bit = 16;
-	}
-
-	if (adreno_is_a663(gpu)) {
-		cfg->highest_bank_bit = 13;
-		cfg->ubwc_swizzle = 0x4;
-	}
-
-	if (adreno_is_7c3(gpu))
-		cfg->highest_bank_bit = 14;
-
-	if (adreno_is_a702(gpu))
-		cfg->highest_bank_bit = 14;
-
-	if (cfg->highest_bank_bit != common_cfg->highest_bank_bit)
-		DRM_WARN_ONCE("Inconclusive highest_bank_bit value: %u (GPU) vs %u (UBWC_CFG)\n",
-			      cfg->highest_bank_bit, common_cfg->highest_bank_bit);
-
-	if (cfg->ubwc_swizzle != common_cfg->ubwc_swizzle)
-		DRM_WARN_ONCE("Inconclusive ubwc_swizzle value: %u (GPU) vs %u (UBWC_CFG)\n",
-			      cfg->ubwc_swizzle, common_cfg->ubwc_swizzle);
-
-	gpu->ubwc_config = &gpu->_ubwc_config;
-
-	return 0;
-}
-
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -2721,10 +2645,10 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	msm_mmu_set_fault_handler(to_msm_vm(gpu->vm)->mmu, gpu,
 				  adreno_gpu->funcs->mmu_fault_handler);
 
-	ret = a6xx_calc_ubwc_config(adreno_gpu);
-	if (ret) {
+	adreno_gpu->ubwc_config = qcom_ubwc_config_get_data();
+	if (IS_ERR(adreno_gpu->ubwc_config)) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
-		return ERR_PTR(ret);
+		return ERR_CAST(adreno_gpu->ubwc_config);
 	}
 
 	/* Set up the preemption specific bits and pieces for each ringbuffer */
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 1d0145f8b3ec..da9a6da7c108 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -237,12 +237,7 @@ struct adreno_gpu {
 	/* firmware: */
 	const struct firmware *fw[ADRENO_FW_MAX];
 
-	/*
-	 * The migration to the central UBWC config db is still in flight - keep
-	 * a copy containing some local fixups until that's done.
-	 */
 	const struct qcom_ubwc_cfg_data *ubwc_config;
-	struct qcom_ubwc_cfg_data _ubwc_config;
 
 	/*
 	 * Register offsets are different between some GPUs.

-- 
2.47.3


