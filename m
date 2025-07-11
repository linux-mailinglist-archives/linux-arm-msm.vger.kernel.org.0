Return-Path: <linux-arm-msm+bounces-64545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 353D5B019B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 12:26:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC1837A1024
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 10:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA218281531;
	Fri, 11 Jul 2025 10:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lyit5L4a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FE928134F
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 10:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752229559; cv=none; b=J4sWN1GksC/uZGfZTiudi96OFZQupn37v9LX+C93RwyQPNtdTS/WCHZUt0TsDXEs9ZnnMrE4WMDNwhglnqRYj1OFE5z4AvpK6Xeld2WpypieLQheakJ2zoKWiE4DcniAHdjTHVYcnUaZ0h1SIg3oimV3XB0o1WsqUrurOajh3a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752229559; c=relaxed/simple;
	bh=M4/1zW6eg8rGjRFEXSCi8ldnIpnhgwBY1LCfEz3wlLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j9Y9XEaHw0rp0UyAl1nirdiJ9BANtB0vAuTjE0cqMXE/vZI3KA7KnEPOjdcEffvUtQBnXt2TSlO1VXRI+AyApOkgKpNQbn8qllRYstrrIALGo5UcyaSd/dyVyUkni5AUQdH/OxLhYvM33o9bCvNHaOKTFriV/Bp7rDy6PuQSjGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lyit5L4a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BALW5u018341
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 10:25:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LAo7+LmXMWY
	aVSvdOinK2bRx0fazfdgWlxITs8x41dc=; b=lyit5L4acT0WO65hknn5N/a971Y
	qpWZIO/kuc7aXXR6pc16iKf0xh4MaXjPwzNUt5nBwBvws/7euVKyhGLHCKF7Bsiv
	FZyL5WTWH/T609HaC/YVhGpP7HXa82JCEnznezLpm9wx4FLS6egcZYE+KVV56h7+
	FSEg7PCI0PFlUyQaCRCCB20vtc/A5OKmEaUw3Vvutemh3BKS5Sv7F9g58mOA2Co7
	YIZfNR2Z3Qb3dvZIMBkSkf2Q2ijswZmU+7IJ6tlQW0I6wy5NnxhjwKp9NO/VUz7g
	TVeDE6yKClCIQSj6TwdDiog98NUGYYPZK9DoL5+v4qDFmnxy+DJBkoSYr3A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47t83u4j3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 10:25:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2369dd58602so19609205ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 03:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752229557; x=1752834357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LAo7+LmXMWYaVSvdOinK2bRx0fazfdgWlxITs8x41dc=;
        b=a9L+NzmjKSmUpRMzHV7ZQ4flepj+2fzJDAvyG/ZUfWoqthi8i0caq0iah0nqyvGIoj
         Ka8G7xaH59Y9pJj3maDK2sCNeWl2FP69MRvPXAT1zF4GDXr3jhr4b7mG+mUDyzGiPfjy
         yT1zhjcSPN1i/fdMmfXIlmTE+wL0Y6xfHrV0S16HG6GL3IdxAQWCBDOJYGXam3zIs2UO
         WA1/ymM1p2Wo+GGTR+wq/yzvAvsMZcMqovyHUDhwHFpDs/NOtxUU2ePWhD5S728lfZ3x
         nYSKgshaZiX5aGN1pSRX/UXEHDv0IGbhwx5DrGP5UGHVwp6XL/Lva2XafFOvpYE7qnDr
         Zlww==
X-Gm-Message-State: AOJu0Yxh7pTa8rnXpn5eA3nQA53Wp8S8n9KVI3LJ1/hchc6N/8/xRxvb
	/8T4VjkEuXsDbXtENnpTzjC9n0s9oPyqMVI+BJQwspeYU5ZPakSAztNzE2R5OOL1E3IJTciRa6m
	z3LHeGGWZjuhOJ6xTNIxHccaXtKG2Ahmc7yhFwDVVCo1Erk1laSPjntHi9vw0Cv4mJQwa
