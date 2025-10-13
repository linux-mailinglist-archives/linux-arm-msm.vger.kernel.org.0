Return-Path: <linux-arm-msm+bounces-76947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 918DEBD2144
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 10:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07BA03C25C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 08:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F3D2F90D8;
	Mon, 13 Oct 2025 08:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cwZvIsb1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624032F90D3
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 08:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760344502; cv=none; b=R7bch31fWDZ+qEDgnP5OIA2kMAlCsRS33w8x7xF6+pBql8rDp2YE6ArIQI04+9HCcAU11ZDGeU2oWxhNXAdhSmWh54nWXSD6mX2GghFZ+fmbaCL9jnaDUn01TuQGVgSnpSRsGXqocAb30cChZg3nwwtWadQAQslNMstpSuFYY+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760344502; c=relaxed/simple;
	bh=r4zZxBjBVbvbXcB/D+W+e8OqRwsnVB6d/ZIuYC3/AKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P+Oc9gZGq+F67wUNErZ/KAmgmEF/7P1/Rb51kulVhuHVBryewTczNmMMBKSQ5Vg2vBwWI35LNPs/1MYStjd48GJ6jQWB11EUtiSPNGwRCbOCcNE/e41ybW3//cNdzj7KCyCY6s96a7daTqU59wMSNZ6B1BJPQWKM9RVfwrZRL5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cwZvIsb1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2n7jZ022230
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 08:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/v17OB+uu1Bptl8Y2P1tJ6IR6+Du0yDfzTF368Kpd3Y=; b=cwZvIsb1Ltph8lOE
	d0A2CwHMpOI3JuTDPnAx76N7szM/7QdgVFn8Ors3a5cCA15ie71Y9lDPlctLq4it
	xL4mA6W3/IsepDeHjUAfy+NX7ollrM160wW8z3nZVvUNY4cXA+OXEribCRIMn5Qg
	d1Tv8K5AnOIdfl73PCo0gIP8gXcRngde43KiKnQ8Ul+2f4YRmnbcoq9A70m75X/9
	e1bMgiWKuyP9/w56K9+5w5yDKWxkZDtKJDpqnAQljHUMfS91VZVVj3VgHqP2T2wh
	w+Jh0qo9ZNIppMpEGK1ecBEmyLChcNwZbkhABAuCnjwzkhIPW4s8o0JXFjifaPqU
	JR8u1g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdfuss4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 08:35:00 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-780fdbbdd20so6797771b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 01:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760344499; x=1760949299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/v17OB+uu1Bptl8Y2P1tJ6IR6+Du0yDfzTF368Kpd3Y=;
        b=O8gONJk0f+JgNoGGXmtDlQzqyzjvixah8tqXm+FSPMWzd/q3EIp1F0j+kvpknKPAom
         y32SlqkMNVOvDYVrPTB1BolJ61FuSNHYNIWkCxb4C6B/GbiL+e/dgpUgRcdQiS+Jzezt
         9JLi3upz6tkeunEMf8uhEk8EXQsI6u1OleTWwJdbmUX1WGsfDl+sEk3icrqnWM87PjnD
         w03MbhspoRNs9HD4k9MrJ89a7DnddEnhAqt12pblytQ1jKw1cmN9m+a369j3n9To30Pz
         Y/uPdo3ZXO197i0GaUhzKq1MhDcgpbhLJc9lp/copZIrxj0LqCNNUWnEOXCLQpIlP1JT
         GZUw==
X-Gm-Message-State: AOJu0YyGm034qv+pc/dT59qBQB8S6/xU3K3kc8wUvT9RXbIvc/S30VWE
	dPnS3xYd7dcpl6h5aY5grQzKk3RmRVar0gHhc801M7RIhDv29oc+RofNV9wVVRW15XnXWAvDpg2
	46gBa7GpqFydwaaz3iXaCZZN1uMIkeo2lnwYRoieeTlBkUxq8AKZTTPuezc6u61ahqRGy
