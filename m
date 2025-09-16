Return-Path: <linux-arm-msm+bounces-73784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE190B59F10
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 19:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4C82460DEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 17:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 199882494ED;
	Tue, 16 Sep 2025 17:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ALigitGb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607DB24678F
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 17:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758043115; cv=none; b=lPnL+XE872vqFVj5Wbhrk7pHAjxo3c3eEcl5HdaktnetIUMiWLCMrzJhCvn1vGwrEjL1xIMgFTb0UTs93oBTfaLWgLcbH2kYt8w/VvzaF+goY8yI55J9gwaEpI5F4mnK6PQo1rez4pAi6RDRO1561JYNdQRAoAqSNc0BDOiR1w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758043115; c=relaxed/simple;
	bh=/+UqcjoaheaexrPt5WfTcdNK3D4uwho98ZKduoDO4EA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bDVaGIssugINtnSp+77tNZ+V7S/kOlhP5gt/2P3Cq/3JwNXu2UAABP7R/TxSRxy7+1lPDAWrII3g50jHw4rHpxPhxPgiqODKb+eY5Sr52duumTjv7N1oBhfKwxO8J9fHo0W+xTOXNkzAabI83fvnrn1c/cyhBj78kRB5cf0WQwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ALigitGb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GA1626019996
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 17:18:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gqiVT9Nhqa7PpSYuOZs8qk
	d/7SAmEWBODNztVjJUW0s=; b=ALigitGbNOPLDgg2suyL9+FOWm2Kq6QiS5glVt
	ZGFgX7SWYRIAN/+LhQdITn9W/ocUsxM7PgdEEBPVmI3SKr6Gtvf8nUMzh5mYo8Cz
	mv83TGE2hPboj1FNBJMoDG7nFgPrPanw1Ubrd9c4XLQ/abEKpySMCtbKf2w2LCqk
	wzT/uGAd1uBJeIYT5drdidNtMfo/sxCF/O1/VNORz2DmXxZmDreSEhlf6lcC4j8I
	OU7CIAVa38PGA83m4CEWW8pmQSOn1aVBjhRHHWhpAPKiboisY2OCPHyLwUUQyJoO
	u8RQP7Dbmq5ShXZt6TUE7azJklj2sB66pisYt6GFHvn1gA8w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496h1snaug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 17:18:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b7ad72bc9fso53165031cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:18:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758043111; x=1758647911;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gqiVT9Nhqa7PpSYuOZs8qkd/7SAmEWBODNztVjJUW0s=;
        b=sr3IniBkgypAq56I0p8DIq/3iGGFz2sW5vSjhOM+l7dQzSzyfB4SiBDl59B5vkp18k
         evSW6fneoE1JuBYAobBwGT722eu9JCiiah42yrKL+axoztMgaOyrgSFg/IMGUX4Vk3H6
         oRHEbOVD8pb7rH7PQz2sh2quXPpFNikgmvT4ZnCHFGQmyWxB0+2zvne6Uzzpmpj/1p9R
         lhpUi7qj7zJxB58qM2g2F9J8eK7v7TyITJ5QPbZpCXRoecwlel1uprz0KbFGBDSOX253
         5LJBdeOiAYWcoX2sLQHDn96qKb6zbTjNeieS556aKWzc8z1XhrIVMKhWninhzuvPfpzn
         8U3A==
X-Gm-Message-State: AOJu0YwK6rtd4RZB+JQ8PEHWMJ6B8ex+xNeMTUndvi0caBeyb2glMKtJ
	VJ4T2eH1BENxHUUXujV16361boCRm7Hf8jG8SK8BNry7AjB6pduIKv1s/d4mztb6z0vTxSDmxZn
	ruQWf/EFp6C2X8iovn5RdBelNa7ap+bn0yTqMjYNQTM46ikyPy/qLmnBDhZ8MxO2yfNcK
X-Gm-Gg: ASbGnctWKyuKX8FHv7HNtI5AsJP5BMa9Yhro1D1tsguGQaKmeL9W7RlDo6JOYIqJWxC
	lHjoQFK+45hKyBRqgKYLlgUBVqSNpeKf9MVjbKhkw/nR+f4QGJWIWdebKBKlYiAhdnv2pX8Ncsr
	rEGbwdWw6W050RRRQxkUf2h1jn1h4VCm5RANrppz4ZbRfvvOxZSMnq+mGHIBnwhtjMk14/GjaVR
	Fv0cqHTBozNdvC1RD+CEinEbc67cynUK1lFHUPiOk/uDv//KuRq4500p56TpuTO9t+G/vSTQDk0
	jjZQFLISV/WyZPMSjMT2XS+d7T184YuT/GDidgxEEG3MUwZ6YRF/Be2rP/Nfib3T6GplPyhfgxy
	dLCTLeoRiFwE96I5JlDNBQuMBRr/CS39yXRnv4S61Uz7dI8tdMq7b
