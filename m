Return-Path: <linux-arm-msm+bounces-71476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AF8B3F3A1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 06:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 796C37A974E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 04:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A178921B9C1;
	Tue,  2 Sep 2025 04:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tx0hX/cF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D481DE4CD
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 04:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756786914; cv=none; b=I3PsBeKTUjPH8fTuR0HbtiGmtVDWqPRsMLKBu6SzIBO7UV8a5W49xjYanFAK6foJaP7FmQaA+YXW2VoEwtcK1ghEd6jm14xWVNykX0rS8IkxEGvZ4mZ+5a33mNra3rj+KVR0H4yYK3aoKmDNiCofZ+Xz4kI2NIWwXvHHn5dWhGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756786914; c=relaxed/simple;
	bh=4rQuomJxn63UlUApiRL4/ssUmsg1FbUs/Q+l/N/+Xqg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PwPSlKZJ68WAQrNV4cr+kUiuVpWq/JySGoooohqK+mnJFM2WWggnTpkltCwdPb6mWfXZi4tj7EfbEs8OWiqNc8YCVyvM+F9aR8OVa0ezZCcXrhNtZEj3TV4O70Em3hHC0KdNiLqEt4wn8HR1BE2PG3JzMpDEHSs1bjEQHPdEhjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tx0hX/cF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822XAPl031556
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 04:21:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9bU7LeyaV/KsYTU/Ahy5bkqyeYGmMKta5LQ
	jJmIHPz0=; b=Tx0hX/cFKi43yvdv0Gg1btD1TI4mXWB/7UmlqctDNEBnrdqc3Qs
	a7OZGT38BsG1/gjgeQzl6t2fB6lW8u+sBx3cMWZvyP82TY0RMe8lWBufeElnP/lL
	bOsjtczn13A9ox8i8u6+QLXcIcKHuufg1FeQjdp9ggaVZgNAVSSV7ldRAasCMPAA
	TaNkTb6m4kqDKeZthEs2mtZFgbZ1AhMhCv7/+8bqxLQxz8NpSv8OhK0oeyLXfjJg
	1mX1K66GP7HbzzX9tSB//ocMtOEUM1aSScxbttFcgV0cH/n0qKDZ/Bs7WT4kZ6jb
	uU3e14/zkl80yZfOVUDj5W4grLAcWhP3wAg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48wqvw876k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 04:21:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-329e1e3b25bso342921a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 21:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756786911; x=1757391711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bU7LeyaV/KsYTU/Ahy5bkqyeYGmMKta5LQjJmIHPz0=;
        b=ucTCNocY/BaFPWoRMj882bIBbwpiRaZHMLOiMNKU51Y7VAz8BzliZO/IHqUhraKrjo
         7Q+9DSrPSXM3fNt2ViZ5ZlnE8lFMv4N9KHW1UcskIO2kc8m81JmPOi3xVb807eCOHIcJ
         Hkp3Mpdkg52MjctiZHVTH8BkfjEDde+IoEQvcjBj5CimOG2UliudhvfO3VFv1sJLsN48
         W652XKsEMpQOBL+sOSrI42sum1XpW4UpWLpExPyS8KkFq5Y3cTSvokD7C5MlyG4u+3xh
         T0apgsHafohJWo2Gfk3KDMiB6R2bvJNOSV20q3FLUR09zCxv23NZk6WDty41Be1ifMfs
         /UbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNp+gF/nKFpaqzO7Dz0J01oxOMGbsuiFFXh92QovbZg7y6+XYA5b6vVvuykgXqDRF7ZMPwpw+8sTknamgh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+OJQJLRNjrW1jN5jDJmNpA/AUVMErI/wGzAEs82hzeeC8gzQe
	G3KQ4pEXSwC/50mCGji8Aai+K03V2QgxY6+IreX6+ByunLkDONhBrJ5kv1cAotcl049Yx1M/R+7
	jK+qjBVIT+z420GSxvLJrppqAqQmf32D0DmIiAdwA0+KNe9+PUVoqhjoMZ0CC6q10HBii
