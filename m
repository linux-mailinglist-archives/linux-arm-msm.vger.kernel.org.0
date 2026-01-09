Return-Path: <linux-arm-msm+bounces-88204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 66876D07AC1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 09:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3B65304B97F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 08:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D18232F9984;
	Fri,  9 Jan 2026 08:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ww91bUly";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VCECHL7o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764372F9D9A
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 08:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767945607; cv=none; b=D1OFP4VmwUld6+W4K61Rg3us5BGJONpwsz06ITS4b2AYcxM6MGsl17TdfPihNUowvoUFH+2hn7gKmFmkhuyNbDKPGQuhLp1Q64LsJXFlUsW/Xwqe2+hv8wOwCmle3YtDF20wi0wn7T72mq3rMl3S5Y4xXarh7eXgmu5JmIdAOIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767945607; c=relaxed/simple;
	bh=1HUUEjHgDcWjIk9i1IbMh0KQYREmSO/89fEdC+ob1DM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=saz0th8IxbUVgmmZX1BtQJT2X36ogYSnOjBsgpQAcxRye4g/FOUyudHT9hTaZ+ZqACY4wJEzeZ3s5Zuo3VQF5HYVlLCTNKa2vAvxeBmgXxyKbfAvGHEpCtL95P710HoGMXoBmIvqhYiWNqtH86mDXWOxxzDBUY7FbNldm1ow1ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ww91bUly; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VCECHL7o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6095fDuK2765728
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 08:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=So6nutfOYbF
	5hqF4ny0RAy4gW3NAh5oEnV9tydHlSvs=; b=Ww91bUly7CCTtCZj0YID9Jg737c
	wy9yGY9XkocrA6kQyC90mFMgOOPYV4ngiYJF6eF1ZEzH+b4xrYrb1mrXAyD8eRbP
	sa5d1kmrO3lktMb4csZnfTz3+U0DdNbaScIxjzpiK+AYoovRla1lyJsbFwjp65Iw
	msImpT5+WbkdzNEydwNscAGa6Ke6+SCwutFgct0hSDmlbfOjwUE2z8aiC75LZrc4
	nYejN2133uT7RDQfQYaiKSR7l7UVl+ddN85AVakmGfFnqxq0q7chUUVDZbYN4PwI
	jibXRahirqE6sP0QvDraaOwgl0y+dkUSM60Q0SqO7MxURTMSpSwpdN+ggJw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjfejtgtu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 08:00:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c64cd48a8so5157306a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 00:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767945604; x=1768550404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=So6nutfOYbF5hqF4ny0RAy4gW3NAh5oEnV9tydHlSvs=;
        b=VCECHL7ol8dMJh2OCt3i2cO7aV8OyIRH/TeQHOlZ7MWCIhkkVYPh8OCTd18hdYQDAu
         E7s6N/VbbE4J6zZxRQ6rmO0YReMpXNM6+YnsXZOvPMVGEFKF6o/D8wNiYiBFgCMFt2SQ
         KFnAjg6UeJdyjqIDsVZVeJYV7a3MWMuvxMcE8iFaefPdp8IhGpLVbSIyvgeUdobfU5h1
         el0dbKQEo/2iw+X6WIhbN7LOdeLa4IRZnhDj2SgyuoZw+7uuweHT2X53CiTm60huGb00
         tARvOFQ5TpveK4fYHJy0HLwghnbi0IyWJvQ7eSjmcyIcBAROSnP+AyDgCCkPO5LpvBXl
         pkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767945604; x=1768550404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=So6nutfOYbF5hqF4ny0RAy4gW3NAh5oEnV9tydHlSvs=;
        b=tM6LQ4kouQ2nXoxK0Jtp6ioGPAVUPLczX+eumb2v/2j0XXIHJVynBYg/ktLxxZvEGD
         q3fqLF/6LTt6VuQE1AQ/1CrQWqU1EcQ6TYEorbSasWfFO5qv9PnG4urdndYniMDwOMKv
         MNuoDd+fL2XcZ3FOAXX9xDwLGhb3nSe1UJqWUr4q8NXIlNdmAWum7qQe4Y8lWGsFid/W
         ewPqvVWTqWJTc7VvYt9+xIB9jE327WNU2sCc9q2k9yaYiaid9KlkNKLUDqvdQ7hqJ0J0
         fRfCh+0INxq8dZOYzRHK7f4Urs3WOMFVR9U+9JkSS8yh6yDtlF25fh8RH7V6vfbbyzgV
         DUzg==
X-Gm-Message-State: AOJu0YwX9nHLdUnCg439YHJ3wK7pJ0dkGr5Y4Dt+LRtIA6ouHGQHq6Oi
	1kZ6zkHhm+7l12BV5rVsY5kcxaSL1UcKyfSqiS0n9vlkULVPOYQ6Gvr6xIY9nBzn5/mGdneHK8D
	H9Tw3pKtsLHwWUOWfVZs9pNi67WTbKTsd4BxvBGzBplyNYdL2oO0RzKvNEaa2oxKjIV8B
