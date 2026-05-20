Return-Path: <linux-arm-msm+bounces-108789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JmsGSTNDWrh3QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:03:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBDA5906A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A885C3075643
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F89A3E95B8;
	Wed, 20 May 2026 14:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o4xMXNAy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W10VPIGf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C7B3EF0BE
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288694; cv=none; b=U/wkW3F8GcobLZDVrAq4mwrGgUl7sw0DOuAoiUm52HQ/5wKxJbXO9sECOWXiUAqlGPG0g72ASk1voAb3Lkg8edYc7SFKQBvZQRMcPN4vESnR4DWOus1RZ6y8GksVtVRO/UK5183rF9T2HPVR26Y4sGCfR6wm+yyCt3D82d2HWLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288694; c=relaxed/simple;
	bh=llQosyriopAsPU93KsYfwj0RtQomBCEpetcDR/LyLdE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DsLTXW+BWiZKqU+bk82uRV78N91713aEpE5DdxEb47We0MJLTqFKhv9DBdH67QaxUvnKO6236xqZtA9nhG0osjGkAC75rL3JwlahPl/1tna/10aufjOtJ0ic/m8cGt9Ph56aEiCJuqbegF/ymMsICsB5rjbcYC8I8VGVBa/HgqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o4xMXNAy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W10VPIGf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KE2MJk826571
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Djk2zkStwaWZHr0e4GFbsUt4SMVtvVziVb4lu5RPX68=; b=o4xMXNAyRg0UAL2c
	JG79nbqqiWoxdFdV8PS8egzELwuuFJXb8Jb3jcQNQHFocYYxkPGRjuDK7o7Tjr0+
	AEpwYe2ZNPuiACAJFgxuRSk27S8CXLcZvUsceK5qEQm29hwjdhHY7ULsx20dLeCW
	OZ5RTMnochYAwmTzLHBnlLOL3mNDlHmODDTO16kJ2qMvg4dqRcP+uZdwS9mede/4
	dEoOQPDdt9L9BgJrHhDY4wq6Cn+qcjY+lvPps0ZbKFbrmiLM11zbeoKOuBfLgc41
	6/VcIvD3AdyMyYJei8QrpTYW28LFkpEivvoqM3VwqSjUITxCYgkvQwAp8H5Y3fX8
	YeVgnw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ecag6du-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:31 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6314d30fcd2so1424866137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288691; x=1779893491; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Djk2zkStwaWZHr0e4GFbsUt4SMVtvVziVb4lu5RPX68=;
        b=W10VPIGfLaAyggqGh+LKTmOnxg/M4RNKaqZ+ha9MbvAQej6NOgXt/z1Vf0vAJldHBa
         C277+8O394HWJ0pZW4ubIhyn4XjyuxCzPMkEg17FoDA0UDAcYx/cVln1uE0hv3Q9llsq
         Pa15Aw5W5wCzv7xhe9DqWFZb4vy3PBSNFMqA/tUPeI97/ZcRd6fvB5534bVT6mi7DFvS
         TQjShGE+rSK5cUzhRYKgvgOVSbpG8U7aBzSFJ7uuc+AKKmay75dAOl8Zzx5ocjj56arC
         nCV+3OA0qldtvRr2a3lNh7yxWO8ILh/NSeC3OznigcOeda+Jxr3ygN33Y37/sCsM1BCV
         z+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288691; x=1779893491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Djk2zkStwaWZHr0e4GFbsUt4SMVtvVziVb4lu5RPX68=;
        b=CTKNPDXdOyoVGXMhYjuov/I7p8HZBioQw1LoJwY+MsNBTSTeeaWYbuhdCdH5ivWGk6
         1HTsOUsMWX4KJGD35/BPD0YCMDvkb86rNQCq3mYrUM9PU7KHevYG+ZZNWg3Gu76dj+FH
         +XjufhUdcrEinmxvhEceXd0Urltk9qIITHThledSXE1Pn7wtMQm6LBFXN8iE5h2PtFVb
         X2946XD0CtZ/+eSP9+M7kvMu3jzlM6BgMi/o4bF1WRuPyIqr6AMIA6BuKypotrMBURdg
         6T3ssqjyg+LwSg7clGMZFQpmz3/Atp4/TdMSBB+BHD2QQTkV0mjBzOmImpEHW15fRDsp
         NQ4g==
X-Gm-Message-State: AOJu0YwWBSzZBf7QgBDZ6JgBaiIHD3Ed9LJ73KG2SRnQLdMUzRDFhi7I
	oYPhKb8xppWNq5BmS5bo8Ah00Ug36T8t3OEumgi1JxH8KDeTMGQSnRzLrpFUkx9Pj9jHbj3+emp
	dR4rVSoExVlrDwlzEUkYYgftvCpu1TpBHmaQx387JYWBwOOcCltHhOPEEezyp5l3VRBYfhj0ptB
	Bd
