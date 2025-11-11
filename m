Return-Path: <linux-arm-msm+bounces-81302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C13E7C4EEA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 17:03:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 96F0C4E0496
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 16:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B35369969;
	Tue, 11 Nov 2025 16:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BOVk0AgF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TGswAheL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7578E369995
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 16:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762876978; cv=none; b=uu9q0AQm+uUXVSwUhN+h5ZJntFvhLBbiP4kINq39bd5Yd0q0daiprKGAeHX99bo/fPNz28DRiekWBULF2471xq8hBf5IHqh96to1BBsmeMUVsRG6F1o23iUb9p3rSSlLK0xEC+ig25pqXHkdO95MVQdYA4u+WKFYGV8gFbIBYWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762876978; c=relaxed/simple;
	bh=Szl2H3XbsTdN5Hp3bW7dxEgQFIDzEkvs6uk8oNOn680=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UHqGwKz9tzmiNh8t1jKGB5fU+2rUly5h+UCH+Q/xz5HZQSjY7yLVERcqjrxnyX3rObeKiucGYd/6HGqfYj3tmv6Vq9i7GFLy2zwggZyvQ2a+YRaBosT7FoxqBC1x1P8Umx3ccajzalox9YULBVqRUAUYewh+LK857A9e5D0KENQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BOVk0AgF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TGswAheL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBGXn82027911
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 16:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gEfAh6rp9MQrdIl36CEViA
	ex1/8JADzaa0H1cCy8km0=; b=BOVk0AgFFoLyOKRL4VZ+PQrlRjq6nAAnI3yv/8
	IC5lriuqI076jj+oMmU6AEiDDePtgCcO9XAL6PpeGuzzpMsUraBhVODh/5R8+VP1
	WUx7hAZUIC7svqS0yBzXQcX0EPiXK7wsTeL0u7WM1Ol6CnR4sLM8+zXerKvHp7+W
	BN/nUSum+Pa7adnPguFgbAnA1oPThI2zR5WQrlb+QyrApP5U3DbOrAWfpxhy+tCH
	sjoG5QOUzfHkQjNFPieQSPXidvH/7JEfhGrLEl5IKngcVGXAwlAXYp2udepVZtrH
	R9xymnzcC4gYTC1a2JIOYKd7S4JqHl4QtzMzE55lUzXMjnuA==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abxqw1uck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 16:02:55 +0000 (GMT)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-43373c85296so28589865ab.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 08:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762876975; x=1763481775; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gEfAh6rp9MQrdIl36CEViAex1/8JADzaa0H1cCy8km0=;
        b=TGswAheLulhJSA7MqkZa90AgFtD9Plu+5sIDEclJxn1vzLPNvHmJ3LNeBDhcsaxN50
         oIlTq7CEPFb7hcGiaONSce7cvkEvDiXsT6avP1ChBVcpis0WZjQauJjTHWkj3GWS3Ozt
         Oklv/GpRhIx4GN3MnziS15y7EZ/jiy5zCKBdFcL47rCM2g+yp64acFnj4S8wDxYiki5G
         HYEooAsRtvgfVHSUt3TawSHW1gCK1mUP0/oA2R4ecvEyTf2p3iSwKg5FMF2rxZL9FO6y
         eq9CG9+Tc7OkNtPhIKg87WQ4BAAlxW2wAQ8OfxHTINE2GZDhHTw+Y4PaSRg5L5FxxANV
         BNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762876975; x=1763481775;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEfAh6rp9MQrdIl36CEViAex1/8JADzaa0H1cCy8km0=;
        b=rLV0mgaLoUSU5vAVHUoch+fZi900MiFeBnQegUaabLuzDQrboO7nfQCLK3DTJAAS0I
         csAThqeDhPAkJfD4g3W98kvezIhfNA2hlSap1UkwbHYdzCBhbkf2WKTAuxsz0o9y0FDN
         vhQQSbS/3m6qvjibJsPzS+r6BslB9vKfMXVtlJ4fPNnqsgZz3BD5B+KJujUJE0ru3AA1
         4w24QFG1Em1Q9waKcnS0ADBGd8azskH/LZvj82xyUKThgAdq2pSf5UGf9TC4ngO+wgdC
         LluU+KCQZM/KjRLuIuT2ndaXGmvdPTc0idWTTcGkFkwMwf6ta0wHScgV0KIb00Wr8Ube
         9pYA==
X-Gm-Message-State: AOJu0YyMPYKHgP5XCNUBPJRrXHCTGx84GkI4uuSxa2fpb6IcfpSVfAIR
	Q8ybOiwkN+DNf4ODNFBtu/mryG71nRO84Q/syd+5M+0DUU+LjSJ/ilGmsi7FggMh57Fd2GpX2H0
	N4L+1ZL2yDuFHEj4Hfrw2wPyhR1fxbPbuAb9nf5g+4KxMt1o5Vyso+3qnaEJ5evCAFo5ucTchzp
	l3
X-Gm-Gg: ASbGnct4caqJsm0oebKRCszYTnSJEJoPVCDb8rYyYLzvd/gQmsxu1dV56EOfaybRpPt
	u8m9ekcJ2lXtwRwqR0tZJ2E4Lx0omwzHqYAzo/tLKepFc4i20yFrpGfheczCaHg+mlZkQiCFtCL
	ZHpYS5TsZlHAQ17X1uses8Bz2ckGOaNZf/Ktcm5Q36oqRHjBnyA15tHzP8xBDoaDvGGRdmcRQCG
	rhSI6j3Y4b9nGKmA97NP52aH+6PKv0nq6E45RNHRk9zC7LkQ+2HMFds1g1JNNeKeRXap+NFNaoE
	tSHMi+tcnvGA+1cd87GQbgCDjkwUUbaFCh1NodzdECUpxVF83JwzTpWTEZ7I6/qnqpEizYtgB5C
	1wKfsiiMAIYFfuoWBgaZVaM3ZzoWtbzd5kbzmLY66xgPmPs6/jUVh7mdaCZZdpMPSs3XYB8+I5w
	uF+XCZat/rW898
