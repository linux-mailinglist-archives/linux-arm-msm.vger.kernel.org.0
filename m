Return-Path: <linux-arm-msm+bounces-78477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F05F6BFFC91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 938764F487C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 08:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628C02EBB8F;
	Thu, 23 Oct 2025 08:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SAis9s7R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C822ECEBB
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761206845; cv=none; b=soa4qdtoX2JB+v9RVy05hCgSLDkseOJQThrmyviHYFD6gROjifNpQ4Ykw7G/dNiFIst82SIw14PGhdigEeYLfXxloPMS2ClFZ4ISlqDjM3QQD48gq+7DRpjw9+IEzRrm7C3Q/tSWr7M7QQfjBu3djlcLB4R5awTIrIMTFGO8gX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761206845; c=relaxed/simple;
	bh=XuQFnu7F4RVE3LuHmfWSqqsq/q996mRXlrWDjNZi5hs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jUd3J9fAK5E1X8cGD9/wARR1v7Udn0zexDrmkMCI0aOd1XLNXruD4asbh59+9ATsnv35Wc5TzUPKSgBpp3YCbzs5Gffwqi4rcRoSrRXlZqrVg+MyIofedDJ4Trld9hbiFgjQujVU94WOTzcO9YWq6SPqXMzhkr2GQOQHrPvle6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SAis9s7R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6M1HE025796
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mz3AW50CZzl
	RHFBJ07H/zDGQyFPRQspBYOGzKP8xt1g=; b=SAis9s7RiP4SLohaR1jKE5gv3Vg
	dpCapo4DK/R+/sx8BHhnFBgQu5xlP59mniIkOVOg5REcVCe3VL+zMnvCJ9Av0GF/
	IpC7M/5JapZAih/WCqhPllYhB0Dv51ZPx2PDYeCuta4rj+Z1iEWIjxkg1CKGqqNI
	QdXcqXNV3gwLfCNVWXQS+HNc6oIyNOJuXMw37zGhyZP4F1gSEQ1ltqjr7yAYh7CQ
	CYCzPDZpT2iIvR+pESQEQmP/mFc3dCe2FKlQ5lbKvZ7juYpemhTS+bJl1zEF84qr
	ia+GOlhMSkP/YYUx4yFv9sLXZlfWr4R3ZAXty6YfDQfO4Su7BQA0vFVk5UA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42kfcg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:07:23 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6cff817142so95767a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 01:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761206842; x=1761811642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mz3AW50CZzlRHFBJ07H/zDGQyFPRQspBYOGzKP8xt1g=;
        b=Di+BrhbwlEJVA2zeNvO1uD4rECyChVwWNdvm2LnKHJas5dZNijF3wVstnwZ6QEFKTT
         m45o6f8bHhAxoQvYoUdrNm/fzM9XqqweUa0sWI18tRHJbo5ILMrnDnNKAYFlHepS1VLI
         3u4Z3rttAkaxQHDeV9d4iV8eZ6vbeRf3XwwbSdlarMGi9t/RymAhAXF2nsPYL58z7WdV
         i8oFkIy7IXGXXwXm/lV+8YK3yLvwJFm1p+80J20x2gCWGviCps/8ouJ7lRTvoodfH6gT
         qJ4Io46FDTQXbF/RG78/XN6abKNfbNN/eLnKh4V5bGb+C60EYlIMQT/gdNduc6KMpFEs
         ZklQ==
X-Gm-Message-State: AOJu0YzY66xfVagb8afXI29iCYE1KdcvGhsh6WTDUtxkoCxUR+rr8uTa
	0bz82MdCGMa0qzIZecMEV0Jc6bnDdiYRZiaypVBSIdp4nwOxD0Bku/p15XJv7iSev7Tv56sK6pb
	h+MV4s95Gn4OqY65E02vx575/slGENtUkTy8mtoZoNMn67hxfZPGzwpAqwz6jHbmTWKQ9
X-Gm-Gg: ASbGncv5LJb8Kg/GfcSk8WbWw/xjj3xTB7mXRJT0aF36BD1/qGdJ/6ki7vGO/EQ61CL
	MdJF9u4u+j1SuR/cspDLAvu3/c3aCzuYdcTatw4c2UdloKOKTvYcWkAes5Di/8FfVf+CohZalpS
	5Qe1+x/Qd35+g05jtjLJ2Wlg0dGh78Sm1DOY+3YXkBRPPK8K9hV/IBXxra7KSOVMFJFsyG1HBZD
	SjtLGX92cdyKanLYbJ2KG+0Bb3x8JJ8AJPtumt66ZhzQoW6TtOxdIrDbEVSt0StdxMR1G3vEIIb
	Gpq1B9FAm70nzUp8b8wHNdo2ylh/Iw8XTCmtioOoM6lk5YR+xbQiOstzbGHUy5P9EYM4FIwTy52
	6XOsZBHjGCf89e7+R3vNNqOqQd0b2VdwBvzqJ1VfK0niDBXvGGA==
X-Received: by 2002:a05:6a21:6190:b0:334:97cd:26b4 with SMTP id adf61e73a8af0-33c5ffb11bfmr2223354637.15.1761206842335;
        Thu, 23 Oct 2025 01:07:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWOEGOBmMvhSpmnFUPZtvwT2JAqPOdlZF4Gxli8yHh+BpFytOCUKdhyL6VqRKtXouFki5erw==
X-Received: by 2002:a05:6a21:6190:b0:334:97cd:26b4 with SMTP id adf61e73a8af0-33c5ffb11bfmr2223310637.15.1761206841920;
        Thu, 23 Oct 2025 01:07:21 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274a9cec5sm1676410b3a.20.2025.10.23.01.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 01:07:21 -0700 (PDT)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH 08/12] arm64: defconfig: Enable NT37801 DSI panel driver
Date: Thu, 23 Oct 2025 16:06:05 +0800
Message-Id: <20251023080609.1212-3-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: d_dlILMAP9l2a8qP5e8pr5_vNNi3Vg2L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX9WG0phUBazo7
 hXCXo6dvi/5JSeE6/rV49CqlCSf44EawV5z0IO09Pg0zmycIz8SD5mUAZv4Je1ZJBfsi2hldoz/
 5iOx8iyyFvL82z8sSAdnVQKNWTyHL5WiI3s1sQWkkOPm40aPdP7dvwKyfOIBoSBmkVlzNlwGL7B
 Q5+zFyG/jMjlFHFgb4rizqdMay3Ci7JH3Jn9apNgdSdP3iRKZb+DU4eyBYrH5ooNi7Eto47S67e
 GBxNb2N482xeEFlLyakSB12ZjwFM5FP5Jdrv1NI+twy/v3tXsPsbpS3DLb/WVtI9MoOc+YZLzzY
 Z/iXnOHH5Z0ye+EYJagRDSWOi1kDrrCeIx3PIVmpsThk/kEXeP50fN5DfCrO4M94xKznNjnm0H8
 hOAyu4FZhRBApw/KR/qo+E5ZlpNIXw==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f9e23b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=o76S2ntNi4yxzKwJcEwA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: d_dlILMAP9l2a8qP5e8pr5_vNNi3Vg2L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Build the NT37801 DSI panel driver as module.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 8cfb5000fa8e..537a065db11c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -945,6 +945,7 @@ CONFIG_DRM_PANEL_SITRONIX_ST7703=m
 CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
+CONFIG_DRM_PANEL_NOVATEK_NT37801=m
 CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_FSL_LDB=m
 CONFIG_DRM_ITE_IT6263=m
-- 
2.34.1


