Return-Path: <linux-arm-msm+bounces-56005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FDAAA00EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 05:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89C74171DAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 03:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35552270546;
	Tue, 29 Apr 2025 03:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l3BwSvyD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECA9270ED2
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 03:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745898789; cv=none; b=KjSIGFsfD/xKqSsc4P/DND1RqQcL472Wd7VMqbVKYOTxQmb+UutaCbcdPioFCGJ8LtCqvFv58WTiWkGSxrfo7uc33NpFAMLGbxHQCoj9FjeaBscZGJxiYrxWqLWKz18fi1mE3B1pnxItw17QGUXzvoINwYquMU5HwD4V4J9embM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745898789; c=relaxed/simple;
	bh=jLmu/aReFVFRNgk+rmmotA/CPsvLPvnccSXqzfXjPmc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dVU6Jac7NCjXB1rMxXofJLXliFJVMdenHMrKuv500RWRajAY7LnHNPfsy+oVyGl8O1HNDE4jKZMj8WcKDbzT0hDLV7zPkyAHG1mPcvOOcEIyzRCAzUqzZa2/i08CVuNzwISpcVSQTDF2cmttgVPdydtr5iM8ZZI+I+UbYqTjm8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l3BwSvyD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqEFV000859
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 03:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WGZp/w4iywbuQDYkGDQCYO
	PCRtz2jaZPBN+f6a9kvv0=; b=l3BwSvyDX5Rnd2HfP1RTkjkD/lR5USLqDcCfeT
	N6s+tdX59fuFvvZ5NVheGbGrWGfbOmnmVwlX/hDe7U9/EGQrX8V5eoU1Z4tT8Ef+
	hzX344JLLOTKVGtWoSoGFUga0LpqjnkpjRvKcaumS2Y7zMSWBFxHib/2puLvBidP
	OkbsWBNEWh0RKizn6HwBhl6UE5rG/kRQa+ZxMmW8F2LmNVcaMusS9Y75hteeOkb2
	90UjSCb8ZMNVC9pOUrJTAzvgeNFGb37zKH+MmL8WZJ7YcLMJcsBBPDrK7OlVv4YF
	/Vr+gS6e89gqcQiAiwvj3ugfFwNLhIIyB0WSy1uFps/dVTDg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qv9k4na-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 03:53:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3032ea03448so5358020a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 20:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898784; x=1746503584;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WGZp/w4iywbuQDYkGDQCYOPCRtz2jaZPBN+f6a9kvv0=;
        b=tCCBuFgNOK0Foxg8gNndoo9BnxlioyBn1omp2cPI2M5cquZSeyN01cu0c23jzSjxDC
         vwqzxAKLhgO6lgMyxXKgEz7wXGqvYYUz+aXBFFccOJzWKOz0BlozHvz+zQcXIMm7FpcK
         SQauv9TTvGrT2q2kkR4wVw0gee2mva8ytijyEGHAx/n4xOW2vZsFseiCjZ6P/lTKU1xW
         6sVh7t/jOA5v24W/DtdnZ3KUPimOZNMqNnZj8CjAi5cio22VGi/R7Hr9Qfv3wWs1I3hA
         AKL+skD7b39WJsHim1V5V7VCe62uW+QNoA/U7KBr9rUh6UWRBYaXUcFkPAATcsjbfgKS
         J+uQ==
X-Gm-Message-State: AOJu0Yz6HudmfWD9qYZAaPGBK+i4vbMSvynq+R9DLdB6qe2KAum3UmYn
	2jE7P+yz8sMr9QAdTJ1auL5ERd2zdb401MKEysix/CuQ3BdUm4bZIMj/cHn6Krd5QUz52EqBEAc
	flFsur+EsgZzaDq6epH6LLLXzuuIAu3PIgn2wBE8qdZEe+gUs5ATKolBA7ki2r2Qq
