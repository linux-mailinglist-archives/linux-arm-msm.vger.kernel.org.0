Return-Path: <linux-arm-msm+bounces-80694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 11343C3E75F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 05:43:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E7DCF4E16A4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 04:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E99611E376C;
	Fri,  7 Nov 2025 04:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g3Q95D89";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W2ZNKws3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5704919F12D
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 04:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762490618; cv=none; b=fnLHE3iJACTiqvuGP2lBW8MoRZ2DYFFG/8REzuqchI8KO08gPSisgKabxqWXnVhcuozyVkq3sNl/ZlmlEPZvlGA59SUj+iUsQpt/J+8MwuFg0rmsGYW+oECPA1hnBu0E0pz3c+VovnZgJ6qwG8nPGfwXFwLhjQVEIhI46aOmJmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762490618; c=relaxed/simple;
	bh=hV4ZahcVlSXTfzTPYz2cBQGlrhdUP/Ekwl2N9yLbKYs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=io/FXq1ukCn1AynD3BAIZ2FjW9lo95T0qReHbAH5Z5rd6HqaBEy17lcKWY21ewu4P+aRzOpYnJiQW4+nlmYBAfZHp4y/KRVh/k941u38I0jtptJs4R1YMmzIqj02pnfz/2aPL3KggULtOssPPC64LvlYY3twE87QN3EYXKtMjcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g3Q95D89; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W2ZNKws3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6HVxq5528589
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 04:43:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=A0zzJQfIjoglaxXXW5z4oScN0UmceJnXGt9
	YyWe/ae4=; b=g3Q95D89PCr3x2+mgRCwIzFb3H8sBvr43ZLisXHp6ScO73fqf4u
	acYXaARGDHum4T0NkmNTNIpykMvGN8ysoWWNqf6Bmkv6QV1xeq5F7DFaKrtRFy9Z
	NA6e4dGN8SKJcsqz7h/4tW2IBTQlbv26CtzZr7+ndz2O/Dddibw8ykGfcAIHvPCT
	Rw1sm5rNAjL0k/F2+1PDZ7/BqUucV22HCHxHo3PaQrKE03eT87eH5OJjJ/9VYRWp
	VxX/7jwOd/Dfuzzr8TQhd1KAvaZZvELj5ZULodPv1sPGhpW5UYcWz44jNK/85Hsb
	3dkLRI4fR2v1ugts2PbhP1xEH8ffh1cHPhg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a905hsnvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 04:43:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-341661973daso498546a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 20:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762490616; x=1763095416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A0zzJQfIjoglaxXXW5z4oScN0UmceJnXGt9YyWe/ae4=;
        b=W2ZNKws3vboVh3Hf+OjV8jr+vAl4K0/lggo+2j1fHm+lnnn2n3puNb7tFieIi6XhrU
         oNk0+ESewS3ofvwvT/QbV6/JZjQ8CFp2cUX67YHoc5rrCt57lK05JquCBK9raYNA38li
         I1L+2bjWDJk4F0G2rXyC62uF2EG/Ja22KRVIeKRjwDtFOI9bIemvKEB9P0AWTG/Novar
         gTVKaEHSsXxXvzdsxQSnMCk+3qbA+ivJGgzHXuKlYUN6hhHG+3AYO6qpYdnH+Eqr1/zV
         nIzuuFl+CN+A92bRBetSbPF7+g1oLNGtKOE8rvG25wLjQZNcPzqLm3ZIRPbCfkpYqyEC
         bPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762490616; x=1763095416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A0zzJQfIjoglaxXXW5z4oScN0UmceJnXGt9YyWe/ae4=;
        b=XcKWFnY0kcM/cMUV7uUVj/ZcoxjVQbLywCqEh18Yl7yDD40XSyulDBiaFVdA32s7hs
         nubxMyKKBblqdpqE8Hi1O7DCKECJ69g//xZZwzQehhj6Q+NcxcFN2B5VgzeUBarWb4da
         2531ebYQHJ3rZIWAO6PcWhJskNI3kINJHtiVgth0g4pm/3LuaXPQxOoommXDL8pHWRRV
         /G2iSzi7MVHGUAa41IG5Au9Q5/mVw+uhs1wQDlqtG/dU8E/ly7QlxVn0f5X17yyIoJHT
         gaSt3Y+OdFMmiB/wGajhcfMKw3hU/EjvFXHpHPU8OCOFDfCd+ZxEkkpuSGSxV1GKI8qC
         RMKA==
X-Forwarded-Encrypted: i=1; AJvYcCWKylS0qdyBwegr/YgDRKw99PxqAIoSswGtNWDc8ShVD582RLXs8MyU6uIss6oqGOScmO4/fa83mQVjF1A/@vger.kernel.org
X-Gm-Message-State: AOJu0YyIQskonF06Q2SSOYA8Drec1oA4ee3bXzMvkgV1Inzhrh2+eVc4
	j8yu6P6FmKS+OQXT1tZ55Sc6VoEtndwKUTSaPxLGRgCE4IjZLki9qw1CAR6iSGAcNmM9747318Y
	66yJ+l+tdQ0csJD9sUsiprEZh7gkJ++wrPzSaYFfKFSWNkPtoRVAOJP1PgTVqA3j0RAlL
