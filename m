Return-Path: <linux-arm-msm+bounces-59335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EA7AC358E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 17:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 852A27AB6FC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 15:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851021FCFE9;
	Sun, 25 May 2025 15:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DpgBdGzQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA76C1FA15E
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 15:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748188479; cv=none; b=p4KkqZ2YwcCx7AOA73ENYbig0leAZ7Ho+YqSLC2fNuESM0D43+B/hlBwDNe+tQb92yOsirlIbh79M/pbEbhduaMusxhDf29A3irFB9ynjhb+i8yw+0kUd8w+QZrLI1naqY+lnzh3iuiNgNkDHBm6AHzLCQLKX+Rg7YsFkbMyrHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748188479; c=relaxed/simple;
	bh=vFhnjD2nLS307yoil/r7Jh1TA07/zWqWOId060i2bRk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FSvQJS2xhDP7VwV6j5Q/e5P467l3FxMop2BdyiUofVrMDnRKnd3g+ByppSaaVtALY7T3SfR2rvqbjk+CUjdWs3j2ytz+r6THxJRHY65J+v9F61THNDUSaPhbBxFN2+5wcsJiZC0poLk7FAojYYSHWzAAk7L35pQD0p07qqBV2MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DpgBdGzQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54P4xfTF026450
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 15:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kZRaOFKYI5X
	beuENmaqYAXNNwOs5mPBPXmtK+BKVveg=; b=DpgBdGzQ198JNVekENRtXBJaZ7F
	NJGISJ4CF0qDabHkKUFjrErxuxCKTRHVeSEfIqVmWRZbr7f26o13hw095CnBSfQG
	SE7O+8ipC4MzvjVTwFlIg0XdiyTVHMKRXPEwPoWmtptW9DQyBFW2j1pLndPPTRus
	fR1Vggj6xfFYqxtFPh4NCiguq5nSjSHCRhhHNg4EZtlFRtlQEf7O1f1LnRMpqD/t
	bJJgnXKG7Qf+E5+A4ajIXWaroTfbrRte/rkGXm3hyyEgh5E2Qet2jOVJQqTemoVK
	zZnos+hoBWlh453DSjWYMOeP+xX8X7lpEUYUfWqzsyhC+qLqKwaMK+lXDIw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g8t310-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 15:54:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-745e89b0c32so2424145b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 08:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748188475; x=1748793275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZRaOFKYI5XbeuENmaqYAXNNwOs5mPBPXmtK+BKVveg=;
        b=UdqrRUKVFWQ6I42zGp662QmfjhwgtOcJSh+lS8aQ4sVOGiwd5y5iiqGhAPKm0YGY5j
         Ug443Fw+Tev9MzEl4MXmSXdxXnD6A8ydwIiVqpdRWxPgXd0nIEtk9IvMUz4LiS+ZlZ8v
         QAMJhrp8eQI6/cpXT3/gksz3AjXZfvme9zXa3oGIwuByX32IKdEoEV1M5GfrXJdxONmb
         kOCEOPDtrAfNyLAAtWZoZU/oCHcH5doSg0gq0AOxwxMZ7wtwE188JeKT5H5yq9/yYFv7
         2ZDABuCyooWIqkV4xTKSiLNR1tRdPwgloGFDdyAiPxc1DGmINO5B6JkF1PjegfehQM0h
         BWng==
X-Gm-Message-State: AOJu0YwD33WpV9R04rrYJYX/vnYOBTHetaw2MTwJ0q2Tn/ltkZNRokDq
	HUXqpJPmU6Rn8GiqhQwjYz1CWcsKA8fn+OWP4kJZB8spNQQvPqvByyUFjVriQm2RRk6svqYCCBJ
	cCeyxc8H1CW2Sixad9chDOCFo8AX3AG+EiYJS1wYItiLXZwQ+4W3qWrfSDpGDVTtweBC6
X-Gm-Gg: ASbGncumSM6lPlc1mFgyzmJsYWY7iJFoKYNFLnzUif353LPlcY/nQ9TMafJYGjisXuK
	aj52wdvjpemy62sjHj7FbBr7/B2f1ZyftJeHNCgho+BPz92gpkCjj38hA4j+GGiF68UW4GMjrN/
	44rXkgCacLr+YWOhPaVZD01wpBg1ST+KSDgjprm08VAh9KhkYFqYgXGSaUnspz3paI8WUF65ZGN
	4B+GMj84E3IY24MLk7AaXTX7RL68p+IkAwtCI7netCujq61bUXBCkfAC1yS47z/9/bt9RS3tXrb
	bcHzIHlMsdwfsgOteZUXVZmSaqzFFs1E8gaGZM7Z45UoraKL
X-Received: by 2002:a05:6a00:21c6:b0:736:5664:53f3 with SMTP id d2e1a72fcca58-745fe06456bmr8061826b3a.15.1748188475340;
        Sun, 25 May 2025 08:54:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoyuCdtKsWW8jpfX2jHhlwf4Me6hSuTKiLPTNv5/ihyhxbTf0Yjb3AKJtdjeZF2GWTqLtqyQ==
X-Received: by 2002:a05:6a00:21c6:b0:736:5664:53f3 with SMTP id d2e1a72fcca58-745fe06456bmr8061804b3a.15.1748188474910;
        Sun, 25 May 2025 08:54:34 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96de11csm15634488b3a.31.2025.05.25.08.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 08:54:34 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
Subject: [PATCH v1 1/2] arm64: dts: qcom: sa8775p: Add gpr node
Date: Sun, 25 May 2025 21:23:55 +0530
Message-Id: <20250525155356.2081362-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250525155356.2081362-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250525155356.2081362-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=68333d3c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=UhVUwdw8r1UmGneQsTgA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: H-FcbbtpNii7iwlB7RFcACwFtywxxqDy
X-Proofpoint-GUID: H-FcbbtpNii7iwlB7RFcACwFtywxxqDy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI1MDE0NyBTYWx0ZWRfX1PQ+Z9XnhBWc
 Gs3uyW28+U6WDP52xIdaBfmTnhbRFyh5eNWSm6C8Di2wEAlqQCs1ZRedUWamQMzRPR658R+gFp2
 tY/aOHmV+eeiziMzrOU9+3qBRcmE7tJlzqNWkekrRbhQXiY4JRumTyO0qJi8bKlj2qjSWQCKodD
 RZuUAlPnwHJJDgl6BCmFnziVdkpRvbXQJ30AIjAnjta0oEdHksxiL51BH3sxb2OyIxwfo9ayheN
 l5Sl4Ly6FFE82fTKmHc3EEa80n4gNvyUkAGeT6gWnhg3k4j9VmvIefWdgVktBoHpQ1e7ZSmYFKE
 4JTWWspyGW8k8O7Qe6GeXXbVRr4b4xLKzNbhTgWN1usWaAOBE1Q8fw1ln7tJyEAehssB23Vqk6C
 EaNmGV15g3MjP+DjVR3K24oMvHQI4oRUIJojJTYw/4JlAm2voFhGwjRmalRvkvRidCTjUIEa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-25_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505250147

Add GPR(Generic Pack router) node along with
APM(Audio Process Manager) and PRM(Proxy resource
Manager) audio services.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 40 +++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 45f536633f64..187a59e29f59 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
@@ -6109,6 +6110,45 @@ compute-cb@5 {
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


