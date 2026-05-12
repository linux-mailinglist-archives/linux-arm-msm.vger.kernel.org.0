Return-Path: <linux-arm-msm+bounces-107214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uP6HAj6UA2q37gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:57:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 63134529B6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:57:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7308A311D9B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 358A13C0A0B;
	Tue, 12 May 2026 20:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JzHTNS+x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eYGkh3/y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904203C661C
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 20:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778619216; cv=none; b=RFl5b42GTVZJxbCkOKZrRoy5gcgDBjtnRrybhKMX3hDkEXDlLQnP08oo4E0zS9mY801mcN3AsSx7HjOzS72x+8eSTOsn7nl5I2D1AggDbXcv1iLtN33Rdm3pe8/ni08QJH9RlB5HCAal/Iq6LAy8jlePrYPuvzkW6qmJ6gUB75A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778619216; c=relaxed/simple;
	bh=K8MdpY6XMsl1Tggb4WHji+dp3CRcvvp1nn7mA74lPSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lpK+DghRa9wb/CeJFAtpUYKNvs0/auXrMoIDN4yG5U4zsxZL4YGUmtzwC869RtAMqdlXNbPMfA/IDVbrqVUYVaYSNLdfI1n89KD7KpxQO1EZk9d+rg1E9KV8fij6ful533R4aI5E++T41PF3upG9S7SOMm/ajf7lO+XoF6INcT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JzHTNS+x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eYGkh3/y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CJA9hg3321076
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 20:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SkHOXs1v/pCbA8JFYyhJRkUq8O19fMYyqzXVYS8eqYk=; b=JzHTNS+xpFW1jkVP
	pOsQ5gGOvHPAo75Qg00C/p/ACKxvkR2nAc6MnbVxPO8JP0zbI0zRdx9F3tFM3VER
	+3MC37GAokAzXpMZ0QLWEz7GZpNaH+44BiYO+WKoaAWZYX0FLcjqnmC2U2sWNZCE
	z6VM7lGNhK75LVRKDNtD8xRebPOSNKGxFpMu3NdIOOidM/8y0iiyw4rkk3r6yEjc
	IB93PV1ZenShPm9rW28gOOGo6VVG0y7gJRU5jVH2ei0l3B0hYKhf6mpcJ4T6/O7u
	51fWn0wKR0Qx0VyGbcznnNkZMEV1XyEbkwtfO3iEPFCYEY04Vx+XoCFDheuWnlLz
	CeNeTA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43w1sysg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 20:53:33 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bce224720d8so3379403a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 13:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778619213; x=1779224013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SkHOXs1v/pCbA8JFYyhJRkUq8O19fMYyqzXVYS8eqYk=;
        b=eYGkh3/y75NjoyZhHPzCyF0NdP7Wcu/ZJ2fMEWD68FuzrhCH28pIBfOE7UCmFIR5+N
         nKqVvcKl3TtaNbinoXRtb22e85Gm/Z+EsV8WpunfxvrKgQp5iCsb32LVOPqAH7aM1duh
         VNg35lf5/EAhZuneY/wvJKa0vNHXIJKDhpnn0jp1sDhctCu4woU8sjON0CcCM/0jKRlV
         Mp/aTfaQbiDMmE3AiCGzeDlEpNPmbwdj7G/a60LY9oAAUM10ryxU6HCiLTCICqTFbXkY
         TOb4+I1LujMMsHf+GkvaRm77bV9Ee6O0fvPAg6uYjsO//RDcuS8EFzpZWx1gWOXcFN5m
         KHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778619213; x=1779224013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SkHOXs1v/pCbA8JFYyhJRkUq8O19fMYyqzXVYS8eqYk=;
        b=ORZdyB33jIyfpWwKn8Q7S/PRxLEnk82Qshb5kY5u5cy0Pj7xkOyT0UXcfVoxFqNIu7
         vlNWeSkCaCIOq0iNNY2PRCqDs7c2phmS38zQ25lIMCmhgVxDeLGZIIijfVNk7hbPh9+M
         j5uYVttLt87zOhwtkXJoIUK1f0zhTbYPjVDyQzrLXE32laQs63qMotYC5ugSvDoRQYV0
         WTz1IiLEK9T8da2kI+aluO6s4sKHUKMgCO+AEbrWovNCqPvjxXu0mLlOY4K8VRBKamQH
         FmLbJRqChe7PqONIHyw/pqvVnKdosS7rRkaLW/K1qHXTNznnokTTP+DCXmyvjzWJw/SH
         Lzzw==
X-Gm-Message-State: AOJu0YzH15gG3sPBxKWaj/j6hDD4lxVzfKJklWjDEvay9llU0zvM+j8r
	PiiCiQX9/jqJRn3+/BAOvUNvBorayOFsC1OiuU4xsVYjdon7t51e2U9ft7JGp0nY/sgVkVY+Lel
	rB6tPXh67PWhMCnKWCKPyv+H7m6BY0nW9LtOJkoxapB4nnXW2mcTs9t33K9UW9P4J0TYt
