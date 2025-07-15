Return-Path: <linux-arm-msm+bounces-64958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2421B053F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 10:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60604563037
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 08:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEAC02749E5;
	Tue, 15 Jul 2025 08:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bWmZGFIF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546524A00
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 08:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752566422; cv=none; b=Cgw7pP4MX1xLeElN+P6HLS2ynZpLaIJk8H5vMk5Eqb3s5OyooO8TedMRoKpFQv2cdnTk9yrGwHWy1287mSauPHqhkm+iaGjjDHbw2N53obqVfubalwTH42J57peVJyu5SXjWQEpzjgrBQnRsNVf+Tt9Bqy+I1A4YdNyU81gkgt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752566422; c=relaxed/simple;
	bh=GbfOEePw+z5MtTz44J4WfJHcnv9d9dSlNQ7AQG96tVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YXD1spDuqBBLA+dWwBv0Ob2QttiuDKoBKstbdszDS4s/QxVfey1SmMAjjK6yWfFH0dvyaoFmtCft8MWSS0Lmg6zxcs4UiIMxzCIp7Eoi8/qLIjrRWBab3IhaCQbtr7Ied2ibDnmZEzxIdLfQ/b7IdnRVtr9PjPWIn57PyyYwMfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bWmZGFIF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F7Tq5h027348
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 08:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	29osqCa8Dk0skNiIogmNa+iuqm6tKwJ5AW+ZWWEuekQ=; b=bWmZGFIFA6nB798K
	UoTaUZCPWOYAAIUoBB1pOdT8mI/IKXyCaq13eStFS/YSvJTfa6a4s9FuSMlxdlqc
	xSh/iFWmIzOLfk0kApSSy7BXPIjzOe2/Un3Si/McSi7l08zDwq6P1+6NvaSwKImo
	aFe1kFMwk4OiFN4EctFIxeXi9pSMMIxyXv/qt98xSeR+xZTuP9TNdhHmG9fQbazw
	tT8C96bPmUdB7HHnfXbFtS48AIwiKjmIPj03yMRwrWQHmXcpsi4iT0bhDBvyMvwK
	hp1xoYtQghsLpKqWsTtDYN8MNcotEuopEztMWKs8lflqBco1J0KQUvGiEeXqquc+
	DBSItw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug37yfe9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 08:00:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ab69fff4deso31384751cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 01:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752566419; x=1753171219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=29osqCa8Dk0skNiIogmNa+iuqm6tKwJ5AW+ZWWEuekQ=;
        b=YEu5ycEfGqoa8mOVaHwvT+YWzLYW9ZfUokrQTxbtgAntHC03nz55dRXrEggoYEZM0i
         Sb0n+G6+WVslEBuMHu0q4OjtCTSreOn/jlxS5scU6ZYYBfmxKiYGBJ6tiT6X+rrgzULA
         C8dKEeQiwt3Sa0WXNJY/S8SOIX3n9+hmTDM+z1i3gIxEE/eJ39w7ZdXOxSiIwbeFO4Ir
         7pahwp50uyX9b8On0VIF1D2GQvBi0A9+GYpXdW2FUlC0ZTFrJzJMi5wevvwUQXSL7unv
         tPaf49QDP3Jz71uGt9fX7ZAhC/tyO70KrE/fpBmf99Txw9Is/jR712yFPL0D1KgWOGvz
         SOEw==
X-Forwarded-Encrypted: i=1; AJvYcCUVy9FpenWN4dT9SG6R8D9hDr924KTFwRhPbEgt+q2jjIfB2iWgdYNrkAEzsMImJ+jWjSmvANoEA3SDceBr@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3hqr5cXzmHP4AM/yHFind9/VWEqrA3mMhn8hMwPATaHwkUlC8
	avdK1+2VNQ0Cz6CAxMuCCTKgeuVFJRL2QKZzbJ/Q0Ujib8rYb/gp9u4GRTldcZIUSPiHkiQiMcG
	xRid93oNrmVGD36gJtB6yPh25tKJBrq00ZkvUrYWFxckZv/8CFX2iW0TPxzIKgYaRGPii
