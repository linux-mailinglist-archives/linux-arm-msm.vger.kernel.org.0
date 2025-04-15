Return-Path: <linux-arm-msm+bounces-54342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E007CA89843
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 11:40:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5584A1896E6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 09:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACF7B28DF0D;
	Tue, 15 Apr 2025 09:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Crry7EYQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC5A28BA98
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 09:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744709987; cv=none; b=Nqo+hfOxkYxnmDOVY1rNaRTXu4oiNPa0Y1Z1MD2Y/Blc2ZMQMeacz25rhjPU7HRy8hdMoft8E8FBBcCD2jMZtUdSLe2tE63APwLyEZaN6L/wWKuIlpwm3iMQkYLwSy0sks7vwv9Wgg09kKMozD//LoNgZlZ5RQzbyEZ9EkVcwM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744709987; c=relaxed/simple;
	bh=WwCvGbKN1UfpAvbEF24uDaZkMcpdSei4ppmMTFjiumY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FAc0+viOAMaEUVdB/fWUZyNHZ8vXj38Z/l59V1fchPEFnPyrzyy3DH4vFlW4rQGC7P8EKK0yUUN3sFG5vmDUzpUtRYPnVL4pfziSP3g3AxPr0YBpIxzaBqsp51XBnJ2iGRug0KhuN6nqWiurqjYi2neSeUxaA/9Q3mmCz68n3Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Crry7EYQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tGq9002173
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 09:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	boXGEJ9vm7laFVs45kpF+i7DaEsEXFuWOHSJOklGi48=; b=Crry7EYQoQ7jclKC
	t2LkwXKWi3UGPmFyK4i1sqV1VOjGoUvZR9vAP0XeSwg8+YsbGEnENEbXIQRzeEV5
	BMh9agY8PrayU9Uty3JzPLhIj7uokz0VvnQKnaOhxWj8mVMFkh1Iv321fTU4QF5s
	4Il9Pf/tIFhmokJKlKT8DbTW0jLbGkb2/5GGH8+RTBfnuLWmlkALWogr79m0h4x9
	wrPjuNzXSHfBXb6PDKc0qCqFmGlPz05aWQMCeobtH+OBbTDKFttO5zoNgnUWAmcB
	uFWyEZ+MWQ+cgVahOmCINpKvW/+oQS3bAWvAhTnwjRwcSR2Kmyd/g13CbXAT+a7w
	ML39aA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vfmbh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 09:39:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6ead629f6c6so86292646d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 02:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744709983; x=1745314783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=boXGEJ9vm7laFVs45kpF+i7DaEsEXFuWOHSJOklGi48=;
        b=tDPcUod/3i71/Kz3GwxwghYVj9aB1LSXGH6mrsG73OeZ/7YkLECvzE/WurEeLHyeVC
         sD2CYRKQgg2Lsj6v3w2xw4AWYsw+bXx/9SEpPRnlPTlsVXks4XOzCyZmDa2J4UnUHdwa
         Px9sk0JVXCR8sT/PPGWz1Hntrz3pAd9s4HdcG12BuIaJ3HF/Lhg/o7qPEB6Pj20Xg0N/
         sD8yEvWsfkTny1ol2Z6KhPxXl5H9ep5srmlnC1RdI8JQ+F9mzw7cOmL/N0n1BMUHFGkB
         XjSVXQ4zQ2PGK3fkQxvaWEY9KRtcz7Iw9Ub5xiuFGFA1KwmCku8IrhP36dJTw/Q/tg0G
         si8Q==
X-Gm-Message-State: AOJu0Yw9wzEIwn+RLm7zpOWn5G8ARxCgcF2rcSS14An/SHlE3CvbykVS
	b6z8Bnbm0IbYHyuvYI7twJCSkfrk9xoOMY+WSyQOrlOuxbF6hJoiFfpJNh6AJIkY/falX1YHhfm
	uaCi8gHJ4uUJFirN77qJDx/qrjHHVBNSYM2rq1HIyBJ9F+VWNHF6AkStnH+BGLD28
