Return-Path: <linux-arm-msm+bounces-62193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C14AE61A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 11:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87F9F1B61C31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 09:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E1BE280014;
	Tue, 24 Jun 2025 09:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MnYkF6Is"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5A427A931
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 09:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750759160; cv=none; b=mS6gege9LDU5IMZ4l065vi2y3Gjz3XFDnIHVwVnqdL/LeMZD25WiktyltcOoC022obpJhGrjvnincAxiIj2Ca4KfF/ARzaNRQoZpHxir/beEcUwML4QcgIN6idq99Fqywn6tr1DM3aT/EihjZpot7k/WhNu2LBGEDCBM6iwsWB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750759160; c=relaxed/simple;
	bh=Del9Mg8qKsONs5GSrURtb1V+qrL6nqQjIupUZ5ualHs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mhlqAw5G3eW2TqfNIxIUyo4TE4oSDsDy0SICoBvsFXXT9Q9RlHRd/TbtQeR41c2XlPaPAnVWYe+gDlnV7Ug2qWWs9Eu/mhiAtNp8MgZJT03E8R2wA2RRvXprRyElPjgldsxXkddiAqt5wIw/tRZqBztKBLRDjuHYWmwlAL1H03U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MnYkF6Is; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O74Is0032301
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 09:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jp0sIwX7E2E
	Ahi05BS45TpvyiGPx7g9xheU+qhe+MUs=; b=MnYkF6IsBN1ogjUE2DwiLZi0W9T
	RDqnLBoUN8cMX6Gszw5g7XjNWHH1HcyFAn46vAjaHPGRTnmQPJeyoYTGe7lvXp9N
	b+m2mX5rsTdwUPF/wJC3erh6rjuMOogVSuHhFoGCtg1AhgjDrNnXV5lsyr75xCs6
	MbtY/9+XD0uZUn9Ytaa/nMgjPsn1GWiLrCsd9xxngAck7SH7dKkBBudl7mJeBpqN
	VyMrof+Pmz/o5pPpZPIrCshq+dZWeSYMshvxKeqHeghf8L/spne0mCb8AatZqMIb
	u9Nmi0rVah+ee1NJAIURZJyrljL6R7ThUhri9jL9XGUvFQD1NXyfgY/0Orw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1t4kt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 09:59:17 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7398d70abbfso430237b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 02:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750759156; x=1751363956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jp0sIwX7E2EAhi05BS45TpvyiGPx7g9xheU+qhe+MUs=;
        b=Z+DRzkVFWXaOArXxcrdUKIffJ01+CIn7VY2ZwJc5UNxvHOgiFbXYmt756YF2zcjak5
         XpWoT/dfpWsOS6IYo84v4bM7t8d3lpcYUq1/ENR1vTx/nvMfsMuQ6Iy1eC2saAWDnfLA
         Qrro/e3Nw+GHclTYKH7KU+WQE6dZT0BqLKHDFjEP7kWE3BLjSWBW8KyIq9ByH+bFmRgK
         RayiqKYG+uE7r16F9gjC2Mdz/cSjEjRU5nHWymfZeaiTEV5/6J94GLi5WA8z4YKKQKOC
         bWTzTnPh/woDqz/28jEJTLcL07RHPjIDpL0zXKYc+dLWAmPCgSyY9PRjCGd9LBMVlogC
         k4GQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDFUdsumf576LWLCwUM3POsWuE4Fvnp8TYtfqE6Py2efvysTn7ZFyHJPy3rSEoswP6KEQ6BhyYCHYI5ArQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzD3XW1r2qjaap/xCrLJbWSKnGIZ3iHUakDmhOIEf9pJeIyYFvT
	NxwXmYwnA0R94q6tf6VpMR1DTPtqEMmITIlLjWo4fNsa8QAi3rCt4k2wbwQwpxZD95ygmsEsqFg
	yZAvmeV2W64oQ/2jZJkZzwNXm90J53Q+9gmaak1ZXz9PWsaALakHVvBknIQ8k2c4BO+7f
