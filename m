Return-Path: <linux-arm-msm+bounces-70840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEEFB35737
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 10:37:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2F72683F6B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 08:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4A22FC867;
	Tue, 26 Aug 2025 08:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e3UnsOO/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6756C2FB963
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 08:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756197435; cv=none; b=o3ddZzc1NGwiTak6eD0fc9pcfFAogxv946eyGN0Jl91KvFKTCh4AcHmDL5DbVDaMabJ1XsZASjWbrOFgoqzDF9Ab/EqiYawlYq8sbSJWBGOKH2cpStApWZ81EuJhsv4/bMOEXQRrYkLOAaoIn44RxwBv3OjzkSXT/oj6sQWRB7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756197435; c=relaxed/simple;
	bh=YLAD8eDg5GxLGCFxe06e+I8njoc5xEymTTxe0/3cBMc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZxC1C6PXraleRwVWnjw+ejaAGnIGSDNuVUPhBP5AtR46jndQOGfWKG7LtQUjV2bnRZzNfFIhn59ATp5frGBOnbF++tasWV10XMg+bKixOn77lztm00qDfptZGVvU2nRKsOXui/5ZuYpytKjanHCrOrzpd73FGeKZEiH1QOqGpUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e3UnsOO/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q4VAXN005250
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 08:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YZd+/02wLenYVHetvdpswF7OQX/cRReCH3j
	VQ3gZPQA=; b=e3UnsOO/oltgu++a2gzBPErpsd3RnuiCGfZjDFhx8OXdTwJI8G0
	eCKCYRXVI0eCn+Bh+XXxEVKz85Hb44sAcO01iO0UlOYOThuRHyX6cMpLZTcZngTA
	g1LghX35DpCV+A/+Ui7WXqOQZ7nva8rykPl1szzG/qhj2I9FRkFLcaD4QZM4Edf1
	B4BaPMhFR2mMsGLnC5UF7+lOl0Iu5sHL0rkAMHHu9l41GXYR4DCavM7T2kBrv7Ri
	HHUx3Osbf3oUgZ7oe1Np9uRE/YXedra6OKbQrOoGeRrIKsFcj0W3RJZAZ9i63PNI
	ht4ZOeBYD/s/ZntKtkQg6THiDHLD8/mPqRQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48rtpete6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 08:37:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-246bcd0a112so17182275ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 01:37:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756197431; x=1756802231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YZd+/02wLenYVHetvdpswF7OQX/cRReCH3jVQ3gZPQA=;
        b=OUVXK27Q1T1opdRqY4Let+I5jTjA5aYicXuZM1juKamZpB2UTu2Qzz9TN8dDSUhYaB
         5zyoDZ7saPwfPwa5yiYlt1fI+qPBmwdvVCr/Uw5JVEoAyAbIVdPD1d9lrNaZxjJxntvI
         d43glcRbDGctnV39i84uofkyQHz+ac/Puy4q2lEdxsrcnW4WUbWKb1qr8Kt/mopoxPJC
         BWtEG2jUGd5eRnkwYDvsk4yzKY5jEnTU8OnSOzC1GcwUv8iq3V7s0ccE+ix4EAvB06r/
         2MotcSPOgAeFACS5fuGghj39SX6d3AdUQBsWO3mfwdyOMeROILC/HeVGuiYprshH5poE
         erFg==
X-Forwarded-Encrypted: i=1; AJvYcCV8QIGTpaADKbFFlY4MG/uIuGhveZfZxQQnm/3ljeTmKXyZm9NMaDXiLo9YBbUXVAaJDMDXAUrN4L87kPsf@vger.kernel.org
X-Gm-Message-State: AOJu0YydNFPvne/dNbiM11wXlJ0IqoZ7pxS7fvpRsLobcGRGCiHMxDwT
	YvBnJdKzyqPLscKIMpqjWKiAHDjLcga71WL5aRkPID0jFbZepuHL1RGC7G1DmmDWhxaSE4YJSMq
	0EbrrpZF8vx3ezDOohX+IM9GVZ8xVYaYxIOrdzXh/7jHbwj0Je1ELOy7kLy85PItIafDn
