Return-Path: <linux-arm-msm+bounces-108806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEebGsXNDWoF3gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:05:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F365907A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 207AD30D1E70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633E53F7ABB;
	Wed, 20 May 2026 14:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cXlx5bvW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Opadq/sf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00FD3F65EF
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288721; cv=none; b=d0VAinM/X14JrknVrzcnD5umWqhmRd9+m0LVcr97YrcJvBhuMLNMTGjSF4wk4csUYMVBHmOv3taTtwocJDQLR0+o6MF5QSZYo+tmi3CbCpjnmmdrkuTGfxqCtuf+i0QdPgFDK5vCyKlwmBIQM9lOUneqQH5eFXKDUtmPDJiDTWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288721; c=relaxed/simple;
	bh=DoG4I3IZOv3niHJgYIouUp5Khp2qZBqtf+51O62ZQvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cETNh/0DHvDn/KmUcgPfm9xRutrbJ9V54no6YzXE+Nf/cxafqIzW0E4DwsYiGCDVeEFPQ6P7nf7kJTvzubckAgYzb9I6Gs+6XaAzFSQ6plqB/ZyIkFXquwx2ym4k8Na+tDwAWvgIOpAcI/4jiUGABvQO/xGtvUZN2Re6vLA9eXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cXlx5bvW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Opadq/sf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KE6d09119200
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	65lXVsMjORBSo8yjl1njsl0vBunig5XThYQyN3YvEAg=; b=cXlx5bvWQP/FaW+H
	rTU6D5GCOT30CwedePsc8rCs7R6wQSEuhOy64TTDq5OlNr6csAvSNWnwNTcXMWvd
	dy57QdsDIpw5mQ8b/orVq0rnF/nvskN0CMe7e5pEmuQYNCdqXpc8zlCUFlSS2JUA
	peCDmfoRpGOqiZuYA92eQbrmI4z1/zLEQJq/hsy34xxZsZgIq+c2RCj1Jynms49d
	0W0hyVw1Oj5VoplGvvDnsnz9mOxL9I1OgH5z/FvycOFlPcRygjbLbdeSzHz/IqQL
	3VkrnGyjkqmSmAkKA+9Bys8mSyB6gY/Tu24sLk5xmdQjBmf1ZcdCuu7dEjT1FsYy
	qM7Scg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee886gr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:59 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6314220f28eso11166744137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288718; x=1779893518; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=65lXVsMjORBSo8yjl1njsl0vBunig5XThYQyN3YvEAg=;
        b=Opadq/sfXvNK+nS0JqzTkdIcRsFkWETnW6cugVNIB619NquG372bsupdIsVccbH2hr
         3rDZ1g7KTptEc5oMpN4MNXMzD4uu04VHzqT18oglftn9rkrr/IIRMcAfvsLqCk/B3FfS
         IsqvdfKG6p3RpxsLSSXbPb1U7X7yOIwEORm2vLGsApE0ScRgl87iByNvi3ESPKYXPFHi
         zc+iQvY8sar/2LU9E/fwGf1dhtlmcKhuNz0POR3vXtOJmFdSnYjWWmP/e575EoJQz3tM
         BatopXmZ9hV6Qnuc0uQiDJtYmM0RP8PnTOxj5ii552wglln3IhF+UQ5RR/R6+QMRiJMO
         cyng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288718; x=1779893518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=65lXVsMjORBSo8yjl1njsl0vBunig5XThYQyN3YvEAg=;
        b=ktyyabekFxszmcUSvMDQ5J5zN53lRL0fwrzWEZIAs+j6pejLIKeh48tanE/9PGmTki
         NxP6wAJ7VDJ/+lEAdR/WfrCVLEDM/7qlQR4k0/xZOYrSjERLeKeGLgSKwqneERhVWYpU
         WEHwDg/x8lXTNSTtWrDQPNiSW6V26a2LbG/qZNsCy256mEbr45KTAKV0PgEb7lVIDnrv
         DEQ93RcKWPHmBl0Iurxh0CyV5yr2i9f0L06PEUBdIMQwxL3VjAeouQ9mfvxPsWz9jDQq
         0AFmjTPk+Tx1e75IT4rbL60GPX/mAfJgQENyT+N+RnHOZn2bZgh0juOpHkgiBOhQQ5l4
         dE8A==
