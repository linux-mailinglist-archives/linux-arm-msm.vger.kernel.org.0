Return-Path: <linux-arm-msm+bounces-70935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFD6B37203
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 20:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 959781BA7723
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 18:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D295535208F;
	Tue, 26 Aug 2025 18:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MP3y2rpz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20AC2F290E
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756232121; cv=none; b=iNxP61Qnvkzjy5/10NWtGzDPvHFlB44kzNk6g4bhsRpbhpIVHr2gsK+SyB/1N46ppA+WGhs9mMnV8o36B8/92YPRloLFU0v1bGasBN5TOqcdnYAUgHRDOxSL8KVHuEuTX2oS1+o5dziDEV+El3QeHCUCWsvoQRvGYq+3TyVMrrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756232121; c=relaxed/simple;
	bh=CGQhTSMseq2qj3ydE5N9CekJ8RSug+pOqb24i6ooj/A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=JeBZtn7XsxyfR7N9oxY/Q+/yqSzx2jKpY1IS3BwTLNmEbVsA0mwhGpuUZopzN6DGhZo+Y7jD9biSRBToP2HSw+04tKb29KLy/LzcjZxVOK7sLN7ST+NDFknRA9+Ap6dVBomemNXsqeMPtK0O7W/KiTU4pmB/sgfMH5qfVKLGhhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MP3y2rpz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QDf25V031208
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4qKaRv93h1EZgasc06wcC5
	9SjsAa9rH7JTGFWDeitdc=; b=MP3y2rpzz4nQnlzYzLYDXwYhPV9AqXjaNpLR5J
	Ll4N29CfrTG67vIW52sDPbGip06N9MDKidsIey8Pp70+3zebokDiWsc+lkflNatk
	RISlnHMxv0kqgBeeU8+0+njysLEQPZ/QRBcrd1jgmtLEjBByvSbDk22uM2sUi2X8
	z52t/xU/aFwfPuMhn4zKYxHHfZNiLg0N+2nkGVtPGc8EUv5S1LekdwwTlhnD7c6b
	NeNgvQD4SrefmB0Hd7xOD+YcaX1/1SS7S4sryqIwSg7PsxuTGzzYr0lvRO1p50z2
	qQB1U7jLSWtjZydbdRkMFsHBaIfXwgnRuHh9OOGyGkvcZZvg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48se16ryn2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:15:17 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b474310a516so1132992a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 11:15:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756232112; x=1756836912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qKaRv93h1EZgasc06wcC59SjsAa9rH7JTGFWDeitdc=;
        b=lSTk8Tw59P+QIUBSkFZvrDi1ZAivTZIElZPhFvJNZdmnr0t4OqFfqMeaWlzUuJ3I6D
         0ctxwUpdlBWHrejHpHeFYniB0vNc0NhujMQwsTZ55WcGLtT4ReenzsmoHwNpdJvDOJei
         diZ4pqiI5mp8uUr3Z9gOka2IdrM1k6MIZJHJNXcB8J0H9GZUSBcLTphoWBtlLLGxxahM
         fwVAnpGv6uqtMC2UMuv9ECaN/uf+ytCqa2Iv96IK9mv1xw9c1wTWSMnMWF19/TJlLZsq
         LCCOQGohWLqGXUhgNf/znLlfasKjTB2OAAJv1rV1uURJA4HMMIsUAerr2V266p6Pg0un
         YU5w==
X-Gm-Message-State: AOJu0YzMzX1Ng72gUztwviugrzHb3iYoksTP7vGMMROeIAJe1tR7F96a
	HC9dEwsouV0VsPUWxPjGkyzqipi5QHyLojHgt0xbHoFc3VFLcgoI9HgAdEblxPG4YXE42ml9J2B
	0+0RuQjjZRxQIB2fiw0HszAqQSow8PIMcc6sus+bsY8GXSbAbS/vL8TdeHlLVJSqlJh5K
X-Gm-Gg: ASbGncu5DOOziM9AGOqS9i13tmZwRF5nCg45WslYXObsSO3D75n7K++I0+++C/t2Wtj
	rbG3I3d4Od8lq8yxSHkHOmiCLIFd8F8Q30+fSuYEK9T+SUdNouLGHLj7nBkoH6DA828tOZyKi6V
	QWmwR4NBM8iakY4yPgG70lFuHT/t99UbEAM3KBpD5fs0UfR4128REavPr68LDoEwYFsB0fF48ID
	ku42B1/MN/lckNNjS78CdqtUPIIPwQA7HdpxxpNSBYqHxVucl5dTfad3Gq/smj6OozkusmFWEFm
	95sy+PsJH3drNCvZN8fuBmTD3CizUhoEe+xqahtZWhfLO4S0wgeT/yOmJmmhAQa8tVOwO4U=
