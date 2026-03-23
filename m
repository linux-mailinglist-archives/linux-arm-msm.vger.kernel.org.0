Return-Path: <linux-arm-msm+bounces-99397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBmmEH2hwWmFUAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:24:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B0C2FD2C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:24:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B51D030E1534
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D4CB33D507;
	Mon, 23 Mar 2026 20:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pAVxtE/s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XkwG7Ylg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE133E0254
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774296838; cv=none; b=mFgzXeX/6r2teOHnltMZ55Mj3TrETliNqU4/86+1SbkuHKW6oec6YL3xItICxqHH4ZAdUPyP+bM5V2Qms3rIc+1obqQXpLgQqLz+iKi0iA3Hg59pOkk7aoofPi9d2mUkKN9dthLldFysKbf+s4LiNuPr9U2gSlLSnk06bXgG8Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774296838; c=relaxed/simple;
	bh=BOYNB5erOcTcXYtZi4okQGOy9Gb4kZCAjXNcLR1sRo0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jChe8DpoQGRRq0nK5BFALwdixTD3R3u+Zx4/rny/4KYaM2lNluhP6C7s69+S3KhK2ZwAxxiV+MoMZ1ZwXqcwOcR8SfciU1XUGK1ge/RGNCbCTO7U2BTMDfZJAZlQZa72hytT/k+9P9fX1du7ngtpw4LCaRFwvTUrXht4A/nQyCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pAVxtE/s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XkwG7Ylg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqvlh618719
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:13:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	++AqkByfrQV0XRfPXuc9etfMULCFiMNJAf5WZLb9rpY=; b=pAVxtE/so+Yx4b3R
	IT1Kvccr+m0wgfSV0RBQbapibVXIezMWPrZfmYNfZzhUHjXpy3/iFD13Rkhciict
	NAYBB0TLZp0z/knj7iGpIO1gX4RT+hdu2mmjbz94LMGj/jKntrXS6wLOCYFoV7k4
	cUJ7Z6kAD+SNrJ2D8ZPaZ8vDD0/oc/Vua4t0VUU5dUDxootz0Tuk4zyN/lHxRVvQ
	B5ysEFAjFWaLNK4eeWp/qZG4ajaMyZd7/GQF5PXyKrIM+JoNzQFM8e1S3IReslJE
	08jQJbrCC6n6fXfk846NCsqJyTDTn94tsNYbeZ3YzqBsGvt7VGiyfeIa5QaEW+CH
	bUI11g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jgjkj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:13:55 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c245a88a5so1160480b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774296835; x=1774901635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++AqkByfrQV0XRfPXuc9etfMULCFiMNJAf5WZLb9rpY=;
        b=XkwG7Ylgr5N6zwMFhzD/3vyVOqwhOSwI0G2iVSwE9zgHoCEL4f8INDhM/L3Ez3nomr
         vXlmctUUZNfh1JC5BgbOVjD4+0XVb3Xv0iF+sNIQTqbii4EI7StQcDoaermjR8rsnyxE
         VrnX9ao5VV2lBuVW8//1yY6ZmJECp9P4l/sQoFTIYFRQXWLmjpt823svOr3VkP84Nkv3
         Of340rs+csdb3CIaF1RUK8J24M0TfbgYErvJGxNxy+NrB5zUr6nQBv8Szgqy8UH5dJ2z
         RU+wGd6WWnsE92LEE7CRys5L4bg/vKYc65jR6NdQ+A5fYqdj1sT9gJQe92fs1J7D0KhO
         8iwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774296835; x=1774901635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=++AqkByfrQV0XRfPXuc9etfMULCFiMNJAf5WZLb9rpY=;
        b=mQ1RuKLIefOeipPdddc22aTP6tVOFFwrzxlyaLxdph+yWen3D4Uy2sLDhu0Ao8+zUo
         vKCOQbp7u3eg/ggOL3eIgTb2kdPo7wL7IiS5/47lVZBDnFPf02oOhf6tSnik0zo3GaXO
         PYGU30I0oJpInWbS0sF2/C4U3bKR94kACd0T7Zp+Utax9ni8paMU53qXRV32QT7+KbRG
         kzcIvceAAyT+559LAJFjoIvdMEAjQq6u4156961HgrW7XLi9HpHr3CQ9ba1dr+9iDhL8
         4onrEO7s9PqOZk0O/wcCv15/VzS2ozMzN7nOmr/+ix8pyWTYIPqTXW1mE84j8ul1at0b
         Wzdw==
