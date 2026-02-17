Return-Path: <linux-arm-msm+bounces-93124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PcFKblOlGktCQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:19:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4827614B40F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:19:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68F1E301225E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F29BC1624C5;
	Tue, 17 Feb 2026 11:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IBtByGiF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZKmu9OQs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDF7236A73
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771327156; cv=none; b=lmLXF961tcEzhUAVgTo+SE0S28jROCbGZdSt+QeLq8LwmTBZDqgw1N/cppuBL4V2InLedc34S8p0haV3KHRXrRjdkKZutLCqUnmRL9kDTMMx+Iw//m3wu34VD4rHdh8BHCZqQqmazWSH0wXtP9aCAq//bea9S5EkKIW5YsPNoGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771327156; c=relaxed/simple;
	bh=vfy+YzqqKerb02XrtXzWTVN+T8EmD/WiyxKqOvqNYg4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=E++1DdiVjEOzCgWcSp3Lem7oy95hrJGem/SmFDDC9b6ydnFiYVFtWhSr0r9ZbqzCGcVtPKXWfi3y6MdjCRNMPI959JPjurUah5qHZSTxc1wcXm7cx0zinnqhxODlY+/J45YqReGBYrlVkdAc2WSd79FY/qDamnARsISxwEztR+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IBtByGiF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZKmu9OQs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HAA2Bg2803486
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bqnU+1TM5gIEHCVNQzhu+5
	3HuEr/QxKQz4ZoYABsYvo=; b=IBtByGiFfKARYol4oLKZadtge89ZfGjf06BhOF
	DpzGV8YBamjsJdEXaL73tp7cHGbYnmV6mhgnmbbrrU5GFF9dpeKCkBwNfB4aghmq
	Vhbt24U0XbEwGAC1OjFGsfbatxOCx3H+Lo53/mjFlEbIby6dlSsIKjIUSBuV4+AG
	O3oyJyBVWYMEutqd39LO88hntrhiOahhAqwU99qDW0E/bENr1WoV6+ow4nd6oV/Z
	VtHLqJmN1oRaGPn76gaNDFnsuao9NrX2ChDfnrvXJBED9XZnHB+VS1CFEo6Ei46X
	IwocB9mkrlow9n92E+lPG8GrirwyoCWwxxi5CHYCTuHLus9Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxuk60y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:19:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-824f75919f4so4018723b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 03:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771327154; x=1771931954; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bqnU+1TM5gIEHCVNQzhu+53HuEr/QxKQz4ZoYABsYvo=;
        b=ZKmu9OQsyL6dLsxX9kk1/m8xddw2TJaNU54TDYPq6NX1a0cHW9CgaKcHErRvKzPQDj
         c4DuJOyiHTnLouEynFx5JELVbOJSMPsHvhXzRPuzYqewR3VRT38kbfk401mEWLHXpXYu
         ZJ7REG3eGng3Grlt6qbuIJVdcZ8n1LnLPZqs+gSNpjH/U7K/UZhVaFLAUz5XUIg4hiFT
         6pfnIhSgmIQP6Fc4UsQ/mipXGB4IHBuL2gLiZhRjDsjkkb7UOPwdqad4bbzwv3MNrIua
         9psI33IzAE/qq7xmZuMnK5JG4dn0YeMfgAWDONyRlwYOQ6VVDwqh5rHisl9FA9hjwg0f
         DCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771327154; x=1771931954;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqnU+1TM5gIEHCVNQzhu+53HuEr/QxKQz4ZoYABsYvo=;
        b=iE9eDrBoudeeMwgs5VI7v/XainBvTyp+THBYI6Huj7P/x5HEXnFfqtdv8w8gglxFMQ
         HV9b8AIv34Tv3k64pogZuznMI3x//WNuoue+NgRiLN0FzKqkNZlifJpzvrlapipUKDKe
         vtGVn7UboUT9AsQ7mFfydBbcp0KgoyS4+r3JUQYv4YvKdW0Xk0IhBJ0JbQy96ugj6eMW
         7oLL0o2MLn09yyZzMDds5ELy91KAv44d8ZMgrJAjOg3JJecvyP4jyD2abUXZYjyufOgf
         6w7bBIQK6Zh/lvL/cXSAMhPVpPyPwOu5DGD2ipZ7/D4rQIiC3xbdqnwjkw6s4Jvny3nz
         qRqg==
