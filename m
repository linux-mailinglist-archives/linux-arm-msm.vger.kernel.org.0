Return-Path: <linux-arm-msm+bounces-43252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7249FBEF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 15:10:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 622C5188475B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 14:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81EB1C5F3D;
	Tue, 24 Dec 2024 14:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Py+Qw4mc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CA9194A59
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 14:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735049444; cv=none; b=GzTmVzznMe8vlys7Kb4nNCpf6z0rkgopBBSpuLcYUGoVq6r7AEDXY1XO5HT3PCCUY8arJjVDfLGaPDjJQVhqFSftj6SAQY66kHjCVWrVxwPOCyKzuU5sc31SuaM4AQN4tEu7bo8HkyeTIpwoyonXdCxy3F8dJrsKceEGQLrvRJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735049444; c=relaxed/simple;
	bh=yCsNH2XxkDGE7DhU28V1eN2tpma4+5VYJZ2ma0hWasw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZXcvFVw5Su2Kh7lxODasc08wFL3hZMtLin0lZ7iRO26FIA9Yr0NuGhcbfPvASSi7MfK86Beo8HsMJKwsg5vHVZUivOx41QOcmvoxtP4aGW9oIzr5Zmxy9X6HtihAwM+dlwcaD0fEhfxPuR0Q3aTv1d3r08B6LqKybf9rbL47JAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Py+Qw4mc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BOC5aI6009863
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 14:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ltzNm1lbjcQE39Ulbg+6fs
	GFpyYQyDI0oS3b1aYg8mI=; b=Py+Qw4mcKf55HD+hsS5EElFy7KY6dHDelzqcow
	0opZcpiOAyyspHx9AouQx8t8KJ1g+02ERYm3RVF/D7lgBaV8HqAS/Hz/YJkMXScC
	QGcKPE6DMEeOdn5PZK93UOc0rLmdtb0Us3ZYpIuNnRPqAVegTce7owV6drske+cY
	dotXxuKv5sgAuCghJ4hSmRIn7Cb46NJq3qaRNr0VmdqQ9zNr9PkeQRkGJ+ZxRt8Z
	7EHhwqqPlQYl94xqYeNEQ3W1x5l8JFlMWAty45T3hRuQftm5/0LlM6RXv0RFuIuG
	gdKPo5Bdd1Yfl3bJ0b5F1kk9IyFztBtLX9X8JgqYozDMaj/A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qvnggjsh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 14:10:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2eeeb5b7022so5420776a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 06:10:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735049440; x=1735654240;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ltzNm1lbjcQE39Ulbg+6fsGFpyYQyDI0oS3b1aYg8mI=;
        b=rRdIJc9jgpuboK2PVkZDCdLaCQ+J4qWV/DvkgTkyWM/FGKBO2IzlrKQRvhMCCYAxtt
         bFfyuLW/tSBqUDEG3Ei7YhtF15sBW5zMRyo2AkNdYPmVFT/Y61CipK29ZQTMJB256hH6
         B3i5B77qMZzFOyvv01mPoz5bIC8rbK4NUFtCCyQE+hIYw/isLE9GcZ+1FlKSI6RTr+z/
         KuImJ0otHSEt+9Xb1rrNLb50ziz800KtfwEnXvQSfUxn5gJIL764uhO6/xTweKM77x7v
         /J9fowwyUdXmzEpmAk8QxhQzeSvJEG1nItza8Ss/mVM4S04ZSVHXs74X6IpIh1AckycU
         cS2g==
X-Gm-Message-State: AOJu0YxLIxjyzU3tHJvDQVEwPsZADcP17I6p/eSk0JSvdm6HZIXh0TBk
	dxHx2MfwGkxN/mZRFUJf2bIphgxxy8EeWKeKoA7pO1sd6ECCcC2mOSUfb5J9RaiL0Df+RlOJQfK
	IY6/wr44Wi+nveYRTmuoM0t3gPB0ykXk9Ft648T2i0SltfmzZgu6NA/bH60uAnpDM
X-Gm-Gg: ASbGncs/TffKPL02WalTvPOAzUeU8sVw2hCCxJiPdZx3JmNBht6p/EOEHQfShw1tSRf
	iF4x5ODaTyOJezToGhuLbL9P6o3oRg8ZP0/mPowToZ+6NqIsDxcUeR5bQZ+qwVQH5hevQ34QRN9
	i6MvTujYWKQAYt+PQ1e99CW7mZGcoKLK37nEzcaUqNiKIP3lgNF8XtHdsp3zlcVY6hciTOWxI0x
	x2ylh179SWIGpjVPMWZzkNxQVF0KW+PlWVrentUGBV0bfNIIoOOyskyXKlp6gDVooBv/Uke2y4I
	RiVt+XY6xZWA8M/S
X-Received: by 2002:a05:6a00:8f07:b0:725:b201:2362 with SMTP id d2e1a72fcca58-72abddb0bd4mr20766470b3a.11.1735049439941;
        Tue, 24 Dec 2024 06:10:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiuQR5vyJXDlz4oiPhwK0Lmsw0QxiX8EKIJ0+STMiq513bZHMfA3omNk5pI78Q7/7kdUFxww==
