Return-Path: <linux-arm-msm+bounces-82207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E96AAC68510
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 09:53:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5B4464EFE6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 08:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8238A311971;
	Tue, 18 Nov 2025 08:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VD5WjbSl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IF3uVepE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0DD31195D
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763455911; cv=none; b=UfAbEwehpcGqd0fVzX/fIINE7BgIRbieb+UA1MBxQFuInaTNjDUZaS9xA2rMM4ebKj9qCc3ESKJNRsHpNzxubQxLxj07RfaeVhG9fGfeTUmwXFyY7vW4dVp9vfCwfMs6cVdcOkgWWjmPQrgNRxit0NgFlzS1F8ML4u3VPZFto6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763455911; c=relaxed/simple;
	bh=/bkGsdPodJ4SkKP3xxQOVAelGLT5UoB+go22DhK77KQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JMyYmUDkWKOPL4u3AuXuayL8MmaErC/EqVv6Bx+b1+yjqe2xEDxD8f0FKSsu6JAQ2lhAj6XJo6a883gIv1sF4/HWz7ChGEVwSn2yvJeoDlNCy9VHfXwe5E7dLLfh7kqZY7Kovh5f7d3+lzo5fruVPBd9HqoV2GTvBpRm0luX9MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VD5WjbSl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IF3uVepE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI6nxSE623976
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ZwXB4RhWASSlUxI/fZ15AWl1OAJD3U3jm7GNFqQCE8=; b=VD5WjbSlg10PR/Zz
	pPHjDzjg5RAlNjJdXNcCt6EyVw1dWV4LFvu2W8mh0ykFKrqWuXTocWOi9yKp1+85
	nDxGFvum+YIeTDyDfQvwMgiB1bUmFsHpAtzcZEB9PB8zC7dclNmKyW3n583iU5m6
	ptG+8Ij9EpKJcwubisfQ5WJ2OQIVSE0C8L36wzYO4RHQuoxfDPrPOVU/2hlHhq7q
	lvEDunjlQN5X9WIjfap/UgCyipt559vM0fGTzyXtUJGYFvvtLnN5eu7bzft+Q3kE
	CQ9/VR24JHsBtFu7xV2FrGn6TAMFeJP/tDYVg7nULVNcsmlzNIarK3/po60Y//zv
	HslQvQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agahf9sjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:51:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29848363458so142975165ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 00:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763455908; x=1764060708; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ZwXB4RhWASSlUxI/fZ15AWl1OAJD3U3jm7GNFqQCE8=;
        b=IF3uVepEDesO0kO3MpPFu8c8q2BmVdgBBCHnxO/cXh0q5lRkUT1koTRiHrsGknuQvl
         b+s36u56QqO7YIPrwpEQVQr+P45re/ITss7+aOl64m7/fmFpcHPS6AemRstGpblupWJU
         vLCFHfP3p3nVG9ZEd9C8FBMbMFUgr/O0fCesOcdMLDON9zLeunpvT0N3WnzdD2zfCKQg
         IkhNG24pd9E7l1Y7rwvVXz39DnBETcY46XqOy/AXVJFRK76hOhx42PiOAaMx84Y1mV3c
         ko7WVfi1MKbmtpGXZKSFDYaodnnvybMeNaGzuicpZcw3irrY0BNvW6U9DW/mL+Tr7HIL
         JCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763455908; x=1764060708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9ZwXB4RhWASSlUxI/fZ15AWl1OAJD3U3jm7GNFqQCE8=;
        b=lSbExusUQhLGmsNeWWyqeae3wePcnqOohXStdBs/GrjvPpOc/wlkk+Up3uciIq3xNh
         IA0ca3h+waOJplHryDpA/C1ksuMwE48qxo8T6D9rnEMIdfgJHg/p0gzsFImMy0G63ruj
         j/YRdKu4tuodZrbSFIAsflB5hjStV/6gS5e2JDtb4ec02MAAwJvXF909NrHoMUGaYk32
         DQog8QKPtvkr3tW9s1+MY69I495gtSqJY6di9KtOvrq0ZpLWmRHv9Tzmx8D5pi6c2cCw
         uin9ITstx7ZwPzp2IFfZXfNR6XdQP4pw9MtzWgO3tPqWPgeeQPnrDHN2MwI5TD38a874
         gxLQ==
X-Gm-Message-State: AOJu0YzOGnyfMtQZiFab+aw4Ab3EeMYwhdM10TPty8+VuCWMpeqdIaDn
	rnlQAJXnGHWcXdn812OHf7lLaTU+sfFFIlc42TLOKjKeElvKHF4CJRmG+68YhaJvGF7UhABor7a
	/IEp6fY1R/w0vpBJs5oA7z8ACBGILHJ3QeyWQkFyp6EOzHCqIMs381Dl/D/4yBIPfir53
