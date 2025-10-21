Return-Path: <linux-arm-msm+bounces-78215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07538BF8E66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 23:09:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFF453AF1F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 21:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66F7D27B324;
	Tue, 21 Oct 2025 21:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ngoE5jwg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD6015CD74
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 21:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761080944; cv=none; b=bgbWmhIgD3TG5t+Tl11rYmXWQFvePUoMV/UyzjvM6uldGpeNpTz70enUgZKCUOCsbmVG/YTdwJuJLP9BEGPCgmUsSOKU8hvth5ZrNQ+KXdw/UA7CXPL4Eo2UanJjC62lLApQ357mB8x32jQpjekXDo0rjBOOWV/83uAovy2xd98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761080944; c=relaxed/simple;
	bh=AGCHV4jZeRYSACDXgXSzIHpr5GZWz3GvyhnV3yk/D6c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tQt9LWvi7189mu4fcp8EG4PnC17rC7RjoX21+DuJnGT2hoCy2hoCwOjkMsmStjqjkwSO26y75hzzwQsQWe+F01qHIexE+BAIqevRsbOthub1D6Ud04r155BghmZsO2lubiZGyUWPlMQ6jLDKuGmbzH4GvRBAh7RV/biQ5suBxg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ngoE5jwg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LETHE1024737
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 21:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4XTSr1W6X5jhv/xaLPKWU4
	3O66osxl09YjnMvID7Bzc=; b=ngoE5jwg0tdgelKZoPwB5gFMERE+I9gMPUbatA
	gG6WdirnjgBtwxT/vU9pwo54e/E+aMr9GU6bGzgj6SXAklRcZvXbuq7iVYCJPlye
	cUZNUMI0Tdn+svPoSvu9XzZ3DpqJEdBzywkn1cINdR+KTu2WwbzL9/uWg3KVbH0x
	3V1qoIvZ0jhQ4+3RM0Cuwa2QkS7qhuymhr5AW2ultD/KNJWXZgAvajGn2KurkTuC
	9kHooQ4yussTYFk02gSKf7RFU0niDSxfuhGDq4kHtreLLxWLHE4gllSXCf4mBuE4
	k6LU0nWFw94563aSsGpAYfcVtPOV0Rq5ftjwev9uJBsNIV/w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wsws4mdt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 21:09:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32eb864fe90so1075830a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 14:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761080940; x=1761685740;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4XTSr1W6X5jhv/xaLPKWU43O66osxl09YjnMvID7Bzc=;
        b=drhLyVk85n4ZFm9Yd4vfjnQ3aMiCtHc4Runnp38FGls46wukv8xRloJo6zzlyqiQE+
         cf3disQeYTsDtD6aiLKrcwS36k4Sifws6uTgSRm5cyRauDmqrHK8idqWLqhVy+WdhmT1
         VXbFjn0VdJTW6fhjV2aSVwgsg/LXwmJZx61UcATApFy9jC7Wb/Tydt9WI0h0mF7JMeeq
         A/0FuCOWPA/tjYpdWWP/GWw2PLneDuAS1lNmxHCGR7hWhwuJy7hgZGADJF1z3rjSuFZ0
         L4sG8Hn2Ait9WuD5GQ4F+Ww9kLyGVxpZjDbkHGfAHK0oy1/di+I2OfMpfNokj6uf2Pk+
         Pa8Q==
X-Gm-Message-State: AOJu0YzC8Qdvg+DIyxyvFkNhgtVll53JcbcPDlxLjtjNlBtS3yNdRXqg
	2Vv3MY0bzLbqeu676KPQlU4nL2OhwQrBsI8yMQwl/3R9h4/OjHMG3W6ttzmEOPTFzqonMepwSzg
	Pj4vtqTWFNNLqjY35TTEAady7WnnWCpPIagBhr3kLQR2zmjvm9Q6OSJgiD2/paSX+mtyU
X-Gm-Gg: ASbGnctWqZ4zsWlJZF7tMeuTkdnB041kc6cQj2NRMFhvxTNxDFkkWGfet3n3H0ZZlSU
	1rs+1MqZ+W2uVFqVZRtg1BKFOzsJF+Cz+JGhdnH8NUgTA5pn8AVkmijEU3VNUGUX+54iO/BUPo5
	UGN53Y16Tex5crvazGss3W4tAQg3yzUxPI4huIavcwveaGt+X4eD8oqDvlkV4w7qp1gaa+JuxNN
	sFlKquwkXMkAeLbbUJcjWITsN7F4EX4A6nektndHiiNAmsyXVk65z8IWZwut5K/zMpmI+yS+W9E
	QSyUJwiAGmRFofOCaSwuQnHbiq31dZ/PgWHajwqBvPN6Fiby4LHuW95bZWFBbFirQTyDLHCFWEz
	gTKZTLxNNaLeGA//qVb/YfB9r9r+IMdbMYRHGDpP3JpT2gLxF1eMWY2g/D5tL
X-Received: by 2002:a17:90b:3c0c:b0:33b:c5f6:40f1 with SMTP id 98e67ed59e1d1-33bcf85d123mr25310745a91.7.1761080940176;
        Tue, 21 Oct 2025 14:09:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFx6xI638rJZfuviQ2wzApZ5HGV3pqSRbJYp5jTPZWkGRauwK7uKMWBxX4XX84SqJKuHMbCEg==
X-Received: by 2002:a17:90b:3c0c:b0:33b:c5f6:40f1 with SMTP id 98e67ed59e1d1-33bcf85d123mr25310718a91.7.1761080939760;
        Tue, 21 Oct 2025 14:08:59 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223c813fsm489833a91.4.2025.10.21.14.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 14:08:58 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Add support to read RPMH regulator settings
