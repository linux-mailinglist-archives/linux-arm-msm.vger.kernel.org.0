Return-Path: <linux-arm-msm+bounces-58859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ECAABEDF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 10:32:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8B1516708A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 08:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB792356BD;
	Wed, 21 May 2025 08:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e+a1Gs9x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020A5191F66
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 08:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747816347; cv=none; b=u5VxAmI3j8k+CogLNK6lsWE4uMBINQH5abAGlmbd+qqD6385yfOl0Ggo6ASQK4kUlkb/AUYaCFz+DkqzVtPtQ/D6TnjoKplQwltrH/b5EpyGCoJd7YiHSu1pZUW87/06EWqnAv3IMQmb0fT/vrOAZ5TYYgTXUiQihEu59cOufHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747816347; c=relaxed/simple;
	bh=Z+pmHr0ci4IImKZUHWc9uRT78PbJkNqgUbN0P1+9dWc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LqsQcpyJuAHqsSgZgjn4IztJh69ZrOmPH1xUZC25fxuObmTo4vaJQeHWCW2lm5VqlRzebVE3Z8mOtLu8VM804y0Op+EzAcvYeN9UTF+wnDhbkgQEcNPSGFdvKaCHmiKWDsSzsOUDryQXpv/CJok/idoPXvGYQm+ifs/7o6cJQ4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e+a1Gs9x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L646V7009288
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 08:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=L3ZBOUCYfdjFpgCfFbZSTY
	CenVFdfhrgxuqbRVKknHk=; b=e+a1Gs9xHvIqC8NZBjlApbcPDdMR+Uzdj1TApC
	7PtxxTJTQtaRxrlthnToXxZmOzkp5Rcs/Ym1XgFsJg9pi2GVrzGzPACbRG+q8R1t
	nMdRD33lMkDNFEvHjp/zNRBI0D1TNBCwf4LO4gFLGGxM9u7ep3AsU9NdmRFhiTLy
	4KB2saZCZrRXb+5PQA2psJdM+b4pIIQam9cM8hrYRJ62OEIuJ1p8panUvU/a9DY+
	e/0/BnqiqIRK546v6fznuNDMfBKxxcqKWyMyp+zoBsPDXeotQM4AE5yDCdv8jlng
	WVGjW6kmFm/j9xNVY/WYGf1KlIy01dSHcbq9DQCQAVZTe11A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf029ax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 08:32:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-231d4e36288so49220975ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 01:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747816344; x=1748421144;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L3ZBOUCYfdjFpgCfFbZSTYCenVFdfhrgxuqbRVKknHk=;
        b=qSodKIz3czBp1JNSyWkNyq0xHPuU8AKZO+2BSJvWcfW0u2h7zTZ0NR+9lyUoPV3Irc
         vIAhweqo/zvEQhdXsUklX3WQhpL5VehmbH47UxHDvT7LUpBq8hODq+udGOD8GjO1NuGj
         m1o4gJ2Fo+WRyOw3N8DDLp0V1BGCi0E4xuEVzukVILwmFaQ72aQNBiY/niQPXoDTjFT2
         JFw3NCfu7H+4ItXJP4qg3Uo6GOnfaWRgF7SMcIEHeNO7IHJuE/gIFD5a3V6+B1EG6otq
         iQto8e7QHBBlhgHESSAuymktQQsfg8MgeWwGz3WgZk3WyYHKPQFm//sprZA17y6J9vNc
         oZZQ==
X-Gm-Message-State: AOJu0YwI/wpQD6a7NXt48WBkbqCVweMEXrkX+CfeM9Dp/LwVsHV/HPUQ
	OfTCP1HQ178NPp8KUr7E5rcJxuzd6sHk6zdLxxAeK5kpZykb2ZUwhCe80V8NeNnUt5K5TBP4+2Y
	6OTQw0SDiZEDpgOaLBhcDwAJoxQoZ5MHZw7lVeULt2oQxyYILg+fCZbum3FAK95u7Nr8w
X-Gm-Gg: ASbGnctxYytVdpWSdZQ/UNNLUKIXPlK/JU8yVpQcAhPVDuwX2es9KvDvhNqSnRi2Y6B
	pNY3HXSCT5eBJT9ix8l+jqHSdm8FxihGDUFGXFeKWkczs7ImK+in7KkHaeVsOzZn4zCp/3AhLQP
	V3oA7PHDTCU6e/C5WnBzZtCMRF+Vcf18D+chgeHi7ozUVxN7W9woozY7gvZahXB263WnXw16cqm
	3Pos4yvuPY9fWKtUPiKkHFikKw9+iVbqY2OpOBXb6Sqst5XFjkRs4ZlS8PXjvmjvszFy7Y9IrL7
	2W/8g/hWKunsh9aHqYrEZYdaPA==
X-Received: by 2002:a17:902:da86:b0:231:d0ef:e8fc with SMTP id d9443c01a7336-231d459b1fcmr280547435ad.33.1747816344047;
        Wed, 21 May 2025 01:32:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzKMSUbAujjFG+X+OzmPIuqvvDeHtm3PqSF8ObtM9IK8ua8My2FN2tJYifhbOCmWpcdAD9NQ==
X-Received: by 2002:a17:902:da86:b0:231:d0ef:e8fc with SMTP id d9443c01a7336-231d459b1fcmr280547025ad.33.1747816343614;
        Wed, 21 May 2025 01:32:23 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-233abb99a06sm13194265ad.254.2025.05.21.01.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 01:32:23 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH v2 0/3] soc: qcom: qcom_stats: Add DDR stats