X-Gm-Gg: ASbGncvGGq7jxHswGaDmrwgMR+CFuFkg5RCMxX+6m4/5qkwwX4iZD5W5Tcdlu6kUqmQ
	jlOYgd6QwvefvYzAlg2Zzp10NSMyhOWt6WYd/WN8ga0D9tS6FKARulPe+aO9NKYJfT3P88sp9Dw
	ts36yM1qiAinRYgXgCmqsuvSNQVs5zWPW9k69Va0k7MrzU3+NpgUClF9SMy+5220A76XsSRD67R
	eA89lrN9fr5wvbaiVs9FMCIrhNQpPz/dkhB+M9Tiugmz45oDpeO8uzIsDH1UX9u8vBzNoauIqzf
	75CHu2z4GGBj4+uSDedj6FJgOuO0NeTuBSe9jMjDtqDZ2h+co+2FjIndl4thBxWpGVQd4A==
X-Received: by 2002:a05:622a:18a4:b0:4ab:5f47:da5b with SMTP id d75a77b69052e-4ab5f47de9cmr131467251cf.8.1752566418985;
        Tue, 15 Jul 2025 01:00:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzxAuZjlIsaIQYm8rUmtgg6lfPzyFqgOdBUY48IJRWVOd/+6pHo+ureD7f0u+Ea8Kb36AIOg==
X-Received: by 2002:a05:622a:18a4:b0:4ab:5f47:da5b with SMTP id d75a77b69052e-4ab5f47de9cmr131465031cf.8.1752566417355;
        Tue, 15 Jul 2025 01:00:17 -0700 (PDT)
Received: from [192.168.1.17] ([120.60.140.219])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ab3f1c9a2csm37792461cf.67.2025.07.15.01.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 01:00:16 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 13:29:18 +0530
Subject: [PATCH v5 1/4] PCI/ERR: Add support for resetting the Root Ports
 in a platform specific way
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-pci-port-reset-v5-1-26a5d278db40@oss.qualcomm.com>
References: <20250715-pci-port-reset-v5-0-26a5d278db40@oss.qualcomm.com>
In-Reply-To: <20250715-pci-port-reset-v5-0-26a5d278db40@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Niklas Cassel <cassel@kernel.org>,
        Wilfred Mallawa <wilfred.mallawa@wdc.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        mani@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2880;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=r0nAnKYpMV4ShS/A4tyT1tuVoZHwLxeeuNZjL60OQmQ=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBodgqBv1NxanE9ktG92zwVOS86zmTwrgRknu0BG
 EdgynZglOeJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaHYKgQAKCRBVnxHm/pHO
 9eGbB/9qWuKdG71Bkc05mHOvA3YhLiqRtMkImAXOhrGbspJBs2gazpPTUmbvvZugat5RiXiSKLl
 VnsanmUx9+DFNfHa/SpLum7wxWPkU3VMkcPHjLFBjRAMmGNrmfozcQBaQdfaI3zRwFG8YE1knma
 SoN8FMSVwaUXywfXWqQl8BC1zp1KjE1L/4Qcw1WdgOjylOYbCwYA863NFMBmoD72Spc8MCNVcQT
 H4c0QyA2IHkKCDLAB4Jgow/7A63z10vHSeCM4EwUwpGUU7gMHTJSjSZPLsBrP83G/8sA3qxt3m7
 wGzCBJF/tOljFQFAZpwnRRToBRyLWeULjVeiU54/GsfAvg+T
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA3MiBTYWx0ZWRfX2vFk6ut2ybPm
 3VfTKjIIdm1vuhufXIdnlruL0FIH02wwwfbIQf4C2q0MP1UJhr1RMdynw1gyCVO1bOZPmRE/Qoz
 Ai1hLRSXLIjofmGkKTtA9IPlxjjzp0HpRokYdN+GUK1Qe92JF3ZsYvH+mHOKtvt/M7Gtkxpyyxi
 cW0CAsHPCwlvs5kwx6AiXGxNnrAn8Xo1snOqIeIj+IFK0z4PuKAIoDSxvZKdCmV8Bd1HQ09p4vN
 giF8RNhV+Zq8urcEOVXNjLimKTx9noEpKonFZ0lZpl8L5E+04YLwY4UM4cIQEn9o/D1VabQFuS5
 Ff9UXn4/43nt58vL2lcspTRzi88dsCWvKmvbcHBbi4fuNN9F/lJizvVP6gfffqj/shcPd+Yr9HR
 hnYoAUujFewu8u074Y1OYL+gscIKKMfDNDsXhRTVzmUyNafFKBo9XMN8C+ZZCzyHR5tY2wHT