X-Gm-Gg: ASbGnctOQZCZAbZ2N+MKmQEzjtJGaofJbMX2eAXR78xoaZ/bsiFb1AehV5/aO4LjKkl
	VzR0nGUlaqJPRQGpILJLwN9Rg2azQEFIe/+Xgc6lJT/mmfBQtcDMQuE3nJYnYpSJt7Aud7brr8f
	9Un9rbgeuwMdLlBhvO2NSxrMgQQA1Bje6/lx2KcRLkOza2RvEg4jc7Oi2GXiGliIbeVc1nko2wE
	DkyPbCsDn7pRGH2IhuPNt9wktHQ8Sb66JScpEyTD6WpaEaagt751zq9Lt6Omfa59iX8M9VoRgDd
	hidDTEHIqmKqByg/WoTrXxXvlokiOiWEJ4LRy+YIcWL5Ym0t1fqMiw2OBbjcIMfrBLbKscGTGz3
	J4i6De9Z5sk5W35iu2i+k
X-Received: by 2002:a17:90b:57c4:b0:327:7c8e:8725 with SMTP id 98e67ed59e1d1-32815433ac3mr14669737a91.10.1756786910175;
        Mon, 01 Sep 2025 21:21:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6Fo5tZn3c4vCZ/tlJg7eqO1ZRDpZw+DxrDDeQoxj2rRMppXYawafDP1lJM8A9EeeEI78prg==
X-Received: by 2002:a17:90b:57c4:b0:327:7c8e:8725 with SMTP id 98e67ed59e1d1-32815433ac3mr14669700a91.10.1756786909400;
        Mon, 01 Sep 2025 21:21:49 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd4bd6sm17921724a91.15.2025.09.01.21.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 21:21:49 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v1] dt-binding: Update oss email address for Coresight documents
Date: Tue,  2 Sep 2025 12:21:43 +0800
Message-Id: <20250902042143.1010-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDAyNCBTYWx0ZWRfX+Hpa3l9CZ6jn
 qGNYSENm6RLjnZnCwMM1+4YaeEVjFI1HjgmX+H/O/Q26t/yEhcvR9edvdiNGlVQcQZEs+Q2uSgl
 y581jadL9L3Sgm5mSZVxrwFGbCTqF9gFzoL+B2YnrRza5Y+d9iV0BbVdcUMfwcuXMHPmx5lXFBx
 7HMX4onZwKq8p0u24d8eN9Bkwez/cLHb0JXRFc+cwWsngHqQO3YKfiJnMCnXr2TJvIpaKaPYfEY
 s10LRZQq0WiTHufG5bp1mmn26UrT4atk23R9zs4+ik+eqwBaD+IfSb1Few59DOVvikb23n7/Olf
 nULsMp/2AHzgLQNmjQRRLN1huGFfRpHslz8XsyMYSsHi7ziVsN0nQSiqhsnz7CF9dUpob6WJn04
 PHN3ZBwr
X-Authority-Analysis: v=2.4 cv=WKh/XmsR c=1 sm=1 tr=0 ts=68b670df cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=yJojWOMRYYMA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=7CQSdrXTAAAA:8 a=h3IwZbAuBUFrkWXUJSEA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 6dupNeRvFUiehl5uhgznzhY2hJYTySQ1
X-Proofpoint-ORIG-GUID: 6dupNeRvFUiehl5uhgznzhY2hJYTySQ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509020024

Update the OSS email addresses across all Coresight documents, as the
previous addresses have been deprecated.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../sysfs-bus-coresight-devices-dummy-source  |  4 +-
 .../testing/sysfs-bus-coresight-devices-tpdm  | 56 +++++++++----------
 .../arm/arm,coresight-dummy-sink.yaml         |  2 +-
 .../arm/arm,coresight-dummy-source.yaml       |  2 +-
 .../bindings/arm/qcom,coresight-ctcu.yaml     |  6 +-
 .../arm/qcom,coresight-remote-etm.yaml        |  4 +-
 .../bindings/arm/qcom,coresight-tnoc.yaml     |  2 +-
 .../bindings/arm/qcom,coresight-tpda.yaml     |  4 +-
 .../bindings/arm/qcom,coresight-tpdm.yaml     |  4 +-
 9 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source b/Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source
