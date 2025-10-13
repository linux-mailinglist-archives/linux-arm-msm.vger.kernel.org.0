Return-Path: <linux-arm-msm+bounces-76938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D20BD19B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 08:12:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AAA03BDDEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 06:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D0F2E2EF0;
	Mon, 13 Oct 2025 06:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VVkEe17o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D872E2838
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 06:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760335906; cv=none; b=idgLr90krZp/mKfaYZXEcn7oBDA1s2YPAAN0ygrc/L17jR7dIG8DpFb6di7XWb2zHlg63xne7SEjA35r+QWQfXmxRsRj5tEAtE3HOM45aLLjv5y48Kb2KRDFv+g6LvOKp/JjOspbiI6wV1fE+ee8k0fYBvmPNf3EdEcRNWH2N1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760335906; c=relaxed/simple;
	bh=ril99Wt36AaQWNv+PDjT8BlLjpjvdFqefjO73sSkLmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jzhE5VTZwYZty7I5j9jf9aIOQFkCzgYP23oRr5AKjuH0h/B5v9W8OK3B/MzJJrcqeb/4mH/Hvo3sNUQb9F7ebZpB0R+BGs/NcW+kN8Epyu9D6LVgNMRPzbJmjyicF4mcUJgQgOBGV60xyI9YjIm+dAQ8lnr12Q8a6/Y5rhoOLQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVkEe17o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2nCLd000934
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 06:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iYDtPrC3G6SjHluGEZkqxO1EAHQjQdzxEg9eUYrW+6M=; b=VVkEe17oCPV8uPhf
	QFMprB4pBsjr/jsvuiUR3AFthZI44/2qHNQIgmIF/rHd2pu77KbuhDiNeokJVJD5
	E94to2/M7jKqB3F7ug0iaennxHjIrP4wHLWIk1+eug8MBszbxMmlHzBeeDcp5d/q
	dCeYP0TTdIm+7PNh2t8AfzJY4LZccKHnavjJIZ0usL6RgCUAFFN2eUYvMmMRt3OB
	rEtV2JFsocwDCZCHp6F3iqFI2RF/PAvrtVUEgNBRBlHR3gMwE/mMLlDPlU2dE8vo
	47zrcFZVaMbwJojuxd4PPGG8xsWh8dEwkY6by09syQPgoR9TudBrPZMCAr9FbOup
	MflMGw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd8uevn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 06:11:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-267fa90a2fbso103581555ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 23:11:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760335903; x=1760940703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iYDtPrC3G6SjHluGEZkqxO1EAHQjQdzxEg9eUYrW+6M=;
        b=bUmCH+ThMpmMZLm0gLjQ6d18agO+//4i7tMRS5mOxfa5zeRQRs55oQpIWCkr3Yhff9
         kx8zBbbxxc75GitOD1Ln3/KAzaKg8AUMmcFUPnP6zwaqgzQrrRV3othfE7zkCMKelOjk
         vS/6m7FeCgWdhw0OtWdIoWpDqHqWrdeWuI/zaB/FC+iDDJsFHBBTQonGyVQooS5IWDwE
         YWT5k7xNRho4oIRIj6cavTC8ePja/EZ+eP7lbmom1331Rt7/biPQ6Gz+u8+uJe065Jp4
         dU6/Hoovae7TBk/Sy//pgBTPOjT4cdE4wd5i/MUMyLl6APCJzW90tWJqoQnvEOvuEQm/
         jsLQ==
X-Gm-Message-State: AOJu0YzRau3uy6pjjR7gO6Ed3p81tFJVhGnB2BOp3vjC2BGxyG6cwWhX
	YEtzZkgVZjlOP4ktnglur3n/eZXGWxCsNZwvcrHF/lWjIcH7sf/hwICWH5PUkLMIrNvf40ibLQF
	jrnyHddL3qAr/45fuM13P/Wy4Q9dM1DBO/YFDvmafXE0unsmSB11gEw8Jw1I5l6Jqypyh