X-Proofpoint-GUID: aDPD5yAyCp1hKR-VxXlxStOdthO5Hqee
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=68760a93 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=HOswsyiB/7FCIMMjk980kA==:17
 a=lJ8DZ0MjVbnDIa4D:21 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OSb3l-ukYRaLxMRXSjIA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: aDPD5yAyCp1hKR-VxXlxStOdthO5Hqee
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150072

From: Manivannan Sadhasivam <mani@kernel.org>

Some host bridge devices require resetting the Root Ports in a platform
specific way to recover them from error conditions such as Fatal AER
errors, Link Down etc... So introduce pci_host_bridge::reset_root_port
callback and call it from pcibios_reset_secondary_bus() if available.

The 'reset_root_port' callback is responsible for resetting the given Root
Port referenced by the 'pci_dev' pointer in a platform specific way and
bring it back to the working state if possible. If any error occurs during
the reset operation, relevant errno should be returned.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/pci/pci.c      | 12 ++++++++++++
 drivers/pci/pcie/err.c |  5 -----
 include/linux/pci.h    |  1 +
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index e9448d55113bdfd2263d8e2f6b3ec802f56b712e..82c56fbd58ca4aaafac4f1638e7e0225c07958cb 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4964,7 +4964,19 @@ void pci_reset_secondary_bus(struct pci_dev *dev)
 
 void __weak pcibios_reset_secondary_bus(struct pci_dev *dev)
 {
+	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
+	int ret;
+
+	if (host->reset_root_port) {
+		ret = host->reset_root_port(host, dev);
+		if (ret)
+			pci_err(dev, "Failed to reset Root Port: %d\n", ret);
+
+		return;
+	}
+
 	pci_reset_secondary_bus(dev);
+
 }
 
 /**
diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index de6381c690f5c21f00021cdc7bde8d93a5c7db52..b834fc0d705938540d3d7d3d8739770c09fe7cf1 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -234,11 +234,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 	}
 
 	if (status == PCI_ERS_RESULT_NEED_RESET) {
-		/*
-		 * TODO: Should call platform-specific
-		 * functions to reset slot before calling
-		 * drivers' slot_reset callbacks?
-		 */
 		status = PCI_ERS_RESULT_RECOVERED;
 		pci_dbg(bridge, "broadcast slot_reset message\n");
 		pci_walk_bridge(bridge, report_slot_reset, &status);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 05e68f35f39238f8b9ce08df97b384d1c1e89bbe..e7c118a961910a307ec365f17b8fe4f2585267e8 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -599,6 +599,7 @@ struct pci_host_bridge {
 	void (*release_fn)(struct pci_host_bridge *);
 	int (*enable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
 	void (*disable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
+	int (*reset_root_port)(struct pci_host_bridge *bridge, struct pci_dev *dev);
 	void		*release_data;
 	unsigned int	ignore_reset_delay:1;	/* For entire hierarchy */
 	unsigned int	no_ext_tags:1;		/* No Extended Tags */

-- 
2.45.2


