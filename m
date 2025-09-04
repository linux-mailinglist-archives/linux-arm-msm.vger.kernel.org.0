Return-Path: <linux-arm-msm+bounces-71964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BF4B43252
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 08:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2EB567AAB42
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 06:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A1426E16A;
	Thu,  4 Sep 2025 06:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BxQYhEYK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C97B26B747
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 06:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756967001; cv=none; b=hPjnUOCT0nZCatS9dy4V5YBcAgORhoxvm0uh+mzRhcdFgTmdrilod62IHSDIoZqvi5BdyN7hbB5f6v0ido81jXe0qadkrZNqV5ZR5rPN/FHWETYfcWiMx5qVpUlA9F8FOEFHeR+1dQcjk46c0dn58LYysa0L+U70CPvwbx6frcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756967001; c=relaxed/simple;
	bh=Z59JyNXY1bhJzhN5VigUElth0S2Utp0rRQ8o37kZbzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dOkALgN6Zxku9hgFlUp2/VDhCjHcncBGCFo4QLyLGom88RfhYVesQHfzgRP9NkXop2Gm9m7P5Zw8XYhaVOUUqjYS2JzKWAS9Pb/V/Eij4vqOcdCDvGX8SPckj9IdmpmbbwWwhasJ3stD3jLhObKIj42Vv3LMTQIzWa6OEbfWGN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BxQYhEYK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5840qbxn001034
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 06:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3aPHP/ZvWkk9g17nfgyfPgB0CX4dTinxdGvwP60Nou0=; b=BxQYhEYKIe6AfS3K
	limHMXVx6HXWNF9QoHGJKKFTZ4sjz8DGgYkc2x5eapJaZTzH0VdmEGh9EwYaRRES
	qoO2hZ9L+DUfMUbUETfwCeOK8XRDdyhWFp3UKtJI7Zwcmy+nMpXBU+vTejSJ6/P4
	1vLwrEy9BQRafmZPx/8WOtx+BE6qMlXTRuvOsGqmcXQaNouw5IRNUD8Ry5egXjy1
	fzJDnwp//099ITRxlI2r28/93uMCgH4rnblfNg3Dgc7MzVVQLZ1uz98qRX94jPo5
	3Lgv3GbDhBEeCxAKy6hw0nA7a1B74Uzr8VgfzOrSLngC6zosKvAEBJDo2nsOhkzP
	BYDztA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush36aj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 06:23:19 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76e55665b05so624366b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 23:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756966998; x=1757571798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3aPHP/ZvWkk9g17nfgyfPgB0CX4dTinxdGvwP60Nou0=;
        b=uNgNpoOglyNMkIj2lwLqBXl0nUT4a87EinGqbwuJ5ipez3FsY7QBCAWU6fNq6Ba39U
         ZbKy8iWRfLTHV0j+gidMWYdTBODujR8MFK8NTols0mx5Yc0rJQrQ4P4mL3Mw/ar+3CB7
         T4i3B5Az1Lf7q2aUnwIqyJtid1ibS+NeUVTnyhtPYO5jHgkeSGFOOs9zRComQpdYfRb1
         aGTNHy5C56xdaakz1Gg8EmsLsnMlwG+ij2CHkHU3wPDqtYf4DetXPA49tr/jhP2I4MXW
         Ae9lvzKTgfg08f7B/MLcjXv/scQTAm/gic2WOZ46/eheVeudFht+3dgLgXRjtozezB6K
         EPHw==
X-Gm-Message-State: AOJu0YwH3FFnA7gwvn7WZNcmtHnT3w93WYLuPLOHnQwGJWV7uvHaZvZA
	9Jv6aN3mo/zU2aDjYCAN+pAJA51YOY1iSysqHvEUSbihCRVHaMoU/VlZMXwFDYsPv911Dq26YfG
	f+Lp0GKSQW5q7vU08lmHaz7t6hP4K4VGppAuFv+77Akjcyghr87nySttA/NcsKw/G0x0x
X-Gm-Gg: ASbGnctb/Rn8vqc+tsqNLUsXkxgQrcLK92XLxWbQexFaxXI8JL3dMy/oKkdhqWwPknD
	HHnbCrGbNuRW8ehfvBLIbNT3BDMZG7NirXd2gDPVL6NOZqUu/OyEaUPx2WNe6vOPYVjdREwHnyN
	ET1OSqCOkXPvL4Lb3aI9iJUTfiWn0ppL/q89Ib1I8+c77g0LbIHbNZ5k7E1M8SM4vjStWfcnTaH
	/YJwFwwsRFd8caxKrWa1hdoDshKGiW90iGUbRMogrSDrI/3bORIqP4csLwufBcZf7sQNuBP8M+t
	XR9FZMKme49QIV2WfDCEwJeQ110i9crabNwFvitE2fAEnu5LEG8A2wUuyjksnIXcPLouZQZK44h
	0jDq1JPyDk04INUc=
