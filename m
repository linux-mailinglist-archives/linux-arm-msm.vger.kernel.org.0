Return-Path: <linux-arm-msm+bounces-80056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B14C2A3F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 08:09:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D46E618865DC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 07:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A4D8296BA7;
	Mon,  3 Nov 2025 07:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uv2Ls9ny";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g6DNrLqp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39158BEC
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 07:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762153604; cv=none; b=e4ilnpHZqDGBma/JaVKFnn5xv57rfR+EsW/4D4MLXTLAEmwh6fBd9WwkST5FgVeGq/sPZb/aPhZXKX+QJ3enxtvcQl/nSV33Z4lkV/XfHbDDjEdCmXdnYXhtvlajy3jin9qEgLokE0WCMaj+KUECpgl9eZyZ+dFLrBjNOduJTGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762153604; c=relaxed/simple;
	bh=LaR5CqlC3lOYGvIvKw838CTalqvZf9jUjp1gvGGX5pc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k/8zLOFoJuj4snklzqVRc7M23zB6r3GyXtDZptHV9xQeOrxtsyGwk9HgOuyp8us+WUAyRYhHjnMIERsf6l52dOijICBHVbBIEwQazgCn2cAcWQtWGeOVQbwbvxz+br4UJBRxs4/SxLjvjIUMoOmPl82n5oyn9ApYzPqx68Sb96o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uv2Ls9ny; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g6DNrLqp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A2NboxK1507187
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 07:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cTG5g8K6wUVwsjXMYPNMz2
	lhhLN1ACp3pW1oZUwEcxg=; b=Uv2Ls9nyhxWU6z/GlrUhNkT3KsYGtZVebJ3ClM
	Y3WOy/wlr5iJNk1FAOdafh9uaDRGcz1I6ZkxCcw7Ft8IELxymY5lkIICdFzlSZn9
	bdgFNBrLj8rHIENQwDaTuwUMEAwa3l3sOQ6CjFSBjwOdMw8tro6K/Op7ZDla1fIl
	SJEOXBSrCvfScJ1eDVFAuF4v76mhjiyHjKa5AOxnFvb/gnB0kDSDoEfzWqFckVK/
	gWAzVs+1bu9rk8PcvMxiJJ93nAT33rqsfK9iIb8a3fFFxHkTQJUmHKecBok2Xt7P
	3RnRk7OuyUL7VAHVvK1r/oJ8lzPBgdFwCy+dVOjeHGyjSajw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5ak8kmbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 07:06:41 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso8596569a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Nov 2025 23:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762153601; x=1762758401; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cTG5g8K6wUVwsjXMYPNMz2lhhLN1ACp3pW1oZUwEcxg=;
        b=g6DNrLqpwSe3KCR8y0WbDy3IuQ8zaYuE0zUE/wXROklxAcizvVrU8JcV/rhmvk8R6U
         mLyhu02STduJiLNxMfOwpGt4S8rTeT2riH+ZOeehRy0QovGROmC3yG07M+H05/UeC1lP
         5zx0Jn6i5qe61o+QW6sPLO7iwpD6xlZwi627nQ07e+E3Q/5LWNod70wEwDWgBhRDFfPU
         VECDMTTgt73dkXvVeDMZf4A54MQ/1ysm48EaAhIRLUaxi8D0BKLYZrt/hP+2MWkkwX06
         9LIN8nUBKFQtL+LSFLvyovqFMTzhMXJI2cR10I1wcjHUT6VvSeb1aLBjm8UVTSPhZWL2
         cBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762153601; x=1762758401;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cTG5g8K6wUVwsjXMYPNMz2lhhLN1ACp3pW1oZUwEcxg=;
        b=CZiwj1tB3WADYzUr/LNqJ6xVebuqypzF0WX9/19sW7W19UzXzNUNh/8ZV7GZ73O3D6
         FQpqE0u3L/a6JdPP05KfcYyUB8n7ADh6NIcV4grlXkFnFm2SmuQpDYV24zFqoqJOoU2W
         xuc7etLtOlIz3hy80ggQARuILV0AkltaIV23IqomxfxgdZLdg9Xs3CRY9ojBPuL/UeLP
         J8w6RxCwEzC+hkCcHvP34v5RHYkdzCJeQjsbVQhPGvptesYmpULkmM1qxSK7WfQp5jZv
         mdOoG8tVca1ASIIkGKTiuMFoFsqdsY8FJWG6ulsjMpAHhmOwDPAF/kL5EKDyVm3N4NPA
         Ox9A==
X-Gm-Message-State: AOJu0YxsecD9ncKWTGbJYtIi4Moqz+8PKqZfqv3fRMZERiVQtlOgm8pr
	ONzwLonR+9yl2HVmZ89bDG+9UgpEut0HybzHE2jzSMEy474MP2e+gczIZvy11ohojH/FOcp1xgf
	UFqtBX2A8UaLYd6+tqlZ+ILt4+6rrsF5bNKg6020Hjq2hyD7kkW7gC1YrfwbuAoH2cdRB
