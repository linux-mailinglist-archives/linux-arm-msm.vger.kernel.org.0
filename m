Return-Path: <linux-arm-msm+bounces-76155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DA639BC036F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 07:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B1F834E010E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 05:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF6D2222AC;
	Tue,  7 Oct 2025 05:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B6E67+pb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C840221FF5F
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 05:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759815924; cv=none; b=p/idzmHnck7sUq1M0ZuOszpT5h7pZ0nUqT0QqIpRr3WFIfpGZE8WRZPA92JmtjkylduWnIAHQNzCXTm8ik3M/fe/7L5DE4yOVKdFEEjDe1I+8rAukRfQm+8hhprOZfVXpkOIqqRWo6kDDWSlfzAJBskiGOh509k41ojwQJNv47w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759815924; c=relaxed/simple;
	bh=0EKqpiOX2W6t2od4FIJHfHdUgAzp0BhzNOL2IivIrD0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UJCIx6voVzqZK8wkg6iunmEGtH5mFInasmW/ou2k57/ZNfLuznoNOH3+HENvZE2328oDjIIJk7E4KSQeKD1uRRrKuc3XoLxK7iV5TStKOiJjicQwzFuY+prQE2eLk8GF3U1xk3KO2MTqcsKA6NQmduOcorsP2o0wGnDziRmo8NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B6E67+pb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5972DEH7020414
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 05:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9+2/mAql7qM
	E7oKEfw/drCG/IAJJAuQWzrKVBwLb+QU=; b=B6E67+pbDyCouZ9jM/Qa3uY3WxO
	uCMt3ikvIFS+yUXHnMLi4lZ3wW4yckNGmZInNInB93KC2uh4mB2VUFN30MzrzEii
	bnkMCKOyAcDL8PaWu/vcNsSsut9Tmx+Z99I8tnnH2pEAVrwCnONxDTT7FTqaaUvt
	lvPh/4vJ65EzufI+Lfuofkq4Z/y24AD/f3t5SlodmDhDwYa4lF7tEYjyTZqvM4VF
	ojIxCz+akdg2UVTvdbnaFD9/True7EWMcRdDfrB+wEeYO1xkTuva3b89iYdz1iIP
	Ch03K/jGbDWiAKW6YnbsmF9GiJrf3YVJnM6nTja+2QYtnGlir/6rvbFElKw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junu65ep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 05:45:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-335279648e3so1674897a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 22:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759815920; x=1760420720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9+2/mAql7qME7oKEfw/drCG/IAJJAuQWzrKVBwLb+QU=;
        b=D3zZDzsyYiLfWL1IBY4HLKKvQ2glUSGlWd432NyX6CeN+yimyi7qm5PPcQieWl6lh5
         5SdY3A1s6z0EZTP6tKbm240YD3f1MfcZkv+FD7V+zIUZxea3S+SxwqiUPDJQHt3M/Qyn
         JXmoRTpM0ahM+3i7/2dDak7mjFqnO6oXu8hllCVqwrj2fl7PTh7I0ukpIM16b4Yr+z7f
         aM7kTLyMNWVio1/crCeHqZ2bTGQ1T50NOnpMOpFZCuOel18m+JF1u3/Fo5bvQ/Hguv6u
         lGGmaUNeo7mbBMXTJ5/+dTbAEosxE8/46LchLQ42c7hd4ELn1AIlU3IFUGP9Xa9bxBf9
         36fA==
X-Forwarded-Encrypted: i=1; AJvYcCXerOASy2MGbczfCGkVWOJ0lzvVrGtzBFVh+81l9oTHmLqzPKIhwlxOJ0tU5B6U/9qlmrpshb34RdaNyPLt@vger.kernel.org
X-Gm-Message-State: AOJu0YxLcsXmEMXXYBkiGKY08DGkdRKhR5KF7wZJNvwPa6BwtNVFru6x
	nZDUKdPtih1okqCpmgvT5XUgrCx8N40OP84DNIkCg5KNLZ0emdTsI+Qvj7kP/H+WCKnNm558j7L
	p2zMrbjcnPxd++F3At3TcjZ1BkdmAxEvwbDS2GJ6X6EDp6I/SD9wf7jxPKYZ+7jVMG8c=
