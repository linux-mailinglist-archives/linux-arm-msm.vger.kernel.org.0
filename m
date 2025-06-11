Return-Path: <linux-arm-msm+bounces-60910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB36BAD4AA0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 08:04:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54B071758B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 06:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7404221CC5F;
	Wed, 11 Jun 2025 06:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jlm5bDpb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50A91E51F1
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 06:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749621859; cv=none; b=DRMF5BkZRByShoB/HxKItkp7uWbO0mQUbmUNxgkqP5fYXQpitGvq8Z1BBZErqeb6Jwz9fuoOHtjt7KZSkjbuYqdBzOg36r1XBGWLenvPeUoEEfh0fEaeDy12E2ggOdF47pOytLA7jWyjo8PXffRi6kEm0E5AI4gaA8XFqyWU50k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749621859; c=relaxed/simple;
	bh=HV18Og1I2iEUxD4I8eDexzTJxa5Uyj7M5o26NT89eUg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qFcEMl4gUnIiGxmcpBNzlRMQELGzI8ppczCvPW5ulUQytUUOpph6s7MdV3bO/RbF1wg7y07oZxJ7EWy3f30uGQm659rkrzXkB7V43TIf+04GviIdfsn70upHuIwSv+NnH6ZJJOf6mByeBmgTV5trgXO69ux9DcnPizUdPjXR+S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jlm5bDpb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B4scNs017282
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 06:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aEKGonfkNlVgj0BYAtHacH
	r3N8cUCIWxQs0+ZU6isQw=; b=jlm5bDpbQauuXqzHdyjULCxRD1JF3r4qMBKE2t
	9Vk3thDxHu4L6cRep7hbkKxh8QZN1pskztqdaoMVvn6NCunfAFpS93aX2weGx4/c
	fYp90XRgVOp1K0TfqHnFGOLbNyzdb5Kl3YmnxsZ1N0L9AcNG5Lea3fUKhOXZgHmm
	ggmS6NqSX4KnHN9kYIun+DMeSYLN5WRT1wIKpH68mNQBYCNC5dKoxdt04OMRmKyq
	cK+j1jbukaPbkfFepru2zq0QKgQhbdVyJBce3GN1Idqp65ST9zDUTYfPb3x8kM2d
	u1bh4C9WG6kfwL3PhJGLv8ymcUzjpxkx1MYNxKLAi4Q50L0w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47736dr4k1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 06:04:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3122368d82bso9666054a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 23:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749621855; x=1750226655;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aEKGonfkNlVgj0BYAtHacHr3N8cUCIWxQs0+ZU6isQw=;
        b=qg/5pwMC4j6IcmMlIQ4TX+dJwNV4K94AaCLPsWaYFJwlGCqjqqpJPtZOz6NmRCOBLC
         bnNnM4ZPJzyPLxwLMEMeiloykNXK3BTbKwFSYqU9pTYyFfHuBuKvykNIegYY8EE0eLuK
         ouhIOPZXPk9B8jndnpOtdl+JPdedcQbyQF7M5/4osyX3x/MztKtlKp2ZGDFy36+UTvsM
         YiFx/TILtWBEJzM39oY8VDNqUcoWZqGDwiiZW0qSPz+r+dLzSjc7fe1uQNTVwp3imB0m
         wPYy7UqAYOeJ09pIiWiV7Hsne87L7LffEx9iadMI9cyRc/3168SocxUqRMvFvDNR9roJ
         1SRw==
X-Gm-Message-State: AOJu0YyvlyejKwzHa7U1nJTTzhP9P/LiXVgt8CxnqNd2HVa02W72X35F
	8o7KZJTtyeCaq7miDpIVIcxrcs5xR7E75iwSI765brYZwkIJ01LsnUw438iKMk0CKDhbMxisbrH
	eU9dJ08oJQo1AmSC3c1hx4MKDf8UWnik7J2OXskD0Q7HFygQD4R0qCp0ZjvNhdpauhi0v
X-Gm-Gg: ASbGncvwf38dslQ4VmxhJs5BIG8jiC2ouMwjN41Dm6pNkLUVemqSdJycrXqVuQO0HqF
	xyRwspHO9hNowD8zlJrKp+uBlu7cRsbSgnOTQLGj1/XfH0A/f0onoEWST0jfj4WtmWEXEnMmr04
	ZWoSpSsOs0NMvVFInNTZFFuhoE8MBYCmmIKPFhyg5aN3ELE74cxs3N0Dv9HcYQxcaKw9MYdY4Nv
	+fRBYT6LuLPDI3psSbiUwNMsCQ9D2K4LeidDisa9fqvtVfebYacCM2WO7V1XITVVYoEvfpMN/Ds
	EkRXDvz5S2owb+HKXIZ6Pw+DU7FwACQD9yqh
