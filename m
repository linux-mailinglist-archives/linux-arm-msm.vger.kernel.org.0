Return-Path: <linux-arm-msm+bounces-55220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6616EA99A7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 23:17:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AE45460227
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 21:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773102BE111;
	Wed, 23 Apr 2025 21:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i1nudbFI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF57293453
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442689; cv=none; b=eLiHkqhjDXbZ7AYlqPB/815TLI5FhlMR78GfXkHPj/jfzOQrXJf4lDhZUrg4CCypd05ThQ/Ezu0qKBllHZyOWhcM+WdQ6xNgqzUjbEzGEX1Z7ufqgX6JOjM0Pl5DXTIqMC5ygJNlg3w1sjugrh9p7xIX/pyT9jYjT8iIKwuhY+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442689; c=relaxed/simple;
	bh=+r9MMbxZ3ekxD/2ICqlcudFe68TBHlQKa7rixk0bnbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZjHAm9lsifhoSwyyHt+UJUPBd9VtdZhLFRP2FK6DpyijYkCg/38CJOHihlFJSQmtxZcpDmC43/niVFJe2GxOvM50EYFOnazHGS/hI+eb9iFacKPdlB5H+rEpGvebVIQ3nN/3OkuRvckKzRoVeOWyB4fI2oHFc7ExDDdq/BkxBHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i1nudbFI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAYYon016850
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:11:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7juAG/GkF3du8/wYABYn1XxvOib8H+R8fcCmEsp2kaM=; b=i1nudbFITywtFoJT
	pjqWvw17B4rb3NJb9k8YkMX35vF66nelsxDIPIaKlrhG364AkA94ieT1ShEGqBZZ
	Ze1KeEFN/2VoQBLtj+jS3SS3MXHAWR/C6VHGyLyqBaokfhkMhFns/OEMj1rAHZdh
	g2Szjm8S+ESi6IDRzeWcXRze3lLNnsVh28/J32jqD19xfVk/toqCdC5ZCzwRdXdj
	T/53rmywi8E53sHN1xb4auVNffhtSUr92ZyyB6ket3nF8uCvvyZFY3TL4R+B9Tb7
	xOG9WP+dbHYa+bc8QM2vy3Q2Qc4n5zn4cvNhNF60efjos8x8bBYDa5YH3FTaPhZr
	dG5Ekw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3kdes-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:11:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c793d573b2so52988985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 14:11:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745442686; x=1746047486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7juAG/GkF3du8/wYABYn1XxvOib8H+R8fcCmEsp2kaM=;
        b=CX5E9a/v6XsMHnjoXnztvnxi5imt/8UQ7AZDMFOjqCRYA+C8ILDhk8yzxj/dfJUKdm
         Xz8klPqMtI1LMI+7SvRB24iDRoLoNgiB5V3b5aJoKavYHwICMCcFtA/oB+gzyeMRhXgj
         3aH7f5S3w2Z4hgGoMMrx12+2e+1rhvnL/a788cPmwATNzKfJzwCL+gzZqiEVd6t7rkqt
         YEiMRRxN/5IU/HJD9EPP2/OI/Px0zskssaqu2nfgySmLwLqFvor+d2tgGa/yyGiF/6ch
         8AfYxaSapJB5hLx+c1Wns1vc13rj3B1M4zYIYxTOlagXqLgl2/uieIk5UjGsbam84tCH
         ou5w==
X-Gm-Message-State: AOJu0Yw5RjwYjCjySNOfDa63qwMm+qx/uowH5j+nkaZvJsT2byIw1XF3
	NH/v7Ok+8q3mW9qBAPj+FFiW1KQHQXnUy+DzTgbNJAa619+zQgwfNbp/L5UXj0YEomp1KBYUtO2
	o+AYGMLpp1cqUBcFNAhw1VvG84/hmjh4wxSDDE6u8QxWm5uSKMCajcBsDqbBoitLI
