Return-Path: <linux-arm-msm+bounces-60799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A59CAD39C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 15:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5691B189B95B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 13:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3434229B8E5;
	Tue, 10 Jun 2025 13:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WRnlXGcL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8427A29B77B
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 13:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563143; cv=none; b=SdF2n/woT9tQe6SLltTf61f+75a8lUhr3sraZDST0ql8+75TapPIO/UhWf/urpyXBaDN+iPg4hlhIetML/9yA5QLKXNikXcapXsrM52lGqxJfMoKOpF7+CN3MGTexEs1M8LVz24E96Y82q76XTEVbn0cuAmpX6GkBbe/AKz84Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563143; c=relaxed/simple;
	bh=NgMsgeUzbu1NBsXjdXusMRPlVqn66otCTDVh6lp/wFo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JKItpR61y/RX4YP38c/h47ly7QIXentjAMpRGNSs64oG59qDPR1Ig3zmGzEoLtpQyUbfDD62husvcTsp38hNJoeWGL16YBTiKs35PHJO93GmZiwutk5WlY90ARod++bFqb30QWQwL0M+iyuDb5QSSUsj3qSeiRcmdpHT5lhX3lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WRnlXGcL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8lfjq017676
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 13:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PafoB/3Wa4/aWlMuKHG6sO8D3G9m6I3Dvq2Y8WMHdVM=; b=WRnlXGcLz9ZroyHP
	1IUThS4u0jBvdxWJgUqSNonQllzfYsXHOEstZ92isBBYboG0FZWLWu6mzIIG2x4h
	hjhvcjZs916GnEFDWuy9046pNKXsoL5yzkfZV8fR2Gz8CmU/xD7KqUU6zlaEsjsU
	mE4qzbn620Ji6TIDQgDJn6SyaAnbypLY1jN/nyJ33g9ffh0/EXeXdSzMLvHErLWi
	DdNowpvhdnv2Z/ow3VoF7dU3hcAOqYOWKRHyPk968cbo7CtyFOq7hU7raSPFCxmE
	24smwm6tGWcr6fAnTk//LfiICRs2En3T4LWL4ck6DFsAvsFeOwGpR252MV688QBB
	K6NB0Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4766mcjc2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 13:45:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-740270e168aso4460889b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 06:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563139; x=1750167939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PafoB/3Wa4/aWlMuKHG6sO8D3G9m6I3Dvq2Y8WMHdVM=;
        b=oa/1y8+vAA+zs7YueEgq4F82cKjX9FQiin5v30KlldBIi79J77qTZ0oNV257wNIFC2
         yYdB5aqIonYrffYluwo+/T35f2Xwf5V6XESNDGK4cvZ3Dc0b/YrWi1CsJrh3Sij0y4n0
         Gxm2gWBMQVU4a3E1FQkwbCdpaYXb6xI4gYFMT9YzmyQnxpdkByQsG8V3GRB7LDOAvz2n
         zR65ECf8m2jZdVRKsURqZOHikyRVbXFCsSG1Dv/6MQr4dXp6+QCoE1LYVyOJw2Vh4AHd
         3SqAi6AVKAtLMKVudJWgwbpb1H5Dt7sMo+4tkgdVZSKl9NhBMTEYQrWv8dG79yCu24JR
         7DHw==
X-Gm-Message-State: AOJu0Yw5gsC4iGf8hOs5IDwL9XgRdhaunWlg5y+XL5kPLhl2rD9SJ9Rj
	/ohq567XPNb/5J7SHeMDBfdR7jh1qxul3BsBHFwq+D8Qa4lXEzosLV0QoFoa5kyRKATmQfiN3yL
	4cqokbTJH0N0Y2VN6ySH1sYSFbY1w6Lr3IGX/XEp9ApyDVIWbJIer+9ZJjvQuFa5iVoZP
X-Gm-Gg: ASbGnctl6+vHGuI+bO/aak1D+U2/3tdfA4GXjyLa3el1RQLieSS98vAIlOkWF7OxxPd
	wkQ8fyeVh9yn1sU+kBF786z5YZQNzZrEirPcXRupno1vKIcqgoWolarq2i23RspGzUzsveG20RT
	ZdbBqY46f42vSv1gLJIMso2xJYAQ5Cr28ENeNhLPDXhfInDNut2uL9gY94Ynwb5Cy86N3pAgUOu
	EMCXLBK9/rv9guXYcs7QAJVvRTDIEhBpQ3CrEpyN2B/q66akaCWpEWCQbghWHjH+nepT9zK/tbh
	v1Cz+seRjxRfvqR0ymPJpe4/tX6zzYiHRKGDIVV1oBUYX3O8W/fINL8O/yKMQebR76NItvNVFm4
	oelsDIXM2QuWVfF3/HMR6qrqzarcDjOhHfblrCeR0UMSP8JI4kUvNRDN5og==