X-Received: by 2002:a05:6e02:741:b0:433:2341:bc13 with SMTP id e9e14a558f8ab-43367dde525mr202694985ab.11.1762876974721;
        Tue, 11 Nov 2025 08:02:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMeGuxuvNqNErBimtBnxbPGOE63puNynCAr2CwRbSYpmZTYmk56G2PXxE/3b2KkI1j7a5EoQ==
X-Received: by 2002:a05:6e02:741:b0:433:2341:bc13 with SMTP id e9e14a558f8ab-43367dde525mr202694035ab.11.1762876973884;
        Tue, 11 Nov 2025 08:02:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a1b231fsm5149139e87.74.2025.11.11.08.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 08:02:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: add AP8096SG variant of DB820c
Date: Tue, 11 Nov 2025 18:02:50 +0200
Message-Id: <20251111-db820c-pro-v1-0-6eece16c5c23@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACpeE2kC/x2MQQqAIBAAvyJ7bkEXBOkr0cF0q72oKEQg/j1pb
 nOY6dC4CjdYVYfKjzTJaYpZFITbp4tR4nQgTdZMMB6OdMBSMzoOkTw5S5phBqXyKe8/2/YxPnk
 xIJ1cAAAA
X-Change-ID: 20251111-db820c-pro-8ecd2a28520e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1029;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Szl2H3XbsTdN5Hp3bW7dxEgQFIDzEkvs6uk8oNOn680=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpE14sngE6ezmNymcaCodRsu7ZVFgpxesv7SzLC
 yz18p4mGuOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRNeLAAKCRCLPIo+Aiko
 1cGuB/9oW3olB+FSLNMWpFbbJTIz9oIMflBJ+LnyvqHVon4BgeSy5JA5lXCeXrhN6A/DdE21g2G
 nR8C8d9euGSc7EdoW68MhyHIIYKlzDMjKCWP3Z2yn53OhG6LjShTQoZQ4rL3gecifl+7ueAXvN/
 BRQRzPEZBRmF+rfw2204hLhPDDyie3lQrFA4j6y9Nn8Beur1yq6cxUq5eW5tBTflQZPMtJNjY3y
 M2kL2glrSd/Vtb/tForC5N5WOwJeukMsaPI5DdT3Rd/dFJSg4tJU+g2Ydc9ObGZdmpKDjgdx0+6
 3zAgp4QHoutwYK8bQnV5iiTt10Y/xvKRICo76vVpWWH9MCnx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDEzMCBTYWx0ZWRfXyikvrlqr4085
 Dax+xdJOEfiK7tBXl0kskN+xDc1Ptj2EBXIr7VENnhi6qO6zmK6Qzgp5c1QOmHsLiHMkGDIBsdD
 AMHV9OIAq1N2MxUUsm8y3UWLDgNF0E8PkAng8ZTaHFQfEbk+Y1ofjQI8GGkvAKFGncpU2vE3x7h
 qhI1E0Z9ymXTEul5095rb2Y1AOXpRlH95lVgYnpocHePabP1R4ITZWheAx6YTQnP54SX1uvDWRX
 QsOsmEiGCAtdIe0HU1Vu6tucoC75sMHg45QBwONLNfLdni0h2Y/k6FOQm/chbw8Vh6zRorpJl1G
 Tezlp9aD/O9GZEs+BCaUzVo4xObspSG8TKEZA06VwXNMKMqkvlsQnDoTNyq2BiZt4NMsScVaw/+
 sdzEZtQoqpxPWjzMXPwW0I8/6LHLxw==
X-Proofpoint-GUID: op0tGO3OYs6l5ht12csFhE1Lj1euUsw6
X-Proofpoint-ORIG-GUID: op0tGO3OYs6l5ht12csFhE1Lj1euUsw6
X-Authority-Analysis: v=2.4 cv=CeIFJbrl c=1 sm=1 tr=0 ts=69135e2f cx=c_pps
 a=5fI0PjkolUL5rJELGcJ+0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Hd9naEU_5ldSTe-YsNsA:9 a=QEXdDO2ut3YA:10
 a=HaQ4K6lYObfyUnnIi04v:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511110130

While debugging a crash in the DRM CI setup I noticed that the kernel
warns about the unsupported hardware in CPU OPP tables. After a small
research I found that board indeed uses APQ8096SG rather than APQ8096.
Add DT file for these boards.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      dt-bindings: arm: qcom: add Dragonboard 820c using APQ8096SG SoC
      arm64: dts: qcom: add apq8096sg-db820c, AP8096SG variant of DB820c

 Documentation/devicetree/bindings/arm/qcom.yaml    |    7 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts        | 1126 +-------------------
 .../{apq8096-db820c.dts => apq8096-db820c.dtsi}    |    5 -
 arch/arm64/boot/dts/qcom/apq8096sg-db820c.dts      |   15 +
 5 files changed, 24 insertions(+), 1130 deletions(-)
---
base-commit: ab40c92c74c6b0c611c89516794502b3a3173966
change-id: 20251111-db820c-pro-8ecd2a28520e

Best regards,
-- 
With best wishes
Dmitry


