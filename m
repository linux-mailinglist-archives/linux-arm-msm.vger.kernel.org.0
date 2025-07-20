Return-Path: <linux-arm-msm+bounces-65791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEB1B0B5DF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 14:17:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D275D3ADC62
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 12:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79BA020F069;
	Sun, 20 Jul 2025 12:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HgExPltN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F124120E002
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753013821; cv=none; b=GmvE6XjgUWnN4L0GGgkDkVY1i22UEafSdTzOgf5ySQRsnHz0BgcrCGsBYyqxWqz/38pax0PF3fwSL62CwVcimivhGENuUFIiuybpBud+8sPlOaTuAX1tbDiQjCnmMA7J1PQ8EQ6nCcGsfePqUcJSHNjLCSW2ADWziRLGuv74cKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753013821; c=relaxed/simple;
	bh=V3hva8uUglYlyb//OHKwJr7lHWspUGiRoLgjciN1ylE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J8q5uR1pewxoSY28eMvuJCLXribvtk+fAnBeFgSTHV2xX+y47NqW2wG/4CtvHvmdbJES2zp2lO7ml3eyCTUzMkGjjoy0liLRx0piYiGQT7RrARYFQP4hGOu56+XPMJB6UYOPstfQIOdhzvQXdTOwG9X5zKTS3RnJYfVMqP1rWx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HgExPltN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K3LjEO023962
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GUUWHPjbvH6QTNjk1RlubS+78L4dbRVcEyaUCE6DYUY=; b=HgExPltNrDystxWj
	WZSR665Nt+p9eq7eWJL4f2uy3uI+HpwXDQYDrPnrlciuwblpGP6a1lROBcGD/GnX
	iO/qiPEJIpwUaWVhp8WBMubwqXqMs5upEjfl6snNyjaVl8AIYNQm/OVyVGiBRyrp
	MWhfdC07X46zqFp8bdmMfMnCnYB2DBZxrSnhGY5lyTO2/J9xPyYl9k6ldIw+u1t/
	GMzzRKZuvNFuhgTbGUozprK1iRM8lFx5NYcti+vysoQyt9+ck0cUKxkgv4KieOHC
	c+EvBJbQj9GQKhRmYSIlIfB/T23yTX6bidXWecrSzzrSKOeHfArKug4atTbBbT22
	3XivkQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804hmj3yr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:16:59 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7489ac848f3so5494773b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 05:16:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753013818; x=1753618618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUUWHPjbvH6QTNjk1RlubS+78L4dbRVcEyaUCE6DYUY=;
        b=MHUWIQB+4lqZfhUMEsLVxhmwOBE9Q3xXnx8nNoa3ft1Q+FWsz47F6you/6mPOwXgdu
         2TKeHc2rv7hjwtMhs9J0x8wf2kRDRrXvoMWpNCrpedfBQQb3bsRX3tqk8YiWqxVzlRrP
         ypyfGsCsvtcaVkAeLogHafzDyZzMfSDwtMAXE6KUPkTs9YKtfpl4ksakrVuVx7PWyH0F
         N8G/K718x2bJIYfITBKUJppaOqJLlwHPBT8lvnCSzuozY4r8pvrNE8DPYxhtGl4Hvsrq
         Jynuf66m2UPUy79k8wkztAh7RSvyu33e0o/pijcf+Me8Nmnchyga0cHvaJZj1Fb2qa2t
         CMsg==
X-Gm-Message-State: AOJu0YxyLOglFtea/XsjQ/QDXvgz3und3JPJm9J+xmaHTaQNMVUwlR+J
	ab5NWcgK8CneU7l+TsWeRslJIDzX6kwN+BPJ16B+4Ks9oPvAQj/ZvfVazCjbgMJBILZLbtAp+dY
	VrcY1JLoeJNoDdlod86+Uotiwp9xpBFvDq3QZOG7p4HLlKIVK070gdY8Q8ZFE02Lm377BuyPivl
	33
X-Gm-Gg: ASbGnctwEL7EKeW8tH/XLuBaFUPlwYYyYrMBxM9EiW0SoMGatLdLJV4SPByOpUavMiZ
	FnzpAkGJ2CHL4OO1Ubg886WDuXY5Fy0L5zoBskc0n2lxiDRHFTVn+1eKGTCZ6ZXm/n2YGc78/88
	2FucBSZHB+C+2vJzV93/U9/J8FNsEzrSPQe5LY9lyIsWLHAevfkmDcq0jDnIDUkWlikxJ+h+oAp
	E4gU+uIEaECq8dSnP2Zk+A4FUO63KLeUSkceGR1lmp+TY4D8rUCNv+gvCSpLHZ2vX2W3y0g5vHu
	OTZ9mLaw3EqhTJjDkubyFdP1EFe+XnrtHNjJwM4znJfbg0cTcG5yPxuOKi9zEqoF
