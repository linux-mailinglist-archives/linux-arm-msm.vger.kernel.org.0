Return-Path: <linux-arm-msm+bounces-80197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D00C2F178
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 04:10:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2FADC4F4549
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 03:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB56726F2BD;
	Tue,  4 Nov 2025 03:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P6QMXVc2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NxtmWqqW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AC626CE22
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 03:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762225701; cv=none; b=Ki2MKpuGyKQsPxedljSdQabv59oVSCsjjKNvXu2NMmiPaPxEr1E00q4+KmFe2RM+MAur2I8ZvfpLnJiqsmyQVq5e+8EvRgyzdF32f7OxP0r9wj7IRuG3KudsQzRqiTZ1TF+uqRGQXJkbgIlbVMfObIqrPjalAARt6v+n+S9GgBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762225701; c=relaxed/simple;
	bh=bBLHxQuM1GBIsRk5ssQ/N3zpyabEzj2fcdhAh1XrRpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qDf5GeAqV3O9BMkUe4H+oC7UY7RxtsXxGp3SBaZsdGHHs1j6cmrwM6uywgOAocup/AXP0WkXqV3yMkU8Hfusz2J3KbWVb9JnjSjwTeN/40QdSewbKXVA+FF5kwo7IP0HNbOTvuY89k4w0DAxYTZfMpQ7OLGMAEQPz0UZfYvo+Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P6QMXVc2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NxtmWqqW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3H6P0l3660220
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 03:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZJfQCItFekv7BPewHYz0hztHPj86Mo2BtMuiedOKNZ0=; b=P6QMXVc20cI7wswy
	1p2oyldBmzDR+1tPpmDMniHSar2O0FEZkzAsoXWa2JZG+WUJhYJC+RTXRLsD4IVc
	bQmYE2cUqfa3UjlSZfrhujV7AGOejlbpSPoJULbyPdjpDqcii4mGHRM4WMzHXccr
	8r1Xnr6brfP+vwJcvopJK/GtP/fkVRtVcJxFG4ggIp3KdnHqeLKuTyd83bxnKvHH
	YzTkIln+eMP+XqBLV7k6VBXTdhpheYQVTsz6cNwf2ii88sY477hk4zrLKgbWGthp
	4iQPtP4+cjoi4AqfefBx12LT3KWTSbPBtWy8SUBcGjNXZGtk3tMb+YhF+ErXtCZb
	FK0gFg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70ge9e1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 03:08:19 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b969f3f5c13so2126764a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 19:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762225699; x=1762830499; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZJfQCItFekv7BPewHYz0hztHPj86Mo2BtMuiedOKNZ0=;
        b=NxtmWqqWhEO1wxo8vpLtW6Irc83YjGSYhUWcOTHYUwE8IxZyE9YlbQAVRpV2VH5Ybj
         BqrIbfxnaaIFyAfQHFyyqqI2V451UejlkBuxlYwLcfDmEmayZZq7WGPDAQx+7GXfDAOM
         13IYUO+CBAPjT52/3YPOZGqcVmLfa17I8/Xoh8Sol2weukx4EIqRh4nh6ATDEhJiKsLk
         nRylRjzlL8wBBxjz9U1/wPGZK5gbXyNMAO1vTumkpj6DLVQ34Qxe9iQDsRdVgKvBNKTI
         D9p6aTfwx/MI4qqXa4K3mcAC7TBXQLvqgxa5eIRx4bnpr7bv5puwNCGrurCx9RJOEouk
         XwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762225699; x=1762830499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJfQCItFekv7BPewHYz0hztHPj86Mo2BtMuiedOKNZ0=;
        b=cOS+7gJhSfa/d0+NCyuEiKvqaJSYHgUuf6l+uqrsbo8uhsfaIfTBJxqI+RrLmKeU7Y
         co+oLsBx8MpfQfSGepYx8h/AAZ2fUsQTBj2Ih46ZclC8NCvKjDbBNMCQPxK2UOqYz7Hu
         hIn6PcPHqxrcWZwU2fKBpI2zM7nhszKJGY4H+Y+K4o38iA7inMwbB+oXYPgzSSPdYLE1
         2ynXobyVUVUCavv88DWlo8vk1H6aC44k3zA58Ij5MtePCyQGZTDKIysC4gUulkqv50/8
         Y9yonCYBJvYXDNdZwE1JQyKB30Vwd3dT/HJjsD7P/3xWpxJ+zuqUjOwLed7JnjtSLPXx
         uPFg==
X-Gm-Message-State: AOJu0YwIb6DujgKxwBd2zoeS0r9ugFrfWDWCgXRyA8Fzqek+tSxGfwfI
	RP9QW0oNUXdyUsNbtKcR24vLXUbrqMZjQMfNT5vBsF26BOZ9tvR4BcS6x9FCmu1uoJTQwNDRq/5
	SgympVcR6fqOvkB8QtON7+y7dRpN+y66AY4SMF7AGXdeMXeDTEl+b0PxQg4nNWz4RnvPk