X-Gm-Gg: Acq92OHZ1ImujNwaew71nNWuB7i4xJwLzQERO8D7ixOj3S4i5kNd2PyZxaQ9UZMUrBX
	Ql9fdayjYZaDASCAL22GvprdAATTkMtgy3avLEBi+CuuDLDXBdDVZdGnshgEXJE7TutWSWMJjh+
	kD2UyUEG5VguZ0XOLvpvqZMGBFDU4ry5RCsSw1crPloUVcQ/KGZTgggNmFg+5ntc09pU9Mmiuyl
	fLO8pMiG1V7JL/sr3WccwUST+aymSfMhLG9+3/R7xGvL+rfSstJ6gLC10bgQNHpYi6hb97cJpeY
	NoulsDuhjs/f2RvgDOhVhXUhc+CQRkfVxJpH9EbaJE5cnZYp2t4Q8xjvI3qzosjrC/hAsMg0QXW
	szgal/FStHM0LyRmdnrkEUCxiYCP1iFl45YZuW4kKlxRNiA==
X-Received: by 2002:a05:6a00:4397:b0:824:a22c:c6d7 with SMTP id d2e1a72fcca58-83f03fd68bdmr270199b3a.18.1778619213068;
        Tue, 12 May 2026 13:53:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:4397:b0:824:a22c:c6d7 with SMTP id d2e1a72fcca58-83f03fd68bdmr270180b3a.18.1778619212601;
        Tue, 12 May 2026 13:53:32 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965945c1bsm25453004b3a.15.2026.05.12.13.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 13:53:32 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 13 May 2026 02:22:58 +0530
Subject: [PATCH RFT 3/5] drm/msm/adreno: Fix invalid drvdata typecast in
 adreno_remove()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-gmu-sync-state-fix-v1-3-6e33e6aa9b4f@oss.qualcomm.com>
References: <20260513-gmu-sync-state-fix-v1-0-6e33e6aa9b4f@oss.qualcomm.com>
In-Reply-To: <20260513-gmu-sync-state-fix-v1-0-6e33e6aa9b4f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778619193; l=1326;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=K8MdpY6XMsl1Tggb4WHji+dp3CRcvvp1nn7mA74lPSM=;
 b=9ccjXNhWsV+/S0pMs0dFGNgEHhzV5zQuUwdYYa52QEABfcg8KlXrsYrMehhxEpR2a4zVSKiTy
 oJAbRyqXwMlB1K7LPEmHtZ1mb2qfsUAM5kV8LRXHbbIVFlngF75D0I2
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: sDDw38iSdK2rBqWm5_Pxzv4_23T3yera
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDIxNCBTYWx0ZWRfX94lcbYbSpLlt
 exzHUE/qqJiwifv/JBAnirZ41sSwl3zFefrQhMHf1sFaXqTtEOMxJ9aLF8HafVWgo7nCOWNlEb1
 AcfEngiLpIJq4VaqBObQKQ6E9tq2uh3CHIBv576codYReVqSvmEhu/C8OujYiaGFeIo8Abk9wkN
 smr9cW2lwS+1I7jpDfTW3M4nyDDAVDtMCnlb2zaSjSiCLJbwQYzBYjn6h8r7aKUQkvw2FieDJ4k
 5e4qMlSWuS9wHYBLH27AMTM6KOK40zmZeSiFEgprgPhSWGhoOY/aTU4GpN2Uy1kkGsQycPJIORh
 KXmhN4sPHstEMo5g6eo9abWvjg1n5SIJxW8x1lmZhJBrdDMFqdGQdf3Jgi1bccgahSDVtPkNOXW
 n32045fDUxLRFhaMPicLs7xMQrKNqwP6IBTkuhFGFMRqgoqj4ICBLaafg87CGRo2twjX2QwHa2X
 nd0y3J4gRktGfDv7nMg==
X-Proofpoint-ORIG-GUID: sDDw38iSdK2rBqWm5_Pxzv4_23T3yera
X-Authority-Analysis: v=2.4 cv=BoGtB4X5 c=1 sm=1 tr=0 ts=6a03934d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=XPVHBuiRDinS94PRiAYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120214
X-Rspamd-Queue-Id: 63134529B6C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107214-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

adreno_remove() decides between component_del() and msm_gpu_remove()
based on platform_get_drvdata(pdev), interpreted as a struct
msm_drm_private *. That dereference is wrong because msm_gpu_init()
overwrites the GPU pdev's drvdata with adreno_smmu_priv pointer.

Fix this by using msm_gpu_use_separate_drm_dev() instead of relying on
drvdata.

Fixes: 643515a9cd09 ("drm/msm: rework binding of Imageon GPUs")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 3052f3e36de0..66953e551d86 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -279,12 +279,10 @@ static int adreno_probe(struct platform_device *pdev)
 
 static void adreno_remove(struct platform_device *pdev)
 {
-	struct msm_drm_private *priv = platform_get_drvdata(pdev);
-
-	if (priv->kms_init)
-		component_del(&pdev->dev, &a3xx_ops);
-	else
+	if (msm_gpu_use_separate_drm_dev(pdev))
 		msm_gpu_remove(pdev, &a3xx_ops);
+	else
+		component_del(&pdev->dev, &a3xx_ops);
 }
 
 static void adreno_shutdown(struct platform_device *pdev)

-- 
2.51.0