X-Gm-Gg: ASbGnct2TA+SFokhQeHSNW7L7pdHIgg3dXaP4MCy0z7iPs5yF1kibt+pxSwIJYWLVUz
	tBopXIc8T8mRbIZJD6QoKblpGbl9XAfAP3Nwo5IAEqU0Ca5Y7PtG8SfdCoVgwgurhB49kuMirzy
	ucY1PtJSQVFHAoJ/+Jlpq0xocq4Fbaux63uvZLW8gV1UwK6Fwe+ww8HuUhqW5+lQL3HlBAQ+c+Y
	eR++NLfqx6PlZIORyf/1RXcKIrn7nZG60YymCrLLiKHbUPXzsTWwfKJmFom6ixKqAqysbnsSZim
	KKUbzr+DKuKKJeageKY6fhi0zFFWwKsb50FYaROEXQ113zO+R6AyYVUduK8RXzrBGODtYCK1WjH
	I1g==
X-Received: by 2002:a05:6a00:2789:b0:742:a91d:b2f5 with SMTP id d2e1a72fcca58-7490d6089e3mr21503561b3a.13.1750759156370;
        Tue, 24 Jun 2025 02:59:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBdcW94g6W6ZO1JsBLmEcLZoxaG/MEDeLrVmYb/zbIdyWpPel//mQz4saWpm6SU1788XX+XA==
X-Received: by 2002:a05:6a00:2789:b0:742:a91d:b2f5 with SMTP id d2e1a72fcca58-7490d6089e3mr21503538b3a.13.1750759155985;
        Tue, 24 Jun 2025 02:59:15 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e08ccfsm1456443b3a.6.2025.06.24.02.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 02:59:15 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, jie.gan@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: arm: add CTCU device for QCS8300
Date: Tue, 24 Jun 2025 17:59:04 +0800
Message-Id: <20250624095905.7609-2-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624095905.7609-1-jie.gan@oss.qualcomm.com>
References: <20250624095905.7609-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685a76f5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=T1NhNMajUKWQjJ4YovQA:9
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 2OHn4wDS0n-xZsByiUQVon63RwOjMvVj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA4NCBTYWx0ZWRfX9TljEQ/aEWmZ
 /QWvYtssCiBDzQ14l4avSe7Tr38XuIED4RYIG9wJhEKrQfOlToT+bnplbhQYrvp67uBcK3tP+Et
 lA+2hbrnL0XxC6Hr1V26kSrlcY6VioyXLzPXdFNT2N1nFM+iAJsjqSvenbD0xUAOkKpQzVQy65E
 2ArvhnPvqfzC4X7KratW9X8rUmYj3yTVEJlzziu7DMpilvcqxQmMy+bPBmaWRJMq+K0LwcFlEkw
 BepfuiFe9xRE4r7ZMrMWRWJYcd2JX6Wia/FawoFTmbXzfsb4BhlRbdb9ZAkbg0LkN1+5z+NzH2x
 Vhvk64peFeWG3hYPX+UBDoiTBjBwG8udJqM6azRiqqVDVHIWIt1OLvcLgF8p44qTtjMbhKTqFPn
 CdLHayFfuEZU775JZlbjpS6Mcp3M/o8VpVuFeG1gtXfcNkjm9ERu+Kgc144MlE/7Qh20xlde
X-Proofpoint-ORIG-GUID: 2OHn4wDS0n-xZsByiUQVon63RwOjMvVj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240084

The CTCU device for QCS8300 shares the same configurations as SA8775p. Add
a fallback to enable the CTCU for QCS8300 to utilize the compitable of the
SA8775p.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml     | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 843b52eaf872..7f3aa503da53 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -26,8 +26,13 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,sa8775p-ctcu
+    oneOf:
+      - items:
+          - enum:
+              - qcom,qcs8300-ctcu
+          - const: qcom,sa8775p-ctcu
+      - enum:
+          - qcom,sa8775p-ctcu
 
   reg:
     maxItems: 1
-- 
2.34.1