X-Gm-Gg: ASbGncthbjTGUMl7+LnVxTt5rFEhgiEIz10GjGB8+nT3Q3NAw+8WiL/CetN8DCHYWTl
	VIkHZ9M1F78eWPpid3SbMQdy4H0AS2y/3EKiSiBT37kj9u/AVqpemD98OKRhh1zQRj8MbZje+Ok
	maYwN7qWE42R9rCW3GALosSriLqrFABzIWYwt1B1ozM4/2uNB7sZxWFrU0QgZMOAJSXSNziZPMV
	ZGuYdGWz3BZt01Mg8x2bjGfQp3ZHFzCEzuodp/xAnOLRT5JhWcCVEv0tIv4Y4GiyUgFIgGdgeaY
	yRNR0yH3zynlPGbMTHxIOXmOj0QOQcXCfjsvq2jsEQL+J85S3eMy3R3Ra161410oPwkvWcvPqaD
	aG0COKmv5FywPMlUW6npA+ShMPr+ImSc08Ssd6zolgneipg==
X-Received: by 2002:a17:903:1d0:b0:295:7804:13b7 with SMTP id d9443c01a7336-295780423bamr102733425ad.10.1762225698622;
        Mon, 03 Nov 2025 19:08:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFc33UcGGj818Nb5860rgoAVQmkdRQZhMR5WsMnCCgiIk8toFOEB9JkcQezjOSGJAdvv5lKiQ==
X-Received: by 2002:a17:903:1d0:b0:295:7804:13b7 with SMTP id d9443c01a7336-295780423bamr102733105ad.10.1762225698122;
        Mon, 03 Nov 2025 19:08:18 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601998da3sm7357365ad.27.2025.11.03.19.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 19:08:17 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 03 Nov 2025 19:08:13 -0800
Subject: [PATCH v3 1/5] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 Kaanapali compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-kaanapali-pcie-phy-v3-1-18b0f27c7e96@oss.qualcomm.com>
References: <20251103-kaanapali-pcie-phy-v3-0-18b0f27c7e96@oss.qualcomm.com>
In-Reply-To: <20251103-kaanapali-pcie-phy-v3-0-18b0f27c7e96@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762225695; l=1624;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=bBLHxQuM1GBIsRk5ssQ/N3zpyabEzj2fcdhAh1XrRpo=;
 b=UR0fAkpFpg39EiW6tJyXORWZjgSKosGrazWYHiMcY6NEXRUM58c1S4Zc6LVABbVW7aYgV67Df
 q7bEYhf1qAqCxK1QhxyshVbYhVROzmz6fx2XcfOewJP5RCmokUlplb8
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: evLcHi6-PBGjT2vHDgMkwoBSHjGJS6SJ
X-Authority-Analysis: v=2.4 cv=bqBBxUai c=1 sm=1 tr=0 ts=69096e23 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=A6CI9_SKnrlR1hncxxMA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDAyNCBTYWx0ZWRfX4P8AsuZiSlz8
 Ahu460knkVUgKMAOGwqfGkxfuiAlITh3wSivXbur1NC8n3DVb9fXkgzJWg4CA13Min+pZoacDgD
 5aI69ZTY0U5kCqbMeCxxddvznQPqq9I2a9aodE2QmnxF2k08SqsdS5xqZtgCIwPrPUQLtqv/bDO
 MCHtQdZY55c2eOETEQc0WaOKh50U2mUyvQ4lWObHagfJroxnKc/pce0L8NxUhCLNkecv4B9WaTJ
 wp94NKvRQmzyvisxt4aDcCbqtGLL7kgQTZqMTt738IHez89CkFpDSlqfNITQSgd/w/4/2HaKtiy
 7xqhetVzNI81QmDWOpTTdDwrJFmw1sqce/Sw7TrXLPa1/EDTYs4FB2WVoXgsTwZ19hOzccDoPIa
 UGKOD2e8Z7eHhKRTQSyP8w62gemeNw==
X-Proofpoint-GUID: evLcHi6-PBGjT2vHDgMkwoBSHjGJS6SJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040024

Document compatible for the QMP PCIe PHY on Kaanapali platform.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 9f5f9af6f6cd8373358ad7ec8303a62f006c1f95..ce06882cfe6020976759225d1febee1b31116052 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,kaanapali-qmp-gen3x2-pcie-phy
       - qcom,qcs615-qmp-gen3x1-pcie-phy
       - qcom,qcs8300-qmp-gen4x2-pcie-phy
       - qcom,sa8775p-qmp-gen4x2-pcie-phy
@@ -146,6 +147,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-qmp-gen3x2-pcie-phy
               - qcom,qcs615-qmp-gen3x1-pcie-phy
               - qcom,sar2130p-qmp-gen3x2-pcie-phy
               - qcom,sc8180x-qmp-pcie-phy
@@ -213,6 +215,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-qmp-gen3x2-pcie-phy
               - qcom,sm8550-qmp-gen4x2-pcie-phy
               - qcom,sm8650-qmp-gen4x2-pcie-phy
               - qcom,x1e80100-qmp-gen3x2-pcie-phy

-- 
2.34.1