Date: Wed, 22 Oct 2025 02:38:52 +0530
Message-Id: <20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGT292gC/4WNQQqDMBBFr1Jm3ZE4QUm76j2Ki5DEGqgmnVFpE
 e/e1At08+F9+O9vIIFjELieNuCwRolpKkDnE7jBTo+A0RcGUtSoljRa75HzOCAH61GWnBPPqMm
 Y3mjnSFko28yhj+/De+8KD1HmxJ/jZq1/7T/jWqNCGxqjPbWqvjS3JFK9Fvt0aRyrEtDt+/4FQ
 6QQFcEAAAA=
X-Change-ID: 20250623-add-rpmh-read-support-3288f83cc20a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761080935; l=3228;
 i=kamal.wadhwa@oss.qualcomm.com; s=20241018; h=from:subject:message-id;
 bh=AGCHV4jZeRYSACDXgXSzIHpr5GZWz3GvyhnV3yk/D6c=;
 b=f6ivcBAWiBI2ZMY23Wxj7VGH9SW+bJc7WgATz0dSN7+hRXtElcIBbNOvBGidZqSquJUfaJhpT
 JHOtpCfzjiiC5PaI+0bgTiPexUuy9q8i2E5FLy3Q3zBQKOA7ez44L3t
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE0OCBTYWx0ZWRfX8ZR3l7o+Nw/I
 Pq3iaZ3MLVwrBQupXjTxYsainGbcnxoudwZuX3xJ9ZBoGN112XJeBbtou/VPc8DyR4noFTO621d
 e1khucFQHe25cLANurvk4gL+N+quNmu0HJr6saGa1+yMIqoIsnyQn7WNsRK390a6xbpq3TPFnIk
 vJ04rRJdjZSuOAGXH0FW6iNGlK6IWSVy+6cCwZXGBtePy7W8Pau3Hw+tqvBrVwqBFwMSh4J4DWl
 a9PeXuf0FDMyT/4wsefol2/E34CTz0H/tl1+ldj8ZxcVIbFaSNbAalyo4Qjt1uFPE+szW0rIpLJ
 hvmxebWAKUOMGWogAuLm6+vxikGgPHyYu4JTrbl7e9oeaBAqGPPzjppu3eBwy1PxukgaTRVPGmn
 6BxfH8MA3GPUZQRWxjLON+TXy77/AQ==
X-Proofpoint-GUID: vRy_p9Wj0aOW72SfAFd3U7C2FW8AdNvF
X-Proofpoint-ORIG-GUID: vRy_p9Wj0aOW72SfAFd3U7C2FW8AdNvF
X-Authority-Analysis: v=2.4 cv=a+E9NESF c=1 sm=1 tr=0 ts=68f7f66d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SSp4yj_AV0YVitkQLB8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200148

This patch series adds a new `rpmh_read()` API to allow reading RPMH
addresses. Also, using this new API, enhances the RPMH regulator driver
get_regulator* APIs like `get_regulator_sel()`, `get_mode()` and
`get_status()` to allow reading voltage/mode/enable setting from H/W.

This is needed because current design has a limitation - regulator
framework can only get the cached values from the last voltage set
operation. Because of this right after bootup a `get_voltage_sel()`
from regulator framework will return -ENOTRECOVERABLE error, causing
regulator framework to trigger an unnecessary `set_voltage_sel()` call
with the `min_uV` value specified in the regulator's device tree
settings, which can cause issues for consumers like the display and
UFS that require a consistent voltage setting from the bootloader
state until their drivers are probed.

With this change regulator framework will get the regulator voltage
and other settings, as configured during bootloader stage, avoiding
unnecessary voltage adjustments and maintaining consistent power
settings across the transition from bootloader to kernel.

Besides this feature this series also fixes:-
- An existing issue with the BOB5 pass code value. This is needed
  by `get_status()`.
- Code format/style related errors reported by checkpatch.pl.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
Changes in v2:
- Fixed the BOB bypass mode handling (existing issue in current driver).
  This was needed for `get_status()` implementation.
- Implemented `get_status()` callback.
- Callbacks for `is_enabled()` & `get_mode()` will now be used as-is
  ie. v1 changes reverted.
- Bootstapped the read values for `mode` and `status` in probe, based on
  comments recieved from reviewer. 
- Callback for `get_voltage_sel()` has been modified to handle cases
  where read voltage is out-of-range defined in the regulator DT settings,
  this is needed to ensure backward compatibilty. Regulator probes may
  fail otherwise for some older targets.
- This patch is rebased & tested on:
   https://lore.kernel.org/all/176070318151.57631.15443673679580823321.b4-ty@kernel.org/
  to avoid any merge issues.
- Fixed code style issues reported by checkpatch.pl script. 
- Link to v1: https://lore.kernel.org/r/20250623-add-rpmh-read-support-v1-0-ae583d260195@oss.qualcomm.com

---
Kamal Wadhwa (3):
      regulator: rpmh-regulator: Fix PMIC5 BOB bypass mode handling
      regulator: qcom-rpmh: Add support to read regulator settings
      regulators: qcom-rpmh-regulator: Fix coding style issues

Maulik Shah (1):
      soc: qcom: rpmh: Add support to read back resource settings

 drivers/regulator/qcom-rpmh-regulator.c | 184 +++++++++++++++++++++++++++++++-
 drivers/soc/qcom/rpmh-rsc.c             |  13 ++-
 drivers/soc/qcom/rpmh.c                 |  47 +++++++-
 include/soc/qcom/rpmh.h                 |   5 +
 include/soc/qcom/tcs.h                  |   2 +
 5 files changed, 241 insertions(+), 10 deletions(-)
---
base-commit: fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70
change-id: 20250623-add-rpmh-read-support-3288f83cc20a

Best regards,
-- 
Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>


