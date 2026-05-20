Return-Path: <linux-arm-msm+bounces-108802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DhrOGXNDWr53QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:04:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8064E5906FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:04:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EF2B1304CF4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0543F54DB;
	Wed, 20 May 2026 14:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p5qpUd2C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VwqpK5TN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062943F54C3
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288714; cv=none; b=GnlV44h/w5uUx1eakhjk9oMouyWq994AXQ8BTVOBz98aTmn5yeugxOaJyMd+PLWrnDJanGa1kFreg4L7bZpjThlfsmkRIJ+iTFaZ6aXvJPBSM1UQJVMu8vATLsLmWgMHgOMKXPO8Jsb0aoVAHMpwer2UN5FU+8y5oy0hqdeBAJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288714; c=relaxed/simple;
	bh=6iZnedW4RBQxA96XKjwsTUc9JsPI83to3JJHc5dyQQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L+9QWlkAYMpmdFuIF/RnWltQ37Wr4VHk3y0ZD8Ajekk7LApjWx6p3CbCs3SCu8hrJy2OOf8kCFHx+Vzc0QN/h1OdLYA/Kz9nC2XbtxqwcX1EaSDPdCgNX6IsX4Vhnrl+OGr3E+8PxPYau3T3rFFfLjwe0NC5Eq83jqNtSb0c0X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p5qpUd2C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VwqpK5TN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KDuXKM3680415
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uukH2Hr1fThFSWIyYnWWKO/3affNsowUSHW3Fd24TQE=; b=p5qpUd2C6y94tPDf
	6yxDvXjGefICxM6EJ+OHuPYcNkzkG+3Kte9NEyReBe1St8LG0AMtZaBZDhbGBM9U
	GBY7TdsJlC94gyskL6DRocxmIJBkV5DRVYBbNEFHtpe062bhomzmDxC04OfneM8Z
	+lgDxGvfIC322lTWwAOYTN9Fm9oglxloxoekFZ5/aghDYbZX4sXTg1Ml6et9TkMm
	ti2Lx6SZ9R/+hvPrpZLbWR0E28BHP9OsU0eU/kbV/nQ44rAHGReL0xY+8SJQsy47
	O85ojwzzRR2hfEMtEv3dPDaMhzlUAS8SYf/ilZBVn4lmkEzrPHjhFScNoRtgLZFt
	J5p5Fw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j07px-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:52 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6322654bb6eso8494356137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288711; x=1779893511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uukH2Hr1fThFSWIyYnWWKO/3affNsowUSHW3Fd24TQE=;
        b=VwqpK5TNStW+rynfHapQ2d99wecYGXgrng9Z27HZH6KWFfU1+6r9G0tyYe/4aP8/Sk
         UxCzRz5sLmAU7jsjERWMvFG73RP0Gre0hxXQTxo1UdK1WEXf7EqqvGEYU6gwQiLvO9bt
         KksNwhx5HwHP11gqMGW9X+mverur0/FgIaUCXSLrSP1l5UGBEJxpvzHTd9r9mIi555/y
         vNsS1JVyeq1hSmS9I9U/urOiJ439G7mMFMC0iES8Zaks0q616j+X3UfLzTxuMNbaa/S/
         NFc6eQz511h2opGy+QcsrYfnstAVx0b4/FkOSaYAbpamG7rVI+BbzM+GsFZRMYI6qdYv
         pZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288711; x=1779893511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uukH2Hr1fThFSWIyYnWWKO/3affNsowUSHW3Fd24TQE=;
        b=FeFx0Hykjlq8aI/HeO38or/XGsuUb//fIGW6jTF01BSFxRuHQJ3IWSIf9HDeHan85P
         bV32dtu/W6njrhOXSAvYMhU9fEOArh3iQ+m+1ZyupZbOW9f9Ss0nItjSR9OsBza77dnI
         dmNjC09H0gHmDh2o4yLmqpqjUwMB8csBRGqEZXJ1fkpx2f9Q/2NRNMGeSuTq0PfINPL0
         vMM7Gz6UWnrye6BWAOmQ6fctpc+m6y+upl+Ibb72wkLhzJ4SOkZOPoSH0XfllBLfAfh7
         L7B7RAn+RoOiG3QisNLENwqeZULxUd4tx/36+6qzM7ih6bzwj1wuPNmXhRQJoBidBav+
         uYQA==
X-Gm-Message-State: AOJu0Yz68XTkkzxFOuYwh0v2j0phRdBpwufbgXDnKPE5dOmHTxONz64V
	Gd5t30bP9buVxRssxQXEmsCS+fu5hjmMkirpzQ3QC2yzM1Sp7F0ZBZaZ04yiqkgQIPBRbSSKqDt
	S/JbEItfR6wdnWHZDkciLgqjULhXe6IadyzMc0IJfcUvnnypaJGrWcLaAwxtIs/k+F5kP
