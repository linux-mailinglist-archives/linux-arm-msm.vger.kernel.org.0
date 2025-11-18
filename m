Return-Path: <linux-arm-msm+bounces-82206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A4DC684DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 09:52:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9B01B352E2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 08:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881F930DEA1;
	Tue, 18 Nov 2025 08:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kG6MWYFm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UDzAzENA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4606F30F81F
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763455904; cv=none; b=Vj5T5CZHZdpeOgSuhTbH16qrZp/yXwfDAasBBSYnYfHsYfhBCoOZyz93oZB4r8i6+aExloA/3bK7C/phY4IRnjU7WEN5HX+fy/zW2DfP6PS+Z/Ydl3598Uxm8vqft5I5fpbQORbTErQ78hVRpHVzOzzvH/iSbPFuCtpKnFO3vGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763455904; c=relaxed/simple;
	bh=9A5anEH53GnLLVd9MMQtmEBnjJez85XhahSgwIYwj+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DJvWd+txKW7AtccCcbhw3D/E2WhS49Tb+ajsbH8Bx09wrnNzUprx0or0BexG4lF4dHG1rxDzfvfE2QeBybF/s7Shyla4mI6YVsotOjk83lKeMyQgtAqkpH16wNOH1h/RGwVH0T9q77fixqhL1ilfojgWanbf5/+5orgg/+cK1N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kG6MWYFm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UDzAzENA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI3Aq7J027471
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rlajs93xW44KTRN0rgVj9S8DZUtP1T558SNf4fvM8c4=; b=kG6MWYFm56FyS/dY
	diVBK7hBFx8rRM4vKOd/gDWtBy5atPPXqh736uHfkgPth0FtmszfkkNkx1Al1Ctz
	hn/znHNRxvEpkE7EVk9/tEtpMINtxH4qN/WQHA+oWq5VzVWYilZ8j88RssNxzy7W
	LQeouQChS/YLGHmgDxJd6lUPl98Pc1+GvDWy9jUyAFVcbh2YZDgtB+vP/0bFAeOs
	4uqf/7o3HkLwGcGtfa1yeEYTW02L3HXzEBLplDER9cjVE2ZVj0QmRNmwumGkjL2U
	zbSKkQ7CzNI5S/wLh+rf/i4WumDKsKNUTCNyTCSmOBpMG/DUOhtgALIi0LfklkFO
	PrerhA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag77t2ee4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:51:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2956f09f382so46814095ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 00:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763455901; x=1764060701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rlajs93xW44KTRN0rgVj9S8DZUtP1T558SNf4fvM8c4=;
        b=UDzAzENAl7NN0GGJzeFuNV7WK+A9L+7GpSsL/JZKV8YH1Nn9P+lzKJUPmPfGHO8esJ
         XvDnjU34jy22ICmPmSfwIrG3+2fzZbIHUuesIUyKR+EFcgZUGMbQrgw1RRDf/jvdRg11
         N4tNaDWb2DcNSOy6ytfR4GMcr1mstTtnPFFa6GsuJW8rxakxr1w82rrXjSH2tD6sIvBX
         JOkFdHMwycnHiKoE3N4kXKBWvATpSAXM6TIjhq2DGOfiB+UlI2tzU+x52iVtSI0DHTKh
         GAlT4Xjchq82pZuwQHsQ7Bxd3/oOgNMXj06EhTnw51pfFFep0qDgS6xQxPcq7BI/p+hI
         ON6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763455901; x=1764060701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rlajs93xW44KTRN0rgVj9S8DZUtP1T558SNf4fvM8c4=;
        b=VKJgl3zDB4y8cEN3U8ogHNXDzL4fYESIMZs6rROapHCfMBCzM8rRRF7O3fUB5hJTAi
         ecy62k5Ph5QsqQZXM5fXKuMSOzsKRNxTXltf7t2CyiiJjNUnWDzUKySh2LP/KwXJrkHL
         nbP8jKqA/rQItvf4fdna5cDKJwukNrnGUtbzV2oB2+o1yGHCgP5lhG2o9YgCv35neePP
         sjAxPTIJIEyMTbxASuHpYX5BUEaTwBNaik0Zqf3FDiblhO2amKGlK1LJekKJq0R7hixk
         9qJ+kRLeOHbE10PBiOfURLj8oscfoQvXuDa1jDyTsr4XRs+mLwwbCa1t/vSxDI5pZcbb
         iAHg==
X-Gm-Message-State: AOJu0Yyng5DL8gbfXRef0Qax5L7iVi5Pg5zJA5YWkJeWQPnNu1qncYsI
	jnqfS7M1qFJvr3R74mKNh3ew8C5bjnndgFgJXelTIWfs7hJdaB86Cnx1na7vp8BQoc9Rvyz9hCy
	dMhkfnhirGmgdiLA3eVbv1Xr2OhAgY9L+G4Oa5jETItstF0yzcXIz9Yd/vI5rFyvGPUA9