X-Received: by 2002:a05:6a20:3d89:b0:1ee:cb87:79f0 with SMTP id adf61e73a8af0-24340d095e7mr12851681637.4.1756232111880;
        Tue, 26 Aug 2025 11:15:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAOUipjrhtI5wo5iCy//W00zdRD0rUuIpHC7OEY+INkwu7tSLAVDPeyoPyPkBf94Oh1aR4bQ==
X-Received: by 2002:a05:6a20:3d89:b0:1ee:cb87:79f0 with SMTP id adf61e73a8af0-24340d095e7mr12851660637.4.1756232111359;
        Tue, 26 Aug 2025 11:15:11 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7703ffb47b9sm11065536b3a.3.2025.08.26.11.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 11:15:10 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Introduce support for Monaco Evaluation Kit
Date: Tue, 26 Aug 2025 23:45:04 +0530
Message-Id: <20250826181506.3698370-1-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: U9xsTmq-8ZBd5UbdB84cYyEEF6kQiUh4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDEyMCBTYWx0ZWRfXxYAPkKY3xY61
 ODxV+2suxGRP7T2SUFJxZGJ8/8aIrgqv8NX7GBr3mFtEKsuHga3yH/+w/9At+N968EmEXI94q2Z
 1whaMjXtALSoyS3zeb1BP7BB+VQFwebh9BHoQcAbHIWC51GXl5lGWMIeZl/OaspQ6iqz9nScbC6
 KCUHkQ3s8KFSg7Bq+j2Q0OJ4eUUoV1Km+Xj7wxBZdD8lkYGZwRvRMVnQ6QN2El4qM4fYYK/1esZ
 jawHqHnAMBHMkwTTwupFvt9yrX5tExBO6ALyeanxMbt4AS7OU+V+VeT54TCJnWv5ZsDkxGnGQK7
 m/rFaJ+4AH3YZrEJ8unuN2e7r+WaTxCf978y+i79WzAFGZvd+qs9lYrC74J5yQXTN9hy21Ic/mR
 86BOD4fL
X-Proofpoint-ORIG-GUID: U9xsTmq-8ZBd5UbdB84cYyEEF6kQiUh4
X-Authority-Analysis: v=2.4 cv=CNYqXQrD c=1 sm=1 tr=0 ts=68adf9b5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=OP7YlZzrarwTRlDwEmgA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260120

Add support for Qualcomm's Monaco Evaluation Kit (EVK) without
safety monitoring feature of Safety Island(SAIL) subsystem.
This board is based on Qualcomm's QCS8300 SoC.

Monaco EVK board is a single board computer (SBC) that supports various
industrial applications, including factory automation, industrial
robots, drones, edge AI boxes, machine vision, autonomous mobile
robots (AMRs), and industrial gateways.

Dependency:
  - Revert commit b5323835f050 ("OPP: Reorganize _opp_table_find_key()") to
    avoid regression introduced in linux-next (20250825).
  - The ethernet PHY QCA8081 depends on CONFIG_QCA808X_PHY, without
    which ethernet will not work.
---
Changelog:

v3:
  - Include changelog in proper format and make it more verbose [Krzysztof].
  - Fix subject line of dt-bindings change [Krzysztof].
  - Move the H/W peripheral information added in cover letter to commit text
    of Board DT change [Krzysztof].
  - Include 'qcs8300-pmics.dtsi' in the Board DT [Dmitry].
  - Enable below peripherals as suggested by Dmitry and Konrad to include more
    peripherals in this series itself :
      - GPI (Generic Peripheral Interface) DMA controllers and QUPv3 controllers
        for peripheral communication.
      - I2C based devices like GPIO I/O expander and EEPROM.
      - USB1 controller in device mode.
      - Re-enable Remoteproc subsystems ADSP, CDSP & GPDSP as fix [3] is
        merged.
      - Qca8081 2.5G Ethernet PHY.
      - Iris video decoder.
  - Update the Board DT change commit text to reflect the above
    newly added peripherals changes.
  - v2-link: [2]

v2:
  - Address Bjorn's comment to rename the board filename and
    compatible to monaco-evk.
  - Include the bindings for monaco-evk with the existing qcs8300-soc
    itself instead of adding a new SoC binding.
  - Drop remoteproc support as qcom remoteproc driver is currently
    broken in upstream [3]
  - v1-link: [1]

[1] https://lore.kernel.org/all/20250623130420.3981916-1-umang.chheda@oss.qualcomm.com/
[2] https://lore.kernel.org/all/b376d130-2816-42b1-a8c1-1962ee0c2cd7@oss.qualcomm.com/
[3] https://lore.kernel.org/all/20250804-mdtloader-changes-v1-3-5e74629a2241@oss.qualcomm.com/

---
Umang Chheda (2):
  dt-bindings: arm: qcom: Add Monaco EVK support
  arm64: dts: qcom: Add Monaco EVK initial board support

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/monaco-evk.dts       | 490 ++++++++++++++++++
 2 files changed, 491 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk.dts

--
2.34.1


