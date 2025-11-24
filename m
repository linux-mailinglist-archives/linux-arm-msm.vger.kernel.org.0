Return-Path: <linux-arm-msm+bounces-83032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C21C7FDD2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 11:26:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 98F13344C37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 10:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F3E22EFD9F;
	Mon, 24 Nov 2025 10:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YhUQocKt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MuUr6NTp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59AE270ED7
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763979961; cv=none; b=t20PnTcfaD94h57NGjok4uKulj3wf/5BdVwGjT49HG+SSDVu5NYf46Qe3gjyBZSd2fHfbMbfiyfMrLgXQxo2R4gyjyifuzphk98gYsEN5zL0kh86ZHWro243U/ofO2V43FpaVWTYNAHJVSuAn7R6kD6RxbRdfB1rjakXHKt/eDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763979961; c=relaxed/simple;
	bh=niYSh6CsCMrhQS2BRrxlDOLC4Yc6qPICs6YhLuxLGZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NBNpVooZwAY03kvwVu1zsnyvRssCQcVLc1lzB8EmGKrBFttK+8GROGfx2SepCzwaXPlna4WEjjlTvow1AwI/uq4x7+m78OMGuptIvLQOqab86mht0m/Cvy5ovSmTZET+o38Lbxe8O+TmVend/wCcUmKOZZs62DAELuGlH1TCkjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YhUQocKt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MuUr6NTp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO89Zoq3821782
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:25:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3euNon//LBx2JSrUXy4XgZxtCqOpLk6YhQEkZhC/C/I=; b=YhUQocKtl2j0F/Uw
	Eg09oLmxOU9De2BeeFcqcU/pwQPNocTZYB1nkWXyBBfXX2WUNYeKJjT6iqJORsAG
	tvOwMANrazOfxRKdlbjOGj6VA/ddVTEpSOs0PHe/x34B7qOniqMjE0r+wX1UwB+i
	NbncSSMCRLrtDySDVbOYK2y4yww11TUk9JOzPc2wjV57SkD6EKFTuDJfe4nGmmm1
	hF1M0774O++JHfUJqu5yOWz5QL2gIowhJ56irRt4xABH91Ch82pK1Y4oBEccACOv
	ND0K479S1IL3VH/OSV4xLHY+cNqkeGzr7y4hYe/3MXX1KEE5OpWEknzNK6jQrPtb
	o8cHLA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amkknrdqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:25:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b969f3f5bb1so7023919a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 02:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763979958; x=1764584758; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3euNon//LBx2JSrUXy4XgZxtCqOpLk6YhQEkZhC/C/I=;
        b=MuUr6NTpTS+SNHa31ndKTXrcxb4Q8CXVcxbum66pCNSpsZeQd8q6OIJ8wOXVh2uEYu
         NZzwntoGzRUhZbTUk1yQQJzYH0c0TDLSyA9UV1vjvRYdskmvby0sixz+H7oGjVkU26Hm
         8CKe4i9Suqju9Y9cfzPrLfIFu0mapmJkrYtWVC7dbQ4Fma69lf7M2ikoCUPxUWmcaE8v
         bQO7ezqzrfa5H74pC2blbm5Sqm2RAKN/femPeFQogksIaRZGy+jk87GwW0QrmsXhKysU
         GXGbWtmcKjMMHGnjCAyX9YSG9haRw3dHdXfaLJgbhBuwwlvB/T6JwjhgvnhJb9VkdWkW
         kcSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763979958; x=1764584758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3euNon//LBx2JSrUXy4XgZxtCqOpLk6YhQEkZhC/C/I=;
        b=F3HhJ07c5hqO+eZm6SddsnQ9egiXFXL2sDHZSp0gPhsHyUQBP9tWnOo1s/WsnHK4gC
         o6d1n+7zwtAe4mR4dNSGR3y1RmqOAh4DPWJKxnGpH6mgmqV4z1ERGJaqPsDHnUcWHrBA
         QDssk+szsRsnQq1y3uTcZ9K003C99u8mLSStHVvJZDQRzheL1VoYXYPcgshxpnEj8xuI
         QDIQLedIJBfp8G7cXqFtJrATAluBeOcFlDbLn0InZ3lg2lx4W8T0YXHt80uB5y8wieYo
         kL6DOVqNoaBPUix3NfA+T3VoMNvom+OIIHMztlr+1YOyluosjU9EdG8EARX0zwFXnwkn
         7RcQ==
X-Gm-Message-State: AOJu0Yzwc37VODu6/XgkjkvhoRsvvGHOqK2GDcFjk0uAKF5bbUsMCLdQ
	BV4tcteTq1nDn3rzwGZ60x6+zsyhuFaL9QeBu6wmMdmn/LuspD98NMnOJ0ZpyeneGCqJH30C/bV
	nJ7O/wIEkPHt/SILbVM6YxVqXWg9QNcYW5r9Tw8Gj7h+q3FhzTKJ47pvd9gZ77oMazdCw
