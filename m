Return-Path: <linux-arm-msm+bounces-57828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C734AB6A27
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 13:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD1AD4C0FA7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 11:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA93B2749FD;
	Wed, 14 May 2025 11:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QcOsASb0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C2C27780D
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 11:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222649; cv=none; b=i0hRku1guXRMN+dkrrCkJN9D9qev9ITNfIjsx2fWe2MvSY9Cpz3usMta45qxRTVAmi0A2LveVLiwY8QrNHtpz+f/XpaY/10LEg2zgFvsOHFu6BTI0gXqavr+hrHatfSEL9zDqWlgr2T0w6Ad6qFaWnYnze9CNVGkamw4dkX6l/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222649; c=relaxed/simple;
	bh=Pd6UckjZVaM/JS3ilAyea5a2vj0MVO3e/e9pYvH6Rpw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FDGqtJMtFqXLnTz4jvQVJfNvrxybb23xM06+9Qe1WG05fqkzg4A3zDzpuLlovh0fz7YMX7OJtro1qJ0ZvC+AM3AK7GiPkJpZor4n2x+kUuRhtbdXYKOlQeYPeg0Giz5Yq6wBCi8Hg3PAfz7koeZJ1UI/1AhdVU8ZFX7ZnsyjQBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QcOsASb0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuvtQ015930
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 11:37:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Av7CXuJFhg2tfAQcC5KHKa
	93MT0YXTr8f30ak6FnWcc=; b=QcOsASb0DarQ1LkTe/IXxEGBCsaTJz0SGk/ShG
	8cN+AOLIMsBbEsUQSPDZeou7Fud95u1D1cympNKjdr7kP/e5dlJdBfm1wxvtpiBN
	SJKkfoTLSib2MmUS/qC62+dRVcLMpfGycHGq5Yl0gwpmzHoaDH5apTeSsgrKn/uq
	t9Pm5Z5P+7iCPfyZtT4WU2DIvaiX/P8Ao3kT19uiEjSpc1CqsUxfymMNYSLnt27R
	e/SQwy7mZHVJHvfuPi1troJ2xh5wRMTzKQ0V+8eQ8PGJ7RBbBwTtiSqOSzNSfVB8
	3q5UbTLlcrpV5zqOxrREZhPhS3EQBIWJeJO7unH1pupBOjFA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmthnx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 11:37:26 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7425fc3357aso4430954b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 04:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747222646; x=1747827446;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Av7CXuJFhg2tfAQcC5KHKa93MT0YXTr8f30ak6FnWcc=;
        b=bpkGVJlSYNigu39BGlOWUUPBP7NBPzhOAulVpoR2KO7CZzPv4ZEpdbfDi7BQF7qI7a
         tR60na7I5vXvo6dCXhdlPlRWVuZ55s6Pc7thcu6Y2a6O4Jrt0uZBhkJbxeAXpUvasUkK
         b9Lgf5ScnUjol7vGS9Sgdu7LzPxBLgEXzkfgz+6jTpv+X+E2lxOWqJnGTlyomKfY5KHW
         /V1cjkf28ljd5dSR604h4VsFB+Qx6DFLWfZVUGkBufM0xX3bt7IO4VGJFA9V9BGyiv5h
         qD74zaIMvi5zXxjmhXKXceypWgd6y0fKKv/eBh+w2Ohsh/GMDPXADF/3dxssDOQmThpY
         17tw==
X-Forwarded-Encrypted: i=1; AJvYcCVAjpkXZy1m7oNd4of3W97STcFPVYfIqRGEb4QAdui8KMNc0WYYhEPnlfmA7o2DuniziaeVgwzMuaoJCWiL@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq5RMUYakSMMjxNmj7zTvMT2rY5SqFlRR4jw8o0QhV6HCWpadH
	lAaDw3Y7/K8Q6y+jIh3kwVxa3raUlwBAx2Fb+dK1L5x5SJeui5gjs1k443kFL8dwjQJUBhEMR+X
	Lg6wl7Fa+hwUcE5YtVkmZgvyQwsPXSVpwezjHhHfmqHa/0kMVnL9psS6q/8hyCvnJ
X-Gm-Gg: ASbGnctaFBr6RoG5mCOsR6aV6xOAY+U8EbLWlvXhlevLs83wVaaSk3dukcvlLIWWcJj
	1C398qVYcP7eON6HA5K6bKgndtJuo84+VugvReQsIAq52YyFfUA5KADkpFVbhVknnvDVkOLbHXU
	w/AR7eUynt849xrpPfnTh2VQIPIptA4Ae/xPcIq1d9KNXfcg2HbkCNg38MHNeCKUIMJ3tI8VcPl
	/z96xj8AcjcH3jQXE5QOiIf+UMaVnnVHBPS2HlUTsE6noXIXYxFkhzEUxoGk7TnHW94P6AItoPc
	197QiPMaJjoUK+54mGMd/ZW8dLUUuErscDtW