X-Gm-Message-State: AOJu0Ywp2HuWDb08ZdduxJnd/XGY7EwTPIsTVv2L5qZFVydr/fZfOPMQ
	uembqor/NhfSmLNnMuzu3SV1gylcfIH1w6jZli7DTIGel6FbAm4aNVUHdQhDze4bTEgowDLtNei
	mTMIUgUz6D0664CbQvtEYgBprTDFZ8iXRBxoqs8DCXkqj4alh//1WSdzQWrCOxlU8K+qU
X-Gm-Gg: ATEYQzytfjh9dmTK9fqBiN/bTWRF8L/FHcd4UvEFv0TKjqe6CDRq5kxiYc3GrBEMqA6
	HDJz89plq1rGb+9zLz9zLrp+VmipnHTIA5KN+9j6moG9QToQiW7S8XZoh5QmOuauzGw6FPUf3XS
	Kaobw9elG6wTSgsQPIU4aBUqMoi9qAu7+QFJShXWu8EbzfYaDiHgz5yvD3gv4B5wALsRFlVmwkJ
	LVpfiIMWYkpKmohLUorYMMYDlfDuKZlKbVAITRdQBBl92pil8wOH3DTeAcK0MZYe+xUxqFzHC9R
	X34/ZD+M6G+14LjmZwNtWBIFLE52O96mbdYCX4lEbOTmBB7KJD4toq+Bfe/rdattG+9DK1cAGPf
	LEDFblvSeetrK9JFN9Np+PEiRI0gPzhkAisJZ+YZKNGNwJQ==
X-Received: by 2002:a05:6a00:a248:b0:824:b03f:2f65 with SMTP id d2e1a72fcca58-82c5bd62488mr583995b3a.7.1774296834109;
        Mon, 23 Mar 2026 13:13:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:a248:b0:824:b03f:2f65 with SMTP id d2e1a72fcca58-82c5bd62488mr583977b3a.7.1774296833505;
        Mon, 23 Mar 2026 13:13:53 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409d148sm9510738b3a.29.2026.03.23.13.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 13:13:53 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 01:42:25 +0530
Subject: [PATCH 13/16] drm/msm/a8xx: Implement IFPC support for A840
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-a8xx-gpu-batch2-v1-13-fc95b8d9c017@oss.qualcomm.com>
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
In-Reply-To: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774296753; l=13599;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=BOYNB5erOcTcXYtZi4okQGOy9Gb4kZCAjXNcLR1sRo0=;
 b=NQW2gdQvVmcHxacDjjqKshLJaDdaA7zwuU8lmNpV63yHDxi/oCh+VB6OK4sy0k3uNAKldE3lK
 x/tyDBQDgBCBdmTko+MuiCjy78G5lr3jzr4JYeuG+Sjzko258ZzhrPT
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: Pk-sFtn1q_ENRIP5v2LwykCbz3H3RoJM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0OSBTYWx0ZWRfX5LrxZSaekkpB
 KgqXiFsPiKRf9YLrWDjAvqp6G3nExB98+mWMOnwqg7p0a86Mn+j2yesUiPA/TVOPKrcIbHL8mtl
 2Xl/qJ9ROoL+XrpPWw8JaYiLZloICjHvSUfwHuKpJbIVXRZSeT+Cnyrsg7hVeAc4G+13IaAUqo/
 hSRXh0O7JghLKCgCa8Y7q55wGdmJcXdil+ayzdy5jHRGbhBBEcHt2pHLsQN871DLGtv9LtdXCey
 LehjrtUYlFIc2qldws60e9MnSev9v6fp4Sh3r/0AJRJMTYsFcAKwqpVMu1+HKaziRMNpqNo7Q92
 iRWnlQRpyg8VNbAgw48gh9HpB98Y8QwJnIntiImIfZcwiVsKxeYRJBLOepSOBbAvvSVSziMQB1z
 +YSn7fJ6fgA3nMBu74VgL15iB5i/RkgaDKVKyEi+JF3ceACS6Nem9e+JI6GfJm74oWValVUABht
 xANwzQV0wxqQRQuJGtQ==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c19f03 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=gVRFLEIR9Vaz-UcNYaQA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: Pk-sFtn1q_ENRIP5v2LwykCbz3H3RoJM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_05,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230149
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99397-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 98B0C2FD2C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Implement pwrup reglist support and add the necessary register
configurations to enable IFPC support on A840

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 185 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c     |  97 +++++++++++++++-
 2 files changed, 280 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 758bc7bd31f6..53548f6e891b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1891,6 +1891,185 @@ static const struct adreno_reglist a840_gbif[] = {
 	{ },
 };
 