X-Gm-Gg: ASbGnctn9CsKkioLX6O4qtrw67cx3qb4Ii4v/NGc4r1Isl30XFSQ5pk/3t4bBRlgNIo
	y9SFXjGCu9dZBDuS2m1u6Vc1mXJG0cP/RWrWMLKO4F36WYLrL8S7VYYquu6kGxbIt7pQoyEYATX
	qt7qN8TgkkZ99csZeuZHJvFJvbh9Z0fAL3k3iYmYX92JkyftGxUnTQBEtixQ8APGaP4kyOxKmaD
	gg9f0JXHw8GhnmLM2NqcnJ2ZCBM7pOcYetoSNpBtBRuZa31nFcMTQnoNq9GflEqdSXKrCDXWkiZ
	gwdBO82Ie9UviK/lFZBW9EcwLkbLxsJgprw/4iJG74+D6GzHm/LtcG6sTnoE62J018gWFSdtO5x
	2
X-Received: by 2002:a17:90b:180a:b0:330:3fb7:d874 with SMTP id 98e67ed59e1d1-339c27e2dc9mr10875370a91.8.1759815920170;
        Mon, 06 Oct 2025 22:45:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpTJcfZZfCFrzDxUSpYGZieF1ZbCv44oGSarVlu+9sfLvIJsOg1g2Arn6saahohiElBO/B6A==
X-Received: by 2002:a17:90b:180a:b0:330:3fb7:d874 with SMTP id 98e67ed59e1d1-339c27e2dc9mr10875345a91.8.1759815919699;
        Mon, 06 Oct 2025 22:45:19 -0700 (PDT)
Received: from hu-sartgarg-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339ee976b81sm502624a91.6.2025.10.06.22.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 22:45:19 -0700 (PDT)
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Subject: [PATCH V1 3/3] arm64: dts: qcom: sm8750: Add SDC2 nodes for sm8750 mtp and qrd board
Date: Tue,  7 Oct 2025 11:14:45 +0530
Message-Id: <20251007054445.4096630-4-sarthak.garg@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007054445.4096630-1-sarthak.garg@oss.qualcomm.com>
References: <20251007054445.4096630-1-sarthak.garg@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: o9Qm_TgUApRmPfTNLpmJ24DvhiLbqvIp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfX9bY+UFvh1dXB
 P7Pre2Vy7LiIhRMXczJI/LDamQ/Hy2ThsCdIfn7odVEHc9TMdlCURNjgmX0Es78VCML2r3YmLjz
 NN/QrAzImBfhr7rS/JF5Qrne6KKgkaVr+ON78g8QihZ19Li9AVK7HfutQCYNn5obQtnMu6b10Zy
 JMQiV2Eg1pbjMpcgVkWS3xyQFUaBh+uVPQHO01O7UEd0p5c80pWHTN2D0VjFWNj+idD+jS3qABv
 hyFCtp2ys+XbzUrIYr5WntiAsJfqhOPJNqo14m6N6mMQPa8KDz4IvEDeyGm7xRXQ4P4fMqOzhNI
 jmHCvHW/vvI4L0x/+T/JicipZMdA3FZYIUacYrdh4j6CK/wiploac2eWDjsRY1GcTbxsbr5ICGE
 qFAKsu0a8ua/3aSQ09u4zjRgnqgofg==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e4a8f1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=byWEWhS8dMihj_ejDHYA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: o9Qm_TgUApRmPfTNLpmJ24DvhiLbqvIp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023

Enable SD Card host controller for sm8750 mtp and qrd board.

Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 15 +++++++++++++++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 16 ++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 3bbb53b7c71f..26548191d95d 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -1030,6 +1030,21 @@ &remoteproc_mpss {
 	status = "fail";
 };
 
+&sdhc_2 {
+	cd-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&vreg_l9b_2p9>;
+	vqmmc-supply = <&vreg_l8b_1p8>;
+
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc2_default>;
+	pinctrl-1 = <&sdc2_sleep>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
 &swr0 {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index 13c7b9664c89..8d018eef44da 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -916,6 +916,22 @@ &remoteproc_mpss {
 	status = "okay";
 };
 
+&sdhc_2 {
+	cd-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vreg_l9b_2p9>;
+	vqmmc-supply = <&vreg_l8b_1p8>;
+
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc2_default>;
+	pinctrl-1 = <&sdc2_sleep>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
 &swr0 {
 	status = "okay";
 
-- 
2.34.1