X-Gm-Gg: ASbGncuhSCbeqI9QCgNJRstAS8tm6j8e/qiuiyWd4tJA83STW14O8/96UaWlRd4MZbr
	8V6QFqVRju/u+1mUiUFBwGo7XKIA12UNPlmUIsijt+N7OuuvdxvaH8cD5x3nKRk8ZisSU2XER4H
	Kd30wjA5eTGQTowLALuTopgwrj77KRConErEEoaJs67WzdCYPmylNfPraZKhpqmZWJJ+Y2N4mKj
	1BZrMWd0A8w3V3fecdkgOmat3w0tzgYrMHhHPKxKL1tjX0W9aktABnX13QEKsF8cVKv93ifvZoV
	Fgnt9hDo4IuwFNIm3HClNNWUmABbAWF8tx0i+k9sIOMM/mswYQK0ylxO3CBvmd9FXky5l/bpWZM
	W+xKvXJKV/ALsXIuCP2rdTr5E
X-Received: by 2002:a05:6214:cc6:b0:6e4:4011:9df7 with SMTP id 6a1803df08f44-6f230d1a647mr271627216d6.16.1744709983524;
        Tue, 15 Apr 2025 02:39:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgv+l2YW7FLqgyNzvGDxI7BnqBldiXe67Jqf8Q0JmqBPbVtUaiY4utPWnf5VS4nhStjkZWOg==
X-Received: by 2002:a05:6214:cc6:b0:6e4:4011:9df7 with SMTP id 6a1803df08f44-6f230d1a647mr271626936d6.16.1744709983180;
        Tue, 15 Apr 2025 02:39:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464cbc60sm20141901fa.24.2025.04.15.02.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 02:39:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:39:32 +0300
Subject: [PATCH v3 04/10] dt-bindings: display/msm: qcom,sc7280-dpu:
 describe SAR2130P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-sar2130p-display-v3-4-62314b1c9023@oss.qualcomm.com>
References: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
In-Reply-To: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=934;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IJ0quqH+dI7r+sJavUIADWzzAqD1L2X/CIVzw9kCDtE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/ilWDCo+pRdd0GrlabWfVcz8v6zf4ozWEeLZA
 /Fu3nJWwiGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/4pVgAKCRCLPIo+Aiko
 1ZCmB/9c4hLwLkqR989lkSnfX7RFd+RyXe2921PtOP8h3L7D9zPDDrRiPBsEIoM2IWDEgcRu29V
 TOK54ArIZFVtHuBzxHBrMKjeGTaEit0RHjeaueqX/uUaeFVZY3ZekNjO95YrhwBjDam3HZh5c3P
 KM6XNV83M1FHTLgDV4JtQyPebgUeMio3Rkb431dyZ450VyePsBt408lhO6oM08G1dvxgHIZ2kNH
 sGaQTCgD/TxOiRxM1flWQ2L1ost0uIylgYTY93Tavz3lOMs7y5XPP72eGnK6y80sGhBIcEll8cb
 FXyLoKPZm5mLpXx4et9YY0hagzeFfwiWKhu7H5nZHb7ecY2x
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: SuDlKJL5orIthgDRFuVjzu-GXbwtkV9P
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=67fe2960 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=P0d4iQPpJQof_2lRNe4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: SuDlKJL5orIthgDRFuVjzu-GXbwtkV9P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=911 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150065

From: Dmitry Baryshkov <lumag@kernel.org>

Describe DPU controller present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
index 6902795b4e2c249c2b543c1c5350f739a30553f2..df9ec15ad6c3ca1f77bebaab19ffa3adb985733d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
@@ -17,6 +17,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 properties:
   compatible:
     enum:
+      - qcom,sar2130p-dpu
       - qcom,sc7280-dpu
       - qcom,sc8280xp-dpu
       - qcom,sm8350-dpu

-- 
2.39.5