X-Received: by 2002:a05:6a20:d491:b0:1f5:8903:860f with SMTP id adf61e73a8af0-215ff0d7d90mr4654872637.14.1747222646115;
        Wed, 14 May 2025 04:37:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMOj0pkODASLbgHA597n/lSxCiGTIkCoSHyvzsT2+w3pqt18BviC0qXr2f+fhOeqV0kjeFgg==
X-Received: by 2002:a05:6a20:d491:b0:1f5:8903:860f with SMTP id adf61e73a8af0-215ff0d7d90mr4654805637.14.1747222645585;
        Wed, 14 May 2025 04:37:25 -0700 (PDT)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2349ec78c3sm8652783a12.31.2025.05.14.04.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 04:37:24 -0700 (PDT)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
X-Google-Original-From: Mrinmay Sarkar <quic_msarkar@quicinc.com>
Subject: [PATCH v2 0/2] Update PCIe PHY settings for SA8775P
Date: Wed, 14 May 2025 17:07:11 +0530
Message-Id: <20250514-update_phy-v2-0-d4f319221474@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGeAJGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1MDU0Nj3dKClMSS1PiCjEpdo+QUCwOTlBQjEwNDJaCGgqLUtMwKsGHRsbW
 1AHifrahcAAAA
X-Change-ID: 20250513-update_phy-2cd804dd2401
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_nayiluri@quicinc.com, quic_ramkri@quicinc.com,
        quic_nitegupt@quicinc.com, Mrinmay Sarkar <quic_msarkar@quicinc.com>,
        Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747222639; l=1087;
 i=quic_msarkar@quicinc.com; s=20250423; h=from:subject:message-id;
 bh=Pd6UckjZVaM/JS3ilAyea5a2vj0MVO3e/e9pYvH6Rpw=;
 b=5xf64b1oFtVoWpo7QJDvmfnMI4ZU9vSKKfHGBECdURRD52SALWLG7AONflLhDZQYhuYFddPnu
 bsuTg99t2BQDr8pQbA2zNLNFRSbfxEZgMss5NRpqj6OEw4JCQST+3Se
X-Developer-Key: i=quic_msarkar@quicinc.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Proofpoint-ORIG-GUID: 3PxaZ4A-esNgGd1tv3ki1AlMKypd5a_M
X-Authority-Analysis: v=2.4 cv=HZ4UTjE8 c=1 sm=1 tr=0 ts=68248077 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=vWfPPh_LAE0cc4QMUwIA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 3PxaZ4A-esNgGd1tv3ki1AlMKypd5a_M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDEwMSBTYWx0ZWRfXzCKnEYjtcGYm
 uEe0Krre8FksW07IAb6iqRdDpAXxkmwLOYHtZl40wu3IB7JIEpQp18M2M9Q7e3J5pIE/mecWAms
 Ag+gsVDAWPs9Ia6tW5Er9134LCfkei4yjOS34TTK7hfBdcAK84Y15SN/QkP2EFr3Py4IpSg5sv+
 bJ2Ck1J2SFrY/Sa7v0zFsV1Cjo4zoO2+W9vQFHsfAwFN1VAthNibzEW1vrsamnFy1P0/0yST0X5
 Kq1ghlO1adFxIn0mXW4q/yPXezjFCJV3HcDN+OhEZedhoSqblNPMGOTqyyqPPrhYaf/dcNAphy0
 Npb7JWOE5Z8Ca3/SyNR1Q+6UEZqkxJVAo10gRbLdyF5HdAAsRGhMBZQ0OCJ2OxvRE3dM4BezfK3
 QHj8Bm2faAAwsTQgCfq1IMBen6NLgn6fZoUmVJUVuFoqEi2Rz9zNxcHhqs1vPNMcpsUoBfRj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_03,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=579 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140101

This Series is to update PCIe PHY settings as per latest
hardware programming guide and remove max link speed dt 
property for SA8775P PCIe EP.

Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
---
v1 -> v2:
- Update commit message as per the review comments.
- Remove max-link-speed DT property.

---
Mrinmay Sarkar (2):
      phy: qcom: qmp-pcie: Update PHY settings for SA8775P
      arm64: dts: qcom: sa8775p: Remove max link speed property for PCIe EP

 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |  2 -
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 89 ++++++++++++----------
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h |  2 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5_20.h      |  4 +
 .../phy/qualcomm/phy-qcom-qmp-qserdes-ln-shrd-v5.h | 11 +++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  1 +
 6 files changed, 66 insertions(+), 43 deletions(-)
---
base-commit: edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
change-id: 20250513-update_phy-2cd804dd2401

Best regards,
-- 
Mrinmay Sarkar <quic_msarkar@quicinc.com>


