Return-Path: <linux-arm-msm+bounces-87084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1972CEBC3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 11:19:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F1D7302C204
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 10:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB483164B0;
	Wed, 31 Dec 2025 10:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KFZfLz8v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tf8RObme"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B942DF12E
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 10:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767176334; cv=none; b=OdI7b/OejahVZI520y+TR1S8O9OjItDt0Cz01W6LH0L9a7N2RPNzShvVdS38Ltj5+3VuHL2jQEJYp/iYgKVBJpk3Vug8wHeRkjGOj+WFJCfXp7QLxlZnaPfFgesxNjYiNSFXZiSHN/BDI8YDd2rv0BuEqxMiMwIYN4MwEW28hpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767176334; c=relaxed/simple;
	bh=uHqpWfMUassAKQ4SMt5D/UNdjL8rBwQstHNH84aeduM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kes6yv/19vGqDsHA9iC8RtQMy92vacHQqb859ig6AQGo2DAJJ4QFIMbgfMk9iOv3PssxB6ZCIR+WirxLtvUmgcr97l2+1WxPz/QqghiTJKn+y0jM1VB4ZqheJ/BqOoFjYmIpwmRi9NF4TjtTHqU27q7qNaBEyI6hwhdyJjJtCek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KFZfLz8v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tf8RObme; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV78S342733277
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 10:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WTAL2+B7vnxZ5DJ0aOuodm
	9D5RHgoHi/W83BJWwMQZE=; b=KFZfLz8vJwfUTO0FzSobFYk1Q/dgusvW9vt7ti
	ki6bvqCWhS2ZhVozkNGO9+iD5spMpyurlospBEhsH5XwKO23jCUTSNjVNUhzVwJg
	tPxg4zpPMgL+ogQdoOpHQuR2t6WmeUeoznj7tc9MQxUgnPh77klZisfil/FSYqCR
	lWAOOf5DYvHwkMUAyYvDFJ1OXWydTm25Qx1VX3TuOhvGZ3Bw15KPoGEvn8w5dOgA
	Vywnz05vI9Xy2lROVHHPUWzfxGvOLJJwewF8FmyazSbPDGEDqIZzzTcEaaF6lvco
	p9d7El5NfDWAXwZ80b2sdmrQBuBrwB3IRN9CbBURY+Tte5PA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcy6agauw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 10:18:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34e5a9f0d6aso10312865a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 02:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767176330; x=1767781130; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WTAL2+B7vnxZ5DJ0aOuodm9D5RHgoHi/W83BJWwMQZE=;
        b=Tf8RObmeLLHpUeqTkCc4I79cIg3l5swD0Waw1GCprwpQ00htvAi509+wL0vk7MBY+M
         dS+n4iwhTTqlg6R8VybRwKL2yBXK/8i+Pe3IDB8+6ZILmS6Wlg8t37MNHzdLygiuh9Di
         Qz0e/EB1scaZI3yP1IeTPhzqj3L71oQgHGFjO6jVlENrMaF5mA/1Jv3oXF86AfSW1zCK
         RaMxA1IZXy7ygRhLuzGOefkouVy8bbEeAs0IHy0Dhas5kVIAiWVQKbRatEeBbbM6XYWx
         RqDWdoZKgCEuOZdLCfydL4Gs4XwcyfyFcdL0X5LUti30csaeQ56CRP71cjW4j7QDAeP6
         APOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767176330; x=1767781130;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTAL2+B7vnxZ5DJ0aOuodm9D5RHgoHi/W83BJWwMQZE=;
        b=o/lsPJrjf5OGeSgEzokPhQpCa/K7mPhCebtjVeqWoIHe5gP45xAt/KRAxzEzWm9pDj
         o+gHb9f/II6tCx0puFqlbfvJ4XN896m/3rf2UAT7VXJeV82jFPfiVC0q+ioQfO7YZVvi
         gqD3yXZprUNC63xigDi2dlz+19b93BGc8boVo9C5/2ntGc31To0t2n3GZBhLihBTUeSq
         jwiodhoRaCosQ/z93eE2m6DdgoFG+yLNbZ6VYcr1/py0dj6qcFbaaASor9nno8y+lb8/
         GWe+YfYDLwH/wvg1qob2CYETlHeRggycsyOCY+To6ldxp4XTPXqjPOXrs2U/v0YfF/Aj
         7Dyw==
X-Gm-Message-State: AOJu0YwvvXXDMET8dr4NBXCjz2cE3vyQmgt9FiLwc6c4qjJZXUuiZ8CC
	DX4CkdVjy2EECIpe1RVdajlExHO/2yo0IepWepStcyt2yT3jNF1MQiXpKZ2V5lQTBapFq2pQMNS
	hSolZi4RQraLt54FKUIP6hfaP08fzTb3eQmf4s0I1ljcSKLkINbvBQsiLBmi8rXSFDnZ+