X-Received: by 2002:a05:6a00:1307:b0:742:da7c:3f30 with SMTP id d2e1a72fcca58-7572558c61fmr24351247b3a.19.1753013818086;
        Sun, 20 Jul 2025 05:16:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2Vjaw1ovzeerTh8e3mq89qtc7qgvuqtULfKqLQ9vBCRz3+D/lvo3jTsyzzzXJz4o8Q5Sl3w==
X-Received: by 2002:a05:6a00:1307:b0:742:da7c:3f30 with SMTP id d2e1a72fcca58-7572558c61fmr24351225b3a.19.1753013817655;
        Sun, 20 Jul 2025 05:16:57 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 05:16:57 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:03 +0530
Subject: [PATCH 02/17] drm/msm: a6xx: Refactor a6xx_sptprac_enable()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-2-9347aa5bcbd6@oss.qualcomm.com>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=1332;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=V3hva8uUglYlyb//OHKwJr7lHWspUGiRoLgjciN1ylE=;
 b=/a8q8Jnntk2Oh0OvDR281W+cUylzzDVAVr7i2H6et8pObobL9+nzaq243ZkTe+PAVHRFFJ5xA
 hd2GgfpCPOLCDh2kiyxqoNAVe7BveNjYHWS3I8ME97cIVRxBYs1amvF
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: Ds-fFj0Sg-WIszzA9mKbH2OjHeQN8wc8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExNyBTYWx0ZWRfX0d7blrYDz+kE
 Rg2mT28xf+bCFktS7NEScbLgnNR5DuQAd7b+l8+1V8uLDUiyz3sz5wUUwC81Zny6OtURDjIfEf7
 2CSAYGY3hVTiQIJamyFFi4+aGeRas9VPwJeenYUwJdH3+Z1165OaxAywM8c1cn0MSAZhWxvEyHR
 Cc8bwuvUcmzJjFVCu/osGPN5NORyo6Oz7DZNnwuy3IBjdHEoruflLrNC6ZdeC+PQOJh4gzw80Ky
 /+xWU6soSY8m/Xf7acSRjhu2h7zDCqzov1VgDG6rQkP3kBpGo0PW7hM02JpaPQgqnXP6xwpRndD
 9X9axgVe1qt81QbF2wHwJEbDzgIYJZbcxfmy0s3ANq30U3Qb/eI8Tw8ivLO2g89CBwoVBxYtczi
 6PssoZApq0BY9M47+rePkl4EW1e82xbLMqdZK0kuptEQ81qKpgNzK6IlSQgBprk/pt23VoI0
X-Authority-Analysis: v=2.4 cv=Navm13D4 c=1 sm=1 tr=0 ts=687cde3b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=vRh7XmUrzz2ipe4V1moA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: Ds-fFj0Sg-WIszzA9mKbH2OjHeQN8wc8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=639 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507200117

A minor refactor to combine the subroutines for legacy a6xx GMUs under
a single check. This helps to avoid an unnecessary check and return
early from the subroutine for majority of a6xx gpus.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 38c0f8ef85c3d260864541d83abe43e49c772c52..41129692d127b70e9293b82bea5ccb6b911b0bfb 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -403,7 +403,10 @@ int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
 	int ret;
 	u32 val;
 
-	if (!gmu->legacy)
+	WARN_ON(!gmu->legacy);
+
+	/* Nothing to do if GMU does the power management */
+	if (gmu->idle_level > GMU_IDLE_STATE_ACTIVE)
 		return 0;
 
 	gmu_write(gmu, REG_A6XX_GMU_GX_SPTPRAC_POWER_CONTROL, 0x778000);
@@ -925,10 +928,7 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 		ret = a6xx_gmu_gfx_rail_on(gmu);
 		if (ret)
 			return ret;
-	}
 
-	/* Enable SPTP_PC if the CPU is responsible for it */
-	if (gmu->idle_level < GMU_IDLE_STATE_SPTP) {
 		ret = a6xx_sptprac_enable(gmu);
 		if (ret)
 			return ret;

-- 
2.50.1