X-Received: by 2002:a05:6a21:8dc9:b0:1f5:6b36:f574 with SMTP id adf61e73a8af0-21f78c75463mr3996070637.38.1749563139148;
        Tue, 10 Jun 2025 06:45:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjjZpNDZxLb9Z6pAdAQAD/xCdCacbKubRpCZmPtfdp4I6UMK9b1IuSydPftAse8qDNXpGldg==
X-Received: by 2002:a05:6a21:8dc9:b0:1f5:6b36:f574 with SMTP id adf61e73a8af0-21f78c75463mr3996032637.38.1749563138749;
        Tue, 10 Jun 2025 06:45:38 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ee70085sm5858107a12.25.2025.06.10.06.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:45:38 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 19:15:19 +0530
Subject: [PATCH v5 3/5] dt-bindings: watchdog: qcom-wdt: Document sram
 property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-wdt_reset_reason-v5-3-2d2835160ab5@oss.qualcomm.com>
References: <20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com>
In-Reply-To: <20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749563123; l=1882;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=NgMsgeUzbu1NBsXjdXusMRPlVqn66otCTDVh6lp/wFo=;
 b=AAqKs26bBLfnLC+UHWUOLU9c8X4MRvyGM2fp3soA+25gWxjKfJX/Z5oJE4C0FOe1K6mihEpAS
 yR1KQRO723eClZQoxeIinNj83GJ9a9AUedp/9sByxmnBDpFJsEn7v/C
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=T8KMT+KQ c=1 sm=1 tr=0 ts=68483704 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=0aCF2Bm0WFNHtCR-1QwA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 9qZmCVGZRBqPvXup6KlPXVtVhYMbhOFE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEwOCBTYWx0ZWRfX+XSBV/fiCjtM
 EvKiQH7k2f3gHrmXjBK1ts4BrCoNx6j202wZ1CqUO4aTp6k+vb+upXY8uemhmNMIsTbyIHTAqOV
 l19bcQAWhYrlQa8f+F9QU4Ft7jBlLP5yy5loW6JsUPi15Gm7GThsGbno0nj3H7/AH+TF7nO8lfN
 JLUoOCSxfmnnPnMYK2cNR/5Lnzjfg3y7/tzi9MDWhVq3bl+gGKTfjVw10+J5pEMeoYLSLj7d9Yc
 1xIcRZ77tJDVmWLKiSAf0Jl/Gswt+mZvkMMRxuO5SjXGEVyMxDrtp0hYUbrpeZupU9fyAh1xVL6
 g7IqQsMXQ5dtDQ8BTzj7U+ubZWftsBQdLXSWhbEbautthMPS3kPbHc4Q+e8YoeQlSdwr9x3e6DL
 8jMsRxfBXp/bcRmrYbaLhZlQG13hFA/+3e2i8jRmn9md0jH0doF39sJWNHASy4xDM91GehmS
X-Proofpoint-GUID: 9qZmCVGZRBqPvXup6KlPXVtVhYMbhOFE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100108

Document the "sram" property for the watchdog device on Qualcomm
IPQ platforms. Use this property to extract the restart reason from
IMEM, which is updated by XBL. Populate the watchdog's bootstatus sysFS
entry with this information, when the system reboots due to a watchdog
timeout.

Describe this property for the IPQ5424 watchdog device and extend support
to other targets subsequently.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v5:
	- Rename the property 'qcom,imem' to 'sram'
Changes in v4:
	- New patch
---
 .../devicetree/bindings/watchdog/qcom-wdt.yaml       | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 49e2b807db0bc9d3edfc93ec41ad0df0b74ed032..74a09c391fd8e2befeac07f254ea16d0ca362248 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -81,6 +81,16 @@ properties:
     minItems: 1
     maxItems: 5
 
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      phandle to the IMEM syscon node that exposes the system restart reason
+    items:
+      - items:
+          - description: phandle of IMEM syscon
+          - description: offset of restart reason region
+          - description: value indicate that the watchdog timeout has occurred
+
 required:
   - compatible
   - reg
@@ -117,6 +127,16 @@ allOf:
       required:
         - clock-frequency
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,apss-wdt-ipq5424
+    then:
+      required:
+        - sram
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1


