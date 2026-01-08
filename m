Return-Path: <linux-arm-msm+bounces-88123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C21D04BB5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 18:09:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0A1B9301D157
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 17:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FDDE28C87C;
	Thu,  8 Jan 2026 17:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XSzYZIxz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BBNceNAx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C1B28C869
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 17:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767891962; cv=none; b=R33S7EQc6vU/YvaEr7JJx26+OGte/jIsXHUWm3T2A7gV4AfNCV8cUt2CCBWHtzCkBRpWEiKNVUtFqE6j8dYSz9WzppPPoOdHsPfBrDdqCAMbYrcZlXHCkER/sYGDI5Fit0xWlTeE7dsk4f54SufN/HbU5BRokIBgbP9CTHV8Gac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767891962; c=relaxed/simple;
	bh=ya6FNJc56bezIpiEzC8SzhEZ5ozdDIxIqC2RODiXuwc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AaUEzFQACz4qEMKa/1aC9rdasIgA6eCvzNeHs8X2b8b+Sr42rxnHAf8oSjGIlEf/8/9ZG/ZBV3t0uZKvGYih0ZpDYmy0s2Cm72XY3r20/PJIj2ox9hVIfeGliOKM9KdRxBBfv4xTDSXEbuuGgsb7YphW95w/PrdYcDhvN1BlKEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XSzYZIxz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BBNceNAx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608Ai33B3701154
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 17:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bNdrUBPzOWJfDd8RnafUYcDc3JUosbBw7eX
	THZ54Zq0=; b=XSzYZIxzeu5Noj0mMbGMKZqupZzAIF25zURXXmDKPCtm0yM94yI
	fSt5Xx912ZgEfCdmwii4tR5QWM+Cunz/GiWUNbO/Lm0MzkA/baUus3ORGPlfPCFO
	rqgdgPo8DVy1aUeHuuOErXJohMy/cJXedaetPhggDUsYStft27PvW7QpaqqW2cVc
	NsNRHS2tUsmGhMcnm9hSxoP0CTznkhCWq+uv0QY8Btu6AxBB8JpdwOcVv3WTr5uy
	GTnAlkWrOcxbBJ0/IKxYlEp0K5F6kzuOpLbnFXRrWLq+buo3e7saGJTg5yLpTpIL
	+9AfeaDJOad2RxruUHsoWzvCiJlZ2kjKa4g==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjb39s67g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 17:05:59 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-55d05bf6490so2811829e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 09:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767891957; x=1768496757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bNdrUBPzOWJfDd8RnafUYcDc3JUosbBw7eXTHZ54Zq0=;
        b=BBNceNAxbXzDfOaAjeiHN5KV9wPtoJrDYdUs7iRX3MSW30H96zEo0MVJ+QFYAbe6sX
         uq9XrPDc6vKybEwE5h7Opk9THXep9Pk18Lh/p0sTrjdnkPlGihdF0AXrq8nLTLc6BDfs
         Q/Jo987liWB9eCOlSTYIyBpbMhwvofvrCEghKypZVQcukwZrOEY9G6aIV9eU65cffX5D
         ViF1fb4JqmuQlgInBBEf0perHHtY3mDUTXKTv4umD+YfniEPcLSvch4Wht2GriYqSo8o
         +1vrLAd+sIv29W7nwrf9X9Lpuh+yDX8uoKe5X5AhcFff+iUwDQaUPmX2tePTcQSGRp7r
         6h0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767891957; x=1768496757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNdrUBPzOWJfDd8RnafUYcDc3JUosbBw7eXTHZ54Zq0=;
        b=K1/8s4huMcMCfb9q/HDc59ZT4LLqrEpBncb7iZXaYtYcNIpTr2Ylh8OGgNua4bMJBT
         4qRWCkXTXo/I+uquvfFhNrM6C8VYEEddU0eeQtzOE4QwVUreR2dskXZjQMTbiXwNxSqx
         TLqqFJ+Rcw+oFd2fL6QENyqd9vZ/setd6pHxgA7yUYR8qRAonWI7KglLrACbPGKdxIkg
         FTIG5IQXXTIQdeHgQl6si3r7vT64EvXfIZQrzFUPeu+RLyqcFlDcOMURDEJDCbJpsdZy
         4CE0NtPLueyHRXs52hQ2SO/tUERu5+8Uy9KGDdUS/Q5odnKipGTJ6LPLdKu7oIVf79J6
         H0Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ/IEIQNh5gZkqtMqZn6pfuDauxhtHG6SqQLtTcvlvq4z0GgW3GPCmVLqZ1bLzrgIZf/a67kFbHGLtIKa7@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt+qV8cgzabM3DnsPQkyTXPCrhUCeCI7YSijL8g8fC1zT0XQYk
	AWlKgbmAuRbM46D8JcqNFMaqVrKX89QWRj7qRf0KvGjUH4lGAR7M2wF/T99gt1I46MA1YLsJbG+
	lr0Q00OFZUfxQHgl49mlmO5HzyfEd9hNJJ/iEigt3XWujMwRgjX8bCgHD+ZNiSI6TeUarQEBqwQ
	Tk
