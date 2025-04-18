Return-Path: <linux-arm-msm+bounces-54710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A133BA933D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 09:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECB197B085F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 07:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1CE26B949;
	Fri, 18 Apr 2025 07:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eCUqwk7W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D638426AAB5
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 07:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744962612; cv=none; b=mc30PsjAAWS1a5FLkkzYtqKmkB4dMeTo5WzkQkItIyP/I7qrONKFhQBa9kY36cax3mNpoH7lLKycK4S6cyeZNp4KBLio07N753+mr4wQti5oN/N/BM4DxTtpmms5bqBx5LA+zXKYmbvkMNu+HMyudxgDQvHHrEjsEwf5DRpM8qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744962612; c=relaxed/simple;
	bh=fR3qQKGpGRxj1T6vPpbffnYHS20YwtNTdXiSdKBpWug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HqYPwFNkwBQ+XByK9hJzfMrkQ/LlrRwqYHinIvGm3yGDNK9C24iiMwY8/4g09ah9KcW9CYN//FEWIhcJyi1va/uRbr3rId8qjatmImZzl4i0kMn0bs0UX9qVa/bdxLq3g9emSRTdUGhPmsJZ7T3vqrT/4wpXB37eYoeG2M+lRyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eCUqwk7W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I1xHMa013336
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 07:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BAFb1O+Dpw71ujShOY3u1RWTe/53Rsuu84mfXeGabe0=; b=eCUqwk7WrldP/479
	+zM4v0Fh1pXTuc4GsMAqJyIuMvJ3xzsCQIPfNxFk/N8AA/sT2xGygz9P6Wsq/gYA
	VweymT92btExAPH+x+7NnRxNsvnUwxKozHbTosZFAIaoWOJResR1+dUlxkORzc5Q
	MDP5xX4ghYInwmeR4Jrn2BKymw7lLqQ6IEbV1mJ4AK8YNgQBbdHFijBav3DeLq3r
	PzIm8n6HV3qshsBXP7KWN+2tlcifrRbtnYWIHn6e8ioDW4MW6xzI0a5Qyq0hZ5FR
	J+/Z3Q4MdZnibrh+Czvn/V0NfyIbb8A1AttQYbmg5l2G+bSt7/xT12xpQPBCbSAb
	08exMA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rvepef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 07:50:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6eeb5e86c5fso18332546d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 00:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744962609; x=1745567409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BAFb1O+Dpw71ujShOY3u1RWTe/53Rsuu84mfXeGabe0=;
        b=BXKZDXenwWZNmmkLVOMUG29uhI2c6UnoOGFClndNolZhwt/IjJo5PF0icKR+9NeJc5
         TLwetp/d83c+v5VgFcr8ZOJPHnyKMbzqvle7CPWW++PL7ogJt0yx1a4Wk11LgApUxQJY
         iZD6NpGuAJFpnhAEGQf6+sA/vu7Yo5kVEB0kdUaPWRliVb9Q94L4fiG+ZkObHBFUDHJL
         RagQq5a9YrWYFb5OjwdW0FL3Ec6No3AKEoBbmo2Z4AEQ/o2vozrFrvEwtf8MNUwGlbKv
         Px6/VGOUfSA8EBplrROOxKnnCyrleB7VlmAJUxFEAzk+75I8JlHUye1VaYpNSfRGK/PG
         yrgA==
X-Gm-Message-State: AOJu0Yw4XhmQA5ELoVoHENuFta+qUNGPap8lqTr/CYQRRWj/dP/HzQWH
	+TR+wPcOW+hBbgVftZGX4xOdhhjepEMbX6PYHdz1BozEGolJhfSb19pHvYy5dFSTOpCYYlszpYY
	MGkfdl+EW4gNFjBpzlAXcoHEh27QVTkwkLenjR6zyEwlUwBs4QQdO9yWRFNd//IPV
