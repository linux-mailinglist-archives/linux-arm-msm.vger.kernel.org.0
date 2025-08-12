Return-Path: <linux-arm-msm+bounces-68791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A60CFB2296A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 15:59:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A902E7A2B53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 13:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A88027AC34;
	Tue, 12 Aug 2025 13:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l6+iI90z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910F628688A
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 13:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755007020; cv=none; b=Z7G2TXfrRrxfgqpIUvU3i+fVTdO8olaBjY+3q7WHF/uLCP2h3b+sVZrDF+eAOUrIbvcFq1+IGe7v9TwOfoF9Rzmi8ExQxEHJyORaEj5Wi4rPd4BDVkP270Kk1qrZw4HASeXHyzSw5/YkexYu893pkZa7J+MVyTWPEyGFW/XuhCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755007020; c=relaxed/simple;
	bh=ZTkBnfZZ1AgE0/ZIFikYOYRPvhs7BztZrdv2Dz4kklQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fPtJvG3tXnEZIR6u2pDpSqYr1VAz3An9uF0GmLdx3M3f5ckQCpgjcvz5qtnJGBljSDdEcELrRofNkxGjdtAf/mVbxnrWC17QusQNEAuIb/hN8KuED8ErzdeE/8KKDVzS05q4Ut6SE/vc0YZ+z+m/r3p/bpwzG0p4bHsgDc8ilI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l6+iI90z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAw578005086
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 13:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=auDz7iD1sI1W9Ny6yI3Ooy
	bckifowdTKLsrDX8dUaUA=; b=l6+iI90zRwg991Ek9DuY1tbBw4BQ2WnivUXQIc
	Z6tJwBSoW9u5DnF/NHGND1FKnacNNGRrsBaBYAY5Eu5KZ/1/dEoE9eE1L2YKYsF5
	Ol2vvhA46YzF3XhdLNYoqXv90BYrYnj74R30gaQnxXCTs2awGSeHRZJhQiM16UPC
	yg4oGoF8uHy3Uewt9apl159hH+MTPCb+fqjGQB3/4j3c3E+GYo1osPsf1quZeK0l
	lrLYtQUPqxA9nMmFjdpl4WU3i/V4RHwA62Fh4hWW/bGGV2rtSnvFZvpzeG4DlUXK
	FAeqe+XAwVfKmULDDKkfDAa7PvD4ozpisjGaEli2Ct9c0hjA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygmgaj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 13:56:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24011c9da24so50187165ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 06:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755007017; x=1755611817;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=auDz7iD1sI1W9Ny6yI3OoybckifowdTKLsrDX8dUaUA=;
        b=Fz4SWBmDcAlF7WcIgLZgqFO40HxRftUV51Ohbm5ld6/z1Msc17lJlcDi8QQ0EeIq3U
         zj0+QN7l8iymD9ChhHdz/t6ErK9evhG/tSLwt2QWXcAL0cgb2Jzy9Ku8+p4xdqlzpUvc
         6IBa5h/cEaVdCSAVf+T7GGGHKoN1fPpctgb+nuaAJKb6p+I9zxJEnbrrh4XYCHwGVKEG
         jp3Ep4rH12GN1PJLvpaSKSUzvmpBCsb9sfK6qEPF1339zQeUG6I+WxP3UYwUe4gX7Vzz
         kLBYCyLWRfhJaixRnpwavn0qkDEhYmZe0oytf6KYOJCBgaT8ZbPDpaALBBy5JD5WHwsK
         Q5Mw==
X-Gm-Message-State: AOJu0YxRE7kqayQm+oveEpvZSnl869lfS/drCB3Whl4fX20jSAHr14Vk
	1btHWjxh9YF1/CfFfLJgGQ68uGGmbnjZE7Fkk2lIhQCbXTDlfQ2PvvimiSQn+8iUaj4z8Y192cW
	O2Nfvn+NiR6PFjgTtpsP9MmSiYoO+VHRA8onIolq5YeuXiY2NYxNfIIG4NwMcVFvAJh2s
X-Gm-Gg: ASbGncsy6lZ5bxY0d4QSCH5E+e11Q+D4PT3CRueohul5NUzVicejuTCXhzso0G8KPib
	Vih4ZFzUFmEKHEZr5YDvNl7ESL4WOMzSNcFtEfifEy1o2hBv69aydy1gGMd2gE1ajOPcAWaIimP
	DMprCAt1I9ebpSfAdNDVumA4FnY6sNr/le/S7iCiavAm17BzpAgnhis5RefOkJB8wTl1mBWQOZ/
	pwrlfv78j3GJ3sXXYZMuBaM7QK7b00tY0lVYrYRrBda4TiUu4mvCqFz550Zg4oILbLCKu3hSbSD
	zPpX9aZJbrohzyMSDVGtjPGN7SYdFjC2j1y7KDhQEaFAQulbhfFcRhJNAbPgTLfLkxh/T+Kq0eI
	=
