Return-Path: <linux-arm-msm+bounces-59133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7645AC1475
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 21:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28B301BA249B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 19:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39ABB2D028B;
	Thu, 22 May 2025 19:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XnZgKkb1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C7A2D0261
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940698; cv=none; b=NOSUtI1UGLlufYqMK0yKp9YlI17yJXZwDj8OWOwFmD8B5NGgrXwF9RmolIKT32dv3o/7a2eOIOHxWyhZmFDUk05U+qsZ8KQNLoijdBwqxI7xd1h5zl1BZ8JlPl36iH+AHGZYGg6EMw06soMTW2OMM5MBXnNsHzR5ORAvZKpyPhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940698; c=relaxed/simple;
	bh=NNCVFmfEoIQ/1ZOAg0obsQPIEq+KdQZQAG/48UpyygA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SrEnqKfaLvs4QpRkbrGKdBrJk8YmlP7kP6ynwv25f7cd3cr2bPLZR6nIycY0A2/lRxV330l3C7JoZ8yZacHtjFoqsvZCN89az62vQhthxtkdI36rSoXait2mqRN5EIy6c3RvNr+gHIr6Wo9AVfOMn/PUGwp0S9dIvQ346Zo6dFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XnZgKkb1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MGVa8S029164
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jnOg1M2bZC9YlYkqITQA3w9t/g70zzttTgLTdcMRUEQ=; b=XnZgKkb1y5kCdNSE
	DDCpHhfHzDETU7Fc+uWpW1f2BnDyapKJhLGf4bAqOi3nxv36LfFth/LyXViovxpI
	Vay9jtGoq5Wmuwbyzeiw3Fb96oJafy4H33mXEKn0C3A0TJGxR3j2U7HEUkXO6gPs
	XfO5RhlvEyeTfw2iz9phucwQ5KcR+M4I4rn9WEsg+1Sqirrqx1aNofM9Y0VuZCAn
	7p3dHDUzr2SOeESpyUsGljkO/ydL1qc0g77ITCovFp5XsRQATDnyYg7gVFDSpgfT
	YRfy700/cMXK4WjSBfrCCNAKlwyebbnuDU5KsDc5Ga10sFOECJFgaIzoN5wPXJpY
	sVw4IQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf47k8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c955be751aso1483958885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940694; x=1748545494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jnOg1M2bZC9YlYkqITQA3w9t/g70zzttTgLTdcMRUEQ=;
        b=uST5ZNg2Xzakm2np2WaCOMsQs9bnDijpHvcfeXXQX1h6hMvJb7AJnylQg6U/iqNnxS
         HyCe8buL9tXKOiI0Njsr0GjpDOTkZqIQ1N1LWMeIzixbJotsusEzZKv7A5jeuPoXQJKM
         /lKEGF/iPgZOHBCDTQqycLLECv1FtNzqCy3hPiEOs5zKcAnKFQy+l9BlG9S1Xib5QcHR
         PXJT4/aQnB2q1aSWpL/yw0YBjTAPGolGiyt3qWmQusS0eUgLFEdLUn35MGOv4TtPf0NE
         2AMqjv/YNHKgoWKEuJ1BbZg4scpPofjqPi6h5uS7+/TOr0NPpZ47+Im/7YORnUvD4sSp
         VcJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMgI7HMCZ5koUOCNTJItkcaJ35AiS67rUpToJXtdwXesD5Aip4VyHKPOriUXnX0vTMQi8NGBDBIrN4wGvL@vger.kernel.org
X-Gm-Message-State: AOJu0YxLXlXAgjg/Beccy7nnXSJcjMugqTZnrvTI6MQOtnXcxxLmBFHP
	ddSQQ4gYwRtJuJY4nXNPH6dxtQOsgsvXaJy8i1JHoDKqMmSnkZzzJ/kXugUdLUPo9EDzcrXnyv8
	914QjVZRDcynpYQ+UR67yCd7yIE+YESfes5g5R8Mpxxz4HpTUtx/j1O2Kpswg33CwAMxr
