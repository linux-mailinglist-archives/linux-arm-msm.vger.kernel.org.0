Return-Path: <linux-arm-msm+bounces-71826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37394B41D77
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 13:50:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 473283A2AE6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 11:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 348262FF66B;
	Wed,  3 Sep 2025 11:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JC/pRYKb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B6E2FF646
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 11:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756900091; cv=none; b=tod+zcYZBE6du++9l8mH9mcc9fg0sciBIG1y2wqUF3awPnwWcUwTnX9vQXJv5I0EWmQ/1ShKJVZ3bs4PsYVi36dsUeREznKlLOtXZb/Ab27ZfrnqNNtHF/74duI3xo+bRxHUghz503DD36rqmNq6wLRcqQ/vIX45rlr5QudxDz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756900091; c=relaxed/simple;
	bh=iL/XzmseyPpV8hK/O4kgQg+47B+ikK5yJ0SDgvgg8R4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E7RJGtq018qt/otA6HMjLU1+dg3Ry/urXFqmMRJINGN3Qco0WSrsC3hzB7cV8sUGswnJc65pvtxoyRbAXi+ox8jeAJOnWCqhSbqXHE0hB0W/ZUgdwOSIs+s2pqtLFFqp0+0PrhT6EIpUvZSDeOQS9duLGa707GcVPTMspx5DWso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JC/pRYKb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BF3ME004538
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 11:48:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ptzMoe5mzU7pe9gfLF0XACcwJawnpCLYmxbK3KE0HEw=; b=JC/pRYKbK3k92BXV
	5ieyjJGR9qqYiy+gkh88U9g4nNfZu7a3VAN3jfwXRwRECPXGNv7ZBqbXM/rXtxni
	XJHx06jOf79N1jS6Bd3FeJzQQ6hv0wCgx0VkCFisoZUgtpM3Y1uP1rkJRLKrwqmv
	mS+k/a5MQp1pdznDFX0B6Nn7zoBWSSFyv5oOjDYEdJ9a9acvCu1DaI1iSVYRx1CH
	hjHlh0P382tqnb+7a+kSnrwq/87v5r5XWZBabzacV4sWe6BNrKU7Fek7l8KAq9Rs
	yhoLvW0VErBp3KYDBF0SBypIMvpTZTPn3nwzkUjBsDxZFNTWFoKLF4+JV+uqVv2k
	EJLm0w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpbntr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 11:48:08 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77283b2b5f7so822928b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 04:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756900087; x=1757504887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ptzMoe5mzU7pe9gfLF0XACcwJawnpCLYmxbK3KE0HEw=;
        b=r2CmrvNTAdG2LfiA73IpK8F3Ap3sN5EExymdaL4xh6bNDI47jpudlIa8MG7Z/Cy3aq
         0EzW/fnkBrk/AvZCVivSr8LGpXUJ9qTiCBrke6TJceeSph/2p6trhr2uoh/QyOUaJ4Xc
         Ii9e3D0cf9YmWdCrhdH2iiTsQIvIDuLW4nPiLrpuSxTg+c4y2kmAyrtjrM//WGcCvZkq
         K2Hlx//ZkjpbKoxU7T1kEvli5LMA7EoLfOrGAzm+x44yeR9yO7D+Xe/CX9u70Ic0zQ3Z
         XSd+DPpds538ki9ALPlkeeAnnRp1PkQMWtY9ZAoUl2Xba85gOzV1A+VGM4V9JpZWWSVj
         +XUw==
X-Forwarded-Encrypted: i=1; AJvYcCVJintWE0BoSEsU3CaZbrxef5fWu4ZzFjFrN+sefuigs2d4YHNCopJvPFiL/ZYqqbf4Of5h/ncVQDsJkc3G@vger.kernel.org
X-Gm-Message-State: AOJu0Yw363GchEs1Jeu6AtIt2i5KjK0PsOHGEngb6uS2F9X29BRRyOjF
	niSMS2QJMA/BubdobEaKi1Chb8JAVYcobzF7f2KzoHU00NyCoEnlZHGrcJTuNgfj/tdcu8SMMbw
	T00+pKCrLJJirw42EOct46BFf3hgiPhyfJtDsFNhBvcR0tn4p29IuH4CHuFzVhh63ZYtV