X-Gm-Gg: ASbGnctMKLIe7pwm0ZSGM23vcHoxGivyTWck3KtWoF5x1thlkn3qY+/YNaBir8YXamz
	3tbTusZwnyP3DBCekDrq37cDmsLtgHBzeF+6DTd+bvDoHLcl+8x/xg8/32XZn0GxfMWsgN/G/UD
	FWPE+dHb6cumm+dMJxYwgoHjCneecI/YHTgGVx1dU3oDlTdzrX1fpL8mDkc3xalw5cJacdSlHor
	f6cCvh+FdBeUB+GUD5VbS3KZHqen6QWMwkFaL8ljERERaTHovZzaH/EFpnKz+SwTcpOI1esM5nV
	qNvIuJlAWEALjjTC2GgkflB1rSHvML3URwYF96q4b2BzHfHMIYcFddB45Pwuf5RYeq229KciiWQ
	kA8VRHSnC00WagapXXHHGMsE=
X-Received: by 2002:a17:903:2c0d:b0:282:2c52:508e with SMTP id d9443c01a7336-299f55124b9mr25185185ad.8.1763455900696;
        Tue, 18 Nov 2025 00:51:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCsVUT/gyxi19V6NNcgQ1Bhhk7hd0QU8Q3IwF4m63Apgo8HYRSB6+A4jdvCpbIXf22MBDTag==
X-Received: by 2002:a17:903:2c0d:b0:282:2c52:508e with SMTP id d9443c01a7336-299f55124b9mr25184705ad.8.1763455900192;
        Tue, 18 Nov 2025 00:51:40 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 00:51:39 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:30 +0530
Subject: [PATCH v4 03/22] drm/msm/a6xx: Fix the gemnoc workaround
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-3-86eeb8e93fb6@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=1590;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=9A5anEH53GnLLVd9MMQtmEBnjJez85XhahSgwIYwj+o=;
 b=GKVy5XYk8J2atz7vVd9cbq8c445N4UJwCVBFzNslb6yr289XyqRF14cJW4/UDx5T1sgwFfTBe
 gLOlQU5BxT6CV9lRW2Re59yEwx79W/9ih/7ktY1yUUPaQPppV5gcEHU
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfXy2Z0GiljuGVZ
 TYHDUlxoao22cRqi8j1ONsqDNd4HOsi/5rWaA+SReu/lNGmkVOGB1DidyfVW+DjAM7hS9fiLGHv
 Y+ULJG9wADF2r9nZG4pDux3Byf3XBsOiAJn0H23PICoA8806pSuxRaof0N1hUyA19E6cor8gTv6
 6CW2WcrnF6QSl+bvAp9A9qjYYlKRgR+lN2/U7AN3qH90lKhEPBCByNMR0rXxlATGSO50NkR9hv3
 oRMlH+yvx7Rk/Dmhgw5Vg39rFU4bufjS1cpRn2ZZNSOSxQKhQfyEiAVeWbjYKoYCQR6p+AjVFjx
 tjotmMbs74yeutV8Xv99ZuEAFtnZmCKMIBgG1Hw8aARHQr6/EI+Ez/sjpEk+QscrF4Ag5R5A80f
 YInJC/ZUx+AfyqVsygrg5M7+MRvAJQ==
X-Authority-Analysis: v=2.4 cv=EPoLElZC c=1 sm=1 tr=0 ts=691c339d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=twmNDnkDfZCprR7-lykA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: ESz8BIe2yGbMfERnlalLG1nUgbRp-Lrk
X-Proofpoint-GUID: ESz8BIe2yGbMfERnlalLG1nUgbRp-Lrk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180069

Correct the register offset and enable this workaround for all A7x
and newer GPUs to match the recommendation. Also, downstream does this
w/a after moving the fence to allow mode. So do the same.

Fixes: dbfbb376b50c ("drm/msm/a6xx: Add A621 support")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 72cd4fe0905c..52653ad376fc 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -511,8 +511,9 @@ static void a6xx_gemnoc_workaround(struct a6xx_gmu *gmu)
 	 * in the power down sequence not being fully executed. That in turn can
 	 * prevent CX_GDSC from collapsing. Assert Qactive to avoid this.
 	 */
-	if (adreno_is_a621(adreno_gpu) || adreno_is_7c3(adreno_gpu))
-		gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, BIT(0));
+	if (adreno_is_a7xx(adreno_gpu) || (adreno_is_a621(adreno_gpu) ||
+				adreno_is_7c3(adreno_gpu)))
+		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF, BIT(0));
 }
 
 /* Let the GMU know that we are about to go into slumber */
@@ -548,10 +549,9 @@ static int a6xx_gmu_notify_slumber(struct a6xx_gmu *gmu)
 	}
 
 out:
-	a6xx_gemnoc_workaround(gmu);
-
 	/* Put fence into allow mode */
 	gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
+	a6xx_gemnoc_workaround(gmu);
 	return ret;
 }
 

-- 
2.51.0