X-Gm-Gg: ASbGncv6r3iVgrn9/TNg8uWqkXBFVpClnXpa/x9BAngG1Tt1JgKpzJYnYdMjwwYlGrt
	ZhK6g0z7pkeEJdt/XF/dsVTlqJzw9/Q84xFPP+8L3Z/yLm3Ght5jcuVDyTCU6ZdhrZCMWhtE8sh
	nXgAm5Y2dGPOTkDTW0LVaheShL3v/XLQ6aZCszqmzGhYlNc1P0ZCwrOxYSMcidTDY37vnBJtC9y
	iZo5kwg+bQi/aqh221N9qiU1gT53ec+MyfLuBXkPstMXxzgTKmGMmuYJHImNeS1Mgd2+mAClRob
	i17h9GDtVmqkPd8+kp1mitYf25LLpJlsrTiDXq0OWQJhTnZiMK2J5qefL/EMgPT17VOCBw2k+Zb
	XbjM8uE4LLFq9gLNiS44Ba057
X-Received: by 2002:a05:620a:400f:b0:7c7:694e:1ba0 with SMTP id af79cd13be357-7cd4677d294mr4167212885a.44.1747940693808;
        Thu, 22 May 2025 12:04:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjcLc2sPE5Sg0jgDhOzm+gjAvrwhMlfl9yw4J/cxGCECts0yRwpyzhheSdHFWbTSgZfN+8qw==
X-Received: by 2002:a05:620a:400f:b0:7c7:694e:1ba0 with SMTP id af79cd13be357-7cd4677d294mr4167207085a.44.1747940693346;
        Thu, 22 May 2025 12:04:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:04:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:48 +0300
Subject: [PATCH v5 29/30] drm/msm/dpu: drop ununused MIXER features
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-29-3b2085a07884@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1176;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pxAdYTmaogRQHBMvHaDa09r4i4VRhS75YE1TSgSsEq0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3UAMR8c8v1LH0Q5G+F+m4l8MrzYG4LWw1Z+u
 LhhMQ4xUX6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC91AAAKCRCLPIo+Aiko
 1eScB/43JoU+oCxhxPw8J8RbiyMcraZ8IT3l2HsG6AYvn7TMPCqdkAlbM47zI0Hir17zhVefYZz
 yKxNPG4vh9+fnzoLUr5h+TFrwVUIAz31mzA4TE0+t9libr48MWMAmWbDC8YXTeu2guOOg14LeJs
 2eRmxS3Qs0Txcd77G55RudXbmZhbgd9enJ+tRiT0+Osjoj5xBMYPK4IGa2B96qtX4ZW821QuRmb
 VuOLOywiyra8uqmdVYtQSXV64wDBndYCC7ttalKBGTvUO5vQYB2GgQlw/pftMqFHMw5ZEZNjcXK
 gfI++5ls+vfXoZ5U7Nhq9NwmxAKqzrMnCIWsTLRZb2GQal91
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfX0Imn634gDkT6
 K3sngBovlISYE15QDG7iYllem0fEoj20nFoEYj0BH5J2qeKZy46mmzrFfMjZUhqH0Ar76gOC3cI
 C9tpLzBNlMwXUmwH/rIR+Q4wtB+RT2EXOrJmzufVovzPWhF2eBAgbyKMlqPxlP5194RTv6TB4uI
 q5ni3YV7nrntY2OL9N6mG66cgkaAG6CBhlN4OXEC3lkLtY0XbwcQxCNIwcfple/WU95xbQwNh8S
 K8gjTtgGcoH3ctt/bfNexuDcZPWIeeNZsrPymrC89gux62dWhNNkKa2bGyabdwLn+zJxcbnF1v1
 vrbqfNiJmfdVm9bFRZMejyAl950/GGUD1tZwAawItasu+b4J3rQW1dNsrBdIwnAbPoQ7GPmGOGk
 uhsp8haE6dNxq5Kh2Rqno5hlxOin/Mdnpq3MTilT+PaOIqlvJf1KkAO+2JQJrGLAJ58An31r
X-Proofpoint-GUID: bGrgU4vdI64bs5mKFwzibffACdfT1UIp
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=682f7557 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=87smWpNc5u_ETeg062IA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: bGrgU4vdI64bs5mKFwzibffACdfT1UIp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=980 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220192

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Drop unused LM features from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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