X-Gm-Gg: ASbGncsTwEUZ7oXLvgy1APLESBzw+sdloNnwJtG9wVoQJW98WtZZlO6+CjmZqsiRgON
	aqBrCRf58DsXJVyk2ccnZrSw0qgcqjFKpHgiTpmiB4SGw7PBjvcuUHtkrcztg6Y/A9/+7+srD5+
	lKpW62E2ujTgwL6mkH5JtgLe9wo9H5PBfm47RZoZjwEs37bh6OJWKRYU3jbta2L2d8+KCk1z+Bp
	ahMKlbWChAxXb7jGT7ToHSG/+becd1WLcFrwiJ8LK+IaqyT1xHRo0fLWKgmxZkpGdWdRUpw/vmw
	Myc/E1nh7pB17hpzQa7P3XTIKwTLwpVdDPCPQkEW6A7EF/TaQU5D4ivrrSp5bInm6phgl6HiXie
	KVLgjjNv7cYb3EhubyQFrVccA
X-Received: by 2002:a05:620a:3181:b0:7c5:18bb:f8b8 with SMTP id af79cd13be357-7c956ea98b4mr47852485a.1.1745442685992;
        Wed, 23 Apr 2025 14:11:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBiCLzMjle0UO/afRLR2+FdbfmRTBHY4/qAev7T6DsOdXSopPHAINyFixXVJzXLX325cROSg==
X-Received: by 2002:a05:620a:3181:b0:7c5:18bb:f8b8 with SMTP id af79cd13be357-7c956ea98b4mr47850385a.1.1745442685607;
        Wed, 23 Apr 2025 14:11:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 14:11:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:25 +0300
Subject: [PATCH v2 29/33] drm/msm/dpu: drop ununused MIXER features
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-29-0a9a66a7b3a2@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oq1wDHFI9F1rM8Vg4jlGeQy7++4ktlgP1SkYjPIrj9c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcurOQwmw4mipyLk4xtDigIfZZRv3wsszemX
 9hk31N/tM2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXLgAKCRCLPIo+Aiko
 1ataCACp7q5C2z1OKTIZTteRTOMWwwrni7zhoxTCOn6yAO8b5EEyhXosAsxOTWTVc30mVVcdep/
 2vIpet/BP0REXC+2ZMtja6f+BagsNXHyjhCR7hkTZDti+d+ME2kprZUzJkEB0O8Wc1ZvVDPpXlT
 nOGKpWe25Zm0CSa1pLNT3R3tr3CEn6TA5r+1/KbeQMOyN+7BHEOcPl59Knnw6J79hU8H1/myYS2
 X8MaQQzNhWqbewDxhXC8MK1AoY1qUmbY7CsDOzD5aCgvEP9e9ahwcwrb9b0Q75Rq7WKvQ/HOxkZ
 uZIH5aQdmH3Am7P9XclOpul6PuwPWz3R4Bz9L/c3sqXgVyZE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: UtzxGiUFWoGvlBhEakT1FLpyH3Z1jVdD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfX/E+RQmXhMtPx AAlGUgbJYCdgc6ukNsl5ufjJidglkF3KTNsrscubnIoL85m0j7g+1enxWGaylMnLIq3EOqliu4Z acqLu1SW09lp9ryaMY5C5eWw8+Wl3x75EkrcGgRg3vwNvcRFnhxnSEPFfho5M13qEG1/4svEX0Q
 ucA3tErkMQhvGE5vEt6Ocho0u1XQ+liLLEpL/dQ982tklJrW4taAupDWw0SJVWasNzsonYzOgXj UWjPRU/v/q7jWCm99L0njLoF+xtE2JnqwgR21HhRsymFcyPDc6gLyxnEB18xplvQ0/0wfh4HNSG ld5DrTxjjnEjEGhMpk3+z5z1628deGVEuWFhrMQSStJVHK039EbhO+iSie5snTV28C5zsk97F92
 Spgf/LI2yX9j+hxlnThYaD2kpgZhkmEY/+ATzxCjwF1ZfbPu2qx0OZvJJC/FKKGmQpy1eSKT
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=6809577e cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=87smWpNc5u_ETeg062IA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: UtzxGiUFWoGvlBhEakT1FLpyH3Z1jVdD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=911 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144

From: Dmitry Baryshkov <lumag@kernel.org>

Drop unused LM features from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 5eeb693f0e282da2aa0e5a729aed1bc8573639dd..beffb92adf5d8a150e049811bf2caa212dace1a6 100644
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