X-Gm-Gg: Acq92OGWNBvKQ7dWZFraMnBqAPBHmbwLyzwHu0uOS2zvrwp58t+lzQRS48Nyqunv3Hj
	pEVcEJsSwu5tKchDp+zZDNWCMLApTJOIgsiDK1+1yb/AqGm27JrJZQdxgnwtvI/hIX5/17gXlF4
	puIOFdOXGj6/lw4EhXz/4dgeRQkVtkrUvbYRMhJmMlv+GEm7FwmrkVGSPnxdM+zFNxjx+X0Goxq
	FVp7c3cDlik9bUPF0xddvMnaawlGn1uwFqjCMtwgVAlWmNq3JWX/0PrtDs2L09oeyM0QauZPiOC
	HIQTGAScriMgJywZDWjsBD1fWWoyb+ox3S4cXacJI4QKpj+8WPXuJVSUHFe0pCE9f8bS3dSVukm
	uPb/dRCRikm4R7JhQYPEMo0J6pnH4y3GYhuSTMI+Fydv+TZg4XPNkHjDHpdkV45629pNMwAAuMt
	D3kKJhe0fR6F8X72INmhDoc3mcjK6VVnoU/eI=
X-Received: by 2002:a05:6102:3a12:b0:631:23b4:8dce with SMTP id ada2fe7eead31-63a3da4cf2cmr13976552137.13.1779288711199;
        Wed, 20 May 2026 07:51:51 -0700 (PDT)
X-Received: by 2002:a05:6102:3a12:b0:631:23b4:8dce with SMTP id ada2fe7eead31-63a3da4cf2cmr13976359137.13.1779288705989;
        Wed, 20 May 2026 07:51:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c78csm5128907e87.14.2026.05.20.07.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:51:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:51:21 +0300
Subject: [PATCH v5 14/28] drm/msm/mdss: use new helper to set ubwc_swizzle
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ubwc-rework-v5-14-72f2749bc807@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2044;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6iZnedW4RBQxA96XKjwsTUc9JsPI83to3JJHc5dyQQ4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDcpo45jCHKUU8FKL8yZzfRFsDWZ3RYW8Il5rr
 8DUbrPGtGOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCag3KaAAKCRCLPIo+Aiko
 1S8jB/9BSiBZy04IfOOx6TAbeE1bNrsn3MwfEjorlEXRkkPZ9YrstTV2eRftuW5zWooGw9m5axV
 J0A91K6H24edalCcuU7o3MQL98+I8X+/4v7jIv7Nhu6qFTuXyvHRJCkm9223gR5P60wXESSEAnC
 cHTUjHzxzEOPO8ODKs41WwKOxiLwgYg/PlXA7u0L7sq6ptHMMRSeftn2GxD6Gx9OwlNmkbd2rIQ
 AEyp7oIyThZcDH3AEkBAHtyQnCxKZ4Wg0onYsI32Vrg9AtRvK5Lr0uDkly6v/1LpaS012KoXOef
 i0S+oG4k0lPxs8XYcLb6bBJWkZTnmRmIpfb+dMQtsxJodmaN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0dca88 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=crYPmtHWi7n-_IQ59sQA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: Mo78pgjtuZtCLBHGE9zePqIlOL2yAdow
X-Proofpoint-ORIG-GUID: Mo78pgjtuZtCLBHGE9zePqIlOL2yAdow
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NSBTYWx0ZWRfX0F+KkGN1vyrF
 y1jK1ZEIFovf3Y+57Eihlk7QHaRXnMc6DXHvSsXldiqMDvANDFVx20fbjaX8QsGsGYevBy2vtFB
 +FN/GRgEDIfFevJ7cNY4pirp4fYVWu9UGuqioNi6bDhCVIVti9R1BATuQ7Btj4EZ4RtxpwcpsCA
 hTOugTsJA+NDCvm2UJoZynoVyKHUYfnH5HdvxHcNuYbrzKVaHpSchRg0enXqvCwkLMtrP3Ty3+X
 1+EPAFs50pqkKToVwSxttRsFlYWVmkMKYAvGStL2Zu/Fc57Q5y58a9em3kS96ef4L0q1LJi1B9G
 TrgE3AwdDB1rHtf9ejTY1oT5JlObs7EmGJYcA1ztdYr+SKF+DPN+FUXvQVGaPmlp9V1pEKLEiLv
 ftV89VUnrC7Hk4Vm22Weybmlbd1Nb/ku1XB5BKW3+mUkBAWWqVKJ6ztqQrZEif/n0h6O8l4mDvf
 M5PrF5mMUwEKRCBssPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200145
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108802-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8064E5906FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use freshly defined helper instead of using the raw value from the
database.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index bf106d849dea..3c1f04f12c3d 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -169,7 +169,8 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 static void msm_mdss_4x_setup_ubwc(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(qcom_ubwc_swizzle(data) &
+						  UBWC_SWIZZLE_ENABLE_LVL1) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
 	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
@@ -180,7 +181,8 @@ static void msm_mdss_4x_setup_ubwc(struct msm_mdss *msm_mdss)
 static void msm_mdss_5x_setup_ubwc(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(qcom_ubwc_swizzle(data) &
+						  UBWC_SWIZZLE_ENABLE_LVL1) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
 	if (qcom_ubwc_macrotile_mode(data))
@@ -197,7 +199,7 @@ static void msm_mdss_5x_setup_ubwc(struct msm_mdss *msm_mdss)
 static void msm_mdss_6x_setup_ubwc(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(qcom_ubwc_swizzle(data)) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 	u32 prediction_mode;
 

-- 
2.47.3