X-Gm-Gg: AY/fxX6dWkLTkO24eDGPxMR/Ehm9wFSOZOefuqGdEK7qdLZiiK9eZetVQkN25QdkUVQ
	3w0eIaWfZhDpNkzHsN8MHN8E8RXTDhlJwMWg4mItjU0c9tu/yGB+1zsa1uc4xzx0q4u1XSzw+hx
	oxOcC7RjKlOmtuEaEJIizyfCFgX93X0P61960T8Gnd9xpA61oHEMDqRkMJ+tt+cw2f9ob6QPdOf
	HOUGGiVugn9PMR6r/fffBjHCWyDRG287EAxleXlU3vQ5IzV/4990KrMyw8tb4QbMvSLbzj6t8m9
	jp0uaOY7B5zYIPPLSVYKRykdEkLYavW6AxpAijH0Zf1xGjx1pQwXpisFIRWI4BE+r5CsdovIjRF
	D46Xn4cnq/1psWPwMZKuoNjPSXelbErRHkH36cmFfr42LcLcpcAY5A1mTg0IAYxCrJnAtN7ogIP
	gn
X-Received: by 2002:a05:6122:31a5:b0:557:2551:7e9f with SMTP id 71dfb90a1353d-56347fc8cbcmr2111382e0c.14.1767891955870;
        Thu, 08 Jan 2026 09:05:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7hLUzBxDZnma0HzfbOKgZSeKauV1CDq2LnADRaAs9bQCNyYBBa5pKpGui9SDrcFTvVaZROg==
X-Received: by 2002:a05:6122:31a5:b0:557:2551:7e9f with SMTP id 71dfb90a1353d-56347fc8cbcmr2111208e0c.14.1767891953964;
        Thu, 08 Jan 2026 09:05:53 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:211d:6051:c853:ae97])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a2cffb3sm856373466b.31.2026.01.08.09.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 09:05:53 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mchehab@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v4 0/3] Add QRB2210 RB1 vision mezzanine/kit support
Date: Thu,  8 Jan 2026 18:05:47 +0100
Message-Id: <20260108170550.359968-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 12uKQMpX7YBM5mCBl557ZWrVN89ypPNJ
X-Authority-Analysis: v=2.4 cv=X7Jf6WTe c=1 sm=1 tr=0 ts=695fe3f7 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gu6fZOg2AAAA:8
 a=hhlFAB9X3wEbsQVaBmMA:9 a=vmgOmaN-Xu0dpDh8OwbV:22 a=2RSlZUUhi9gRBrsHwhhZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDEyNiBTYWx0ZWRfXwRgiMu8fAvvr
 QOESu8bLoaaWnDdmhZRyX/aeOp5xvShn6JUmsYigFuHjA9RfvmFHBBkonu8hClKLnXD8wDdy6xq
 cfErTCr4/I/GI2QqQKrHNXZpwbcg8816Ywhs5xuX/N4F/exab9d1G6RirWHMfif3/D/5e2HvLj3
 rfXtoddmTRL3fOzoiU1YcOz+L372g2YBZKnqGjtN2wCidZMi3ZWTgv7GvwxW9VeQY8+xXWollWz
 3k9lQfCPME0hajwl4fo/x/2WmLDW/L/4vHzbU1A2eiZAbj3BljGpNxyBgzbwc8U4qwimndwmygO
 teRGyFSAtE0ZeFJMmYYp6HzvnFt2pg4rZgru8kkccRXydhbI2r13jSK448MxBGT9C68NhTvnnS0
 cGUGoUd3TThtEXHZ74eOX8vcRYobbmVVZ3xyA2FRHq8Yy7dc+VNounFDx8GF8D5Blamgsnj9+Vo
 GRiBMR4qsjm1dI8Npiw==
X-Proofpoint-ORIG-GUID: 12uKQMpX7YBM5mCBl557ZWrVN89ypPNJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080126

This series enables initial camera functionality on QRB2210 RB1 with
Vision Mezzanine.It includes device tree updates for camera-related
components and a fix for the OV9282 sensor driver.

- Adds pinctrl configuration for the four camera master clocks (mclks).
- Adds the PM8008 camera PMIC node, which camera power management.
- Introduces an overlay enabling the Vision Mezzanine board with OV9282
  camera sensor support.

Changes in V4:
* Revert to using active-high polarity for reset, as discussed here:
https://marc.info/?l=devicetree&m=176711209404226
* Drop Konrad's review tag from patch 0003, as the reset polarity
was initially a concern.
* I did not reorder the mclk pinctrl entries by GPIO index because
other nodes do not follow this convention, making it difficult to
align without updating all nodes.

Changes in V3:
* Move mclk pinctrls to soc dtsi
* Ensure backward compatibility for ov9282 reset logic
* dts cleanup

Changes in V2:
* Use correct polarity for ov9282 pin
* Fix ov9282 reset pin logic
* Remove always-on from pm8008 regulators

Loic Poulain (3):
  arm64: dts: qcom: qcm2290: Add pin configuration for mclks
  arm64: dts: qcom: qrb2210-rb1: Add PM8008 node
  arm64: dts: qcom: qrb2210-rb1: Add overlay for vision mezzanine

 arch/arm64/boot/dts/qcom/Makefile             |  5 ++
 arch/arm64/boot/dts/qcom/agatti.dtsi          | 28 +++++++
 .../qcom/qrb2210-rb1-vision-mezzanine.dtso    | 66 ++++++++++++++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts      | 75 +++++++++++++++++++
 4 files changed, 174 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso

-- 
2.34.1