X-Gm-Gg: ASbGncsNkL6dZZndCg/BAnSVyJ+PfWLjAK9i6HX5yF2Kr04/aBX6JcED36DU4cOfCoL
	oSeQwFNaUTmOxSfnPCliI9e8EwOsv47Ve/8tva+CO65dhmc2qRaKHrNRkC5ekz1sTvt1jw0n2xc
	lKVXNMShCXpbXT+e0JK0W03uT5Ov7xqJzNEfxIRg2O/t0Vdo0WlXJzmtDi+okSVWa8C3HME599E
	x4yI7Xjvh3BeT3f9vvkIeMzdBpEEO46Sf4Nk0UdtMtQuakhLVpDZqzBSLp16xwr8HTaGto6wxeI
	f5wLTWwfNevzXwpThcNEHxD4Ng==
X-Received: by 2002:a17:90b:2c84:b0:2ee:8e75:4aeb with SMTP id 98e67ed59e1d1-30a0132cd12mr17695693a91.17.1745898784448;
        Mon, 28 Apr 2025 20:53:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpedx2i7qLyvcXvXQEvqZiXQ0q9dUc+SDNQHlNj0NpJm/fG/f/GzdGx5tQJrOxYdd/+Bp/yw==
X-Received: by 2002:a17:90b:2c84:b0:2ee:8e75:4aeb with SMTP id 98e67ed59e1d1-30a0132cd12mr17695668a91.17.1745898783933;
        Mon, 28 Apr 2025 20:53:03 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef1246d2sm9960522a91.36.2025.04.28.20.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:53:03 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH 0/3] soc: qcom: qcom_stats: Add DDR stats
Date: Tue, 29 Apr 2025 09:22:32 +0530
Message-Id: <20250429-ddr_stats_-v1-0-4fc818aab7bb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAABNEGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyMz3ZSUovjiksSS4nhdY0tDUwPTJOOURLNEJaCGgqLUtMwKsGHRsbW
 1AI54NRFcAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745898780; l=2741;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=jLmu/aReFVFRNgk+rmmotA/CPsvLPvnccSXqzfXjPmc=;
 b=KG/DZ6oisoEAxu29fK1J4R6drif9d/3dPtncJ5qz/XWvntU9+6gvSUK6ASDqbboaQmq8r3w6/
 9CXSLh6RNLMC2snoWMZBp+Crq5d4KQdEJqouS75o/zHvkDdOIOaojv1
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=AO34vM+d c=1 sm=1 tr=0 ts=68104d21 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=LL9MhAs6j1V-iqFh5R4A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 21uUvhL3L_8E3uqYRliEYua0rtIu2CXG
X-Proofpoint-ORIG-GUID: 21uUvhL3L_8E3uqYRliEYua0rtIu2CXG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAyNyBTYWx0ZWRfX0yKNsVViMcGe zpOfiZhQocYRhw9xFX1HXtQR+nFfMcbFQPvy3S8syF/K73v+Ys729v+q3SNhKLlxXeWc4t/jU5R Uynq1SOyzL0m78YTOQyAPhSyE7wpmaRWxa2CkRfefA+N/PDnrom5gESrC1C3IPv1fIoVBFFxPfq
 DCWAfvq5mf/Ryt1GBU+8HcMZPqnaLFpu+woOAYmwPFUD6eRKRefd/2nAqj+OWj9QGAmtR6bAJSD 6F2T+MMnLf1w7pkZIsRf4OmySxFmZiLMrbCd7ltLIFLDtbQlY5QTyaxn7VtLR2ZwMvndM2IsjGI DYoGotyMwnvvscU4B4m32OVcbu0/0B4ElFOX6R+a68NAW3jaNI8iog0OXOCbqSlaW/mAOO4F/Qi
 hEeXC8fgi3wdkd/OWQLu3gq32E3iTXdBAIjHhK5pcnGPoO4wCYUDvUCdZZTekUJadzd7IxKu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 mlxlogscore=892 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290027

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
Maulik Shah (3):
      soc: qcom: qcom_stats: Add support to read DDR statistic
      soc: qcom: qcom_stats: Add QMP support for syncing ddr stats
      arm64: dts: qcom: Add QMP handle for qcom_stats

 arch/arm64/boot/dts/qcom/sm8450.dtsi |   1 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi |   1 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi |   1 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi |   1 +
 drivers/soc/qcom/qcom_stats.c        | 127 +++++++++++++++++++++++++++++++++++
 5 files changed, 131 insertions(+)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250426-ddr_stats_-391505b3da6a

Best regards,
-- 
Maulik Shah <maulik.shah@oss.qualcomm.com>


