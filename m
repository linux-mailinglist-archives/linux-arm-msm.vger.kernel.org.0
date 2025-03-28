Return-Path: <linux-arm-msm+bounces-52745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7FEA74840
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 11:29:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7027318996F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 10:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27044219300;
	Fri, 28 Mar 2025 10:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m9+d0dBj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFB22192FC
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 10:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743157743; cv=none; b=tzIMAxTykVsnOYQtVynm8UbO6UWH0iB4aBUX2JF3ZXXPMU0m9mdj/lu4oBtOXtNv9EjrfudEg0/qYtXosnQ0psdvW1DfVWJHco4EHT7B8cV7ze1yKWNck5n0Klk/YS5HI2vkqKDQ2nnifoAqDvqebgICa1fjIR9ZgC2WGneI4Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743157743; c=relaxed/simple;
	bh=mf5BuP4DbTs8hTdfi6oMr/Lqb1LlM5HErZJeEIbfzrc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hrsU2DjzRphtxAUSGNZQ2eEsUdAMhIlMUoPcMXsSg+cKIex3kh/nPWBXftnGky08SMuk+EpSwE1nXLJUcZRkPl3deHgEvICt1q/6auRAp3Ne5fScP8IhOKn2Au1gN85aVlQg1PuUqRM16Y3FeEoeEGAQcJpPkoGaoP/03zM/r9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m9+d0dBj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S2C8DE023695
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 10:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CrA1bYnBuWeYn44o2Bh0OW
	jG65xH/Z9n/7BBROFN/aw=; b=m9+d0dBj/Aavca+RXxdi4QsUdzHUOovMU6x6Zm
	hSji8uKd2fXuP9BvvS0UaKRalKb/jpDDuEiLKuSkWrLJLI07d4mY21Jh9ciIv0lj
	yoTEhXeV8ytCu3yULvM3s85vrn7UDX9QsBDVuEFZhzC/nL/MTcsIGzFz0O07NrB3
	28DbFSvcr8KW0fxO0Kp0XsaXU/dVys2kRV1rG/s7tw8HOAjAOl0zYJvHlzkonx11
	addwqUPDtUBQcWanTLB5ImrsAEaKoJKyil1KqryyikMkMUMMmvcmx1AUjIvxwKuk
	EdBsO0nXnpMTxGbYrQ7K5CM/2mNFfvfC6wi0BN88c78IUO+Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45njsc1b3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 10:29:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-225429696a9so54675235ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 03:29:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743157738; x=1743762538;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CrA1bYnBuWeYn44o2Bh0OWjG65xH/Z9n/7BBROFN/aw=;
        b=BKNepPYCYDqnedn8aro96yBdNJkL5o4BIYMPqC+8+8HEN8UQtnwcKJdkEkegRrT+kp
         ttafnXTQNBCfsbpSS+QpPWPBwXM871GLreJy+KSBODSHClvXuoiPY8J5XekL6HV4v6lK
         qvZqijREeULxaQx34hAYq6EKYO+aZ6bHtZ4bIh0ZLEyibKFp1inL1E5kmJSr/kTDytVQ
         9Pcix/AL6gWiwNdsqhH9kDL3JBHSlrzDyacW2pdyYEe+g0fY3u/s6dgrafgydFwmfid6
         1rEZCOgP2v/AMHrAHnGJpM0cjCagomw6dA7HJ5jBWuGZIlRiPePPmTFL3rbEwy5nCRzP
         sHPQ==
X-Gm-Message-State: AOJu0Ywp5Wi2+KeU7vb2Sy1afuDPNUUnpzCExZWOP04ExFcM60+fle0N
	dphfaBlEab/n5vnEt/aLIPTnSzh1f0anNhve3E+5uYoJbeeY7b5baxCz3VyRd6pw44e1TgP3GtT
	fdAo9ki4Pf33iQ2EIwM9ZA0sG2vWuJXeBqlrVxKTddfPFOq2HI8hVOKdAUZonfKny
