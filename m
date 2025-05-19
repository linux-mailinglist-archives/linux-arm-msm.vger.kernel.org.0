Return-Path: <linux-arm-msm+bounces-58506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E71F1ABC3F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:11:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8196A16FE8A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 16:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127AF28BA91;
	Mon, 19 May 2025 16:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cyzd7qcj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296C528851D
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670724; cv=none; b=j0pE7InB7rkny63hFoUkvuUcT4aRxut7FpAZ9GpnZl/o+FJrc2XbhJkO+xLaE3vI0LLYuAbTQ1V09RXPOtWSN3rr1kdBge0B1w11ka32OuYJ1GZQ91IY4U3pqGLwhgqNhF+4yN+FOCjHQnqpj+yzgEqNYrodQvhgkdMfP6dCvvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670724; c=relaxed/simple;
	bh=5pziOVoh9V3UHx+vXPDurxYvdEul401eWgXDtznSDIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OPVJVOK5erFdfVYOEk88LReOK1gC2JFSKFiragbB41kQJ+Vg6t5JToCvNP4qPNVuEzCuRxAzYw/j+mhr2JruspRO8qIG9wDb7F2wTdG/0wH3aYLUB+O2gLBpLMQn5xFKpEaaT/TYzNyfmhmO9VL08p8xNnLCqXT53b6L9GEj9nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cyzd7qcj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J8wvvr005909
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gsIzya/eBNdb4ab4rRxQ1tjNK779o0t+RrG8HSI8IGk=; b=Cyzd7qcj3bgcrrwu
	4s2MoTS3mxa2x+H6h4FLjrzZipzwVYmR5fsiNXpeXR+Joi5fXDCw/eCNFYvH76OB
	TVcQuF7Rd88MTL1WbWgfScFEv6GKk3TSsS0eUCQGu8Og97gEfG/w81dRoJuWbCZh
	RnC88UlWyCJWun+SbKJV0e6I3dD8TCnwkv984XJO/EW3+1JKVnE2D1RnDmpG9HWn
	Am/0zRa/C0/BizI+R6uRl3WOdgMNLE036VErK03wWcTTU+2fa2tpb7Gd19T9AMKA
	qXIcugio6/vgmo0S93t25FU6nq4PfldLTYXMn+1iw1L6CDt2PKC3MM5f1tdBlUC0
	lO6kiA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4vy7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:05:21 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-400b3a7e259so1739604b6e.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670719; x=1748275519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsIzya/eBNdb4ab4rRxQ1tjNK779o0t+RrG8HSI8IGk=;
        b=gdMT06wzoU9OAjeGaMdu3G2jmOAJPAHqBs3giV1meQyqIohWLkLx/yLO6mZZqZ+Sfx
         FSoaN7CJ3O/U9wYnfpfGhnHRq0SkAV2S4OY9E76Wvl/3X5ODAcYgc1VPmP7k7X1P92MC
         mUrRICtOaZeZGIO96/Md2aGu5Me3JGSFuy9f95kktmx1hSa4MrYbg+iphOmyWNDXWNKy
         j2M1LDOE+6N5KS5XnTrUKr0AbLZ44+oWB+BhyHgeTi1QuzF4paJDuQN+QkVyUI+42K1C
         4qUcJs86Gf39SxgLUzOa8xZCfjisxEyITRGESdY4kFXmdpXmcyiK/r0cuhakJ3KCS0a8
         e6AQ==
X-Gm-Message-State: AOJu0Ywsqxp2yv5TyFB3OD7KFt5z6Sj3r8jGQpTEsAzDDvkpN0iaeSDr
	CCm/tumNwaQiVMGseTPjxVFffE3pIrixKMd4hoalhQvRzDvZz4eSYZOI0PbnKnDz7M56SXnvwug
	Vsyi0oP11ReAQmasobCkUX3T4PIS+unpv4PQXLcJxkNcz7Hdo1X1F8wnjixpgbM8TYX+2
X-Gm-Gg: ASbGnctUboI5zz0b5L5+svTZ9OEu9r9rNmly4GOH8BoRGSgTgtFgkBQdJ1V3mJlvD3G
	VwPMcwti0gKsfPgeTZyZ7NUBFPjjE3ssZfcYYzXvLcco6HxLqmaskcDOh4SvsnXd06nOj4A+5yI
	dYlH2bLbIkGuv+hNfyaCpdgG+Qr2uBo8oaY0UGJWiW/wAsiCJSmPCcD5D7A+RJwHqzMzXq63H+o
	NWdEqc0lx2685GI6EJntzCr2OkyJiFiVrD/NeAOWNFBFza0pysctQ6iuaqfC9AvU/gjPt+CRmyj
	auUcyRXixrkd94/ag3eK89GgD2b89O9KM/EKGFKcYMLilM4qSqG1Phx/FtScW8zZSzKCUPgEbk7
	lXMTuZJV5HX61yPgmxy8PZesl