+static const uint32_t a840_pwrup_reglist_regs[] = {
+	REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP,
+	REG_A7XX_SP_READ_SEL,
+	REG_A6XX_UCHE_MODE_CNTL,
+	REG_A8XX_UCHE_VARB_IDLE_TIMEOUT,
+	REG_A8XX_UCHE_GBIF_GX_CONFIG,
+	REG_A8XX_UCHE_CCHE_MODE_CNTL,
+	REG_A8XX_UCHE_CCHE_CACHE_WAYS,
+	REG_A8XX_UCHE_CACHE_WAYS,
+	REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN,
+	REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN + 1,
+	REG_A8XX_UCHE_CCHE_LPAC_GMEM_RANGE_MIN,
+	REG_A8XX_UCHE_CCHE_LPAC_GMEM_RANGE_MIN + 1,
+	REG_A8XX_UCHE_CCHE_TRAP_BASE,
+	REG_A8XX_UCHE_CCHE_TRAP_BASE + 1,
+	REG_A8XX_UCHE_CCHE_WRITE_THRU_BASE,
+	REG_A8XX_UCHE_CCHE_WRITE_THRU_BASE + 1,
+	REG_A8XX_UCHE_HW_DBG_CNTL,
+	REG_A8XX_UCHE_WRITE_THRU_BASE,
+	REG_A8XX_UCHE_WRITE_THRU_BASE + 1,
+	REG_A8XX_UCHE_TRAP_BASE,
+	REG_A8XX_UCHE_TRAP_BASE + 1,
+	REG_A8XX_UCHE_CLIENT_PF,
+	REG_A8XX_RB_CMP_NC_MODE_CNTL,
+	REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN,
+	REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN + 1,
+	REG_A6XX_TPL1_NC_MODE_CNTL,
+	REG_A6XX_TPL1_DBG_ECO_CNTL,
+	REG_A6XX_TPL1_DBG_ECO_CNTL1,
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(0),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(1),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(5),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(6),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(7),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(8),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(9),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(10),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(11),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(12),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(13),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(14),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(15),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(16),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(17),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(18),
+	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(19),
+};
+DECLARE_ADRENO_REGLIST_LIST(a840_pwrup_reglist);
+
+static const u32 a840_ifpc_reglist_regs[] = {
+	REG_A8XX_RBBM_NC_MODE_CNTL,
+	REG_A8XX_RBBM_SLICE_NC_MODE_CNTL,
+	REG_A6XX_SP_NC_MODE_CNTL,
+	REG_A6XX_SP_CHICKEN_BITS,
+	REG_A8XX_SP_SS_CHICKEN_BITS_0,
+	REG_A7XX_SP_CHICKEN_BITS_1,
+	REG_A7XX_SP_CHICKEN_BITS_2,
+	REG_A7XX_SP_CHICKEN_BITS_3,
+	REG_A8XX_SP_CHICKEN_BITS_4,
+	REG_A6XX_SP_PERFCTR_SHADER_MASK,
+	REG_A8XX_RBBM_SLICE_PERFCTR_CNTL,
+	REG_A8XX_RBBM_SLICE_INTERFACE_HANG_INT_CNTL,
+	REG_A7XX_SP_HLSQ_DBG_ECO_CNTL,
+	REG_A7XX_SP_HLSQ_DBG_ECO_CNTL_1,
+	REG_A7XX_SP_HLSQ_DBG_ECO_CNTL_2,
+	REG_A8XX_SP_HLSQ_DBG_ECO_CNTL_3,
+	REG_A8XX_SP_HLSQ_LPAC_GMEM_RANGE_MIN,
+	REG_A8XX_SP_HLSQ_LPAC_GMEM_RANGE_MIN + 1,
+	REG_A8XX_CP_INTERRUPT_STATUS_MASK_GLOBAL,
+	REG_A8XX_RBBM_PERFCTR_CNTL,
+	REG_A8XX_CP_PROTECT_GLOBAL(0),
+	REG_A8XX_CP_PROTECT_GLOBAL(1),
+	REG_A8XX_CP_PROTECT_GLOBAL(2),
+	REG_A8XX_CP_PROTECT_GLOBAL(3),
+	REG_A8XX_CP_PROTECT_GLOBAL(4),
+	REG_A8XX_CP_PROTECT_GLOBAL(5),
+	REG_A8XX_CP_PROTECT_GLOBAL(6),
+	REG_A8XX_CP_PROTECT_GLOBAL(7),
+	REG_A8XX_CP_PROTECT_GLOBAL(8),
+	REG_A8XX_CP_PROTECT_GLOBAL(9),
+	REG_A8XX_CP_PROTECT_GLOBAL(10),
+	REG_A8XX_CP_PROTECT_GLOBAL(11),
+	REG_A8XX_CP_PROTECT_GLOBAL(12),
+	REG_A8XX_CP_PROTECT_GLOBAL(13),
+	REG_A8XX_CP_PROTECT_GLOBAL(14),
+	REG_A8XX_CP_PROTECT_GLOBAL(15),
+	REG_A8XX_CP_PROTECT_GLOBAL(16),
+	REG_A8XX_CP_PROTECT_GLOBAL(17),
+	REG_A8XX_CP_PROTECT_GLOBAL(18),
+	REG_A8XX_CP_PROTECT_GLOBAL(19),
+	REG_A8XX_CP_PROTECT_GLOBAL(20),
+	REG_A8XX_CP_PROTECT_GLOBAL(21),
+	REG_A8XX_CP_PROTECT_GLOBAL(22),
+	REG_A8XX_CP_PROTECT_GLOBAL(23),
+	REG_A8XX_CP_PROTECT_GLOBAL(24),
+	REG_A8XX_CP_PROTECT_GLOBAL(25),
+	REG_A8XX_CP_PROTECT_GLOBAL(26),
+	REG_A8XX_CP_PROTECT_GLOBAL(27),
+	REG_A8XX_CP_PROTECT_GLOBAL(28),
+	REG_A8XX_CP_PROTECT_GLOBAL(29),
+	REG_A8XX_CP_PROTECT_GLOBAL(30),
+	REG_A8XX_CP_PROTECT_GLOBAL(31),
+	REG_A8XX_CP_PROTECT_GLOBAL(32),
+	REG_A8XX_CP_PROTECT_GLOBAL(33),
+	REG_A8XX_CP_PROTECT_GLOBAL(34),
+	REG_A8XX_CP_PROTECT_GLOBAL(35),
+	REG_A8XX_CP_PROTECT_GLOBAL(36),
+	REG_A8XX_CP_PROTECT_GLOBAL(37),
+	REG_A8XX_CP_PROTECT_GLOBAL(38),
+	REG_A8XX_CP_PROTECT_GLOBAL(39),
+	REG_A8XX_CP_PROTECT_GLOBAL(40),
+	REG_A8XX_CP_PROTECT_GLOBAL(41),
+	REG_A8XX_CP_PROTECT_GLOBAL(42),
+	REG_A8XX_CP_PROTECT_GLOBAL(43),
+	REG_A8XX_CP_PROTECT_GLOBAL(44),
+	REG_A8XX_CP_PROTECT_GLOBAL(45),
+	REG_A8XX_CP_PROTECT_GLOBAL(46),
+	REG_A8XX_CP_PROTECT_GLOBAL(47),
+	REG_A8XX_CP_PROTECT_GLOBAL(48),
+	REG_A8XX_CP_PROTECT_GLOBAL(49),
+	REG_A8XX_CP_PROTECT_GLOBAL(50),
+	REG_A8XX_CP_PROTECT_GLOBAL(51),
+	REG_A8XX_CP_PROTECT_GLOBAL(52),
+	REG_A8XX_CP_PROTECT_GLOBAL(53),
+	REG_A8XX_CP_PROTECT_GLOBAL(54),
+	REG_A8XX_CP_PROTECT_GLOBAL(55),
+	REG_A8XX_CP_PROTECT_GLOBAL(56),
+	REG_A8XX_CP_PROTECT_GLOBAL(57),
+	REG_A8XX_CP_PROTECT_GLOBAL(58),
+	REG_A8XX_CP_PROTECT_GLOBAL(59),
+	REG_A8XX_CP_PROTECT_GLOBAL(60),
+	REG_A8XX_CP_PROTECT_GLOBAL(61),
+	REG_A8XX_CP_PROTECT_GLOBAL(62),
+	REG_A8XX_CP_PROTECT_GLOBAL(63),
+};
+DECLARE_ADRENO_REGLIST_LIST(a840_ifpc_reglist);
+
+static const struct adreno_reglist_pipe a840_dyn_pwrup_reglist_regs[] = {
+	{ REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_GRAS_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_1, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_2, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_3, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_4, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_VIS_STREAM_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A7XX_RB_CCU_CNTL, 0, BIT(PIPE_BR) },
+	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0, BIT(PIPE_BR)},
+	{ REG_A8XX_RB_CCU_NC_MODE_CNTL, 0, BIT(PIPE_BR) },
+	{ REG_A8XX_RB_CMP_NC_MODE_CNTL, 0, BIT(PIPE_BR) },
+	{ REG_A6XX_RB_RBP_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0, BIT(PIPE_BR) },
+	{ REG_A6XX_RB_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0, BIT(PIPE_BR) },
+	{ REG_A7XX_VFD_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_BV_THRESHOLD, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_BR_THRESHOLD, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_LP_REQ_CNT, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_CP_HW_FAULT_STATUS_MASK_PIPE, 0, BIT(PIPE_BR) |
+		BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
+		BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
+	{ REG_A8XX_CP_INTERRUPT_STATUS_MASK_PIPE, 0, BIT(PIPE_BR) |
+		BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
+		BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
+	{ REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC)},
+	{ REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | BIT(PIPE_LPAC) },
+	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
+	{ REG_A8XX_RB_LPAC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
+	{ REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE, 0, BIT(PIPE_BR) },
+};
+DECLARE_ADRENO_REGLIST_PIPE_LIST(a840_dyn_pwrup_reglist);
+
 static const struct adreno_info a8xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x44070001),
