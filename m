Return-Path: <linux-arm-msm+bounces-70116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 762D2B2F46B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 11:46:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4BC2A012F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 09:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F3F2F2900;
	Thu, 21 Aug 2025 09:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PsAE+VEE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C1E2EF657
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 09:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755769496; cv=none; b=WrqJf9Zi5B8Qrg00JeXMk9iCxqNFKaSAjeyfCPhKVUCH2XBu8RKF7PBVR0o3bu0AWOcOkQjH2ludYb9gmmu42554uWRi6Bx7OfYkv3AVy9U7p1YYE1E1X61y4UVO91svPw2KHoMS2yHVsOzrwB5ABNmHrHFQjVp1uG9i+cx6/mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755769496; c=relaxed/simple;
	bh=OYLGPSROlM94Y8YMfz+cAy5T78h70o72gHxUfKcZJ3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HT4/JGo3uqiK6hQjw1/c9OnMv2uJNcI+mLVQKCyM5D/gDxbhG9vvtcHPpts+3N8bQtKXVUIQ4RUm5gbM6X909C12AHLjmvH4RNBrIRPFo7ZJ67GT8TBAXGxQIOU50yc7Kl6KN0jE7gtS6ST2uf9JKKvGNTGdLSnP00MDxas/9uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PsAE+VEE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9b8sp031367
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 09:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4HB2uUgg4ObiGLYTjYfuAXBTtDoOjkuI+b7+MZ1F1B4=; b=PsAE+VEEmmQF2Sau
	/CClwvxDl/DVGgLZhQ/XD1sWcoKBxNTTz9sQJXrP98irkOvGQYP/k+Jj+T6NduYf
	AKOsLLeR0+oa3KLCTZ3ANXwFZFbZYHcaz6QR+NVZYqtZkiKOBFX/bYSNomh6m9S4
	GyZscyNIxj6Tbmn6u7zYDp0mIUfLA0GsIMoBm/zdhFa9Q1ALMoMwyFyVnfMyU+aj
	Y7EqOibQw+QMRhI8tm0MhxipKpFrnNLwCr12bZ6MuY7Nn56hlqN8Y5ej+/jcIiVW
	nmp+HEQ+4gwY2oE9O0KzLgwCNhmp+0Rd/nZQfsoRG93uYb4IyuGryeCtifbon48R
	iHGCyg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52avuk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 09:44:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24457ef983fso17755635ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 02:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755769492; x=1756374292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HB2uUgg4ObiGLYTjYfuAXBTtDoOjkuI+b7+MZ1F1B4=;
        b=lOIrfOES+vA4sriZHiU3nIpqyDHpZQBBi3zXHBPpm1GZh5Q5LY5olKpSP261Bp+DPa
         X0kZ45JFNkazP3rm6lpuxrkwYs6hCLG0GYyxYv7dC32290o06EVy5nyYG2joIr5zw27u
         NPjHyQL6Bb8nQaO3pxKJxBap1CHVchoLagsKow9mffAbW9k0/hBbL8WJlAaT36JJ05YR
         dap/wUzRb39ubZNFaeF5XDC6PlAtambFniD0jiPFxyTtxEhHr6Vy9t0Z84jvJ2yYDotd
         zcXZtQcpW4aIZH4hvt2oy7y5xTnkwLhwq2fn6LUIGG0ZqiRJzvErFTdPJqQosiA4kJoD
         8CZQ==
X-Gm-Message-State: AOJu0Yw0YgGUwL6ztPUxqbzjMU82mnX9o8hDfzz3JYVsUlT8TrQGo5oX
	Ak+9nNf1MeJUyz43I+dDyODzcLkUMOd5f1WnMTuO3vIqNO/BzZnQNkcO1liwKiR6YkJ4qx1ArPj
	e6fO7VgrYnNEE/1xYnerFCNo1W5ClNRhBIg7Tai3RgjuQus+iVZetpZQbPVxcF/lZyIas
X-Gm-Gg: ASbGnctlrnnhTS26y3xGdGxj0ATU5DsArI/OeCwS6JVPdStHSBlMLHoIInFgfn0QiS2
	CeKnNb7GuksKd1SS+Yn8Hf0A8QUIAYzOU/hxnqdlWDrRdWrtsq4n7LqnWEjZvTEQDwt8Nh7DodL
	C6/E5KHHEVmZjkQdaBGZtd2zfzztRuskXtHcl1tiwhgi3blp/EkHM/QcM3I4IHFA3Y4L9Cd880b
	J3IOfvwEoEPtXBhPS3uDlYjCWL8fX8vWybHmA/yG2p8NdM6Uu52t5/KXoGWUuRuhIsa9IU1nim3
	uIRs3WWg/rA4WA7EDD+CBlOvWzM1uQzddresfoJKaPKAWNXekgKYfltY/W6usxuaWNqj/z8ubWe
	+RMmIX5tUano9V+o=