X-Gm-Gg: ASbGncsUosN6LLlBfShQxJKpjlzgRzRwMauQcPQbTKmELhmdZBVTStB5HV05yhJ/qK3
	cGd0enTIecjabZI+iMPx0cljIQBNrE6iYyuWlhYKT2oh5L8QKl7YLJosSb8AQoN04QhIo+BuEiH
	jwcNvRaRiv+5IJcwaDg6HZ97z3TRJ79kE+8ap5aiAgdpWCWg/cP9WuYVcHkDRsXD/HnX8Guk+PG
	gFsqSTezIeQRp2EGfnSYx0awhaUf6J58Z06JZpq6qC0+onOGJoDrKRsLi6JGXR1hBjMmDrvBuU2
	wRPvZMFt9F4oPsmcEkwaC714K0hzwiy/SbMsJ57LYEo2VfB5bvs=
X-Received: by 2002:a17:903:2b0b:b0:226:252e:b6ef with SMTP id d9443c01a7336-2280481d0d5mr114123555ad.7.1743157737932;
        Fri, 28 Mar 2025 03:28:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJ6Wp9H4IH/hwWRloE8NFm6xudfOST1lZ3UslYecN1jAwAqFCFXqGZc8RTchinS4ImWDIc3Q==
X-Received: by 2002:a17:903:2b0b:b0:226:252e:b6ef with SMTP id d9443c01a7336-2280481d0d5mr114123185ad.7.1743157737365;
        Fri, 28 Mar 2025 03:28:57 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee11b7sm14561965ad.86.2025.03.28.03.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 03:28:56 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v9 0/5] PCI: dwc: Add support for configuring lane
 equalization presets
Date: Fri, 28 Mar 2025 15:58:28 +0530
Message-Id: <20250328-preset_v6-v9-0-22cfa0490518@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMx55mcC/3XMTQqDMBAF4KtI1o1MEvJjV71HKSWaWAPVtMZKi
 3j3jm7qwsIw8N4M30SS74NP5JhNpPdjSCF2GIpDRqrGdjdPg8NMOHAJnAF99D754ToqyryupQL
 HhHUE//FSh/dqnS+Ym5CG2H9WelRLu6fgAK1KZ4R2ANy4U0wpf77svYptm+MiCzbqDcDlFtAIW
 FmIWvhaFJL9AcwPEExtAYMAaBBWm6oUUu4A8zx/AQsTU3krAQAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_mrana@quicinc.com, quic_vbadigan@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743157732; l=4598;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=mf5BuP4DbTs8hTdfi6oMr/Lqb1LlM5HErZJeEIbfzrc=;
 b=a/zjTo3TtQV0vTCF+vmKHjKo2bIsuH+js3eqMkJyGZY3grCN+EeBrwH3mZvVxsSU0A358WCmc
 LQphtlup3AdC+dz1vha2uSW/tvniTXpxOCRRQJjg6z/DhCf+KL4IHfK
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=fJk53Yae c=1 sm=1 tr=0 ts=67e679ec cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=DYBN0Cp5FbWaLJN7M44A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: eY9ABpH7_eGNjgkOAEGX3090gv8Bl13R
X-Proofpoint-ORIG-GUID: eY9ABpH7_eGNjgkOAEGX3090gv8Bl13R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280071

PCIe equalization presets are predefined settings used to optimize
signal integrity by compensating for signal loss and distortion in
high-speed data transmission.

As per PCIe spec 6.0.1 revision section 8.3.3.3 & 4.2.4 for data rates
of 8.0 GT/s, 16.0 GT/s, 32.0 GT/s, and 64.0 GT/s, there is a way to
configure lane equalization presets for each lane to enhance the PCIe
link reliability. Each preset value represents a different combination
of pre-shoot and de-emphasis values. For each data rate, different
registers are defined: for 8.0 GT/s, registers are defined in section
7.7.3.4; for 16.0 GT/s, in section 7.7.5.9, etc. The 8.0 GT/s rate has
an extra receiver preset hint, requiring 16 bits per lane, while the
remaining data rates use 8 bits per lane.