index 0830661ef656..efd9f96d6eca 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source
@@ -1,7 +1,7 @@
 What:		/sys/bus/coresight/devices/dummy_source<N>/enable_source
 Date:		Dec 2024
 KernelVersion:	6.14
-Contact:	Mao Jinlong <quic_jinlmao@quicinc.com>
+Contact:	Mao Jinlong <jinlong.mao@oss.qualcomm.com>
 Description:	(RW) Enable/disable tracing of dummy source. A sink should be activated
 		before enabling the source. The path of coresight components linking
 		the source to the sink is configured and managed automatically by the
@@ -10,6 +10,6 @@ Description:	(RW) Enable/disable tracing of dummy source. A sink should be activ
 What:		/sys/bus/coresight/devices/dummy_source<N>/traceid
 Date:		Dec 2024
 KernelVersion:	6.14
-Contact:	Mao Jinlong <quic_jinlmao@quicinc.com>
+Contact:	Mao Jinlong <jinlong.mao@oss.qualcomm.com>
 Description:	(R) Show the trace ID that will appear in the trace stream
 		coming from this trace entity.
diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
index a341b08ae70b..86e508a1b409 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
@@ -1,7 +1,7 @@
 What:		/sys/bus/coresight/devices/<tpdm-name>/integration_test
 Date:		January 2023
 KernelVersion:	6.2
-Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>
 Description:
 		(Write) Run integration test for tpdm. Integration test
 		will generate test data for tpdm. It can help to make
@@ -15,7 +15,7 @@ Description:
 What:		/sys/bus/coresight/devices/<tpdm-name>/reset_dataset
 Date:		March 2023
 KernelVersion:	6.7
-Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>
 Description:
 		(Write) Reset the dataset of the tpdm.
 
@@ -25,7 +25,7 @@ Description:
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_trig_type
 Date:		March 2023
 KernelVersion:	6.7
-Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the trigger type of the DSB for tpdm.
 
@@ -36,7 +36,7 @@ Description:
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_trig_ts
 Date:		March 2023
 KernelVersion:	6.7
-Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the trigger timestamp of the DSB for tpdm.
 
@@ -47,7 +47,7 @@ Description:
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_mode
 Date:		March 2023
 KernelVersion:	6.7
-Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the programming mode of the DSB for tpdm.
 
@@ -61,7 +61,7 @@ Description:
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_edge/ctrl_idx
 Date:		March 2023
 KernelVersion:	6.7
-Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the index number of the edge detection for the DSB
 		subunit TPDM. Since there are at most 256 edge detections, this
@@ -70,7 +70,7 @@ Description:
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_edge/ctrl_val
 Date:		March 2023
 KernelVersion:	6.7
-Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>
 Description:
 		Write a data to control the edge detection corresponding to
 		the index number. Before writing data to this sysfs file,
@@ -86,7 +86,7 @@ Description:
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_edge/ctrl_mask
 Date:		March 2023
 KernelVersion:	6.7
-Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>
 Description:
 		Write a data to mask the edge detection corresponding to the index
 		number. Before writing data to this sysfs file, "ctrl_idx" should
@@ -98,21 +98,21 @@ Description:
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_edge/edcr[0:15]
 Date:		March 2023
 KernelVersion:	6.7
-Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>
 Description:
 		Read a set of the edge control value of the DSB in TPDM.
 
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_edge/edcmr[0:7]
 Date:		March 2023
 KernelVersion:	6.7
-Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>
 Description:
 		Read a set of the edge control mask of the DSB in TPDM.
 
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_trig_patt/xpr[0:7]
 Date:		March 2023
 KernelVersion:	6.7
-Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the value of the trigger pattern for the DSB
 		subunit TPDM.
@@ -120,7 +120,7 @@ Description:
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_trig_patt/xpmr[0:7]
 Date:		March 2023
 KernelVersion:	6.7
-Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the mask of the trigger pattern for the DSB
 		subunit TPDM.
@@ -128,21 +128,21 @@ Description:
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_patt/tpr[0:7]
 Date:		March 2023
 KernelVersion:	6.7
-Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the value of the pattern for the DSB subunit TPDM.
 
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_patt/tpmr[0:7]
 Date:		March 2023
 KernelVersion:	6.7
-Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the mask of the pattern for the DSB subunit TPDM.
 
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_patt/enable_ts
 Date:		March 2023
 KernelVersion:	6.7
-Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>
 Description:
 		(Write) Set the pattern timestamp of DSB tpdm. Read
 		the pattern timestamp of DSB tpdm.
@@ -154,7 +154,7 @@ Description:
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_patt/set_type
 Date:		March 2023
 KernelVersion:	6.7
-Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>
 Description:
 		(Write) Set the pattern type of DSB tpdm. Read
 		the pattern type of DSB tpdm.
@@ -166,7 +166,7 @@ Description:
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_msr/msr[0:31]
 Date:		March 2023
 KernelVersion:	6.7
-Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the MSR(mux select register) for the DSB subunit
 		TPDM.
@@ -174,7 +174,7 @@ Description:
 What:		/sys/bus/coresight/devices/<tpdm-name>/cmb_mode
 Date:		January 2024
 KernelVersion:	6.9
-Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>
 Description:	(Write) Set the data collection mode of CMB tpdm. Continuous
 		change creates CMB data set elements on every CMBCLK edge.
 		Trace-on-change creates CMB data set elements only when a new
@@ -188,7 +188,7 @@ Description:	(Write) Set the data collection mode of CMB tpdm. Continuous
 What:		/sys/bus/coresight/devices/<tpdm-name>/cmb_trig_patt/xpr[0:1]
 Date:		January 2024
 KernelVersion:	6.9
-Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the value of the trigger pattern for the CMB
 		subunit TPDM.
@@ -196,7 +196,7 @@ Description:
 What:		/sys/bus/coresight/devices/<tpdm-name>/cmb_trig_patt/xpmr[0:1]
 Date:		January 2024
 KernelVersion:	6.9
-Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the mask of the trigger pattern for the CMB
 		subunit TPDM.
@@ -204,21 +204,21 @@ Description:
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_patt/tpr[0:1]
 Date:		January 2024
 KernelVersion:	6.9
-Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the value of the pattern for the CMB subunit TPDM.
 
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_patt/tpmr[0:1]
 Date:		January 2024
 KernelVersion:	6.9
-Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the mask of the pattern for the CMB subunit TPDM.
 
 What:		/sys/bus/coresight/devices/<tpdm-name>/cmb_patt/enable_ts
 Date:		January 2024
 KernelVersion:	6.9
-Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>
 Description:
 		(Write) Set the pattern timestamp of CMB tpdm. Read
 		the pattern timestamp of CMB tpdm.
@@ -230,7 +230,7 @@ Description:
 What:		/sys/bus/coresight/devices/<tpdm-name>/cmb_trig_ts
 Date:		January 2024
 KernelVersion:	6.9
-Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the trigger timestamp of the CMB for tpdm.
 
@@ -241,7 +241,7 @@ Description:
 What:		/sys/bus/coresight/devices/<tpdm-name>/cmb_ts_all
 Date:		January 2024
 KernelVersion:	6.9
-Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>
 Description:
 		(RW) Read or write the status of timestamp upon all interface.
 		Only value 0 and 1  can be written to this node. Set this node to 1 to request
@@ -253,7 +253,7 @@ Description:
 What:		/sys/bus/coresight/devices/<tpdm-name>/cmb_msr/msr[0:31]
 Date:		January 2024
 KernelVersion:	6.9
-Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the MSR(mux select register) for the CMB subunit
 		TPDM.
@@ -261,7 +261,7 @@ Description:
 What:		/sys/bus/coresight/devices/<tpdm-name>/mcmb_trig_lane
 Date:		Feb 2025
 KernelVersion	6.15
-Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>
 Description:
 		(RW) Set/Get which lane participates in the output pattern
 		match cross trigger mechanism for the MCMB subunit TPDM.
@@ -269,6 +269,6 @@ Description:
 What:		/sys/bus/coresight/devices/<tpdm-name>/mcmb_lanes_select
 Date:		Feb 2025
 KernelVersion	6.15
-Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the enablement of the individual lane.
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-sink.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-sink.yaml
index 08b89b62c505..deaadf1ca1aa 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-sink.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-sink.yaml
@@ -31,7 +31,7 @@ maintainers:
   - Mike Leach <mike.leach@linaro.org>
   - Suzuki K Poulose <suzuki.poulose@arm.com>
   - James Clark <james.clark@linaro.org>
-  - Mao Jinlong <quic_jinlmao@quicinc.com>
+  - Mao Jinlong <jinlong.mao@oss.qualcomm.com>
   - Hao Zhang <quic_hazha@quicinc.com>
 
 properties:
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
index 742dc4e25d3b..b29274f6d5c7 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
@@ -30,7 +30,7 @@ maintainers:
   - Mike Leach <mike.leach@linaro.org>
   - Suzuki K Poulose <suzuki.poulose@arm.com>
   - James Clark <james.clark@linaro.org>
-  - Mao Jinlong <quic_jinlmao@quicinc.com>
+  - Mao Jinlong <jinlong.mao@oss.qualcomm.com>
   - Hao Zhang <quic_hazha@quicinc.com>
 
 properties:
diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 843b52eaf872..6f713d20833f 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -7,9 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: CoreSight TMC Control Unit
 
 maintainers:
-  - Yuanfang Zhang <quic_yuanfang@quicinc.com>
-  - Mao Jinlong <quic_jinlmao@quicinc.com>
-  - Jie Gan <quic_jiegan@quicinc.com>
+  - Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
+  - Mao Jinlong <jinlong.mao@oss.qualcomm.com>
+  - Jie Gan <jie.gan@oss.qualcomm.com>
 
 description: |
   The Trace Memory Controller(TMC) is used for Embedded Trace Buffer(ETB),
diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
index 4fd5752978cd..c68764d759ce 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
@@ -7,8 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm Coresight Remote ETM(Embedded Trace Macrocell)
 
 maintainers:
-  - Jinlong Mao <quic_jinlmao@quicinc.com>
-  - Tao Zhang <quic_taozha@quicinc.com>
+  - Jinlong Mao <jinlong.mao@oss.qualcomm.com>
+  - Tao Zhang <tao.zhang@oss.qualcomm.com>
 
 description:
   Support for ETM trace collection on remote processor using coresight
diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
index 9d1c93a9ade3..ef648a15b806 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm Trace Network On Chip - TNOC
 
 maintainers:
-  - Yuanfang Zhang <quic_yuanfang@quicinc.com>
+  - Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
 
 description: >
   The Trace Network On Chip (TNOC) is an integration hierarchy hardware
diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
index 5ed40f21b8eb..bab80823f0f6 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
@@ -33,8 +33,8 @@ description: |
   to sink.
 
 maintainers:
-  - Mao Jinlong <quic_jinlmao@quicinc.com>
-  - Tao Zhang <quic_taozha@quicinc.com>
+  - Mao Jinlong <jinlong.mao@oss.qualcomm.com>
+  - Tao Zhang <tao.zhang@oss.qualcomm.com>
 
 # Need a custom select here or 'arm,primecell' will match on lots of nodes
 select:
diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
index 7c0acc1f25c5..33ec83901651 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
@@ -19,8 +19,8 @@ description: |
   sources and send it to a TPDA for packetization, timestamping, and funneling.
 
 maintainers:
-  - Mao Jinlong <quic_jinlmao@quicinc.com>
-  - Tao Zhang <quic_taozha@quicinc.com>
+  - Mao Jinlong <jinlong.mao@oss.qualcomm.com>
+  - Tao Zhang <tao.zhang@oss.qualcomm.com>
 
 # Need a custom select here or 'arm,primecell' will match on lots of nodes
 select:
-- 
2.34.1


