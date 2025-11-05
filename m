Return-Path: <linux-arm-msm+bounces-80420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94896C34CA5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 10:23:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE7D3463704
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 09:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC4D2FE585;
	Wed,  5 Nov 2025 09:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l6S85Saq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UFT6inZa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988E22FBE0E
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 09:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762334196; cv=none; b=MtYjhVEhECQLXNU9tJvmh2gUVi4MdIDcfTGBQ8A+ksQ8CLADDHXsraUyCyilkjCjkB5tqvByX/bsGLbXQ3u8agzaw7P7bidpTR79wIzfRkjJ8G8iAbGejfg3DxHt6YWMQ8tBW8EOCGyyfKHYNHsXHfeM2xCiXYtFDHRT6wdvSIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762334196; c=relaxed/simple;
	bh=G5qLkPbiy5mAe0CS1JhXvG0iaH8m8lqZJ9LVnFx7vuQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LPxKu5X0oeAWaf5MqjOZh4tvdGEMPTRFgBvxsATu1Qqp5hhxTp0WEzr08H46TJUAvQIPZ4X9xb172g3ajhlVnUClS0PxF/ErSF+YEAlMXneNosQrgfmqXN3qqcAt34tQnkP60gdAKU7TQS3FC0bMOzgL//iX48viFPmOJIVkZmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l6S85Saq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UFT6inZa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A580WEm3089263
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 09:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sFARRt9q9VyojgpMQL1RCl
	I6kbqGYcPQtji5bXwNoNM=; b=l6S85SaqYiZwBhH8cAVJCI+RuVdBw65528FU39
	tKh+ghK5bEuPts43nPW9p/x/1XY0cOVXWcBOoMdDAoM/iySUq0v/Igi+hYVhNyE1
	P90D9t150gMf3/EfV9d3A8TAODZFvrIvRz3iuIFfBx+sae/JHoOJMT54emj99ZlZ
	0xId0eLSlm3WlXNTMaqlbabyo2LiSBGV01UIdoBLSI3Ab9pf1Wdab2o//3YhuXGz
	wStqrv2ZzH+ZUhu01REZ0Mtj9viAdof2Dp/M0wdJa8phCwz/jtpm9qb/E2X+Ofzm
	ZdIeOZTAwbA6zRG8OwzyFkQtmPR5WOL2gov/v0Vguh8dCWjg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7s5e9te1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 09:16:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3407734d98bso6894766a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 01:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762334192; x=1762938992; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sFARRt9q9VyojgpMQL1RClI6kbqGYcPQtji5bXwNoNM=;
        b=UFT6inZa+BKOJzHe3lPjtshn7yZp8BwhYeBacxzZKWE9vs/ZinVEyWITMpYiBWD7eK
         hnoTEGW+zUAthRDjIoXOpspOCliJq+/cC0vKSRz33/SxhjZdbGhrsrNKxUxn0yjbAzSY
         v/LJQ611+FecIakwba5BD+nTisMrX2xemwXsMtKSN2ZZtH2XbwrRTOw2ng8tt8MVszlf
         s4E892PduQ6fm52VnGnYjg/lbvTQMT+YHOoYSrkw2oaF/U5u90JMpyJ6ApxA4MKj+P7+
         EbqV4ZgmLCOOLS8V8rG74A15czbaQfIvw3nREq5tpdP7xspmlqgGLx6BW1hTUC1+dghL
         VCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762334192; x=1762938992;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFARRt9q9VyojgpMQL1RClI6kbqGYcPQtji5bXwNoNM=;
        b=K8gCEvv5hzDsdl4bHQkjgbq8IwBiNrmpovqjHHT1s386Kb5pxPqftU2bMPaaxZsiCb
         7K6NPlZ3tircGmoxEwBb2N8Vv4Feyat+amnVlEYaLR+mLTjkQSVX9P5knW/3cbqp31WZ
         aeDntkA1vypmTKcqsWj/jFeh2hAYo6c/o9QpXaZ9n8uRMzUBll9kjbzyIGdynEV2jjE+
         p7LMhxhtTSCUPMnpqga/UbJm4y8RE+5jmn1YjIodPEMWL+T96xG2ldnqK6GNCnsqOR6O
         MtrTt1fWsiy1GT6MDkqErJ7t3ijlSjhnt5SeL3AQaeKUU0apLUMJagmI1dC9BkPfeTPK
         1hUg==
