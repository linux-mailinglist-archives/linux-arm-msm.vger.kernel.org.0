Return-Path: <linux-arm-msm+bounces-59132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F73AC1473
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 21:13:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AEED17D537
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 19:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1D62D0260;
	Thu, 22 May 2025 19:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VGHAVrBG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAE52C3758
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940696; cv=none; b=G36MGkg+8CalL5UObTaCk0VQZcjRSKTk3FbbY5GMopM7QL4cf+iO1ij6oit5kFhIjrP1mJc4mqviwUChloTmV8i5MA+eDWDw+O9moJ7HnKxj8V+igQ/cJsoZ3RUIO07Ha96F54Be3cbbsokKl0j414eY2EtsccW3jr1wtEknXjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940696; c=relaxed/simple;
	bh=ibKOgjGQZ11AcZvbFsvu0iYGPczKty2vE7hmEiwseJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DggNM4OntpCW3xXsaSiqSdTKKP0KrOD/alygbc7t1oPDzQgqKCV+fk2L19aDP+jGwoUdX7SRppj0EWOtRkxFkc2Ub9GCbZSkIIzi5c4amP9RjVtSUcFvkZCH8e4PiUychqkkdLKW54/KREzgQv3e/V5nSa9eq4ZCMd4sacAnQOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VGHAVrBG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MFSxvm021016
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W4/Qfodz8bj1FCYHz7m5/3J+a/eyf1l9HdLUh5gFHY8=; b=VGHAVrBGPOx+zKvz
	JaI2Y2wZGDchlKGwG98wgJ5W6cnC9wK7Nj8X7KRznsghjrsCGhQlg1lusGlCF17H
	uF8ND3USEHTcDiVOGDtmvTmmOvQcuwRWHKqP2pELiKqoPhXwAeazB7kMvmMHMlvU
	+AejUkrCKAbVcg7YcZUtBjr80tX0Za4HUArVC/r6DIuvbeEQsNoLBQN5B3tA/ng3
	FcfhEt3WIoZ3RU0gWQGBFwRAHeXkJ30xzdmdJVaCzQn4IF8UzTPnB/iQa9liUm2g
	6YAKHInh83pYtCv5aG6NejpOrGnyco5tDAqOgCw6pLK1bH6QFQ0/1RFHBwCKTnf3
	Hf0Lng==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf07p0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c9abdbd3so849527985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940692; x=1748545492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W4/Qfodz8bj1FCYHz7m5/3J+a/eyf1l9HdLUh5gFHY8=;
        b=Yaw53xiAgE8dSVjUa6gzLd8t73qXYt7L/WRYhpmlctD8ddim5nTWU8odZJLzhtKYJI
         xJUXSt2rO80f1SsCNewPIKVfyWsBCkfiFPQe9iB3PPr7r6SxrwkYCl9WNy6HO4NB3IJR
         0W+anxgvJiT4LV4BgwAsZPb6pT+FMA7AyFXW+B3EQ40U73pUhPr0kZKAFH4lI5D5vZBq
         vsM5yvDQNOUSZRkx/geNM7td3c/x2Fn/MQiTkfcO7OphBKa56hyOby9yOIBSBdakcq0x
         F+4uNG8jQpZssiyuk1mln2vR8d5lrP458StyeQkSKRVLwhYwGchMZUZ8idxnaDJOH1UA
         vJLA==
X-Forwarded-Encrypted: i=1; AJvYcCUsVJHvLjIKGOevJo/0jK+VUSv/lb/1cfhQraVNZ6d1xG4hAKs9wU6CHcjVZfBugiIyg2eFZpHqxqMbD9u2@vger.kernel.org
X-Gm-Message-State: AOJu0YzrRub1mX4cZMTN4nA2iiIDb87BAQQQjjzy1XoupiBbzU0z2LuA
	DPYfwEUFo0KRJbRI6jRKdCw1nOeY8JZnUpgSYdPg8uHj8oTSF1QJ6rj6IaN/Dvyc2koHi+gGjVm
	fs91z9YoGfRYqu63+UHieAwu+r/7XYFJSWEgr7+dbkh0c9f4VUrGzHU7YrkIomED2p/RD