X-Gm-Gg: ASbGncuu1sFJNSQ/Gz5SOE7UERn0DXYNSzXIat9w+m2ZgD0MhF8+avJ2tlHGDhVJLFY
	Xm6jvlv0Xvecr7fdh8/sVt1HXYUwduefx/ULcnB3DhY2z8nkjf+P7itR8UKF3QkNQiJq4OlzNKz
	18/SZ+BmLSJw+Pt6lTNp1UQDxKmir75lSkARE3WHLQsO7fZiuz/nJtDPueCHLJboMn+NYYQb22G
	rIUHa9UgxTcgoAxC8pzV9jRgzgS5G1l0oZibsgd1EXSvxwf1Ie8vqCfuih2W1ZDzQwBgh2d6gNq
	w5uGEQWTUJdUsyxqFhN16mkD6GndxyfKeFPe3tEQKMgy3cnhDaUILRaMAOdZXQTRE/MmkJsquGE
	=
X-Received: by 2002:a17:903:24d:b0:242:3105:1788 with SMTP id d9443c01a7336-2462ef8ef7fmr198454055ad.45.1756197430745;
        Tue, 26 Aug 2025 01:37:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVwhcaRNNgNEY1PGTnITAdjFL+ckseK0Su8lAa4tceRs+rr6L41TJSn/YSZcz5GSu2PT25iw==
X-Received: by 2002:a17:903:24d:b0:242:3105:1788 with SMTP id d9443c01a7336-2462ef8ef7fmr198453555ad.45.1756197430182;
        Tue, 26 Aug 2025 01:37:10 -0700 (PDT)
Received: from hu-jprakash-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246ed91ee20sm36924785ad.136.2025.08.26.01.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 01:37:09 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
To: jic23@kernel.org, robh@kernel.org, krzysztof.kozlowski@linaro.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, agross@kernel.org,
        andersson@kernel.org, lumag@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konradybcio@kernel.org,
        daniel.lezcano@linaro.org, sboyd@kernel.org, amitk@kernel.org,
        thara.gopinath@gmail.com, lee@kernel.org, rafael@kernel.org,
        subbaraman.narayanamurthy@oss.qualcomm.com,
        david.collins@oss.qualcomm.com, anjelique.melendez@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        cros-qcom-dts-watchers@chromium.org, jishnu.prakash@oss.qualcomm.com,
        quic_kotarake@quicinc.com, neil.armstrong@linaro.org,
        stephan.gerhold@linaro.org
Subject: [PATCH V7 0/5] Add support for QCOM SPMI PMIC5 Gen3 ADC
Date: Tue, 26 Aug 2025 14:06:52 +0530
Message-Id: <20250826083657.4005727-1-jishnu.prakash@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ur4P_Zg45H9DTS7t6QmI7rY6WXaAPizc
X-Proofpoint-ORIG-GUID: ur4P_Zg45H9DTS7t6QmI7rY6WXaAPizc
X-Authority-Analysis: v=2.4 cv=Hd8UTjE8 c=1 sm=1 tr=0 ts=68ad7238 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=N0aDCOoQtnTZPCUHnXIA:9 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE0MiBTYWx0ZWRfX5sjdRm0qlHZc
 BE2NwyRfQUot6vBct8uei9Th4C5NU+2XIGMxpdy1OdCqxmiAAGbR/K/z+/08yKq4DtaXISawSQY
 F8k38dTRvSL8W0oVzYgJ9l+0FkzvO0ZgcX86G710B1RROWvQeqYSQR8XTpQ5yfjr5KjTMyAHOiQ
 jTFCkQRr/QK5lXFACkmhuX073th0+gddmHn3m6ifQU6BdkOktW/RDZfKpCvRCh2OwelANZGQjq5
 uJd4XK6BsDZIBEVO3qUU2OCSM/90wcDI1az9e+nfSexjBRR60l0uyptn9Lo8+KDyKrpBihoxPTM
 fR8cqFwfC0fWv00ZBurMVJ0+8/72MNZNf/7/eRX1vxlM292EW3co+7mYQTaLW9egup5GZ4Us/e+
 DRBnuJZt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508250142

PMIC5 Gen3 has a similar ADC architecture to that on PMIC5 Gen2,
with all SW communication to ADC going through PMK8550 which
communicates with other PMICs through PBS. The major difference is
that the register interface used here is that of an SDAM present on
PMK8550, rather than a dedicated ADC peripheral. There may be more than one
SDAM used for ADC5 Gen3. Each ADC SDAM has eight channels, each of which may
be used for either immediate reads (same functionality as previous PMIC5 and
PMIC5 Gen2 ADC peripherals) or recurring measurements (same as PMIC5 and PMIC5
Gen2 ADC_TM functionality). In this case, we have VADC and ADC_TM functionality
combined into the same driver.