X-Gm-Gg: ASbGnct79KI680uuvcYjjuQU8hJcynU5daO4flWmfYtTPyqqVNKTvdugQ2iXtk0jSvb
	nhEzCM/+fIzO6wvTe5/UNWbJc0Jk/r5xuo7a/9Mx4126T4FgFE8CRfGnFV/dGg2Y7A80zx+7ZNU
	YNkJ2R2y59shLqCnfRV/mBce/0caDswOLUlv9koBtYA88K1zOH3l6Hmw37ciHHlmQzySWyYtQtj
	cyMZyAgTyZUJflJJUy7mJRUyodB1AjsFqKcJ1RyOB6ZsjDeqGPuQQE9W2qNToqnsGSn+tp82uVg
	saEYwh0b0ZKWYEY5r23Y2mdgaUjV0+KiuJS4vKuneDZomd/hT9LJrUiElrqHPwDIexR4+/GXmH6
	laU52fTJm7xXPeIdOViDTJXgE
X-Received: by 2002:a05:6214:21ef:b0:6e6:684f:7f78 with SMTP id 6a1803df08f44-6f2c450c0d2mr29779626d6.3.1744962608821;
        Fri, 18 Apr 2025 00:50:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHz8iXx7BArXCfbFF5WR9Y11877tVEpzeAsMIuGaYxGT6K7Hu2YW/N+89qedFyXXOUKUoeC4w==
X-Received: by 2002:a05:6214:21ef:b0:6e6:684f:7f78 with SMTP id 6a1803df08f44-6f2c450c0d2mr29779196d6.3.1744962608446;
        Fri, 18 Apr 2025 00:50:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31090863bd0sm1649061fa.113.2025.04.18.00.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 00:50:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 10:49:58 +0300
Subject: [PATCH v5 03/10] dt-bindings: display/msm: dsi-phy-7nm: describe
 SAR2130P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-sar2130p-display-v5-3-442c905cb3a4@oss.qualcomm.com>
References: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
In-Reply-To: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=939;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=azlck2n2u+qrgsVJ0BAEOEuqH2At8nKdcftYTsEljlc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoAgQpQDO1q+LuOofVd8cYcNAfql+KVE/DX3iMR
 xSQGoRbh6uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAIEKQAKCRCLPIo+Aiko
 1XWaB/4yaWBeX7aw7qlpH3wBLgGazBiDKFtr28dA3vc/SLFaX8gcTWTpYVyZrf9HiwpmRuZjUz6
 9tikLOxqpdjAQaivugxlIoXLdi+NC+AcR2wm6L0vq0XstGEATNdMQnxylDte98WCQJgGOBpIcHo
 KAEnZaZmOUVZUdma+8tysEIbTKDjLWnwMY6A/qPHWNUTuw364cWDf+Fd6/vUp5xO24zufNTD6V5
 3cBvpJcTuWpl/BytPFqQIZKciWjeM/Y1fGT1eKluWIfx4RQ46ZP2ODPJsHCjjOOHBBOfIf6StI1
 c0Beh2gfpnDBwnCsXMAf6WwcSsR5/U/bUSuYGsZP6hqaEaLu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: ERCNdOkwkQ9Pm5KXCfuPLlRWb6JRnJkj
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=68020432 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=5g6dqdCWcepBQtZB-T0A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ERCNdOkwkQ9Pm5KXCfuPLlRWb6JRnJkj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=929
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180056

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Describe MIPI DSI PHY present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 321470435e654f1d569fc54f6a810e3f70fb168c..f79be422b8892484216b407f7385789764c2de1b 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - qcom,dsi-phy-7nm
       - qcom,dsi-phy-7nm-8150
+      - qcom,sar2130p-dsi-phy-5nm
       - qcom,sc7280-dsi-phy-7nm
       - qcom,sm6375-dsi-phy-7nm
       - qcom,sm8350-dsi-phy-5nm

-- 
2.39.5


