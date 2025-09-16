Return-Path: <linux-arm-msm+bounces-73735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFA3B59B41
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 17:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7903E1BC0E32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 15:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577D33568EF;
	Tue, 16 Sep 2025 15:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VrxxxJtX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD294353369
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034815; cv=none; b=TC+mmhOcnJ0twAjYMEuwQPSdRqorMubBXySoP5jcXVKkSMq8AwCrsVOnfOEox5lIoKwjLcyaXApyLwjUR0XdBvDHsrEeUtr5SYo4CLkxvqwLHPJweJpYuJAlHXP+fWesACEinuopkRzRHhD3ze3j+1C7C8vGxnAL+UorBfybmog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034815; c=relaxed/simple;
	bh=AeQJ+Mvvn8Zchtp2KXj5ziKvJddoHzFNlKss5ip7LDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uhyzQgrKKsi4yNfCitWAUpiYZCexs6mt0Ad59Z1I+6JX1oHYRtZ6kvWKo8ZBrnjqx27Xm61Wzz1lcEmq962nNN33AVnJdKdnhsKbZaneXD5kexVdleuyZG2DHbDRDBlkSKUSWlHO6GXEiNAYKFdtWN45kH4gPjhDYqXl4IJxjR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VrxxxJtX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GA1hcn005285
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V05d+jNh/czCFv+YIOyVmfzj3aJzSMxM9iGXDQbdqsg=; b=VrxxxJtX3wb6uvTI
	RlmtyTUDMW4FctOt7ox81ZwBZgb8+PR9ljugdi/ATbfkr6eT6qL5v9EnVXs082wB
	G66UZbbh3CBNyee0ApvAJ6T8/oHweTFibb9GIV4rcr9gqGY+542egPuihmTPk9fm
	PdlZUtnMOIbnWHJzhUKP6GeQz+TRfIkueKzEwVTPtOJo0GdAWpJfZMaS+Ak7goWW
	LvLNTYpdiEQGR4noHOvPgjQAAXBeP53A9ym2FeQw/UrIq1xQE4CuR59456oDlqvl
	fbdI17TjfXspVlMmdi2JH1TFlHf3O/fWFYdBmmzFAsjtSv2/nybOT5cmpZUx2R8w
	LJ31Jw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496g5n4x1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:00:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24458345f5dso67856765ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 08:00:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758034812; x=1758639612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V05d+jNh/czCFv+YIOyVmfzj3aJzSMxM9iGXDQbdqsg=;
        b=lv3qD2eRmAt807q1gxk/27eVMBvCUqks9pbS3EnqgodzN4hINkuGXuFHj8ompPK/9y
         7eG7YZkAiwkk1cbGPCXpdN5M0bkB/PG++c93UG0dnIKyhfitw7TL5VFcYhrPxcpUoFqn
         FKUp+kKsh/I1PiJqztqOsTTk7SIbW1Ibzh35MBoHE6P96bw3hxoAtdU3rDCvXgoPyaAt
         si6tYTOWf/01lqkhCb7SmQPWVchjuiahKgNyK9+qENjddHYLdhp+tMFGkhhUYtNCHnUz
         c5aVsXGyPmeYISI6n2/HatarGA5Qr+HLaeAPBex15qJ3sPPcvX2UeZ4Qqok547ZGUrDK
         KQiw==
X-Forwarded-Encrypted: i=1; AJvYcCX4hn+6+hgGaXQLR5PCqRrgCmjFaAM0ZmNv6aPhd7UfCxwKrnr+4JR4isNis2x5ZHVBkaHunpSEcYJfaiok@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3d9boUKV8bmkHxZXHXsu5HSwlmTFWmJEz8bB5GqTuy7FC9d3U
	y12NQMxAtkA55Kzr4bsk9sP4Ldy6/9ah6dJNX7KqR/01Oa173e2mVaw4S09YhhYAnSteVd56ENs
	MzmZmuewchRKLvbS1NnpwkqKMu0tyGsAOzxaeF2pCw96vrV71N6plzKVpNEuoUYZMZbu7
