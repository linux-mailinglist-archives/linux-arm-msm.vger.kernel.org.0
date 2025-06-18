Return-Path: <linux-arm-msm+bounces-61684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0A8ADE487
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 09:29:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 782601745A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 07:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC7E827F017;
	Wed, 18 Jun 2025 07:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PwCAAK1q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAFF27F002;
	Wed, 18 Jun 2025 07:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750231716; cv=none; b=qkGWqctjZ7nksYd8Vu6TgfNfs3smu44qUMLEcKsUgS66Gmpkf0xsnQWFExMb+glr0yba1bGq5FAZejMNA3m7uSLMw8jVbYIOCiKgLy859rLA+dkR0EHUrWJZB3uWiivDbiedmc1Gq4y7xyGtDO0e/T4WqWRq+dctqD/OM/tKvKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750231716; c=relaxed/simple;
	bh=AF0B7JwvX2/M839PipUcDNJhAXtXndfcAyet4ZmUPBI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=awefBSt089/Gak/EQCvtsgZCiH8VpRrU+W0ey4qDdi1Yds/gcYZyQYo3dl41FxVbvKGWTEjatyBUSQfBaIqa19gcXhMHw/XTJ5hDZLeNM6nyGTibXUzHllqmu/NvoOi1AHagmBO55/toeLuh3yt4N/Y3uYIgAHgyFbqpydfcwpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PwCAAK1q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HNGjUt003266;
	Wed, 18 Jun 2025 07:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LA/m710QM40
	BZcmWYtG/uWEycjKYEzw6PSWQ6Fk3zJM=; b=PwCAAK1qOZ+qu2XoRyBLtqe+1Vg
	lNUCiyobEPgZ+N+Er9UvbyM0eqxVcAdn+dRRHEHvLs6q5yz7YNxoBDLyVDhvtzD1
	ZGZ68qIfLKcbNcjSLTOY4+UbK0tu71wO27iGYe+bvU7+ZXG9cul5/EMye59Czoam
	zTPD/k8G0iFxA9u5svadFoQf7im+LdGJTOtjwKMFYmbyLbH50eC+iZ+LAmQmrZZq
	LhO2jMzCglLIFKteAkE1M0aKoETGrjKKT8YLOoUg2fkyvVfZ6DdkDYyN9KZd6Fcq
	CrC6A3Q66Q7zRDPjB3uuzcjy1zRSLluC3RXPy+TApyNqOv1mTLIEkOLAAtw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp5sstx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 07:28:30 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55I7SRAU024713;
	Wed, 18 Jun 2025 07:28:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 479k1gnd59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 07:28:27 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55I7SQfs024703;
	Wed, 18 Jun 2025 07:28:26 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-sartgarg-hyd.qualcomm.com [10.147.242.251])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 55I7SQ5U024671
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 07:28:26 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2339771)
	id 419C65C1; Wed, 18 Jun 2025 12:58:25 +0530 (+0530)
From: Sarthak Garg <quic_sartgarg@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com,
        Sarthak Garg <quic_sartgarg@quicinc.com>
Subject: [PATCH V3 2/4] dt-bindings: mmc: controller: Add max-sd-hs-frequency property
Date: Wed, 18 Jun 2025 12:58:16 +0530
Message-Id: <20250618072818.1667097-3-quic_sartgarg@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250618072818.1667097-1-quic_sartgarg@quicinc.com>
References: <20250618072818.1667097-1-quic_sartgarg@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8FycoL8-jFbGWlvnLnxYfy8ofVCaRfry
X-Proofpoint-ORIG-GUID: 8FycoL8-jFbGWlvnLnxYfy8ofVCaRfry
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA2MyBTYWx0ZWRfX95kf5Pl32ycF
 ijDdTYBEG+paCLwxgQhw83GMl+nnXh9/J4sgSr8CdusZI7mnSaa87VjtGw7UdW3Iq0dHycosXKU
 Bo8i3MGDhx7EwAwGUytv+Y1h651iVEdIXro97yZEu+c44SPjUqHuaNqP7twbxOGOfPl0p0FidV+
 Um+0knwCMmS32Um/+WgHVE9qmcuomFykNeQ38NLhZikIfYZN+sO0kBbzxJYzYuA90q2KxZ4anGC
 eSrsbM3P1rxu0bHh0qjvtLTKLP0OAWieLLtwDQmvybLFq7oIWzfSFIZyYEi83kKwU03wT761hmF
 /PXdZlWYty2uLLpq1aDQb0yQkqh4g7K6k7d1lLZjM2BCQzJmdYQJeUux6rz1mirN19dwjDxxSVM
 L0qQwK4pBHWfaMdZaLfgBGGJ1NibwpZ7qMT1VV8VUw22g0wv7bqgYTZsGf8Lj9wv4uZz85Vd
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=68526a9e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=3ITdwszeaz-xxAVJqlwA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180063

Introduce a new optional device tree property `max-sd-hs-frequency` to
limit the maximum frequency (in Hz) used for SD cards operating in
High-Speed (HS) mode.

This property is useful for platforms with vendor-specific hardware
constraints, such as the presence of a level shifter that cannot
reliably support the default 50 MHz HS frequency. It allows the host
driver to cap the HS mode frequency accordingly.

Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
---
 .../devicetree/bindings/mmc/mmc-controller-common.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
index 9a7235439759..1976f5f8c401 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
@@ -93,6 +93,16 @@ properties:
     minimum: 400000
     maximum: 384000000
 
+  max-sd-hs-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Maximum frequency (in Hz) to be used for SD cards operating in
+      High-Speed (HS) mode. This is useful for platforms with vendor-specific
+      limitations, such as the presence of a level shifter that cannot support
+      the default 50 MHz HS frequency or other.
+    minimum: 400000
+    maximum: 50000000
+
   disable-wp:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
-- 
2.34.1