X-Gm-Message-State: AOJu0YxhSp5UPT39sLsI9/AU0OE1WAznm4BH+8JnaOyAHOr3Pd8x4shY
	wrjy/0pbShn/0OC6BIg0LbxmkzhXFaMt3e++G6hxSuAjvAgX5iGxqGI2KcJUbsAYmKQsKgBFFCc
	mofKPi5M48FaOCCDUulUyBGNnc1VXL5o48GXGcnZZ+/8qxWU9npMj7Ja57NKkUfpDCscF
X-Gm-Gg: Acq92OFSp9zT1nrNV1myU79r/Tp7DHnNP3n1DVAkOcymRIpohM6rjtFu4C6C3coIaJz
	fXc8qFUwE5MEou3VtxwHmsIK5x5C7NFNc4fqxOgfpKVBo0IqzvCgbGtwMkflANbmaX+Dtq6Xg8c
	wC5sHif0x1xIKAZHx5nM2gRKZoKlL+XJKZJpq7JdKxwz0AZDLQKfLDmseAZuP5WUcb9wuzGGNPW
	bsXtwWdDp80pM6WHB7xx21jwNKbkfPng/RGyCndGOpqUZFfNHI7s/kHIYWSJwurbJbClyn9OLsY
	AVpchCS/A0rNOF4vhXyKiRy4ArJ3Yw++g7uyAx4QsYX1Yx+fDyA74Df6uSgqnbiMWVh/IrSPZWJ
	SEGvCbYNJfJSp1/SPv6kK/5D6rhn8EgWtt4Hh0yUDhI+ZERS4GfWOmbcc/qp2sscTDW38CvRojz
	mbyP3kE+FdVWqX5XOM2Ek2YsDswgZhpDjKn3k=
X-Received: by 2002:a05:6102:cce:b0:633:4d1a:65e4 with SMTP id ada2fe7eead31-63a3d6345a3mr13574208137.12.1779288718108;
        Wed, 20 May 2026 07:51:58 -0700 (PDT)
X-Received: by 2002:a05:6102:cce:b0:633:4d1a:65e4 with SMTP id ada2fe7eead31-63a3d6345a3mr13574174137.12.1779288717500;
        Wed, 20 May 2026 07:51:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c78csm5128907e87.14.2026.05.20.07.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:51:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:51:28 +0300
Subject: [PATCH v5 21/28] drm/msm/dpu: invert the order of UBWC checks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ubwc-rework-v5-21-72f2749bc807@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3192;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DoG4I3IZOv3niHJgYIouUp5Khp2qZBqtf+51O62ZQvs=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBqDcpp1kI2p6oY/1w1wnwOnWK9lPhmL+zMvJ1IF
 ViErCstdcqJATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCag3KaQAKCRCLPIo+Aiko
 1Wv6B/j1W/lfX0HxKR/gmLivHaUYDny9v75ppJUh/a4v9ZuUk3top9SOIjhHp7Jm+dE0c0GXM/H
 p0z4wob8iPEDk+u23KORPShQ32vu/Tyz9ILfvIog6v1Fr7HQb6cMCmygsCKXba923BERKC50l36
 fUf8wDRDoqr2forNwRkjcTJOfnkbfsKthVqehFD3nXQPYuZYTYtZrirPEfPyBzX/ym1JGPJUQh7
 dGIwvaxqehrQEpGmu31gCTyk/YvY1HfduYiZj7MaUF2IVcPBBkNJTa8L33DfFM8kYpZpEDxQSx/
 wzWxK0oPdajdA0C/jZL8ZOnqCFXDbFhp7XAwO4t3UcVt70c=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 6QtILpDVXohTfFwOKIbGfdigirbReIaT
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0dca8f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=l4KHnsLLE-ungWRp-RkA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NSBTYWx0ZWRfX5x1zq74E5lJ3
 H5bpYKMPXqLbl64IIEElFBE/QqfrRJgIzYupjZgpukf+aNGP9ckNLpj6zJM4UlCKF41LNVhEwIP
 0InwvjPd05BCx8v4jbhcZrVo9iCDaCu9RpCef+JBLtl3D4xkGEA4YXT4yP/QTfcpiPm/f8k1AYi
 qMKiWrSeHUmdYeIg4ntKArtNwk6GbkZn9UAmtKV8UHCT0deMrO2gMvk3+xfI3wuuj/HrQgDkQ3e
 Q72xBw/Q7PLUpFzVMLJK2dh6eMbdcj0x6dK1lqqUXdvu3AnnvBVf8StsdqR3NPI0e9PBaVcSo1U
 xNuzoFDva6yOejIdqRzw3hiNApdQZR7dvP1VFCGARbPuPdTmyEqRjOTvdhgViUNbYOf69lj8C8q
 HKsajCWi7A+sEfbURquMd5lo8JHmT8E2SptVkw8DOqTS3LiojgHli+cFB1Wnap/8dsOKHcANf04
 OLJRVUEibqFAhPK52Gg==