X-Gm-Gg: ASbGncsoydzs4sDKSd0GLB3Y+YI+3C3Cz4rtI31VVwC/prfY/HQbTtYd1outF03sSE8
	68EazzMDQB4ty/v5VzJnvc8BZAcHOxaRojTYHwQCEQfXuqmaLw2I8gsOMgXTZIb9+AS2oVbmuwe
	5Vl3Tn6AJ/VkQEpZ01DzXQj7HlFep8lhXnLoq0qykcxNYfAGFhPhIzLjsKlwUvb/DE1Hsrsh4y9
	uJTS+jYipYDAfuyBMKEV4PwSKPadXezFD8w9S9+QUPiT1dbbQL8pJCk8o9xUcyI22jVcmzsiNNy
	u98wKh6QxoXh2zhmaYXLa7EDwUu+hYr3Ff/9aZUsaMV4mYye+1c/K+PApZ+pEE0cMxKV
X-Received: by 2002:a17:903:4405:b0:267:b1d6:9605 with SMTP id d9443c01a7336-267b1d6a44emr61499165ad.10.1758034810063;
        Tue, 16 Sep 2025 08:00:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXXtzp40M+OnwRPHaBfUHcZY3UBeT0scukJXr7R5AGOJ3BP+3MpI6Pr++mKWkPkvNyQtbiOg==
X-Received: by 2002:a17:903:4405:b0:267:b1d6:9605 with SMTP id d9443c01a7336-267b1d6a44emr61498535ad.10.1758034809413;
        Tue, 16 Sep 2025 08:00:09 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2651d2df15esm74232615ad.45.2025.09.16.08.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:00:09 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 20:29:28 +0530
Subject: [PATCH v6 06/10] arm64: dts: qcom: lemans-evk: Enable remoteproc
 subsystems
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-lemans-evk-bu-v6-6-62e6a9018df4@oss.qualcomm.com>
References: <20250916-lemans-evk-bu-v6-0-62e6a9018df4@oss.qualcomm.com>
In-Reply-To: <20250916-lemans-evk-bu-v6-0-62e6a9018df4@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758034770; l=1248;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=AeQJ+Mvvn8Zchtp2KXj5ziKvJddoHzFNlKss5ip7LDQ=;
 b=51Y+c1piLmdWjG+Oa/4O7vIYN1Ktuey9O6ZUx4ctB1uZetUtQKP/MyuV/a+F5d1pJO7w7XhXd
 +nqfT84i1GJAgBIWfF5jT6Royc2uMgA2cLMeKWtsu+5T7rzVdnXu+ke
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-GUID: VTaD_q8yg3KH3803qSHF-gsu7vFMGe1d
X-Proofpoint-ORIG-GUID: VTaD_q8yg3KH3803qSHF-gsu7vFMGe1d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NyBTYWx0ZWRfX59MLdS76UCIW
 FbFE/GBmnM+b8nM6+83olvg+MUFLiOJz4FweoY7ItF5hH2WZEzhwGjEm0KfXr/xzXZuoVpeKmlB
 TyVL+6IE06wYZhS+votsPOKzcAcmJYWGv/2YInsdPAn2faza2cw4GqvkfLaFPdAGmIa6QHQit66
 UqEqBHkpnuz43ZDtsMDQ9lo7SBdNAhRMLNQqBrePJVmO+qfWoRVvEhX2qBj0/62XrvtY6T/jKzr
 /XWIcyTGQdH3ThROCKMc6Q2HWMezUqbmYMMYB0ot4mWKW4sZUKvLFWq2EFQC1oA5HNoEtdRa0rF
 BjcxNq9ajiZaBSaC+GmFdOOLQm12aC0kPPvkbDxEAqmuUGwTmC2oBGm3UC1KjjLd7JySg2BuY8Z
 rHbONztk
X-Authority-Analysis: v=2.4 cv=SaD3duRu c=1 sm=1 tr=0 ts=68c97b7c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=uxRHuE6yrSyVtnA-QqAA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150087

Enable remoteproc subsystems for supported DSPs such as Audio DSP,
Compute DSP-0/1 and Generic DSP-0/1, along with their corresponding
firmware.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 99400ff12cfd..d92c089eff39 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -477,6 +477,36 @@ &qupv3_id_2 {
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