X-Received: by 2002:a17:90b:1807:b0:311:ff18:b84b with SMTP id 98e67ed59e1d1-313b1ff14b1mr1889814a91.25.1749621854896;
        Tue, 10 Jun 2025 23:04:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2De2CfAW/nhEXwzxH/8Z5sn0yu3qhpnc8aALmeXRtyxM55oEzv+7QcLPFeXeCVL74G67uBw==
X-Received: by 2002:a17:90b:1807:b0:311:ff18:b84b with SMTP id 98e67ed59e1d1-313b1ff14b1mr1889776a91.25.1749621854346;
        Tue, 10 Jun 2025 23:04:14 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032ff05esm79429685ad.135.2025.06.10.23.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:04:14 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH v5 0/3] soc: qcom: qcom_stats: Add DDR stats
Date: Wed, 11 Jun 2025 11:33:44 +0530
Message-Id: <20250611-ddr_stats_-v5-0-24b16dd67c9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEAcSWgC/3XOSwrCMBCA4atI1qYkk8S0rryHiEweakBbTWpRp
 Hc3LYgt6GbgH5iPeZHkY/CJrBcvEn0XUmjqHGq5IPaE9dHT4HITYKCYhBV1Lu5Ti23aU1FxxZQ
 RDldI8sE1+kN4jNh2l/sUUtvE52h3fNh+mGrKdJwyKg+25CWi0cZsmpSK2x3PtrlcijzIoHXwF
 RTwmQBZAKukx+wwzf8IYiqomSCGHyoUlnsJzug/gpwK5UyQWTDSaIeeaXD2h9D3/Rv/3pg9cQE
 AAA==
X-Change-ID: 20250426-ddr_stats_-391505b3da6a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749621850; l=3512;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=HV18Og1I2iEUxD4I8eDexzTJxa5Uyj7M5o26NT89eUg=;
 b=EBn3cNXv1JB7OAk3LIJqZwyiMSbER4sTYQ/rElyMXW2YZAuBazMe37Ldvl+PXWpTVBGtgSUAq
 p9ihzVGk1j4BFToCZbdmLzuZHstmsFrKhEYPQlDMBfT7YdEXcZZ51sv
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=GIYIEvNK c=1 sm=1 tr=0 ts=68491c60 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ubf2v9fuHxWRXcPCyOcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 6bEgKwqahHJwWn2QzvHf0ZaNFB4-ROnt
X-Proofpoint-GUID: 6bEgKwqahHJwWn2QzvHf0ZaNFB4-ROnt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA1MiBTYWx0ZWRfX1pPpKfogHrqa
 eJfHjA+IW40qEzH7aGVP+Q9kHu6kjvhq5YLXJFSRSZQdTd0ddGDbVG2/405gMfk1tCNskPQb6bx
 WuX5h2lTvenPD/M/JbuS+FpCKQAZ2LKOZI5qTSE/7DhodWwXkZ8H+ZgIP7qVwPfDwN6dx9Erg9N
 PECGpO0OpRzRJL14wa9g7oCgJulXJnBkad0vnginaOoGBawyyQsrJbpu4UMfdZC4/XPpQXQ5awF
 X2+/rbFBYJKrh8FQZeYIV0snWCow+DFhGEr4S9QHcupCzH7/BtMXmryT9h05PhEcuF/XxUpI+Md
 b/nmE6Rs5uh3c8EpqgMYr2cwY5e2oRDaAe89PwiRGDPyx5KOB58ANvLP+UVuFKfFMS5Gpvv+eFI
 jwTJRXMo+GMTCrTTBrgtT6I/RiR/cZzloEeNuNXBhHcHcrwAv4UWz45LfHpcH4FrJ8dGNoNa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_02,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110052

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
Changes in v5:
- Handle the qmp_get() failure cases
- Add Reviewed-by.
- Link to v4: https://lore.kernel.org/r/20250528-ddr_stats_-v4-0-b4b7dae072dc@oss.qualcomm.com

Changes in v4:
- Handle clean up for qmp_get() probe defer case
- Link to v3: https://lore.kernel.org/r/20250525-ddr_stats_-v3-0-49a3c1e42db7@oss.qualcomm.com

Changes in v3:
- Use correct format specifiers
- Handle qmp_get() failure cases
- Link to v2: https://lore.kernel.org/r/20250521-ddr_stats_-v2-0-2c54ea4fc071@oss.qualcomm.com

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
 drivers/soc/qcom/qcom_stats.c        | 133 +++++++++++++++++++++++++++++++++++
 5 files changed, 137 insertions(+)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250426-ddr_stats_-391505b3da6a

Best regards,
-- 
Maulik Shah <maulik.shah@oss.qualcomm.com>