Based on the number of lanes and the supported data rate, read the
device tree property and stores in the presets structure.

Based upon the lane width and supported data rate update lane
equalization registers.

This patch depends on the this dt binding pull request which got recently
merged: https://github.com/devicetree-org/dt-schema/pull/146

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v9:
- Add support for data rates 32 GT/s & 64 GT/s in dwc driver & macros
  for those registers (mani).
- update the print statements (mani).
- Link to v8: https://lore.kernel.org/r/20250316-preset_v6-v8-0-0703a78cb355@oss.qualcomm.com

Changes in v8:
- Couple of nits by (bjorn & mani)
- Add EQ_PRESET_8GTS by (mani).
- Remove the logic not to update the DWC registers if the num_lanes is
  not equal to maximum lanes (mani)
- Link to v7: https://lore.kernel.org/r/20250225-preset_v6-v7-0-a593f3ef3951@oss.qualcomm.com

Changes in v7:
- Update the 16bit array in the array (mani & konrad)
- Update the couple of nits (comments, error log format etc) (mani)
- remove !num_lanes check as this is not needed with this series (mani)
- Add warning prints if the data rate is not supported and if there is
  no devicetree property for the data rate (mani).
- Link to v6: https://lore.kernel.org/r/20250210-preset_v6-v6-0-cbd837d0028d@oss.qualcomm.com

Changes in v6:
- update the dt properties to match the lane width ( mani & konard)
- move everything to helper function and let the helper function
  determine reg size and offset (mani)
- update the function header (mani)
- move the num_lanes check to the main function (mani)
- Link to v5: https://lore.kernel.org/linux-kernel/20250128-preset_v2-v5-0-4d230d956f8c@oss.qualcomm.com/

Changes in v5:
- Instead of using of_property_present use return value of
  of_property_read_u8_array to know about property is present or not and
  add a macro for reserved value(Konrad).
- Link to v4: https://lore.kernel.org/r/20250124-preset_v2-v4-0-0b512cad08e1@oss.qualcomm.com

Changes in v4:
- use static arrays for storing preset values and use default value 0xff
  to indicate the property is not present (Dimitry & konrad).
- Link to v3: https://lore.kernel.org/r/20241223-preset_v2-v3-0-a339f475caf5@oss.qualcomm.com

Changes in v3:
- In previous series a wrong patch was attached, correct it
- Link to v2: https://lore.kernel.org/r/20241212-preset_v2-v2-0-210430fbcd8a@oss.qualcomm.com

Changes in v2:
- Fix the kernel test robot error
- As suggested by konrad use for loop and read "eq-presets-%ugts", (8 << i)
- Link to v1: https://lore.kernel.org/r/20241116-presets-v1-0-878a837a4fee@quicinc.com

---
Krishna Chaitanya Chundru (5):
      arm64: dts: qcom: x1e80100: Add PCIe lane equalization preset properties
      PCI: of: Add of_pci_get_equalization_presets() API
      PCI: dwc: Update pci->num_lanes to maximum supported link width
      PCI: Add lane equalization register offsets
      PCI: dwc: Add support for configuring lane equalization presets

 arch/arm64/boot/dts/qcom/x1e80100.dtsi            | 11 ++++
 drivers/pci/controller/dwc/pcie-designware-host.c | 79 +++++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-designware.c      |  8 +++
 drivers/pci/controller/dwc/pcie-designware.h      |  4 ++
 drivers/pci/of.c                                  | 44 +++++++++++++
 drivers/pci/pci.h                                 | 32 ++++++++-
 include/uapi/linux/pci_regs.h                     | 12 +++-
 7 files changed, 188 insertions(+), 2 deletions(-)
---
base-commit: 3175967ecb3266d0ad7d2ca7ccceaf15fa2f15e2
change-id: 20250210-preset_v6-1e7f560d13ad

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


