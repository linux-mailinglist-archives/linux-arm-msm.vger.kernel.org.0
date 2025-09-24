Return-Path: <linux-arm-msm+bounces-74763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CA3B9CA2D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:38:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 949EA7A3513
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBD52C17B2;
	Wed, 24 Sep 2025 23:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T+Q1OWyr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C292C0289
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758757055; cv=none; b=Oj40odNP1kRZlLghFplFOT5P5BK7SdH6qt2uBE8vGEkM41M0pa53MEN3jEdnxxr9bgpQjxYMXMEK6ANUy3AL4iJ2BOZKJGYgbjbtp/6kt5iVxVDYBAf5YKDqLgDOSTphNKewZjVYrhVKgwfmVESVN78zQ13vdp4wYnb4Z77sIek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758757055; c=relaxed/simple;
	bh=yEh271CzwWaC8AljYBxBXpSjh6rUZDtONCY/hWD2UMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=by1XGSnr0YDBjzSepVpA4GLc+vZVjwC+0RwKxRRqIc8SpRYPckr5uRR7t5Pq4z3qCQQS15YfdVxxjWqA/cRvtgWSylHSkLnuVbyOCpMLxTZotlfsnkBIMX5/2n8fq7JG2BizXMTd4Mw0qupzdBKiYxgFq3U7SsztR6Cx2L/46JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T+Q1OWyr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCqxGh025092
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sVcW8Q66ceh6MYrzZqjm2SaMfynWCP8KmOA8erMrvnU=; b=T+Q1OWyr61TG8a2o
	f+XWNxmTqoegl9+fULRYU6QZ+hr6fWbTGsUZVIUVGym7pC+D4xYJpDe2PGB4jz9q
	wXcI0q61NjIKF6lScGpk5NJ5aL6wCF5a8RPEIAsZxz2KyCaaK8BWFrPSeMsc7StX
	yiHxGOXXHc71vaEcQMiwO3xOvcvIoGmMtlZcJm7l5LiVFkXE+3TjBBfUktf+iBsK
	VEGr/99ntAuiWjGvy32+wq7R3A9oKWHcFW+iG5C1CBAyTO6WQP4w3AVkRP8WqrgP
	lcmparsFaJgYrZcmIBDBJzQ20gJM/sQxtWc4EQcRcGeGbgdHoRO91mP9GvUXz8n5
	Z574zw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyexccx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:37:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33428befb83so341624a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758757053; x=1759361853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVcW8Q66ceh6MYrzZqjm2SaMfynWCP8KmOA8erMrvnU=;
        b=Lm3TnWsshnrD7eI1Qbr317ox0BVXtCvUxY/9gMB+Ny90FQa7a+my2C10zaZzt/+nMb
         TJiJvnXAnwGpdb1fZrP90cYiqRQI8baiX7GWOb7YesDWk+lAgbCY7lQvndIN9xPKlvpE
         A5Rygb/RhvzGcqxyv/cETD+bpc2ntMY3WCsPQVH5qIgwK7ty6SHUPNl6uxNxZ6ZwWyV1
         ZbabjEqBire7nWz6Rd+pvTboTkqfdsfKon29g/PxKIsathZ/SkzO3OOh4bGkS2Fc8g7T
         Got7BJDaeIcxR+jesIE4+bcHgyMkHnMclCDsutP21FY/Y5nHLC1SrHpBm1Xk8NK/Y/ud
         mlaw==
X-Gm-Message-State: AOJu0YxgUjcWaeeNch9FpzadSNOmoZK8o43dGQlq22DW92Lkgftwnsa7
	xtETvxPfVcFPYz18j+jzqej+9cqk12X7IF8qC5P25stMNyLUKKjpBr6bUVKs+IjyWN4daIKiKtu
	xymvATlLzSHamLuOGy3KCVBX44P3NkdFztRYEtZNklU+P59FYvhIN/OdWpp1R+l1FgKNA