X-Forwarded-Encrypted: i=1; AJvYcCVs/8aaoLlf9YBMtQiQXVC2wmrVzih1maSqiKkcKsYl+RYqbbKiTlf1GC0ld3WYN0APhCfp5DBXs2FXKVew@vger.kernel.org
X-Gm-Message-State: AOJu0YxehOhHTIieniRA5VnV0dRKNvaqvUr9b2he/BTMci0OLwvyeLBW
	7hJ1KSIXkv7fIsiAFndpMjsOxRmPXdguax0jh6y+CawFY5EaDxujCx1KJ47XYnlBPSx+3h3oQQE
	rM0Tf8NMiaL91KaNR6i9vi9oBil/t8zEcpWoo83qSmsUIhvY62QxQ2HWALNDGEmHIHWDH
X-Gm-Gg: AZuq6aIU3/yyoF2wkSDP1+OEgaN/FXjD1f0ENWzAj+jIA7FK9c0xpYtsL/DpmiKMptT
	EusNpv6KR4JSl6C0VG6LOeTTZfUuZzB3oQp2++E/Grk4giNjthFZq11bXGd1CZA3zK94ekZWdn1
	xR+T05hMH9IVaAAWgxNy7wUEX76K5qcvpEGfbHwBZJqO3Rt8WonElnY2r3u+U80G8+tZWIDPuoH
	cwVP08rR//R68Jo4mFaOfHHIvyJi2SC1ieaIo99h9Y5xQtt3zm85mRKhWMeEzY6qIQr8pJJ5kE4
	fxAMT6cuTZu1sRp9E/XY8Lwesd5gSA2RR7C9knBKftuq7lCNVlaYj0lWEh/6ba2d9fF6TAZDtr/
	woucdElmRkuhkFimik/vGHu2JoUaL3ZYtZSd6SleY9jSdKpBSK+DOi40E
X-Received: by 2002:a05:6a00:2d28:b0:824:374a:13f7 with SMTP id d2e1a72fcca58-824c613370cmr13273021b3a.55.1771327153597;
        Tue, 17 Feb 2026 03:19:13 -0800 (PST)
X-Received: by 2002:a05:6a00:2d28:b0:824:374a:13f7 with SMTP id d2e1a72fcca58-824c613370cmr13272994b3a.55.1771327153092;
        Tue, 17 Feb 2026 03:19:13 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b9a661sm13181914b3a.50.2026.02.17.03.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 03:19:12 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v2 0/5] PCI: qcom: Add D3cold support
Date: Tue, 17 Feb 2026 16:49:05 +0530
Message-Id: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKlOlGkC/zXMTQqDMBCG4avIrBtJxlaSrnqP4kLzUwfU2KQNL
 ZK7NwrdDLzDx7NBtIFshGu1QbCJIvmlBJ4q0GO/PCwjUxqQ40UgKmYa7SfDBqeUQqFaPgxQxmu
 wjj4HdO9KjxRfPnwPN4n9uxMtFyj/RBKMM2OkaxzXVuL55mOsn+9+0n6e63Kgyzn/AAJ8NLijA
 AAA
X-Change-ID: 20251229-d3cold-bf99921960bb
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com, bjorn.andersson@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771327148; l=3572;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=vfy+YzqqKerb02XrtXzWTVN+T8EmD/WiyxKqOvqNYg4=;
 b=Bn9M23h3apUJmIuD/7Q/hILoVU69OPDlI4bmae1vUzWbKDwi1LNRx25XUFJlmFU5bAOo7qBuB
 nrYGrQQ0rmvCcpeuE0uod0BCwRYMWp15bw5jPFucUC+qdJ5YG0olQR9
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: Tncj_UyCGF8QJIvEwQNsDIoGWUnX4q6I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5NCBTYWx0ZWRfX1oFUXa3o2BVN
 mi6yzY6iRuRnXE2Ku94nbVqXkB7i9HNlZSIisVz/YBm6wmUVY9C+woWVKzVgRJ1VNmVpg+mNd3k
 NmVwC1ZEBWL9K/XH5bU1YhvjHbaAlqu3NVqcwaG279z5z6zMcWX+/dAd1wuZQm+nscCoBxN8YCc
 nISHqL9Zq3eH7L3oDlS2bZTn/0Wsy4CS0Io3f8s2q2yOy8jcRiLHcwFwAnI+Nc/bFzU2K8ENOpF
 Nm8aYv43GC/rM/A5QpZfFQADicxaB2XZLYP0onKLrenBAJtB0RkzLeFwmzhX8NYbZ2TeFjWRjzG
 kYNJ6vjPZINpvSH3jsXNHh8UPXDXGNb4FQvfluTT3h8WwiM16nFVDZjN8qJNnnTsXK6nKuKiFzD
 MMPtV1D352wxXDVJdXh+U/EAaBjabktINnIL/dRrPjHkd9ThpF0S76RMmHPPFEGTFNtJa3Lq1WK
 MG6rXqHST/eKksKlIcw==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=69944eb2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e1WyCQ9WWvu24y8kmCgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: Tncj_UyCGF8QJIvEwQNsDIoGWUnX4q6I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170094
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93124-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4827614B40F
X-Rspamd-Action: no action