X-Gm-Gg: ASbGncuxgolbE9xcJ39WuDFW+HmmVWqZkZo1ktl82giJ0i5grW7nwEn8NQgpbgZQEBE
	wPvhSZmugTV/Xxro8W7fNLo57uwxrdrpcNeIhpl3vUEsKp1q54704T93PKaC0Puvjh6WYwnEZwx
	+eV96YPqn1FYWV12JDRepK6VV0uRhtjJA8BNRMCR020mCh9Xsm9oM4OSRah+6vygVodLk/I0U45
	FoCQ07FegkYlRhMQcdwzYA81s23RGS9Cx7RdUMLMbcK4rp4Mt1DtIBM/IdOB5bEizyX6VRYjRIs
	8N990Vy1gczX9zGfyFdRZtVN/mGIuP4IadI6jlHspKKEA76WalQ6kXSMCpMi7hF2MGIA+SxFTJj
	Cz9gi9JNWyAXR9UL2Mj7Up/8=
X-Received: by 2002:a17:902:d58f:b0:297:dad8:f265 with SMTP id d9443c01a7336-2986a6bd2a9mr208182345ad.3.1763455908398;
        Tue, 18 Nov 2025 00:51:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtBwZUTiYtLygrybb58YIF/amuW50qQQNcGd/n0p3+CKZ3EeqPoD0tAmXoPQD31iO91XcZYg==
X-Received: by 2002:a17:902:d58f:b0:297:dad8:f265 with SMTP id d9443c01a7336-2986a6bd2a9mr208181955ad.3.1763455907923;
        Tue, 18 Nov 2025 00:51:47 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 00:51:47 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:31 +0530
Subject: [PATCH v4 04/22] drm/msm/a6xx: Skip dumping SCRATCH registers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-4-86eeb8e93fb6@oss.qualcomm.com>
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <rob.clark@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=1280;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=/bkGsdPodJ4SkKP3xxQOVAelGLT5UoB+go22DhK77KQ=;
 b=Cu8W/7U4vntfUypSIoT+e6ZMqwHXL7dXJoM/TB2ZZ5v2hzpBwXrk0KoTeeYPef/fxMeMm2NbR
 A2soFU6jNtJDglw1G9wBMZQVrVwgL6mvZP4CKOGIPlVdXK+L2shNBIy
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX1uave3V6KNym
 vZtRzsdblRDOalXTVHS4uPvB5+87ad1Pb7uoNj0eAnmclv0V+0lUIB1UqFQ22vlcE8F9DKhmeGV
 HgwPOVrw4Ass5xmEAf74vUlwiNlGplfKdQFjAzOiPN0yNJsJGWh5nZ2DCMet7tNn2zdep9nS+Fu
 T56Oq/WXo8DL9DkuHYUexwog5Pq0UtiJ5WXVDW3leweIuxeZadpKTWhrS2Ay3FBsZugBq/sItRe
 fX2cEdSAIP3mEG9hYzcSazvgfdte5fumYSPmTB9+ICWCJiSbffGxFye0m31o0O+UGs7V3CELzVb
 yOSl3s80dxKCBKRLAx/NSFPOro5LAoR6OzgGuVOcC25afMFQTPX9ptJMHqlC/4QNAO1wEbhKocj
 zrJ5JyYnK9Ru10iMAkahWwmN+kCvaA==
X-Authority-Analysis: v=2.4 cv=RpTI7SmK c=1 sm=1 tr=0 ts=691c33a5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rH6QHmREy2P50qlKy74A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: v4Noea3DTVw2dXvqGIMrEf1rE0rYZbil
X-Proofpoint-GUID: v4Noea3DTVw2dXvqGIMrEf1rE0rYZbil
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180069

Crashdec doesn't require SCRATCH registers anymore for a6xx and newer
architectures. So skip dumping them during recovery.

Suggested-by: Rob Clark <rob.clark@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index e6393ef0fd78..c6b2fdb86c17 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1561,7 +1561,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
-	int i, active_submits;
+	int active_submits;
 
 	adreno_dump_info(gpu);
 
@@ -1569,10 +1569,6 @@ static void a6xx_recover(struct msm_gpu *gpu)
 		/* Sometimes crashstate capture is skipped, so SQE should be halted here again */
 		gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 3);
 
-		for (i = 0; i < 8; i++)
-			DRM_DEV_INFO(&gpu->pdev->dev, "CP_SCRATCH_REG%d: %u\n", i,
-				gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(i)));
-
 		if (hang_debug)
 			a6xx_dump(gpu);
 

-- 
2.51.0