X-Gm-Gg: ASbGncuTWh2tVPWqczpzadgFPxY5TxE7kNw6eiFEUa9EKdxj9eyhYrvmJL1lGGPM/NI
	Nf6hMu+HQIbPfCQ6Z5IBTk14Lh4Ol6ULPYJYyDyT+//DuR/8QGwRiiZGKrB8TUW3n69/kSdmKvO
	/eMGsiZiLY6H8onxnJNDX1KDD0w5tBiPFpFcs0WIyRqX6sNBm2kyFs0yd/bdKcUU4UWmO3Xu/uK
	EbqIPhuWrOdntjT6dIb5W2tG5KH08kSjNlInMJgFqrydd/7UV6crJm4P94w7C1mPpCskhRuJ1hi
	nLzyRWn7JHAEGWBtLoc6O7fmsWJT2KTqbmRx4BKSZSiVBDKRsjMp8D6eqrHwNpFMeHJIhigkb1F
	iV/vDRhdWtCtE1M1CuA==
X-Received: by 2002:a17:90b:28c6:b0:32e:5d87:8abc with SMTP id 98e67ed59e1d1-3434c5897famr1856714a91.36.1762490615897;
        Thu, 06 Nov 2025 20:43:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfJgFFGQ+6rC+rfxOBvYv3Vr2wRzVWxy1ZnMK5/q70Hnj8EPjiAcWktEnKCAOjFLwm93UpXw==
X-Received: by 2002:a17:90b:28c6:b0:32e:5d87:8abc with SMTP id 98e67ed59e1d1-3434c5897famr1856667a91.36.1762490615402;
        Thu, 06 Nov 2025 20:43:35 -0800 (PST)
Received: from work.. ([120.56.196.127])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c332f1csm1142624a91.11.2025.11.06.20.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 20:43:35 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
        bhelgaas@google.com
Cc: will@kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org, linux-arm-msm@vger.kernel.org,
        zhangsenchuan@eswincomputing.com, vincent.guittot@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v2 0/3] PCI: dwc: Check for device presence in suspend and resume
Date: Fri,  7 Nov 2025 10:13:16 +0530
Message-ID: <20251107044319.8356-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDAzNCBTYWx0ZWRfX2CWZR2ye+PyY
 xAktVTikq3Wa3sFIQe5EKfPkuZ5YsMr28kQRb1UpaveLAKmhyHy4hBLS7ezcHdRgtozZf6Ftbhb
 JYMDeUqcSc8JPTa9Ywp/SfnBzsBOGNtT6OVLJ0Vm6ASKR6UV+nN2tLj+/m1LKS++gQ2ipzCyNAr
 +kCR+lfdVJWjistfO9VdB1VGhhNDmTfkGCriNpGwyWi2oZBCgaoXeQY2yhscDPMZS4UlIi2yApf
 mM0j4Kfv/88oxKNGBqkNX9K64wIZsX2QjmwzmXmGrx460qUOURnhyilWY8BsRkT/nNlN+tgG8rh
 Uv2U+Due4B7G0aLIJEcjTrBhvOpSL3dIGMnaAXh9FQ8SWBE3Oe/aS+Jyr5Hoa04YKfnFDn6fQRN
 PEUQfqrb7hUa25Acbo+/K8DNap6sdg==
X-Proofpoint-GUID: J33RkgZxavMVtT6EwK7FRj-fWibj3pqr
X-Authority-Analysis: v=2.4 cv=GMAF0+NK c=1 sm=1 tr=0 ts=690d78f8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=NqeMpCPRvvPHbudmJ2rC7w==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=h4SL0BZ7AAAA:8 a=wO7VGR9jvftWcqvb9pgA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=Cfupvnr7wbb3QRzVG_cV:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: J33RkgZxavMVtT6EwK7FRj-fWibj3pqr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070034

Hi,

This series aims to fix the usage of dw_pcie_link_up() API to check for Link up
during system suspend. The motivation for this series comes from recent
discussions [1] [2], where developers wanted to skip PME_Turn_Off broadcast in
dw_pcie_suspend_noirq() API when devices are not attached to the bus. They ended
up using dw_pcie_link_up() to check for the device presence due to the bad
example in the pcie-qcom driver which does the same. The usage of
dw_pcie_link_up() API here would be racy as the link can go down at any time
after the check.

So to properly check for the device presence, this series introduces an API, 
pci_root_ports_have_device(), that accepts the Root bus pointer and checks for
the presence of a device under any of the Root Ports. This API is used to
replace the dw_pcie_link_up() check in suspend path of pcie-qcom driver and also
used to skip the PME_Turn_Off brodcast message in dwc_pcie_suspend_noirq() API
and to skip waiting for the link up in dwc_pcie_resume_noirq() API.

Testing
=======

This series is tested on Qualcomm Lenovo Thinkpad T14s and observed no
functional change during the system suspend path.

- Mani

[1] https://lore.kernel.org/linux-pci/CAKfTPtCtHquxtK=Zx2WSNm15MmqeUXO8XXi8FkS4EpuP80PP7g@mail.gmail.com/
[2] https://lore.kernel.org/linux-pci/27516921.17f2.1997bb2a498.Coremail.zhangsenchuan@eswincomputing.com/

Changes in v2:

* Skipped waiting for link up in dwc_pcie_resume_noirq() if there was no device
  before suspend.
* Fixed the kdoc for pci_root_ports_have_device()

Manivannan Sadhasivam (3):
  PCI: host-common: Add an API to check for any device under the Root
    Ports
  PCI: qcom: Check for the presence of a device instead of Link up
    during suspend
  PCI: dwc: Check for the device presence during suspend and resume

 .../pci/controller/dwc/pcie-designware-host.c | 13 ++++++++++++
 drivers/pci/controller/dwc/pcie-qcom.c        |  6 ++++--
 drivers/pci/controller/pci-host-common.c      | 21 +++++++++++++++++++
 drivers/pci/controller/pci-host-common.h      |  2 ++
 4 files changed, 40 insertions(+), 2 deletions(-)

-- 
2.48.1