X-Gm-Gg: ASbGncvgoIUSLJkQsThfCMiLR9KGz22T9qcOkg4EQ3BcPnGAAZokCQpC2kJJgV1pmbo
	qrkR6QGGNyW/DViNkufuDT49J+9hE+Q1q8u5ESb1EVKc+SHL+CraaeEW4nFhU1l8XAVQLbu5JdR
	m7E6AA3ssVslOPTvPcAacG3TycA1CWTmloJNntw4jMhKOd0pWN7wi1l4c/cRSWd72E/SrnBfVEv
	Fqc2CWLqJin9Elzg8vU6p1uepTuh5F3WseDt+ddUH2a81pXNS0U0jEraEETiEXTaobZHrkw6Zdm
	fp19kco7Wz6pTGwN/OSUzaYtGQDEgL8bxIXyRVl/LlNB4NaHuKl8dbiahf7gpEaAWCOaPvHRNsl
	HP2NtKTD6xj0D2xfsIsVZl8ileDNIGhCL+RmdC7ga/Kw8TOuGxVgBY5WZpOIexg==
X-Received: by 2002:a05:6a20:3ca1:b0:342:2eac:e3b1 with SMTP id adf61e73a8af0-348cc2c20d0mr16084808637.37.1762153600871;
        Sun, 02 Nov 2025 23:06:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjEm8lqtkG2q4G0Ni2a7Y7LUOSuotO8EL6yRaGZqo/W0bt0M+1oMEGawu+3pmRdxZaEDDH2w==
X-Received: by 2002:a05:6a20:3ca1:b0:342:2eac:e3b1 with SMTP id adf61e73a8af0-348cc2c20d0mr16084778637.37.1762153600367;
        Sun, 02 Nov 2025 23:06:40 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3407ef49da8sm5808704a91.1.2025.11.02.23.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 23:06:40 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Enable CTCU device for QCS8300
Date: Mon, 03 Nov 2025 15:06:20 +0800
Message-Id: <20251103-enable-ctcu-for-monaco-v4-0-92ff83201584@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG1UCGkC/x3MQQqAIBBA0avErBsYrTZdJVqYjjVQGloRRHdPW
 r7F/w9kTsIZ+uqBxJdkiaGgrSuwiwkzo7hi0KQ7pahBDmZaGe1hT/Qx4RaDsRHJTbrTznlSBCX
 eE3u5//Ewvu8HPq3lCmgAAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762153594; l=1406;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=LaR5CqlC3lOYGvIvKw838CTalqvZf9jUjp1gvGGX5pc=;
 b=MAJFx8KVKRCpcya3Yw6ZKtPYj4JG9Eq8pAB+dHmgWanznfrZpoVNhR7AFJ41MHFtDHngIr0+B
 DHYzqJD7OjAArIOBGlx6OnLc1VKhs0OQHEMtP/SJqddI+UB+JFj0Nio
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: hhC-m7b2MSu9ooZ8vLZ1eTZy0Xb93xrV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA2NCBTYWx0ZWRfXx1BH/OR1YiBb
 Ggx5nDcvgZoqpx3fVr/v9sFOlQHn0THWnRZYYEtbY14tigYU+4ZM7UDjU0JBxaTlJs/5tdZCER5
 GWha6sLMcoqp8JS+Rz2V5zlvOVp3ZwV465HR4FV4O2GJiSbRZXwm7R3Uf6wN050a0JNtJIkR8EC
 +Ntml/jpFM72Qbf/czniX3GPO46ZDuI+x/VgtPpGv7R6OX3tm/jpuPOcAeT0N5chTt1rTM+Bu7A
 EERuSkopFFglFHYbPQ2sFgHc7tcOdGFg2WzaAQFB+x4Dk9iRapWLB+xam6tOyC+Q4bKDU0vx1P6
 EMVc9x1pPPjH3ECUAugtJDSfmy37O5TsufD2GYjzDq5xfROSiy7ygBT1vp1Ijrrh6fyKMVdN6Ns
 TZRMOzPKZO/wTdst0/SO8JTHvjwbmw==
X-Authority-Analysis: v=2.4 cv=ZZEQ98VA c=1 sm=1 tr=0 ts=69085481 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=OTUKU0M5Age6NIqwexsA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: hhC-m7b2MSu9ooZ8vLZ1eTZy0Xb93xrV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030064

Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in binding to utilize
the compitable of the SA8775p platform becuase the CTCU for QCS8300 shares same
configurations as SA8775p platform.

Changes in V4:
1. dtsi file has been renamed from qcs8300.dtsi -> monaco.dtsi
Link to V3 - https://lore.kernel.org/all/20251013-enable-ctcu-for-qcs8300-v3-0-611e6e0d3085@oss.qualcomm.com/

Changes in V3:
1. rebased on tag next-20251010
Link to V2 - https://lore.kernel.org/all/20250624095905.7609-1-jie.gan@oss.qualcomm.com/

Changes in V2:
1. Add Krzysztof's R-B tag for dt-binding patch.
2. Add Konrad's Acked-by tag for dt patch.
3. Rebased on tag next-20250623.
4. Missed email addresses for coresight's maintainers in V1, loop them.
Link to V1 - https://lore.kernel.org/all/20250327024943.3502313-1-jie.gan@oss.qualcomm.com/

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Jie Gan (2):
      dt-bindings: arm: add CTCU device for monaco
      arm64: dts: qcom: monaco: Add CTCU and ETR nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml          |   9 +-
 arch/arm64/boot/dts/qcom/monaco.dtsi               | 153 +++++++++++++++++++++
 2 files changed, 160 insertions(+), 2 deletions(-)
---
base-commit: 9823120909776bbca58a3c55ef1f27d49283c1f3
change-id: 20251103-enable-ctcu-for-monaco-0db252ddf010

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