X-Proofpoint-GUID: 6QtILpDVXohTfFwOKIbGfdigirbReIaT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200145
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108806-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 93F365907A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Unlike other drivers, the DPU driver checks for exact UBWC version,
making it hard to add minor versions if necessary. Invert the order of
UBWC checks, letting the DPU driver handle new minors transparently.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 36 ++++++++++++++---------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 6089a58074ac..b5e50fc1916f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -310,35 +310,35 @@ void dpu_hw_setup_format_impl(struct dpu_sw_pipe *pipe, const struct msm_format
 
 	if (fmt->fetch_mode != MDP_FETCH_LINEAR) {
 		u32 hbb = ctx->ubwc->highest_bank_bit - 13;
-		u32 ctrl_val;
+		u32 ctrl_val = 0;
 
 		if (MSM_FORMAT_IS_UBWC(fmt))
 			opmode |= MDSS_MDP_OP_BWC_EN;
 		src_format |= (fmt->fetch_mode & 3) << 30; /*FRAME_FORMAT */
 
-		if (ctx->ubwc->ubwc_enc_version == UBWC_1_0) {
+		if (ctx->ubwc->ubwc_enc_version > UBWC_6_0) {
+			DRM_WARN_ONCE("Unsupported UBWC version %x\n", ctx->ubwc->ubwc_enc_version);
+		} else if (ctx->ubwc->ubwc_enc_version >= UBWC_5_0) {
+			if (!MSM_FORMAT_IS_YUV(fmt)) {
+				ctrl_val = BIT(30);
+				if (!MSM_FORMAT_IS_DX(fmt)) /* and not FP16, but it's unsupported */
+					ctrl_val |= BIT(31);
+			}
+			/* SDE also sets bits for lossy formats, but we don't support them yet */
+		} else if (ctx->ubwc->ubwc_enc_version >= UBWC_4_0) {
+			ctrl_val = MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30);
+		} else if (ctx->ubwc->ubwc_enc_version >= UBWC_3_0) {
+			ctrl_val = BIT(30) | qcom_ubwc_swizzle(ctx->ubwc) | (hbb << 4);
+		} else if (ctx->ubwc->ubwc_enc_version >= UBWC_2_0) {
+			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
+			ctrl_val = fast_clear | qcom_ubwc_swizzle(ctx->ubwc) | (hbb << 4);
+		} else if (ctx->ubwc->ubwc_enc_version >= UBWC_1_0) {
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
 			ctrl_val = fast_clear |
 				(qcom_ubwc_swizzle(ctx->ubwc) & UBWC_SWIZZLE_ENABLE_LVL1) |
 				BIT(8) | (hbb << 4);
-		} else if (ctx->ubwc->ubwc_enc_version == UBWC_2_0) {
-			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			ctrl_val = fast_clear | qcom_ubwc_swizzle(ctx->ubwc) | (hbb << 4);
-		} else if (ctx->ubwc->ubwc_enc_version == UBWC_3_0) {
-			ctrl_val = BIT(30) | qcom_ubwc_swizzle(ctx->ubwc) | (hbb << 4);
-		} else if (ctx->ubwc->ubwc_enc_version == UBWC_4_0) {
-			ctrl_val = MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30);
-		} else if (ctx->ubwc->ubwc_enc_version <= UBWC_6_0) {
-			if (MSM_FORMAT_IS_YUV(fmt))
-				ctrl_val = 0;
-			else if (MSM_FORMAT_IS_DX(fmt)) /* or FP16, but it's unsupported */
-				ctrl_val = BIT(30);
-			else
-				ctrl_val = BIT(30) | BIT(31);
-			/* SDE also sets bits for lossy formats, but we don't support them yet */
 		} else {
 			DRM_WARN_ONCE("Unsupported UBWC version %x\n", ctx->ubwc->ubwc_enc_version);
-			ctrl_val = 0;
 		}
 
 		DPU_REG_WRITE(c, ubwc_ctrl_off, ctrl_val);

-- 
2.47.3