X-Received: by 2002:a05:6a00:189e:b0:772:1fa1:be4a with SMTP id d2e1a72fcca58-7723e3077ccmr20997575b3a.16.1756966998359;
        Wed, 03 Sep 2025 23:23:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGa4NYqRv/n7wy0CncjscwCmB9uKdLKscmRP3T4+uddra/JgrTA8Epohbob2gH8G3spbxydGQ==
X-Received: by 2002:a05:6a00:189e:b0:772:1fa1:be4a with SMTP id d2e1a72fcca58-7723e3077ccmr20997537b3a.16.1756966997892;
        Wed, 03 Sep 2025 23:23:17 -0700 (PDT)
Received: from hu-wenbyao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723427c127sm17120911b3a.62.2025.09.03.23.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 23:23:17 -0700 (PDT)
From: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 23:22:03 -0700
Subject: [PATCH v4 2/4] dt-bindings: PCI: qcom: Document the Glymur PCIe
 Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-glymur_pcie5-v4-2-c187c2d9d3bd@oss.qualcomm.com>
References: <20250903-glymur_pcie5-v4-0-c187c2d9d3bd@oss.qualcomm.com>
In-Reply-To: <20250903-glymur_pcie5-v4-0-c187c2d9d3bd@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, Wenbin Yao <wenbin.yao@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756966993; l=1219;
 i=wenbin.yao@oss.qualcomm.com; s=20250806; h=from:subject:message-id;
 bh=NNqB0T3SwC/nQPPpaZYNgmY4nF2H4V0Dr0y62les5Jc=;
 b=VwLaL7XUam8ITtZecUrYv1zURWlReeF/jvoQfCPKfREzjCQ2AE/890Zrfen7l/KBiZ2A7M5Xg
 Yj8l7EpYtyDDpdVPbtgjF6/jWSzANjOaVft5/RZXG9ozmAfzWuEL/pS
X-Developer-Key: i=wenbin.yao@oss.qualcomm.com; a=ed25519;
 pk=nBPq+51QejLSupTaJoOMvgFbXSyRVCJexMZ+bUTG5KU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX4hqDxGRP7wMz
 AuXticDBH5fHXJHKnslNfMYN/5DNVwJIKesWgHKiRuAWyjeCuHYgVq6tZGQB3Ryh062f2djTYls
 fGGtT5dq3iM+hi6m/+uLfZc9WSAgfrF/uuxaW/vbHkzjtEFc4Ve5HA/iUK+tdh/bOBS56/dNtW8
 MoJUPhPorLwUrE0U2vVSAjORsbOc6YrsUWicWxoMohb6/NxVN+PALB49QDS67JKLysriZjJrvrX
 JHwguTfyJGtWd+iSFO6gnHh81dbW+XTV6NueDPbyAjqiw7ap0u50/pDVwcsCeaNG4v5A985OV5r
 rKrwnEcUQV6aJjqv0tloFfPZHCXibMf3rdrf9If7HvqjIe/IwOqq7kSPSlyFFA0AYT8PiGjMUiG
 fBceoy4B
X-Proofpoint-ORIG-GUID: 9Cfl2wcY5aBEIg6wSxn7BnwnoOf82ag1
X-Proofpoint-GUID: 9Cfl2wcY5aBEIg6wSxn7BnwnoOf82ag1
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b93057 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=WgZgizuZlwTqGGW0kXsA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032

From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>

On the Qualcomm Glymur platform the PCIe host is compatible with the DWC
controller present on the X1E80100 platform. So document the PCIe
controllers found on Glymur and use the X1E80100 compatible string as a
fallback in the schema.

Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
Signed-off-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml
index 257068a1826492a7071600d03ca0c99babb75bd9..8600f2c74cb81bcb924fa2035d992c3bd147db31 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml
@@ -16,7 +16,12 @@ description:
 
 properties:
   compatible:
-    const: qcom,pcie-x1e80100
+    oneOf:
+      - const: qcom,pcie-x1e80100
+      - items:
+          - enum:
+              - qcom,glymur-pcie
+          - const: qcom,pcie-x1e80100
 
   reg:
     minItems: 6

-- 
2.34.1


