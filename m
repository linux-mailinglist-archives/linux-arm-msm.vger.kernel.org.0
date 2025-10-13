Return-Path: <linux-arm-msm+bounces-76964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C698BD26E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 12:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0D8B3A44B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 10:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6562FE56A;
	Mon, 13 Oct 2025 10:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LpT0O9Cr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2362FE061
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760349830; cv=none; b=ZQaFMhzxY0FHcl1iIfbpSdLyhMJP0UAC67dE0vM4Vm2hHmNWLjuz3yWudccMoDbJdI1wOuJl6XtS13YRZuI0pODWev7ymiIl5iqcKaJvPm0GL6KkYzIuEjrW3KL2k3KXpQmUvqZUgzPD3qswyUMTfVsoa8yIJkiki0dRrS+D5vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760349830; c=relaxed/simple;
	bh=5S7bewqa2P4aC46GNTPc3Wfn3h92qyoaFLzlTIsn9fM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=et/FbP72yPtw+6cxVjqn6UeJybgJh07amNDM3LrxMCf7hhhYxjWYSp4k/HmGwPmha7w9q+I5qUEApEBCrLjI/rFWOG36IwyUn8vhWyPBqhOwuskW2G2R7XvPJv/AEms3e0rjkCRCJwKHtfdqdRbZZ4bJJRsSJIz+jNPld27zHp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LpT0O9Cr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2nsfj023476
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PFM8hA0K00Qfpbxy4GnLDAkU4MBb9gQY5AMWZmJe2JE=; b=LpT0O9CrPnTcFYzj
	8MbWgTkgPBtL0IbGY4HUZOsmlSYkjD3PYjqbe7GlAF8E7SuRVg5EZi0U4etnqVRu
	EdS0nRYbMSeSP144N5YZQix+HAxYv4w7boXYndPT+gihSqhSQLdVrAEytnjh+i4v
	CELYvkaSly6H6NqnS0cCg2XITSL1oWiGR7qoAqMWHuKySmbnIb+8Ai/b69LftVj9
	hlBXnWsyLnAaBQaDOvxQbsewIaTF59d/+h0knD1kM5aJxaFvanzEsom+nDJaF9if
	ALdtlbWMX3YBAFf2/dackKeF/qOhj+Lh8K0s/7s2MJwwxSw+ZkczcI78hX6tycwb
	eqmZXg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdfv2aj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:03:48 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77f610f7325so6020042b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 03:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760349827; x=1760954627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFM8hA0K00Qfpbxy4GnLDAkU4MBb9gQY5AMWZmJe2JE=;
        b=G0vVEnyXXy9PxlAK91BZWG/U9fC4/yuOFtWu0S6PPfWQeVGhBCPiYa4sHKnjV8f2PG
         iGu/i/twj7WfJ9kgoiHPrSQbQcWGVa1FIEXawSlHB+GCfWhlOnzHg65URUDxVLErkGwK
         OTB6eX2fdNTg+66bWmYBG7ASu1riwbvrQj8OPpLBx37m0XexLFj6dDm0UMH8m6hAoM69
         Nx8Bm6ru0uv3xHYBqDAySoZ3e+XxXyxM266hFE+Oih303A02b0cyMjphzBgV1TVZOkEH
         ggZtzumTdiBMWXflWnj0qPq+IroB3Cb4xkmhfD/UZi+gqd+7Nf9LAdsqZQwQM9a8W8Do
         JDHA==
X-Gm-Message-State: AOJu0YyBjOCV1xIIJUsR1dIx98ADpHSkiOibQkrjmCWZ6aE/+CPAv/2r
	iHIc9r0cgPfcPz1iBLckD1UYgQYhSXSU/cLh9X+8McNpBi6IRtu3+L9uenp1RyGZ59kYsR/M492
	7MKWddUb2woPxKjSV6rWOEXa7BGZf88/n2dAV9scCcVTOP7fHtKpZoqTUB5VVhgbZQXhW
