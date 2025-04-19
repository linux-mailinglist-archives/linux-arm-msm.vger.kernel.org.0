Return-Path: <linux-arm-msm+bounces-54786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D23CA941CB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 07:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 942893BD45D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 05:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA8131465B4;
	Sat, 19 Apr 2025 05:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jc4+sYcM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268A2823DE
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Apr 2025 05:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745041407; cv=none; b=rYrEe4RRr4O9GVBBOLVsv7YYUhQeL6T3P+qvGhAVyL7OU3k7HKUX4XRyaZPWH8zVw2cM0dgH/ADNHPzPnCcDtmB57TU3hqd1uEUiSbSBE5vaCraWGShHjjiwBxMKVcD+uCUwaR84CTu2mZQ7fs2+gip5tLT5sSXIYOulZ76w4Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745041407; c=relaxed/simple;
	bh=2POJjFRmmzjMYgY8hhtxuwW1PCP805TvsmSsbRyGfj0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ciSIgEAV1UrPZ7j+R67uusWeTK6szdI0JF8D0MhkH9wUN/CL7xUTkLoK03C5eUBOtJq7anDI2jebczYeXWB40nGtj2HMO4H8fOQ7oPE6cAwbT9y4m7gEdSGYnQeuDtiqjzxJT0ir4JMISKle/hnLtIDyYM6WoEJ4Vgz/CHzroEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jc4+sYcM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53J5e47P020229
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Apr 2025 05:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xAo57+o8pDfXrW5MUMIzwa
	Mvl399Fp9OfKtMXBUE0Tg=; b=jc4+sYcMoB4XCBN3OQEAetEuYY+URBX1X9HF39
	LJKjhFymfSuAgcIEct5N9rmtquSugLaTYwYKP35nQk+k4LDIa0qr4zteJrJ0U+b3
	ge1PasHe+ItJH7qmYsS4ulJ0UYfj3Eokruai/fGdgL/sWh7VR65r7hevo2oHOHXK
	vItEm9QQtpNAfsZ+1nNj5TN0fBgUEWO+W8boIe51iRfpm6GDePO/62K0JjuoRfyV
	Yhu9qM7P/ZwxBqtLJ0ANrGx+VWyjQUcyXn1qJ8YpEEeAge0OHrDniqqXuNRmVazR
	M8+TiDas86c5NrsScg4SZAIo6zuLbEUemxMgopK1n6+AKgFQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4642u986hc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Apr 2025 05:43:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-225974c6272so17949325ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 22:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745041403; x=1745646203;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xAo57+o8pDfXrW5MUMIzwaMvl399Fp9OfKtMXBUE0Tg=;
        b=PesSmkC8cLp9ITva35ek5ALuSesXbqR09WqwAehXIGjWWkfTxt2vjxQPD+gEy+EHgp
         nltEezTX+liy/hW9ro/tYOQNvqks4Czu0B2/XlgaW3reTzdUzY/aSvwVy5tSuMhrHl5x
         y7/YGEvAwrC1S9FjR8xkNZu13M3juC7dP4sMA+YWYbsnUKLFLpTIN3mey7YI4efS9Ug4
         V1TXlXYGbx+b44MFdyhW6RdlHwBsl3nAaj6KNf2NKPEGIHe91qB7AyX22jnOqE3zCjST
         T/l0EKWnjcRR/fg3T84R5OqJdXjFS30IPHVdlYFA/AHBIv8KcF1XXcT9xSiUAcm6lHYO
         cChw==
X-Gm-Message-State: AOJu0YwMluItjXZFuwPmbxMvu14qc0nwfRLdnpPmvbhvQMeChiQQP2Qe
	Y9FDDCAywi+xR8Bx2ohYlWTwDtnKYHSnCLPm9NbDJDmVZNExqbQHo5Fx2nOe31/I30QhnjxFfrG
	7MMbGjB+HMt1e02LoyJs9nxnviEs/OlntWiVCMe/JiDshFPknGoddNAL6Xk7SqEdG
X-Gm-Gg: ASbGncsQ4asvxJPTrIhCnW9IFIL/rIBui5YUMH9etieup3cXbsw7RVF+rBakXpOg4Xo
	1OxtUVoRuFS/bbZMSrrG8WaocdQsOlM0MyTTN06J7Y1Z8ioPY9fKa6QnZjoF2UK+5SmSgk4u6jf
	7QsFC6joQZSYhMt3Ex+3UoFLzBBa7PSNvcgNynk16qPfyVx61Z7dMZTf2PZ3oEgbjYqE9MpmezR
	yZrhMZMNNn/XXrVVPXHqRFsZNNANd9MUUv0UVqrtFwBlLYErKdFyEhs3zi6mAQjOIxnU+dt7EX/
	9zSFm57mhih8oBjbushIxKpxfnA2yextTkGajle7lJQDQ6w=
X-Received: by 2002:a17:902:f549:b0:21a:7e04:7021 with SMTP id d9443c01a7336-22c53f16c07mr52494795ad.24.1745041403339;
        Fri, 18 Apr 2025 22:43:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHR5gO5hVoTc7I52I41VZVfQb+wf4o2Ce5YHha38GoWQNeDAu1/Xe5wStWpvruC0Enxy/bkQA==