X-Gm-Gg: AY/fxX4jr4cVryKz8FoTMDkmrMZ+AR1htCkg8MIIPEajWuEkIN6ydhLcLsKI2HqFXNj
	JqMpYxkKJyrtTpPLMs6+iVnNqQWy4fLJBZNiNbnhDTuwL2BtMneMFKsD2bTHD9LCZRYvlGzgnBE
	CLl4pSt/Myc0RRYEgruPAnMVxhTN+dQXOeSUNrZvebJatXS1QTVno6TlC/WTO0DJ0rMzYFuC26L
	N+UAqU4XHBz291niwHD0POtCUFy/NgDPKjYQo62YsBnl+p+uQApCr1wjen6FeCwr4ZNK8r9uqCB
	3OauaFQ1SDPktZhtCKtYxUL7IbaydjdBdGtInvJPexOmV7qY4SnyqAucFgYQJaR3Niwdx44i7fJ
	sTKg+0rVeoJ1DuBx+gRo7Xl2HfxDZEPwH9nk5FomIM6/cDiKYCbEmS87Y446MPuRsyFyhQN7dvr
	E=
X-Received: by 2002:a17:902:cecd:b0:29f:e787:2b9b with SMTP id d9443c01a7336-2a3ee4da376mr84508465ad.41.1767945604343;
        Fri, 09 Jan 2026 00:00:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHn5rFtx1GvMUB029blSEEZprEYvRUBpc20cUp2kf1GCPQkbzOszfFVX3fSxMK1pXmnCqJj2g==
X-Received: by 2002:a17:902:cecd:b0:29f:e787:2b9b with SMTP id d9443c01a7336-2a3ee4da376mr84508235ad.41.1767945603817;
        Fri, 09 Jan 2026 00:00:03 -0800 (PST)
Received: from yijiyang-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a56bsm96808445ad.20.2026.01.09.00.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 00:00:03 -0800 (PST)
From: YijieYang <yijie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, yijie.yang@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com
Subject: [PATCH v2 1/4] dt-bindings: arm: qcom: Document PURWA-IOT-EVK board
Date: Fri,  9 Jan 2026 15:59:51 +0800
Message-Id: <20260109080000.606603-1-yijie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260109-purwa-v2-0-f39ee10684cb@oss.qualcomm.com>
References: <20260109-purwa-v2-0-f39ee10684cb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0YZPDYJfS_TZtXNpzRqPYAZwsKuOEDqN
X-Proofpoint-GUID: 0YZPDYJfS_TZtXNpzRqPYAZwsKuOEDqN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA1NSBTYWx0ZWRfX5sFJFjA4Ja/Y
 M6nRJNR1QEkd/WGGKdjqLBFklNIlI1Y2SMiMrwrXIlm4XbnsVsac2dQh8mx0yz0XbtUaz3dhe7J
 6/V0c0kZ+r/gwebn8I/5gi2/GAYyYhgtah7POtYTqM6DpgQCp4NWAIh9KwUNX33BFZFXZHq1ISP
 Dx+iJHxdF05KcKMacyJ8OiLO9aZ4dGsDowqzLdODcnJwgZCNBPX2z4n95BMw1eH2fm8wZBRPopI
 2oBsOgzqfqL9Ou3bZxBPvhI91L/jgTiSG32BlbRKLVW7NMjPbHmal6JxSyL9GdFGNMErFFRbAYr
 vtz0e8OA/NwRnJJ6uA/aABXLDPL1N20QSWm034SD8GNJ31ZOEBwKWc6gNnhC2styB1PE28tgsl0
 +pW9UAtI4taMHiNNAVIczqnfAT8qD5ED3JkqbnkWWKrpQ3XxNtX+9ddTjDJEFsxXAo5Oh4WKN+X
 XCJ9WBMEbEWeZMlTvBQ==
X-Authority-Analysis: v=2.4 cv=ZfAQ98VA c=1 sm=1 tr=0 ts=6960b585 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NXHrG6A95BBPE0CoaowA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090055

From: Yijie Yang <yijie.yang@oss.qualcomm.com>

Document the device tree bindings for the PURWA-IOT-EVK board, which
uses the Qualcomm X1P42100 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..59b8a4267c14 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1122,6 +1122,12 @@ properties:
           - const: microsoft,denali
           - const: qcom,x1e80100
 
+      - items:
+          - enum:
+              - qcom,purwa-iot-evk
+          - const: qcom,purwa-iot-som
+          - const: qcom,x1p42100
+
       - items:
           - enum:
               - asus,zenbook-a14-ux3407qa-lcd
-- 
2.34.1


