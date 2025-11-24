Return-Path: <linux-arm-msm+bounces-83019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE14C7F9AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 10:26:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6D0C3342263
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 09:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D042F60BC;
	Mon, 24 Nov 2025 09:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nmAxxz3p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G4Dwp7Ok"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EEB2F5A2B
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763976363; cv=none; b=M8aDFtQEggdKDYAAvZRf3R2g9xQzxc20VL8juu+POQQuJTczdajBvoQi8rvmc9GN0pyvpP9kwWIc+1Iuir0xDyhEbCf6qt2hIX5yzdifzw0QW0+STMsLzZAQlISXak4JBH0cqJY1DYaJ9B+oQU5DBzLcT/bwNSwyk/M8vmdoBUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763976363; c=relaxed/simple;
	bh=CCxkbHvWJEDghx45U8Kf39BypvfvW4rXTmv2PjQ5BYk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YwJPp45KFw6wpbeo+AmNsbP/hUVTssvXV5cfS25j7tG2FMLBgVUD+EoyWGg+g0I/++CLI7O+z4D7EB8LL39HLQOko1Px06p71IjzwB2ggN/AQTY8eDz+8QIaaAmwHpL0HxhP8wKShEYjnEg+D7TPNGRFc/SeOVW5m+w6WTtS4ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nmAxxz3p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G4Dwp7Ok; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO88wSp3820818
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/4CWX6OdoBZLxQ6ecd23dMQTvFuZp1FvoqDG5znoQSE=; b=nmAxxz3prhVVYvUA
	GweweaM6mKmkGK74CSyMqRa46dHIAVU7nOOmDiPb2cw5DXPYg2xYACD52Dbm8PUG
	rDyZVppBASyhH1vqj8TM2fmz12aN8Y6wgXcN+YPhZlEk5ognsZzSA6VD24LDRVUj
	jTYXWjhOt3AIIE1ohwuaYmsGiAhS72bbOnrN7rvD921bF3Ejchzr0CLZ+UchI0aZ
	oTPzTwK/hX1EC8oAnPrhetuDOkfmR5gTGj5x5QlZH2J6GbszydQVgisZRZJa+Rb6
	RoX2Es/3cXvNEYVcrh9T4VJ3h6FE8HGJSk5baerBiBZFaEiFQ4Ox41XIbHo1Wx2p
	Y2yjtA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amkknr7sb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:26:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297fbfb4e53so65064905ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 01:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763976360; x=1764581160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4CWX6OdoBZLxQ6ecd23dMQTvFuZp1FvoqDG5znoQSE=;
        b=G4Dwp7OkTfO1V+kIcgfv+GD+xLSZIdLp6hZbK62plY7rg9MCf3wyjmwjKd+Nfx8iCm
         0hSTAsXWKuJ38XNuR3et6z5Z+igsD2+Mksqg1/fiBDgoDmuGziN+p4JID2hEU/MLWnsH
         1quQ36P7UhB+WNNCyifEP+RRqr2LD6P7uJU2VZqP0Eud7cFb7Y56aGwCExH+gjBdoEO7
         2bdFiI84A090G2yiuZoHIx3cqXRzEvYH4tQ5zZrdjY061da4EfK6d7wXmKQ0LZuwdgHZ
         M91Qce57Bp8PXzKooN9nElRqvRjgw3ceHIVg1+e9N40lKKo7gHwmD3puBC/XlqLRQiJ/
         7yVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763976360; x=1764581160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/4CWX6OdoBZLxQ6ecd23dMQTvFuZp1FvoqDG5znoQSE=;
        b=OUIlNLODwpe0RNaXm5hwvVZDQYqGhsLk5bzajojqxWIf+FugHv5J1t8HB6xcIuSQM7
         NLQ4icRzuqTafIrCAOPHRa6XQvR9DkZ7z97pijSWwjnR0UG/mCSKXoVQnZ8+q/4G8IX5
         OAnDlP7FDO2bEGmIJ33AHDDTtF3OYmt8q/Hraf48Z05TpkbkghQn++0Xls1XXEm8/md3
         YgaBqHSikaCeew9YlQIkZqxTf/e2ZfFCKz/tRAgcNEfcziI/1ZMR0TkXLT358Lo9i61c
         3SAnY5f5tR96CFhhR6afHcTyWQU1qkG7LrwZoJyaOeaRAcfEiH/NAmwE25bI0purN/eJ
         d2Kw==
X-Gm-Message-State: AOJu0YzTJVbWNvsOYBNG+Q35CLtRo9TklH3842ibUu0ERIOK/V2x+6Hp
	diLOHuyQDJKBlY1BkpN0GxH3oJY+xqN5pHf++JMOXGd5Z9PTLAdZsJmjJy/EyiWmcs+l5BdrkB+
	cxs+6/s/PTqy+/mWR1Kn2axyXx0VKPG++X1VpBl2kuys22Mt8d1zinuWfZG6dKDQ+uE8t