X-Received: by 2002:a17:902:d588:b0:240:72d8:96fa with SMTP id d9443c01a7336-242fc3cb043mr56160895ad.20.1755007016794;
        Tue, 12 Aug 2025 06:56:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0WtX0KfEI1lEt3wJW0uz00Qr/QTBdaYQGRLdFhUhIOFShynyf6MZ2wK9WZMRKktwiy0Y6EA==
X-Received: by 2002:a17:902:d588:b0:240:72d8:96fa with SMTP id d9443c01a7336-242fc3cb043mr56160415ad.20.1755007016221;
        Tue, 12 Aug 2025 06:56:56 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24302e028dcsm16703265ad.91.2025.08.12.06.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 06:56:55 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: sc7280: Add PCIe0 node
Date: Tue, 12 Aug 2025 19:26:43 +0530
Message-Id: <20250812-sc7280-v2-0-814e36121af0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABtIm2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1MDCwNL3eJkcyMLA12jlNSUNIvU5MQUAxMloOKCotS0zAqwQdGxtbUAfJY
 q8lgAAAA=
X-Change-ID: 20250809-sc7280-2dedf8ecad04
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755007012; l=1250;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=ZTkBnfZZ1AgE0/ZIFikYOYRPvhs7BztZrdv2Dz4kklQ=;
 b=uKo606lvbFt4k+SE+FR/TTcEoaE6B5el0xNK+SRugo8Uy+rv99G5tIMFdOyPUl1q9yxwmnw8R
 beB1UaZl4/4B+8RLoBhUB2lGtoiOnxRgdjazLSYPPs/SdQkefyl2325
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfX2nnYJpWx5J/U
 WOiUDdNSQio/htiFDwCRkxy1U2FsRDzR+394AAmSGbvD0Nz1tLDa8KPawBpi2rIV7ooMHO7wdjY
 UVwZsCSFoHBg8gb+weY0L8VKapGHurS/2lyVEOaiWx1YgZhT1nNFp8LGsP86lB2DmuSBgT6EVMW
 kWpk83WlKDoeZBinmaG/Gj2QdiTj12HKQyPYTGc4WvGjAex2umt2B+zADeuSnlK7e8+Rx8RJIEG
 sFUcavW0Ojb84Fn3DSk5qptaQbGJrXheHzpgb1nIDfJ39bHExVRBElMI4BwSniEjFKrFO34f/Fh
 XcVcbh5wkcnGMwkRj6TiKGmw3zzpVuHYtyxDNDehP+FDhTl8VWW7lItHN0G5gLmYo9S0Owxx/zm
 JzsbgLKc
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=689b4829 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=2el-N_6PocgE8SBL7BsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: f-oT3W9dcJOOw66Qols6CU2jivMhNR-6
X-Proofpoint-ORIG-GUID: f-oT3W9dcJOOw66Qols6CU2jivMhNR-6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035

Add PCIe dtsi node for PCIe0 controller on sc7280 platform.
SC7280 PCIe0 PHY is functionally compatible with the SM8250 Gen3 x1 PCIe
PHY. To reflect this compatibility, update the binding schema to include
qcom,sc7280-qmp-gen3x1-pcie-phy using enum within a oneOf block, while
retaining qcom,sm8250-qmp-gen3x1-pcie-phy as a const.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes from v1:
- Rebased to the latest code
- Added new compatible for pcie0 phy (Krzysztof)
- Fix the name of the pinctrl state of PCIe side band signals(Krzysztof)
Link to v1: https://lore.kernel.org/all/1690540760-20191-1-git-send-email-quic_krichai@quicinc.com/

---
Krishna Chaitanya Chundru (2):
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Document SC7280 PCIe0 phy
      arm64: dts: qcom: sc7280: Add PCIe0 node

 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |  69 +++++----
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 170 ++++++++++++++++++++-
 2 files changed, 206 insertions(+), 33 deletions(-)
---
base-commit: c30a13538d9f8b2a60b2f6b26abe046dea10aa12
change-id: 20250809-sc7280-2dedf8ecad04

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


