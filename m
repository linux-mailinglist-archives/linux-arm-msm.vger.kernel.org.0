Return-Path: <linux-arm-msm+bounces-79153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FA8C14068
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 11:15:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D8B73BFA0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 10:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D0A1305065;
	Tue, 28 Oct 2025 10:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vvc9m+mf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CFE304963
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 10:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761646333; cv=none; b=JW6H7yEJ+LyH+tz5IU02I6lXTTfACcsNfakceZYbBZrpIq3EaqPJnl2zQKGul07a00zdxn+mm8+bdr9Z/IJM0QPY5yk1Xmw7lHI6z6D8N3v1dzAVxE2HV6xLZ9kOTl2TfJewRcz6qYFgRGdOPS2fZ8GaYuxdBXOhydWei49xyFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761646333; c=relaxed/simple;
	bh=ril99Wt36AaQWNv+PDjT8BlLjpjvdFqefjO73sSkLmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C0eVzD8HCbqcldt8rj9MUCXSTJKSnT6BheA3G86hB85KCw9Tyw9L3TBoYbOOlDxXXh0rCwXMKPq/9ewOgdtUT+di42lcUjVEGEWrwuC6vRIKs5Sp48X6mk/lEpPd7QWY/+cDtTBrCoKyhaKfz7bnUdhpcan2tU5BtuVnS87Jqkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vvc9m+mf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S45IPO573516
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 10:12:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iYDtPrC3G6SjHluGEZkqxO1EAHQjQdzxEg9eUYrW+6M=; b=Vvc9m+mfS8OT9S8t
	5RaG6Y4QXH0PSMcW6M8yaHZfd2mhdkovxcLjjOiL6ul42Re4WpoylwkUgCy2TKvj
	Gg5twFbuk2b1SdsD4umkFQoEb9EcjTIcbimYGW+gHkvUpzWsfh4cI2CckKOnFk++
	k4gq0awmMIa37G1WSiuIQuMPDPkjMvBQTljzxRJ40kjzQCFpCOBJXL9QoRE20OwG
	/7B5A9brzZ2CgcPFkQbZlAKXAxt1TSSZHKy9wWu1I99U4SyA/akBS6XCpBMqst2r
	IeRGRj5GlsfTTT0EUUhm0r0KFvsaECh+ZZfHgl5dHcgCPjZNpZgcQ8jLpI42/hCs
	P6CEFA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2pge9184-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 10:12:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-27ee41e062cso65629755ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 03:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761646331; x=1762251131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iYDtPrC3G6SjHluGEZkqxO1EAHQjQdzxEg9eUYrW+6M=;
        b=xR83DeRUscd+tbjKYtLAUJBaRa41OyxM3L34tKS8vdAzzjYFBn3/LGpL0mm+w8H3u7
         Ij1R4ffAnRkhghQ1BPU7KlHQFlVulcOUhS3K64v0FqGW8eMRkduaocTodWWhx4VkzvCR
         slqN+GWzjABJDcXScZzdTI6NRE2qklWpbmwU4H4pkVMe8+Vk7P7lk1/2VrWw2UB8mdUR
         c4rWG7R04rBT4er78sVqq7zLjyTwDZQm8XvUqqPivj3oqm+GXH7ofunNr7llAzFJSdXq
         9c829RQMfOfeb+EWj6OsQDJ3Rrl/XMw8J3hAAUHHp5RWgXNmt8qTZvgvgZDGXgjpmUuV
         vCVg==
X-Gm-Message-State: AOJu0YwyCEtoSipWdKc8W+csn47gJV6qJiF5nc8o+vY6T1w8GsX2/Ciu
	Q1JZqwsl8idhzGTUf80Xh29bwSrnK3ClGL7vYN0AjwLyKsN/KUFpUEime0Gy2jw1cwri3h2MLba
	YICLV5GoJxR0UQXrsN574T/erNWdRikN6iHxnC6LjLP/z+WBJNVFQ+rS3KdrLdgF6koZUhhWt16
	3dnSk=
X-Gm-Gg: ASbGncsaMJUyD53+Mhm7DAwEIRGeqLS+ID+hi69XqYqPgnY7gtAV6GAgQIr7kEDYtbr
	dOE8Y3ZBWz/7evfwJzTq3uQ9SumG+/JOf3Nn8Dqpc+yVaWAFpNaVOK4WBZqTBwSMSi1iPbj/y6z
	PU7H8ezaVfhsLcwNE7vPkzDB32dZVxuB+M4nzeh82KgmSdEHIdiUg6BtN6QTNvjm+mTsgBbtYax
	d2Y/Wuaoc/hjY8MPRTfX6N3eimWBgl8A5Mpgnd6XClKe+kg1tokh/xryYvikU1AlL0SPVrPmE2X
	PmBIKzw71ti69WYSGsyrHuQUXQz3IKDycxS9wP2SDuwG8AvNQkz+EGfr2pMDfUnlA/r5LrNY58y
	LF5xBVr6z0Oitl4dMDfajGY7bxPhTBDCnOVcrEOBMaa0CpBt2mMzXiAWuIwR6nA==