X-Gm-Gg: ASbGncsd66y15KxHGOr2ut2cl4I1iWBxPCkN0tjBUx+nZnNJSGDrRb0j508TPOw+CLs
	zjHZ24STz3laZzLxo8cAAQDqz77ZbFYdsoD97ldyRONLMDes+Zt8Gm9iYVnju2ROvXxEUG8cWIl
	GID89BSkikkWy5ggMwyUfzX83xPA6b+dhxFxA0dUMdTw11MAc4RFouX8cAzLRt4V3zi8ZBunW56
	c6/uU3v/osLa1ai3o5fIWEX8qSuVv1YTgeB0006EskDR7U3nH+fTkMx+V5yIlmIk1zFqtdUjolo
	uKEls8DXyq5aS+45Od+dZTeRu/uIF9NpMztA/KKSxxi7xCNIyOCdMDDRWTKVgaFVbR3J6B6LfPQ
	958BRyL005D48bRbqwJYqMtZRrAAptoblnN5NaJQ=
X-Received: by 2002:a17:903:1a08:b0:298:8ec:9993 with SMTP id d9443c01a7336-29b6bf3bc84mr119263175ad.38.1763976359943;
        Mon, 24 Nov 2025 01:25:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG70geKhony8KJbXDyYD6UKHrItW47p5VqtsLKF3V1wFMXAWLx5NBW6GM0qYYY/9jWECteyTg==
X-Received: by 2002:a17:903:1a08:b0:298:8ec:9993 with SMTP id d9443c01a7336-29b6bf3bc84mr119262785ad.38.1763976359375;
        Mon, 24 Nov 2025 01:25:59 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b29b1c2sm128444675ad.81.2025.11.24.01.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 01:25:59 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 14:55:17 +0530
Subject: [PATCH 1/6] dt-bindings: phy: describe additional regulator for
 Qualcomm SGMII PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-sgmiieth_serdes_regulator-v1-1-73ae8f9cbe2a@oss.qualcomm.com>
References: <20251124-sgmiieth_serdes_regulator-v1-0-73ae8f9cbe2a@oss.qualcomm.com>
In-Reply-To: <20251124-sgmiieth_serdes_regulator-v1-0-73ae8f9cbe2a@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Yijie Yang <quic_yijiyang@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763976350; l=937;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=CCxkbHvWJEDghx45U8Kf39BypvfvW4rXTmv2PjQ5BYk=;
 b=AVRuX8rbxMfdPKZWnX8Ca9CxXlSWPic1aRKYI0Eg2r2VsUs9IVuWbryR7WY4HbYJ3ALKQfrwW
 KYhQlkgj+HdAsLDARZRF372aqYPzn0J8a1KTBH+Ydf16klRvdNyjKVd
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-ORIG-GUID: 5IWzAIFG7jkg_OWr-we49A98ykMfCplK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDA4MiBTYWx0ZWRfX+n3UU6jb2T86
 2xH2txWa8NfzM28i1LtXb4RpVCso4xLDTMIf8CxHLb+Vv+Nmqa6ivpG8yA7BmAu3k9ccjSDirdB
 C1MtvKJXQpM0YtLAax+rjxxI150bHV37GH1mhiqVzpBr+QZRjlXrsy6cbhXxmiUJSOereAmlKmg
 PnhIh7rJt9Ttbw5pQQSTVU/BGtrYa8nM1J5BOgFQYpPgajDYf/4ukiVO3KojqZD3WJvuV5ZGTrF
 Gx9ot048BdNcYch/fQDs1YKzTEl8KnWV389jdazq+vBzZuTvoeZ7AXI9H2R9Po7z6DNlkrdhE2w
 EdWpAc2C08vWMVj33WQargwNyprlD/vsuRmZRGRKD6fgCc4Gn4aSikXWYueT2DDly2u2mgvKvoW
 EduvKJ54E6ByxZqaK4yGmRgwGcigcQ==
X-Proofpoint-GUID: 5IWzAIFG7jkg_OWr-we49A98ykMfCplK
X-Authority-Analysis: v=2.4 cv=B8S0EetM c=1 sm=1 tr=0 ts=692424a8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7k2arxiymalmIiNRug0A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240082

Describe the additional vdda-0p9-supply for the Qualcomm SGMII PHY.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
index 90fc8c039219c739eae05cc17108a9a2fc6193df..0a1330b9118d63cf5400325c58bca05ebc641055 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
@@ -36,6 +36,10 @@ properties:
     description:
       Phandle to a regulator that provides power to the PHY.
 
+  vdda-0p9-supply:
+    description:
+      Phandle to a 0.9V regulator supply to the PHY.
+
   "#phy-cells":
     const: 0
 

-- 
2.34.1


