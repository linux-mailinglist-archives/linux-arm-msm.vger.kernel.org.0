Return-Path: <linux-arm-msm+bounces-58505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DB8ABC3F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:11:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA2AB172E0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 16:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA00928C02F;
	Mon, 19 May 2025 16:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MlCcQVgr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AD128C010
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670724; cv=none; b=aEoVM/1qyOjvHvPFovTj0EUwPppwblkWBmyjD4lHSplwIJ3MQv70PFmw67Qbm+T7sDYTUFBOv7efq2xBpEacW7YmuOBRRyvJRFJiwvaSLDlIWImw4wWFrhqKqNgOotjdaz5gvyJQ/4/JWm/xLb3A3alffkE7GIfw5iejdaQFZFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670724; c=relaxed/simple;
	bh=6IJBiuFHFdT/qK/ZNhpN98vBXCMeU2gfknfyhqpu6MI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fg51ZnG1fBA6CXM5Khd8k9QDwEDRYVhjGGicMWx9F0jD/FAnLynsBMNvgvQ82ILKZuDfB7C/AMyqpQQLzRnUtJz4Usggy7GVcrSRZr2k9sL/7ivl0pbsqVJVedEwNIm9d1/8CKUIbJOZunSIPjGjEwoJyqPxpArvh9vmHRFRHLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MlCcQVgr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9V1Cg023798
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aWCYVrEOdgn0YXXrxgnbqeolLsmmtMUaNpkzWfiOXzk=; b=MlCcQVgrCh/zQBVZ
	p1sMHcEbsFpAUzSwCWUndtM4MVuAIJ1hD6dQ2kWqaG3h3ZPbJFhM2p7g/d7dW3Fh
	67Do7yKIor3TP1c42oIO46GwA3BaNWNcy3WgISuypR2EP6Y0RdIEYfN5slf3mZHi
	YsbygYecViZEJpe7lZj5YYfW8oLwd2Gjam+r803wrpkvHMenygZMDz8lYfqF6TUK
	f/mXQi5ZGEPf6oFCPlpNcnYC7Z3ydN8+C3voLErQ5Bs5QXlE3+YKaMoyKxzTzKf/
	zm7gNTvOWWWL7PNYawgEH9S0BbjlbE1eMhPKVz3evRLvWk6fDYwRp6lqkmi9+Xix
	vFdVIQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsvut6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:05:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-742a969a4d0so2633094b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670720; x=1748275520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWCYVrEOdgn0YXXrxgnbqeolLsmmtMUaNpkzWfiOXzk=;
        b=BuEdSc+6Jfh/h2w0hXYf54gBwXqJwRZpXVfBpBvJmbW9HBN9Q9qdRuAaorV214Sr4y
         FUBT/+f2SQzy/fBgynYQ3lACLFqFQN53t9s75bYHYKSdnXe1csB9DG4fhGb3jXX+2nJc
         WrAecaM/xarkHDfowudQFXZZFJzykDk5lUu/as0jhgcF6hwqzNR55MfKiGf45tpQ5qQC
         WyALCHJOhGA0Xdo9ia2q53vaM4jXuuUqWXgpIP1bTP25UB9kSZHkoDqqEqRHWL6VIjsX
         iXVg2pO4V61wAiq+TEAQUB/NqOnWolnOHk3/gp4Ec92ghZuR1MfpxqeDA/EtRCPsZVnR
         itaw==
X-Gm-Message-State: AOJu0YwCHzmQ9vTxgB8BmQfhr+qYcvGRgPhSb/mukGCLIgYkRAlvJKFG
	l6xCWTjJJmy+taIdnOY+LEVkSN214cChdKFjTFOR5QT13refcMDqhnju+h0ORuFYSlwH9azgM7n
	d5D0vtSgqrN1P/XnQMD/4SV+5HF4YdK7fqgJvXA7fIfv/VJU9GdAh0l65z6f8DFsp5mBn
X-Gm-Gg: ASbGncs/tJB/gDI2DoLBdvQmjlDM2iM7w7nOCQJT4bnKlRejgWEPV9D47QTDij4QuX8
	RnpLSha8XMk2Etu7t28d6TgLOoXtaSnoQeXHxtm/d+FVFNX2zvltCL546XgLy9T/rNOrGyjGzyF
	cEf2kWYTcQKP47vRvXDN5kqXJo2VQAsNMdwc8eDJq53kCymzyM0Z/XxVgOo9uQeL4XtPXrFpNRK
	jFCJYRh+tnxKmVPDB3PdQFL7qSiHbSgMH+OtvO+pWCvcC766+ivbsWr5edUcIp0s0Hh1sxH3pPG
	n3c/YwTt5qYJpQ4+NurwHbhakN0kzwnBn9PxlVW1QCVO1Q4wbBCVj8KZocufctEiMoOZHclyE2o
	A4yE06OVyijHz5sFT7c68LNML