X-Received: by 2002:a17:902:f549:b0:21a:7e04:7021 with SMTP id d9443c01a7336-22c53f16c07mr52494615ad.24.1745041402953;
        Fri, 18 Apr 2025 22:43:22 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eceb37sm26014945ad.179.2025.04.18.22.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 22:43:22 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v2 0/2] PCI: Add support for PCIe wake interrupt
Date: Sat, 19 Apr 2025 11:13:02 +0530
Message-Id: <20250419-wake_irq_support-v2-0-06baed9a87a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOY3A2gC/2WPy27DIBBFf8ViXSLAEMCr/kcVRTzGDWoTbMBOq
 sj/XnAWXXQz0h3pnqP7RBlSgIyG7okSrCGHeKuBvXXIXcztE3DwNSNGmCA90/huvuAc0nzOyzT
 FVLDUUrLRKec5R7U2JRjDY0d+nF45wbxUcnk9/8DV07CUUDxBygU7q5Swwhwp08NKG86aDNjF6
 zWUoVPK94zDUYPRY2+AOqqJACOFl1Q6oqy3CqhATXwJucT0s0+rrGbedbzq/q1YKSbYM2Bs5Ib
 A6N9jzod5Md/NfagHnbZt+wX+6SmmMAEAAA==
X-Change-ID: 20250329-wake_irq_support-79772fc8cd44
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745041398; l=2631;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=2POJjFRmmzjMYgY8hhtxuwW1PCP805TvsmSsbRyGfj0=;
 b=T8h+eYm+ALVcmWH0/PXzcoNx4g9qn2eTxFkoLBodo0iBMM8I12I7HL4QST4/zjnw9DNElV+VP
 +hUUGbd0EVvDyWSnnsV1lj0ZX+4HUNtPw4Xjrf7pps5cm3V3MurkxQC
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=TYaWtQQh c=1 sm=1 tr=0 ts=680337fc cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ikd4Dj_1AAAA:8 a=s8YR1HE3AAAA:8
 a=zkpMToBQJcapbifWyZsA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: AxNtRJXcbb6AzrOeKgX3dIFITgBZZK3h
X-Proofpoint-GUID: AxNtRJXcbb6AzrOeKgX3dIFITgBZZK3h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-19_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=558 mlxscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504190043

PCIe wake interrupt is needed for bringing back PCIe device state from
D3cold to D0.

This is pending from long time, there was two attempts done previously to
add wake support[1], [2]. Those series tried to add support for legacy
interrupts along with wake. Legacy interrupts are already available in
the latest kernel and we can ignore them. For the wake IRQ the series is
trying to use interrupts property define in the device tree.

This series is using gpio property instead of interrupts, from
gpio desc driver will allocate the dedicate IRQ and initiate the wake
IRQ from the port bus driver instead of pcie framework as adding in the
pcie framework will be applicable to the endpoint devices also. As the
port bus driver is for bridges, portbus driver is correct place to invoke
them.

Add two new functions, of_pci_setup_wake_irq() and of_pci_teardown_wake_irq(),
to manage wake interrupts for PCI devices using the Device Tree.

The series depend on the following series:
https://lore.kernel.org/linux-arm-msm/20250322-perst-v1-3-e5e4da74a204@oss.qualcomm.com/T/

[1]: https://lore.kernel.org/all/b2b91240-95fe-145d-502c-d52225497a34@nvidia.com/T/
[2]: https://lore.kernel.org/all/20171226023646.17722-1-jeffy.chen@rock-chips.com/

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v2:
- Move the wake irq teardown after pcie_port_device_remove
  and move of_pci_setup_wake_irq before pcie_link_rcec (Lukas)
- teardown wake irq in shutdown also.
- Link to v1: https://lore.kernel.org/r/20250401-wake_irq_support-v1-0-d2e22f4a0efd@oss.qualcomm.com

---
Krishna Chaitanya Chundru (2):
      arm64: dts: qcom: sc7280: Add wake GPIO
      PCI: Add support for PCIe wake interrupt

 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts   |  1 +
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi |  1 +
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi       |  1 +
 drivers/pci/of.c                               | 60 ++++++++++++++++++++++++++
 drivers/pci/pci.h                              |  6 +++
 drivers/pci/pcie/portdrv.c                     | 12 +++++-
 6 files changed, 80 insertions(+), 1 deletion(-)
---
base-commit: 88d324e69ea9f3ae1c1905ea75d717c08bdb8e15
change-id: 20250329-wake_irq_support-79772fc8cd44
prerequisite-change-id: 20250101-perst-cb885b5a6129:v1
prerequisite-patch-id: 3cff2ef415ec12c8ddb7ce7193035ce546081243
prerequisite-patch-id: 820dbf5dc092c32c8394fbc33f9fe6b8da6e6eab
prerequisite-patch-id: 7f87f54386a87b39ca346b53d3c34ff0d0cb7911

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