X-Forwarded-Encrypted: i=1; AJvYcCX6CA932iiXAgrCpDaToJjNi33YVfN/0qkSo24cyb1Xnvb06T1s+Nm/Ah42/Iz6xEGrdY+THN2SLYv4+KX8@vger.kernel.org
X-Gm-Message-State: AOJu0YzXwVBFAaOdUxctKiEVU4rMMZgWZdCFKnm4AVht3qgy8Mekyaro
	iPrKAgWUyD1833IICy2Im5Cq0hf/BhczwYoy/F6cKq8dY2iMPJ9yiZPdtJo/m9La5AuD7OwQhzR
	cGYj2y/rJ7vPofsBXN5siQBgFl7lqH5PlBMR3Z/jKt+hEU0NK1fqkF8foTgn9XGRgoLNC
X-Gm-Gg: ASbGnctgX5/H+22Q05li1BcHb0wSlGyW0uIUTdzD/o7wsQZ/ION3CrMemiRNk16nhR3
	yUKdGfRaNZxDaGO3rPE9/RBGLaLcz92JyopDSPRryAmvJMTWSpxiVbInHt05VI+6r1KI/w6J6z5
	5YimNqSqsOUb6AA9qi3eZu2cIsrggkId26bSuUZQU+7OWk7tlzuxT5lyHl25zGsH26ffsiKzX1Q
	MHkz9Suo9Z6dUx2gcaMDczpmZxtMEh4XGxlndP4BB+X2dLdNq+f6XtOGw642qBR7Ah/vndeIa05
	uWR0ujYVo3rW9KVKWOanX14tojwEywppgwlRPOPXm29crY+d0t01KxlzaOJk7BrF8TMqVoCpFx7
	LYhftVxiuYAkKbUBxL/XFdjn14vvP
X-Received: by 2002:a17:90b:1f88:b0:340:c060:4d44 with SMTP id 98e67ed59e1d1-341a6c4d7aamr2891968a91.14.1762334192441;
        Wed, 05 Nov 2025 01:16:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFxgs1fikzPsn/Uzt2XJnjpiZb5nexbrA/xinXkHzp1PjfMUCh8IEA/nDWZDho9364Lklw3w==
X-Received: by 2002:a17:90b:1f88:b0:340:c060:4d44 with SMTP id 98e67ed59e1d1-341a6c4d7aamr2891925a91.14.1762334191932;
        Wed, 05 Nov 2025 01:16:31 -0800 (PST)