This series adds support for putting Qualcomm PCIe host bridges into D3cold
when downstream conditions allow it, and introduces a small common helper
to determine D3cold eligibility based on endpoint state.

On Qualcomm platforms, PCIe host controllers are currently kept powered
even when there are no active endpoints (i.e. all endpoints are already in
PCI_D3hot). This prevents the SoC from entering deeper low‑power states
such as CXPC.

While PCIe D3cold support exists in the PCI core, host controller drivers
lack a common mechanism to determine whether it is safe to power off the
host bridge without breaking active devices or wakeup functionality.
As a result, controllers either avoid entering D3cold or depend on rough,
driver‑specific workarounds.

This series addresses that gap.

1. Introduces pci_host_common_can_enter_d3cold(), a helper that determines
   whether a host bridge may enter D3cold based on downstream PCIe endpoint
   state. The helper permits D3cold only when all *active* endpoints are
   already in PCI_D3hot, and any wakeup‑enabled endpoint supports PME
   from D3cold.

2. Updates the Designware PCIe host driver to use this helper in the
   suspend_noirq() path, replacing the existing heuristic that blocked
   D3cold whenever L1 ASPM was enabled.

3. Enables D3cold support for Qualcomm PCIe controllers by wiring them into
   the DesignWare common suspend/resume flow and explicitly powering down
   controller resources when all endpoints are in D3hot.

The immediate outcome of this series is that Qualcomm PCIe host bridges can
enter D3cold when all endpoints are in D3hot.

This is a necessary but not sufficient step toward unblocking CXPC. With
this series applied, CXPC can be achieved on systems with no attached NVMe
devices. Support for NVMe‑attached systems requires additional changes
in NVMe driver, which are being worked on separately.

Tested on:
  - Qualcomm Lemans EVK, Monaco & sc7280 platforms.

Validation steps:
  - Boot without NVMe attach:
      * PCIe host enters D3cold during suspend
      * SoC is able to reach CXPC provided other drivers also remove
	their votes as part of suspend.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v2:
- Updated the cover letter (Bjorn Andersson)
- Add get_ltssm helper function to read LTSSM state from parf.
- Allow D3cold if there is no driver enabled for a endpoint.
- Added a seperate patch to make phy down in deinit part to avoid power
  leakage.
- Revert icc bw voting if resume fails(Bjorn Andersson).
- Link to v1: https://lore.kernel.org/r/20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com

---
Krishna Chaitanya Chundru (5):
      PCI: host-common: Add helper to determine host bridge D3cold eligibility
      PCI: dwc: Use common D3cold eligibility helper in suspend path
      PCI: qcom: Add .get_ltssm() helper
      PCI: qcom: Power down PHY via PARF_PHY_CTRL before disabling rails/clocks
      PCI: qcom: Add D3cold support

 drivers/pci/controller/dwc/pcie-designware-host.c |   9 +-
 drivers/pci/controller/dwc/pcie-qcom.c            | 162 +++++++++++++++-------
 drivers/pci/controller/pci-host-common.c          |  45 ++++++
 drivers/pci/controller/pci-host-common.h          |   2 +
 4 files changed, 162 insertions(+), 56 deletions(-)
---
base-commit: 9702969978695d9a699a1f34771580cdbb153b33
change-id: 20251229-d3cold-bf99921960bb

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