Patch 1 is a cleanup, to move the QCOM ADC dt-bindings files from
dt-bindings/iio to dt-bindings/iio/adc folder, as they are
specifically for ADC devices. It also fixes all compilation errors
with this change in driver and devicetree files and similar errors
in documentation for dtbinding check.

Patch 2 splits out the common ADC channel properties used on older
VADC devices, which would also be reused on ADC5 Gen3.

Patch 3 adds bindings for ADC5 Gen3 peripheral.

Patch 4 adds the main driver for ADC5 Gen3.

Patch 5 adds the auxiliary thermal driver which supports the ADC_TM
functionality of ADC5 Gen3.

Changes since v6:
- Updated auxiliary device cleanup handling to fix memory freeing issues
- Updated copyright license in newly added files
- Addressed some reviewer comments in documentation and driver patches.
- Link to v6: https://lore.kernel.org/all/20250509110959.3384306-1-jishnu.prakash@oss.qualcomm.com/

Changes since v5:
- Addressed some reviewer comments in documentation and driver patches.
- Link to v5: https://lore.kernel.org/all/20250131183242.3653595-1-jishnu.prakash@oss.qualcomm.com/

Changes since v4:
- Split common ADC channel properties out into a separate file to use as 
  ref for ADC5 Gen3 and moved ADC5 Gen3 documentation into a separate
  file as suggested by reviewers.
- Addressed few reviewer comments in driver patches.
- Link to v4: https://lore.kernel.org/all/20241030185854.4015348-1-quic_jprakash@quicinc.com/

Changes since v3:
- Updated files affected by adc file path change in /arch/arm folder,
  which were missed earlier.
- Added ADC5 Gen3 documentation changes in existing qcom,spmi-vadc.yaml file
  instead of adding separate file and addressed reviewer comments for all bindings.
- Addressed review comments in driver patch. Split out TM functionality into
  auxiliary driver in separate patch and added required changes in main driver.
- Link to v3: https://lore.kernel.org/all/20231231171237.3322376-1-quic_jprakash@quicinc.com/

Changes since v2:
- Reordered patches to keep cleanup change for ADC files first.
- Moved ADC5 Gen3 documentation into a separate file

Changes since v1:
- Dropped patches 1-5 for changing 'ADC7' peripheral name to 'ADC5 Gen2'.
- Addressed reviewer comments for binding and driver patches for ADC5 Gen3.
- Combined patches 8-11 into a single patch as requested by reviewers to make
  the change clearer and made all fixes required in same patch.