X-Gm-Gg: ASbGncvT6ddI3k9kuth6J1hErCE4IxlgzGy2aS88GIi53b72ppGW3CMFuTi4jOIXlTs
	pFmf23UdTRzpkthDYl0p2hGtLq3hmaaTAsivPI6FUJ9EFXIPTjprEOp2TxXaYQUjcYwn+In8VE4
	OgKeb6Jp4OMxOJEop50Af4zEHXUYJx0JH8BSqC1CQV/WtMTKdYGClbdIEtxi3ZulAZwpK9rlGGr
	H3wnZmgGHLutznfnMscOpFU53zqP45Fm84Yw2I7e+WzlEg5JOe/hDI63iVntLuhWXiQHyubqa5U
	+DifU+e6WzNLZmqxrUE7esM1GtLXi6chFffaYnGqvg03dApCzRNi4BpnwKSm252BnGY=
X-Received: by 2002:a05:6a00:194d:b0:76b:d869:43fd with SMTP id d2e1a72fcca58-7938743fc00mr27742299b3a.18.1760349827323;
        Mon, 13 Oct 2025 03:03:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYhj8mqzvfx+Gmm8tmdtXN1K43jbXhwEsbYRoGFXxfSqXL1HtAguoQA9+KufJW5UnX9e4VnA==
X-Received: by 2002:a05:6a00:194d:b0:76b:d869:43fd with SMTP id d2e1a72fcca58-7938743fc00mr27742259b3a.18.1760349826760;
        Mon, 13 Oct 2025 03:03:46 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d5b8672sm10981657b3a.69.2025.10.13.03.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 03:03:46 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 15:33:05 +0530
Subject: [PATCH v5 01/13] dt-bindings: remoteproc: qcom,pas: Add iommus
 property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-kvm_rprocv5-v5-1-d609ed766061@oss.qualcomm.com>
References: <20251013-kvm_rprocv5-v5-0-d609ed766061@oss.qualcomm.com>
In-Reply-To: <20251013-kvm_rprocv5-v5-0-d609ed766061@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760349819; l=1163;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=5S7bewqa2P4aC46GNTPc3Wfn3h92qyoaFLzlTIsn9fM=;
 b=fjwKLRv6UEHiLGsia3ENpOQwDD/Zvg1ps7kKLeEGJYX81++6k8WJg8nxjIF1Z9+vVUXDs3/qI
 fai2B1PgWs5CMbdbTLtJ7yGde6RfpDrovbb5w4N0tqOFiNerbKTmY3R
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX6iMmDhQ03ou7
 mznlQudlt16BWCWRb2HnRvNS6liYO4c2knQ5PkpNAARUNoMv/7iVaxWKxh6ekoI5JCB+QYwEHcd
 iulHJkU0jKfWLMatja4VRZvck7vmh9wBWk4vwwi5l18xUEcoNeuwzXl4iJp++5ZtLWQZ4E+1Vee
 2L6VAyGRoXkw6/2osRCRBEt5knQFd8jupnx0QmDhkhhFs+1YvZmLllanIT6/BJcPrfQ2jQiVQKu
 jKJwBT5UJklY/5jqnynO6iueOcgv/Oy3CEU69VK52VkefALcxlgGqpGvyT8wPuZ23CxP9MfXVhb
 tvngDBF+FlC67BlDZfao1ZfVRxNSOXKrPA1A5JQWUF9Q+9CJEwDmNyyrwf8tY95le7kr1Qx5xlm
 4boiVwLjSslhxCrdylu6HIfHcPxXbw==
X-Proofpoint-GUID: lMaDW8G6UGcI1jI1VHIwqeiSAXNAaQva
X-Proofpoint-ORIG-GUID: lMaDW8G6UGcI1jI1VHIwqeiSAXNAaQva
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ecce84 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=vdhzk_XxDewY554Buq8A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025

Most Qualcomm platforms feature Gunyah hypervisor which handles IOMMU
configuration for remote processor and when it is not present, the
operating system must perform these configurations instead and for that
firmware stream should be presented to the operating system. Hence, add
iommus property as optional property for PAS supported devices.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index 63a82e7a8bf8..68c17bf18987 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -44,6 +44,9 @@ properties:
       - const: stop-ack
       - const: shutdown-ack
 
+  iommus:
+    maxItems: 1
+
   power-domains:
     minItems: 1
     maxItems: 3

-- 
2.50.1