X-Received: by 2002:a17:902:e5c6:b0:293:e5f:85d7 with SMTP id d9443c01a7336-294cb5186efmr37248155ad.55.1761646330542;
        Tue, 28 Oct 2025 03:12:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFb29YgEWk2tLkfhGz57DmwvdMAhUJDCMmBCcvIBnASLKQ2A1aNC//pQlo+JzoyOuG/gwC8nA==
X-Received: by 2002:a17:902:e5c6:b0:293:e5f:85d7 with SMTP id d9443c01a7336-294cb5186efmr37247615ad.55.1761646329885;
        Tue, 28 Oct 2025 03:12:09 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf423esm110408755ad.19.2025.10.28.03.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 03:12:09 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 18:11:40 +0800
Subject: [PATCH v4 1/3] dt-bindings: arm: document the static TPDM
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-add_static_tpdm_support-v4-1-84e21b98e727@oss.qualcomm.com>
References: <20251028-add_static_tpdm_support-v4-0-84e21b98e727@oss.qualcomm.com>
In-Reply-To: <20251028-add_static_tpdm_support-v4-0-84e21b98e727@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761646319; l=1550;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=ril99Wt36AaQWNv+PDjT8BlLjpjvdFqefjO73sSkLmU=;
 b=mC9O91ScEQM7m0k2xJ3977SHUKVvtGlMU4RgMcCTUIhDtXcp4RUl8RyAH0i257VDDl+paWKOZ
 Ud/cYhe0oszCVKf4JALO09nYTVsuzQS/TGrgVZkmPzzzxnohyEVD1zM
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: ZoAlOo1mryE-H6OS7JjC6wg5rfojnL2d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA4NSBTYWx0ZWRfXydobG7bcWm13
 OjTDYVPn96Iskf1Sn8JS3ZUqLLgoIN7WcgPfW5Af4QnzSfMQcV3PnJfHwLtD0eWT9e/T7PG20Kz
 yhK6l5ORL7oLMEJjSm7m/Btm9CRG9dGU3FMPp6F8hFujZQrZMb6xHnb70KeSaVGw4n3NStcbD7Q
 ICue6nIC1wyaELHwoOz2LEnpQ42iJX99SwqVM7Eb2od4pmBT7A7rBD+AFpZHugEd/FG7D58iMEe
 a3RPZnnfVloi8gfK542UKgkGI8TMV95OMkDA68rDUPCecvF+dZ7PGunZ3C3cFn3Nco+saIfo/yW
 MD4IgTk16D1Vt7puunj6420R/4xIyAEEwpqr3SgP6V7YJJe5ab7tY3tZv2QeMhOoIa4iujZWVBA
 m5ZAfbaj9m14l6cfA1akuy9ymefAEQ==
X-Proofpoint-GUID: ZoAlOo1mryE-H6OS7JjC6wg5rfojnL2d
X-Authority-Analysis: v=2.4 cv=fLU0HJae c=1 sm=1 tr=0 ts=690096fb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5Z_N_GBq0btHVWfAyk4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280085

The static TPDM device is intended for sources that do not require MMIO
mapping. Its compatible string should be documented clearly, along with
an example illustrating how to define a static TPDM node in the DT.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../bindings/arm/qcom,coresight-tpdm.yaml          | 23 +++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
index 4edc47483851..c349306f0d52 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
@@ -36,9 +36,12 @@ properties:
   $nodename:
     pattern: "^tpdm(@[0-9a-f]+)$"
   compatible:
-    items:
-      - const: qcom,coresight-tpdm
-      - const: arm,primecell
+    oneOf:
+      - items:
+          - const: qcom,coresight-static-tpdm
+      - items:
+          - const: qcom,coresight-tpdm
+          - const: arm,primecell
 
   reg:
     maxItems: 1
@@ -147,4 +150,18 @@ examples:
         };
       };
     };
+
+    turing-llm-tpdm {
+      compatible = "qcom,coresight-static-tpdm";
+
+      qcom,cmb-element-bits = <32>;
+
+      out-ports {
+        port {
+         turing_llm_tpdm_out: endpoint {
+           remote-endpoint = <&turing0_funnel_in1>;
+         };
+        };
+      };
+    };
 ...

-- 
2.34.1