@@ -1940,11 +2119,15 @@ static const struct adreno_info a8xx_gpus[] = {
 		.gmem = 18 * SZ_1M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			  ADRENO_QUIRK_HAS_HW_APRIV,
+			  ADRENO_QUIRK_HAS_HW_APRIV |
+			  ADRENO_QUIRK_IFPC,
 		.funcs = &a8xx_gpu_funcs,
 		.a6xx = &(const struct a6xx_info) {
 			.protect = &a840_protect,
 			.nonctxt_reglist = a840_nonctxt_regs,
+			.pwrup_reglist = &a840_pwrup_reglist,
+			.dyn_pwrup_reglist = &a840_dyn_pwrup_reglist,
+			.ifpc_reglist = &a840_ifpc_reglist,
 			.gbif_cx = a840_gbif,
 			.max_slices = 3,
 			.gmu_chipid = 0x8020100,
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index d414f24ddbd9..b1784e0819c1 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -173,7 +173,7 @@ void a8xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	/* Update HW if this is the current ring and we are not in preempt*/
 	if (!a6xx_in_preempt(a6xx_gpu)) {
 		if (a6xx_gpu->cur_ring == ring)
-			gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
+			a6xx_fenced_write(a6xx_gpu, REG_A6XX_CP_RB_WPTR, wptr, BIT(0), false);
 		else
 			ring->restore_wptr = true;
 	} else {
@@ -386,8 +386,87 @@ static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
 	a8xx_aperture_clear(gpu);
 }
 
+static void a8xx_patch_pwrup_reglist(struct msm_gpu *gpu)
+{
+	const struct adreno_reglist_pipe_list *dyn_pwrup_reglist;
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	const struct adreno_reglist_list *reglist;
+	void *ptr = a6xx_gpu->pwrup_reglist_ptr;
+	struct cpu_gpu_lock *lock = ptr;
+	u32 *dest = (u32 *)&lock->regs[0];
+	u32 dyn_pwrup_reglist_count = 0;
+	int i;
+
+	lock->gpu_req = lock->cpu_req = lock->turn = 0;
+
+	reglist = adreno_gpu->info->a6xx->ifpc_reglist;
+	if (reglist) {
+		lock->ifpc_list_len = reglist->count;
+
+		/*
+		 * For each entry in each of the lists, write the offset and the current
+		 * register value into the GPU buffer
+		 */
+		for (i = 0; i < reglist->count; i++) {
+			*dest++ = reglist->regs[i];
+			*dest++ = gpu_read(gpu, reglist->regs[i]);
+		}
+	}
+
+	reglist = adreno_gpu->info->a6xx->pwrup_reglist;
+	if (reglist) {
+		lock->preemption_list_len = reglist->count;
+
+		for (i = 0; i < reglist->count; i++) {
+			*dest++ = reglist->regs[i];
+			*dest++ = gpu_read(gpu, reglist->regs[i]);
+		}
+	}
+
+	/*
+	 * The overall register list is composed of
+	 * 1. Static IFPC-only registers
+	 * 2. Static IFPC + preemption registers
+	 * 3. Dynamic IFPC + preemption registers (ex: perfcounter selects)
+	 *
+	 * The first two lists are static. Size of these lists are stored as
+	 * number of pairs in ifpc_list_len and preemption_list_len
+	 * respectively. With concurrent binning, Some of the perfcounter
+	 * registers being virtualized, CP needs to know the pipe id to program
+	 * the aperture inorder to restore the same. Thus, third list is a
+	 * dynamic list with triplets as
+	 * (<aperture, shifted 12 bits> <address> <data>), and the length is
+	 * stored as number for triplets in dynamic_list_len.
+	 */
+	dyn_pwrup_reglist = adreno_gpu->info->a6xx->dyn_pwrup_reglist;
+	if (!dyn_pwrup_reglist)
+		goto done;
+
+	for (u32 pipe_id = PIPE_BR; pipe_id <= PIPE_DDE_BV; pipe_id++) {
+		for (i = 0; i < dyn_pwrup_reglist->count; i++) {
+			if ((dyn_pwrup_reglist->regs[i].pipe & BIT(pipe_id)) == 0)
+				continue;
+			*dest++ = A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe_id);
+			*dest++ = dyn_pwrup_reglist->regs[i].offset;
+			*dest++ = a8xx_read_pipe_slice(gpu,
+						       pipe_id,
+						       a8xx_get_first_slice(a6xx_gpu),
+						       dyn_pwrup_reglist->regs[i].offset);
+			dyn_pwrup_reglist_count++;
+		}
+	}
+
+	lock->dynamic_list_len = dyn_pwrup_reglist_count;
+
+done:
+	a8xx_aperture_clear(gpu);
+}
+
 static int a8xx_cp_init(struct msm_gpu *gpu)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct msm_ringbuffer *ring = gpu->rb[0];
 	u32 mask;
 
@@ -409,6 +488,9 @@ static int a8xx_cp_init(struct msm_gpu *gpu)
 	/* Disable save/restore of performance counters across preemption */
 	mask |= BIT(6);
 
+	/* Enable the register init list with the spinlock */
+	mask |= BIT(8);
+
 	OUT_RING(ring, mask);
 
 	/* Enable multiple hardware contexts */
@@ -420,6 +502,14 @@ static int a8xx_cp_init(struct msm_gpu *gpu)
 	/* Operation mode mask */
 	OUT_RING(ring, 0x00000002);
 
+	/* Lo address */
+	OUT_RING(ring, lower_32_bits(a6xx_gpu->pwrup_reglist_iova));
+	/* Hi address */
+	OUT_RING(ring, upper_32_bits(a6xx_gpu->pwrup_reglist_iova));
+
+	/* Enable dyn pwrup list with triplets (offset, value, pipe) */
+	OUT_RING(ring, BIT(31));
+
 	a6xx_flush(gpu, ring);
 	return a8xx_idle(gpu, ring) ? 0 : -EINVAL;
 }
@@ -702,6 +792,11 @@ static int hw_init(struct msm_gpu *gpu)
 	WARN_ON(!gmem_protect);
 	a8xx_aperture_clear(gpu);
 
+	if (!a6xx_gpu->pwrup_reglist_emitted) {
+		a8xx_patch_pwrup_reglist(gpu);
+		a6xx_gpu->pwrup_reglist_emitted = true;
+	}
+
 	/* Enable hardware clockgating */
 	a8xx_set_hwcg(gpu, true);
 out:

-- 
2.51.0