X-Received: by 2002:a05:6a00:8f07:b0:725:b201:2362 with SMTP id d2e1a72fcca58-72abddb0bd4mr20766445b3a.11.1735049439574;
        Tue, 24 Dec 2024 06:10:39 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90b8f5sm9691216b3a.194.2024.12.24.06.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 06:10:38 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v2 0/4] PCI: dwc: Add ECAM support with iATU configuration
Date: Tue, 24 Dec 2024 19:40:14 +0530
Message-Id: <20241224-enable_ecam-v2-0-43daef68a901@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMbAamcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIxNDI0ND3dS8xKSc1PjU5MRc3TTLNEuTJHMjM8skSyWgjoKi1LTMCrBp0bG
 1tQC002IJXQAAAA==
To: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_vpernami@quicinc.com,
        quic_mrana@quicinc.com, mmareddy@quicinc.com,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735049433; l=3478;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=yCsNH2XxkDGE7DhU28V1eN2tpma4+5VYJZ2ma0hWasw=;
 b=4L5Xv57idEc6tJEh9u3VNYpsLNSLw0YHbszJtcMMDUSa16AWj4TDmxfca1Ej+9QfWpwUjhApv
 1zdirA3+we8AemMhndQR/6teH2w5+GJypESplHFowOXj4KK16tjs8jA
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 9e53VvIrlNKn9dyVW2wVW2SWUDHMWaTq
X-Proofpoint-ORIG-GUID: 9e53VvIrlNKn9dyVW2wVW2SWUDHMWaTq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412240122

The current implementation requires iATU for every configuration
space access which increases latency & cpu utilization.

Designware databook 5.20a, section 3.10.10.3 says about CFG Shift Feature,
which shifts/maps the BDF (bits [31:16] of the third header DWORD, which
would be matched against the Base and Limit addresses) of the incoming
CfgRd0/CfgWr0 down to bits[27:12]of the translated address.

Configuring iATU in config shift mode enables ECAM feature to access the
config space, which avoids iATU configuration for every config access.

Add cfg_shft_mode into struct dw_pcie_ob_atu_cfg to enable config shift mode.

As DBI comes under config space, this avoids remapping of DBI space
separately. Instead, it uses the mapped config space address returned from
ECAM initialization. Change the order of dw_pcie_get_resources() execution
to acheive this.

Enable the ECAM feature if the config space size is equal to size required
to represent number of buses in the bus range property.

The ELBI registers falls after the DBI space, PARF_SLV_DBI_ELBI register
gives us the offset from which ELBI starts. so use this offset and cfg
win to map these regions instead of doing the ioremap again.

On root bus, we have only the root port. Any access other than that
should not go out of the link and should return all F's. Since the iATU
is configured for the buses which starts after root bus, block the
transactions starting from function 1 of the root bus to the end of
the root bus (i.e from dbi_base + 4kb to dbi_base + 1MB) from going
outside the link through ECAM blocker through PARF registers.

Increase the configuration size to 256MB as required by the ECAM feature
and also move config space, DBI, iATU to upper space and use lower space
entirely for BAR region.

Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
---
changes in v2:
- rename enable_ecam to ecam_mode as suggested by mani.
- refactor changes as suggested by bjorn
- remove ecam_init() function op as we have removed ELBI virtual address
update from the ecam_init and moved to host init as we need the clocks
to be enabled to read the ELBI offset from the PARF registers.
- Update comments and commit message as suggested by bjorn.
- Allocate host bridge in the DWC glue drivers as suggested by bjorn
- move qcom_pcie_ecam_supported to dwc as suggested by mani.
Link to v1: https://lore.kernel.org/r/linux-devicetree/20241117-ecam-v1-1-6059faf38d07@quicinc.com/T/

---
Krishna Chaitanya Chundru (1):
      PCI: dwc: Reduce DT reads by allocating host bridge via DWC glue driver

Krishna chaitanya chundru (3):
      arm64: dts: qcom: sc7280: Increase config size to 256MB for ECAM feature
      PCI: dwc: Add ECAM support with iATU configuration
      PCI: qcom: Enable ECAM feature

 arch/arm64/boot/dts/qcom/sc7280.dtsi              |  12 +-
 drivers/pci/controller/dwc/Kconfig                |   1 +
 drivers/pci/controller/dwc/pcie-designware-host.c | 145 ++++++++++++++++++----
 drivers/pci/controller/dwc/pcie-designware.c      |   2 +-
 drivers/pci/controller/dwc/pcie-designware.h      |  11 ++
 drivers/pci/controller/dwc/pcie-qcom.c            |  81 +++++++++++-
 6 files changed, 218 insertions(+), 34 deletions(-)
---
base-commit: e989da8ac2a4999cf6edfaf55880909577d438cd
change-id: 20241211-enable_ecam-f9f94b7269b9

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