X-Received: by 2002:a17:903:384c:b0:240:640a:b2e4 with SMTP id d9443c01a7336-245fede0b63mr26328235ad.49.1755769492402;
        Thu, 21 Aug 2025 02:44:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFx4GHGVHvitiI3tfieiXs12r8JEwBYJ5VY9Fy1i8PQK7RHyuxBxDvyosnXBfmKrzsdVv4Pvg==
X-Received: by 2002:a17:903:384c:b0:240:640a:b2e4 with SMTP id d9443c01a7336-245fede0b63mr26327955ad.49.1755769491957;
        Thu, 21 Aug 2025 02:44:51 -0700 (PDT)
Received: from hu-wenbyao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324f23d853esm1426078a91.6.2025.08.21.02.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 02:44:51 -0700 (PDT)
From: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Date: Thu, 21 Aug 2025 02:44:28 -0700
Subject: [PATCH v2 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy:
 Document the Glymur QMP PCIe PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-glymur_pcie5-v2-1-cd516784ef20@oss.qualcomm.com>
References: <20250821-glymur_pcie5-v2-0-cd516784ef20@oss.qualcomm.com>
In-Reply-To: <20250821-glymur_pcie5-v2-0-cd516784ef20@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, Wenbin Yao <wenbin.yao@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755769489; l=1596;
 i=wenbin.yao@oss.qualcomm.com; s=20250806; h=from:subject:message-id;
 bh=5L5bgft0hY3UL+GD99tTktGev1AZdAzNOUPNY/hYCs0=;
 b=pdeoV5QDRCXDZmT9xtvFBUXUQoDPeo+E8tde+yev8M/WcSKq0u8DjWSJEglrEvd5uQ4Qi4ve7
 fEhDoOWl3GJB8NBi/EMSt+TPtD6W0ZX44pFzz4lXdUPAwolbJYpl/ij
X-Developer-Key: i=wenbin.yao@oss.qualcomm.com; a=ed25519;
 pk=nBPq+51QejLSupTaJoOMvgFbXSyRVCJexMZ+bUTG5KU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXzmfr4oGJO8I3
 vs8C+4b0d4vX4YA5TohTD67qs84RHDj96M3r3XUtphp0KTiONbyvBiVAKEkvP8xu98VrFkcrt6O
 2zuWRNPsvzhl5eTSwPo09EP69Z3tIgrQdP4n3b1IEixTSolbrGGT1VWC4stTPB28w6Zjrypp2sk
 azHKncODgsizwSqCewHfLKbwphsUYzPEgrx2iW37kOhN7zT1vPR2KbyUUXZQwD/B640VTWQ6J0j
 lzvX6jBdEbT8CjWeiQsPzw8LxAglp/2mJDMs31i65QYzbOPwvdwjAZX4eCHa3v/yrs8dUDiLJVE
 6cNqzAfUGu2t3mh+hEZvoDSWutQqiSd/vll5hSS07e8j8cRCvAy+n7ztYMB0KthnUGd5V5r3Xqz
 mWszdn607ox88BH7UwHwNXPxkDueaw==
X-Authority-Analysis: v=2.4 cv=TIIci1la c=1 sm=1 tr=0 ts=68a6ea95 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=prgL3jgsdPShhDvlN2UA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: zIC9_-6pPX5qAuHDUVGfDvVQF1P_xtw0
X-Proofpoint-GUID: zIC9_-6pPX5qAuHDUVGfDvVQF1P_xtw0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>

The fifth PCIe instance on Glymur has a Gen5 4-lane PHY. Document it as a
separate compatible.

Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
Signed-off-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index b6f140bf5b3b2f79b5c96e591ec0edb76cd45fa5..61e0e2f7ec7f9cb08447e4cd9503698c0a2d383a 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,glymur-qmp-gen5x4-pcie-phy
       - qcom,qcs615-qmp-gen3x1-pcie-phy
       - qcom,qcs8300-qmp-gen4x2-pcie-phy
       - qcom,sa8775p-qmp-gen4x2-pcie-phy
@@ -176,6 +177,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-qmp-gen5x4-pcie-phy
               - qcom,sa8775p-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x4-pcie-phy
               - qcom,sc8280xp-qmp-gen3x1-pcie-phy
@@ -211,6 +213,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-qmp-gen5x4-pcie-phy
               - qcom,sm8550-qmp-gen4x2-pcie-phy
               - qcom,sm8650-qmp-gen4x2-pcie-phy
               - qcom,x1e80100-qmp-gen4x2-pcie-phy

-- 
2.34.1