X-Received: by 2002:a05:6a21:9183:b0:1fe:5e67:21af with SMTP id adf61e73a8af0-216219d18e0mr21996855637.30.1747670720443;
        Mon, 19 May 2025 09:05:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRGw+2xgpgtgdFOPHQKkmBXnPLv9iv9BYNbokVamaYo0cwZzI9+rfZEq7etlPcP7JKFvfusg==
X-Received: by 2002:a05:6a21:9183:b0:1fe:5e67:21af with SMTP id adf61e73a8af0-216219d18e0mr21996802637.30.1747670720058;
        Mon, 19 May 2025 09:05:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:05:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:31 +0300
Subject: [PATCH v4 29/30] drm/msm/dpu: drop ununused MIXER features
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-29-6c5e88e31383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dxmFi52JXvJ1CCkpTL5KufBplkJro3M21X2ntMDmC8s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z+0x0FUsHIrIe0Eg95z4tvJvjpvHMbEaErh
 VYR6GD3cX+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWfgAKCRCLPIo+Aiko
 1dGBCACT/MY/vz/hMHTlHhFJBlS+WzI1JAEi0dsryovjblh6D5tWPLnsfC1quu2IqIb+e0xkrKu
 cv0NJxNDDZFC8wPMMdvErAlhZ9IPICyuhAeGWpcSKRqxUiIPkhjYfVmYeZs6t2tgh4ZYvCl/Atk
 WsRltJdOxYgLGwEiq99ie+NLyqGPBQ1TS6INtkAToXrCuzWDG5Q8Rk27eobt9dT3Aq1Sozfd1QE
 3LVnBTyL28x0VRyIlIC5JpicKU7FI8v/D/kJawLOCcQie4QbyKT/+9CPWjreSdFYPlF4ti9S8PC
 OP/xhMBx7cTX1vxSfTXqXqAgqId3jZpDMMmsZ15ELCbIGYbE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: SvTZC8KRxPiBDqd6R0ElSy9fz57IZxHu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX1PcGzbf4jS27
 UgN5GoyxuO9vXyWFUEGtkR9WxXOklw7c67M95/zFcvIAjwfOBiXybEYwmNp1y7HaW9ndlRQ2Rvd
 r1r3fLzheEnWQGYaXVvjiR5rbZ5UsRqyRS5hMoqOg6pH9JsdAJse/3IoNcV51m5iXb3hz2lGt2m
 cVuYGHt2N+SL2WxIkjIPh/fdeqHtc4hZm/h8k5pt7tb4Kcm1z0ydyVjYbH0Znuy6VXscV2TSChj
 7lZtAYjb08RVGw9Fx3G1ICRI4CGbR4LjWPc5dEaQdNORZdi6mC2MSlvYEJFo6ZWyCOtvyhsboRe
 +UB+k7GfnkZ2/Fowb0qGHAb80rghTOF0nt7SRph88gvyAGGwagp/zhCRmy4ag8TbPcdOlADyBmv
 CPd8EbWYCYDTCdtp8ip9NfG0mW23P8d6mKXlFU7wavSeOgkclIQD61+ONSKfS7LAI1/2saJQ
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=682b56c1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=87smWpNc5u_ETeg062IA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: SvTZC8KRxPiBDqd6R0ElSy9fz57IZxHu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=899 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190150

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Drop unused LM features from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index c1488a2c160b0e2ab08243a6e2bd099329ae759b..d51f6c5cdf62f3c00829167172ef6fd61f069986 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -66,16 +66,12 @@ enum {
 
 /*
  * MIXER sub-blocks/features
- * @DPU_MIXER_LAYER           Layer mixer layer blend configuration,
  * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
- * @DPU_MIXER_GC              Gamma correction block
  * @DPU_MIXER_MAX             maximum value
  */
 enum {
-	DPU_MIXER_LAYER = 0x1,
-	DPU_MIXER_SOURCESPLIT,
-	DPU_MIXER_GC,
-	DPU_MIXER_MAX
+	DPU_MIXER_SOURCESPLIT = 0x1,
+	DPU_MIXER_MAX,
 };
 
 /**

-- 
2.39.5


