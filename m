Return-Path: <linux-arm-msm+bounces-72500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E51B486A1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:22:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E43C67AB24E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 08:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C9E2F5473;
	Mon,  8 Sep 2025 08:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SC1xmNvQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1612E2F3633
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 08:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757319645; cv=none; b=bl6y/ue3+LV6ayILiMF/zbKk9X9mGjlg9bVRHNfC4uYm9pT97hUrgvaNYwmo4jQ25WgAgQ9oV/G/IEJZ7zYAp9tt1eCVx8kj1WVRBHFyPHwOdB9CwUfepv76FHQmnh3m0IcX8IBcmqDK92cxQjotXfWXotabH81SdPC/yjtIIo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757319645; c=relaxed/simple;
	bh=GtMkvJtKpN0l4S/TYqIWBJap6HQ5JYL7CkanzzfgJnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RMiyJrN9zNtgCKgBOYC3U5/ctuQia6NBgiQROTsFpiUlxN4wedC0FTQf/9YEPLiEizxk7toa6/4D+HI46gJejNfM7bnzz+0uDZwyN2+Pn5M3FurSpB0jU/RbFSC+OUdxQD7YlFcRITTVc9jFQZzADeM51N7n0zZ2LmdVf1E5MEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SC1xmNvQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587LsCk6013497
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 08:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EmVDnxU98TqnYzCFaSxLfvmX5Q/ll7vp8vhzU+iN+og=; b=SC1xmNvQPJOQXL+0
	KSFWtgUk+HOakDpWUhgtKeIQc1WWgPeoTD0DH8XVtGOsn6ZOKgJ3reo8fS9CGEaa
	MudiCDNRo0GDcVRBb5hDHDV5gNJxwzEQ70jGkWENpXcabvE4yeSWbecIN7Cf+ul2
	esivIyOlzlNmomMLmcjwhMOIN0pHargebHuA4S8mlDYJlb2ZtIDqj8y/SnpG4nWz
	vuRYTe8+ccToH9p8ECQh8XMXfqgizfTtBKUo4DlCd4PbbovKg85VsJ/lTxE1DKYR
	qavvradENblror0n/dCYyVuBrCkJG0/pB/DrOtKrwR65cAowq/0RbQanm7PpqiPy
	Kzb2cQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0ktcr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:20:42 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b520fe32690so2004328a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 01:20:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757319641; x=1757924441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmVDnxU98TqnYzCFaSxLfvmX5Q/ll7vp8vhzU+iN+og=;
        b=hQHuRkCdtyu30CbiEA8+CM76sPnX2W4cluc/Luw0ZELUVyTTuIbUGhy40u6XXVYcW5
         u47FUFA5TW3EKy45INl0MhyzN1MPvZSxQL4679P8BIVFT+g+9qjjROPV6Pd/PSOxItLy
         oRL3P85mvuWpkqypdZSHL4Nq33sLsdfs+vOnXXsI7kZB1uxGzJcNjzEpkqGI3N1vJEsF
         g48GuBNJh536gzmPmg9OOxeogqxSbH5onJgNWsL5EmrGk02Y9x3G7bRRyo0N142iE+wO
         Vt8ZxGn274IlPYPw+Rn2XTF6QB2TWzBHZA0wfQ8nanLkRbWZUjUFHFKQSztI31pRDd7k
         QESQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+a+2M5uUdB7iIVFQAtZU+iPNR67pA0F+V3KmdksQmAw9bk3NLHsz0lR7QVTmKReFl86Ts4tQpl65z3vcM@vger.kernel.org
X-Gm-Message-State: AOJu0YydeMgUDd99vOkawP4mlSqKJuFk7lhB+6aLOh9fJmk7JT886q84
	hG4euag6YgyzfOQP016BkNPXO19JIAia5wUPVnuI0KMC4XwaD7c5ZftLJBAilu+xA6KAOlU2uFo
	2904bnTlbDg+0fSGLFjSCGfFYCoGz0MtlzLu/rfJlgkZ8xkWezi7yf3jI8+Z3Bxqi3pAJ31Vcsm
	3C