X-Received: by 2002:ac8:5f4f:0:b0:4b5:d5ed:e972 with SMTP id d75a77b69052e-4b77cfc1cbbmr205730351cf.2.1758043110982;
        Tue, 16 Sep 2025 10:18:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQhxffqJkpVoTKcOPwWQs21kDXX7yA9d8iTTndQ4D2Tb/3FqjpU/7MAmUN4+9wPnKfbAke5g==
X-Received: by 2002:ac8:5f4f:0:b0:4b5:d5ed:e972 with SMTP id d75a77b69052e-4b77cfc1cbbmr205729781cf.2.1758043110268;
        Tue, 16 Sep 2025 10:18:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63cb4sm4488026e87.78.2025.09.16.10.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 10:18:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v9 0/2] arm64: dts: qcom: Add support for 4 pixel streams
Date: Tue, 16 Sep 2025 20:18:27 +0300
Message-Id: <20250916-dp_mst_bindings-v9-0-68c674b39d8e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOObyWgC/4XS24rCMBAA0F+RPG/d3C8++R+ySNJONLBttanFR
 fz3nSpLhVo2D4EJkzO5zI1k6BJkslndSAdDyqltMHAfK1IefXOAIlUYE065ZDgV1Wlf534fUlO
 l5pALo4SOsXQeeCS469RBTNeHuPvC+Jhy33Y/jwIDG1eXrYEVtHDeeSkC1Vz67fmSytSU67Kty
 agN/E9QVAk6FzgK0XEltawE93bb5rw+X/w3CvXEiIkxzMwZgYzhJVDLrTJULDByYix1c0YiE4J
 gGrRASS4w6h9GjQyzKoIyMoqlS+kXhqk5o5EBw1TAoYTVC4x5Yfib0xhkeODa4jc5ZsICYyfGU
 TFn7PjEiutIBWPg/Rvm/uynDrANcuqfTUWCz1CMSanfrBq49p+1zz10mH//BSghAmzQAgAA
X-Change-ID: 20241202-dp_mst_bindings-7536ffc9ae2f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3961;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/+UqcjoaheaexrPt5WfTcdNK3D4uwho98ZKduoDO4EA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoyZvkrhodBM04QOXSZm+1ebfSsMcNtPEX7Kx1P
 zZFk1O87/eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMmb5AAKCRCLPIo+Aiko
 1R0rB/9j1UmVHHZJG0HoZo6Nvt58zlFRv5V4+0enDrak0sVvFpxvdFrklEf/7XAtYDlzlqGO02L
 XGq9Kf35Zv6MVSUxBZO5qWAA6lIFwmNjQNuLIbnEyqz+5J3A5aeC5L3gepgKCrJKWV+TleL/jtC
 q2iyn3mjzz6S8ExB2YVUhfyryGHppPkEYt2IqDDDQrs8aBkvA+DqSHY8iT0hVaUZ8zaoGBUH5bg
 TZyW3sDeHMOXvFv1dW12hUvTddPHCnuuFfYx2YoJYHBKnxmbqre+Za6ugaY3JRVfS85u5EkM1jM
 Vv8r82QkZ/0rtZsTD/ROHfao++josngCtnN6hDfIMWolM25k
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 6gKmT8ZiNWc3cp39L93GlNEHthBEhydL
X-Authority-Analysis: v=2.4 cv=A/1sP7WG c=1 sm=1 tr=0 ts=68c99be8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=nKDAeR57af22TOinyaIA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 6gKmT8ZiNWc3cp39L93GlNEHthBEhydL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA5OCBTYWx0ZWRfX7uS9EbnDCk8g
 OqZGVsfsJaq1YOONoMzIPHCacw9iQRI26/vDMRPsogBth713hqQrr2dMXavWstzReVXXh5L86BB
 LfYUNVF1CvqG9NWaXwyMlCyjG2ank5loMlyBARiM/hp/q0jhuc2gNyzxAxVRvLSl1fze25nSXHX
 VEA1UwWmJqSzI+QDOARxj1hDgPoRF1kC0lGnC3RQ5HPgbdhlhwNns0endQsyUzg96BItaiiyFBo
 9AGE8jyoFYhCujy94Sf8SBfif1XDCh1KeCnQT9ccS+s5U2yT/nqQfHqbJ1cUT7zkZ/C56k35UgB
 ybyUrwEjvIqWnnjPJ1XTpAyOe9h7vjHJMIoAja4wBQ8Psw80Q3iRtn9uu0hzigB7b83sKlapSte
 6GLZdJm+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150098