X-Gm-Gg: ASbGnctzIM83Apw6w6EgDNQ1WKsfOjNYSfd0u5WLS3wZ2e70ry1Dz8A65sqeHmlSUaZ
	v/x/+pFfV/U//NUaNRQ2jp217ulgkiv6f6BQimsbGfVr3Qncu9ciKGyDZkSw+4SPMqcGB2UfjlO
	CWqGMjKJozUSbX00NSR/p6wlwPGnBiPle38fIK9bJ7yL2t336pkbeP5WDmC34JN85IxceE94VY3
	iwhjLuxZEnP+0/HsCJdB4MqRmsdE8EuqGNZLlZ87RAp16GCjmk2JukDaiD6kBOky2pTeQ6gXnQt
	SNcjAQT98wbDD+h5y3kolh3Ra/3ZKpnx3HJdQFJZNAqhS7eZhvZ0XTtOTPF37slLA1x0nmjHWyS
	8H4eFgvgZN/BLGtx1WBRoYLzCOaHi5aVw/wyi47GJ+x0rpj+0RT1XR/kY
X-Received: by 2002:a05:7022:b83:b0:11b:9386:8269 with SMTP id a92af1059eb24-11c9d87008bmr7364661c88.46.1763979957513;
        Mon, 24 Nov 2025 02:25:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0mhsDOy7DP7bwdncY1sdLRwTjXHphQ2JFcRElT7cBmeugUcoSLOEefGh2q727nCrFfjrU7Q==
X-Received: by 2002:a05:7022:b83:b0:11b:9386:8269 with SMTP id a92af1059eb24-11c9d87008bmr7364620c88.46.1763979956960;
        Mon, 24 Nov 2025 02:25:56 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93de6d5csm46140627c88.4.2025.11.24.02.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 02:25:56 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 02:24:34 -0800
Subject: [PATCH v4 1/5] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 Kaanapali compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-kaanapali-pcie-phy-v4-1-d04ee9cca83b@oss.qualcomm.com>
References: <20251124-kaanapali-pcie-phy-v4-0-d04ee9cca83b@oss.qualcomm.com>
In-Reply-To: <20251124-kaanapali-pcie-phy-v4-0-d04ee9cca83b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763979955; l=1736;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=niYSh6CsCMrhQS2BRrxlDOLC4Yc6qPICs6YhLuxLGZk=;
 b=TVsF3Wh/jJvkVKtp/Lt3AKnvGvNx8efZsm5g+8YADfhT0UBsHUKsOLKgxkx1u42mFrPHNAhgt
 1cQIM5MLSGeAvX9t38gJd18x07ZRAPiQjEMG2lrOgx5gJRPQ0tvid4m
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: 9-wONy-ggLLCOKKFz8RjbT3KyZQg68rs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDA5MiBTYWx0ZWRfXxcjXqRcYlJqI
 nNPKrJDpOflg8ov7TQGh8S+tXKJfOkikp2Cq0WaaWAk1rfkxPf1ZQPWUwg9zuxjLPVXNrlmpLNW
 /NOo8UR6XS+/sWPjNDmO7IkMPRHkBFRB1iOVktWOAfHFfygorh/mRWlzFSLD1XmLO3Tr6Af2cNG
 cJ+TVJ5qjjqU6JRB4azSTJ9KOxHO8h3yX3QqwCwOq8Ta5/0/Wn4AfOyLOjz2aoJDgNTdGFfOVVq
 H5ZT9NKLOQzzaC0BXZ6kTDcL5kYb8fz2TGdm9fok8kRe1XFvC1EX2DoB2joTWPc+Se8iXKu5cXa
 gyiqoH6XJ+HTIHLtV69O7HTZgnPOq/0pHV6/T3/KQqv1M77bEO/DurLE2izgB8dozct1uuGSjM3
 aVkGBL5cZj7SRSswY3xHp6fvGLmAXA==
X-Proofpoint-GUID: 9-wONy-ggLLCOKKFz8RjbT3KyZQg68rs
X-Authority-Analysis: v=2.4 cv=B8S0EetM c=1 sm=1 tr=0 ts=692432b6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=A6CI9_SKnrlR1hncxxMA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240092

Document compatible for the QMP PCIe PHY on Kaanapali platform.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 48bd11410e8c2de664d47262b982473ee24cf09d..b8f3b55efd6eafc0c989e64326b99f03516f4e30 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,glymur-qmp-gen5x4-pcie-phy
+      - qcom,kaanapali-qmp-gen3x2-pcie-phy
       - qcom,qcs615-qmp-gen3x1-pcie-phy
       - qcom,qcs8300-qmp-gen4x2-pcie-phy
       - qcom,sa8775p-qmp-gen4x2-pcie-phy
@@ -147,6 +148,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-qmp-gen3x2-pcie-phy
               - qcom,qcs615-qmp-gen3x1-pcie-phy
               - qcom,sar2130p-qmp-gen3x2-pcie-phy
               - qcom,sc8180x-qmp-pcie-phy
@@ -216,6 +218,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-qmp-gen5x4-pcie-phy
+              - qcom,kaanapali-qmp-gen3x2-pcie-phy
               - qcom,sm8550-qmp-gen4x2-pcie-phy
               - qcom,sm8650-qmp-gen4x2-pcie-phy
               - qcom,x1e80100-qmp-gen3x2-pcie-phy

-- 
2.34.1