X-Gm-Gg: ASbGncs2CBO2h2CU60kuxyO6GJaiERJXLm84Q1Q4wsoVh/7l5FeFU8GURMQV4z9LuJC
	GZW2EMsyRsTv2efYuxwSF/ffbvjqCPS2l3IoMXyV5MGjrOb2W+TC+CvTBd6I1x9eWd6kXUtphNy
	oTAHACaJPTuBIpnYR9sNKU4gKQUiBUGAs4zQbjeu4TdmDKU6GLaSbkAYbg0iznZ8HxIislOvgkA
	KAEy4W2a5GrIKbvXsrUnlAcJjk0hAHd9Q8jGUSUFPa8GLyjWKHn2fxHUPWUtdR1AJQZEaGiUV3p
	iKKmhAShj+OOvR0hypcImn8mMVebqn/yAU4mOfD22yQMif+YufRMDlKcBX4QUA5/VI7A
X-Received: by 2002:a17:902:d541:b0:24c:d717:71a8 with SMTP id d9443c01a7336-25172b49a1amr104521495ad.48.1757319640394;
        Mon, 08 Sep 2025 01:20:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnIkxO2hRnmTHM8DY8Yy8QL6Z8w8e2IIYZlJagoO9krVL6mQcBPeRZhU0urfOAZkEARU5PCw==
X-Received: by 2002:a17:902:d541:b0:24c:d717:71a8 with SMTP id d9443c01a7336-25172b49a1amr104521045ad.48.1757319639802;
        Mon, 08 Sep 2025 01:20:39 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ccfc7f988sm104852845ad.144.2025.09.08.01.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:20:39 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:49:56 +0530
Subject: [PATCH v4 06/14] arm64: dts: qcom: lemans-evk: Add EEPROM and
 nvmem layout
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-lemans-evk-bu-v4-6-5c319c696a7d@oss.qualcomm.com>
References: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com>
In-Reply-To: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com>
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
        linux-i2c@vger.kernel.org, Monish Chunara <quic_mchunara@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757319602; l=1155;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=sXiH/sPxber/1Cxwi07raIsGtdfiI2L0RlmvNjYR4nE=;
 b=6ROCwfQG4lnnOWSQCa+v+ZMjsd41mzsfZOmBlGk/2/AadvqTkIzN/CxqN0DAlkXCADt4coT9l
 Zllg710W+kMD7f775FVbJZ3PLh2hrSa1tbx7YlHJ7SSXWuJZQFIj4Av
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-ORIG-GUID: XIa8_AUIiP2OD5WvrvwEiJ2j35F16QWs
X-Proofpoint-GUID: XIa8_AUIiP2OD5WvrvwEiJ2j35F16QWs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX5+bFZtitPouN
 JwWa4IA5VWk73+yrQ4QiqNeB6FjNWi8w48LrBLgh/CcPkvYSxu7u+Q2gKT4rRrf9W3OaVstaI0i
 gBeAcZJxuSMNTwjtn+DIho7BGm8kT7VqYnVx+eVokSQsnf485dQIn19kc9SW/RGi5SsH/sbZLZf
 py1+mrXHdyjeECeJc7gzDj8iXkODHBSjOy/vsXmxb2YIbhzeyuV1hEfzEQt62OZdZfY6c3dyZtv
 YWaaQIKgX2yq+dR0mnghnLbbJD7xc959Kp0/FhFRyP+2FSoHPte6Ec8I60GkmcHjuArytia8l8P
 83XxHTHaYPNKQnAG20+v3dja5ASukufvw9h81fDLtVHJJN3HvkPj92dqHrRakJK0bhk9RQCxVrh
 fVvaSWnA
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68be91da cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=cq19zQBcvAJi0RM8MkQA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

From: Monish Chunara <quic_mchunara@quicinc.com>

Integrate the GT24C256C EEPROM via I2C to enable access to
board-specific non-volatile data.

Also, define an nvmem-layout to expose structured regions within the
EEPROM, allowing consumers to retrieve configuration data such as
Ethernet MAC addresses via the nvmem subsystem.

Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index c48cb4267b72..30c3e5bead07 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -319,6 +319,18 @@ expander3: gpio@3b {
 		#gpio-cells = <2>;
 		gpio-controller;
 	};
+
+	eeprom@50 {
+		compatible = "giantec,gt24c256c", "atmel,24c256";
+		reg = <0x50>;
+		pagesize = <64>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+	};
 };
 
 &mdss0 {

-- 
2.51.0


