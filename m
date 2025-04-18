Return-Path: <linux-arm-msm+bounces-54709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A677FA933D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 09:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3037A1B608D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 07:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A4426B2C0;
	Fri, 18 Apr 2025 07:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PUru5Xpq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B78526A0E2
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 07:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744962611; cv=none; b=PMZrZoAWRL8Nlx7q98hdMpSikRd4dc3uPvxBOZ8HEC9sRbWGoKixXs2nFS8snzKQC5fAin5XXHWHpkzsMTGmMi/HvCqG+qTuLStx3m6yr5jLp+AMqqxhK+dVGc91zb6Tj5h0frqUOqijdIOtMRsp+fU5YFFoLgSWbOn4CHeFQeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744962611; c=relaxed/simple;
	bh=m+kBNHyiJhrtTwoJkF8m714SATfNjGL68rhyPmmLBbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EJOrTp60J+b0BIrn00IPEO42qN3ZCy7BvqUFBBWdhtMVAI3A3uwy5bppI+FEEdDfMNU/HrAB5LfzqGe+neofJs6cfM/rIYM+PJZhBfpbO7iHgT/onCJQDbrrhvI+rPf58GhqTT1PSP400eCVXSVc+r+0tOPvwZqg1i9QaMgUhcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PUru5Xpq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HMwPOC005848
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 07:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AGVPApRnv/m9P6KivA3acYjlWKhzKhS23njLJHpDY38=; b=PUru5XpqfqFRT08T
	nHXHpsDY+VA4QmDzbPrb5brP5c9smsNx5LyujGtOp/tU5LTKQJNIzySjOyXQ3rae
	woNy54c6BgotoSqLvCQU5rdI+IrD1L89soeEHgH2zRoYNLjSz8yZhvewKJVnUx1D
	K1vaJe0fWPvxsqf6BFUTeaPxd7jtKFUzOdC5h21iu14xQLKfKrPwGb9dmBV/j5Yt
	S9IDzEQGgG7Ua2AusjYOmxa3aAHyfpKpU/grX5hpqmuwS1OFYAwUIU3tZfekpKD2
	51mFG4iuBSP8c+4UzkDW4fxdnW/4M1ZBlUdDxW2chteS1o6Qye7mOeHYvq7jU0T1
	+cjEJw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvjhmd3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 07:50:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c53e316734so251543485a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 00:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744962607; x=1745567407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGVPApRnv/m9P6KivA3acYjlWKhzKhS23njLJHpDY38=;
        b=f2G3h21iWVysjNNvJbKsAIhP9JSPn7oF8fhNipqvhK7PuQUCHZ1/r2Sz9iCZzReBI3
         ONMTKglcr9CDuqil4W/n88LyXy7AjEeFViWuMbXp/eJAhpxpjqvzqjjyMCedcDfJ78eB
         jyMpfomtNp0VQv+fzd8IFgMecIB4IJAHJI6GlEGCxSd7SUHgY4at9Xakc2GvYSRTFQUd
         YiOmDdvJDfzEJiM8Ag9BXhmfw72tTQuam5+U3blS7mqIETDetNx2S4ZlUTp12iCBo/pf
         GN+6AIcBOfjybXC2bRCY+JavhDdNvGkevlLAagar4eDSCupoVJCE1u3yzAmGlA7MLf84
         LPVg==
X-Gm-Message-State: AOJu0Yz1TwGLO2nyr4rLQL5+3j5muLuuQ7wdEeYjctUSieaZHFN6Zyq4
	DbsXVr+gmcOZd5CRnUDU/srpeJOz60hi2f9ZdYVrvttLd4agqRp56NOhGL9AOEyaX5nlRmS3DyF
	VWPk66IslFVfMWlx2A54RPhrC4pJ6qFrGk6hzjbEGn68LLjhkex0Q0JQXTzbdBxvs
X-Gm-Gg: ASbGncvQqldzeoDQ5InQvNyTO5g6xvrbJsjeOKiLWYtc/3ghDNWEtdRwXJaFtihCZ8+
	mMjcriUCXLOLbt+sapT5v0aZzYZPHc4xgLHquCCiFeWEiYWF50yqwGr1YkpL6GTvqsNYQDdoCUT
	WSZ2ysniHX1qPK0JhkG3ocV3zuociaukGaB8Autm9zwAeW9CNkpjILHHsijWypT5ZLPRsXy5NDc
	qua7+bwraly3E9NmqXSBvs8XGYcZEccEvELldp1os2xWWQMpZ9vE6PcgdFOdAwcgkDbDuArknm+
	6QGMqtufb7n/8PCxqxQgBVMAkAr4eOdLkR1QsegQfQh8lO7zSBrkPh7zVvpN3meoPXWLYrhpMId
	+TDqwsRaRASOYxVO6MYqizHzd
X-Received: by 2002:a05:620a:4721:b0:7c7:a614:7214 with SMTP id af79cd13be357-7c927f6f516mr346455285a.5.1744962607342;
        Fri, 18 Apr 2025 00:50:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDI+S1exMgbzLCMej/vP2nfjUJLnp+OrKaG9LB5gOXVXZjTqPv+rf9maHdYP/+WoLEwO4v+Q==
X-Received: by 2002:a05:620a:4721:b0:7c7:a614:7214 with SMTP id af79cd13be357-7c927f6f516mr346452685a.5.1744962606991;
        Fri, 18 Apr 2025 00:50:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31090863bd0sm1649061fa.113.2025.04.18.00.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 00:50:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 10:49:57 +0300
Subject: [PATCH v5 02/10] dt-bindings: display/msm: dsi-controller-main:
 describe SAR2130P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-sar2130p-display-v5-2-442c905cb3a4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PNM3/R9939920NNRFa+kSPKtbONWgfGTtTNO9ijO+vE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoAgQo8uHksX1Z+bs1K4UU3yWjKbItou1IWL6VA
 r8plrMG+d+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAIEKAAKCRCLPIo+Aiko
 1b8+B/4/69mTxB6Xp31eFpiNqiB0oxvJqAspedgY4BIf5/wK//uiBNMiaCSKV+bgmKVemFMFHhj
 uQ0ZVtpxOHg7yFI4FO/C9N3O+LrY6qvCYjUzJSTU/QpaOk+uDG5OWSk3dCUK/0FeAT3l6ftF3PT
 QNvbSr/kPMIB6GQYieP+36ZwckxTd7eJif1zkyDgE62ASTYxP0JltgMLoYis7PrcSMUiSPXpDz3
 3qgIjXVUAJNxVIvan2mhesuAHcx9/Ta8xzifZrBXAHfjl+48oDqDkjUy02tinKEAQEcpka4dBw4
 6UCTIdF1x2SMdwefypizfMXeXYlkUFPqPUVa7bRc7d6gTwXK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=68020430 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=93dKIss0COAcHyiF0SEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 2nH4SMYZSykatXcHr0rE5C4WiaK217_r
X-Proofpoint-ORIG-GUID: 2nH4SMYZSykatXcHr0rE5C4WiaK217_r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=867
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180056

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Describe MIPI DSI controller present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 2aab33cd0017cd4a0c915b7297bb3952e62561fa..a3e05e34bf14dd5802fc538ca8b69846384f8742 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,msm8996-dsi-ctrl
               - qcom,msm8998-dsi-ctrl
               - qcom,qcm2290-dsi-ctrl
+              - qcom,sar2130p-dsi-ctrl
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm660-dsi-ctrl
@@ -314,6 +315,7 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-dsi-ctrl
+              - qcom,sar2130p-dsi-ctrl
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm845-dsi-ctrl

-- 
2.39.5