X-Gm-Gg: ASbGncvcrAr5a69+/lr4UI11pnXoapTFP+WjMhnLUE1rdumbnvDfDEWjjq9Z8jdQGrs
	zAW9UsoOg2u+6rBv05Bg+uH8gmI+c4TzfTcxrh5OsPSV8EZ8dPWoTJjgt4nYoKSWVNO/mYgQEUo
	CClqXwCeilYWk3Xp0r4swN8ur3jHYeg3Daj3VLnSVnIRnQbRxBJjA788Rs+2/UFcfwHTBlaSIAJ
	cWoLccOluVp0L7XZKBvU2p3Ar7+2v1ZeMQAQRxDeGTrXeXtmjdoRd9TE/IL0Y0zc8od1Vpsn65u
	6x+WJvB+BymdN2pliTMvP/0pd2MXl5Bc1oJLNwdueTCGeCnBctGA/MAM1fsOMvq4VssrzbdqF8H
	oIZyOCc8/8FUj+kU=
X-Received: by 2002:a17:902:cecb:b0:269:8d85:2249 with SMTP id d9443c01a7336-27ed4a0b73fmr14564595ad.22.1758757052702;
        Wed, 24 Sep 2025 16:37:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXmjvrEnPvGjw08T9XlJAG8e9A/cjwzkIN1aq8g/j/hd6m6hrQcO13lIbbk2ZuOVJncfQ00w==
X-Received: by 2002:a17:902:cecb:b0:269:8d85:2249 with SMTP id d9443c01a7336-27ed4a0b73fmr14564295ad.22.1758757052285;
        Wed, 24 Sep 2025 16:37:32 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33471d73550sm227187a91.3.2025.09.24.16.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:37:31 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:37:24 -0700
Subject: [PATCH 3/6] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali MPSS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-remoteproc-v1-3-611bf7be8329@oss.qualcomm.com>
References: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
In-Reply-To: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758757046; l=1334;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=yEh271CzwWaC8AljYBxBXpSjh6rUZDtONCY/hWD2UMk=;
 b=WgDbDk1afzYHwLEq85KNb5qbz0+EvdnzpgXWnfc3RWJBu97y3uO3RboLzFk3znzNlEShHGrwa
 mRri/sVeo0rAbUjCUirYvhiXbK0n1FQI9Pt6nAixhXy9r80MswFJnqv
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: 1tqBcPAQEFHu79wwgbV2Nvfw4iv5Ma25
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d480bd cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=nKf7ylKirmyFfaXDjPgA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX4Z0KnzQF5Ox0
 lXaYiaXPiVLvuqlXAxyRiC3HF4f7JnIoDJMTWJO080HI9ImnLBFhkcbdt6FT8iZpHv1QTwfXrZA
 nQC2xDOps15zQ8IrtHym0K3DOMDpIo/ORZw1H1LrJ7RLwwzfB9rm6a74rAPs8GNWQJTuNHGHEV4
 AmLvOQ7nVKqVaIT4lpAyWitYfGhUq6Ot3SqDknjSRCzLtWeuH1P446zJZRGih8ttW3LcPLC5n/o
 SfToJHGZ5opdfQJycZ9mzhP+UFKctg0xsUe5NvynHbDONCDAj9LnT1GTWcmjfP01ggWFawkuudu
 HrvXK/Z8tzpu4pKjSLhJWr1SrRrCUxYbyonBLjTTd80Ork9sVqavv5bpni9Yq+aXLgVxXOw7uBW
 PgGF8oeC
X-Proofpoint-ORIG-GUID: 1tqBcPAQEFHu79wwgbV2Nvfw4iv5Ma25
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

Document compatible for Qualcomm Kaanapali SoC MPSS PAS which looks fully
compatible with SM8750.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 031fdf36a66c..b0d2f0371e5e 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -38,6 +38,9 @@ properties:
       - items:
           - const: qcom,kaanapali-cdsp-pas
           - const: qcom,sm8550-cdsp-pas
+      - items:
+          - const: qcom,kaanapali-mpss-pas
+          - const: qcom,sm8750-mpss-pas
 
   reg:
     maxItems: 1
@@ -191,6 +194,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,kaanapali-mpss-pas
             - qcom,sm8750-mpss-pas
     then:
       properties:
@@ -227,6 +231,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,kaanapali-mpss-pas
             - qcom,sdx75-mpss-pas
             - qcom,sm8550-mpss-pas
             - qcom,sm8650-mpss-pas

-- 
2.25.1