X-Gm-Gg: ASbGncuxvnSVpHBcX4HIGYBBW6FecKkuMJwgbgkNKGkks1vFTVjz0MwHnjM3uliHAMn
	flNvv2N95oovHX0c81/Jsah1pfb4DeVzR/tin0jCUBPoh3a4h6JtpP8AICv4zIwJ1C9r2O+vL+X
	qXEzi714OaqJ9TmMXc3amgBrRAk+hkybAd2dGHDN9/31FkQfDQYB77qZYWwZqxYLW2FF/6okGRC
	LHjFuo5//s25ncJIKWqqg/GNhWGyvnS4S8+cY62Jbku/GstN52yJFKeBaK1EuGeo0eBkud97Fka
	bojQwmKcYQd7BlBk6lr8xO7qcp7HSu0NmNpuXlxK6Ll7wqDBaTR+RVpV2WC+nfqUicydC1ALrzS
	UtAUO4CAF+Sc8EDGEUyGaWuux9Ns=
X-Received: by 2002:a17:903:46ce:b0:26e:43dd:ae77 with SMTP id d9443c01a7336-28ec9caed29mr272651935ad.24.1760335903091;
        Sun, 12 Oct 2025 23:11:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEULiUky5u0eNgxl6LX527XaD4MnbBTJXkMtMbnf0uwC+4g+DhLvF8iPLBmq67+54X1JcIZNA==
X-Received: by 2002:a17:903:46ce:b0:26e:43dd:ae77 with SMTP id d9443c01a7336-28ec9caed29mr272651735ad.24.1760335902680;
        Sun, 12 Oct 2025 23:11:42 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2904f61a1desm64388675ad.82.2025.10.12.23.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 23:11:42 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 14:11:16 +0800
Subject: [PATCH v3 1/3] dt-bindings: arm: document the static TPDM
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-add-static-tpdm-support-v3-1-a720b73e83db@oss.qualcomm.com>
References: <20251013-add-static-tpdm-support-v3-0-a720b73e83db@oss.qualcomm.com>
In-Reply-To: <20251013-add-static-tpdm-support-v3-0-a720b73e83db@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760335892; l=1550;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=ril99Wt36AaQWNv+PDjT8BlLjpjvdFqefjO73sSkLmU=;
 b=HvBZBhPoXjlRC0YdVww2PK4swhc3dY0OMjVa0IXNyNsiaBHrYx6rix1xuT7DU9SRmw+65geZN
 kJyQ54ZKrmwC+pp8TNSXg0alrdswDbuTaVRsA3/6eNF0p7W2T1KcFWJ
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: Ofw2Hlh6qNggYsUUKmig9IaMibFZTrCy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX0JF9FSbzLiDM
 tV/3/FyIhEJXntbKk2tcojwa4BY+6wTug37HgR1z4CaYlFwprp1yCuv7b+2dV27qh2NA9Nwjmui
 AxePjgcWgJI/UbET1bx+NM1AHWzMWEFOYswH/tvLO+wiZCUUcubkHcS8jr2mT3tRTqNPd5uTaWj
 RiJT2bh0F1FtnLOZTV06mtllqEJjyZwzpbQBL6S06m6jbkBBw+tKs4OX8j82BkSGHLclDWAl2Zd
 6mBUF8BpQvj5Tlh2N0rk6FU54avYCTNbg2MqPPFTb9K3rcy8ZLFvto3IQO8zm4TYbngqhhMpd77
 1w84TCaJpvB4B1AA2lvb1l3vH77pcXZgfwhHlBYKokk+L5zuD5Y1ZktiyTzu6mxsXm0f2pxdn53
 EafBii/BtYM90mGMkd2epaTl89NhcQ==
X-Proofpoint-GUID: Ofw2Hlh6qNggYsUUKmig9IaMibFZTrCy
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ec981f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=5Z_N_GBq0btHVWfAyk4A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

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


