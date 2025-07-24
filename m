Return-Path: <linux-arm-msm+bounces-66605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2970B10F43
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 17:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DC963B27CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 15:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46C5E2EACE0;
	Thu, 24 Jul 2025 15:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rp9vTXhK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F4A2EAB7A
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 15:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753372626; cv=none; b=QEnVKp19m5SnupLRTMARMQUHYEKk8SZcAlW/AdXEV5OlztWnHMXZYdJ6QcjwnFMHswYNgrxkKyhMJ7umcxyixBDQJ8fpyQCOj0NUOYql7Rxga09XASDXLRw42CTO4DluH6Fc8P//mLreGxJxmNPRXonMalHC4jfqBsXvHq4Mwr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753372626; c=relaxed/simple;
	bh=7T14pRw0Q8ZjghHfjLjOR1LnpC5mJ0EyzHOg/XJK4FY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NLPGk6I7oS6I+QAMvuBdF4dtoQHhII0Qsibs8HMh5fH8piQ2huSp7/eSqM0Ti9O8B+FJl07pE4RQvhfzEe7uyLQelD6pHchez2DycoUNhwMkRjLh6tUR2qRRD1jembmhljte5ZlLlOfWWCu5TQ28YtBEfat9b68ohcdRRVDUAp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rp9vTXhK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9gEUp028536
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 15:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/eXGMOuQy5U
	D0xBEyKQmMrAv/q+wo0dMe9aS5o4AHm4=; b=Rp9vTXhKzXzy3b5R2M8brgvLf3G
	pJ3w1/OmpLn6mCZcKhFRMoiUvHAp+308LRXtqa3PqpV8iSBSjWmfsiXdI3j6oe19
	e8ekL00hQ+zy76jQwA+UOcd61HacLEJpw1HoG29Q2u3ABG22b4TcRbRCQMsnxKhd
	G+dhmUpPr7uI6GP3+vy5fjzaCcJ+QCYSn31B52aKzTn23WfoOqsw/7npJkWmK15y
	33vVfhARXOrHGcXEvsq64imos9I1HEg7QqePd1AciYeCxeFT7K4Z4EY25cDM8xXI
	vzJjKemQpDX9gpP794np3QGB5l6O1OukfLkrzOyws6Qb2sowmNc3M//JUgg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t1gnhr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 15:57:03 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748f30d56d1so591271b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 08:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753372622; x=1753977422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/eXGMOuQy5UD0xBEyKQmMrAv/q+wo0dMe9aS5o4AHm4=;
        b=U6X/97+tfv/ChkdpbftV32ntvOdsLDkFam+WHmTdeZuP7X5A2tc88jg78WUvbP7DJK
         s6l+8XfuMEenJRDBbHJRWJ7qiafaf9pMgJdi1pc4LlrFVR7PywmYHy9gEz6BV7XAirjG
         VB7QIk5b5aAMx0RWYDs6r9N5chiJrXjG408SywGWOOYyK7r5hGk5xECWPIWAIWq8GlAe
         /bkpIzV995WvQ/8JDIXDxWj0XfMqLL/4xepXWFxAZjSWXmh4R3T1r9rViAs8RZlk8uxe
         BcUZ5dV2HKfB6KnWufRt6NbvGBzdn0MN2aUE5mTu7sOmzhRqSVYD/yzLGJfYeGEQYsqP
         8s2Q==
X-Gm-Message-State: AOJu0YzoYPQGfJspHhxeETmDY82LI1aIKHkKFvCLvoBA04nYmu4YbX15
	Du31gtF5w/BgFDk2bDpKNKqWaL3JnF1qYH3DNri2lgtc2K56lpdOVTXTiqy9QGgVmoHpUdxq4mA
	dPrlQ9CVcPt4OExJlvpFO7x+NY6k8aDs0nvvt+kH4XoxKizbS7aIWvD7P8uXrn/IZyKxg