X-Gm-Gg: AY/fxX7Yn/y9ZTBxrpxBjC8c62wnE4sHLbjTekkUlKjQIGo8G3J8w7Ll6e6AX55LGke
	bPbiTatW1tD6b7JtFddq/2pbfqy9gyEkR0cy/dD0o5g2vI2+SAV4fWQwYBRaeKWGE7BNNXa3MoX
	LnOeQcMZCUvWmwkHgPoTAiZrEdUa+uvVXwOnKSy20m9cpa6zfmWtzJcUwYllXNx/jzixDbd7IAw
	DphJ4/0sTsKCfaJMO9Q8tePviSQ6Thr/5/MBRhEX/ZQqtCi/eBKaNy3PzjJS8G9VPKxCffPuwfw
	ls9+Sd3FkumzOgckN36cHlk+UFE4KA7tusYXG+O9IyyA02GXFVfKa/7CJn3C27VwWMaRNA2pRLK
	BxuqHOgAdJ4bPBQob3v/7TWjU03Xmij+/tKKuoA==
X-Received: by 2002:a17:90b:5843:b0:34c:718c:5448 with SMTP id 98e67ed59e1d1-34e71d69512mr36296870a91.4.1767176330516;
        Wed, 31 Dec 2025 02:18:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnyQKUIYDodyMSw+zvvtnoePgc0eXwRenu2yTRPqaVOunNtaPMplYEB+vk6MJTodBzeLK9/Q==
X-Received: by 2002:a17:90b:5843:b0:34c:718c:5448 with SMTP id 98e67ed59e1d1-34e71d69512mr36296853a91.4.1767176330026;
        Wed, 31 Dec 2025 02:18:50 -0800 (PST)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bd61b4csm30085504a12.18.2025.12.31.02.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 02:18:49 -0800 (PST)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH 0/2] purwa: Drop the Hamoa PDC workaround from purwa
Date: Wed, 31 Dec 2025 15:48:44 +0530
Message-Id: <20251231-purwa_pdc-v1-0-2b4979dd88ad@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIT4VGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIyMz3YLSovLE+IKUZF0Li6Tk5GRzE8s0YwMloPqCotS0zAqwWdGxtbU
 AlqVZVVsAAAA=
X-Change-ID: 20251226-purwa_pdc-88bccc749f30
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767176326; l=1012;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=uHqpWfMUassAKQ4SMt5D/UNdjL8rBwQstHNH84aeduM=;
 b=tlI12TTQ9o5MIR8kiZ8iQOtH9G5GNOVlk2jZkmoUBBLisizQhF+d+FpvZa55Ubkujd6nHod2O
 urnHwQW+asCCshkDKKg+g6jYxoLlcTl7zOBoyLTa6CSzlAR7XeUM2bS
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: fWL_BVMIhfp-OwB-9RDEGhLOOCz6kYcd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA5MCBTYWx0ZWRfX4zfTpk4wN6X+
 Vy2FqncxLmSgAuDjKufdT5XNUuBE37fRWRNvy6MgLME0ACRJOTh/YboZxUv4e8Fblh+Rn94+At8
 0JpqLqbeIbi8JXbsDRxr06iaWK++IJEd0tYz+2m1BMzRe3TwhuOywyD3VgmVGrCld6Ei1KSYtTg
 Kpx2Kl6AoFoq/Ig9SB719T1JAEBm8o8Qp1EI4YkgMsqJ+PoqwInbZnrg91ZfTUvZ+XfKcVkzac0
 DOp5wOKC+Mx4/i5fIVeCnbfX2OKvdK9G8w5L3xJ3868OZrLVuPIwtMLEe79o3d4S8ZWjJkqXWJL
 F7YKcW1HCcRj1xRIp6oIs6qacEGoiHEcDP7ume3HpFKvhE6U1LK4jUjKVy2sZE7BJ2X2zenYmzq
 ST46lUB8CzuvM9dD+6T6UTLo8xEvpupEeumGOkk02eH/F4niyGFzg6B9USefVu8jRhugoqGquMh
 Z0KvCFZI/ECQen+d8Nw==
X-Proofpoint-GUID: fWL_BVMIhfp-OwB-9RDEGhLOOCz6kYcd
X-Authority-Analysis: v=2.4 cv=J9GnLQnS c=1 sm=1 tr=0 ts=6954f88b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=nKW1HCHJtd4qQL7UAagA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310090

Purwa shares the Hamoa PDC compatible. Hamoa had the software workaround
added due to hardware register bug mentioned in commit [1] which used
Hamoa/X1E80100 compatible to apply the workaround.

As the hardware bug mentioned in [1] is fixed on purwa silicon add purwa
compatible to avoid applying workaround meant for hamoa.

[1] https://lore.kernel.org/all/20250218-x1e80100-pdc-hw-wa-v2-1-29be4c98e355@linaro.org/

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
Maulik Shah (2):
      dt-bindings: interrupt-controller: qcom,pdc: Document x1p42100 PDC
      arm64: dts: qcom: purwa: Drop the Hamoa workaround for PDC

 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 arch/arm64/boot/dts/qcom/purwa.dtsi                                  | 4 ++++
 2 files changed, 5 insertions(+)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251226-purwa_pdc-88bccc749f30

Best regards,
-- 
Maulik Shah <maulik.shah@oss.qualcomm.com>