X-Received: by 2002:a05:6808:1b85:b0:403:476c:ca20 with SMTP id 5614622812f47-404da7e2ec5mr6460944b6e.27.1747670719104;
        Mon, 19 May 2025 09:05:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEub7x1dRS4B9iMXiGcC0JC5HkcwCviFd2xJmrk2MlU11gZcT/P7NCUK/jOPgrySWLHaknKvg==
X-Received: by 2002:a05:6808:1b85:b0:403:476c:ca20 with SMTP id 5614622812f47-404da7e2ec5mr6460906b6e.27.1747670718671;
        Mon, 19 May 2025 09:05:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:05:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:30 +0300
Subject: [PATCH v4 28/30] drm/msm/dpu: drop ununused PINGPONG features
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-28-6c5e88e31383@oss.qualcomm.com>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
In-Reply-To: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1095;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=r4il2Rm+AnjZK+9o9fCaz79Bb9Oko/V7wFb8PYj5DVk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z9OaF65pIo57+EP/tFZFqKgM98HIfjHBP/l
 Fv4ONTZK9yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWfQAKCRCLPIo+Aiko
 1UFwB/4+iT5qUqSv0isF16eMN54vlGEEwBvzGcbqpiuVPYA1F8Ki4p37sYwYA5btD4tW7xitVvV
 v2dtRtXN47hslX5mj/aEoRYfO844j+t1+qSKVixvGRvXgVa4KXXEUAcxzdBErFnpcO3F4o2Ninw
 5ciXVnXlnrC46BxCyK0GlRf+Dmda9LNBaDfCuW5lot1pAhFpcftGe9SW7ae+wmwcRqM9baIO6GZ
 v55kvQhLbpS0XdPVSMvfmPbHjkEEVxDkN9xneM5JDfIPDdB1ajUFbAoW6eemA0ndckDho9D7hdX
 fZjU3ru54h974EhEsJP46J+S6eQbD+67N/JFm3UNi6/tmUXm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682b56c1 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=UzLktXvLB0hFtr4V4nYA:9
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: -C7NH4vh1FId_DHgpGggQDOp0DVxPNx6
X-Proofpoint-GUID: -C7NH4vh1FId_DHgpGggQDOp0DVxPNx6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfXxMqgL508oMLW
 owo/JsysNssi7ZlW0z9hf0bFkZrHRIal1NHfQ6h012ybomRHt8duFWBfLQtcsnQTiucB4M143FR
 t9ixYFRkv+vfxNXLV8oLoHWQ4zU6sRsZ3wLk9ilQe+aPC9vfgezQaZ86xnNSBQvBRjXNVcXNG1R
 9KHbZvm+89/8v+FjTwavJJ+8i+FlRBAAGOYI4MLVdovgzRUxf7E3M2XavgM02/eV9+sH+TbY7SY
 FN1WLzGnVPab0fP4plEITacAQ6iWQqkgOmTYiMdJpb+2Ym+mu9zEG52ICqECOgMWopgtXTEjnJE
 nzQoy3DtgQu5C0ospxUd3L4dFfx0cL3Cx/WAvbeHCak6TkahzbF0HVFNDLoxymHuJYoKAh7PJz8
 wmWPxpS9cOphtDiTXls05UFviaJaR+xFFMz1ydUPOM6wMB/TMEkc9GTmFOPu9M1tzaCMpZdR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=806 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

All existing PINGPONG feature bits are completely unused. Drop them from
the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 9658561c4cb653ca86094d67f7b5dc92d36d38cd..c1488a2c160b0e2ab08243a6e2bd099329ae759b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -87,18 +87,6 @@ enum {
 	DPU_DSPP_MAX
 };
 
-/**
- * PINGPONG sub-blocks
- * @DPU_PINGPONG_SPLIT      PP block supports split fifo
- * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
- * @DPU_PINGPONG_MAX
- */
-enum {
-	DPU_PINGPONG_SPLIT = 0x1,
-	DPU_PINGPONG_SLAVE,
-	DPU_PINGPONG_MAX
-};
-
 /**
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display

-- 
2.39.5