Date: Wed, 21 May 2025 14:02:09 +0530
Message-Id: <20250521-ddr_stats_-v2-0-2c54ea4fc071@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAImPLWgC/03M0QqCMBTG8VeRc91km860q94jRM7czEG62jEpZ
 O/eEoJuDvwPfL8NyAZnCU7ZBsGujpyfU8hDBv2I89UyZ1KD5FLxUlbMmNDRggt1rGiE4koXBiu
 ENLgHO7jXjl3a1KOjxYf3bq/i+/0xzT+zCsZZOfS1qBH1UeuzJ8ofT7z1fprydKCNMX4AzLCtX
 KsAAAA=
X-Change-ID: 20250426-ddr_stats_-391505b3da6a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747816340; l=2995;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=Z+pmHr0ci4IImKZUHWc9uRT78PbJkNqgUbN0P1+9dWc=;
 b=EeFIC0ShrQJhQx71FaHe+OqQiaKR8idtLxVWdDSbw/XH7kzD/sRVQLrbUR3azo3KetGTquhM1
 KlG5fOrOSA2CRG0xzKEuggp8TI0mgxMHqisg/W65Hy13hMoCxYgIU7Y
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: MRwKr12O00Tfyq40hb3WcwvkYXkgvMvx
X-Proofpoint-ORIG-GUID: MRwKr12O00Tfyq40hb3WcwvkYXkgvMvx
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682d8f99 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=LL9MhAs6j1V-iqFh5R4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA4MyBTYWx0ZWRfXzI51eWOiCY+C
 Nmv/wBYv9bFJoXOpMlLOLwRAS269WeMDqHKQi6bZON7AwPWRIp5/8pG3/hm3ktbr5q5HQNlCqT5
 +pYDx7DZGJ7O/Z4BplDdwYFFOxT2ZPovBGD0Kge0Rz7zLQ3PXd0K8o0PeLCRu7/oJ29+VX5PEGY
 UuzA3Tc2IsurdDnAMLOZfhKvbsRwK3HFKCzp6uM5WUs/XqMXrVJIvxsXcV8hLcnQajZ4ZTwXN4+
 hLw4rhIqmoPnsC34dNJb8Ig7LcHwlupNozuzwd5JAXCtIWem4dtLMOMqQTTcLTDf1CThYFOLBkh
 lPvI/qSGXEs6gizcxw1CidDbtuth9cUdcG+7mhybCWlY6nYZRdKfWju/WAL4UZJXeqs/9XUD9ZZ
 bWYkPVrvzj9fS3EZAGeKdmwXgQrh3XPAhHx0MvciJ/H61aooxomnLGnmLDBZ5gBT2U4Uf88+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_02,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210083

This series adds support to read various DDR low power mode and frequency
stats. This was added in past with series [1] but reverted with [4] due
to some SoCs boot up failures. This series is more aligned to downstream
implementation and fixes the issues mentioned in [4].

The series [1] tried to add three feature support

A. Reading DDR Frequency and low power stats from MSG RAM
   (targets where DDR stats are readily available in MSG RAM to read)

B. Trigger QMP to ask AOP to populate DDR Frequency and low power stats
   (targets where DDR stats are available but duration field syncing
   requires QMP message to be sent to AOP)

C. Trigger QMP to ask AOP to populate DDR vote table information
   (To read different DRV / Direct Resource Voter, CPUSS, DSPs's votes
   for DDR frequency)

Current series do not include reading the DDR vote table information (C)
part from [1] which is to be separately sent potentially including reading
other resources votes like Cx Rail level vote information. These vote
tables details are not strictly related to DDR Frequency and low power
stats (A) and (B) this series is adding.

This series updates respective SoC devicetree with QMP handle (where DDR
stats syncing is required) and it is backward compatible with older
devicetree as without the QMP handle present, ddr stats can be still be
read (duration field will be read as 0).

Note that [1] was only partially reverted and hence device binding update
for QMP handle [2] is already present along with the fix to have
dependency on AOSS QMP driver in Kconfig [3].

[1] https://lore.kernel.org/all/20231130-topic-ddr_sleep_stats-v1-0-5981c2e764b6@linaro.org/
[2] https://lore.kernel.org/all/20231130-topic-ddr_sleep_stats-v1-2-5981c2e764b6@linaro.org/
[3] https://lore.kernel.org/lkml/20231205-qcom_stats-aoss_qmp-dependency-v1-1-8dabe1b5c32a@quicinc.com/T/
[4] https://lore.kernel.org/all/20231214-topic-undo_ddr_stats-v1-1-1fe32c258e56@linaro.org/

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
Changes in v2:
- Mention count in decimal instead of hex
- Update read failure cases to return error code instead of success
- Fix typo in comment
- Link to v1: https://lore.kernel.org/r/20250429-ddr_stats_-v1-0-4fc818aab7bb@oss.qualcomm.com

---
Maulik Shah (3):
      soc: qcom: qcom_stats: Add support to read DDR statistic
      soc: qcom: qcom_stats: Add QMP support for syncing ddr stats
      arm64: dts: qcom: Add QMP handle for qcom_stats

 arch/arm64/boot/dts/qcom/sm8450.dtsi |   1 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi |   1 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi |   1 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi |   1 +
 drivers/soc/qcom/qcom_stats.c        | 126 +++++++++++++++++++++++++++++++++++
 5 files changed, 130 insertions(+)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250426-ddr_stats_-391505b3da6a

Best regards,
-- 
Maulik Shah <maulik.shah@oss.qualcomm.com>