X-Gm-Gg: ASbGncvCsz6tcgy5H+FbcccnWcPmg0upH2h7tG0QdeSkBaoz8RYBgrC3oorSLjpHiX7
	Y4D1sUE7R3sDMibwpEdwje211eETF5YMFKg8gBoWIaIVMauXxJJKGvC0eZnIqKs3cj4LS6wX4Ho
	QYzs07oMdglGabWthOmwiDggPRmCYPYvA5ixRX65YZ9w9RTbC1/4Ftb88+x0noeIA/WQ7CjMf8k
	T1cvTh4/6HI6BTubFiCGLqJlQpQHX9MOSPgBEAFn8WyOJjqH9qGT19Ltsge1IushZg1cLByIchP
	Mx58Vt0cKP8bcmwMcsDilNLUr4KfbqIjILN7jO6gZbLxYinkZHhMgp43AbBlJ9aixW4xoI+Vft0
	PYnA=
X-Received: by 2002:a17:903:40d1:b0:235:f45f:ed41 with SMTP id d9443c01a7336-23dee1ae472mr35780015ad.19.1752229556280;
        Fri, 11 Jul 2025 03:25:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQv80PZJx79PU5ryxk66WdVg6dRamBPztALKkT8zsOOgqaEemmBQGVGuRSz3CrDGmB5zKI4A==
X-Received: by 2002:a17:903:40d1:b0:235:f45f:ed41 with SMTP id d9443c01a7336-23dee1ae472mr35779595ad.19.1752229555819;
        Fri, 11 Jul 2025 03:25:55 -0700 (PDT)
Received: from a10065738a1d.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de436839bsm42861375ad.253.2025.07.11.03.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 03:25:55 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Odelu Kukatla <quic_okukatla@quicinc.com>,
        Mike Tipton <mdtipton@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Subject: [PATCH V2 1/3] dt-bindings: interconnect: Add EPSS L3 compatible for QCS8300 SoC
Date: Fri, 11 Jul 2025 10:25:38 +0000
Message-ID: <20250711102540.143-2-raviteja.laggyshetty@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250711102540.143-1-raviteja.laggyshetty@oss.qualcomm.com>
References: <20250711102540.143-1-raviteja.laggyshetty@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rojloQRoZiFZnPlWZ6kP1uoXgTQG2hJO
X-Authority-Analysis: v=2.4 cv=OotPyz/t c=1 sm=1 tr=0 ts=6870e6b5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=tdxlyS0QQrc70uz5QrwA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA3MyBTYWx0ZWRfX/63wrUaxgQw5
 Jh3WKOlFzS8dDpWwKPAu/VVdp8GsfbNHr6PtI2oSTxQQYCJOJprxZ4aDCgWFq1wtDYaZKA59cL6
 UySF8UMVMC+FaTn/Ro/W5ZFOpYhbDxoI4hWatfUJjHUGP3RAVecOJUeEcCJsnr9Nb3L1ETgwlZ8
 fqJbhm2dTAuisNt42Ll6HF/cleTHy62xw7vwzYaKl0ibDTKF5oHChWXS2s0KlD84PmeGDiV2MXJ
 V/yt5qcCsghXXPjsPGxiOVMD8iWvOkV/5b6dFV1qs6lwoYsIQKEy5j38maw+6z9pvrRjI/lmHAa
 4ONH83nPUOhSK1aky5eOA+rcc0CAwOXbze8aTMp6GUnbZrNCpWGc/MCGe1w2/mPGd0V9dNRVdhM
 n12oIQWhw6LggOeiYpYE4OHAxppm2DeTtiwlSZVQMxoId6hNTk9vlRKFzYHCS+He1y12A44N
X-Proofpoint-GUID: rojloQRoZiFZnPlWZ6kP1uoXgTQG2hJO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1015 suspectscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110073

Add Epoch Subsystem (EPSS) L3 interconnect provider binding for
QCS8300 SoC. As the EPSS hardware in QCS8300 and SA8775P are same,
added a family-level compatible for SA877P SoC. This shared fallback
compatible allows grouping of SoCs with similar hardware, reducing
the need to explicitly list each variant in the driver match table.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 .../devicetree/bindings/interconnect/qcom,osm-l3.yaml        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
index cd4bb912e0dc..ab5a921c3495 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
@@ -36,6 +36,11 @@ properties:
               - qcom,sm8350-epss-l3
               - qcom,sm8650-epss-l3
           - const: qcom,epss-l3
+      - items:
+          - enum:
+              - qcom,qcs8300-epss-l3
+          - const: qcom,sa8775p-epss-l3
+          - const: qcom,epss-l3
 
   reg:
     maxItems: 1
-- 
2.43.0


