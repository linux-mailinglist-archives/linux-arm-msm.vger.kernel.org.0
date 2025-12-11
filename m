Return-Path: <linux-arm-msm+bounces-84985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9D8CB4D9A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 07:14:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18CE33040A43
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 06:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14D1289374;
	Thu, 11 Dec 2025 06:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dzz6tUlg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="USmQiym0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30162286418
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 06:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765433518; cv=none; b=A6a3zyc4SKyfHsxvLse1sa1HMhCzWP/UNRGWfaGl/VzLDUfQJikGVuQdf6tzF2BxHwds2xvF6DJH5yfBnD99cXsL3Uf73G8rfvxTd+XV1jDBqLX9krtWwVrr92BTHxNE4WjPf1Q3ClTUm7X9PwHc6Gum3nlEzhp27vqARISU8i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765433518; c=relaxed/simple;
	bh=uQDnFuWQfa6/Sdi9CzMqAfsP0M704DoHSxLv9wulLd8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wau2Vh1PO5MguuYvjPQRl1FEBFeeZFJguLatA3Hg5CtKjY5HKONjnBzrLIQIOFtBmdPEOmrk+dtnJsVzMM+Wa0yWcEYZ5nOHnAAi4Ht5ZQyRIJtBD9oVGnU/nX4M2hGihPywNvJhoZIV2n7R9Obzrj+Hk1s3pu2mpOfWJBdXkGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dzz6tUlg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=USmQiym0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALPacN3193450
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 06:11:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xU390iYPL1F5Qvsi5RSyIsOPJpo2qp2MU5IZ2qkkcq0=; b=Dzz6tUlgHM9oRnM+
	1u0bVdPsY5B7Yyyj85RUUJ8mF2HzOAXFR8pifp9/jTFcyDjD5gAtQ2cAPqDJfILe
	KMBQerBP3IpnKrd6UCCfBbSL6IOb3SRrnkgl3XA4aVVEChTzKnq0buC6qTdyDx85
	CoQsp+0TfYZ5JN9CZi49rvV9JwDfA8BxdqXqAye4coOBHv6NTWmbB2OUmvJPXIPH
	RF2Z9YVXdBRW1isJv3BepGiqECPNOWMVZ10M3+cPSwg1dpZbIy/KAMfncLsZBoL4
	6KMpQ1hHtG6yU2qyH6eg+58Sf5rDail4/I4fwi3DAnewgdxM3CfKA+Wqaz6Npsfc
	HACERg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aygrx180j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 06:11:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297f8a2ba9eso6358825ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 22:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765433516; x=1766038316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xU390iYPL1F5Qvsi5RSyIsOPJpo2qp2MU5IZ2qkkcq0=;
        b=USmQiym0MnZGgWWs1p7XM1svWs39F560ys4uGhWCDItWyzgoG3ZJtHnAsKBn1vnuBr
         Kd6RcLNN0mF5KBUbjh7SPTWMNScDGe/puMI/WMEyCs4EdrSr2W2//K2e+0VQvQN9L75c
         Hih+tvyqgeoRKd/jd/uvneGAncCoC7ugJcmyOiOz9xN7e+4zduF7IZEBMpTNwUxxyArA
         pSCAcAsx/FS8bASutdsXLjDRIpgC0GVcqet+2oXgzLzXdRGZSKLp5UbzjVrwywGRYiF7
         Ot2604kcqi7Zi1L1ImR5HOlQKg982+izpkZyCVD1t4UM/HX71Ynk/Wu1+1ONx9RM1fGV
         LNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765433516; x=1766038316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xU390iYPL1F5Qvsi5RSyIsOPJpo2qp2MU5IZ2qkkcq0=;
        b=HMtR2uhMhk9bUBw1V45GnxCJVmpRlJlUoyz2adhld1E8uISJy3LByb1hgDPm12qesV
         3ZXcm/oLwGkS+yfKJvdIpVa5Cwsc7rT9GhCpkv2w/Is/SVr5n2+rV10VvsSOZlbL312X
         GZnUWkhaJha+SJnohCAgA3WTPLy8MPofvK+v30QALH3vyNcCOcHuju8VDXk5QqOEBFfq
         1jBCkGLLPao1SQmh1IlcehtsIphfNiQRG6xc4RrEXWTULRHPRgVDHgWaKtxL10XxLwdP
         sLXuS4PKpBjd1hJ8GVQSUD/vdC/71LZ8A3Ecet6fw3lr7wSQCsB9uEjExU93MjsrExk+
         qzRA==