On some MSM chipsets, the display port controller is capable of supporting
up to 4 streams.

To drive these additional streams, the pixel clocks for the corresponding
stream needs to be enabled.

Fixup the documentation of some of the bindings to clarify exactly which
stream they correspond to, then add the new bindings and device tree
changes.

---
Changes in v9:
- Dropped patches applied to drm/msm
- Link to v8: https://lore.kernel.org/r/20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com

Changes in v8:
- Expanded commit messages in order to describe that SM6350-related
  change is not going to break platform support (Krzysztof).
- Also added restrictions to clock-names properties (Krzysztof).
- Link to v7: https://lore.kernel.org/r/20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com

Changes in v7:
- Changed fallback compatible for SM6350, it doesn't have MST
- Reworked MST schema in order to remove nested ifs (Krzysztof)
- Didn't pick up Rob's R-B tag since the patch was heavily reworked
- Added P2 / P3 / MST2LINK / MST3LINK regions
- Link to v6: https://lore.kernel.org/r/20250815-dp_mst_bindings-v6-0-e715bbbb5386@oss.qualcomm.com

Changes in v6:
- Switched platforms with different MST configrations to use single
  properties entry instead of using oneOf (Rob)
- Link to v5: https://lore.kernel.org/r/20250809-dp_mst_bindings-v5-0-b185fe574f38@oss.qualcomm.com

Changes in v5:
- Removed SC7280-related comments, it has no DP MST support
- Link to v4: https://lore.kernel.org/r/20250809-dp_mst_bindings-v4-0-bb316e638284@oss.qualcomm.com

Changes in v4:
- Picked up series from Jessica by the mutual agreement
- Corrected Rob's tags (Krzysztof)
- Split X1E80100 DP patch (Dmitry)
- Removed SC7280 changes
- Enabled the MST clock on SDM845
- Link to v3: https://lore.kernel.org/r/20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com

Changes in v3:
- Fixed dtschema errors (Rob Herring)
- Documented all pixel stream clocks (Dmitry)
- Ordered compatibility list alphabetically (Dmitry)
- Dropped assigned-clocks too (Dmitry)
- Link to v2: https://lore.kernel.org/r/20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com

Changes in v2:
- Rebased on top of next-20250523
- Dropped merged maintainer patch
- Added a patch to make the corresponding dts change to add pixel 1
  stream
- Squashed pixel 0 and pixel 1 stream binding patches (Krzysztof)
- Drop assigned-clock-parents bindings for dp-controller (Krzysztof)
- Updated dp-controller.yaml to include all chipsets that support stream
  1 pixel clock (Krzysztof)
- Added missing minItems and if statement (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com

---
Dmitry Baryshkov (1):
      arm64: dts: qcom: sm6350: correct DP compatibility strings

Jessica Zhang (1):
      arm64: dts: qcom: Add MST pixel streams for displayport

 arch/arm64/boot/dts/qcom/lemans.dtsi   | 46 +++++++++++++++++-----
 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 10 +++--
 arch/arm64/boot/dts/qcom/sc7280.dtsi   |  3 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi  | 23 +++++++----
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 72 +++++++++++++++++++++++-----------
 arch/arm64/boot/dts/qcom/sdm845.dtsi   | 15 +++++--
 arch/arm64/boot/dts/qcom/sm6350.dtsi   |  2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi   | 10 +++--
 arch/arm64/boot/dts/qcom/sm8250.dtsi   | 10 +++--
 arch/arm64/boot/dts/qcom/sm8350.dtsi   | 10 +++--
 arch/arm64/boot/dts/qcom/sm8450.dtsi   | 10 +++--
 arch/arm64/boot/dts/qcom/sm8550.dtsi   | 10 +++--
 arch/arm64/boot/dts/qcom/sm8650.dtsi   | 10 +++--
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 30 +++++++++-----
 14 files changed, 186 insertions(+), 75 deletions(-)
---
base-commit: 05af764719214d6568adb55c8749dec295228da8
change-id: 20241202-dp_mst_bindings-7536ffc9ae2f

Best regards,
-- 
With best wishes
Dmitry