X-Gm-Gg: ASbGncs+vsvgffZo3XB9rawdk2TcXM9JKce3DLec3O1Pb1yA1e4cJtiDnexcnP0wdRX
	Xov78SKukRE19JDqHWNnjTlzplsbVbxd7WjrltWqzmHmlcat65HBam2TNXsJ9X9rWjP4lv1ry/J
	hjUAfHPWR6svaq8jjwZznjf/JY9Xnq7PGKOJ5nB2TmChP9Tmr+dGVmqdYskDBSBEi9Xzu/d6nu1
	yLVlwP7w12on7IycETSfO3Ln3wITdWk6IaUb1nz0YcNPh8Gnk/9kyNrxlAAJq4Qi1WIH4Yt+BYe
	2u4vHxPaZRfeF7zRu4Gxi5fDcHfbtWj/El4r37xo6UeK8FZHqx5x2XqGXHL44bmlSMBr
X-Received: by 2002:a05:6a20:2e1e:b0:245:fb85:ef69 with SMTP id adf61e73a8af0-245fb85f22fmr6898050637.40.1756900087297;
        Wed, 03 Sep 2025 04:48:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESmO9fuCQGZL0dDqdivH4Yd3OgnaOimF5E4/NDsZ5Ka2qIuzRAwLWEesSF7738knmXbVKR1Q==
X-Received: by 2002:a05:6a20:2e1e:b0:245:fb85:ef69 with SMTP id adf61e73a8af0-245fb85f22fmr6898025637.40.1756900086874;
        Wed, 03 Sep 2025 04:48:06 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4f8a0a2851sm6584074a12.37.2025.09.03.04.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 04:48:06 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 17:17:08 +0530
Subject: [PATCH v2 07/13] arm64: dts: qcom: lemans-evk: Enable remoteproc
 subsystems
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-lemans-evk-bu-v2-7-bfa381bf8ba2@oss.qualcomm.com>
References: <20250903-lemans-evk-bu-v2-0-bfa381bf8ba2@oss.qualcomm.com>
In-Reply-To: <20250903-lemans-evk-bu-v2-0-bfa381bf8ba2@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756900050; l=1181;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=iL/XzmseyPpV8hK/O4kgQg+47B+ikK5yJ0SDgvgg8R4=;
 b=ehU7262fiOcOFmjWpHiqhp3CyfXbLbOyDWLLhlZwJMNZYrcsDHNXGKfhHqTPFDGcrJDmqUoZ6
 mp35mSc0QhTArkAIimiorimSB98rb2w81w6HnSuE0LJQC0RT8YEwLK3
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-GUID: MzBmhwTIxlGxpzwwzYOm3liy47hWsS87
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b82af8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=08pr6S3s0jzPFaFj3AwA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: MzBmhwTIxlGxpzwwzYOm3liy47hWsS87
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfXyOlbZf83Le+x
 4Cyp3IhQOnTvh9Ujdj5GJI7pnaWzFPH0dFqe7KUiJJ8JfTkJ0WYbTZSP1I9YzGUKk3FqFL/pWOS
 DeGda2wwypIX2ZcVa90LEwdH2s2ra2Vy1VNvPSZe23lqH7RlFhfO4VOBfn5yip7OdJ3TMaFZInD
 eth3UX3UcCVs5esiMKfuCHlZpQho3koUGREWpwvTRxGyGNRfH7uiKASaF98j9L1cJiqU5SVsJKj
 wq+5F+TuN5iPARrr8X4oGQ9ZEPpMyzKS3IdOvqv8tf9fMX7STUVuNeJZf59rrnfA0TTQA3glop8
 Q9X2cy3Xskkki89h2DB4ZVpUEMe73B2tVdMHp2YJ673S1Ks4IdU+ts516buBo4O+L8S4fqwSqTp
 uyZlcBui
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

Enable remoteproc subsystems for supported DSPs such as Audio DSP,
Compute DSP-0/1 and Generic DSP-0/1, along with their corresponding
firmware.

Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 7528fa1c661a..eb7682fa4057 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -425,6 +425,36 @@ &qupv3_id_2 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/sa8775p/adsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp0 {
+	firmware-name = "qcom/sa8775p/cdsp0.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp1 {
+	firmware-name = "qcom/sa8775p/cdsp1.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_gpdsp0 {
+	firmware-name = "qcom/sa8775p/gpdsp0.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_gpdsp1 {
+	firmware-name = "qcom/sa8775p/gpdsp1.mbn";
+
+	status = "okay";
+};
+
 &sleep_clk {
 	clock-frequency = <32768>;
 };

-- 
2.51.0