X-Forwarded-Encrypted: i=1; AJvYcCWc6OFf9rvmrm/YFx2avTA5HLG+vGOO0bANZ4CNNKSSnkqzVkrcOTof2crsmMuRPD6VhVwJR+vzpl1WWYOh@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4DbItj8UaBN4zRDLRSMb7wqwPqvenIhdBF3ihGN4TWmCoT1Hb
	z++cu48VnpGG8pSjoEW7F6nziCWwEoHfC25Ef7n2Hamj4o1BUtyrpH/on6zi+pRkBK6Wht5qeuQ
	nP1F33dpy5/l97NKFZWLjmdAxSOyn8+eZn88UGivalbHCLcQB4hdDCG0MtXiqesHH68YK
X-Gm-Gg: AY/fxX6H2umPkjNCSFeLP7uz4MTQ2SDNN/nwAXXSLIxUmcD3J5xuaSpsPHAQh+G3BSO
	EFytJKN14zbPt3mgxbC53mDjvAv+9BXnPBoO2RmoAgDDbn7SCH5TXpqiXz49MGqHSdvXB7TtJHX
	de/XHc3qbz/IcmbXoUjJIkVY/1HjMTpjWtoFycm9jM5jkmVetYVBoCxuEpq3DT/Rvaqk/HeP4Vk
	/LEsMTMovt8I22u8pSXZ7XnkXIw9EE0PYCbDpRwWAQ9S//GpyI0QkEImg/aF5dFhHWiN3Pflrsw
	KtM/+K1YLyk3/yj341WD5uuOLzsZV9MHDxN7V+GMcdAQmAd7MaUnEtRXHxxb/EpbNvLCgGxzazx
	8i/kcwcM5p3BFfR9aia7j5hKa6rXvKezD0TII1cgCaUvZumiC8bRsbkY2KAl8QK3Ivi+k1P9j
X-Received: by 2002:a17:903:37d0:b0:298:2616:c8e2 with SMTP id d9443c01a7336-29ec2d931f7mr51328775ad.53.1765433515651;
        Wed, 10 Dec 2025 22:11:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEC7bCdOk7ZZttMBSYSwTYu8QQ9vzK9ZaiuFjyDfhihxVmRGXaykxQavGYy0vsVQsfZbu8EXA==
X-Received: by 2002:a17:903:37d0:b0:298:2616:c8e2 with SMTP id d9443c01a7336-29ec2d931f7mr51328505ad.53.1765433515178;
        Wed, 10 Dec 2025 22:11:55 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea065186sm11725945ad.89.2025.12.10.22.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 22:11:54 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 14:10:44 +0800
Subject: [PATCH v8 5/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-enable-byte-cntr-for-ctcu-v8-5-3e12ff313191@oss.qualcomm.com>
References: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
In-Reply-To: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765433484; l=1903;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=uQDnFuWQfa6/Sdi9CzMqAfsP0M704DoHSxLv9wulLd8=;
 b=dtvZNc7Ql0EIwNVK3ZcPR/UHLvwtntV81rVMcD579qhYkfIauSpGzGIQ9h1H5xKu53Dcm3DyS
 wO0rLQgmlE2CxIwwevSyhyC18zapssNyQIas2ur7G7AJhcj3Kq4sEs1
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=Hc0ZjyE8 c=1 sm=1 tr=0 ts=693a60ac cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 7WhunJZGuU2WY4xGjcfxPgeE1gSplPVc
X-Proofpoint-ORIG-GUID: 7WhunJZGuU2WY4xGjcfxPgeE1gSplPVc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA0MiBTYWx0ZWRfXw/qIIydP/oee
 eR7n/bjJ6/nJeKk3Ted03SrSqxe5SXRM9pxK5F/hwg+aZXF6c9GsRQWsF6XwdXZd63fcI51TOR6
 k2QP134/4/GOsSNKi3B34vJ96Z0nHCz4a6qJtCWkPoakVo35nSZpmDJBaTd5xQwrZm9SJe2iqpZ
 Gs4+uW+2mq61iCm0Id0KwEJdZrl55joqaU+FoIHd593E+Z9Sys5flKD7cGeBYWQTcT+adnoDuWx
 kFPla+QXcNKJ/X3MOBc9NmoOX0JGaA77EzJeoi8jCcSSy5sXiU+5lykqOrl+5hMf6YmULHNScfj
 mevxVdSSTbH7aKXjnePUWPw65s03UeMPlPSPnT02z9y0kbZJ+9fC756ZmONR18faySmWwmsoMuS
 GA77UQfHEY/yG14nUFuoGmdEQivuyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110042

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index c969c16c21ef..90f88cc6cd3e 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -39,6 +39,16 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Byte cntr interrupt for the first etr device
+      - description: Byte cntr interrupt for the second etr device
+
+  interrupt-names:
+    items:
+      - const: etrirq0
+      - const: etrirq1
+
   label:
     description:
       Description of a coresight device.
@@ -60,6 +70,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -67,6 +79,11 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "etrirq0",
+                          "etrirq1;
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1