X-Gm-Gg: ASbGncuLc9Xw72HHkZpq32IhI47WnP70CFYSV2qCaQDCzSVH/FHdY+GCV5OLkyky3k7
	1oNVFvefMsU5sQAX/LfYyceLoU6VKtGuBr2YepUb/VgIvNqCqXKucExRYlC0Q3AUZrSSziDsxCq
	NSVdwvi2rEZKAyO8MuQ0Wlg61cyR3KK5DK5+qE93acPa8n4/xwUJgbc+qrdI3kFDmRJICYufMBN
	vHvpbV8LU6IzfL/8mm541/g8Mtay76eGF3JCNGKWFQ+GlR//0kdDGk6i9pFXo3WvcDy5wupVuSe
	vcB+BRGA+qEIcoRuyeLSX9Yn7rp8TFy54wC0hdPBtHRvZ+amU7G/hVhBM6LgdhvmLRBLxJjcxOF
	s
X-Received: by 2002:a05:6a00:1485:b0:748:f41d:69d2 with SMTP id d2e1a72fcca58-76034c0047fmr11693223b3a.4.1753372622176;
        Thu, 24 Jul 2025 08:57:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQRpVKNYqX8ET8Nc5geOzF3YP+Ip7Ck74EGzan+vHURyt+s/W6A+BS/xt0gTmQP+zPfRHRlA==
X-Received: by 2002:a05:6a00:1485:b0:748:f41d:69d2 with SMTP id d2e1a72fcca58-76034c0047fmr11693190b3a.4.1753372621754;
        Thu, 24 Jul 2025 08:57:01 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761b05e8498sm1988516b3a.98.2025.07.24.08.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 08:57:01 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 1/2] arm64: dts: qcom: sa8775p: Add gpr node
Date: Thu, 24 Jul 2025 21:26:31 +0530
Message-Id: <20250724155632.236675-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250724155632.236675-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250724155632.236675-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: znf7j7cAdnCOJJzV7uWmWdrXxMQcuoCw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEyMCBTYWx0ZWRfXxOWqzGYiL4pt
 avlj6irxgv+Bbpb1w7+6nRkg0519XRfXjfzzDD4qq81K9q+NPSm8iPQ1hRhZln/c45E4xdFm08u
 NpIha1wiEVqiOBg1XuERLSos3tkRYUz0OPSagO8ftbnbbYlaLT1qnPrzR9m+fQ80kVn+tU7dKgV
 okS0x9omLXkF5LjJTLdab4W7ZhWwrMkC9518/CFdB+vrjJ5hXsz/gBONddn0DLt+H15f1XYF3Vx
 oZSVEpGh5Sz24xKMUC48iGAO55o9JPtk3HEs4zj5mdNdLygaR3+ASVn8oXa95TI98mX4XTu1dWk
 Z2NdTOT5DeqIRnqwdHvU61a06/Y98PCKbuMSwIF8dd+vVk0g1Hd0S0AnG+WN/JlkAa+zbCQ+Wdx
 qpohD4AsVYBPJTKaG8bInDQ9nnFMMUpK8Tx8XQF0nPvfJliaHlj2xkxJX2mDfvgEde4n23MK
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=688257cf cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=UhVUwdw8r1UmGneQsTgA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: znf7j7cAdnCOJJzV7uWmWdrXxMQcuoCw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240120

Add GPR(Generic Pack router) node along with
APM(Audio Process Manager) and PRM(Proxy resource
Manager) audio services.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 40 +++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 9997a29901f5..9bbf273ffce1 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -19,6 +19,7 @@
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
 / {
@@ -6584,6 +6585,45 @@ compute-cb@5 {
 						dma-coherent;
 					};
 				};
+
+				gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "adsp_apps";
+					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+					qcom,intents = <512 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							iommus = <&apps_smmu 0x3001 0x0>;
+						};
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
 			};
 		};
 	};
-- 
2.34.1