X-Gm-Gg: Acq92OFZMVdbHJXAa0sicc2c6NMDvNyPLvQcvItqbV5pGNqcgOcx+KWILhMAkuz9uX8
	LSNMX1ZViebpInVGX1dfmidKS5hPwoyudA4UkbOd6WLv1UMFMZC4/liLqT2K5ICSKzaOPlqBuCg
	z7j8tWob0Xpln3CLsIcMzVoTSXuwZ5qP209/Xi9/L7Nny9TWTXyijl84cBUZfdrPHLNQJNuHzC5
	WvKu0zb/NX2Gl6MJWRDEAhoh4pWHeOM5z01reRSnQV1s0eJ9X+Yv1ZdDZDoqPoupLIX2EVF2dFG
	BYarz4tKt6aiE9r+YQNkYRzrBu2Yjd7qllCgWiGHHWFd5gMNo7lJrsBfjmYjj67tlXEb9E1wSyT
	luKI8EiNFsMPEKWq8CqyioZzWv+1p4G7r6MNlwnqL5za5LN1A70/qVqaX5VOl/g86cJILA5P3Bb
	vQRcU96dlwOBA7r4sBAErnhEhTyjGPMnxd/jY=
X-Received: by 2002:a05:6102:4b14:b0:602:a9f3:74d8 with SMTP id ada2fe7eead31-63a3f9980dcmr11919395137.25.1779288690460;
        Wed, 20 May 2026 07:51:30 -0700 (PDT)
X-Received: by 2002:a05:6102:4b14:b0:602:a9f3:74d8 with SMTP id ada2fe7eead31-63a3f9980dcmr11919340137.25.1779288689885;
        Wed, 20 May 2026 07:51:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c78csm5128907e87.14.2026.05.20.07.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:51:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:51:11 +0300
Subject: [PATCH v5 04/28] drm/msm/adreno: Trust the SSoT UBWC config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ubwc-rework-v5-4-72f2749bc807@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5936;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=v3UCol6mfqB5clR/DI5HzrndmV9Fvkwgup9nT+3uePc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDcpmcLmb1eTiMXqdlk7HOL2ywGiNyaADZQB1d
 bOd8qORDTiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCag3KZgAKCRCLPIo+Aiko
 1bWbB/9ljxlAsqB63oP1geucWwRblpeTznE0EEUs7ZYNHv2c9V2hMnIOyatoxgNm2Uy7PyzC9yC
 7fCb9Q9+JiCtCi16OzeCcJU9Th/vV1IWUeTjWxPU0579QSeF5rNSU7SA6DsAfpGdDEzTOd/aG8f
 tSF9w9yhybsILaKwXed3NopqALRzxQEExfkIO/Cs0tviU56xqBFGJ8jz3RiLCAmrpglE4TYyFah
 CT1XQ/c2vDpqG2Bdnb1AcHm+HRCJwPmDwpVM7rlt/HWeXWJVSvJO1sWWpbvZWkcV7b+kJ2JUTZ3
 SgZQlmBBYCetsfkVEnROC59AE260LENTA9NCEHmfXVJ6iEpF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 1bM5uT7UgbozUgdM9Y60-L49cuHGCDiK
X-Authority-Analysis: v=2.4 cv=WqMb99fv c=1 sm=1 tr=0 ts=6a0dca74 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=IhcC-CrlSmvFA89tYH4A:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NSBTYWx0ZWRfX8ztCJkzjEL+7
 8RBmZsNO9f1Qr7+dBEWc4/6UJYeSKTbGMVq9ymjbxkj9dDZI45fo1EB6BHCFeZRWwsSxJU6GVK1
 hv9Y8taIPG5MWxpnqIt3U3WQFHQg2TMO7I2pRE53rtTBMmE9+mIVisqvAH56WIllxsU4vdMW/Rq
 ZM/CqFJ/zsWdHyu60RrBLq+IpPM5FCgRdVaKinI69yUjTW7Otj9X/qzab6UB4S9OotELhKKttu1
 KccvLhTePUB0ruZIvvvRiMH7GKIH78bIINSSAsLFEqRD2xUvGcgJ0FfSfdWJ+BFVJyfxeeopVLw
 eGUpjLIKdx7sJi+uMublljM174U4hU/k/RS5c3GxCaBIcfqliHtgRk3wnn39Gk1Bs9uNGE9Tw3v
 jeTQGfgo5zxlfiYKvUMtx9Ra38s/0y4WFjdORfq/bilXDkBdoforXkc1LwpEkXuxkMGY2CWDRKS
 na3zjK552OV0A4z7WYA==
X-Proofpoint-ORIG-GUID: 1bM5uT7UgbozUgdM9Y60-L49cuHGCDiK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0
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
	TAGGED_FROM(0.00)[bounces-108789-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: ACBDA5906A0
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
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 11 ++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 82 ++-------------------------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  5 --
 3 files changed, 6 insertions(+), 92 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 79acae11154a..699fc0f551ed 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1725,7 +1725,6 @@ static struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
 	struct adreno_platform_config *config = pdev->dev.platform_data;
-	const struct qcom_ubwc_cfg_data *common_cfg;
 	struct a5xx_gpu *a5xx_gpu = NULL;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
@@ -1769,13 +1768,9 @@ static struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
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
index 7a3e3c2f5cf3..90e814c64c6e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -733,82 +733,6 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
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
@@ -2700,10 +2624,10 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
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
index ec643b84646b..324319762383 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -236,12 +236,7 @@ struct adreno_gpu {
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