Received: from [192.168.1.102] ([120.60.68.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3417a385563sm2274249a91.0.2025.11.05.01.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 01:16:31 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH 0/4] PCI: Add initial support for handling PCIe M.2
 connectors in devicetree
Date: Wed, 05 Nov 2025 14:45:48 +0530
Message-Id: <20251105-pci-m2-v1-0-84b5f1f1e5e8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMQVC2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQwNj3YLkTN1cI11zM2NjM2PDJLO0xEQloOKCotS0zAqwQdGxtbUALbp
 yFlgAAAA=
X-Change-ID: 20251103-pci-m2-7633631b6faa
To: Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3343;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=G5qLkPbiy5mAe0CS1JhXvG0iaH8m8lqZJ9LVnFx7vuQ=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpCxXoDdyGhLtN9uKCzqzSqHPnH2YoTYU4IrxY1
 Ve++Gmb5UOJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaQsV6AAKCRBVnxHm/pHO
 9beJB/oCjStqQkgyMExHRzWblMIVQmQUCcrOHhmFhFh4gQMU6s70nszG6SRwPwawERB6MI5FcKL
 uUrIOacvZHgjirXX3mItamztaSmiC+qKWmrm0w5ReBlXTpA0H7Nub38DEI6L5hUeNKlN+5SLO+7
 dpPd9E2Rq1V399rHZZJcyqn3qqtQUbMd/nk1uPzKRpQGL0h01ateAHj6q1dirRL8kXY1d7b/pqX
 Ib3piaYcYQBeU7QgIK8YIRMcdrwzpYaLyjx/1jkXGdHdInFEMAP98dXcSWOhpyt9kS1U8pdpPuw
 GywqFZWfsxLaJrdpEqGXHJQy6ttj95C973WGiVUDVoWuPNyB
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Proofpoint-GUID: ValfpZyGxqoz3CLJumheNegP-aY7rBPb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA2OCBTYWx0ZWRfXx2SqX45W8WIl
 +5lPYD42u+/UPo51LrwJSUgopuVm7UWcC6jvm/p+oD+gmMToeS+ZXvlaSj1ssrZUmpxxbmhvX7w
 2uY336cHtYRFEXHXVDrwum88vyrPr358mNdyPRnYBM0YIcCd+OjLIUo9IVqbPRID394P1taGUS8
 L8CpCFY0HAgRvZRGSxFKftFBSa9TmugScpEB+gNpA26zAWEVroWVJ9UsWXItDWi2Ypu5DB//vGF
 E7bKibQ9n/aVJ4A/wLuUzBtRSee3OhXj8MIBjA/Px4SUUyCR6dP6CU4vbDO7NeewXHDf7xAYIc+
 S6Yyrzqxpy8ygD2A8a+34Li579kW4FSiYTndOJiHZCWTNzqVaOoEVoIvSWMn/JUPLPaG/L5fKh8
 T+iXYjwMMGx2QuucHBxL+HzTz3WDMQ==
X-Authority-Analysis: v=2.4 cv=OayVzxTY c=1 sm=1 tr=0 ts=690b15f1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=adoi+G5QptZiRYWGMQz2cA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=YBl5744q8zTd1FMgO4cA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: ValfpZyGxqoz3CLJumheNegP-aY7rBPb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050068

Hi,

This series is an initial attempt to support the PCIe M.2 connectors in the
kernel and devicetree binding. The PCIe M.2 connectors as defined in the PCI
Express M.2 Specification are widely used in Notebooks/Tablet form factors (even
in PCs). On the ACPI platforms, power to these connectors are mostly handled by
the firmware/BIOS and the kernel never bothered to directly power manage them as
like other PCIe connectors. But on the devicetree platforms, the kernel needs to
power manage these connectors with the help of the devicetree description. But
so far, there is no proper representation of the M.2 connectors in devicetree
binding. This forced the developers to fake the M.2 connectors as PMU nodes [1]
and fixed regulators in devicetree.

So to properly support the M.2 connectors in devicetree platforms, this series
introduces the devicetree binding for Mechanical Key M connector as an example
and also the corresponding pwrseq driver and PCI changes in kernel to driver the
connector.

The Mechanical Key M connector is used to connect SSDs to the host machine over
PCIe/SATA interfaces. Due to the hardware constraints, this series only adds
support for driving the PCIe interface of the connector in the kernel.

Also, the optional interfaces supported by the Key M connectors are not
supported in the driver and left for the future enhancements.

Future work
===========

I'm planning to submit the follow-up series to add support for the Mechanical
Key A connector for connecting the WiFI/BT cards, once some initial review
happens on this series.

Testing
=======

This series, together with the devicetree changes [2] [3] were tested on the
Qualcomm X1e based Lenovo Thinkpad T14s Laptop which has the NVMe SSD connected
over PCIe.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts?h=v6.18-rc4&id=d09ab685a8f51ba412d37305ea62628a01cbea57
[2] https://github.com/Mani-Sadhasivam/linux/commit/8f1d17c01a0d607a36e19c6d9f7fc877226ba315
[3] https://github.com/Mani-Sadhasivam/linux/commit/0b1f14a18db2a04046ad6af40e94984166c78fbc

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
Manivannan Sadhasivam (4):
      dt-bindings: connector: Add PCIe M.2 Mechanical Key M connector
      PCI/pwrctrl: Add support for handling PCIe M.2 connectors
      PCI/pwrctrl: Create pwrctrl device if the graph port is found
      power: sequencing: Add the Power Sequencing driver for the PCIe M.2 connectors

 .../bindings/connector/pcie-m2-m-connector.yaml    | 121 ++++++++++++++++++
 MAINTAINERS                                        |   7 ++
 drivers/pci/probe.c                                |   3 +-
 drivers/pci/pwrctrl/Kconfig                        |   1 +
 drivers/pci/pwrctrl/slot.c                         |  35 +++++-
 drivers/power/sequencing/Kconfig                   |   8 ++
 drivers/power/sequencing/Makefile                  |   1 +
 drivers/power/sequencing/pwrseq-pcie-m2.c          | 138 +++++++++++++++++++++
 8 files changed, 308 insertions(+), 6 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251103-pci-m2-7633631b6faa

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>