X-Gm-Gg: ASbGncsOhPaLZpiWF9WSRuIilMlUc6FXh4ulBxjzHaHMoYGhtSsFuMH3lBhZiO7AKOa
	co07wYS6zsNkC/cgEkIcTh186EQXU4PG4gtIEUJ52Gk5SCaeJGBpCPsGTyNXdHJ0CYpIlKViAtz
	eAoXkITijaobIik4x/e2qXmIkXIzczeU5MgWHENUaadfx0mrE2U4O2EX7nCvG2tveLysR5bbXT6
	DPPzmKcBLsV+jxPJaJocxMB9jtp1Xvkw/dDZm5BIIC9iMgvZcMyO2t81NAOwRye9NiICO5qtNE1
	YN0U24iqTo2tVeCM/iULtwrg2aK1F4/kTn8Idy/zpyYS93GUJxezteJOAKhUll0p5RCXM5brAh+
	z3P1E7Ar0JtTagWDz+UDyPTzg
X-Received: by 2002:a05:620a:57c8:b0:7ce:b495:f16d with SMTP id af79cd13be357-7cee3280efemr4748985a.58.1747940692343;
        Thu, 22 May 2025 12:04:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqRioajkuCidRLbLqoNubjYsIdX2Y5J5RM0oBH+NxvXfHz3YVH64rHn5nDHQTEB2YD4x6+tw==
X-Received: by 2002:a05:620a:57c8:b0:7ce:b495:f16d with SMTP id af79cd13be357-7cee3280efemr4744885a.58.1747940691977;
        Thu, 22 May 2025 12:04:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:04:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:47 +0300
Subject: [PATCH v5 28/30] drm/msm/dpu: drop ununused PINGPONG features
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-28-3b2085a07884@oss.qualcomm.com>
References: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
In-Reply-To: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EaiNnpBPJ95aothOcinDztqBiGxffsBsh/dQfmS8ZxY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ4Z+KcON32+01D/bbm9bdCUvsX5HYu2lR9zTJT7FR+54P
 r8lfW5GJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAm8p2dg6EpRDa560Z4haNQ
 9AkNi/X600/3malH8m5tK9eQ+LUkYUPn5le9xzwa5y84emjnXk0Ojct68g3WacJOjBsllc8VzPv
 z98nxQy1Pi/zFo3yCzjQfz5+x1LVc+PeqPF+u3d/svs2/s1qp+pd7fcDJqvrjhgH9DF47w+yF9D
 pzX/dJb7uq+z7RkGXZ7JUSm3Itp7v9cdtz9tHU4CnzI5T2p/6az7TPKLarIdGGpVnU53bywb39E
 lt/lk1si7vq4XHxT7Cf8ZHs1j9tS2YzcIo6lbBlasxLtWMt/NkipWfwaRKrjP9xiZPPPMQOtTZU
 /K/TUksJU1j5QtC3YatcKGPuo6j0eKWgq8VLvLX2WBoCAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: tMYYXJ87kW3KPFH8oTJ-ECpPtrGPFchG
X-Proofpoint-ORIG-GUID: tMYYXJ87kW3KPFH8oTJ-ECpPtrGPFchG
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682f7555 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=UzLktXvLB0hFtr4V4nYA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfXxxeneS/sD5cw
 3FBE0pRrMteg45Tycj7K2cqt4NVosGupWjO/85AX8/PCO93pp3wSr0iJGQ71kRpKiQhZ9IYArOg
 Inc0cbPQgLx319GELtThH9Y/atgWfscYTN9IldLM23UNSHxFeTgZY7HL6aJFYVTb7bx495YWKsl
 TycSTXXDt94RttwipHQ0EdxOJOcWSraNYV9fo7wSann/RqYaNqcP/wb/XOHuByP13AF5PshalXF
 k65MVMTU7PdV4HGSEoM0N4nMcBcxY88IjBPwQ7L/0zPLmCYCSURve87Vz7Esyr6qausHIb1K3oc
 BBUfh79Z/A8czrXFlXQm+MOJ8jq2YmA4wyLrHWsbJd9gGg2y5FokixOSjnpZ8r8hey8rLdCTYWf
 iYfNE+rU4pT8V7KrmUgKJLKX9hnmC7uFd6zkSlrZ+NJ4Vj0KWM9/Mki9xtl8n8ts4yW7Tpgz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=887 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220192

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

All existing PINGPONG feature bits are completely unused. Drop them from
the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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