X-Gm-Gg: ASbGncscWlrtwj3NeTv+kaVMUg5fJbD/3VT10R9NFHPChPtnBZeccXk+9NlRf7PPmGy
	ch+eq9udqUW0WSaeRGbY7inoeDztBoebJWTtuAb4B9IYzBBbI7cN7f077/Ofe2IteA+WduZJudn
	DIwZqPrPxsrePtKumWsWb+AUv/p1TvJEfH7aSA/kU+eJXdXx4QfgfdwMV+I27pUnQDMIZik9/GS
	TpzpIQ1lexzMA7XA2SEA5//tJwplczI75TYZO8OSjpxrg7v+AqnpfvSsuRJZRCwnHpQoXKs7lbw
	cJHWkjxitYOCJBbqvAZq935LifKCcdB+CGGTSDt5x2xa0WewATsr6OoyJps1sr7MITnT2E2LMwu
	SJ8Hn4GPENF7c3SSoEX7bUlQ5jrk=
X-Received: by 2002:a05:6a00:1491:b0:780:ed4f:e191 with SMTP id d2e1a72fcca58-79387c18f99mr19637412b3a.23.1760344499566;
        Mon, 13 Oct 2025 01:34:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVDtAXNThQkixGUJDdp47AfSNM9/enQpQjoVqt6LA/SlAQ4k1D/FSKnPcCgyCzCcNttw9ZcQ==
X-Received: by 2002:a05:6a00:1491:b0:780:ed4f:e191 with SMTP id d2e1a72fcca58-79387c18f99mr19637391b3a.23.1760344499070;
        Mon, 13 Oct 2025 01:34:59 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d09a87asm10773251b3a.46.2025.10.13.01.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 01:34:58 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 16:34:37 +0800
Subject: [PATCH v3 1/2] dt-bindings: arm: add CTCU device for QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-enable-ctcu-for-qcs8300-v3-1-611e6e0d3085@oss.qualcomm.com>
References: <20251013-enable-ctcu-for-qcs8300-v3-0-611e6e0d3085@oss.qualcomm.com>
In-Reply-To: <20251013-enable-ctcu-for-qcs8300-v3-0-611e6e0d3085@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760344488; l=1067;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=r4zZxBjBVbvbXcB/D+W+e8OqRwsnVB6d/ZIuYC3/AKQ=;
 b=dTgAM397o822o2LVX3GSqKbj5db3ONamkKk+GoeX0PpDepoq2UzHAhdTaORBIkUNKIoPx6vZS
 u82cSjdu39TCQ5kHevAPZqxjciakCRPd3G9iR+fmc/gk3d7gxOdREiQ
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX9k/How2O/RoM
 7R5h4nqVkGv81VoYYpiMlghQ7lwpYDxvCQ+504fbKW60AhfHD9x7pTq37yG0o9CQ9BiQnXcdtpn
 nxQXyr8/bKwLkHV5N8jsJToxCefaLGgi6V01/HYRsjYOUrn37fb7CKrdXQLoV1dg7EQYcYpHAfU
 QEUKdZYmfve1QmelVo3IfBFn3r+WOQw01t8F9f9ym88/dQj0y4AdSo07XHcYWVRca5Z64iCfS4L
 rkhUinl1TWuyKNwqKG89quc9sFI/oF2uAisyv5aU0JJ49+/bWoYjDeyFQW2mdRWRVLp3Oa4CwTl
 HbtKM7xWBpF6Ks/zZRXHlH/eDyIH3HPlyZ7sHqitm9eWnkMZ3VOVrqI45745EvrWt3VWeg+JlgL
 MDLQEcZlcHHxdgv2ro+xBTrisQv3tw==
X-Proofpoint-GUID: 6TpaBvJjSVSyDwxWWXlmqSTUdVw0_LrY
X-Proofpoint-ORIG-GUID: 6TpaBvJjSVSyDwxWWXlmqSTUdVw0_LrY
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ecb9b4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Y4MeR5hM20t4b5WVKNQA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025

The CTCU device for QCS8300 shares the same configurations as SA8775p. Add
a fallback to enable the CTCU for QCS8300 to utilize the compitable of the
SA8775p.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index c969c16c21ef..460f38ddbd73 100644
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