Jishnu Prakash (5):
  dt-bindings: iio/adc: Move QCOM ADC bindings to iio/adc folder
  dt-bindings: iio: adc: Split out QCOM VADC channel properties
  dt-bindings: iio: adc: Add support for QCOM PMIC5 Gen3 ADC
  iio: adc: Add support for QCOM PMIC5 Gen3 ADC
  thermal: qcom: add support for PMIC5 Gen3 ADC thermal monitoring

 .../bindings/iio/adc/qcom,spmi-adc5-gen3.yaml | 155 ++++
 .../iio/adc/qcom,spmi-vadc-common.yaml        |  87 ++
 .../bindings/iio/adc/qcom,spmi-vadc.yaml      |  81 +-
 .../bindings/mfd/qcom,spmi-pmic.yaml          |   3 +-
 .../bindings/thermal/qcom-spmi-adc-tm-hc.yaml |   2 +-
 .../bindings/thermal/qcom-spmi-adc-tm5.yaml   |   6 +-
 arch/arm/boot/dts/qcom/pm8226.dtsi            |   2 +-
 arch/arm/boot/dts/qcom/pm8941.dtsi            |   2 +-
 arch/arm/boot/dts/qcom/pma8084.dtsi           |   2 +-
 arch/arm/boot/dts/qcom/pmx55.dtsi             |   2 +-
 arch/arm64/boot/dts/qcom/pm4125.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/pm6125.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/pm6150.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/pm6150l.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/pm660.dtsi           |   2 +-
 arch/arm64/boot/dts/qcom/pm660l.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/pm7250b.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/pm8150.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/pm8150b.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/pm8150l.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/pm8916.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/pm8937.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/pm8950.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/pm8953.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/pm8994.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/pm8998.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/pmi632.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/pmi8950.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi     |   2 +-
 arch/arm64/boot/dts/qcom/pmp8074.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/pms405.dtsi          |   2 +-
 .../boot/dts/qcom/qcm6490-fairphone-fp5.dts   |   4 +-
 .../boot/dts/qcom/qcm6490-shift-otter.dts     |   4 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |   4 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dts       |   2 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi      |   2 +-
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi    |   4 +-
 arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi   |   2 +-
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts |   2 +-
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    |   2 +-
 .../dts/qcom/sc8280xp-microsoft-blackrock.dts |   2 +-
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi  |   6 +-
 .../boot/dts/qcom/sm7225-fairphone-fp4.dts    |   2 +-
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts |   6 +-
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts       |   8 +-
 drivers/iio/adc/Kconfig                       |  30 +
 drivers/iio/adc/Makefile                      |   2 +
 drivers/iio/adc/qcom-adc5-gen3-common.c       | 106 +++
 drivers/iio/adc/qcom-spmi-adc5-gen3.c         | 762 ++++++++++++++++++
 drivers/iio/adc/qcom-spmi-adc5.c              |   2 +-
 drivers/iio/adc/qcom-spmi-vadc.c              |   2 +-
 drivers/thermal/qcom/Kconfig                  |   9 +
 drivers/thermal/qcom/Makefile                 |   1 +
 drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c | 535 ++++++++++++
 .../iio/adc/qcom,pm8550-adc5-gen3.h           |  46 ++
 .../iio/adc/qcom,pm8550b-adc5-gen3.h          |  85 ++
 .../iio/adc/qcom,pm8550vx-adc5-gen3.h         |  22 +
 .../iio/adc/qcom,pmk8550-adc5-gen3.h          |  52 ++
 .../iio/{ => adc}/qcom,spmi-adc7-pm7325.h     |   2 +-
 .../iio/{ => adc}/qcom,spmi-adc7-pm8350.h     |   2 +-
 .../iio/{ => adc}/qcom,spmi-adc7-pm8350b.h    |   2 +-
 .../iio/{ => adc}/qcom,spmi-adc7-pmk8350.h    |   2 +-
 .../iio/{ => adc}/qcom,spmi-adc7-pmr735a.h    |   2 +-
 .../iio/{ => adc}/qcom,spmi-adc7-pmr735b.h    |   2 +-
 .../iio/{ => adc}/qcom,spmi-adc7-smb139x.h    |   2 +-
 .../iio/{ => adc}/qcom,spmi-vadc.h            |  79 ++
 include/linux/iio/adc/qcom-adc5-gen3-common.h | 193 +++++
 67 files changed, 2235 insertions(+), 139 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml
 create mode 100644 Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc-common.yaml
 create mode 100644 drivers/iio/adc/qcom-adc5-gen3-common.c
 create mode 100644 drivers/iio/adc/qcom-spmi-adc5-gen3.c
 create mode 100644 drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c
 create mode 100644 include/dt-bindings/iio/adc/qcom,pm8550-adc5-gen3.h
 create mode 100644 include/dt-bindings/iio/adc/qcom,pm8550b-adc5-gen3.h
 create mode 100644 include/dt-bindings/iio/adc/qcom,pm8550vx-adc5-gen3.h
 create mode 100644 include/dt-bindings/iio/adc/qcom,pmk8550-adc5-gen3.h
 rename include/dt-bindings/iio/{ => adc}/qcom,spmi-adc7-pm7325.h (98%)
 rename include/dt-bindings/iio/{ => adc}/qcom,spmi-adc7-pm8350.h (98%)
 rename include/dt-bindings/iio/{ => adc}/qcom,spmi-adc7-pm8350b.h (99%)
 rename include/dt-bindings/iio/{ => adc}/qcom,spmi-adc7-pmk8350.h (97%)
 rename include/dt-bindings/iio/{ => adc}/qcom,spmi-adc7-pmr735a.h (95%)
 rename include/dt-bindings/iio/{ => adc}/qcom,spmi-adc7-pmr735b.h (95%)
 rename include/dt-bindings/iio/{ => adc}/qcom,spmi-adc7-smb139x.h (93%)
 rename include/dt-bindings/iio/{ => adc}/qcom,spmi-vadc.h (78%)
 create mode 100644 include/linux/iio/adc/qcom-adc5-gen3-common.h


base-commit: 0f4c93f7eb861acab537dbe94441817a270537bf
-- 
2.25.1


